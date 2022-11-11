#!/usr/bin/python3

from flask import Flask

app = Flask(__name__)


@app.route("/", strict_slashes=False)
def index():
    return "Hello HBNB!"


@app.route("/hbnb", strict_slashes=False)
def hbnb():
    return "HBNB!"


@app.route("/c/<text>", strict_slashes=False)
def c(text):
    return f"C {text}"


if __name__ == "__main__":
    app.run(port=5000)
