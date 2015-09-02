FROM mongo:2.6.11

RUN apt-get --yes update
RUN apt-get --yes install openssh-server
