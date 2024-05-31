# Simple Klipper Backup Script
This is a very simple script that commits all configuration files from `~/printe_data/config` to a configured
repository when it runs.

> Note: this is a very simple script that has to be run manually. There are better solutions out there with more
> features like automated backups.

## Installation
Copy the contents of `git-backup.sh` into a file on your Raspberry Pi running Klipper, or clone this repository.
Then make the script executable with `chmod +x git-backup.sh`. Adjust the path to the file accordingly.

## Create a GitHub Token
Create a fine-grained token with the permissions for `Contents` set to `read and write`. Copy the token when 
it is displayed.

## Configure the Script
Edit the file and adjust the values for:
```
github_token="github_pat_11..."
github_user="ABC"
github_repository="voron-v2.XYZ"
```

## Run the Script
You have to run the script manually with `./git-backup.sh` to create a backup.