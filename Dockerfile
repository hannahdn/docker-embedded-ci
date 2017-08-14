FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
        git \
        python \
        python-pip \
        build-essential \
        cmake \
        libsdl2-dev

RUN pip install -q \
    platformio \
    future

RUN git clone https://github.com/uncrustify/uncrustify.git && \
    cd uncrustify && \
    mkdir build && \
    cd build/ && \
    cmake .. && \
    cmake --build . && \
    cp ./uncrustify /usr/bin/
