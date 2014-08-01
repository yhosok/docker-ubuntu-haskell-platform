from ubuntu:latest

run useradd -m -s /bin/bash haskell
run sed -i 's/main$/main universe/' /etc/apt/sources.list && apt-get update && apt-get -y install build-essential haskell-platform curl sudo emacs24-nox emacs24-el vim
run echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell

run locale-gen en_US.UTF-8  

user haskell
workdir /home/haskell

run sudo -H cabal update && sudo -H cabal install --global cabal-install

env HOME /home/haskell
env LANG en_US.UTF-8  
env LANGUAGE en_US:en  
env LC_ALL en_US.UTF-8  
