FROM ubuntu:14.04
MAINTAINER Camilo Varela

RUN apt-get update && apt-get install -y git nodejs npm
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir dojo
RUN cd /dojo; git clone https://github.com/camilovarela/todomvc.git
RUN cd /dojo/todomvc; bower update

ADD entrypoint.sh /dojo/entrypoint.sh
RUN chmod +x /dojo/entrypoint.sh

ENTRYPOINT ["/dojo/entrypoint.sh"]

