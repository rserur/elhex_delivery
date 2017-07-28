defmodule ElhexDelivery.PostalCode.DataParser do
  @postal_code_filepath "data/2016_Gaz_zcta_national.txt"

  def parse_data do
    [ _header | data_rows ] = File.read!(@postal_code_filepath) |> String.split("\n")

    data_rows
    |> Enum.map(&(String.split(&1, "\t")))
    |> Enum.filter(&data_row?(&1))
    |> Enum.map(&parse_data_columns(&1))
    |> Enum.map(&format_row(&1))
    |> Enum.into(%{})
  end

  defp data_row?(row) do
    case row do
      [_postal_code, _, _, _, _, _latitude, _longitude] -> true
      _ -> false
    end
  end

  defp parse_data_columns(row) do
    [postal_code, _, _, _, _, latitude, longitude] = row
    [postal_code, latitude, longitude]
  end

  defp parse_number(str) do
    str |> String.replace(" ", "") |> String.to_float
  end

  # Format three element list into a two element tuple
  defp format_row([postal_code, latitude, longitude]) do
    latitude = parse_number(latitude)
    longitude = parse_number(longitude)
    { postal_code, { latitude, longitude } }
  end
end
