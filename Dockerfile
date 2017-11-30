FROM debian:9

MAINTAINER victor@vrdominguez.es

RUN apt-get update && apt-get install -y git ca-certificates gcc make zlib1g-dev ffmpeg \
                                         libavformat-dev libswscale-dev libavdevice-dev \
    && git clone https://github.com/gpac/gpac.git gpac \
    && cd gpac && ./configure --disable-opengl --use-js=no --use-ft=no --use-jpeg=no --use-png=no --use-faad=no --use-mad=no --use-xvid=no --use-ffmpeg=yes --use-ogg=no --use-vorbis=no --use-theora=no --use-openjpeg=no \
    && make && make install \
    && cp bin/gcc/libgpac.so /usr/local/lib \
    && cd .. && rm -rf gpac
