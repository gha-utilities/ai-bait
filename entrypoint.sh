#!/usr/bin/env bash


#
# See https://github.com/bash-utilities/failure for updates of following function
#


# Bash Trap Failure, a submodule for other Bash scripts tracked by Git
# Copyright (C) 2023  S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


## Outputs Front-Mater formatted failures for functions not returning 0
## Use the following line after sourcing this file to set failure trap
##    trap 'failure "LINENO" "BASH_LINENO" "${?}"' ERR
failure(){
	local -n _lineno="${1:-LINENO}"
	local -n _bash_lineno="${2:-BASH_LINENO}"
	local _code="${3:-0}"

	## Workaround for read EOF combo tripping traps
	if ! ((_code)); then
		return "${_code}"
	fi

	local -a _output_array=()
	_output_array+=(
		'---'
		"lines_history: [${_lineno} ${_bash_lineno[*]}]"
		"function_trace: [${FUNCNAME[*]}]"
		"exit_code: ${_code}"
	)

	if [[ "${#BASH_SOURCE[@]}" -gt '1' ]]; then
		_output_array+=('source_trace:')
		for _item in "${BASH_SOURCE[@]}"; do
			_output_array+=("  - ${_item}")
		done
	else
		_output_array+=("source_trace: [${BASH_SOURCE[*]}]")
	fi

	_output_array+=('---')
	printf '%s\n' "${_output_array[@]}" >&2
	exit "${_code}"
}
trap 'failure "LINENO" "BASH_LINENO" "${?}"' ERR
set -Ee -o functrace

_destination_directory="$(dirname "${INPUT_DESTINATION:?Undefined destination}")"
if ! [[ -d "${_destination_directory}" ]]; then
	mkdir -vp "${_destination_directory}"
fi

dd if=/dev/zero bs="${INPUT_BS:?Undefined BS}" count="${INPUT_COUNT:?Undefined count}" |
	zip "${INPUT_DESTINATION}" -

# vim: noexpandtab
