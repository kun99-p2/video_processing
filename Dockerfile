FROM python:3.10-slim

ENV REDIS_HOST=redis-server
ENV REDIS_PORT=6379
ENV QUEUE_NAME=q

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY converter.py /app/

CMD ["rq", "worker", "--url", "redis://$REDIS_HOST:$REDIS_PORT/0", "$QUEUE_NAME"]