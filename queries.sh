#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
function get_team_id {
  TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
  if [[ -z $TEAM_ID ]]
  then
    INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$1')")
    TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$1'")"
  fi
  echo "$TEAM_ID"
}

#echo -e "\n~~ THIS WILL INSERT DATA INTO DB ~~\n"
#echo "$($PSQL "TRUNCATE games, teams")"
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$(get_team_id "$WINNER")
    OPPONENT_ID="$(get_team_id "$OPPONENT")"
    echo "$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
  fi
done