import QtQuick 2.4
import Ubuntu.Components 1.3

AbstractButton {
    id: advancedActionKey
    
    //~ z: 1
	opacity: 0.5

    style: Rectangle {
        color: UbuntuColors.silk//action.color ? action.color : theme.palette.normal.overlay
        radius: units.gu(0.5)

        Connections{
            target: advancedActionKey
            onPressedChanged:{
                if(target.pressed){
                    color = UbuntuColors.ash//theme.palette.highlighted.foreground
                }else{
                    color = UbuntuColors.silk//action.color ? action.color : theme.palette.normal.overlay
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

    Row {
        id: buttonsRow

        spacing: units.gu(0.5)
        anchors {
            centerIn: parent
        }

        Icon {
            id: icon

            name: action.iconName
            width: label.text ? units.gu(2) : units.gu(3)
            height: width
            visible: action.iconName
            color: theme.palette.normal.overlayText
        }

        Label {
            id: label

            text: action.text
            renderType: Text.QtRendering
            font.weight: Font.Normal
            color: theme.palette.normal.overlayText
        }
    }
}
