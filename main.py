from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return dict(name="Anurag Sharma", Location="Panipat")

@app.get("/{data}")
def read_root(data):
    return dict(hi=data, Location="Panipat")

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)
