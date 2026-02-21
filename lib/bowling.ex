defmodule Bowling do
  def score([]), do: 0

  def score([[f, s, _] | []]), do: f + s

  def score([[f, s] | rest]) do
    if f + s == 10 do
      [next_f | _] = hd(rest)
      10 + next_f + score(rest)
    else
      f + s + score(rest)
    end
  end
end
