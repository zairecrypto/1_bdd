defmodule BddWeb.PageController do
  use BddWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
