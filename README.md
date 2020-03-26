# Docker Container for Running GHC Development Version

## Building the Container
1. Make any necessary changes to the Dockerfile, e.g. setting a branch or checkout a specific commit.
2. Make sure you have docker.io installed on your machine.
3. Build the container locally using ``docker build -t <name> .``
4. Make a nice cup of coffee / tea. Seriously, no rush :)
5. You can test run the new build of GHC using ``docker run -it <name>''

## Pushing the Container
1. Go to hub.docker.com, and create a new (free) repository.
2. In order to avoid issues later on, it's good practice to make sure that your local container has the same name as your new repository. You can easily rename a container using ``docker tag <old name> <repo name>``.
3. Push the container using ``docker push <name>.``
4. Probably a good idea to make a second cup of coffee / tea at this point.

## Pulling the Container
1. Pulling the container is as easy as calling ``docker pull <repo name>''
2. You can now use your development build of GHC using ``docker run -it <repo name>``
