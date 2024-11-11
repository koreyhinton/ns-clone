# `ns-clone`

The ns-clone command functions as a script manager for the dot namespacer (dot-ns) project.


## install ns-clone - dependencies

The following dependencies need to be installed first before attempting the install

- bash shell
- git

## install ns-clone - in bash shell

```sh
git clone https://github.com/koreyhinton/ns-clone.git

./ns-clone/ns-install
# To complete the install, either:
#     1) start a new shell session
# Or:
#     2) source the ns-clone.profile file for your current session
#            . ./ns-clone/ns-clone.profile
```

> Before running the install, be sure your current working directory is in a dedicated folder where there doesn't already exist a folder matching the ns-clone repository name

## `ns-clone` command usage - install dot-ns scripts

Run the ns-clone command by providing 2 arguments:

1. a namespace prefix argument
2. the remote git url

The cloned repository's dot-ns bash files will be aliased with the namespace prefix. E.g., add => `sv-add`.

```sh
ns-clone sv https://github.com/koreyhinton/sv.git
# To complete the install, either:
#     1) start a new shell session
# Or:
#     2) source the ns-clone.profile file for your current session
#            . ./ns-clone/ns-clone.profile
```

> Before running ns-clone, be sure your current working directory is in a dedicated folder where there doesn't already exist a folder matching the repository name (e.g., sv/)

> You can clone a dot-ns dependant repository without specifying a namespace, e.g., `ns-clone https://github.com/koreyhinton/sv.git`, but then sv's script filenames (add, print, etc) will likely clash with existing command names, so scripts without a namespace provided will only be executable by invoking the full dot-ns run syntax (e.g.,`. ns run add`). So, ideally only omit the namespace argument (ie: sv), if you don't need namespace-prefix invocation.

## run dot-ns scripts - use the namespace prefix

The ns-clone command will establish aliases for all of the dot-ns bash files. This syntactic sugar makes it easier to find the commands and invoke them by typing `{namespace}-`.

After cloning the sv repository, commands like `sv-add` and `sv-print` will be available.

You can read the scripts' first import line to see which input variables are needed (e.g., `sv_file`, `sv_*`), and after assigning those input variables you can invoke the script.

```sh
sv_file=files/foo.csv
sv_my_col_name=hello
sv-add
sv-print
```
