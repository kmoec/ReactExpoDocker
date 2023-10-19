# ReactExpoDocker


This docker image is created based on Sony Arouje's blog post which can be found here :

https://sonyarouje.com/2019/08/02/expo-react-native-development-in-docker/

As said in aforementioned blog post, this repository spins docker image to be used
to develop React Expo project and leverage Visual Studio remote develop.

These are the steps you need to take to adapt image for your expo project
- Copy repos content to the folder that you created for your project
- Open dockercontainer.json and edit line 5 with your project name
  - /home/dev/src/your_project_name
- Open docker-compose.yml file
  - line 29 with the directory name you mounting from your local machine
- Create volumes/source in your project directory
- execute this command in terminal from the project directory - "docker-compose up -d"
- Once you get your container up and running, get inside the container
  - execute "docker container ls" and take note of your container id of image "react_expo_docker"
  - execute "docker exec -it <container id from previous step> /bin/bash"   
- navigate to home/dev/src and execute "npx create-expo-app" to initialize your project

Note
-----

In mac environment, expo go won't connect unless tunnel connection is used. Initiate tunnel connection by "expo start --tunnel"
