# This post features one hands on example of refactoring Javascript-like code using power of LiveScript syntax, combined with Prelude.ls extras.
# Here is a function for processing an array of tags into an object for D3.js vizualisation component. On input you have an array like ['tag1', 'tag2', 'tag2', 'tag2', 'tag3', ... ]. The function selects the top 10 of the most popular tags and constructs a D3.js compatible object.
# https://blog.red-badger.com/blog/2014/03/04/functional-refactoring-with-livescript

buildTreeChart = (tags) ->
  tag-index = {}

  # Build tag index
  for tag in tags
    if tag-index[tag]
      tag-index[tag] += 1
    else
      tag-index[tag] = 1

  # Sort index
  sortable = []
  for tag of tag-index
    sortable.push [tag, tag-index[tag]]

  sortable.sort (a, b) ->
    b[1] - a[1]

  tree-chart = []
  limit = void

  if sortable.length > 10
    limit = 9
  else
    limit = sortable.length - 1

  # Construct proper object for D3 tree chart
  for tag in sortable[0 to limit]
    tree-chart.push {name: tag[0], size: tag[1]}


However when I showed this code to Viktor, he was quick to point out that LiveScript can do better. 
After another couple of minutes he produced this:

buildTreeChart = (tags) ->
  tags
    |> group-by (-> it)
    |> obj-to-pairs
    |> map (-> [it[0], it[1].length])
    |> sort-by (.1)
    |> reverse
    |> take 10
    |> map (-> {name: it[0], size: it[1]})
