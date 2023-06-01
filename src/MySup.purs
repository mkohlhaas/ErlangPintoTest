module MySup where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Time.Duration (Milliseconds(..), Seconds(..))
import Effect (Effect)
import Erl.Atom (atom)
import Erl.Data.List (singleton)
import MyGenServer as MGS
import Pinto (RegistryName(..), StartLinkResult)
import Pinto.Supervisor (ChildShutdownTimeoutStrategy(..), ChildType(..), RestartStrategy(..), Strategy(..), SupervisorPid, SupervisorSpec, spec)
import Pinto.Supervisor as SV

startLink ∷ Effect (StartLinkResult SupervisorPid)
startLink = do
  SV.startLink (Just $ Local $ atom "my_sup") init

init ∷ Effect SupervisorSpec
init = do
  pure
    { childSpecs: singleton
        ( spec
            { id: "cool_worker"
            , start: MGS.startLink {}
            , childType: Worker
            , restartStrategy: RestartTransient
            , shutdownStrategy: ShutdownTimeout $ Milliseconds 5000.0
            }
        )
    , flags:
        { strategy: OneForOne
        , intensity: 1
        , period: Seconds 5.0
        }
    }
