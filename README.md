# Docker & Kubernetes


### What is Docker ? 

- Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications.

### Benefits: 

- Caching a cluster of containers
- Flexible resource sharing
- Scalability - many containers can be placed in a single host
- Running your service on hardware that is much cheaper than - standard servers
- Fast deployment, ease of creating new instances, and faster migrations.
- Ease of moving and maintaining your applications
- Better security, less access needed to work with the code running inside containers, and fewer software dependencies



### Microservices architecture 

- A microservices architecture is a type of application architecture where the application is developed as a collection of services. It provides the framework to develop, deploy, and maintain microservices architecture diagrams and services independently.


![Screenshot 2022-11-21 at 12 24 58](https://user-images.githubusercontent.com/115224560/203070423-f2fbb0a0-cd96-40fc-9543-d5a7fcfd6e7b.png)

# Containerisation with Docker

Containerisation is defined as a form of operating system virtualization, through which applications are run in isolated user spaces called containers, all using the same shared operating system (OS).

Benefits of Containerisation:

- Speed: Containers are lightweight, they share the machine’s operating system (OS) kernel and are not bogged down with this extra overhead.
- Portability: A container creates an executable package of software that is abstracted away from the host operating system. It is portable and able to run uniformly and consistently across any platform or cloud.
- Fault Isolation: Each containerized application is isolated and operates independently of others. The failure of one container does not affect the continued operation of any other containers.
- Ease of Management: Container orchestration platforms can ease management tasks such as scaling containerized apps, rolling out new versions of apps, and providing monitoring, logging and debugging.



# ------------- Setting up Docker

1. After Installing if on windows you might need to run the following commands
2. `alias docker="winpty docker"`
3. `docker ps -a`
4. `docker rm "id" -f` to delete a dcoker image 
5. `docker run -d -p 4000:4000 docs/docker.github.io` docker docs running locally to avoid slow internet speed 
6. if you want to run multiple images that run on the same port then you can change port for example `80:98`
7. `docker stop (id)` 
8. `docker start (docker image id)`
9. `docker exec -it a4101b6334af bash`

---------

### Docker shell commands

- `docker --version` - should get the version 20.11
- `docker` - gets the cheat sheet for docker
- `docker pull hello-world` - downloads the hello-world container
- `docker images` - displays the images you have
- `docker run hello-world` - runs the image we downloaded before
- `docker ps` - draws the processes that are running at the moment
- `docker ps -a`- draws ALL the processes that are running at the moment
- `docker run -p 2368:2368 ghost` - will pull and then run it in one go and select the correct port
- `docker rm [docker id] -f` - to force delete docker that is running
- `docker run -p 80:80 nginx` - to launch nginx
- `docker run -d -p 80:80 nginx` - d stands for detatch mode so we will get the terminal back when run
- `docker logs [container id]` - shows the logs of the running process
- `docker run -d -p 4000:4000` docs/docker.github.io - downaloads container and can run in the background. run localhost:4000
- `docker stop [process id]` - stops the process running with all the
- `docker start [process id]` - starts the process where it left off
- `docker exec -it [process id] bash` - be able to execute shell commands in the process provided