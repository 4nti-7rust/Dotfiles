### History stuff

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

### Variables

export EDITOR="gedit"

### Alias

alias root='sudo su'
alias reboot='sudo reboot'
alias halt='sudo halt'
#alias pacman="sudo pacman-color"

alias update='asciiart_update && arch_news && echo -e "\\e[01;31m> Mise à jour\\e[00m" && yaourt -Syua'
alias lupdate='asciiart_update && arch_news && echo -e "\\e[01;31m> Mise à jour\\e[00m" && yaourt -Sy && yaourt -S archlinux-keyring && yaourt -Syua'
alias remove='yaourt -Rcsn'

alias mpd_update='sh ~/script/mpd_update'
alias toggle='sh ~/script/toggle'
alias next='sh ~/script/next'
alias prev='sh ~/script/prev'

alias ping='ping -c 5'

alias msfconsole='/opt/metasploit/msfconsole'

alias nfc-list-tweak='sudo modprobe -r pn533_usb && sudo modprobe -r pn533 && sudo nfc-list'

alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'

# Reseau
alias tunnel='sh ~/script/tunnel.sh'
alias mpdtunnel='sh ~/script/mpdtunnel.sh'

# OTHER
alias nextbus='python2.7 ~/script/getNextBus.py'

### Comp stuff

for i in $(ls ~/script); do alias s_$i='sh ~/script/$i';done;
alias conky_panel='sh /home/antitrust/.scripts/Conky/conky'

### Window title

case $TERM in
    *xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
		precmd () { print -Pn "\e]0;[%n@%M][%~]%#\a" } 
		preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
	;;
    screen)
    	precmd () { 
			print -Pn "\e]83;title \"$1\"\a" 
			print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" 
		}
		preexec () { 
			print -Pn "\e]83;title \"$1\"\a" 
			print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" 
		}
	;; 
esac

## Other

#setopt extendedglob
#setopt correctall
#setopt interactivecomments

# try to avoid the 'zsh: no matches found...'
setopt nonomatch

# not just at the end
setopt completeinword

### Lancement reel de la console ici
echo ""
fortune
echo ""

##Cool functions
alias myip='curl ifconfig.me'

top_history () {history | sed -e 's/sudo //' | awk '{print $2}' | sort | uniq -c | sort -rg | head}

arch_news () {echo -e "\n\\e[01;31m> News Archlinux.fr\\e[00m\n$(curl --connect-timeout 2 -s https://archlinux.fr/feed | sed '/<title\|<pubDate/!d;s/\t*//g;s/<title>/ - /g;s/<\/title>//g;s/ [0-9]* [0-9]*:.*/\\e[00m/g;s/&#8217;/'"'"'/g;s/&#8211;//g;/Archlinux.fr/d;s/intervention manuelle/\\033[1;33mintervention manuelle\\e[00m/g;' | sed 'N;s/\n<pubDate>/ - \\033[1;34m/g;P;D;') \n"} #'

asciiart_update () {echo ''
echo -e "\\033[1;33m  | |   |  |- _ \\033[0;02m"
echo -e "\\033[1;33m  |_||)(|(||_(/_\\033[0;02m"
echo -e "\\033[1;33m     |          \\033[0;02m"}

# New stuff from alias.sh
alias sulast='su -c $(history -p !-1) root'
alias lns='ln -s'

alias subtitles="for i in ./*.mp4 ./*.avi ./*.mkv; do subliminal -l en -- $(realpath $i); subliminal -l fr -- $(realpath $i); done;"
