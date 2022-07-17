FROM python:3.9-alpine
#FROM centos:7

# Set working directory, e.g., /app or /code - to be the root directory of app
# in the container.
WORKDIR "/docker-flask-mysql"

# Copy everything from current directory directory into corresp. folder of root
# directory of our application within the container
COPY ./docker-flask-mysql /docker-flask-mysql
COPY ./requirements.txt /requirements.txt

RUN apk update
RUN apk --no-cache add curl
# RUN chmod ugo+x /gitea
# RUN apk add git

# Flask default port is 5000 for container that app is in. Would use 3000 if this was container for MySQL.
EXPOSE 5000

# OUTSIDE the Dockerfile: docker build --rm -t docker-flask-mysql .
# TO TEST w/out docker-compose.yml: RUN docker run -d -p 3000:3000 docker-flask-mysql
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Command that runs the app in the container - lets you to configure a container
# that runs as an executable, e.g.,ENTRYPOINT [ "python3" ]
# Append the list of parameters to the ENTRYPOINT parameter to perform the command that runs the app
# is similar to how you run the Python app on your terminal using command: python view.py
# python3 create_jazz_lyric.py
#CMD /gitea
#CMD /bin/sh
# CMD flask run --host=0.0.0.0
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
# CMD [ "flask", "run" ]
CMD [ "/usr/local/bin/flask", "run" ]

# View in browser at: http://localhost:5000/
