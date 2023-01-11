# Makefile for CedarLogic for Mac

CXX = $(shell wx-config --cxx) -Wno-everything -g -v -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -I logic/include/ -I include -I include/gui/ -I include/gui/command/ -I include/gui/GLFont -fsanitize=address

PROGRAM = CedarLogic

OBJECTS = logic/tests/test.o logic/src/logic_gate.o logic/src/logic_event.o logic/src/logic_circuit.o logic/src/logic_junction.o logic/src/logic_wire.o simulator/simulator.o simulator/logic.o simulator/tests/test_logic.o simulator/tests/test_circuit.o simulator/circuit.o simulator/entities.o src/version.o src/gui/PaletteCanvas.o src/gui/autoSaveThread.o src/gui/GLFont/glfont2.o src/gui/klsGLCanvas.o src/gui/GUICanvas.o src/gui/threadLogic.o src/gui/klsClipboard.o src/gui/MainFrame.o src/gui/gl_defs.o src/gui/guiGate.o src/gui/klsMiniMap.o src/gui/paramDialog.o src/gui/wireSegment.o src/gui/CircuitParse.o src/gui/MainApp.o src/gui/OscopeFrame.o src/gui/GUICircuit.o src/gui/guiText.o src/gui/guiWire.o src/gui/LibraryParse.o src/gui/PaletteFrame.o src/gui/klsCollisionChecker.o src/gui/command/cmdDeleteTab.o src/gui/command/cmdDeleteSelection.o src/gui/command/cmdDeleteWire.o src/gui/command/cmdWireSegDrag.o src/gui/command/cmdMoveGate.o src/gui/command/cmdPasteBlock.o src/gui/command/cmdAddTab.o src/gui/command/cmdCreateGate.o src/gui/command/cmdDisconnectWire.o src/gui/command/cmdCreateWire.o src/gui/command/cmdMoveWire.o src/gui/command/cmdConnectWire.o src/gui/command/cmdSetParams.o src/gui/command/klsCommand.o src/gui/command/cmdDeleteGate.o src/gui/command/cmdMoveSelection.o src/gui/XMLParser.o src/gui/OscopeCanvas.o src/gui/gateImage.o src/gui/RamPopupDialog.o

.SUFFIXES:	.o .cpp

.cpp.o :
	$(CXX) -c `wx-config --cxxflags` -o $@ $<

all:    $(PROGRAM)

$(PROGRAM):	$(OBJECTS)
	$(CXX) -o $(PROGRAM) $(OBJECTS) `wx-config --libs all`

clean:
	rm -f *.o $(PROGRAM)
