FROM node:alpine
WORKDIR /c/Users/ASUS PRO/devops project/docker-nodejs
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3030
CMD [ "node", "index.js" ]