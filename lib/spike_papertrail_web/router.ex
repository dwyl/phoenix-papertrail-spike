defmodule SpikePapertrailWeb.Router do
  use SpikePapertrailWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SpikePapertrailWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpikePapertrailWeb do
    pipe_through :browser

    get "/", ItemController, :index
    get "/items/toggle/:id", ItemController, :toggle
    get "/items/clear", ItemController, :clear_completed
    get "/items/:filter", ItemController, :index
    resources "/items", ItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SpikePapertrailWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  #if Application.compile_env(:spike_papertrail, :dev_routes) do
  #  # If you want to use the LiveDashboard in production, you should put
  #  # it behind authentication and allow only admins to access it.
  #  # If your application does not have an admins-only section yet,
  #  # you can use Plug.BasicAuth to set up some basic authentication
  #  # as long as you are also using SSL (which you should anyway).
  #  import Phoenix.LiveDashboard.Router

  #  scope "/dev" do
  #    pipe_through :browser

  #    live_dashboard "/dashboard", metrics: SpikePapertrailWeb.Telemetry
  #    forward "/mailbox", Plug.Swoosh.MailboxPreview
  #  end
  #end
end
