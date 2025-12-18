-module(dev_console).
-export([print/2]).

%%----------------------------------------------------
%% Public API
%% print(Term, Color)
%% Color 可以是以下 atom:
%%   black | red | green | yellow | blue | magenta | cyan | white | default
%%----------------------------------------------------

print(Term, Color) ->
    ColorCode = color_code(Color),
    Reset = "\e[0m",
    io:format("~s~ts~s~n", [ColorCode, io_lib:format("~p", [Term]), Reset]).

%%----------------------------------------------------
%% Color Lookup
%%----------------------------------------------------
color_code(black)   -> "\e[0;30m";
color_code(red)     -> "\e[0;31m";
color_code(green)   -> "\e[0;32m";
color_code(yellow)  -> "\e[0;33m";
color_code(blue)    -> "\e[0;34m";
color_code(magenta) -> "\e[0;35m";
color_code(cyan)    -> "\e[0;36m";
color_code(white)   -> "\e[0;37m";
color_code(default) -> "\e[0m";
color_code(_)       -> "\e[0m".
