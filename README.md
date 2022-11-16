# Reproduction of odd behaviour in Hex 2.0

## What's in here

- A set of deps in `mix.exs` with a couple of pinned dependencies. This is the way Depfu ensures that on an update we get exactly the versions we want to upgrade to. This is likely in many cases to produce incompatible sets of pinned dependencies and this `mix.exs` is an example. It pins `ranch` to `2.1.0` which is incompatible with `bypass` which requests `~> 1.3.0`.
- A `mix.lock` that is currently not in sync with the `mix.exs`

## Reproing the bug

1. Run `mix deps.update ranch` - This, if run first, does correctly identify the problem with the ranch dependency
2. Run `mix deps.get` - This, somehow, updates a bunch of packages but in the end builds a new lockfile that is out of sync with the mix.exs, with an old version of `ranch` locked in.
3. Run `mix deps.update ranch` - This, now, runs successfully, without noting the problem and not changing anything on the lockfile

The difference with 1 and 3 seems to have to do with cached data, because removing the deps folder fixes the issue.

## Environment

See [.tool-versions](/.tool-versions) for the Elixir and Erlang/OTP versions used when testing.
