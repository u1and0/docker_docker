Dockerfile for [u1and0/docker](http://hub.docker.com/r/u1and0/docker)

# Install

```
docker pull u1and0/zplug
docker run -it --rm -v `pwd`:/work -w /work u1and0/zplug
```

# Usage

```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock u1and0/docker` -v `pwd`:/work
```

# Description
* u1and0/docker container
* based on [u1and0/zplug](http://hub.docker.com/r/u1and0/zplug)
* [u1and0/dotfiles](https://github.com/u1and0/dotfiles)
* tmux
* docker in docker

# Version
* v0.1.0          [mod] rebuild u1and0/zplug:v5.1.0 USERNAME u1and0
* v0.0.0          initial commit
