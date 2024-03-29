FROM node:16.15.1-buster-slim
LABEL version=1.0.0

ENV USERNAME dev
RUN useradd -rm -d /home/dev -s /bin/bash -g root -G sudo -u 1005 ${USERNAME}

EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

RUN apt-get update && apt-get install sudo -y && sudo apt-get install -y git procps

# used by react native builder to set the ip address, other wise
# will use the ip address of the docker container.
ENV REACT_NATIVE_PACKAGER_HOSTNAME="10.0.0.2"

# Copy shell script inside docker file 
COPY *.sh /
RUN chmod +x /entrypoint.sh
RUN chmod +x /get-source.sh

# https://github.com/nodejs/docker-node/issues/479#issuecomment-319446283
# should not install any global npm packages as root, a new user
# is created and used here
USER $USERNAME

# set the npm global location for dev user. 
ENV NPM_CONFIG_PREFIX="/home/$USERNAME/.npm-global"

# install expo-cli from npm package. @expo/ngrok@4.1.0  is necessary for tunnel access
RUN mkdir -p ~/src && mkdir ~/.npm-global && npm install expo-cli --global && npm install @expo/ngrok@4.1.0 --global

# append the .npm-global to path, other wise globally installed packages
# will not be available in bash
ENV PATH="/home/$USERNAME/.npm-global:/home/$USERNAME/.npm-global/bin:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--gitRepo","NOTSET","--pat","NOTSET"]
