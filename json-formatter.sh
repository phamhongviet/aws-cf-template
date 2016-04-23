#!/bin/bash

format() {
	local file="$1"
	local temp=`mktemp -u`
	python2 -m json.tool <"$file" >"$temp" && \
	mv "$temp" "$file"
}

main() {
	local files="$@"

	for f in ${files}; do
		format "$f"
	done
}

main $@
