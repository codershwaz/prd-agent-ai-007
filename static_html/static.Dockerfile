# declare what image to use
# FROM image:version
FROM python:3.15.0rc1-trixie

# WORKDIR /app
# RUN echo "<h1>hello</h1>" > index.html

# RUN mkdir -p /static_folder
# COPY ./static_html /static_folder

WORKDIR /app

COPY ./src .
# docker build -f Dockerfile -t pyapp .
# docker run -it pyapp


# docker build -f Dockerfile -t shubhamketu/ai-agent-prod:latest .
# docker push shubhamketu/ai-agent-prod:latest
# docker run -it -p 8080:8000 shubhamketu/ai-agent-prod:latest

CMD ["python", "-m", "http.server", "8000"]