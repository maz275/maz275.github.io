-- Some basic definitions
-- In the class of connectives, SE will play the role of an operator of 
-- structural enrichment
data Entity = Anna | Bob | Carla | David deriving (Eq, Show)
data Connective = NOT | AND | OR | SE deriving (Eq, Show)
data HalfCon = A Bool | O Bool deriving (Eq, Show)
data Content = E Entity | V1 [Entity] | V2 [(Entity, Entity)] | T Bool | C1 Connective | C2 HalfCon | S (Tree Content) deriving (Eq, Show)

-- You can think of LTrees as logical forms, and of Trees as structured
-- propositions.
data LTree a = LLeaf a | LBranch (LTree a) (LTree a) deriving (Eq, Show)
data Tree a = Leaf a | Branch (Tree a) a (Tree a) deriving (Eq, Show)

-- Standard way of evaluating relations
elemR xys y' = [ x | (x,y) <- xys, y==y']

-- Standard semantics for a fragment without quantifiers
eval_aux :: Content -> Content -> Content
eval_aux (E x) (V1 xs) = T(elem x xs)
eval_aux (V2 xys) (E x) = V1(elemR xys x)
eval_aux (C1 NOT) (T x) = T(not x)
eval_aux (C1 AND) (T x) = C2 (A x) 
eval_aux (T x) (C2 (A y)) = T (x && y)
eval_aux (C1 OR) (T x) = C2 (O x)
eval_aux (T x) (C2 (O y)) = T (x || y)

-- An auxiliary function that defines the interpretation of clauses with
-- SE
eval_alt :: Content -> LTree Content -> Content
eval_alt (C1 SE) (LLeaf x) = (S (Leaf x))
eval_alt w'@(C1 SE) x'@(LBranch x y) = (S (Branch (f (eval_alt w' x)) (evalN x') (f (eval_alt w' y))))
	where
		f (S x) = x
		f _ = undefined
eval_alt x (LLeaf y) = eval_aux x y
eval_alt x y'@(LBranch y z) = eval_aux x (eval_alt (f y) z)
	where
		f (LLeaf x) = x
		f (LBranch x y) = eval_alt (f x) y

-- Normal order evaluation
-- Effectively, this is the order of evaluation that allows operators of 
-- structural enrichment to do their special thing.
evalN :: LTree Content -> Content
evalN (LLeaf x) = x
evalN (LBranch (LLeaf x) (LLeaf y)) = eval_alt x (LLeaf y)
evalN (LBranch (LLeaf x) y'@(LBranch y z)) = eval_alt x y'
evalN (LBranch x'@(LBranch x y) z) = eval_alt (evalN x') z

-- Applicative order evaluation
-- This is the standard order of evaluation. I forgot to define it for 
-- cases in which there are operators of structural enrichment. I'll do 
-- that in a future version.
evalApp :: LTree Content -> Content
evalApp (LLeaf x) = x
evalApp (LBranch (LLeaf x) (LLeaf y)) = eval_aux x y
evalApp (LBranch x'@(LBranch x y) w'@(LBranch w z)) = evalApp (LBranch (LLeaf (evalApp x')) w')
evalApp (LBranch x y'@(LBranch y z)) = evalApp (LBranch x (LLeaf (evalApp y')))

-- Interpretation of the predicate "next_to"
next_to = [(Anna, Bob), (Bob, Anna), (Bob, Carla), (Carla, Bob), (Carla, David), (David, Carla)]

-- Some examples. The first example doesn't have an SE operator. It should
-- evaluate to truth whether we use normal or applicative order
test1 = LBranch (LLeaf (E Bob)) (LBranch (LLeaf (V2 next_to)) (LLeaf (E Carla)))
test2 = LBranch (LLeaf (C1 SE)) test1
test3 = LBranch (test1) (LBranch (LLeaf (C1 AND)) (LLeaf (T True)))
test4 = LBranch (test1) (LBranch (LLeaf (C1 AND)) (LLeaf (T False)))
test5 = LBranch (LLeaf (C1 SE)) test2
test6 = LBranch (LLeaf (T True)) (LBranch (LLeaf (C1 OR)) test3)

