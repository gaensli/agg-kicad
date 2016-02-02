all: build

build: build-libs build-mods

build-libs: build-lib-connector build-lib-ic build-lib-power

build-mods: build-mod-chip build-mod-ic build-mod-jstpa

build-verify: verify-libs verify-mods

verify-libs: verify-lib-connector verify-lib-ic verify-lib-power

verify-mods: verify-mod-chip verify-mod-ic verify-mod-jstpa

compile: compile-lib compile-pro

compile-verify: verify-lib verify-pro

check: check-lib check-mod

verify: build-verify compile-verify

build-lib-connector:
	python scripts/build_lib_connector.py lib/connector/conn.lib

verify-lib-connector:
	python scripts/build_lib_connector.py lib/connector/conn.lib --verify

build-lib-ic:
	python scripts/build_lib_ic.py lib/

verify-lib-ic:
	python scripts/build_lib_ic.py lib/ --verify

build-lib-power:
	python scripts/build_lib_power.py lib/power/power.lib

verify-lib-power:
	python scripts/build_lib_power.py lib/power/power.lib --verify

build-mod-chip:
	python scripts/build_mod_chip.py agg.pretty/

verify-mod-chip:
	python scripts/build_mod_chip.py agg.pretty/ --verify

build-mod-ic:
	python scripts/build_mod_ic.py agg.pretty/

verify-mod-ic:
	python scripts/build_mod_ic.py agg.pretty/ --verify

build-mod-jstpa:
	python scripts/build_mod_jstpa.py agg.pretty/

verify-mod-jstpa:
	python scripts/build_mod_jstpa.py agg.pretty/ --verify

compile-lib:
	python scripts/compile_lib.py lib/ agg-kicad.lib

verify-lib:
	python scripts/compile_lib.py lib/ agg-kicad.lib --verify

compile-pro:
	python scripts/compile_pro.py lib/ agg-kicad.pro

verify-pro:
	python scripts/compile_pro.py lib/ agg-kicad.pro --verify

check-lib:
	python scripts/check_lib.py lib/ agg.pretty/

check-mod:
	python scripts/check_mod.py agg.pretty/
