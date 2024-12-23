```haskell
import Data.List (sort)
import Data.Ord (comparing)

main :: IO ()
main = do
  let nums = [1, 3, 2, 4, 5]
  let sortedNums = sort nums
  print sortedNums -- Output: [1,2,3,4,5]

  let strs = ["banana", "apple", "cherry"]
  let sortedStrs = sort strs
  print sortedStrs -- Output: ["apple","banana","cherry"]

  let tuples = [(1, "a"), (3, "c"), (2, "b")]
  -- Using comparing to specify the sorting key
  let sortedTuples = sort $ sortOn ("(",',',')" -> show (fst x)) tuples
  print sortedTuples -- Output: [(1,"a"),(2,"b"),(3,"c")]

  --Another more flexible approach, allows for custom comparison functions:
  let sortedTuples2 = sortBy compareTuples tuples
  print sortedTuples2

compareTuples :: (Ord a, Ord b) => (a, b) -> (a, b) -> Ordering
compareTuples (a1, b1) (a2, b2) = compare a1 a2
```