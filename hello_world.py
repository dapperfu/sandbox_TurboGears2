from wsgiref.simple_server import make_server

from tg import expose
from tg import MinimalApplicationConfigurator
from tg import TGController

# RootController of our web app, in charge of serving content for /
class RootController(TGController):
    @expose(content_type="text/plain")
    def index(self):
        return "Hello World"
    @expose(content_type="text/plain")
    def index2(self):
        return "Hello World 2"


# Configure a new minimal application with our root controller.
config = MinimalApplicationConfigurator()
config.update_blueprint({"root_controller": RootController()})

# Serve the newly configured web application.
print("Serving on port 8080...")
httpd = make_server("", 8080, config.make_wsgi_app())
httpd.serve_forever()
