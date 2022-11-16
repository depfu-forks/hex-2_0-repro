defmodule SomeApp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :some_app,
      version: "0.0.2",
      elixir: "~> 1.14",
      deps: deps(),
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {SomeApp, []}]
  end

  # Specifies which paths to compile per environment.

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6"},
      {:plug_cowboy, "~> 2.3"},
      {:bypass, "~> 2.1", only: :test},
      {:gen_smtp, github: "gen-smtp/gen_smtp", ref: "a896938fc967f75bc6601d1e9aad80ec27c6b045"},
      {:ranch, "2.1.0"}
    ]
  end

end
