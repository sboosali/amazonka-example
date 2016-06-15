{-# LANGUAGE OverloadedStrings #-}
module Amazonka where

import Network.AWS     -- amazonka
import Network.AWS.EC2 -- amazonka-ec2

{-

AWSRequest

https://hackage.haskell.org/package/amazonka-1.3.7/docs/Network-AWS.html#v:send

-}

main :: IO ()
main = do
    env <- newEnv Ireland (FromKeys "an-access-key" "a-secret-key")
    -- rs  <- send env 
    -- print rs
