FROM nginx:latest

RUN apt-get update && \
	apt-get install -y curl gnupg2 && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs

RUN npm install -g nodemon && apt-get install nano

RUN mkdir /scripts

ADD scripts/* /scripts/

RUN chmod 755 /scripts/startup.sh

RUN cd scripts && npm install

CMD ["sh", "-c", "/scripts/startup.sh"]