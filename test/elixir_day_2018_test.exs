defmodule ElixirDay2018Test do
  use ExUnit.Case
  doctest ElixirDay2018

  test "greets the world" do
    assert ElixirDay2018.hello() == :world
  end
end
