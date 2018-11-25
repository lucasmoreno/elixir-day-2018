defmodule SampleClient do
  @host "http://canvas.elixirday.com"
  @token "lucas.moreno"

  # POST
  # /api/move
  # Move o bot no canvas
  # Parametros
  # direction
  #        N
  #    NW    NE
  #  W           E
  #    SW    SE
  #       S

  # /api/change_color
  # Muda a cor do bot
  # Parametros
  # color - #ff0000

  # /api/paint
  # Pinta a posição atual do bot

  # /api/locate
  # Retorna todos os pixels em volta da posição do bot

  def change_color(color) do
    post("/api/change_color", %{ "color" => color })
  end

  def print_line(direction \\ "N", size \\ 20) do
    (1..size)
    |> Enum.each(fn(_) ->
      post("/api/paint")
      post("/api/move", %{ "direction" => direction })
    end)
  end

  def move(direction, size \\ 1) do
    (1..size)
    |> Enum.each(fn(_) ->
      post("/api/move", %{ "direction" => direction })
    end)
  end

  def print_star do
    print_line("E")
    print_line("SW")
    print_line("NE")
    print_line("SE")
    print_line("NW")
  end

  def print_rainbow do
    change_color("#9400D3")
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    change_color("#4B0082")
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    change_color("#0000FF")
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    change_color("#00FF00")
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    change_color("#FFFF00")
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    change_color("#FF7F00")
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    print_line("E")
    move("S", 1)
    print_line("W")
    move("S", 1)
    change_color("#FF0000")
  end

  def locate, do: post("/api/locate")

  # Funções aulixiares
  def post(url, params \\ %{}) do
    HTTPoison.post!(@host <> url,
      params_and_token(params),
      [{"Content-type", "application/json"}])
  end

  def params_and_token(params) do
    params
    |> Map.merge(%{token: @token})
    |> Poison.encode!()
  end
end
