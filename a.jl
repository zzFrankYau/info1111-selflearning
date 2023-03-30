using Plots #imports data visualisation library

println("please enter A to print 10 random numbers and B to plot 10 random numbers ") #prints line
selection = readline() #takes input
x = 1:10 #range 1-10
y = rand(10) #array of 10 random numbers

if selection == "A" #if A print the numbers - control flow
	println(y)
elseif selection == "B" #if B plot the numbers using the visualisation library
	plot(x,y) #uses Plots to plot x against y
end
