FROM golang:latest
WORKDIR /go/src/application/
COPY app.go .
RUN go mod init
RUN GOOS=linux go build -a -o app .

FROM alpine:latest  
WORKDIR /root/
COPY --from=0 /go/src/application/app .
CMD ["./app"] 
