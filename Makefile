build:
	rm -rf public
	hugo
deploy: build
	aws s3 sync public/ s3://kojotest.tech --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E3Q2DPE2RYMLOF --paths '/*'