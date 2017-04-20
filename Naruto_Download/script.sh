clear
echo "----------------------------------------"
echo "--- Telechargement episode de Naruto ---"
echo "----------------------------------------"

episode=$1

echo "Telechargement de l'episode n°$episode"

curl "http://www.univers-animesi.com/naruto/naruto-episode-$episode-vf-en-ddl-streaming-rutube-francais" > tmp.html

lien=`grep -o 'src="//sendvid.com/embed/.*" frameborder="0"' tmp.html`

lien_telechargement=`echo $lien | cut -d'/' -f5 | cut -d'"' -f1`

#http://4.sendvid.com/lmxptaeh.mp4?t=1491391339&h=a6b987ad474dff56626295b18aacc0cd1d0587be
echo "Episode trouvé : http://3.sendvid.com/$lien_telechargement.mp4"
wget http://3.sendvid.com/$lien_telechargement.mp4

titre=`grep -o '<span style="color: #ff6600;"><strong>.*</strong></span>' tmp.html | cut -d'>' -f3 | cut -d'<' -f1`

echo "mv $lien_telechargement.mp4 $titre.mp4"
mv $lien_telechargement.mp4 "$titre.mp4"

echo "---------------------------------"
echo "--- Fin du téléchargement !!! ---"
echo "---------------------------------"
