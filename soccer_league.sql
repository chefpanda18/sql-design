DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE soccer_leagues
(
    id SERIAL PRIMARY KEY,
    name TEXT,
)

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT,
    ranking INTEGER,
    league_id INTEGER REFERENCES soccer_leagues ON DELETE CASCADE
)

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end__date DATE
)

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT
)

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
)

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    game_date DATE,
    home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    away_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    season_id INTEGER REFERENCES season ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referees ON DELETE CASCADE
)

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    game_id INTEGER REFERENCES games ON DELETE CASCADE
)