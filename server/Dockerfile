FROM node:14.14.0-alpine
WORKDIR "/app"
COPY ./package.json ./
RUN npm install
RUN npm config set unsafe-perm true
COPY . .
CMD ["npm", "run", "start"]