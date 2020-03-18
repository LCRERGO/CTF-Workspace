# CTF-Workspace
---------------
This is a docker workspace for ctf challenges with common tools. It has tools
like common C development tools and reverse engenering and network scanning
utilities like nmap and dig.

## Development
- strace
- ltrace
- gdb
- vim
- git
- jdk

## Disassembler/Low Security
- radare2
- checksec

## Network
- dig
- nslookup
- nsupdate
- whois
- curl
- jq
- tidy
- wireshark(linux host only)

## General Security
- pwntools
- searchsploit

# Docker Build
```
docker build . -t lcrergo/ctf-workspace
```
