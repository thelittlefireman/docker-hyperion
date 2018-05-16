FROM rastasheep/ubuntu-sshd:18.04

RUN apt-get update && \
apt-get install -y curl wget

WORKDIR /hyperion

ADD install_hyperion.sh install_hyperion.sh

RUN chmod +x install_hyperion.sh && \
 sh ./install_hyperion.sh && \
rm ./install_hyperion.sh

#Allow ssh for hyperCon
EXPOSE 22

CMD /usr/bin/hyperiond /hyperion/hyperion.config.json
