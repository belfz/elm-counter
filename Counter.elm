module Counter (initialState, view, update) where

import Html exposing (div, text, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Signal

type alias State = {count : Int, highest : Int}
initialState : State  
initialState = {count = 0, highest = 0}
-- or like this:  initialState = State 0 0

type Action
  = Increment
   | Decrement
   | Reset
   | Add Int

update : Action -> State -> State
update action state =
  case action of
    Increment ->
      {state | count = state.count + 1}
    Decrement ->
      {state | count = state.count - 1}
    Reset ->
      {state | highest = if state.count > state.highest then state.count else state.highest, count = 0}
    Add extra ->
      {state | count = state.count + extra}  
      
cssCount : Html.Attribute
cssCount = 
  style [
    ("color", "green")
  ]
  
cssHighest : Html.Attribute
cssHighest = 
  style [
    ("color", "red")
  ]

view : Signal.Address Action -> State -> Html.Html  
view address state =
  div [] 
    [
     div [cssCount] [text ("count: " ++ toString state.count)],
     div [cssHighest] [text ("highest: " ++ toString state.highest)],
     button [onClick address Increment] [text "+"],
     button [onClick address Decrement] [text "-"],
     button [onClick address Reset] [text "R"],
     button [onClick address (Add 5)] [text "5"]
     ]
     