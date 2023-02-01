This is a dockerfile and compose setup to run [atlascloud-backup](https://bitbucket.org/addcraftio/atlascloud-backup/src/master/).

> **atlascloud-backup**
>
> This is a tool to manage backups of your Jira & Confluence Atlassian Cloud instances. It downloads and manages backups of your cloud instances, provides monitoring using Opsgenie and helps with reporting and other monitoring integrations.

## Setup

Steps to go:

1. Clone the project repository
2. Copy `config.yml.dist` to `config.yml` and configure it to your liking:
   1. Add all the sites you want to back up
   2. How many backups to retain, dont change the location of the backups here. (Or you know what you are doing inside the container)
   3. create a backup directory on the host and map this folder in the docker compose file
   4. start the docker compose with `docker compose up`
   5. check the logs with docker `compose logs -f`
   6. if setup is worlking create a cronjob to run the backup `docker compose -f /path/to/the/docker-compose.yml up -d`

By default the container always starts a backup job but you could also use it to the the backups or rotate them. Do so by running the normal atlascloud-backup command with docker compose in the /app directory of the container.

```shell
   docker compose run atlascloud-backup node . create
   docker compose run atlascloud-backup node . create --verbose
   docker compose run atlascloud-backup node . rotate
   docker compose run atlascloud-backup node . rotate --dryrun
   docker compose run atlascloud-backup node . assert-status
   docker compose run atlascloud-backup node . ops-heartbeat
```
   