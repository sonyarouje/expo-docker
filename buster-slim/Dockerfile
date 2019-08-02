FROM node:10.16-buster-slim
LABEL version=1.0.0

ENV USERNAME dev
RUN useradd -rm -d /home/dev -s /bin/bash -g root -G sudo -u 1005 ${USERNAME}

EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

RUN apt update && apt install -y \
    git \
    procps

#used by react native builder to set the ip address, other wise 
#will use the ip address of the docker container.
ENV REACT_NATIVE_PACKAGER_HOSTNAME="10.0.0.2"

COPY *.sh /
RUN chmod +x /entrypoint.sh \
    && chmod +x /get-source.sh

#https://github.com/nodejs/docker-node/issues/479#issuecomment-319446283
#should not install any global npm packages as root, a new user 
#is created and used here
USER $USERNAME

#set the npm global location for dev user
ENV NPM_CONFIG_PREFIX="/home/$USERNAME/.npm-global"

RUN mkdir -p ~/src \
    && mkdir ~/.npm-global \
    && npm install expo-cli --global

#append the .npm-global to path, other wise globally installed packages 
#will not be available in bash
ENV PATH="/home/$USERNAME/.npm-global:/home/$USERNAME/.npm-global/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--gitRepo","NOTSET","--pat","NOTSET"]
