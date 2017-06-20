# hooks

## prepare-commit-msg

Install hook example:
> Copy dir `hooks` into project directory.
> In dir `.git/hooks` create symlink `ln -s ../../hooks/prepare-commit-msg prepare-commit-msg`

You can add new new functionality via including `<fileYouNeed>.sh` in `<hookFile>` via `. "$DIR/hooks/<fileYouNeed>.sh""`
