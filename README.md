# Instructions

  * Get this repository
  * Go into
  * Launch this:

    docker build -t walle .

  * It will take some time. Then launch this:

    docker run -d -p 8081:8081 --name walle walle /usr/bin/supervisord

  * Finally access to the web with the next link: [See Wall-e in action](http://localhost:8081 "Test Wall-e")

You will have the last version of Wall-e, the Collaborative whiteboard.
