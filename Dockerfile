FROM ubuntu:18.04

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN cp /etc/apt/sources.list /etc/apt/sources.list~
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get build-dep -y python2.7 hexedit 
RUN apt-get install -y wget unzip tar vim
COPY build-sqlite.sh /build-sqlite.sh
COPY build-python-modules.sh /build-python-modules.sh
COPY sqliteTest.py /sqliteTest.py
COPY build-psql.sh /build-psql.sh
RUN ls
RUN bash build-sqlite.sh 
RUN bash build-python-modules.sh
RUN bash build-psql.sh