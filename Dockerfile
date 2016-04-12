FROM ubuntu:14.04

MAINTAINER lqb <lqb@gmx.de>

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends  openssh-server openjdk-7-jdk sudo \
	&& sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
	&& mkdir -p /var/run/sshd \
	&& adduser --quiet jenkins \
	&& echo "jenkins:jenkins" | chpasswd \
	&& echo "jenkins ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jenkins \
	&& chmod 440 /etc/sudoers.d/jenkins \
	&& sudo -u jenkins mkdir /home/jenkins/.ssh \
	&& chmod 0700 /home/jenkins/.ssh \
	&& apt-get clean \
	&& apt-get autoclean \
	&& rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*  /var/cache/apt/srcpkgcache.bin  /var/cache/apt/pkgcache.bin


EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
