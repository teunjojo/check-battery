# check-battery
Shell script that send a Pushover notification when the battery is low

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Add the script to your cronjob file
    - Execute 
    ```bash
    crontab -e
    ```
    - Add line `* * * * * /path/to/script.sh` to the file (This executes the script every minute)
    - Save the file
