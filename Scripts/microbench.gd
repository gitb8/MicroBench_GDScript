extends Control

# set run repetitions:
const RUNS: int = 65536

# set variables for bench:

#var a: int = 0


func _ready() -> void:
	var start: int
	var end: int
	var first: int
	var second: int
	
	# set local variables for bench:
	
	var a: int = 0
	
	
	start = Time.get_ticks_usec()
	for __ in RUNS:
		# run 1
		
		a += 1
#		a += 2		# reverse test
		
		# bench functions
		func1()
#		func2()		# reverse test
	
	end = Time.get_ticks_usec()
	first = end - start
	
	# reset bench variables:
	
	a = 0
	
	
	start = Time.get_ticks_usec()
	for __ in RUNS:
		# run 2
		
		a += 2
#		a += 1		# reverse test
		
		# bench functions
		func2()
#		func1()		# reverse test
	
	end = Time.get_ticks_usec()
	second = end - start
	
	# labels as nanoseconds
#	$first.text = "1st: %f ns" %(first as float / RUNS as float * 1000.0)
#	$second.text = "2st: %f ns" %(second as float / RUNS as float * 1000.0)
	
	# labels as microseconds
	$first.text = "1st: %f µs" %(first as float / RUNS as float)
	$second.text = "2st: %f µs" %(second as float / RUNS as float)
	
	# labels as milliseconds
#	$first.text = "1st: %f ms" %(first as float / RUNS as float / 1000.0)
#	$second.text = "2st: %f ms" %(second as float / RUNS as float / 1000.0)
	
	# labels as seconds
#	$first.text = "1st: %f s" %(first as float / RUNS as float / 1.0e6)
#	$second.text = "2st: %f s" %(second as float / RUNS as float / 1.0e6)


# add functions for bench:

func func1() -> void: pass		# demo function

func func2() -> void: pass		# demo function
