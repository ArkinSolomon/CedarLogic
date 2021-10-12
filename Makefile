#
# File:		Makefile for samples
# Author:	Robert Roebling
# Created:	1999
# Updated:
# Copyright:	(c) 1998 Robert Roebling
#
# This makefile requires a Unix version of wxWindows
# to be installed on your system. This is most often
# done typing "make install" when using the complete
# sources of wxWindows or by installing the two
# RPM packages wxGTK.XXX.rpm and wxGTK-devel.XXX.rpm
# under Linux.
#

CXX = $(shell wx-config --cxx) -Wno-everything -v -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

PROGRAM = CedarLogic

OBJECTS = src/version.o src/gui/autoSaveThread.o src/gui/CircuitParse.o src/gui/gateImage.o src/gui/gl_defs.o src/gui/GUICanvas.o src/gui/GUICircuit.o src/gui/guiGate.o src/gui/guiText.o src/gui/guiWire.o src/gui/klsClipboard.o src/gui/klsCollisionChecker.o src/gui/klsGLCanvas.o src/gui/klsMiniMap.o src/gui/LibraryParse.o src/gui/MainApp.o src/gui/MainFrame.o src/gui/OscopeCanvas.o src/gui/OscopeFrame.o src/gui/PaletteCanvas.o src/gui/PaletteFrame.o src/gui/paramDialog.o src/gui/RamPopupDialog.o src/gui/threadLogic.o src/gui/wireSegment.o src/gui/XMLParser.o src/gui/command/cmdAddTab.o src/gui/command/cmdConnectWire.o src/gui/command/cmdCreateGate.o src/gui/command/cmdCreateWire.o src/gui/command/cmdDeleteGate.o src/gui/command/cmdDeleteSelection.o src/gui/command/cmdDeleteTab.o src/gui/command/cmdDeleteWire.o src/gui/command/cmdDisconnectWire.o src/gui/command/cmdMoveGate.o src/gui/command/cmdMoveSelection.o src/gui/command/cmdMoveWire.o src/gui/command/cmdPasteBlock.o src/gui/command/cmdSetParams.o src/gui/command/cmdWireSegDrag.o src/gui/command/klsCommand.o src/gui/GLFont/glfont2.o src/logic/logic_circuit.o src/logic/logic_event.o src/logic/logic_gate.o src/logic/logic_junction.o src/logic/logic_wire.o

.SUFFIXES:	.o .cpp

.cpp.o :
	$(CXX) -c `wx-config --cxxflags` -o $@ $<

all:    $(PROGRAM)

$(PROGRAM):	$(OBJECTS)
	$(CXX) -o $(PROGRAM) $(OBJECTS) `wx-config --libs all`

clean:
	rm -f *.o $(PROGRAM)
