import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import "key_constants.js" as UI

AbstractButton {
    id: toolbarButton
    
    anchors{
		top: parent.top
		bottom: parent.bottom
	}
	width: units.gu(8)
    
    action: modelData
    style: Rectangle {
        color: theme.palette.normal.background //UbuntuColors.silk//action.color ? action.color : theme.palette.normal.overlay

        Connections{
            target: toolbarButton
            onPressedChanged:{
                if(target.pressed){
                    color = theme.palette.highlighted.background //UbuntuColors.ash//theme.palette.highlighted.foreground
                }else{
                    color = theme.palette.normal.background //UbuntuColors.silk//action.color ? action.color : theme.palette.normal.overlay
                }
            }
        }

        Behavior on color {
            ColorAnimation{
                easing: UbuntuAnimation.StandardEasing
                duration: UbuntuAnimation.BriskDuration
            }
        }
    }

    RowLayout {
        id: buttonsRow

        spacing: units.gu(0.5)
        anchors.fill: parent
        
        Icon {
            id: icon

            name: action.iconName
            Layout.preferredWidth: label.text ? units.gu(2) : units.gu(3)
            Layout.preferredHeight: Layout.preferredWidth
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            visible: action.iconName
            color: theme.palette.normal.overlayText
        }
        Label {
			id: label
			Layout.fillWidth: true
			Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
			font.pixelSize: units.dp(fullScreenItem.tablet ? UI.tabletWordRibbonFontSize : UI.phoneWordRibbonFontSize)
			font.family: UI.fontFamily
			font.weight: Font.Normal
			text: action.text;
			elide: Text.ElideRight
		}
    }
}



