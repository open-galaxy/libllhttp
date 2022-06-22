FROM --platform=linux/amd64 debian:buster-slim

ENV RELEASE_VERSION 6.0.6

WORKDIR /build
COPY deps ./deps

RUN apt update && apt upgrade -y && apt install -y python clang npm

WORKDIR /build/deps/llhttp
RUN npm install && make
RUN tar zcvf libllhttp-v$RELEASE_VERSION.tar.gz ./build

WORKDIR /build/dist
RUN mv /build/deps/llhttp/libllhttp-v$RELEASE_VERSION.tar.gz ./