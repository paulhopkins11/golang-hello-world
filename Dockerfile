FROM golang:latest
WORKDIR /go/src/application/
COPY app.go .
RUN go build app.go

FROM alpine:latest  
WORKDIR /root/
COPY --from=0 /go/src/application/app .
CMD ["./app"] 
