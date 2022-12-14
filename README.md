# cs3200-final

open Docker Desktop and ngrok

run the following commands in the project folder directory:

py -3 -m venv venv
venv\Scripts\activate
pip install Flask
docker compose up --build

In ngrok, run the command:
ngrok http 9000

open the AppSmith project on CS3200 page
change the datasource to the current ngrok URL
deploy website
