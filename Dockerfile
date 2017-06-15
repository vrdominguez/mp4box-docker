FROM debian:9

MAINTAINER victor@vrdominguez.es

RUN apt-get update && apt-get install -y --no-install-recommends subversion gcc make zlib1g-dev 
RUN svn --trust-server-cert --non-interactive co https://svn.code.sf.net/p/gpac/code/trunk/gpac gpac 
RUN cd gpac && ./configure --disable-opengl --use-js=no --use-ft=no --use-jpeg=no --use-png=no --use-faad=no --use-mad=no --use-xvid=no --use-ffmpeg=no --use-ogg=no --use-vorbis=no --use-theora=no --use-openjpeg=no \
	&& make && make install \
	&& cp bin/gcc/libgpac.so /usr/lib
