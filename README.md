# testing-in-multistage-dockerfile
In situations where there's no access to the Docker socket, it's not possible to run goss tests through the dgoss utility.

In this example, the second stage of a multi-stage Dockerfile is used to download and install goss, then start up the application and run the goss tests against it.
