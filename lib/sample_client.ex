defmodule SampleClient do
  @host "http://canvas.elixirday.com"
  @token "COLOQUE_SEU_TOKEN"

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
