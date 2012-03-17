{-# LANGUAGE OverloadedStrings #-}
module Snap.Blaze
    ( blaze
    ) where

import Text.Blaze (Html)
import Text.Blaze.Renderer.Utf8 (renderHtml)
import Snap.Core (MonadSnap (..), addHeader, modifyResponse, writeLBS)

-- | Write some 'Html' as response
blaze :: MonadSnap m => Html -> m ()
blaze response = do
    modifyResponse $ addHeader "Content-Type" "text/html; charset=UTF-8"
    writeLBS $ renderHtml response
