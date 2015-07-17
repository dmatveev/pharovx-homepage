{-# LANGUAGE OverloadedStrings #-}

import Hakyll

main :: IO ()
main = hakyll $ do
  match "images/*" $ do
    route   idRoute
    compile copyFileCompiler 

  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  match "templates/*" $ do
    compile templateCompiler
    
  match "index.md" $ do
    route $ gsubRoute "" (const "") `composeRoutes` setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/template.html" defaultContext
      >>= relativizeUrls
