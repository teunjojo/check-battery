[![button](https://files.teunjojo.com/theme/download-button.svg)](https://files.teunjojo.com/download.php?file=check-battery)
<br><img src="https://img.shields.io/badge/dynamic/json?color=informational&label=version&prefix=v&query=%24.version&url=https%3A%2F%2Ffiles.teunjojo.com%2Flatest.php%3Frepo%3Dcheck-battery%26data_type%3Djson">
# check-battery
Shell script that send a Pushover notification when the battery is low

## installation
1. [Set up Pushover](https://support.pushover.net/i7-what-is-pushover-and-how-do-i-use-it)
2. Add the script to your cronjob file
    - Execute `crontab -e`
    - Add line `* * * * * /path/to/script.sh` to the file (This executes the script every minute)
    - Save the file
