defmodule SampleClient do
  @host "http://canvas.elixirday.com"
  @token "marcelo.koga"

  ### API ###
  def move(direction) do
    post("/api/move", direction: direction)
  end

  def paint, do: post("/api/paint")

  def change_color(color), do: post("/api/change_color", %{ color: color })

  def locate() do
    post("/api/locate")
  end

  def desenha_quadrado(tamanho) do
    ["E", "S", "W", "N"]
    |> Enum.each(fn(d) -> desenha_linha(d, tamanho) end)
  end

  def zigue_zague(altura) do
    1..altura
    |> Enum.each(fn(_) ->
      change_color("#babaca")
      desenha_linha("NE", 15)
      change_color("#dedada")
      desenha_linha("NW", 15)
    end)
  end

  def desenha_linha(d, tamanho) do
    (1..tamanho)
    |> Enum.each(fn(_) -> move_and_paint(d) end)
  end

  def move_and_paint(d) do
    move(d)
    paint()
  end

  defp post(url, params \\ %{}) do
    HTTPoison.post!(@host <> url,
      params_and_token(params),
      [{"Content-type", "application/json"}])
  end

  defp params_and_token(params) do
    params
    |> Map.merge(%{token: @token})
    |> Poison.encode!()
  end
end
