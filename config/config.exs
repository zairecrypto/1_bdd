# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bdd,
  ecto_repos: [Bdd.Repo]

# Configures the endpoint
config :bdd, BddWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g0HDtMmbHGibuEBBoKYgoIeon6hEsakxrFxv4+ujiO06JSQ2DPTJtGnz/daLdzGX",
  render_errors: [view: BddWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Bdd.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
