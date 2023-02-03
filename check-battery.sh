#!/bin/bash
version=1.5

teunjojoApi="teunjojo-api.sh"
[ ! -f $teunjojoApi ] && curl -s -o $teunjojoApi https://files.teunjojo.com/teunjojo-updater/latest/teunjojo-api.sh && chmod +x $teunjojoApi
source $teunjojoApi quiet

dir="/sys/class/power_supply"
dir=$dir$(cd $dir && ls | grep 'BAT')
files=( "$dir/charge_full"  "$dir/charge_full_design" "$dir/charge_now" )
for i in "${files[@]}"
do
  [ ! -f "$i" ] && echo 'Device not supported!' && exit 1
done

[ ! -d "$filesDir" ] && mkdir -p "$filesDir"
[ ! -f "$cache" ] && touch "$cache"
source $cache

[ -z "$battLow" ] && echo '# At which value the battery is considered to be low' >> $conf && echo battLow=20 >> $conf
[ -z "$reported" ] && echo reported=0 >> $cache
source $conf
source $cache

charge_full=$(cat "$dir/charge_full")
charge_now=$(cat "$dir/charge_now")
percentage=$(awk -vn="$charge_now" -vm="$(awk -vn="$charge_full" 'BEGIN{print(n/100)}')" 'BEGIN{printf("%.0f\n",n/m)}')

[[ $percentage -gt 100 ]] && percentage=100

if [ "${percentage}" -lt "$battLow" ]; then
  [ "$reported" != 1 ] && pushover "Battery low!" "Battery is at $percentage%25" && cache reported 1
else
cache reported 0
fi
