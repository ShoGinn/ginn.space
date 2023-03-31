---
# Documentation: https://wowchemy.com/docs/managing-content/

title: 'Contabo Cloud Virtual Private Server (VPS)'
subtitle: 'How I set up my Contabo VPS to host a Discord.js bot'
summary: 'How I set up my Contabo VPS to host a Discord.js bot'
authors: []
tags:
  - Cloud
  - Discord
  - Docker
  - Linux
  - NODE
  - VPS
categories:
  - FAQ
  - VPS
date: 2023-03-30T20:45:16-04:00
lastmod: 2023-03-30T20:45:16-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ''
  focal_point: ''
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

## Introduction

Welcome to this post about setting up a Contabo VPS for hosting a Discord bot! This is not a fully inclusive FAQ, but rather a brag on the affordability and ease of use of Contabo's virtual private servers. Contabo offers some of the most competitive prices in the VPS market, making it a great choice for hosting personal projects such as Discord bots.

In this post, we'll briefly go over the steps to set up your Contabo VPS with Docker and deploy your Discord bot using a Git repository. We hope to post more blog posts like this in the future, going deeper into the Dockerfile setup and explaining why Docker Compose is awesome.

## Setting up a Contabo VPS for Hosting a Discord Bot

If you're looking for an affordable and reliable virtual private server (VPS) for hosting your Discord bot, the Contabo VPS is an excellent choice. In this post, we'll walk you through the steps to set up your Contabo VPS with Debian, Docker, and your Discord bot.

## Step 1: Purchase and Set Up your Contabo VPS

The first step is to purchase your Contabo VPS plan and set it up with Debian as your operating system. Once you've done this, you'll need to log in to your VPS using SSH.

Contabo sets up your VPS with a root user by default, and with that root user you should get your VPS all setup and ready to go. I recommend setting up a non-root user for your bot, which will be covered in step 3.

## Step 2: Install Docker

Next, you'll need to install Docker on your Contabo VPS. Docker is a containerization platform that allows you to run your Discord bot in an isolated environment. Here's how to install Docker on your Contabo VPS:

```bash
sudo apt-get update
sudo apt-get install docker.io
```

## Step 3: Create a new User for your Discord Bot

For security reasons, it's a good idea to create a user specifically for your Discord bot. This way, you can limit the permissions of this user and prevent any potential security breaches. Here's how to create a user on your Contabo VPS:

```bash
sudo adduser discord-bot
```

Once you do that you need to add the user to the docker group so it can run docker commands without sudo.

```bash
sudo usermod -aG docker discord-bot
```

An advanced feature is to setup ssh keys for your bot user. This will allow you to login to your bot user without a password. This is a good idea if you want to use a CI/CD pipeline to deploy your bot.

This is a good guide on how to do that: [How To Set Up SSH Keys on Debian 10](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-debian-10)

## Step 4: Set Up your Git Repository

To deploy your Discord bot to your Contabo VPS, you'll need to create a Git repository containing your bot's code, a Dockerfile, and a docker-compose.yml file.

The Dockerfile should contain the necessary steps to build your bot's image, while the docker-compose.yml file should define how to run your bot as a Docker container.

Once you have your Git repository set up, you can clone it onto your Contabo VPS using the following command:

```bash
git clone https://github.com/your-username/your-repository.git
```

## Step 5: Build and Run your Discord Bot

Once you've cloned your Git repository, you can build your Discord bot's Docker image using the following command:

```bash
docker-compose build
```

And then start your bot's Docker container using:

```bash
docker-compose up -d
```

This will start your bot's container in detached mode, which means it will continue running in the background.

## Conclusion

That's it!

With these simple steps, you can set up a Contabo VPS with Docker and deploy your Discord bot using a Git repository.

By using Docker, you can ensure that your bot is running in an isolated and secure environment, and by using a Git repository, you can easily update your bot's code and configuration.

If you are interested in checking them out here is a direct link (none of that affiliate stuff): [Contabo](https://contabo.com/?show=vps)

Good luck with your bot!
