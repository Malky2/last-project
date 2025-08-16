from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "שלום! האפליקציה פועלת."

@app.route("/reverse", methods=["POST"])
def reverse():
    data = request.get_json()
    text = data.get("text", "")
    return jsonify({"reversed": text[::-1]})
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
