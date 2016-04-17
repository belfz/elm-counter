module Main where

import Counter exposing (initialState, view, update)
import StartApp.Simple as StartApp

main =
  StartApp.start
    { 
      model = initialState,
      view = view,
      update = update
    }