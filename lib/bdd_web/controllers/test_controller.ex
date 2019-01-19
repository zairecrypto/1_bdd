defmodule BddWeb.TestController do
  use BddWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
