FROM ubuntu:trusty

MAINTAINER Jon Borgonia "jon@gomagames.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common strace build-essential && \
    add-apt-repository ppa:haxe/releases -y && \
    apt-get update && \
    apt-get install haxe -y && \
    mkdir /usr/local/lib/haxelib && haxelib setup /usr/local/lib/haxelib && \
    apt-get purge software-properties-common -y && \
    rm -rf /var/lib/apt/lists/*

RUN haxelib install hxcpp
