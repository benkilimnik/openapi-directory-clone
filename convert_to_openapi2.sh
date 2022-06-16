#!/bin/bash
# Note: conversion from OpenAPI 3 to Swagger 2 is lossy because because OAS3 has features that did not exist in OAS2
# such as multiple servers, oneOf/anyOf, different schemas per media type, objects in query string parameters, cookie parameters, and others.
npm install api-spec-converter
find APIs/ -name "openapi.yaml" | while IFS= read -r file; do
  node_modules/.bin/api-spec-converter --from=openapi_3 --to=swagger_2 --syntax=yaml --order=alpha "$file" > /tmp/foo.tmp && mv /tmp/foo.tmp "$file" && echo "$file converted to OpenAPI 2.0"; done