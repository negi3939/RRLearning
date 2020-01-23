echo PLOT
gnuplot -e 'load "plotfigure.gnu"'
echo CONVERT TO PDF
for file in `\find *.eps -maxdepth 1 -type f`; do
   epstopdf $file
done
echo OPEN PDF
for file in `\find *.pdf -maxdepth 1 -type f`; do
   gnome-open $file
done
