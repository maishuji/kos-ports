TARGET = liboggvorbisplay.a
OBJS = liboggvorbisplay/main.o liboggvorbisplay/sndoggvorbis.o
# Keep quoted oggvorbis headers local to this port without shadowing installed
# <ogg/...> and <vorbis/...> dependency headers.
KOS_CFLAGS += -iquote include -Iliboggvorbisplay

include ${KOS_PORTS}/scripts/lib.mk
