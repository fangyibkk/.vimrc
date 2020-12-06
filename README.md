# Standalone .vimrc
My standalone .vimrc file

## Quick Installation
Just download and overwrite
```
$ curl https://raw.githubusercontent.com/fangyibkk/.vimrc/master/.vimrc > ~/.vimrc
```

## Tips
Show special char like tab
```
set list
set unlist
```
paste in command mode
```
CTRL+R 0
// register 0
```
## Visual mode replace
would like to replace content in for example `{}`, `[]`, `""` \
**Problem**: `ci{` will yank and override the copied word in register \
**Solution**: use visual mode to select `vi{` then paste the content in the register

## Delete until
`dt,` delete until `,` \
`df,` delete until `,` including ',' \
`dT,` delete backward until `,` \
`dF,` delete backward until `,` including ','

## Insert mode editing
`Ctrl-h` replace backspace
`Ctrl-w` replace delete word backword
