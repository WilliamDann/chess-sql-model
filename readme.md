# SQL Final

# Group
- William Dann is the only group member with all roles and worked on all tasks

# Model
- The business is a tool for chess coaches to assign assignments and track student's progress. The web app I made alongside this also allows easy printing of the assignments as worksheets!
- The database models the assignments a chess coach gives to their students:
  - 'users' are people who sign in to the app
  - 'tokens' are generated when a user signs in. The web app handles this
  - 'classes' are groups of students in the same class.
  - 'assignments' are assigned to students and contain chess information like board positions and correct answers. board position is in FEN notation (see below) and answers are in PGN notation (see below).
  - 'positions' are the individual positions stored in the DB.

# Chess Terminology
This project contains some chess lingo. That is defined here:
- PGN: A string to store info about whole games. See this link: https://en.wikipedia.org/wiki/Portable_Game_Notation
- FEN: A string to represent a board position. See this link: https://www.chessprogramming.org/Forsyth-Edwards_Notation

# Web App
I also made a web app to accompany this project:
https://github.com/WilliamDann/chess-worksheet