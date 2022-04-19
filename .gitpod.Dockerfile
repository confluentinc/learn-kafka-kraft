FROM gitpod/workspace-full

ARG CONFLUENT_VERSION_SHORT=7.1
ARG CONFLUENT_VERSION=${CONFLUENT_VERSION_SHORT}.0

ENV CONFLUENT_HOME=/home/gitpod/confluent-${CONFLUENT_VERSION}
SHELL ["/bin/bash", "-c"]

# Enable bash completion and update PATH in bash profile
RUN mkdir -p ~/.local/share/bash-completion/ && \
    echo "source ~/.local/share/bash-completion/confluent" >> ~/.bashrc && \
    echo "export PATH=/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/confluent-${CONFLUENT_VERSION}/bin:$PATH" >> ~/.bashrc

# Install Confluent Platform
RUN curl -O https://packages.confluent.io/archive/${CONFLUENT_VERSION_SHORT}/confluent-${CONFLUENT_VERSION}.zip && \
    unzip confluent-${CONFLUENT_VERSION}.zip

ENV PATH=/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/confluent-${CONFLUENT_VERSION}/bin:$PATH
