defmodule YedeiWeb.LivePage.HomeLive do
  use YedeiWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(_unsigned_params, _uri, socket) do
    take_action(socket.assigns.live_action, socket)
  end

  def take_action(:home, socket) do
    {:noreply, assign(socket, page_title: "Welcome")}
  end

  def take_action(:login, socket) do
    {:noreply, assign(socket, page_title: "Login to Your account")}
  end

  def take_action(:register, socket) do
    {:noreply, assign(socket, page_title: "Register new account")}
  end
end
