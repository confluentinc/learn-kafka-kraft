FROM gitpod/workspace-full

ARG CONFLUENT_VERSION_SHORT=7.0
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

# We install the confluent CLI separately from CP since v2.0 won't be available until CP 7.1. Also enable bash tab completion.
RUN curl -sL --http1.1 https://cnfl.io/cli | sh -s -- -b /home/gitpod/confluent-${CONFLUENT_VERSION}/bin/ v2.0.0 && \
    /home/gitpod/confluent-${CONFLUENT_VERSION}/bin/confluent completion bash > ~/.local/share/bash-completion/confluent

ENV PATH=/home/gitpod/.sdkman/candidates/java/current/bin:/home/gitpod/confluent-${CONFLUENT_VERSION}/bin:$PATH
