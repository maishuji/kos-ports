# Port Metadata
PORTNAME =          libKGL
PORTVERSION =       2.0.0

MAINTAINER =        Nobody
LICENSE =           KOS License
SHORT_DESC =        KallistiGL, deprecated OpenGL (tm) like graphics library for KOS

# No dependencies beyond the base system.
DEPENDENCIES =

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/libgl \
                    https://github.com/KallistiOS/libkgl.git

TARGET =            libKGL.a
INSTALLED_HDRS =    include/gl.h include/glext.h include/glu.h include/glut.h
HDR_COMDIR =        KGL

# This source still assumes legacy KOS integer aliases are visible globally.
# Rewrite the small set of stale types in the unpacked tree for modern headers.
PREBUILD =          libkgl_prebuild

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk

libkgl_prebuild:
	# gl-rgb.c uses uint8/uint16 from gl-api.h, but only included gl.h upstream.
	sed -i '/#include "gl.h"/c\#include <stdint.h>\
#include "gl-api.h"' build/${PORTNAME}-${PORTVERSION}/gl-rgb.c
	# int8/int16 no longer exist as standalone aliases in current KOS headers.
	sed -i 's/int8 \*/int8_t */g; s/int16 \*/int16_t */g; s/(int8 \*)src/(int8_t *)src/g; s/(int16 \*)src/(int16_t *)src/g' build/${PORTNAME}-${PORTVERSION}/gl-rgb.c
	# glu-texture.c also uses an old uint32 alias for local loop indices.
	sed -i 's/uint32 i = 0;/unsigned int i = 0;/g' build/${PORTNAME}-${PORTVERSION}/glu-texture.c
