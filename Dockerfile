# Build your application image in this stage
FROM nginx AS application

RUN echo 'hello' > /hello.txt

# This is the test stage, which builds on top of the application stage.
FROM application AS test

# Install goss and copy your goss file into the image.
RUN sh -c 'curl -fsSL https://goss.rocks/install | sh'
COPY goss.yaml /goss.yaml

# Start the application in the background and then run the goss tests.
RUN sh -c './docker-entrypoint.sh nginx; goss validate --format=json'
