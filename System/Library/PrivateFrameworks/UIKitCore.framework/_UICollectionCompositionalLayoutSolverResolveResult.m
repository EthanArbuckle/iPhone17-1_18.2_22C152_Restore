@interface _UICollectionCompositionalLayoutSolverResolveResult
- (_UICollectionCompositionalLayoutSolverResolveResult)init;
- (id)description;
- (id)indexPathsForDeletedDecorationsForElementKind:(id *)a1;
- (id)indexPathsForDeletedSupplememtariesForElementKind:(id *)a1;
- (id)indexPathsForInsertedDecorationsForElementKind:(id *)a1;
- (id)indexPathsForInsertedSupplememtariesForElementKind:(id *)a1;
- (void)addDeletedAuxillaryOfElementKind:(uint64_t)a3 atIndexPath:(int)a4 isSupplementary:;
- (void)addInsertedAuxillaryOfElementKind:(uint64_t)a3 atIndexPath:(int)a4 isSupplementary:;
- (void)setContentOffsetAdjustment:(CGPoint)a3;
- (void)setSectionsWereRequeried:(BOOL)a3;
@end

@implementation _UICollectionCompositionalLayoutSolverResolveResult

- (void)addInsertedAuxillaryOfElementKind:(uint64_t)a3 atIndexPath:(int)a4 isSupplementary:
{
  if (!a1) {
    return;
  }
  if (![a2 length])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_addInsertedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, @"_UICollectionCompositionalLayoutSolver.m", 3923, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
LABEL_13:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_addInsertedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, @"_UICollectionCompositionalLayoutSolver.m", 3924, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    goto LABEL_4;
  }
  if (!a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (a4) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = 16;
  }
  v9 = [*(id *)(a1 + v8) objectForKeyedSubscript:a2];
  if (!v9)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + v8) setObject:v12 forKeyedSubscript:a2];
    v9 = v12;
  }
  id v13 = v9;
  [v9 addObject:a3];
}

- (void)addDeletedAuxillaryOfElementKind:(uint64_t)a3 atIndexPath:(int)a4 isSupplementary:
{
  if (!a1) {
    return;
  }
  if (![a2 length])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_addDeletedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, @"_UICollectionCompositionalLayoutSolver.m", 3907, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
LABEL_13:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel_addDeletedAuxillaryOfElementKind_atIndexPath_isSupplementary_, a1, @"_UICollectionCompositionalLayoutSolver.m", 3908, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    goto LABEL_4;
  }
  if (!a3) {
    goto LABEL_13;
  }
LABEL_4:
  if (a4) {
    uint64_t v8 = 24;
  }
  else {
    uint64_t v8 = 32;
  }
  v9 = [*(id *)(a1 + v8) objectForKeyedSubscript:a2];
  if (!v9)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [*(id *)(a1 + v8) setObject:v12 forKeyedSubscript:a2];
    v9 = v12;
  }
  id v13 = v9;
  [v9 addObject:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedDecorationElementKindIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryElementKindIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_insertedDecorationElementKindIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryElementKindIndexPathsDict, 0);
}

- (void)setContentOffsetAdjustment:(CGPoint)a3
{
  self->_contentOffsetAdjustment = a3;
}

- (id)indexPathsForInsertedDecorationsForElementKind:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_indexPathsForInsertedDecorationsForElementKind_, v2, @"_UICollectionCompositionalLayoutSolver.m", 3954, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v4 = [v2[2] objectForKeyedSubscript:a2];
    v5 = v4;
    if (v4) {
      v6 = v4;
    }
    else {
      v6 = (id *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    v2 = v6;
  }
  return v2;
}

- (id)indexPathsForInsertedSupplememtariesForElementKind:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_indexPathsForInsertedSupplememtariesForElementKind_, v2, @"_UICollectionCompositionalLayoutSolver.m", 3949, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v4 = [v2[1] objectForKeyedSubscript:a2];
    v5 = v4;
    if (v4) {
      v6 = v4;
    }
    else {
      v6 = (id *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    v2 = v6;
  }
  return v2;
}

- (id)indexPathsForDeletedSupplememtariesForElementKind:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_indexPathsForDeletedSupplememtariesForElementKind_, v2, @"_UICollectionCompositionalLayoutSolver.m", 3939, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v4 = [v2[3] objectForKeyedSubscript:a2];
    v5 = v4;
    if (v4) {
      v6 = v4;
    }
    else {
      v6 = (id *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    v2 = v6;
  }
  return v2;
}

- (id)indexPathsForDeletedDecorationsForElementKind:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_indexPathsForDeletedDecorationsForElementKind_, v2, @"_UICollectionCompositionalLayoutSolver.m", 3944, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v4 = [v2[4] objectForKeyedSubscript:a2];
    v5 = v4;
    if (v4) {
      v6 = v4;
    }
    else {
      v6 = (id *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    v2 = v6;
  }
  return v2;
}

- (void)setSectionsWereRequeried:(BOOL)a3
{
  self->_sectionsWereRequeried = a3;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionCompositionalLayoutSolverResolveResult;
  v2 = [(_UICollectionCompositionalLayoutSolverResolveResult *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    insertedSupplementaryElementKindIndexPathsDict = v2->_insertedSupplementaryElementKindIndexPathsDict;
    v2->_insertedSupplementaryElementKindIndexPathsDict = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    insertedDecorationElementKindIndexPathsDict = v2->_insertedDecorationElementKindIndexPathsDict;
    v2->_insertedDecorationElementKindIndexPathsDict = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedSupplementaryElementKindIndexPathsDict = v2->_deletedSupplementaryElementKindIndexPathsDict;
    v2->_deletedSupplementaryElementKindIndexPathsDict = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deletedDecorationElementKindIndexPathsDict = v2->_deletedDecorationElementKindIndexPathsDict;
    v2->_deletedDecorationElementKindIndexPathsDict = v9;
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: insertedSupplementaries: %@; insertedDecorations: %@; deletedSupplementaries: %@; deletedDecorations: %@>",
    v5,
    self,
    self->_insertedSupplementaryElementKindIndexPathsDict,
    self->_insertedDecorationElementKindIndexPathsDict,
    self->_deletedSupplementaryElementKindIndexPathsDict,
  v6 = self->_deletedDecorationElementKindIndexPathsDict);

  return v6;
}

@end