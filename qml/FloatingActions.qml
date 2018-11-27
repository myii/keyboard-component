import QtQuick 2.4
import "keys/"
import "keys/key_constants.js" as UI
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3

RowLayout{
	anchors{
		top: parent.top
		left: parent.left
		right: parent.right
		margins: units.gu(1)
		topMargin: toolbar.height + units.gu(1)
	}
	
	AdvancedActionKey{
		id: homeButton
		
		Layout.alignment: Qt.AlignLeft
	    Layout.preferredWidth: units.gu(5)
	    Layout.preferredHeight: units.gu(5)
	    action: Action {
	            iconName: "go-first"
	            onTriggered: {
		            if(fullScreenItem.selectionMode){
						toolbar.runCommand("SelectStartOfLine");
					}else{
						toolbar.runCommand("MoveToStartOfLine");
					}
				}
	        }
	}
	
	AdvancedActionKey{
		id: backButton
		
		Layout.alignment: Qt.AlignHCenter
	    Layout.preferredWidth: units.gu(20)
	    Layout.preferredHeight: units.gu(5)
	    action: Action {
				text: i18n.tr("Back")
	            iconName: "back"
	            onTriggered: {
					if(fullScreenItem.selectionMode){
						exitSelectionMode()
					}else{
						exitSwipeMode()
					}
				}
	        }
	}
		
		
		
	AdvancedActionKey{
		id: endButton
		
		Layout.alignment: Qt.AlignRight
	    Layout.preferredWidth: units.gu(5)
	    Layout.preferredHeight: units.gu(5)
	    action: Action {
	            iconName: "go-last"
	            onTriggered: {
					if(fullScreenItem.selectionMode){
						toolbar.runCommand("SelectEndOfLine");
					}else{
						toolbar.runCommand("MoveToEndOfLine");
					}
				}
	        }
	}
}
