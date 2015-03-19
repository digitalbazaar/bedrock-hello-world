# bedrock-hello-world
bedrock hello world example project

##Hello World Example

To start, we must create a file, package.json, to setup our environment.

```json
{
  "name" : "HelloWorld",
  "version" : "0.0.0",
  "scripts": {
    "start": "node helloworld.js"
  },
  "dependencies": {
    "bedrock": "~0.3.0",
    "bedrock-express": "~0.2.0"
  },
  "engines": {
    "node": ">=0.10.0"
  },
  "main": "helloworld.js"
}
```

Now we may install the listed dependencies with
```
npm install
```

Notice that we have two dependencies in our package.json, bedrock and bedrock-express. These dependencies provide us with the bedrock server and express capabilities.


Now to create our hello world project, we will need to create a file, "helloworld.js".

To start off, we may place these lines in helloworld.js.

```js
var bedrock = require('bedrock');
require('bedrock-express');
```

These require statements will provide us with bedrock and the ability to use express within our program.

Now, we can add these lines to our helloworld.js

```js
bedrock.events.on('bedrock-express.configure.routes', function(app) {
  
});
```
This is a bedrock event listener, waiting for the event "bedrock-express.configure.routes" to be fired off. This event is triggered by our bedrock-express module once the express module is ready for routes to be added.

Now, we can listen to a route within our event handler and respond with "Hello World!"

```js
bedrock.events.on('bedrock-express.configure.routes', function(app) {
  app.get('/', function(req, res) {
    res.send('Hello World!');
  });
});
```

Using express, we are now able respond to the specified route and send the text "Hello World!"

Finally, to start our server we must add the following line to the bottom of helloworld.js
```js
bedrock.start();
```

This command will start our bedrock server and allow it to listen to oncoming routes. 

And that is all we need for our helloworld.js!

Now, to run our new bedrock program we must run

```
npm start
```

This should now start the bedrock server and provide the URL in which the server is running.

Visit this URL in a browser and you will see your "Hello World!" appear.