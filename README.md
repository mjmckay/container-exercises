## Image and Container Exercises - Paying Attention to Dockerfile Details
Exercises around image building and management

### Build & Run with the Original Dockerfile
```
FROM mjmckay.jfrog.io/app-docker/myalpine:latest

WORKDIR /app

RUN wget https://raw.githubusercontent.com/mjmckay/legendary-giggle/main/helloworld.c

RUN gcc -o hello helloworld.c

CMD ["./hello"]
```
  
### Use an Official Base Image!
```
FROM alpine

RUN add --no-cache wget gcc musl-dev # buildkit

WORKDIR /app

RUN wget https://raw.githubusercontent.com/mjmckay/legendary-giggle/main/helloworld.c

RUN gcc -o hello helloworld.c

CMD ["./hello"]
```

### Don't Rely on External Resources
```
FROM alpine

RUN add --no-cache wget gcc musl-dev # buildkit

WORKDIR /app

COPY resources/helloworld.c .

RUN gcc -o hello helloworld.c

CMD ["./hello"]
```

### Manage Your Repositories
```
FROM [DOCKER REGISTRY]/[DOCKER REPO]/alpine

RUN add --no-cache wget gcc musl-dev # buildkit

WORKDIR /app

COPY resources/helloworld.c .

RUN gcc -o hello helloworld.c

CMD ["./hello"]
```
