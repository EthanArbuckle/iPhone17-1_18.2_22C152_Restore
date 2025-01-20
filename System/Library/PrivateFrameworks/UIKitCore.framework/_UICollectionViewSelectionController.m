@interface _UICollectionViewSelectionController
- (_UICollectionViewSelectionController)init;
- (id)_rebaseIndexPaths:(void *)a3 withTransaction:;
- (id)_rebaseIndexPaths:(void *)a3 withTranslator:;
- (id)_updateCollapsedSelectedIndexPaths:(void *)a3 withTransaction:;
- (id)rebaseIndexPath:(void *)a3 withDiffableTransaction:;
- (uint64_t)rebaseItemsWithDiffableTransaction:(uint64_t)result;
- (uint64_t)setAllowsMultipleSelection:(uint64_t)result;
- (void)addDeselectionTransitionIndexPaths:(uint64_t)a1;
- (void)rebaseItemsWithTranslator:(uint64_t)a1;
- (void)reset;
@end

@implementation _UICollectionViewSelectionController

- (_UICollectionViewSelectionController)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewSelectionController;
  v2 = [(_UICollectionViewSelectionController *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    selectedIndexPaths = v2->_selectedIndexPaths;
    v2->_selectedIndexPaths = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    highlightedIndexPaths = v2->_highlightedIndexPaths;
    v2->_highlightedIndexPaths = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    nonvisibleTrackedSelectedIdentifiers = v2->_nonvisibleTrackedSelectedIdentifiers;
    v2->_nonvisibleTrackedSelectedIdentifiers = v7;
  }
  return v2;
}

- (uint64_t)rebaseItemsWithDiffableTransaction:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([a2 isReorderingTransaction])
    {
      return 0;
    }
    else
    {
      v4 = -[_UICollectionViewSelectionController _updateCollapsedSelectedIndexPaths:withTransaction:](v3, *(void **)(v3 + 8), a2);
      v5 = -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](v3, *(void **)(v3 + 8), a2);
      uint64_t v6 = [v5 mutableCopy];
      v7 = *(void **)(v3 + 8);
      *(void *)(v3 + 8) = v6;

      v8 = *(void **)(v3 + 8);
      v9 = [v4 allObjects];
      [v8 addObjectsFromArray:v9];

      objc_super v10 = -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](v3, *(void **)(v3 + 16), a2);
      uint64_t v11 = [v10 mutableCopy];
      v12 = *(void **)(v3 + 16);
      *(void *)(v3 + 16) = v11;

      v13 = *(void **)(v3 + 24);
      if (v13)
      {
        v14 = -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](v3, v13, a2);
        uint64_t v15 = [v14 mutableCopy];
        v16 = *(void **)(v3 + 24);
        *(void *)(v3 + 24) = v15;
      }
      return 1;
    }
  }
  return result;
}

- (id)_rebaseIndexPaths:(void *)a3 withTransaction:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v5 = [a3 initialSnapshot];
    uint64_t v6 = [a2 count];
    id v7 = (id)MEMORY[0x1E4F1CBF0];
    if (v5 && v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = a2;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [v5 identifierForIndexPath:*(void *)(*((void *)&v28 + 1) + 8 * i)];
            if (v13) {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v10);
      }
    }
    if ([v7 count])
    {
      v14 = [a3 finalSnapshot];
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = v7;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = objc_msgSend(v14, "indexPathForIdentifier:", *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
            if (v21) {
              [v15 addObject:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v18);
      }

      v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA80] set];
    }
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)_updateCollapsedSelectedIndexPaths:(void *)a3 withTransaction:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v6 = a2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          v12 = [a3 finalIndexPathForInitialIndexPath:v11];
          if (!v12)
          {
            v13 = [a3 initialSnapshot];
            v14 = [v13 identifierForIndexPath:v11];

            if (v14 && [a3 _containsItemIdentifier:v14]) {
              [v5 addObject:v14];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v8);
    }
    v35 = v5;

    id v15 = [a3 finalSnapshot];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v18 = *(id *)(a1 + 32);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          if (objc_msgSend(v15, "indexOfItemIdentifier:", v23, v35) != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v17 addObject:v23];
LABEL_23:
            [v16 addObject:v23];
            continue;
          }
          if (([a3 _containsItemIdentifier:v23] & 1) == 0) {
            goto LABEL_23;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v20);
    }

    [*(id *)(a1 + 32) minusSet:v16];
    long long v24 = *(void **)(a1 + 32);
    long long v25 = [v35 allObjects];
    [v24 addObjectsFromArray:v25];

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v27 = v17;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = objc_msgSend(v15, "indexPathForIdentifier:", *(void *)(*((void *)&v37 + 1) + 8 * k), v35);
          if (v32) {
            [v26 addObject:v32];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v29);
    }

    v33 = [MEMORY[0x1E4F1CAD0] setWithArray:v26];
  }
  else
  {
    v33 = 0;
  }
  return v33;
}

- (void)rebaseItemsWithTranslator:(uint64_t)a1
{
  if (a1)
  {
    v4 = -[_UICollectionViewSelectionController _rebaseIndexPaths:withTranslator:](a1, *(void **)(a1 + 8), a2);
    uint64_t v5 = [v4 mutableCopy];
    id v6 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v5;

    uint64_t v7 = -[_UICollectionViewSelectionController _rebaseIndexPaths:withTranslator:](a1, *(void **)(a1 + 16), a2);
    uint64_t v8 = [v7 mutableCopy];
    uint64_t v9 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v8;

    uint64_t v10 = *(void **)(a1 + 24);
    if (v10)
    {
      -[_UICollectionViewSelectionController _rebaseIndexPaths:withTranslator:](a1, v10, a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v13 mutableCopy];
      v12 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v11;
    }
  }
}

- (id)_rebaseIndexPaths:(void *)a3 withTranslator:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = a2;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a3, "finalIndexPathForInitialIndexPath:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)reset
{
  if (a1)
  {
    [*(id *)(a1 + 8) removeAllObjects];
    [*(id *)(a1 + 16) removeAllObjects];
    v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (uint64_t)setAllowsMultipleSelection:(uint64_t)result
{
  if (result)
  {
    char v2 = a2;
    uint64_t v3 = result;
    int v4 = *(unsigned __int8 *)(result + 40);
    if (v4 != a2)
    {
      result = [*(id *)(result + 8) count];
      *(unsigned char *)(v3 + 40) = v2;
      if (v4)
      {
        if ((v2 & 1) == 0 && result)
        {
          id v5 = *(void **)(v3 + 32);
          return [v5 removeAllObjects];
        }
      }
    }
  }
  return result;
}

- (void)addDeselectionTransitionIndexPaths:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void **)(a1 + 24);
    if (v3)
    {
      [v3 addObjectsFromArray:a2];
    }
    else
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a2];
      id v5 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v4;
    }
  }
}

- (id)rebaseIndexPath:(void *)a3 withDiffableTransaction:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = a2;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v7 = [v5 setWithArray:v6];
    uint64_t v8 = -[_UICollectionViewSelectionController _rebaseIndexPaths:withTransaction:](a1, v7, a3);

    uint64_t v9 = [v8 anyObject];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonvisibleTrackedSelectedIdentifiers, 0);
  objc_storeStrong((id *)&self->_deselectionTransitionIndexPaths, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPaths, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
}

@end