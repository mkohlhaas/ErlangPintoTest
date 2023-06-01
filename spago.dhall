{ name = "my-project"
, backend = "purerl"
, dependencies =
  [ "console"
  , "datetime"
  , "effect"
  , "erl-atom"
  , "erl-lists"
  , "erl-pinto"
  , "foreign"
  , "maybe"
  , "prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
