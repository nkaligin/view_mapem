# -*- coding: utf-8 -*-
"""
/***************************************************************************
 ViewMapem
                                 A QGIS plugin
 View Mapem
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2019-12-18
        git sha              : $Format:%H$
        copyright            : (C) 2019 by Nikolay N. Kaligin
        email                : nkaligin@yandex.ru
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""
from qgis.PyQt.QtCore import QSettings, QTranslator, QCoreApplication,QVariant
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction,QFileDialog,QMessageBox

# Initialize Qt resources from file resources.py
from .resources import *

from qgis.core import QgsProject,QgsVectorLayer,QgsField,QgsRasterLayer,QgsLayerTreeLayer,QgsCoordinateReferenceSystem, QgsVectorFileWriter
from qgis.utils import iface

# Import the code for the dialog
from .view_mapem_dialog import ViewMapemDialog
import os.path

import tempfile
from datetime import datetime

try:
    import asn1tools
except:
    import subprocess
    subprocess.check_call(['pip3', 'install','asn1tools'])
    import asn1tools

try:
    from bitstring import BitArray
except:
    import subprocess
    subprocess.check_call(['pip3', 'install','bitstring'])
    from bitstring import BitArray

from .geomapen import get_geojson_from_complete_uper

class ViewMapem:
    """QGIS Plugin Implementation."""

    def __init__(self, iface):
        """Constructor.

        :param iface: An interface instance that will be passed to this class
            which provides the hook by which you can manipulate the QGIS
            application at run time.
        :type iface: QgsInterface
        """
        # Save reference to the QGIS interface
        self.iface = iface
        # initialize plugin directory
        self.plugin_dir = os.path.dirname(__file__)
        # initialize locale
        locale = QSettings().value('locale/userLocale')[0:2]
        locale_path = os.path.join(
            self.plugin_dir,
            'i18n',
            'ViewMapem_{}.qm'.format(locale))

        if os.path.exists(locale_path):
            self.translator = QTranslator()
            self.translator.load(locale_path)
            QCoreApplication.installTranslator(self.translator)

        # Declare instance attributes
        self.actions = []
        self.menu = self.tr(u'&View Mapem')

        # Check if plugin was started the first time in current QGIS session
        # Must be set in initGui() to survive plugin reloads
        self.first_start = None

    # noinspection PyMethodMayBeStatic
    def tr(self, message):
        """Get the translation for a string using Qt translation API.

        We implement this ourselves since we do not inherit QObject.

        :param message: String for translation.
        :type message: str, QString

        :returns: Translated version of message.
        :rtype: QString
        """
        # noinspection PyTypeChecker,PyArgumentList,PyCallByClass
        return QCoreApplication.translate('ViewMapem', message)


    def add_action(
        self,
        icon_path,
        text,
        callback,
        enabled_flag=True,
        add_to_menu=True,
        add_to_toolbar=True,
        status_tip=None,
        whats_this=None,
        parent=None):
        """Add a toolbar icon to the toolbar.

        :param icon_path: Path to the icon for this action. Can be a resource
            path (e.g. ':/plugins/foo/bar.png') or a normal file system path.
        :type icon_path: str

        :param text: Text that should be shown in menu items for this action.
        :type text: str

        :param callback: Function to be called when the action is triggered.
        :type callback: function

        :param enabled_flag: A flag indicating if the action should be enabled
            by default. Defaults to True.
        :type enabled_flag: bool

        :param add_to_menu: Flag indicating whether the action should also
            be added to the menu. Defaults to True.
        :type add_to_menu: bool

        :param add_to_toolbar: Flag indicating whether the action should also
            be added to the toolbar. Defaults to True.
        :type add_to_toolbar: bool

        :param status_tip: Optional text to show in a popup when mouse pointer
            hovers over the action.
        :type status_tip: str

        :param parent: Parent widget for the new action. Defaults None.
        :type parent: QWidget

        :param whats_this: Optional text to show in the status bar when the
            mouse pointer hovers over the action.

        :returns: The action that was created. Note that the action is also
            added to self.actions list.
        :rtype: QAction
        """

        icon = QIcon(icon_path)
        action = QAction(icon, text, parent)
        action.triggered.connect(callback)
        action.setEnabled(enabled_flag)

        if status_tip is not None:
            action.setStatusTip(status_tip)

        if whats_this is not None:
            action.setWhatsThis(whats_this)

        if add_to_toolbar:
            # Adds plugin icon to Plugins toolbar
            self.iface.addToolBarIcon(action)

        if add_to_menu:
            self.iface.addPluginToMenu(
                self.menu,
                action)

        self.actions.append(action)

        return action

    def initGui(self):
        """Create the menu entries and toolbar icons inside the QGIS GUI."""

        icon_path = ':/plugins/view_mapem/icon.png'
        self.add_action(
            icon_path,
            text=self.tr(u'View MAPEM'),
            callback=self.run,
            parent=self.iface.mainWindow())

        # will be set False in run()
        self.first_start = True


    def unload(self):
        """Removes the plugin menu item and icon from QGIS GUI."""
        for action in self.actions:
            self.iface.removePluginMenu(
                self.tr(u'&View Mapem'),
                action)
            self.iface.removeToolBarIcon(action)


    def run(self):
        def filePath(title):
            qfd = QFileDialog()
            path = ""
            filter = "uper(*.uper)"
            f = QFileDialog.getOpenFileName(qfd, title, path, filter)
            return f

        fpath = filePath("Select *.uper")
        
        if fpath[0] != "":    
            with tempfile.TemporaryDirectory() as tmpdirname:
                #print('created temporary directory', tmpdirname)
                get_geojson_from_complete_uper(tmpdirname, fpath[0], os.path.join(os.path.dirname(__file__), 'mapem_spatem.asn'))

                layer = QgsProject.instance().layerTreeRoot()

                def addGroupIfNotExist(name,group):
                    mapem_group = None
                    for i in group.children():
                        if i.name() == name:
                            mapem_group = i
                            break                    
                    if mapem_group == None:
                        # create layer 
                        group.addGroup(name)
                        for i in group.children():
                            if i.name() == name:
                                mapem_group = i
                                break
                    return mapem_group

                #mapem_group = addGroupIfNotExist("MAPEM",layer)                
                mapem_group = addGroupIfNotExist(os.path.basename(fpath[0]).split('.')[0] + ".uper",layer)                
                intersections = addGroupIfNotExist("intersections",mapem_group)                
                roadSegments = addGroupIfNotExist("roadSegments",mapem_group)                            

                def addFileJsonInLayer(filename,group,name):

                    #listLayers=QgsProject.instance().mapLayersByName(name)
                    listLayers=group.children()
         
                    to_delete = []
                    for i in listLayers:
                        #print(i.name(), i.layer().id())
                        if i.name() == name:
                            to_delete.append(i.layer().id())
                        

                    QgsProject.instance().removeMapLayers(to_delete)

                    vl = QgsVectorLayer(filename,name)

                    crs = QgsCoordinateReferenceSystem(3857, QgsCoordinateReferenceSystem.PostgisCrsId)   

                    nameShape_folder = os.path.dirname(QgsProject.instance().fileName())
                    nameShape_filename = os.path.basename(filename).split(".")[0] + ".shp"
                    nameShape = os.path.join(nameShape_folder, nameShape_filename)


                    QgsVectorFileWriter.writeAsVectorFormat(vl, nameShape , "utf-8", crs,"ESRI Shapefile", onlySelected=False)
                    vl = QgsVectorLayer( nameShape,name)
                    QgsProject.instance().addMapLayer(vl, False)
                    group.addLayer(vl)
                    return vl

                for path, subdirs, files in os.walk(tmpdirname + "intersections"):
                    for name in files:
                        f = os.path.join(path, name)
                        g = addGroupIfNotExist(name.split("-")[0],intersections)
                        layer = addFileJsonInLayer(f,g,name.split(".")[0])
                        if "connectsTo" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/intersections/connectsTo.qml')
                            layer.triggerRepaint()
                        if "GenericLane" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/intersections/GenericLane.qml')
                            layer.triggerRepaint()
                        if "nodeList" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/intersections/nodeList.qml')
                            layer.triggerRepaint()
                        if "refPoint" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/intersections/refPoint.qml')
                            layer.triggerRepaint()


                for path, subdirs, files in os.walk(tmpdirname + "roadSegments"):
                    for name in files:
                        f = os.path.join(path, name)
                        g = addGroupIfNotExist(name.split("-")[0],roadSegments)
                        layer = addFileJsonInLayer(f,g,name.split(".")[0])
                        if "connectsTo" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/roadSegments/connectsTo.qml')
                            layer.triggerRepaint()
                        if "GenericLane" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/roadSegments/GenericLane.qml')
                            layer.triggerRepaint()
                        if "nodeList" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/roadSegments/nodeList.qml')
                            layer.triggerRepaint()
                        if "refPoint" in layer.name():
                            layer.loadNamedStyle(':/plugins/view_mapem/styles/roadSegments/refPoint.qml')
                            layer.triggerRepaint()


                # Settign the CRS of the data set option 1
                canvas = self.iface.mapCanvas()
                selectedcrs = "EPSG:3857"
                target_crs = QgsCoordinateReferenceSystem()
                target_crs.createFromUserInput(selectedcrs)
                canvas.setDestinationCrs(target_crs)


                outputinfo = "Импортирование завершено."

                Q = QMessageBox(self.iface.mainWindow())
                Q = QMessageBox.information(Q, 'Import from MAPEM', outputinfo, QMessageBox.Ok)