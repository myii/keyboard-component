import QtQuick 2.4
import Ubuntu.Components 1.3
import "keys/"
import "keys/key_constants.js" as UI

//~ import QtQuick.Controls 2.2

Toolbar {
	id: advancedToolbar
	
	anchors {
		left: parent.left
		right: parent.right
	}
	
	//~ ToolTip {
		//~ id: tooltip
        
        //~ visible: false
        //~ text: i18n.tr("Copied")
        //~ timeout: 2000
    //~ }
	
	states: [
		State {
			name: "wordribbon"
	
			AnchorChanges {
				target: advancedToolbar
				anchors.top: undefined
				anchors.bottom: keyboardComp.top
			}
		},
		State {
			name: "top"
	
			AnchorChanges {
				target: advancedToolbar
				anchors.top: parent.top
				anchors.bottom: undefined
			}
		}
	]
	
	function runCommand(command){
		event_handler.onKeyReleased(command, "command")
		fullScreenItem.timerSwipe.restart()
	}
	
	// Disable clicking at the bottom
	MouseArea{
		anchors.fill: parent
		z: -1
	}
	
	//~ theme.name: "Ubuntu.Components.Themes.SuruDark" 
	trailingActionBar.delegate: AdvancedToolbarButton{
	}
	trailingActionBar.actions: [
		Action { text: i18n.tr("Paste"); iconName: "edit-paste"; onTriggered: advancedToolbar.runCommand("Paste"); },
		Action { text: i18n.tr("Copy"); iconName: "edit-copy"; enabled: input_method.hasSelection; onTriggered: {advancedToolbar.runCommand("Copy"); fullScreenItem.sendLeftKey();} },
		Action { text: i18n.tr("Cut"); iconName: "edit-cut"; enabled: input_method.hasSelection; onTriggered: advancedToolbar.runCommand("Cut"); }
	]
	leadingActionBar.numberOfSlots: 4
	leadingActionBar.actions: [		
		Action { text: i18n.tr("Select All"); iconName: "edit-select-all"; onTriggered: advancedToolbar.runCommand("SelectAll"); },
		Action { text: i18n.tr("Redo"); iconName: "redo"; onTriggered: advancedToolbar.runCommand("Redo");},
		Action { text: i18n.tr("Undo"); iconName: "undo"; onTriggered: advancedToolbar.runCommand("Undo");},
		Action { text: i18n.tr("Insert Tab"); iconName: "keyboard-tab"; onTriggered: advancedToolbar.runCommand("tab"/*String.fromCharCode(9)*/);}
	]
}
