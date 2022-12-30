# Merino Proxy Dockerfile


## Configuration example
### `docker-compose.yml`
```
version: '3.7'

services:
  proxy:
    image: nexryai/merino-proxy:latest
    restart: always
    ports:
      - "1080:1080"
    volumes:
      - ./users.csv:/app/users.csv:ro
```

### `users.csv`
```
username,password

exampleuser,CHANGEMEPASSWORD
```
