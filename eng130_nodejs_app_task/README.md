### Multi-Stage Build

- Using the development image can be useful for testing and additional configuration, but the image size may be relatively large. Once everything is working with the development image, multi-stage builds can be used to create a lightweight image, without having to write a new Dockerfile.
- The way this is done is by adding another stage into our Dockerfile with a more lightweight image (FROM node:alpine) 
    - Copy any necessary files from the first stage, and then run any necessary commands. For the node app, multi-stage builds reduced the image size from ~825MB to ~250MB.

### Lightweight App Dockerfile example:
```
FROM node AS app

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]

FROM node:alpine 

WORKDIR /usr/src/app

RUN npm install -g npm@7.20.6

#COPY --from =app /usr/src/app /usr/src app

COPY . .

EXPOSE 3000

CMD [ "node", "seeds/seed.js"]

CMD ["node", "app.js"]

```

### What is Docker-Compose ? 

- Compose is a tool for defining and running
  multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.


## Applying Microservices to the node APP and Mongodb

### Dockerfile (MongoDB)

```
FROM mongo

COPY mongod.conf /etc/

EXPOSE 27017

CMD ["mongod"]
```
- Copying the mongod.conf file to bind the ip to 0.0.0.0 
- We expose Port 27017
- Then the service can be started 

We should also have a dockerfile inside the app folder:

```
FROM node AS app

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g npm@7.20.6

COPY . .

EXPOSE 3000

CMD ["node", "app.js"]

FROM node:alpine 

WORKDIR /usr/src/app

RUN npm install -g npm@7.20.6

#COPY --from =app /usr/src/app /usr/src app

COPY . .

EXPOSE 3000

CMD [ "node", "seeds/seed.js"]

CMD ["node", "app.js"]

```

We now define all the services in a conig file known as a compose file. That can start up all the containers we need.

1. Create file called `docker-compose.yml`
2. Inside the compose yaml file should be the followinf:

```
# Version of the compose file format 
version: "3.9"
# Container services
services:
  db:
    # image to fetch from docker hub
    image: mongo
    # Mapping of container port to host
    ports:
      - "27017:27017"
      # Mount volume 
    volumes:
      - "db:/data/db"

  app:
  # Path to Dockerfile 
    build: ./app
    restart: always
    ports:
      - "3000:3000"
    # Environment variables for startup script
    # container will use these variables
    # to start the container with these define variables. 
    environment:
      - DB_HOST=mongodb://db:27017/posts
    depends_on:
      - db
    # links:
    #     - ""
```
3. Run `docker compose up`

**Result should look like this when ready ...**

**Folder format should look like this ....**


