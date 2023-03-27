for Y in {2023..2023}
do
  mkdir $Y
  cd $Y
  for M in {2..2}
  do
    mkdir $M
    cd $M
    for D in {1..27}
    do
      dayofdate=$(date -d "$Y-$M-$D" '+%a');

      # if [ "Sun" == $dayofdate ]; then continue; fi
      # if [ "Sat" == $dayofdate ]; then continue; fi
      # if [ "Mon" == $dayofdate ]; then continue;
      # if [ "Tue" == $dayofdate ]; then continue;
      # if [ "Wed" == $dayofdate ]; then continue;
      # if [ "Thu" == $dayofdate ]; then continue;
      # if [ "Fri" == $dayofdate ]; then continue;

      mkdir $D
      cd $D
      for i in $(seq 1 $(($RANDOM%5)))
       do
	      echo "0$i on $M/$D/$Y" > commit.md
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:0$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:0$i:00"
        git add commit.md -f
        git commit --date="$Y-$M-$D 12:0$i:00" -m "0$i on $M $D $Y"
       done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push
git rm -rf 20**
git commit -am "cleanup"
git push