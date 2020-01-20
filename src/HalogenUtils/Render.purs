module HalogenUtils.Render where

import Data.Maybe (Maybe(..))
import Data.Unit (Unit, unit)
import Halogen.HTML as HH

-- | Renders an element using the function in the case of `Just`. Otherwise,
-- | render `HH.text ""` which is as cloes to `Monoid`'s `mempty` as we can get.
maybeElem :: forall p i a. Maybe a -> (a -> HH.HTML p i) -> HH.HTML p i
maybeElem (Just x) f = f x
maybeElem _ _ = HH.text ""

-- | Displays the element when the condition is true. Since PureScript is a
-- | strict language, we hide the evaluation behind a function, which won't be
-- | evaluated right away, to minimize the work performed each render.
whenElem :: forall p i. Boolean -> (Unit -> HH.HTML p i) -> HH.HTML p i
whenElem cond f = if cond then f unit else HH.text ""
