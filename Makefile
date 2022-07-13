.PHONY: run run-container gcloud-deploy

run:
	@streamlit run app.py --server.port=8080 --server.address=0.0.0.0

run-container:
	@docker build . -t streamlit-template-gcp
	@docker run -p 8080:8080 streamlit-template-gcp

gcloud-deploy:
	@gcloud app deploy app.yaml

venv-reqs:
	python3 -m pip install --upgrade pip && python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt 

