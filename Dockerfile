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

# Install tmux && tmux-plugins
RUN git submodule update --init --recursive .tmux/plugins/tpm &&\
    sudo pacman -Syyu --noconfirm tmux &&\
    ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh &&\
    pacman -Qtdq | xargs -r sudo pacman --noconfirm -Rcns

# Install docker
RUN sudo pacman -Syyu --noconfirm docker pigz &&\
    pacman -Qtdq | xargs -r sudo pacman --noconfirm -Rcns

ENV SHELL "/usr/bin/zsh"
CMD ["/usr/bin/zsh"]
LABEL maintainer="u1and0 <e01.ando60@gmail.com>"\
      description="Docker in Docker with archlinux image"\
      version="v1.0.0"

