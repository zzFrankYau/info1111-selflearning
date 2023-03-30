using Plots; gr(); #imports data visualisation libraries

function calculate_winner(player, computer) #calculates and returns the winner of the exchange
	if(player == computer) #same so ties
		println("ties")
		return "tie"
	elseif(player == "paper" && computer == "rock") #paper beats rock
		println("player wins")
		return "player"
	elseif(player == "rock" && computer == "scissors") #rock beats scissors
		println("player wins")
		return "player"
	elseif(player == "scissors" && computer == "paper") #scissors beats paper
		println("player wins")
		return "player"
	else
		println("computer wins") #since player didnt win the computer must have to reach this point
		return "computer"
	end
end


function plot_graphs(wins) #gathers the data from the array passed into the function, and plots one of two graphs if selected
	player_wins = 0 #initilises local variables
	computer_wins = 0
	ties = 0
	win_trend = []
	win_percentage = 0
	for i in eachindex(wins) #loops through array
		if wins[i] == "tie" #if statements checks who won or tie
			ties += 1
		elseif wins[i] == "computer"
			computer_wins += 1
		else
			player_wins += 1
		end
		win_percentage = player_wins/i #updates win_percentage of the player
		push!(win_trend,win_percentage) #updates array
	end
	println("would you like to see A: winrate change over time or B: wincounts of each player? (A/B)")
	selection = readline()
	if selection == "A"
		plot(win_trend, kind="scatter", mode = "lines", title = "winrate change over time", xlabel="round", ylabel="winrate", legend = false) #scatter graph with connected lines
	elseif selection == "B"
		bar(["player", "computer", "tie"], [player_wins, computer_wins, ties], title = "Wincounts", xticks =:all, xrotation = 45, xlabel = "winner", ylabel = "win count", legend = false) #bar graph
	end
end

	
println("welcome to paper scissors rock!")
computer_choices = ["paper","scissors","rock"] #moveset of computer
win_record = []
while true #while true to keep looping until player chooses not to
	println("type paper, scissors, or rock")
	move = readline() #reads input
	computer_move = rand(1:3) #decides computers move
	print("paper  ")
	sleep(0.2) #waits for .2 seconds before carrying on
	print("scissors  ")
	sleep(0.2)
	println("rock!  ")
	sleep(0.2)
	if move == "paper" || move == "scissors" || move == "rock" #checks if move is legal
		println("$move vs $(computer_choices[computer_move])!!!") #outputs the matchup 
		winner = calculate_winner(move,computer_choices[computer_move]) #calls function to calculate winner
		push!(win_record,winner) #updates the win_record array
	end
	println("play again? (y/n)")
	check = readline()
	if check == "n" #if n, stop the while loop, else keep repeating (even if not y)
		break
	end
end

plot_graphs(win_record) #calls function, passing along the array win_record
