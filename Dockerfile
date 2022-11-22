# docker run nginx

FROM nginx 

# who is creating this 

LABEL MAINTAINER=eng130-abdellah 

# created index.html profile - copt to container 
COPY index.html /usr/share/nginx/html

# default location /usr/share/nginx/html

# docker run -d -p 80:80 name 

# port number 
EXPOSE 80

# launch the server 

CMD ["nginx","-g","daemon off;"]
