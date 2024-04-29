#!/bin/bash

get_data() {
	student_id=$1
	if [ -f student_data.json ]; then
		final_grade=$(jq -r ".[\"$student_id\"].final_grade" student_data.json)
		grade_letter=$(jq -r ".[\"$student_id\"].grade_letter" student_data.json)
		echo "$final_grade $grade_letter"
	else
		echo "Error: cannot find id"
		exit 1
	fi
}

if [ $# -eq 0 ]; then
	read -p "Enter student id: " student_id
	get_data "$student_id"
else
	for student_id in "$@"; do
		get_data "$student_id"
	done
fi

