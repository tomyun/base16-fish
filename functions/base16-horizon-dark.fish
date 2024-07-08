# base16-fish (https://github.com/tomyun/base16-fish)
# based on base16-shell (https://github.com/chriskempson/base16-shell)
# Horizon Dark scheme by Michaël Ball (http://github.com/michael-ball/)

function base16-horizon-dark -d "Horizon Dark"
  set color00 1C/1E/26 # Base 00 - Black
  set color01 E9/3C/58 # Base 08 - Red
  set color02 EF/AF/8E # Base 0B - Green
  set color03 EF/B9/93 # Base 0A - Yellow
  set color04 DF/52/73 # Base 0D - Blue
  set color05 B0/72/D1 # Base 0E - Magenta
  set color06 24/A8/B4 # Base 0C - Cyan
  set color07 CB/CE/D0 # Base 05 - White
  set color08 6F/6F/70 # Base 03 - Bright Black
  set color09 $color01 # Base 08 - Bright Red
  set color10 $color02 # Base 0B - Bright Green
  set color11 $color03 # Base 0A - Bright Yellow
  set color12 $color04 # Base 0D - Bright Blue
  set color13 $color05 # Base 0E - Bright Magenta
  set color14 $color06 # Base 0C - Bright Cyan
  set color15 E3/E6/EE # Base 07 - Bright White
  set color16 E5/8D/7D # Base 09
  set color17 E4/A3/82 # Base 0F
  set color18 23/25/30 # Base 01
  set color19 2E/30/3E # Base 02
  set color20 9D/A0/A2 # Base 04
  set color21 DC/DF/E4 # Base 06
  set colorfg $color07 # Base 05 - White
  set colorbg $color00 # Base 00 - Black

  if test -n "$TMUX"
    # Tell tmux to pass the escape sequences through
    # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
    function put_template; printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $argv; end;
    function put_template_var; printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $argv; end;
    function put_template_custom; printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $argv; end;
  else if string match 'screen*' $TERM # [ "${TERM%%[-.]*}" = "screen" ]
    # GNU screen (screen, screen-256color, screen-256color-bce)
    function put_template; printf '\033P\033]4;%d;rgb:%s\007\033\\' $argv; end;
    function put_template_var; printf '\033P\033]%d;rgb:%s\007\033\\' $argv; end;
    function put_template_custom; printf '\033P\033]%s%s\007\033\\' $argv; end;
  else if string match 'linux*' $TERM # [ "${TERM%%-*}" = "linux" ]
    function put_template; test $argv[1] -lt 16 && printf "\e]P%x%s" $argv[1] (echo $argv[2] | sed 's/\///g'); end;
    function put_template_var; true; end;
    function put_template_custom; true; end;
  else
    function put_template; printf '\033]4;%d;rgb:%s\033\\' $argv; end;
    function put_template_var; printf '\033]%d;rgb:%s\033\\' $argv; end;
    function put_template_custom; printf '\033]%s%s\033\\' $argv; end;
  end

  # 16 color space
  put_template 0  $color00
  put_template 1  $color01
  put_template 2  $color02
  put_template 3  $color03
  put_template 4  $color04
  put_template 5  $color05
  put_template 6  $color06
  put_template 7  $color07
  put_template 8  $color08
  put_template 9  $color09
  put_template 10 $color10
  put_template 11 $color11
  put_template 12 $color12
  put_template 13 $color13
  put_template 14 $color14
  put_template 15 $color15

  # 256 color space
  put_template 16 $color16
  put_template 17 $color17
  put_template 18 $color18
  put_template 19 $color19
  put_template 20 $color20
  put_template 21 $color21

  # foreground / background / cursor color
  if test -n "$ITERM_SESSION_ID"
    # iTerm2 proprietary escape codes
    put_template_custom Pg CBCED0 # foreground
    put_template_custom Ph 1C1E26 # background
    put_template_custom Pi CBCED0 # bold color
    put_template_custom Pj 2E303E # selection color
    put_template_custom Pk CBCED0 # selected text color
    put_template_custom Pl CBCED0 # cursor
    put_template_custom Pm 1C1E26 # cursor text
  else
    put_template_var 10 $colorfg
    if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]
      put_template_var 11 $colorbg
      if string match 'rxvt*' $TERM # [ "${TERM%%-*}" = "rxvt" ]
        put_template_var 708 $colorbg # internal border (rxvt)
      end
    end
    put_template_custom 12 ";7" # cursor (reverse video)
  end

  # set syntax highlighting colors
  set -g fish_color_autosuggestion 2E303E
  set -g fish_color_cancel -r
  set -g fish_color_command green #white
  set -g fish_color_comment 2E303E
  set -g fish_color_cwd green
  set -g fish_color_cwd_root red
  set -g fish_color_end brblack #blue
  set -g fish_color_error red
  set -g fish_color_escape yellow #green
  set -g fish_color_history_current --bold
  set -g fish_color_host normal
  set -g fish_color_match --background=brblue
  set -g fish_color_normal normal
  set -g fish_color_operator blue #green
  set -g fish_color_param 9DA0A2
  set -g fish_color_quote yellow #brblack
  set -g fish_color_redirection cyan
  set -g fish_color_search_match bryellow --background=2E303E
  set -g fish_color_selection white --bold --background=2E303E
  set -g fish_color_status red
  set -g fish_color_user brgreen
  set -g fish_color_valid_path --underline
  set -g fish_pager_color_completion normal
  set -g fish_pager_color_description yellow --dim
  set -g fish_pager_color_prefix white --bold #--underline
  set -g fish_pager_color_progress brwhite --background=cyan

  # remember current theme
  set -g base16_theme horizon-dark

  # clean up
  functions -e put_template put_template_var put_template_custom
end
