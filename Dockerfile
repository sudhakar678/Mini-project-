#First Stage

FROM ubuntu as builder

RUN apt-get update -y 

RUN apt-get install git sudo curl -y 

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

RUN apt -y install nodejs

RUN git clone https://github.com/lakshmanparvathala-cloudside/Angular.git




WORKDIR /Angular

RUN npm install -g @angular/cli

RUN npm install

RUN ng build




#Second Stage

FROM httpd as server

COPY --from=builder /Angular/dist/ /usr/local/apache2/htdocs/

EXPOSE 20021
