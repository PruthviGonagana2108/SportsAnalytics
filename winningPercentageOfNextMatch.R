matches <- data.frame(
  Date = c("23-Apr-08", "14-May-08", "18-Apr-09", "16-May-09", "25-Apr-10",
           "6-Apr-10", "25-Apr-10", "22-Apr-11", "4-Apr-12", "6-May-12", 
           "23-May-12", "6-Apr-13", "5-May-13", "21-May-13", "26-May-13",
           "25-Apr-14", "10-May-14", "28-May-14", "17-Apr-15", "8-May-15",
           "19-May-15", "24-May-15", "7-Apr-18", "28-Apr-18", "3-Apr-19",
           "26-Apr-19"),
  Venue = c("Chennai", "Mumbai", "Cape Town", "Port Elizabeth", "Mumbai", 
            "Chennai", "Navi Mumbai", "Mumbai", "Chennai", "Mumbai", 
            "Bangalore", "Chennai", "Mumbai", "Delhi", "Kolkata", 
            "Dubai", "Mumbai", "Mumbai", "Mumbai", "Chennai", 
            "Mumbai", "Kolkata", "Mumbai", "Pune", "Mumbai", 
            "Chennai"),
  Winner = c("CSK", "MI", "MI", "CSK", "MI", 
             "CSK", "CSK", "MI", "MI", "MI", 
             "CSK", "MI", "MI", "CSK", "MI",
             "CSK", "CSK", "CSK", "CSK", "MI",
             "MI", "MI", "CSK", "MI", "MI", 
             "MI"),
  Tournament = rep("IPL", 26)
)


csk_wins <- sum(matches$Winner == "CSK")
mi_wins <- sum(matches$Winner == "MI")

# Total matches
total_matches <- nrow(matches)

# Poisson distributions for each team's wins
lambda_csk <- csk_wins / total_matches
lambda_mi <- mi_wins / total_matches

# Simulating many future matches using the Poisson distributions
simulated_matches <- 10000
csk_simulated_wins <- rpois(simulated_matches, lambda_csk * total_matches) # Adjusting with total_matches
mi_simulated_wins <- rpois(simulated_matches, lambda_mi * total_matches)  # Adjusting with total_matches

# Counting how many times each team wins in the simulations
csk_future_wins <- sum(csk_simulated_wins > mi_simulated_wins)
mi_future_wins <- sum(mi_simulated_wins > csk_simulated_wins)

# Calculating winning probabilities
csk_probability <- csk_future_wins / simulated_matches
mi_probability <- mi_future_wins / simulated_matches

cat("Probability of CSK winning the next match:", csk_probability, "\n")
cat("Probability of MI winning the next match:", mi_probability, "\n")
