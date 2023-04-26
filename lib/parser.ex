defmodule Parser do
  @moduledoc """
   Parser reads raw electricity consumption data and parses it into a
   defined, internal data format.
  """

  @consumption_data_path "data/consumption_data.json"

  @doc """
  This is the entrypoint for the parser application. You can call this
  function during development to test your solution.

  -- You do not need to modify this function --
  """
  def run do
    {:ok, json} = read_consumption_data()

    parse(json)
  end

  @doc """
  Reads and decodes raw consumption data from json file located at the
  path specified in @consumption_data_path.

  -- You do not need to modify this function --
  """
  def read_consumption_data do
    with {:ok, body} <- File.read(@consumption_data_path),
         {:ok, json} <- Poison.decode(body),
         do: {:ok, json}
  end

  #
  # YOUR SOLUTION BELOW THIS POINT
  #

  @doc """
  Parses the raw consumption data in consumption_data to internal data format
  """
  def parse(consumption_data) do
    data =
      consumption_data
      |> Map.get("result")
      |> Enum.at(0)
      |> Map.get("MyEnergyData_MarketDocument")
      |> Map.get("TimeSeries")
      |> Enum.at(0)

    id = Map.get(data, "metering_point_id")
    periods = Map.get(data, "Period")

    Enum.reduce(periods, [], fn x, acc ->
      parse_period(x, id) ++ acc
    end)
  end

  defp parse_period(period, id) do
    time_start = get_in(period, ["timeInterval", "start"])
    time_end = get_in(period, ["timeInterval", "end"])
    point = Map.get(period, "Point")

    Enum.reduce(point, [], fn x, acc ->
      [parse_point(x, id, time_start, time_end)] ++ acc
    end)
  end

  defp parse_point(point, id, time_start, time_end) do
    quantity = Map.get(point, "out_Quantity.quantity")

    %{
      metering_point_id: id,
      quantity: quantity,
      interval_start: time_start,
      interval_end: time_end
    }
  end
end
