

src="${BASH_SOURCE[0]}"
src_full=$(realpath "$src")
src_dir="${src_full%/*}"

. "${src_dir}/ns-clone.aliases"
ec0=$?

export PATH="${src_dir}:${PATH}"
which ns-clone 1>/dev/null 2>/dev/null
ec1=$?

. "${src_dir}/ns-clone.paths"
ec2=$?

. "${src_dir}/ns-clone.aliases"
ec3=$?

has_ns_shell_pid=0
if [[ -z "$NS_SHELL_PID" ]]; then
    . ns init
fi
if [[ -n "$NS_SHELL_PID" ]]; then
    has_ns_shell_pid=1
fi


((ec=ec0+ec1+ec2+ec3+has_ns_shell_pid))

if [[ $ec -eq 0 ]]; then
    export NS_CLONE_VERSION=0.1
else
    echo "${src_dir}/ns-clone.profile script was unable to run every required setup command successfully" 1>&2
    return 1
fi
