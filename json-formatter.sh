#!/bin/bash

format() {
	local file="$1"
	local temp=`mktemp -u`
	cp "$file" "$temp"
	python2 -m json.tool <"$temp" >"$file"
	rm -f "$temp"
}

main() {
	local files="$@"

	for f in ${files}; do
		format "$f"
	done
}

main $@
