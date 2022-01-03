p="/home/$USER/go/bin"
export GOBIN=$p
go get -d github.com/golbanstefan/godocdown/godocdown
go version

# Generate docs for directories
for d in */; do
  if [ "${d}" != "docs/" ] && [ "${d}" != "examples/" ]; then
    if [ -d "$d" ]; then
      echo "Generate go docs for $d"
      filename="docs/$(basename "$d").md"
      "${p}"/godocdown $d >"$filename"
      if ! [ -s $filename ]; then
        rm $filename
      fi
    fi
  else
    echo "no"
  fi
done
# Generate docs for subdirectories
for d in */*; do
  if [ "${d}" != "docs/" ] && [ "${d}" != "examples/" ]; then
    if [ -d "$d" ]; then
      echo "Generate go docs for $d"
      filename="docs/$(basename "$d").md"
      "${p}"/godocdown $d >"$filename"
      if ! [ -s $filename ]; then
        rm $filename
      fi
    fi
  else
    echo "no"
  fi
done
"${p}"/godocdown >docs/README.md
