matches <- data.frame(
  Date = c("23-Apr-08", "14-May-08", "18-Apr-09", "16-May-09", "25-Apr-10", "6-Apr-10", "25-Apr-10", 
           "22-Apr-11", "4-Apr-12", "6-May-12", "23-May-12", "6-Apr-13", "5-May-13", "21-May-13", 
           "26-May-13", "25-Apr-14", "10-May-14", "28-May-14", "17-Apr-15", "8-May-15", "19-May-15",
           "24-May-15", "7-Apr-18", "28-Apr-18", "3-Apr-19", "26-Apr-19"),
  Venue = c("Chennai", "Mumbai", "Cape Town", "Port Elizabeth", "Mumbai", "Chennai", "Navi Mumbai",
            "Mumbai", "Chennai", "Mumbai", "Bangalore", "Chennai", "Mumbai", "Delhi", "Kolkata",
            "Dubai", "Mumbai", "Mumbai", "Mumbai", "Chennai", "Mumbai", "Kolkata", "Mumbai", "Pune",
            "Mumbai", "Chennai"),
  Winner = c("CSK", "MI", "MI", "CSK", "MI", "CSK", "CSK", "MI", "MI", "MI", "CSK", "MI", "MI", "CSK", 
             "MI", "CSK", "CSK", "CSK", "CSK", "MI", "MI", "MI", "CSK", "MI", "MI", "MI"),
  stringsAsFactors = FALSE
)

# Calculating mean number of wins for CSK and MI
csk_wins <- sum(matches$Winner == "CSK")
mi_wins <- sum(matches$Winner == "MI")
total_matches <- nrow(matches)
lambda_csk <- csk_wins / total_matches
lambda_mi <- mi_wins / total_matches

max_wins <- total_matches
prob_csk_beats_mi <- 0

for (i in (mi_wins + 1):max_wins) {
  prob_csk_beats_mi <- prob_csk_beats_mi + (dpois(i, lambda_csk * total_matches) * 
                                              ppois(i - 1, lambda_mi * total_matches))
}

print(prob_csk_beats_mi)

percentage_csk_beats_mi <- prob_csk_beats_mi * 100
print(paste("The percentage chance that CSK wins more games than MI is:", round(percentage_csk_beats_mi, 2), "%"))

