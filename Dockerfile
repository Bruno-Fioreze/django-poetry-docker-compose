FROM python:3.10-alpine

#Copy project
RUN mkdir app/ && cd ./app
WORKDIR /app
COPY . .

#set enviroment
ENV PYTHONPATH=${PYTHONPATH}:${PWD} 
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

#install dependencies
RUN apk add --update --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev \
    && apk add libffi-dev

#configure poetry
RUN pip install --upgrade pip
RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev
RUN poetry config virtualenvs.create false
RUN poetry install $(test "$YOUR_ENV" == production && echo "--no-dev")

# run
ENTRYPOINT ["./entrypoint.sh"]