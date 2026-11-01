import os
import socket
from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return f"Hello from {socket.gethostname()}! Env: {os.getenv('APP_ENV', 'unknown')}\n"

@app.route("/health")
def health():
    return "ok\n"