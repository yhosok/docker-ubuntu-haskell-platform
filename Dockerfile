FROM ubuntu:latest

RUN useradd -m -s /bin/bash haskell
RUN sed -i 's/main$/main universe/' /etc/apt/sources.list

RUN apt-get update

#install
RUN apt-get -y install build-essential curl sudo git fonts-inconsolata fonts-ipafont fonts-ipaexfont
RUN apt-get -y install sqlite3 libsqlite3-0 libsqlite3-dev
RUN apt-get -y install emacs24-nox emacs24-el vim
RUN apt-get -y haskell-platform

RUN echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell

RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
RUN locale-gen ja_JP ja_JP.UTF-8 && dpkg-reconfigure locales
ENV LC_ALL C
ENV LC_ALL en_US.UTF-8

USER haskell
WORKDIR /home/haskell

RUN sudo -H cabal update && sudo -H cabal install --global cabal-install

ENV HOME /home/haskell

