# Port Metadata
PORTNAME =          libGL
PORTVERSION =       1.1.1

MAINTAINER =        Luke Benstead <kazade@gmail.com>
LICENSE =           2-clause BSD (see LICENSE in the source distribution)
SHORT_DESC =        GLdc, an OpenGL (tm) like graphics library for KOS

PORT_BUILD =        cmake

GIT_REPOSITORY =    https://gitlab.com/simulant/GLdc.git

TARGET =            libGL.a libGLU.a
INSTALLED_HDRS =    include/GL/gl.h include/GL/glext.h include/GL/glkos.h include/GL/glu.h
HDR_COMDIR =        GL
EXAMPLES_DIR =      samples

# -DCMAKE_BUILD_TYPE=Release forces GLdc to build with upstream's release optimization
# flags. Remove this argument to create a build without overriding $KOS_CFLAGS.
# Add -DBUILD_SAMPLES=OFF and/or -DBUILD_TESTS=OFF to speed up compilation by skipping
# the compilation of GLdc's samples and tests.
CMAKE_ARGS =        -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF

# Upstream still wires zclip_test through the samples block on this snapshot,
# so drop it after unpack to keep the port building only distributable outputs.
PREBUILD =          libgl_prebuild
PREINSTALL =        move_samples

include ${KOS_PORTS}/scripts/kos-ports.mk

libgl_prebuild:
	sed -i '/gen_sample(zclip_test tests\/zclip\/main.cpp)/d' build/${PORTNAME}-${PORTVERSION}/CMakeLists.txt

move_samples:
	@mv build/${PORTNAME}-${PORTVERSION}/*.elf build/${PORTNAME}-${PORTVERSION}/samples 2>/dev/null || true
