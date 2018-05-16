FROM ubuntu

RUN apt-get update && \
apt-get install -y curl wget

WORKDIR /hyperion

ADD install_hyperion.sh install_hyperion.sh

RUN chmod +x install_hyperion.sh && \
 sh ./install_hyperion.sh && \
rm ./install_hyperion.sh

CMD /usr/bin/hyperiond /hyperion/hyperion.config.json