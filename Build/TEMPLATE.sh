#!/bin/zsh

echo "What is your essay's working title?"
read NAME
mkdir /Users/will/Dropbox/zettelkasten/Writing/Active/$NAME
cd /Users/will/Dropbox/zettelkasten/Writing/Active/$NAME
mkdir _drafts
mkdir _research
mkdir _images
mkdir _stage
# cp /Users/will/Dropbox/zettelkasten/Writing/Tools/TEMPLATE.sh .
cp /Users/will/Dropbox/zettelkasten/Writing/Tools/Templates/template.md $NAME.md
# cp /Users/will/Dropbox/zettelkasten/Writing/Tools/mla.csl .
touch README.markdown
# touch scratch-$NAME.md
cp /Users/will/Dropbox/zettelkasten/Writing/Tools/Makefile .
#cp ~/.pandoc/vc-git.awk .
touch .gitignore
echo ".DS_Store" >> .gitignore
# echo "vc.tex" >> .gitignore
echo "_stage" >> .gitignore
cat .gitignore
git init
git add * .gitignore
git commit -m "initial commit"
# vc