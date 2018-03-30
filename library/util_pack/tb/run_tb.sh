NAME=`basename $0`

mkdir -p run
mkdir -p vcd

for i in 4; do
	echo Testing $i Channels...
	iverilog ${SOURCE} -o run/run_${NAME}_${i} $1 \
		-P ${NAME}.NUM_OF_CHANNELS=${i} \
	|| exit 1
	(cd vcd; vvp -N ../run/run_${NAME}_${i})
done


