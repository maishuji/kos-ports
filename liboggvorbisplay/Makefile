# Port Metadata
PORTNAME =          liboggvorbisplay
PORTVERSION =       2.0.0

MAINTAINER =        Lawrence Sebald <ljsebald@users.sourceforge.net>
LICENSE =           KOS License
SHORT_DESC =        Ogg Vorbis audio streaming library

DEPENDENCIES =      libvorbis

# What files we need to download, and where from.
GIT_REPOSITORIES =  git://git.code.sf.net/p/cadcdev/liboggvorbis \
                    https://github.com/KallistiOS/liboggvorbisplay.git

TARGET =            liboggvorbisplay.a
INSTALLED_HDRS =    include/oggvorbis/sndoggvorbis.h
HDR_INSTDIR =       oggvorbis

# This wrapper library predates current KOS/libvorbis headers, so normalize its
# local source after unpack instead of changing the shared ports framework.
PREBUILD =          liboggvorbisplay_prebuild

# KOS Distributed extras (to be copied into the build tree)
KOS_DISTFILES =     KOSMakefile.mk

include ${KOS_PORTS}/scripts/kos-ports.mk

liboggvorbisplay_prebuild:
	# Pull in fixed-width integer types expected by the legacy source.
	sed -i '/#include <kos.h>/a #include <stdint.h>' build/${PORTNAME}-${PORTVERSION}/liboggvorbisplay/sndoggvorbis.c
	# Update stale integer aliases and cast ov_read's buffer to the libvorbis API.
	sed -i 's/static uint8 pcm_buffer/static uint8_t pcm_buffer/; s/static uint8 \*pcm_ptr/static uint8_t *pcm_ptr/; s/static int32 pcm_count/static int32_t pcm_count/; s/static int32 last_read/static int32_t last_read/; s/uint32 s_s, s_ms, e_s, e_ms;/uint32_t s_s, s_ms, e_s, e_ms;/; s/ov_read(&vf, pcm_ptr/ov_read(\&vf, (char *)pcm_ptr/g' build/${PORTNAME}-${PORTVERSION}/liboggvorbisplay/sndoggvorbis.c
