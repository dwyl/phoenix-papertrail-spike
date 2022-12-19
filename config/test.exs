import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :spike_papertrail, SpikePapertrail.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "spike_papertrail_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :spike_papertrail, SpikePapertrailWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FbtJOsjqr+gHwFjo8BNgymWsYPbYzIDE+z58Wpae1Pxxrq9oAn0GDhz6j4cXK23M",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
