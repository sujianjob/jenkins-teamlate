FROM jenkins/jenkins:2.492.3-lts


# copy the list of plugins we want to install
COPY plugins.txt /usr/share/jenkins/plugins.txt
# run the jenkins-plugin-cli script to install the plugins
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

# disable the setup wizard as we will set up jenkins as code :)
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false


# copy the seedjob file into the image
COPY seedjob.groovy /usr/local/seedjob.groovy
# copy the config-as-code yaml file into the image
COPY jenkins-casc.yaml /usr/local/jenkins-casc.yaml

# tell the jenkins config-as-code plugin where to find the yaml file
ENV CASC_JENKINS_CONFIG=/usr/local/jenkins-casc.yaml