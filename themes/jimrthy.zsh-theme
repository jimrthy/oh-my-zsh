#function collapse_pwd {
   #echo $(pwd | sed -e "s,^$HOME,~,")
#}

# Q: What are the odds that these screwy characters work OK in my prompt?
# A: Depends on whether I'm using a term that supports Unicode.
# Just use urxvt
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '�' && return
    hg root >/dev/null 2>/dev/null && echo '�' && return
    echo '� '

    # This definitely isn't what I want for the next 2. But this part
    # works.

    # mercurial repository
    # original - bad symbols
    # (shows the accented a w/ upside-down question mark)
    #hg root >/dev/null 2>/dev/null && echo 'â¿' && return
    # character out of range
    #hg root >/dev/null 2>/dev/null && echo '\u263f' && return
    #hg root >/dev/null 2>/dev/null && echo '?' && return
    
    # Plain prompt
    # original - shows an accented a
    #echo 'â'
    # should be alt-code for black circle on white background
    # character out of range
    #echo '\u25cb'
    #echo '>'
}

# This breaks my right git prompt. Forget about it for now.
function hg_prompt_info {
   hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

USER='%{fg[blue]%}%n@%M%{$reset_color%}'
#LOCATION=' at %{fg[green]%}(collapse_pwd)%{reset_color%}
LOCATION=' at %{fg[green]%}${PWD/#$HOME/~}%{reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#PROMPT='
#$USER$LOCATION
#$(prompt_char) '

PROMPT='
%{$fg[blue]%}%n@%M%{$reset_color%} at %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}
$(prompt_char) '

# This breaks my right git prompt. Forget about it for now.
# This isn't working. Why not?
#RPROMPT='$(hg_prompt_info)$(git_prompt_info)'
RPROMPT='$(git_prompt_info)'
