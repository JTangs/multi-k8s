FROM node:alpine
WORKDIR "/app"
COPY ./package.json ./
RUN npm install
COPY . .
RUN chown -R node /app/node_modules
USER node
CMD ["npm", "run", "start"]