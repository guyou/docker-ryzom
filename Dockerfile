FROM 32bit/debian:jessie

MAINTAINER guilhem.bonnefille@gmail.com

RUN useradd ryzom -d /opt/ryzom -G video && mkdir -p /opt/ryzom && chown ryzom:ryzom /opt/ryzom

# Adding dependencies
RUN apt-get -y update && apt-get -y install libgl1-mesa-glx libx11-6 libxxf86vm1 libxrandr2 libxrender1 libc6 libstdc++6 libgcc1 libxext6 libxcb1 libxau6 libxdmcp6 

RUN apt-get -y install p7zip-full

USER ryzom

# Installing client
WORKDIR /opt
ADD ryzom_client.7z /opt/ryzom/
RUN 7z x -o/opt /opt/ryzom/ryzom_client.7z && rm /opt/ryzom/ryzom_client.7z

# Updating client
#RUN apt-get -y install rsync
#WORKDIR /opt/ryzom
#RUN /opt/ryzom/ryzom_update.sh


# Running client
WORKDIR /opt/ryzom
#CMD /opt/ryzom/ryzom_client
ENTRYPOINT /opt/ryzom/ryzom_client
