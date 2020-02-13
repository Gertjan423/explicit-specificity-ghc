FROM ubuntu:18.04
MAINTAINER Gert-Jan Bottu (gertjan.bottu@kuleuven.be)

# Preparation
# ~~~~~~~~~~~
RUN apt-get update; \
    apt-get install -y \
    software-properties-common \
    build-essential git autoconf python3 libgmp-dev libncurses-dev

RUN add-apt-repository -y ppa:hvr/ghc; \
    apt-get update; \
    apt-get install -y cabal-install-3.2 ghc-8.6

ENV PATH="/opt/ghc/bin:/opt/cabal/bin:/root/.cabal/bin:${PATH}"

RUN cabal user-config update; \
    cabal update; \
    cabal v2-install alex happy

# Getting the Sources
# ~~~~~~~~~~~~~~~~~~~
RUN mkdir build; \
    cd build; \
    git clone https://gitlab.haskell.org/Gertjan423/ghc.git; \
    cd ghc; \
    git checkout -b wip/T16393; \
    git pull origin wip/T16393; \
    git submodule update --init

WORKDIR "build/ghc"

# Building GHC
# ~~~~~~~~~~~~
RUN ./boot && ./configure

RUN ./hadrian/build.sh -j

# Running GHC
# ~~~~~~~~~~~
CMD ./_build/stage1/bin/ghc --interactive