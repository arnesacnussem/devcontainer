FROM sacnussem/devcontainer:hpc-focal

COPY install-quartus.sh /tmp/install-quartus.sh
RUN sh /tmp/install-quartus.sh
ENV PATH=/opt/intelFPGA_lite/21.1/quartus/bin:$PATH