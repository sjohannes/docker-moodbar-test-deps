# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty.
# This file is offered as-is, without any warranty.

FROM alpine

RUN set -x \
	&& apk add --no-cache \
		fftw-dev \
		g++ \
		gst-plugins-base1-dev \
		gstreamer1-dev \
		ninja \
		python3 \
	&& pip3 install meson

# CircleCI requirements
RUN set -x \
	&& apk add --no-cache \
		ca-certificates \
		git \
		openssh
