# Defining the statistics for Virat Kohli's ODI career
matches_played <- 283
average_runs <- 57.74
standard_deviation <- 30  
# Number of simulations
simulations <- 1000
# Simulate Virat Kohli's runs in ODI matches
set.seed(123)  
runs_simulated <- replicate(simulations, {
  runs <- rnorm(1, mean = average_runs, sd = standard_deviation)
  if (runs < 0) runs <- 0  # Ensure runs are non-negative
  round(runs)
})
# Calculated statistics from the simulations
average_runs_simulated <- mean(runs_simulated)
max_runs <- max(runs_simulated)
min_runs <- min(runs_simulated)
# Printing the results
cat("Simulated ODI Runs Statistics:\n")
cat(paste("Average Runs:", format(average_runs_simulated, digits = 2), "\n"))
cat(paste("Maximum Runs:", max_runs, "\n"))
cat(paste("Minimum Runs:", min_runs, "\n"))
