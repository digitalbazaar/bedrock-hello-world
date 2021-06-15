const bedrock = require('bedrock');
const {config} = bedrock;

require('bedrock-config-yaml');
require('bedrock-health');

// includes the bedrock-express module which provides express capabilities.
require('bedrock-express');

require('./config');

// Waits for express to being listening to routes, which then allows us to
// provide our own handlers for provided routes
bedrock.events.on('bedrock-express.configure.routes', function(app) {
  // listens to routes on the server at the root directory and responds
  // with "Hello World!".
  app.get('/', function(req, res) {
    res.send(`Hello World from ${config['hello-world'].helloFrom}!`);
  });
});

// Starts bedrock on the default port
bedrock.start();
