import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Universal 2.0

ApplicationWindow {
    id: appWindow
    width: 640
    height: 480
    maximumHeight: 480
    maximumWidth: 640
    minimumHeight: 480
    minimumWidth: 640
    visible: true
    property string appName: "Monika 2"
    property string codeName: 'Kalaupapa'
    title: codeName

    Universal.theme: Universal.Light
    Universal.accent: Universal.Green

    TabBar {
        id: bar
        y: 0
        height: 52
        currentIndex: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Universal.background: Universal.Amber
        Universal.foreground: '#000'

        TabButton {
            id: robotPropertiesTab
            text: qsTr("Main")
        }

        TabButton {
            id: gamePropertiesTab
            text: qsTr("Competition")
        }

        TabButton {
            id: debuggingTab
            text: qsTr("Third Eye")
        }
    }

    StackLayout {
        id: stackView
        x: 0
        y: 53
        width: parent
        height: 427
        currentIndex: bar.currentIndex

        Item {
            id: robotProperties
            width: parent
            height: 427

            RowLayout {
                id: rowLayout
                x: 0
                y: 0
                width: parent
                height: 427
                spacing: 1

                Row {
                    id: row
                    width: 320
                    height: 400
                    transformOrigin: Item.Center

                    Image {
                        id: image
                        width: 320
                        height: 320
                        fillMode: Image.PreserveAspectCrop
                        source: "../images/icon.png"
                    }
                }

                Row {
                    id: row1
                    width: parent
                    height: 400

                    Column {
                        id: column
                        width: parent
                        height: 427
                        spacing: 16


                        Column {
                            id: column4
                            width: 200
                            spacing: 16

                            Label {
                                id: text1
                                width: parent
                                text: qsTr("My Robot")
                                font.pixelSize: 32
                            }

                            TextField {
                                id: teamNumber
                                width: 300
                                height: 40
                                text: qsTr("")
                                placeholderText: "Team Number"
                            }

                            TextField {
                                id: teamName
                                width: 300
                                height: 40
                                text: qsTr("")
                                placeholderText: "Team Name"
                            }


                        }
                        Column {
                            id: deployRobotPanel
                            width: parent
                            height: Layout.fillHeight
                            spacing: 16
                            anchors.top: column4.bottom
                            anchors.topMargin: 16

                            Label {
                                id: deployRobotLabel
                                text: qsTr("Deploy Robot")
                                font.pixelSize: 24
                            }

                            RadioButton {
                                id: enableDebugging
                                text: qsTr("Third Eye (Debug)")
                                anchors.top: parent.top
                                anchors.topMargin: 32
                            }

                            RadioButton {
                                id: enableRelease
                                text: qsTr("Release")
                                anchors.top: enableDebugging.bottom
                                anchors.topMargin: 4
                            }

                            CheckBox {
                                id: enableDriverStation
                                text: qsTr("Use FRC Driver Station")
                                anchors.top: enableRelease.bottom
                                anchors.topMargin: 16
                                checked: true

                                ToolTip.visible: hovered
                                ToolTip.delay: 1000
                                ToolTip.text: qsTr("Use FRC Driver Station instead of the configuration values in your Akinom configuration.")
                            }

                            Button {
                                id: deployRobot
                                x: 100
                                height: 39
                                text: qsTr("Deploy")
                                anchors.top: enableDriverStation.bottom
                                anchors.topMargin: 16
                                focusPolicy: Qt.NoFocus
                            }

                        }
                    }

                }
            }
        }

        Item {
            id: gameProperties
            width: parent
            height: 427

            RowLayout {
                id: rowLayout1
                x: 0
                y: 0
                width: 640
                height: 427

                Row {
                    id: row2
                    width: 200
                    height: 400

                    Column {
                        id: column1
                        width: 200
                        height: 400
                        anchors.top: parent.top
                        anchors.topMargin: 0

                        Label {
                            id: text3
                            x: 16
                            text: qsTr("Matches")
                            font.pixelSize: 24
                        }

                        RadioButton {
                            id: radioButton
                            x: 16
                            text: qsTr("Practice")
                        }

                        RadioButton {
                            id: radioButton1
                            x: 16
                            text: qsTr("Qualitication")
                        }

                        RadioButton {
                            id: radioButton2
                            x: 16
                            text: qsTr("Competitive")

                            ToolTip.visible: hovered
                            ToolTip.delay: 1000
                            ToolTip.text: qsTr("Includes quarterfinal, semifinal, and final.")
                        }
                    }

                }

                Row {
                    id: row3
                    width: 200
                    height: 400

                    Column {
                        id: column2
                        width: 200
                        height: 400
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        transformOrigin: Item.Center

                        Label {
                            id: text4
                            x: 16
                            text: qsTr("Alliances")
                            font.pixelSize: 24
                        }

                        RadioButton {
                            id: radioButton3
                            x: 16
                            text: qsTr("Red")
                        }

                        RadioButton {
                            id: radioButton4
                            x: 16
                            text: qsTr("Blue")
                        }
                    }
                }

                Row {
                    id: row4
                    width: 200
                    height: 400

                    Column {
                        id: column3
                        width: 200
                        height: 400
                        anchors.top: parent.top
                        anchors.topMargin: 0
                    }
                }
            }
        }

        Item {
            id: debuggingProperties
            width: 640
            height: 427
        }

    }
}
