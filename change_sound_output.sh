#!/bin/bash

# find the non-default audio device
non_default_sink="$(pacmd list-sinks | grep 'index' | grep -v '*' | tr -dc 0-9)"

# change the default sink for new programs
pacmd set-default-sink "$non_default_sink"

# find all audio streams and move them to the new output device
pacmd list-sink-inputs | grep index | tr -dc '0-9\n' | while read input
do
	pacmd move-sink-input "$input" "$non_default_sink"
done
