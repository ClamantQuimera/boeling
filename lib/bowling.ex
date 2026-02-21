defmodule Bowling do

  def score([]), do: 0

  def score([frame|rest]) do
    first = hd(frame)
    second = hd(tl(frame))
    first + second + score(rest)
  end
end
