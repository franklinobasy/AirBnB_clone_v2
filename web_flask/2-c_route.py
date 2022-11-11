#!/usr/bin/python3

from flask import Flask

app = Flask(__name__)


@app.route("/", strict_slashes=False)
def index():
    """ Function called with / route """
    return "Hello HBNB!"


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    """ Function called with /hbnb route """
    return "HBNB!"


@app.route("/c/<text>", strict_slashes=False)
def c(text):
    """ Function called with /c/<text> route """
    return f"C {text.replace('_', ' ')}"


if __name__ == "__main__":
    app.run(port=5000)
