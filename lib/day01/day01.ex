defmodule Day01.Day01 do
  @moduledoc false

  @input_file "./lib/day01/input.txt"

  def solution1(input) do
    captcha = parser(input)

    captcha
    |> Stream.chunk_every(2, 1, [hd(captcha)])
    |> Enum.reduce(0, &(return_same(&1) + &2))
  end

  defp parser(input) do
    input
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
  end

  defp return_same([x, x]), do: x
  defp return_same([_x, _y]), do: 0

  def part1 do
    File.read!(@input_file)
    |> solution1
  end
end
