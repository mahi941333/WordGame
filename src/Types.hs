{-# LANGUAGE OverloadedStrings #-}

module Types where

-- import Prelude
import Data.List(map, transpose)

grid =  [ "__C________R___"
				, "__SI________U__"
				, "__HASKELL____B_"
				, "__A__A_____S__Y"
				, "__R___B___C____"
				, "__PHP____H_____"
				, "____S_LREP_____"
				, "____I__M_Y__L__"
				, "____L_E__T_O___"
				, "_________HB____"
				, "_________O_____"
				, "________CN_____"
				]

languages = [ "BASIC"
            , "COBOL"
            , "CSHARP"
            , "HASKELL"
            , "LISP"
            , "PERL"
            , "PHP"
            , "PYTHON"
            , "RUBY"
            , "SCHEME"
            ]

type Grid = [String] 

formatGrid :: Grid -> String
formatGrid =  unlines

outputGrid :: Grid -> IO()
outputGrid = putStrLn . formatGrid 

findWordInRow :: Grid -> String -> Bool
findWordInRow grid searchVal = or $ map searchInRow grid 

  where 
		searchInRow rowVal
			| (length searchVal) > (length rowVal) = False
			| otherwise = search rowVal searchVal (length searchVal) (length rowVal)
		
search :: String -> String -> Int -> Int -> Bool
search [] _ _ _ = False
search _ [] _ _ = True
search (z:zs) searchVal l l2 = if l<=l2 && ((take l (z:zs)) == searchVal) then True else search zs searchVal l (l2-1)
	
findWordInRowRev :: Grid -> String -> Bool
findWordInRowRev grid searchVal = or $ map searchInRow (map reverse grid) 

  where 
		searchInRow rowVal
			| (length searchVal) > (length rowVal) = False
			| otherwise = search rowVal searchVal (length searchVal) (length rowVal)

findWordInCol :: Grid -> String -> Bool
findWordInCol grid searchVal = or $ map searchInRow (transpose grid) 

  where 
		searchInRow rowVal
			| (length searchVal) > (length rowVal) = False
			| otherwise = search rowVal searchVal (length searchVal) (length rowVal)

findWordInColRev :: Grid -> String -> Bool
findWordInColRev grid searchVal = or $ map searchInRow (map reverse (transpose grid))

  where 
		searchInRow rowVal
			| (length searchVal) > (length rowVal) = False
			| otherwise = search rowVal searchVal (length searchVal) (length rowVal)

skew :: Grid -> Grid
skew [] = []
skew (x:xs) = x : skew (map (('_' :) ) xs)

 
findDiagonals :: Grid -> String -> Bool
findDiagonals grid searchVal = findWordInCol (map reverse (skew grid))