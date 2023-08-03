defmodule Calculator do
  alias Boundary

  def start(initial_state) do
    initial_state
    |> Boundary.start()
  end

  def add(calculator, n), do: send(calculator, {:add, n})
  def subtract(calculator, n), do: send(calculator, {:subtract, n})
  def multiply(calculator, n), do: send(calculator, {:multiply, n})
  def divide(calculator, n), do: send(calculator, {:divide, n})
  def clear(calculator), do: send(calculator, :clear)

  def state(calculator) do
    send(calculator, {:state, self()})

    receive do
      {:state, state} ->
        state
    after
      5000 -> {:error, :timeout}
    end
  end
end
