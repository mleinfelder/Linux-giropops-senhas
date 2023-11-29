FROM cgr.dev/chainguard/python:latest

WORKDIR /app

COPY . ./

ENV REDIS_HOST=redis REDIS_PORT=6379
RUN pip install  -no-cache-dir -r requirements.txt

EXPOSE 5000

CMD flask run --host=0.0.0.0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:5000/ || exit 1

