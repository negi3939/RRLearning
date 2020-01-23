set term postscript enhanced eps color solid

set key reverse Left top outside spacing 2.7 at screen 0.8,0.98
#set size 0.7,1.0

set lmargin 10
set rmargin 10
set tmargin 7
set bmargin 5
#set size square

set style line 1 linecolor rgbcolor "#FF0000" # 
set style line 2 linecolor rgbcolor "#BF0040" #
set style line 3 linecolor rgbcolor "#7F0080" # 
set style line 4 linecolor rgbcolor "#4F00C0" # 
set style line 5 linecolor rgbcolor "#0000FF" # 
set style line 6 linecolor rgbcolor "#007788" # 
set style line 7 linecolor rgbcolor "#00FF00" #
set style line 11 linecolor rgbcolor "#0000FF" #
set style line 12 linecolor rgbcolor "#0040BF" #
set style line 13 linecolor rgbcolor "#00807F" #
set style line 14 linecolor rgbcolor "#00BF00" #
set style line 15 linecolor rgbcolor "#F08090" #
set style line 16 linecolor rgbcolor "#9080F0" #
set style line 17 linecolor rgbcolor "#F08090" #
set style line 9 linecolor rgbcolor "#909090" #black
set linestyle 10 lt 0 linecolor rgbcolor "#707070" #


lastx=0.0
lasty=0.0
differ(x,y) = (dy=y-lasty, dx=x-lastx, lasty=y, lastx=x,dy/dx)
lastxint=0.0
lastyint=0.0
integraly = 0.0
integral(x,y) = (dx=x-lastxint, lastyint=y,integraly=integraly+y*dx,integraly)   
nearint(x)=(x - floor(x) <= 0.5 ? floor(x) : floor(x)+1)
filter(x,y)=nearint(x/y)*y

inertiaofmoment(a0,a1,a2,a3,s02) = J1 + J2 + P1*P1*M1 + ((L1*cos(a0)+P2*cos(a0+a1))*(L1*cos(a0)+P1*cos(a0+a1))+(L1*sin(a0)+P2*sin(a0+a1))*(L1*sin(a0)+P2*sin(a0+a1)))*M2


###################################################
filePR = "rpre.dat"
fileAR = "r.dat"
###################################################
set output "reward.eps"
set xrange[0:900]

set ylabel "{/Times=30 Sum of reward  }"
set xlabel "{/Times=30 Time {/Times-Italic } }"
set zeroaxis
#set label 1 at screen 20,0.4 "{/Times=22 first over unstable equilibrium point}"

plot \
filePR u ($1):($2) w l title "{/Times=22 intitial}",\
fileAR u ($1):($2) w l title "{/Times=22 optimized}",\
#fileA05 u 1:4


