{ runCommand, lib, php }:
runCommand "ihavenoideawhatimdoing.dog" {
  buildInputs = [ php ];
  gifs = (builtins.toJSON
    (builtins.map
      (name: ./gifs + "/${name}")
      (builtins.attrNames
        (lib.filterAttrs
          (name: value: value == "regular")
          (builtins.readDir ./gifs)
        )
      )
    )
  );
} ''
  cp ${./index.php} ./index.php
  chmod a+w ./index.php
  printf 'function giflist() {\n\treturn %s;\n}' "$gifs" >> ./index.php
  cat index.php
  php -l ./index.php

  mkdir $out
  cp ./index.php $out/index.php
''
