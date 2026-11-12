FROM python:3.11-slim-bookworm@sha256:a83ba18aef0f865b1a4a611c2cf460fe446f2795673bbb9fe43be570439e3b39
WORKDIR /app
COPY . .
CMD ["sh", "-c", "python3 -m unittest discover -s tests -v && python3 -m compileall -q tariffs households analysis publication nursery_report.py && python3 nursery_report.py demo --fixture fixtures/county.json"]
