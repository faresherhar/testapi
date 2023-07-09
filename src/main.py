from fastapi import FastAPI

app = FastAPI(title="Recipe API", openapi_url="/openapi.json")


@app.get("/")
async def read_main():
    return {"msg": "Hello World"}
