FROM debian:stable
RUN mkdir jdk7
RUN apt-get update
RUN apt-get install -y wget
RUN mkdir ABCD_SERVER
WORKDIR jdk7/
RUN wget https://drive.google.com/file/d/1IDZl4E05RYBoolGm_jAoeMbIhr1Q_T82/view?usp=sharing
RUN tar -xzvf jdk-7u60-linux-x64.tar.gz
WORKDIR jdk1.7.0_60/bin/
RUN update-alternatives --install /usr/bin/java java $(pwd)/java 3000
RUN update-alternatives --install /usr/bin/javac javac $(pwd)/javac 3000
WORKDIR ../../../ABCD_SERVER/
RUN wget https://drive.google.com/file/d/1nVk_LX4v_YtT_wjRLIunsWw-TG21Qo3E/view?usp=sharing
RUN tar -xzvf vc.tar.gz
WORKDIR vc/server/bin
EXPOSE 5800
CMD ["bash", "startup.sh"] 
