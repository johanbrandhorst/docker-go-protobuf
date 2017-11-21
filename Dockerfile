FROM golang:latest

RUN apt-get update && \
    apt-get install -y unzip git wget python3 && \
    rm -rf /var/lib/apt/lists/*

ENV PROTOBUF_VERSION 3.5.0
ENV PROTOBUF_FILENAME protoc-$PROTOBUF_VERSION-linux-x86_64.zip
ENV PROTOBUF_DOWNLOAD_URL https://github.com/google/protobuf/releases/download/v$PROTOBUF_VERSION/$PROTOBUF_FILENAME

# Install protoc compiler
RUN wget $PROTOBUF_DOWNLOAD_URL && \
    unzip $PROTOBUF_FILENAME -d /usr/local/ && \
    rm -rf $PROTOBUF_FILENAME

RUN apt-get remove -y wget unzip && \
    apt-get autoremove -y
