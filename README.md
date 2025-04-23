# build the docker image
docker build -t jenkins-casc:0.1 .

# run the docker image and map ports 8080
docker run --rm --name jenkins-casc -p 8080:8080 jenkins-casc:0.1

# 迁移后 credentials/凭据 中的数据需要重新配置，Jenkins 目前每台机器的 credentials  是独一无二的 [github issues](https://github.com/jenkinsci/configuration-as-code-plugin/issues/1141 )



