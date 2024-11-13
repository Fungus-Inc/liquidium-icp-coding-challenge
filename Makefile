# Environment variables
export POCKET_IC_BIN =./src/instant_loans/pocket-ic
export CC=/opt/homebrew/opt/llvm/bin/clang

prebuild:
	cargo build --target wasm32-unknown-unknown --release -p instant_loans --locked

build: prebuild
	dfx build

generate_did: build
	candid-extractor target/wasm32-unknown-unknown/release/instant_loans.wasm > src/instant_loans/instant_loans.did


