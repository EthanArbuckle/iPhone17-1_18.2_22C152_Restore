@interface _UICollectionLayoutSolveResult
- (_UICollectionLayoutSolveResult)init;
- (id)indexesForInvalidatedAuxillariesOfKind:(id *)a1;
- (id)invalidatedAuxillaryKinds;
- (void)addInvalidatedAuxillaryOfKind:(uint64_t)a3 indexes:;
- (void)addInvalidatedSupplementariesWithOffsets:(uint64_t)a1;
@end

@implementation _UICollectionLayoutSolveResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedAuxillaryIndexesDict, 0);
  objc_storeStrong((id *)&self->_invalidatedIndexes, 0);
}

- (id)invalidatedAuxillaryKinds
{
  if (a1)
  {
    v1 = (void *)MEMORY[0x1E4F1CAD0];
    v2 = [*(id *)(a1 + 16) allKeys];
    v3 = [v1 setWithArray:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_UICollectionLayoutSolveResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionLayoutSolveResult;
  v2 = [(_UICollectionLayoutSolveResult *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    invalidatedIndexes = v2->_invalidatedIndexes;
    v2->_invalidatedIndexes = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    invalidatedAuxillaryIndexesDict = v2->_invalidatedAuxillaryIndexesDict;
    v2->_invalidatedAuxillaryIndexesDict = v5;
  }
  return v2;
}

- (void)addInvalidatedSupplementariesWithOffsets:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = objc_msgSend(a2, "elementKinds", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          v10 = [a2 indexesForElementKind:v9];
          -[_UICollectionLayoutSolveResult addInvalidatedAuxillaryOfKind:indexes:](a1, v9, (uint64_t)v10);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)addInvalidatedAuxillaryOfKind:(uint64_t)a3 indexes:
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_addInvalidatedAuxillaryOfKind_indexes_, a1, @"_UICollectionLayoutHelpers.m", 1431, @"Invalid parameter not satisfying: %@", @"kind" object file lineNumber description];
    }
    uint64_t v6 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
    if (!v6)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      [*(id *)(a1 + 16) setObject:v8 forKeyedSubscript:a2];
      uint64_t v6 = v8;
    }
    id v9 = v6;
    [v6 addIndexes:a3];
  }
}

- (id)indexesForInvalidatedAuxillariesOfKind:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_indexesForInvalidatedAuxillariesOfKind_, v2, @"_UICollectionLayoutHelpers.m", 1457, @"Invalid parameter not satisfying: %@", @"kind" object file lineNumber description];
    }
    v4 = [v2[2] objectForKeyedSubscript:a2];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = v4;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28D60] indexSet];
    }
    v2 = v6;
  }
  return v2;
}

@end