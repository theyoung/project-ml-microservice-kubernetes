[![theyoung](https://circleci.com/gh/theyoung/project-ml-microservice-kubernetes/tree/circleci-project-setup.svg?style=svg)](https://app.circleci.com/pipelines/github/theyoung/project-ml-microservice-kubernetes?branch=circleci-project-setup)

## A summary of the project
This is a assignment of DevOps course on udacity.

1. Create Dockerfile and build it myself. It contain a app.py that predicts Boston housing price.
2. Bulid Docker a Image and Tint. Finally upload the image to my repository of Docker
3. Build kubernetes networks and Deploy it on my own clusters in kubeadm.
4. Test API on k8s by running make_prediction.sh

### Instructions

1. checkout 
`git clone https://github.com/theyoung/project-ml-microservice-kubernetes.git`

2. (Optional) install python3.7 version (python 3.8 is not compatible with it)
```
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
tar -xf Python-3.7.4.tgz
./configure --enable-optimizations
sudo make
sudo make altinstall
```

3. make a Virtual Environment for python 3.7
```
python3.7 -m venv ~/.devops
source ~/.devops/bin/activate
```
or
```
make setup
source ~/.devops/bin/activate
```

4. build Docker image
```
./run_docker.sh
./upload_docker.sh
```
or
```
sudo usermod -a -G docker $USER
sudo chmod 666 /var/run/docker.sock 
sudo service docker restart
./run_docker.sh
./upload_docker.sh
```

5. run a service on kubernetes clusters
```
./run_kubernetes.sh
```

6. Test Api
```
./make_predictions.sh
```
and get logs from k8s
```
kubectl logs deployment/mlmicro
```

### A short explanation of files
```
--\
  |-\ .circleci
    |- config.yml : linting python code
  |-\ model_data : boston price history model data
  |-\ output_txt_files : running logs of docker and kubernetes
  |- app.py : Api, prediction codes are here
  |- Dockerfile : Docker image meta info
  |- make_prediction.sh : to test api
  |- Makefile : make virtual env setup and linting
  |- requirements.txt : python dependencies modules
  |- run_docker.sh : build image and upload
  |- run_kubernetes.sh : run image and open port to serve api
  |- upload_docker.sh : upload built image to docker hub
```