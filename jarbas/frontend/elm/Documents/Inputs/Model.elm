module Documents.Inputs.Model exposing (Model, Field, model)

import Dict
import Documents.Fields as Fields
import Internationalization exposing (Language(..), TranslationId(..), translate)
import Material


type alias Field =
    { label : String
    , value : String
    }


type alias Model =
    { inputs : Dict.Dict String Field
    , lang : Language
    , mdl : Material.Model
    }


toFormField : ( String, String ) -> ( String, Field )
toFormField ( name, label ) =
    ( name, Field label "" )


model : Model
model =
    let
        pairs =
            List.map2 (,) Fields.names (Fields.labels English)

        inputs =
            List.filter Fields.isSearchable pairs
                |> List.map toFormField
                |> Dict.fromList
    in
        Model inputs English Material.model
