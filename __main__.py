# Kalaupapa
# Created by marquiskurt
# robot-octodollop-fork (C) 2018 MechaMonarchs Team.
# Licensed under Apache 2.0 License
#
# The next-generation tool for configuring Akinom robots
#
# Note: This is intended as a replacement for the existing
# Akinom Configurator and Akinom Deployer solutions provided
# when initially creating Akinom.
#
# This eventual replacement will not affect the iOS versions
# of the software and should not be seen as such.
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject
import sys
from monikaqrc import *


class MonikaConfig(QObject):
    def __init__(self):
        QObject.__init__(self)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    monika = MonikaConfig()
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty('monika', monika)
    engine.load('mainUI.qml')

    engine.quit.connect(app.quit)

    sys.exit(app.exec_())
