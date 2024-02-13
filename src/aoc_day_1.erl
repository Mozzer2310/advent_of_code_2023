-module(aoc_day_1).

-export([read_file/0, process_lines/1, process_line/1]).

-define(FILENAME, "include/day_1_input.txt").

read_file() ->
    {ok, Data} = file:read_file(?FILENAME),
    % new ✍️ line ✍️  represented ✍️  by ✍️  \n ✍️
    binary:split(Data, [<<"\n">>], [global]).

process_lines([]) ->
    [];
process_lines([Line | Rest]) ->
    FirstNum = process_line(binary_to_list(Line)),
    LastNum = process_line(lists:reverse(binary_to_list(Line))),
    io:format("~p~n", [FirstNum]),
    io:format("~p~n", [LastNum]),
    
    
    [0 | process_lines(Rest)].

process_line([]) ->
    ok;
% guards ✍️
% commas ✍️  dont ✍️  make ✍️  sense ✍️
process_line([H | _Rest]) when 48 =< H, H =< 57  ->
    (H - 48);
process_line([_H | Rest]) ->
    process_line(Rest).