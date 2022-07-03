# ReactExpoDocker


This docker image is created based on Sony Arouje's blog post which can be found here :

https://sonyarouje.com/2019/08/02/expo-react-native-development-in-docker/

As said in aforementioned blog post, this repository spins docker image to be used
to develop React Expo project and leverage Visual Studio remote develop.

These are the steps you need to take to adapt image for your expoproject
- Open dockercontainer.json and edit line 5 with your project name
  - /home/dev/src/your_project_name
- Open docker-compose.yml file
  - line 29 with the directory name you mounting from your local machine
