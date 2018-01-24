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

    Material.theme: Material.Dark
    Material.accent: Material.Teal

    TabBar {
        id: tabBar
        y: 0
        height: 52
        currentIndex: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

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
        anchors.top: parent.top
        anchors.topMargin: 52
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

                    SwitchDelegate {
                        id: useAkinomConfig
                        anchors.topMargin: 8
                        anchors.top: label1.bottom
                        text: "Use Akinom Configuration"
                        checked: true

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

                        ToolTip.visible: hovered
                        ToolTip.delay: 1000
                        ToolTip.text: qsTr("Use the Akinom variable system in the Competition tab to set the position.")
                    }
                }
            }
        }

        Item {
            id: gameTabPanel
        }

    }
}
