FROM python:2.7.11-alpine
RUN apk update && \
    apk add python-dev build-base && \
    pip install locustio pyzmq && \
    apk del python-dev && \
    rm -f /var/cache/apk/* && \
    mkdir /locust
ADD test.py /locust/test.py
EXPOSE 5557 5558 8089
ENTRYPOINT ["/usr/local/bin/locust", "-f", "/locust/test.py"]
