FROM mongo:2.6.11

RUN apt-get --yes update
RUN apt-get --yes install openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (not sure if Jenkins will alter this)
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

# Jenkins Docker plugin will override this, but keeping here for testing
ENTRYPOINT /usr/sbin/sshd -D
