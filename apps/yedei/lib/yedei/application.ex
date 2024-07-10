defmodule Yedei.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Yedei.Repo,
      {DNSCluster, query: Application.get_env(:yedei, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Yedei.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Yedei.Finch}
      # Start a worker by calling: Yedei.Worker.start_link(arg)
      # {Yedei.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Yedei.Supervisor)
  end
end
