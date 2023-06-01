module MyApp where

import Effect.Uncurried (EffectFn2)
import Erl.Atom (Atom)
import Erl.Data.List (List)
import Foreign (Foreign)
import MySup as MySup
import Pinto.App as App

start ∷ ∀ args1. EffectFn2 Atom (List args1) Foreign
start = App.simpleStart MySup.startLink
