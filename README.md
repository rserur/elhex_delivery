# ElhexDelivery

Look up US latitude and longitude coordinates by zip code.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elhex_delivery` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:elhex_delivery, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elhex_delivery](https://hexdocs.pm/elhex_delivery).

## Usage

1. Start Application: `$ iex -S mix`

2. Start GenServer data parser:
  ```
    iex> ElhexDelivery.PostalCode.Supervisor.start_link
    {:ok, #PID<0.109.0>}
  ```
3. Get geolocation data from GenServer store:
  ```
    iex> ElhexDelivery.PostalCode.Store.get_geolocation("02130")
    {42.309174, -71.113835}
  ```
