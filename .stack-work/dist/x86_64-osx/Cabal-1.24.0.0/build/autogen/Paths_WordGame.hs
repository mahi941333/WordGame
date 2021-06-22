{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_WordGame (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/mahima/Documents/WordGame/.stack-work/install/x86_64-osx/6b1aa643762f2af5bc49e15de605878b065a7f75a988a624655302519d144d99/8.0.1/bin"
libdir     = "/Users/mahima/Documents/WordGame/.stack-work/install/x86_64-osx/6b1aa643762f2af5bc49e15de605878b065a7f75a988a624655302519d144d99/8.0.1/lib/x86_64-osx-ghc-8.0.1/WordGame-0.1.0.0-K9JWP6iKWZ91yKGaieHeZa"
datadir    = "/Users/mahima/Documents/WordGame/.stack-work/install/x86_64-osx/6b1aa643762f2af5bc49e15de605878b065a7f75a988a624655302519d144d99/8.0.1/share/x86_64-osx-ghc-8.0.1/WordGame-0.1.0.0"
libexecdir = "/Users/mahima/Documents/WordGame/.stack-work/install/x86_64-osx/6b1aa643762f2af5bc49e15de605878b065a7f75a988a624655302519d144d99/8.0.1/libexec"
sysconfdir = "/Users/mahima/Documents/WordGame/.stack-work/install/x86_64-osx/6b1aa643762f2af5bc49e15de605878b065a7f75a988a624655302519d144d99/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "WordGame_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "WordGame_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "WordGame_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "WordGame_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "WordGame_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
