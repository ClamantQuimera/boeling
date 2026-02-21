defmodule Bowling do
  def score([]), do: 0

  # Last frame: three rolls (e.g. strike then two more) or two rolls + nil
  def score([[f, s, third] | []]) when is_number(third), do: f + s + third
  def score([[f, s, _] | []]), do: f + s

  def score([[10, nil] | rest]) do
    [next_frame | rest_after] = rest
    [first_roll | tail] = next_frame
    second_roll =
      case tail do
        [s | _] when not is_nil(s) -> s
        _ -> [s2 | _] = hd(rest_after)
             s2
      end
    10 + first_roll + second_roll + score(rest)
  end

  def score([[f, s] | rest]) when f + s == 10 do
    [next_f | _] = hd(rest)
    10 + next_f + score(rest)
  end

  def score([[f, s] | rest]), do: f + s + score(rest)
end
