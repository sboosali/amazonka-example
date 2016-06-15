{-# LANGUAGE OverloadedStrings #-}
module Amazonka.Example where

import Network.AWS     -- amazonka
import Network.AWS.EC2 -- amazonka-ec2
import Control.Lens

{- |

run:

@
stack build  &&  stack exec -- example-amazonka-example
@

docs:

https://hackage.haskell.org/package/amazonka-1.3.7/docs/Network-AWS.html#v:send

https://hackage.haskell.org/package/amazonka-ec2-1.4.2/docs/Network-AWS-EC2-RunInstances.html#v:runInstances

https://hackage.haskell.org/package/amazonka-ec2-1.4.2/docs/Network-AWS-EC2-Types.html#t:BlockDeviceMapping

-}

main :: IO ()
main = do

  env <- newEnv Ireland (FromKeys "an-access-key" "a-secret-key")

  (r :: Reservation) <- (runResourceT . runAWS env) $ do
    send query

  print r

query :: RunInstances
query = runInstances "<image>" 0 1
  & rBlockDeviceMappings .~ [ blockDeviceMapping "bdmDeviceName"
                               & bdmVirtualName .~ Just "bdmVirtualName"
                               & bdmEBS         .~ Just ebsBlockDevice
                            ]
