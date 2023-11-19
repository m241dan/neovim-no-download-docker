FROM ubuntu:23.10 as dev-env

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    gdb \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    git \
    ca-certificates

RUN git clone https://github.com/neovim/neovim && \
    cd neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install

