module Main exposing (main)

import Browser
import Dial
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { value : Float }


initialModel : Model
initialModel =
    { value = 0 }



-- UPDATE


type Msg
    = Increase


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increase ->
            { value = model.value + 1 }



-- VIEW


{-| View
...
-}
view : Model -> Html Msg
view model =
    div
        [ class "p-20 space-y-4" ]
        [ div
            [ class "flex justify-center" ]
            [ Dial.view 150 ]
        , div
            [ class "flex justify-center items-center" ]
            [ div
                [ class "px-2" ]
                [ text <| String.fromFloat model.value ]
            , Html.button
                [ class "px-2 py-1 rounded bg-gray-200 font-medium"
                , Html.Events.onClick Increase
                ]
                [ text "+" ]
            ]
        ]
