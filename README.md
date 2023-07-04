# Deep Learning Environment Setup

This docs gives a tutorial about how to set up a virtual enviroment for training DL models. Specifically, the environment is a **remote container**. 

When training models, we will need to use the gpus on the server to accelerate the training. For convenience, we often just directly set up the training environment in our home directory. However, this causes some issues.
- namespace contamination
- portability and reproducility

To solve the above issues, we may use `anaconda` to create a virtual enviroments. However, by using `anaconda`, more problems appears
- very huge size (takes space at least 30 GB)
- lacks version control (thus reproducibility is not solved)

A more elegant but more difficult-to-learn solution is using docker container + pip.

## Remote host machine

on the remote host machine (server), set up
- CUDA  
    - install CUDA driver
    - install `nvidia-docker2` (alternatively, `nvidia-ctk` is ok too)
- Docker
    - install docker and run the docker daemon

Note that the above should be already set up on the server, and if not, please contact the manager of the server.

## Build Docker Image
Once we are done with the remote host machine, we can now move on to the container part.

Since we want the container to be out-of-the-box instead of installing many librarys every time we create a container, it is best to build a customized image for our containers.

In the repo, a Dockerfile is provided and you can use it directly. (However, it is good to learn how to write a Dockerfile on your own.)

Build the image using the command
```
$ docker build -t <name:tag> .
```

## Start a container

Run the script
```
$ ./run.sh
```

A more elegant way is by using `docker-compose`, here we omit using it for simplicity.

## VS Code

We can also use VS Code as our editor for development in the remote container. 
1. install docker locally (on your local machine)
2. [create docker context to the remote docker.](https://軒.net/使用-docker-context-操作遠端的-docker-機器)
3. [install extensions for remote and docker on VS Code](https://medium.com/夾縫中求生存的人類/使用visual-studio-code-遠端操作docker環境下的檔案-ebb35292a5b1)
4. [Attach to the running container](https://medium.com/夾縫中求生存的人類/使用visual-studio-code-遠端操作docker環境下的檔案-ebb35292a5b1)