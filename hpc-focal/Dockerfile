# docker build . -f base.Dockerfile -t sacnussem/devcontainer:hpc-focal
FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

ENV LANG=en_US.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl dumb-init zsh bash htop locales man nano git dos2unix\
    ca-certificates apt-transport-https software-properties-common wget \
    procps openssh-client sudo vim.tiny lsb-release rsync build-essential \
    pip octave octave-common octave-communications octave-communications-common \
    libpam-fprintd libfprint-2-2 fprintd openjdk-17-jdk gnupg2 software-properties-common

RUN curl https://xpra.org/gpg-2022.asc | apt-key add - && \
    curl https://xpra.org/gpg-2018.asc | apt-key add - && \
    curl https://packages.grafana.com/gpg.key | apt-key add - && \
    add-apt-repository "deb https://xpra.org/ focal main" && \
    add-apt-repository "deb https://packages.grafana.com/oss/deb stable main" && \
    echo 'deb [trusted=yes] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /' | sudo tee /etc/apt/sources.list.d/nvhpc.list && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && \
    apt-get install -y xpra nodejs grafana prometheus prometheus-pushgateway nvhpc-22-7 libopenblas-dev

RUN npm -g install yarn && yarn global add nodemon

RUN wget -q --show-progress --progress=bar:force:noscroll -O- https://github.com/YosysHQ/oss-cad-suite-build/releases/download/$(date +%Y-%m-%d --date="yesterday" -u)/oss-cad-suite-linux-x64-$(date +%Y%m%d --date="yesterday" -u).tgz | tar zxf - -C /opt
RUN apt-get update && apt-get install -y libgnat-9 zlib1g-dev libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda_installer.sh && \
    bash /tmp/miniconda_installer.sh -b -u -p /usr/lib/miniconda && \
    rm /tmp/miniconda_installer.sh


ENV PATH=/opt/oss-cad-suite/bin:/usr/lib/miniconda/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV DISPLAY=:100
