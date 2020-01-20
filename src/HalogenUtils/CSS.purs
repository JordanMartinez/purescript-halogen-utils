module HalogenUtils.CSS where

import Data.Function ((<<<))
import Halogen.HTML.Properties (class_)
import Halogen.HTML (IProp)
import Halogen.HTML.Core (ClassName(..))

-- | Convenience function for `HP.class_ (ClassName arg)`
css :: forall r i. String -> IProp ( class :: String | r ) i
css = class_ <<< ClassName
