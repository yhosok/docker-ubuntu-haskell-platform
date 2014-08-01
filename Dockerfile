from ubuntu:latest

run useradd -m -s /bin/bash haskell
run sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update && apt-get -y install build-essential haskell-platform curl sudo
run echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell

user haskell
workdir /home/haskell

run sudo -H cabal update && sudo -H cabal install --global cabal-install

env HOME /home/haskell
