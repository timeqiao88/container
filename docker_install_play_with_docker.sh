# Clone this repo locally
git clone https://github.com/play-with-docker/play-with-docker
cd play-with-docker

# Verify the Docker daemon is running
docker run hello-world

# Load the IPVS kernel module. Because swarms are created in dind,
# the daemon won't load it automatically
sudo modprobe xt_ipvs

# Ensure the Docker daemon is running in swarm mode
docker swarm init

# Get the latest franela/dind image
docker pull franela/dind

# Optional (with go1.14): pre-fetch module requirements into vendor
# so that no network requests are required within the containers.
# The module cache is retained in the pwd and l2 containers so the
# download is a one-off if you omit this step.
go mod vendor

# Start PWD as a container
docker-compose up

Now navigate to http://localhost and click the green "Start" button to create a new session, followed by "ADD NEW INSTANCE" to launch a new terminal instance.
