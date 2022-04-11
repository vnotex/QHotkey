INCLUDEPATH *= $$PWD/QHotkey

DEPENDPATH *= $$PWD/QHotkey

OUT_FOLDER = $$absolute_path($$relative_path($$PWD, $$_PRO_FILE_PWD_), $$OUT_PWD)
win32:CONFIG(release, debug|release) {
    LIBS += $$OUT_FOLDER/QHotkey/release/QHotkey.lib
    # For static library, we need to add this depends to let Qt re-build the target
    # when there is a change in the library.
    PRE_TARGETDEPS += $$OUT_FOLDER/QHotkey/release/QHotkey.lib
} else:win32:CONFIG(debug, debug|release) {
    LIBS += $$OUT_FOLDER/QHotkey/debug/QHotkey.lib
    PRE_TARGETDEPS += $$OUT_FOLDER/QHotkey/debug/QHotkey.lib
} else:unix {
    LIBS += $$OUT_FOLDER/QHotkey/libQHotkey.a
    PRE_TARGETDEPS += $$OUT_FOLDER/QHotkey/libQHotkey.a
}
