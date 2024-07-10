defmodule Yedei.Repo do
  use Ecto.Repo,
    otp_app: :yedei,
    adapter: Ecto.Adapters.Postgres
end
