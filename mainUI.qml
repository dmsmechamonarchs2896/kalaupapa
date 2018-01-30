import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0

ApplicationWindow {
    id: appWindow
    width: 640
    height: 480
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    property string appName: "Monika 2"
    property string codeName: "Kalaupapa"
    title: appName

    Material.theme: Material.Light
    Material.accent: Material.Green

    TabBar {
        id: tabBar
        y: 0
        height: 48
        currentIndex: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        Material.background: Material.DeepOrange
        Material.accent: Material.Amber

        TabButton {
            id: mainTab
            text: qsTr("My Robot")
        }

        TabButton {
            id: gameTab
            text: qsTr("Competition")
        }

        TabButton {
            id: debuggingTab
            text: qsTr("Debugging")
        }

        TabButton {
            id: alliancesTab
            text: qsTr("Scouting")
        }

        TabButton {
            id: preferencesTab
            text: qsTr("Preferences")
        }
    }

    StackLayout {
        id: viewArea
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.top: tabBar.bottom
        anchors.topMargin: 4
        currentIndex: tabBar.currentIndex

        Item {
            id: mainTabPanel

            Column {
                id: column
                width: parent.width / 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 16
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.top: parent.top
                anchors.topMargin: 16

                Pane {
                    id: pane
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 0

                    Label {
                        id: label
                        text: qsTr("My Team")
                        font.pointSize: 28
                    }

                    TextField {
                        id: textField
                        text: qsTr("")
                        placeholderText: "Team Name"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.topMargin: 8
                        anchors.top: label.bottom
                    }

                    TextField {
                        id: textField1
                        x: 0
                        height: 40
                        text: qsTr("")
                        placeholderText: "Team Number"
                        anchors.top: textField.bottom
                        anchors.topMargin: 8
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                    }

                    TextField {
                        id: textField2
                        text: qsTr("")
                        placeholderText: "Location"
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.topMargin: 8
                        anchors.top: textField1.bottom
                    }

                    Label {
                        id: teamLabel
                        anchors.topMargin: 32
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 32
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: textField2.bottom
                        text: qsTr("This information is not shared to anyone or is analyzed by the app developers. This is merely for source code reference and copyrighting abilities.")
                        font.pointSize: 14
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }
                }
            }

            Column {
                id: column1
                width: parent.width*2 / 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 16
                anchors.top: parent.top
                anchors.topMargin: 16
                anchors.left: column.right

                Pane {
                    id: pane1
                    width: parent.width
                    height: parent.height

                    Label {
                        id: label1
                        text: qsTr("Our Robot")
                        font.pointSize: 28
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }

                    TextField {
                        id: robotName
                        text: qsTr("Just Monika")
                        placeholderText: "Robot Name"
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                        anchors.right: parent.right
                        anchors.rightMargin: 16
                        anchors.topMargin: 8
                        anchors.top: label1.bottom
                    }

                    SwitchDelegate {
                        id: useAkinomConfig
                        anchors.topMargin: 8
                        anchors.top: robotName.bottom
                        text: "Use Akinom Configuration"
                        checked: true

                        onClicked:
                        {
                            if (useDriverConfig.checked == false && useAkinomConfig.checked == false) {
                                useDriverConfig.checked = true;
                            }

                            else {
                                useDriverConfig.checked = false;
                            }
                        }

                        ToolTip.visible: hovered
                        ToolTip.delay: 1000
                        ToolTip.text: qsTr("Use the Akinom variable system in the Competition tab to set the position.")
                    }

                    SwitchDelegate {
                        id: useDriverConfig
                        anchors.topMargin: 8
                        anchors.top: useAkinomConfig.bottom
                        text: "Use Driver Station"
                        checked: false

                        onClicked:
                        {
                            if (useDriverConfig.checked == false && useAkinomConfig.checked == false) {
                                useAkinomConfig.checked = true;
                            } else {
                                useAkinomConfig.checked = false;
                            }

                        }

                        ToolTip.visible: hovered
                        ToolTip.delay: 3000
                        ToolTip.text: qsTr("Use the Driver Station to set the position.")
                    }

                    Label {
                        id: debugLabel
                        anchors.topMargin: 32
                        anchors.leftMargin: 16
                        anchors.left: parent.left
                        anchors.top: useDriverConfig.bottom
                        text: qsTr("To manage debugging settings, go to the Debugging tab.")
                        font.pointSize: 14
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }

                    Button {
                        id: deployRobotButton
                        anchors.topMargin: 16
                        anchors.leftMargin: 16
                        anchors.left: parent.left
                        anchors.top: debugLabel.bottom
                        text: "Deploy"

                        ToolTip.visible: hovered
                        ToolTip.delay: 3000
                        ToolTip.text: qsTr("Save the configuration and deploy to the roboRIO.")
                    }

                    Button {
                        id: saveConfigButton
                        anchors.leftMargin: deployRobotButton.width + 16
                        anchors.topMargin: 16
                        anchors.left: deployRobotButton.left
                        anchors.top: debugLabel.bottom
                        text: "Save Config"

                        ToolTip.visible: hovered
                        ToolTip.delay: 1000
                        ToolTip.text: qsTr("Save the configuration without deploying.")
                    }

                    Button {
                        id: loadConfigButton
                        anchors.leftMargin: saveConfigButton.width + 16
                        anchors.topMargin: 16
                        anchors.left: saveConfigButton.left
                        anchors.top: debugLabel.bottom
                        text: "Load from Disk"

                        ToolTip.visible: hovered
                        ToolTip.delay: 1000
                        ToolTip.text: qsTr("Load an existing robot configuration.")
                    }
                }
            }
        }

        Item {
            id: gameTabPanel

            Column {
                id: basicInfoColumn
                width: parent.width / 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 16
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.top: parent.top
                anchors.topMargin: 16

                Pane {
                    id: basicInfoPane
                    width: parent.width
                    height: parent.height

                    Label {
                        id: competitionLabel
                        text: qsTr("This Competition")
                        font.pointSize: 28
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }

                    TextField {
                        id: competitionYear
                        text: qsTr("2018")
                        placeholderText: "Year"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 16
                        anchors.topMargin: 8
                        anchors.top: competitionLabel.bottom
                    }

                    TextField {
                        id: gameName
                        text: qsTr("Power Up!")
                        placeholderText: "Game Name"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.right: parent.right
                        anchors.rightMargin: 16
                        anchors.topMargin: 8
                        anchors.top: competitionYear.bottom
                    }

                    Label {
                        id: gameDataNotice
                        anchors.topMargin: 32
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 32
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: gameName.bottom
                        text: qsTr("Game data provided by The Blue Alliance (http://www.thebluealliance.com).")
                        font.pointSize: 14
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }
                }
            }

        }

        Item {
            id: debuggingPanel

            Column {
                id: debuggingSettingsColumn
                width: parent.width / 3
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 16
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.top: parent.top
                anchors.topMargin: 16

                Pane {
                    id: debuggingSettingsPane
                    width: parent.width
                    height: parent.height

                    Label {
                        id: settingsHeader
                        text: qsTr("Debug")
                        font.pointSize: 28
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }

                    SwitchDelegate {
                        id: enableDebugging
                        anchors.topMargin: 8
                        anchors.top: settingsHeader.bottom
                        text: "Enable debugging"
                        checked: false
                        Material.accent: Material.Purple

                        onClicked:
                        {
                            if (enableDebugging.checked == true) {
                                appWindow.Material.theme = Material.Dark;
                                themeSetter.checked = true;
                                themeSetter.enabled = false;
                                themeNotice.text = qsTr("Debugging mode has overwritten this setting. Disable debug mode to dark mode.")
                            } else {
                                appWindow.Material.theme = Material.Light;
                                themeSetter.checked = false;
                                themeSetter.enabled = true;
                                themeNotice.text = qsTr("");
                            }

                        }
                    }
                }
            }
        }

        Item {
            id: scoutingPanel
        }

        Item {
            id: preferencesPanel

            Column {
                id: preferencesColumn
                width: parent.width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 16
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.top: parent.top
                anchors.topMargin: 16

                Pane {
                    id: preferencesPane
                    width: parent.width
                    height: parent.height

                    Label {
                        id: preferencesName
                        text: qsTr("Preferences")
                        font.pointSize: 28
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }

                    SwitchDelegate {
                        id: themeSetter
                        anchors.topMargin: 8
                        anchors.top: preferencesName.bottom
                        text: "Dark Mode"
                        checked: false

                        Material.accent: Material.Amber

                        onClicked:
                        {
                            if (themeSetter.checked == true) {
                                appWindow.Material.theme = Material.Dark;
                            } else {
                                appWindow.Material.theme = Material.Light;
                            }

                        }
                    }

                    Label {
                        id: themeNotice
                        anchors.topMargin: 8
                        anchors.leftMargin: 16
                        anchors.bottomMargin: 8
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.top: themeSetter.bottom
                        text: qsTr("")
                        font.pointSize: 12
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    }
                }
            }
        }

    }
}
