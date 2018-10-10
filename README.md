# Dummy Webhook

Dummy Webhook is a dummy webhook for when you need to have to test a service webhook.

It will locally run a webserver and make it public on the internet (using https://ngrok.com/). 
Every call to this web server will be answered by a 200 and body that says "ok"

## Getting started

You need to have docker and docker-compose installed on your machine. Go here to do that : https://docs.docker.com/compose/install/

Then open a console and run the following commands :
```
git clone XXX
docker-compose up
```

Then open a browser and go to http://localhost:4040. This is the ngrok ui that shows you public url (it looks like http://fd18141f.eu.ngrok.io)
Once you start doing http calls to this url, ngrok will show you some data about those requests.
You can also see the logs in the console (but they dont show much more than ngork).