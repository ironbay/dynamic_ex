defmodule DynamicTest do
  use ExUnit.Case
  doctest Dynamic

  test "greets the world" do
    assert Dynamic.hello() == :world
  end
end
