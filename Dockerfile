FROM golang:1.9.0 as builder
WORKDIR /go/src/github.com/ant30/docker-demo-multistages/
COPY app.go  .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
WORKDIR /srv/
COPY --from=builder /go/src/github.com/ant30/docker-demo-multistages/app .
COPY httpfolder /srv/httpfolder
CMD ["./app"]  
