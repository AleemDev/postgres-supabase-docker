start:
	@if [ ! -d "supabase" ]; then \
		echo "Supabase not initialized. Running setup..."; \
		npm init -y; \
		npm install supabase --save-dev; \
		npx supabase init; \
		cp ./setup/_seed.sql ./supabase/seed.sql \
	fi
	npx supabase start
	# docker compose up

stop:
	# docker compose down
	npx supabase stop