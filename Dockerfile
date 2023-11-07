FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt

COPY converter.py /app/

CMD ["rq", "worker", "--url", "redis://redis-service:6379/0", "q"]