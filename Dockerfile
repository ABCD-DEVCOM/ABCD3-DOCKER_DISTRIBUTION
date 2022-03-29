FROM debian:stable
RUN mkdir jdk7
RUN apt-get update
RUN apt-get upgrade -y
RUN mkdir ABCD_SERVER
WORKDIR jdk7/
ADD http://abcd.mzum.be/files/jdk-7u60-linux-x64.tar.gz .
RUN tar -xzvf jdk-7u60-linux-x64.tar.gz
WORKDIR jdk1.7.0_60/bin/
RUN update-alternatives --install /usr/bin/java java $(pwd)/java 3000
RUN update-alternatives --install /usr/bin/javac javac $(pwd)/javac 3000
WORKDIR ../../../ABCD_SERVER/
ADD http://abcd.mzum.be/files/vc.tar.gz .
RUN tar -xzvf vc.tar.gz
WORKDIR vc/server/bin
EXPOSE 5800
CMD ["bash", "startup.sh"] 
