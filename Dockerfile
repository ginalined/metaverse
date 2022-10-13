FROM debian:latest
 #Install git, bash, java, maven, curl, nano, npm
RUN apt update && apt install -y \
 git \
 bash-completion \
 default-jdk\
 maven\
 curl\
 nano\
 npm

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g three
RUN npm install -g solipsism
RUN npm install -g browserify

COPY . /home/vrspace/


WORKDIR /home/vrspace/
RUN mvn clean install

# Get execution permission of start.sh
RUN chmod 744 /home/vrspace/start.sh

#Set working directory
WORKDIR /home/vrspace/server/target/

CMD /home/vrspace/start.sh

EXPOSE 4001
EXPOSE 4002
EXPOSE 4003
EXPOSE 8002
EXPOSE 8003
EXPOSE 8080
EXPOSE 8443
