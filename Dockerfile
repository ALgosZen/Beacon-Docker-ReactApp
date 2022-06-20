#pull official base image
FROM node:18.3-alpine

#set working directory
WORKDIR /app

#add `/app/node_modules/.bin` to path
ENV PATH /app/node_modules/.bin:$PATH

#install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@5.0.1 -g --silent

#copy app
COPY . ./

#start app
CMD ["npm","run","start"]

