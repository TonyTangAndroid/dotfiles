export VISUAL=vim
export EDITOR="$VISUAL"

names () {
	git --no-pager diff `arc which $1 --show-base`..HEAD --name-only
}

function ad() {
    git  diff `arc which --show-base`..HEAD $@
}
function adstack() {
    branch=$1
    shift
    git  diff `arc which $branch --show-base`..HEAD $@
}

function patch(){
  arc patch $1;
  git branch -m $2;
}

# Reset soft
function reset(){
target=$1
git reset --soft HEAD~${target}
}

# Upgrade gradle 
function gwu(){
target=$1
./gradlew wrapper --gradle-version=${target} --distribution-type=bin
}

# Buck install and run
function bwrun(){
app=$1
./buckw install -r ${app}
}

function gdel(){
branchName=$1
git branch -D ${branchName}
}

# Buck install and run
function bwtest(){
target=$1
./buckw test ${target} --code-coverage
}

# skip files
function skip(){
git update-index --skip-worktree "$@"
git status
}

# skip files
function unskip(){
git update-index --no-skip-worktree "$@"
git status
}

function adupl(){
target=$1
arc diff --update ${target} --plan-changes --nojira HEAD^
}

# Update a diff
function adu(){
target=$1
arc diff --update ${target} --nolint  HEAD^
}

# Update a diff
function adul(){
target=$1
arc diff --update ${target} HEAD^
}

# Update a diff
function adupls(){
target=$1
arc diff --update --nojira ${target} --plan-changes
}

#patch first commit against head
function patch_first(){
target=$1
git format-patch -1 HEAD -o ${target}
}

#rebase on header
function rebase(){
target=$1
git rebase -i HEAD~${target}
}

# Created a squashed diff
function poc(){
target=$1
arc diff --create --nolint --nojira --plan-changes ${target}
}

# Upload a squashed diff
function pod(){
target=$1
arc diff --update ${target} --nolint --nojira --plan-changes 
}

alias adcp='arc diff --create --nolint --plan-changes HEAD^ --nojira'
alias adcpl='arc diff --create --plan-changes HEAD^ --nojira'
alias preview='arc diff --only --nolint HEAD^ --nojira'
alias adcps='arc diff --create --plan-changes --nojira'

alias amend='gaa && git commit --amend --no-edit'
alias bad='git bisect bad'
alias bw=./buckw
alias bwb='bw build '
alias bwp='./buckw project'

alias check='git ls-files -v|grep '\''^S'\'
alias cmt='git commit -m'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fixbuck='rm -rf buck-out'
alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gamscp='git am --show-current-patch'
alias gap='git apply'
alias gapa='git add --patch'
alias gapt='git apply --3way'
alias gau='git add --update'
alias gav='git add --verbose'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbase='git rebase'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbort='git rebase --abort'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gcm='git checkout main'
alias gcml='git checkout main && git pull'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfg='git ls-files | grep'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpur=ggu
alias ggpush='git push origin "$(git_current_branch)"'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=%h)'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias globurl='noglob urlglobber '
alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
alias glods='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\''--stat'
alias glp=_git_log_prettily
alias glum='git pull upstream $(git_main_branch)'
alias gm='git merge'
alias gma='git merge --abort'
alias gmend='git commit --amend -m'
alias gmom='git merge origin/$(git_main_branch)'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias good='git bisect good'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gpoat='git push origin --all && git push origin --tags'
alias gpristine='git reset --hard && git clean -dffx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbs='git rebase --skip'
alias grc='git rebase --continue'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grev='git revert'
alias grh='git reset --hard'
alias grhh='git reset --hard'
alias grm='git rebase main'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias grn='git branch -m '
alias groh='git reset origin/$(git_current_branch) --hard'
alias grom='git rebase origin/main'
alias gfom='git fetch origin main'
alias gromxo='git rebase origin/main -Xours'
alias gromxt='git rebase origin/main -Xtheirs'
alias gromb='git rebase origin/main '
alias gromi='git rebase origin/main -i'
alias gromp='gpl & grom'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gskip='git rebase --skip'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='git stash --include-untracked'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gupv='git pull --rebase -v'
alias gw=./gradlew
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias killb='./buckw killall'
alias md='mkdir -p'
alias prev='git checkout -'
alias stash='git stash'
alias stash_apply='git stash apply'
alias stash_pop='git stash pop'
alias 1022='git checkout @~1022 -b main_1022'
alias reset_folder="git restore -s@ -SW  -- "
alias df="./buckw run diffready --"
alias dff="./buckw run diffready -- --filters"
alias dfl="./buckw run diffready -- --list"
alias dfv="./buckw run diffready -- --version"
alias dfh="./buckw run diffready -- --help"
alias dft="./buckw run diffready -- --filters test_release"

alias bgrep="git branch --all | grep "
alias gbDA="git branch | grep -v "tonytang" | xargs git branch -D"
alias bk='./buckw kill'

alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | cut -d'-' -f1-2"
