# A docker for ctfs
FROM debian

# Default configuration
WORKDIR /workspace
RUN apt-get update && apt-get install -y build-essential strace ltrace gdb \
    vim curl dnsutils git python3 python3-pip python3-setuptools python3-dev \
    jq tidy whois default-jdk \
    --no-install-recommends
RUN pip3 install pwntools

# Compilation Settings
WORKDIR src
RUN git clone https://github.com/slimm609/checksec.sh checksec && \
    ln -s $(pwd)/checksec/checksec /bin
RUN git clone https://github.com/radareorg/radare2 radare2 && \
    radare2/sys/install.sh

# Workflow files
COPY .vimrc ~/
WORKDIR ..

CMD ["/bin/bash"]
