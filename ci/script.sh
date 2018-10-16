set -exo pipefail

main() {
    if [[ ! $TARGET =~ .*linux.* ]]; then
        sed -i "s/linux-embedded-hal/#linux-embedded-hal/g" Cargo.toml
        sed -i "s/embedded-hal-mock/#embedded-hal-mock/g" Cargo.toml
    fi

    cargo check --target $TARGET
    cargo build --target $TARGET --release
    if [ -z $DISABLE_EXAMPLES ]; then
        if [[ $TARGET =~ .*linux.* ]]; then
            cargo build --target $TARGET --examples
        fi
    fi

    if [ $TRAVIS_RUST_VERSION = nightly ]; then
        if [[ $TARGET =~ .*linux.* ]]; then
            cargo test --target $TARGET
        fi
    fi
}

main
