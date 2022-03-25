### STAGE 1: Build ###
FROM node:16.14-alpine AS build
WORKDIR /tasks-master
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY --from=build /tasks-master/dist/ /usr/share/nginx/html
EXPOSE 20022
