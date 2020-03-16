FROM alpine

RUN apk add --update --no-cache python3 && \
    ln -fs /usr/bin/python3 /usr/local/bin/python && \
    ln -fs /usr/bin/pip3 /usr/local/bin/pip && \
    pip install pipenv

RUN apk add --no-cache wkhtmltopdf

WORKDIR /app
COPY Pipfile .
COPY Pipfile.lock .
RUN pipenv install --system --deploy --ignore-pipfile

COPY fonts/SourceHanSerifTC-Regular.otf /usr/share/fonts/
