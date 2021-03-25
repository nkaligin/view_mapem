<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" simplifyDrawingTol="1" version="3.4.10-Madeira" minScale="1e+08" simplifyAlgorithm="0" maxScale="0" simplifyMaxScale="1" readOnly="0" simplifyLocal="1" hasScaleBasedVisibilityFlag="0" simplifyDrawingHints="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="singleSymbol" forceraster="0" symbollevels="0" enableorderby="0">
    <symbols>
      <symbol alpha="1" type="line" force_rhr="0" name="0" clip_to_extent="1">
        <layer pass="0" class="ArrowLine" enabled="1" locked="0">
          <prop v="1" k="arrow_start_width"/>
          <prop v="MapUnit" k="arrow_start_width_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="arrow_start_width_unit_scale"/>
          <prop v="0" k="arrow_type"/>
          <prop v="0" k="arrow_width"/>
          <prop v="MapUnit" k="arrow_width_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="arrow_width_unit_scale"/>
          <prop v="5.5" k="head_length"/>
          <prop v="MapUnit" k="head_length_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="head_length_unit_scale"/>
          <prop v="0.5" k="head_thickness"/>
          <prop v="MapUnit" k="head_thickness_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="head_thickness_unit_scale"/>
          <prop v="0" k="head_type"/>
          <prop v="1" k="is_curved"/>
          <prop v="1" k="is_repeated"/>
          <prop v="0" k="offset"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_unit_scale"/>
          <prop v="0" k="ring_filter"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" type="fill" force_rhr="0" name="@0@0" clip_to_extent="1">
            <layer pass="0" class="SimpleFill" enabled="1" locked="0">
              <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
              <prop v="141,255,0,255" k="color"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="141,255,0,255" k="outline_color"/>
              <prop v="solid" k="outline_style"/>
              <prop v="0.16" k="outline_width"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="solid" k="style"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="refID"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory backgroundAlpha="255" width="15" rotationOffset="270" backgroundColor="#ffffff" penColor="#000000" scaleDependency="Area" opacity="1" enabled="0" penWidth="0" minScaleDenominator="0" lineSizeType="MM" sizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" sizeType="MM" height="15" lineSizeScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" barWidth="5" minimumSize="0" penAlpha="255" maxScaleDenominator="1e+08" scaleBasedVisibility="0">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" obstacle="0" showAll="1" dist="0" placement="2" linePlacementFlags="18" priority="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="refID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="signalGrp">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="laneOutID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="laneInID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="maneuver">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="remIntID">
      <editWidget type="">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="refID" name=""/>
    <alias index="1" field="signalGrp" name=""/>
    <alias index="2" field="laneOutID" name=""/>
    <alias index="3" field="laneInID" name=""/>
    <alias index="4" field="maneuver" name=""/>
    <alias index="5" field="remIntID" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="refID" expression="" applyOnUpdate="0"/>
    <default field="signalGrp" expression="" applyOnUpdate="0"/>
    <default field="laneOutID" expression="" applyOnUpdate="0"/>
    <default field="laneInID" expression="" applyOnUpdate="0"/>
    <default field="maneuver" expression="" applyOnUpdate="0"/>
    <default field="remIntID" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" field="refID" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="signalGrp" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="laneOutID" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="laneInID" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="maneuver" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="remIntID" notnull_strength="0" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="refID" exp=""/>
    <constraint desc="" field="signalGrp" exp=""/>
    <constraint desc="" field="laneOutID" exp=""/>
    <constraint desc="" field="laneInID" exp=""/>
    <constraint desc="" field="maneuver" exp=""/>
    <constraint desc="" field="remIntID" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;laneOutID&quot;" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" type="field" width="-1" name="refID"/>
      <column hidden="0" type="field" width="-1" name="signalGrp"/>
      <column hidden="0" type="field" width="-1" name="laneOutID"/>
      <column hidden="0" type="field" width="-1" name="laneInID"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" width="357" name="maneuver"/>
      <column hidden="0" type="field" width="-1" name="remIntID"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="laneInID" editable="1"/>
    <field name="laneOutID" editable="1"/>
    <field name="maneuver" editable="1"/>
    <field name="refID" editable="1"/>
    <field name="signalGrp" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="laneInID" labelOnTop="0"/>
    <field name="laneOutID" labelOnTop="0"/>
    <field name="maneuver" labelOnTop="0"/>
    <field name="refID" labelOnTop="0"/>
    <field name="signalGrp" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>refID</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
