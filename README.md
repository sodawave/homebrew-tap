# sodawave/homebrew-tap

Homebrew tap for the **Buzz CLI** (`buzz-cli`) — the agent-first terminal CLI
for the Buzz relay, from [block/buzz](https://github.com/block/buzz).
This is the standalone CLI engine only: no desktop app, no GUI.

## Install

```sh
brew tap sodawave/tap https://github.com/sodawave/homebrew-tap
brew install sodawave/tap/buzz-cli
```

The installed binary command is `buzz`:

```sh
buzz --help
```

Works on macOS (Apple Silicon and Intel) and Linux (Homebrew on Linux), so it
is usable on a Linux VPS. Builds from source with Homebrew's Rust; no openssl
needed — the CLI uses rustls.

## Update

The formula pins an exact commit of `block/buzz` (`revision:`). To bump:

1. Update `revision:` to the new `main` SHA of `block/buzz`.
2. Bump `version:` (workspace version of `crates/buzz-cli`).
3. Run `brew audit sodawave/tap/buzz-cli`, commit and push.

## Notes

- On Windows there is no Homebrew; use WSL2 (Linux) or build from the repo
  (`cargo build --release -p buzz-cli`).
- Requires `--version` support in the CLI (present since the
  `#[command(version)]` flag in `crates/buzz-cli/src/lib.rs`); the `brew test`
  step relies on it.
