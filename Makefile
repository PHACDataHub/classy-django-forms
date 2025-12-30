PUBLIC_FOLDER = ./public


runserver:
	@cd $(PUBLIC_FOLDER) && python -m http.server

.PHONY=clean
clean:
	@rm -f .klasses.json
	@rm -rf $(PUBLIC_FOLDER)/*
	@mkdir -p $(PUBLIC_FOLDER)/static
	@echo "Cleaning done."

.PHONY=collect_static
collect_static:
	@cp -r static $(PUBLIC_FOLDER)/
	@echo "Collecting static done."

.PHONY=index_generator_for_version
generate_index_for_version:
	@./src/generate_index.py

.PHONY=build_for_version
build_for_version:
	@./src/compile_static.py

build_local:
	make clean
	make collect_static
	@IS_LOCAL=1 tox

# build_local requires installing one of the django versions locally
# you'll have to manually navigate to the version you're testing
build_local_dev:
	@make clean
	@make collect_static
	@IS_LOCAL=1 make generate_index_for_version
	@IS_LOCAL=1 make build_for_version

build:
	@make clean
	@make collect_static
	@tox
