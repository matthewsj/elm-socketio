port module Main exposing (Model, Msg(..), init, main, receiveMessage, sendMessage, subscriptions, update, view)

import Browser
import Html exposing (Html, button, div, input, li, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Http



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    receiveMessage ReceivedChat


port sendMessage : String -> Cmd msg


port receiveMessage : (String -> msg) -> Sub msg



-- MODEL


type alias Model =
    { messages : List String
    , draft : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { messages = []
      , draft = ""
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = ReceivedChat String
    | ChangeDraft String
    | SendChat


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReceivedChat newChat ->
            ( { model | messages = List.append model.messages [ newChat ] }, Cmd.none )

        ChangeDraft draft ->
            ( { model | draft = draft }, Cmd.none )

        SendChat ->
            ( { model | draft = "" }
            , sendMessage model.draft
            )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ ul [ id "messages" ] (List.map (\chat -> li [] [ text chat ]) model.messages)
        , div [ id "chatform" ]
            [ input [ value model.draft, onInput ChangeDraft ] []
            , button [ onClick SendChat ] [ text "Send" ]
            ]
        ]
