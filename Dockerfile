FROM evarga/jenkins-slave

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --yes update
RUN apt-get --yes install mongodb-org-tools 
