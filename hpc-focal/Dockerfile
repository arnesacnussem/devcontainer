# docker build . -f base.Dockerfile -t sacnussem/devcontainer:hpc-focal
FROM mcr.microsoft.com/vscode/devcontainers/base:0-focal

ENV LANG=en_US.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl dumb-init zsh bash htop locales man nano git dos2unix\
    ca-certificates apt-transport-https software-properties-common wget \
    procps openssh-client sudo vim.tiny lsb-release rsync build-essential \
    pip octave octave-common octave-communications octave-communications-common \
    libpam-fprintd libfprint-2-2 fprintd

RUN wget -q https://xpra.org/gpg-2022.asc -O- | apt-key add - && \
    wget -q https://xpra.org/gpg-2018.asc -O- | apt-key add - && \
    add-apt-repository "deb https://xpra.org/ focal main" && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
    apt-get install -y xpra nodejs
    
RUN npm -g install yarn && yarn global add nodemon

COPY install-quartus.sh .
RUN sh install-quartus.sh

ENV DISPLAY=:0
ENV PATH=/opt/intelFPGA_lite/21.1/quartus/bin:$PATH