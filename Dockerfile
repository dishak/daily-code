FROM node:20-alpine

WORKDIR /usr/src/app

# script file to automate copying the package.json & yarn.lock file
COPY copyalljson.sh .
RUN chmod +x copyalljson.sh 
RUN ./copyalljson.sh

RUN yarn install

COPY . .

EXPOSE 3000

CMD ["yarn", "run", "dev:docker"]
