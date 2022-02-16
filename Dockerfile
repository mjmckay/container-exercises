FROM mjmckay.jfrog.io/app-docker/myalpine:latest

WORKDIR /app

COPY resources/helloworld.c .

RUN gcc -o hello helloworld.c

CMD ["./hello"]
