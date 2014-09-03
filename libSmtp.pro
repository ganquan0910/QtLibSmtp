#-------------------------------------------------
#
# Project created by QtCreator 2014-09-02T09:31:27
#
#-------------------------------------------------

QT       += network

QT       -= gui

TARGET = libSmtp
TEMPLATE = lib

DEFINES += LIBSMTP_LIBRARY

SOURCES += libsmtp.cpp

HEADERS += libsmtp.h\
        libsmtp_global.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
