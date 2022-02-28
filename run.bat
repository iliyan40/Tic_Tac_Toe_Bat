@echo off
color C
title tic tac toe
set /a _x_wins=0
set /a _o_wins=0
set _color_red=[91m
set _color_blue=[94m
set _color_yellow=[93m
:start
cls
set /a _input_count=0
set _player_turn=X
set _player_turn_not=O
set _one= 
set _two= 
set _three= 
set _four= 
set _five= 
set _six= 
set _seven= 
set _eight= 
set _nine= 
:do_step
if %_input_count% GTR 8 goto start



echo  %_color_red%Type 'r' to restart the game.
echo  %_color_red%Type 'q' to close the game with saving win counts.
echo  %_color_yellow%Player X has won %_x_wins% time/s by now.
echo  %_color_yellow%Player O has won %_o_wins% time/s by now.
echo  %_color_red%It is now '%_player_turn%' player turn:
rem color changing symbol is ""

echo %_color_blue%
echo -----------
echo [%_color_yellow%%_seven%%_color_blue%] [%_color_yellow%%_eight%%_color_blue%] [%_color_yellow%%_nine%%_color_blue%]   --^>  [7] [8] [9]
echo [%_color_yellow%%_four%%_color_blue%] [%_color_yellow%%_five%%_color_blue%] [%_color_yellow%%_six%%_color_blue%]   --^>  [4] [5] [6]
echo [%_color_yellow%%_one%%_color_blue%] [%_color_yellow%%_two%%_color_blue%] [%_color_yellow%%_three%%_color_blue%]   --^>  [1] [2] [3]
echo -----------
goto check_winner

:choose_inputition
echo %_color_red%
set _input=`
set /p _input=choose position: %_color_yellow%
echo %_color_yellow%
rem  ->  if "%_one%"==" " 

if %_input% == 1 if "%_one%"==" " (
	set _one=%_player_turn%
	goto switch_players
)
if %_input% == 2 if "%_two%"==" " (
	set _two=%_player_turn%
	goto switch_players
)
if %_input% == 3 if "%_three%"==" " (
	set _three=%_player_turn%
	goto switch_players
)
if %_input% == 4 if "%_four%"==" " (
	set _four=%_player_turn%
	goto switch_players
)
if %_input% == 5 if "%_five%"==" " (
	set _five=%_player_turn%
	goto switch_players
)
if %_input% == 6 if "%_six%"==" " (
	set _six=%_player_turn%
	goto switch_players
)
if %_input% == 7 if "%_seven%"==" " (
	set _seven=%_player_turn%
	goto switch_players
)
if %_input% == 8 if "%_eight%"==" " (
	set _eight=%_player_turn%
	goto switch_players
)
if %_input% == 9 if "%_nine%"==" " (
	set _nine=%_player_turn%
	goto switch_players
)
if "%_input%" == "r" (
	goto start
)
if "%_input%" == "q" (
	echo ----[History]----       > logs.txt
	echo        \ /             >> logs.txt
	echo X wins: %_x_wins%    >> logs.txt
	echo O wins: %_o_wins%    >> logs.txt
	exit
)
:ask_again
echo %_color_red%Incorrect position. Please select a valid and free position (1-9).
pause
cls
goto do_step

:switch_players
SET /a _input_count = %_input_count% + 1
if %_player_turn%==X (
SET _player_turn=O
SET _player_turn_not=X
) ELSE (
SET _player_turn=X
SET _player_turn_not=O
)
cls
goto do_step
goto end

:check_winner
REM HORIZONTAL
if "%_one%" == "%_player_turn_not%" if "%_two%" == "%_player_turn_not%" if "%_three%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)
if "%_four%" == "%_player_turn_not%" if "%_five%" == "%_player_turn_not%" if "%_six%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)
if "%_seven%" == "%_player_turn_not%" if "%_eight%" == "%_player_turn_not%" if "%_nine%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)

REM VERTICAL
if "%_one%" == "%_player_turn_not%" if "%_four%" == "%_player_turn_not%" if "%_seven%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)
if "%_two%" == "%_player_turn_not%" if "%_five%" == "%_player_turn_not%" if "%_eight%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)
if "%_three%" == "%_player_turn_not%" if "%_six%" == "%_player_turn_not%" if "%_nine%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)

REM diagonal
if "%_one%" == "%_player_turn_not%" if "%_five%" == "%_player_turn_not%" if "%_nine%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)
if "%_seven%" == "%_player_turn_not%" if "%_five%" == "%_player_turn_not%" if "%_three%" == "%_player_turn_not%" (
	echo %_color_yellow%%_player_turn_not% wins!
	pause
	cls
	goto add_win_count
)
goto choose_inputition

:add_win_count


if "%_player_turn_not%%" == "X" (
	SET /a _x_wins = %_x_wins% + 1
)
if "%_player_turn_not%" == "O" (
	SET /a _o_wins = %_o_wins% + 1
)
echo ----[History]----       > logs.txt
echo        \ /             >> logs.txt
echo X wins: %_x_wins%    >> logs.txt
echo O wins: %_o_wins%    >> logs.txt

goto start


:end
pause
