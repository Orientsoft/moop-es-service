FROM python:3.6-alpine as base

FROM base as builder
RUN apk add --no-cache gcc musl-dev tzdata

RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

FROM base
COPY --from=builder /install /usr/local
ENV TZ=Asia/Shanghai
WORKDIR /app
COPY . .

CMD [ "python", "run.py" ]
