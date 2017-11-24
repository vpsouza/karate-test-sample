
function() {
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  
  var config = { };
  
  if (!karate.env) {
    env = 'mock'; // a custom 'intelligent' default
  }
  
  switch(env){
	case 'mock':
		config.demoBaseUrl = 'http://localhost:' + (karate.properties['mock.server.port'] || '3000');
		break;
	case 'homolog':
		config.demoBaseUrl = 'http://homolog.myserver.com';
		break;
  }
  
  return config;
  
}