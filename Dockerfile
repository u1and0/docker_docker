# My shell env built on Archlinux.
# docker manager for docker.
# sync docker directory of host machine.
#
# * docker
# * tmux
# * neovim
# * zsh( zplug )
# * dotfiles(@u1and0)
#
# Usage:
#     `docker run -it -v /var/run/docker.sock:/var/run/docker.sock u1and0/docker` -v `pwd`:/work

FROM u1and0/zplug:latest

# Install docker, tmux
USER root
RUN pacman -Syyu --noconfirm tmux \
                            docker \
                            docker-compose \
                            docker-buildx \
                            pigz &&\
    /bin/sh -o 'pacman -Qtdq | xargs -r pacman --noconfirm -Rcns'

# Install tmux && tmux-plugins
USER u1and0
RUN yay -Syu --noconfirm hadolint-bin &&\
    /bin/sh -o 'yay -Qtdq | xargs -r yay --noconfirm -Rcns' &&\
    git submodule update --init --recursive .tmux/plugins/tpm &&\
    "${HOME}"/.tmux/plugins/tpm/scripts/install_plugins.sh

ENV SHELL "/usr/bin/zsh"
CMD ["/usr/bin/zsh"]
LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Docker in Docker with archlinux image"\
      version="v2.0.0"
