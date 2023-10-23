FROM --platform=linux/amd64 python:3.11-alpine

WORKDIR /app
COPY . .
COPY ./config ../config
COPY ./account ../account
COPY ./logs ../logs


# Install bash
RUN apk add --no-cache bash

RUN pip install --no-cache-dir -r requirements.txt -i https://mirrors.ustc.edu.cn/pypi/web/simple
RUN chmod +x ./scripts/*.sh

CMD ["/bin/sh", "./scripts/run.sh"]

