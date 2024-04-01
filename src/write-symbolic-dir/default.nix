{runCommand}: from: to:
runCommand to {
  inherit from to;
} ''
  mkdir -p "$(dirname $out/$to)";
  ln -s "$from" "$out/$to";
''
