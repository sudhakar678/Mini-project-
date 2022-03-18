#First Stage

FROM ubuntu as builder

RUN apt-get update -y 

RUN apt-get install git sudo curl -y 

RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -

RUN apt -y install nodejs

RUN git clone https://github.com/sudhakar678/Mini-project-.git




WORKDIR /Mini-project-

RUN npm install -g @angular/cli

RUN npm install

RUN ng build




#Second Stage

FROM httpd as server

COPY --from=builder /Mini-project-/dist/ /usr/local/apache2/htdocs/

EXPOSE 20024
