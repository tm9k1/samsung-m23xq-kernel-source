FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN yes | unminimize
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common
RUN apt-get install -y byobu curl git htop man unzip vim wget
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y git ccache automake flex lzop bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 g++-multilib
RUN apt-get install -y python3-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush
RUN apt-get install -y schedtool dpkg-dev liblz4-tool make optipng maven libssl-dev pwgen libswitch-perl
RUN apt-get install -y policycoreutils minicom libxml-sax-base-perl libxml-simple-perl bc libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev xsltproc unzip
RUN apt-get install -y zsh python python3 libncurses5 cpio

CMD ["sleep", "infinity"]

