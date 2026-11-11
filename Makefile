TIMESTAMP := $(shell date +"%Y-%m-%d_%H-%M-%S")

define log_cmd
	@echo "Logs saving to $(1)_$(TIMESTAMP).log"
	make $(1) 2>&1 | tee setup/logs/$(1)_$(TIMESTAMP).log
endef

log-%:
	$(call log_cmd,$*)

start:
	@if [ ! -d "supabase" ]; then \
		echo "Supabase not initialized. Running setup..."; \
		make log-dbsetup; \
	else \
		echo "Starting Supabase..."; \
		make log-dbstart; \
	fi

start-debug:
	make log-dbstart-debug

dbsetup:
	npm init -y;
	npm install supabase --save-dev;
	npx supabase init;
	cp ./setup/_seed.sql ./supabase/seed.sql;
	npx supabase start;

dbstart:
	npx supabase start;

dbstart-debug:
	npx supabase start --debug

stop:
	@echo "Stopping Supabase..."
	npx supabase stop

stop-nbk:
	@echo "Stopping Supabase..."
	npx supabase stop --no-backup