REBAR ?= $(shell pwd)/rebar3

test:
	${REBAR} eunit skip_deps=true

systests: rel
	mkdir -p logs
	ct_run -pa ./_build/default/lib/*/ebin -logdir logs -suite mvreg_SUITE -dir test

docs:
	${REBAR} doc skip_deps=true

xref: compile
	${REBAR} xref skip_deps=true

dialyzer:
	${REBAR} dialyzer
