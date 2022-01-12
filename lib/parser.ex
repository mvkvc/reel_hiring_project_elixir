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
  path specified in @consumption_data_path.any().

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
  end
end
