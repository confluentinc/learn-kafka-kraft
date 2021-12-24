# template-confluent-cli
Template repo for a lab environment with confluent and ccloud CLIs installed. This is meant to provide a minimal, 0-setup, 1-click experience with Confluent.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/chuck-confluent/template-confluent-cli)

## Create a New Repo from Template

1. Click "Use this Template" to create a new repo
2. Change the URL for the "Open in Gitpod" button above

## Features

- Uses Gitpod's default "workspace-full" ubuntu workspace, which includes [a lot of stuff](https://github.com/gitpod-io/workspace-images/blob/master/full/Dockerfile)
  - We could probably slim the image by customizing on top of gitpod/workspace-base. This would decrease image pull time.
- confluent and ccloud CLIs installed, in PATH, with autocompletion
- Confluent Platform installed at /home/gitpod/confluent-${CONFLUENT_VERSION}, with all binaries in PATH (e.g. kafka-console-producer, perf tests, kafka-cluster-links, etc)
- On launch, `confluent local services start` starts all confluent services
- On launch, two datagen source connectors are automatically started

What other features would you like to see? File an issue or make a pull request.

## Video Demonstration

[![video demo of confluent cloud based labs using gitpod](https://img.youtube.com/vi/zKdSxNIPv50/0.jpg)](https://youtu.be/zKdSxNIPv50_0)

## Gitpod Docs

Here are a few of the most helpful Gitpod docs when you want to create your own labs:
- https://www.gitpod.io/docs/getting-started
- .gitpod.yml, where the gitpod magic happens: https://www.gitpod.io/docs/config-gitpod-file
  - full reference: https://www.gitpod.io/docs/references/gitpod-yml
- Prebuilds https://www.gitpod.io/docs/prebuilds
  - especially this diagram that shows what tasks run on prebuild vs on launch: https://www.gitpod.io/docs/config-start-tasks#prebuild-and-new-workspaces
- Using a custom docker image: https://www.gitpod.io/docs/config-docker#custom-docker-image
- Reference for the `gp` CLI tool: https://www.gitpod.io/docs/command-line-interface
  - this CLI is used for things like synchronizing tasks, setting secure user-level environment variables, getting information about the workspace, etc

If you want to dig into the different workspace images Gitpod offers, see
- https://github.com/gitpod-io/workspace-images

Different Confluent examples that use Docker Compose inside of Gitpod:
- A Kafka tutorial: https://github.com/chuck-alt-delete/kafka-tutorial-with-gitpod (relatively simple)
- CP Demo: https://github.com/confluentinc/cp-demo/blob/6.2.1-post/.gitpod.yml (more complex)
