#!/usr/bin/python
# -*- coding: utf-8 -*-
from app import app

if __name__ == "__main__":
    app.run(debug=app.config['DEBUG'], host=app.config['HOST'], port=app.config['PORT'], threaded=True)
