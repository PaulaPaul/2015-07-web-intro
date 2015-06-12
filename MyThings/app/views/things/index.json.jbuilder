json.array!(@things) do |thing|
  json.extract! thing, :id, :name, :color, :photo
  json.url thing_url(thing, format: :json)
end
