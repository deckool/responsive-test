module Paths_projname (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/deck/.cabal/bin"
libdir     = "/home/deck/.cabal/lib/projname-0.1/ghc-7.6.3"
datadir    = "/home/deck/.cabal/share/projname-0.1"
libexecdir = "/home/deck/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "projname_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "projname_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "projname_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projname_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
