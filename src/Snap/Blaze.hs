{-# LANGUAGE OverloadedStrings #-}
module Snap.Blaze
    ( blaze
    ) where

import Text.Blaze (Html)
import Text.Blaze.Renderer.Utf8 (renderHtml)
import Snap.Types (MonadSnap (..), addHeader, modifyResponse, writeLBS)

blaze :: MonadSnap m => Html -> m ()
blaze response = do
    modifyResponse $ addHeader "Content-Type" "text/html; charset=UTF-8"
    writeLBS $ renderHtml response
