# A docker for ctfs
FROM debian
# Metadata
LABEL version="1.0"
LABEL author="Lucas Cruz dos Reis"
LABEL description="A personal docker image to help in ctfs"

# Default configuration
WORKDIR /workspace
RUN apt-get update && apt-get install -y build-essential strace ltrace gdb \
    vim wget curl dnsutils git python3 python3-pip python3-setuptools \
    python3-dev jq tidy whois default-jdk nmap net-tools tcpdump \
    --no-install-recommends
RUN pip3 install pwntools

# Compilation Settings
WORKDIR src
RUN git clone https://github.com/slimm609/checksec.sh checksec && \
    ln -s $(pwd)/checksec/checksec /bin
RUN git clone https://github.com/radareorg/radare2 radare2 && \
    radare2/sys/install.sh
RUN git clone https://github.com/offensive-security/exploitdb.git \
    exploit-database && ln -s $(pwd)/exploit-database/searchsploit \
    /bin && cp -n $(pwd)/exploit-database/.searchsploit_rc ~/

# Workflow files
COPY .vimrc ~/
WORKDIR ..

CMD ["/bin/bash"]
