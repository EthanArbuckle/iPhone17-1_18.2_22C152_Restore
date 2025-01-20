@interface _UIIdentifierDiffer
- (BOOL)hasChanges;
- (id)collectionDifference;
- (id)description;
- (id)initWithBeforeIdentifiers:(void *)a3 afterIdentifiers:;
- (id)initWithBeforeIdentifiers:(void *)a3 afterIdentifiers:(void *)a4 collectionDifference:;
- (void)_performDiffWithOptions:(uint64_t)a1;
- (void)_performFoundationDiffWithOptions:(uint64_t)a1;
- (void)_prepareDiffResultsFromCollectionDifference:(void *)a1;
- (void)deletedIndexes;
- (void)insertedIndexes;
- (void)movePairs;
@end

@implementation _UIIdentifierDiffer

- (void)movePairs
{
  if (a1)
  {
    v2 = (void *)a1[5];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)insertedIndexes
{
  if (a1)
  {
    v2 = (void *)a1[3];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4F28D60] indexSet];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)deletedIndexes
{
  if (a1)
  {
    v2 = (void *)a1[4];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = [MEMORY[0x1E4F28D60] indexSet];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)initWithBeforeIdentifiers:(void *)a3 afterIdentifiers:
{
  id v5 = a2;
  id v6 = a3;
  if (a1) {
    a1 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:collectionDifference:](a1, v5, v6, 0);
  }

  return a1;
}

- (id)initWithBeforeIdentifiers:(void *)a3 afterIdentifiers:(void *)a4 collectionDifference:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_UIIdentifierDiffer;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 6, a4);
      if (v10) {
        -[_UIIdentifierDiffer _performDiffWithOptions:]((uint64_t)a1, 4);
      }
    }
  }

  return a1;
}

- (void)_performDiffWithOptions:(uint64_t)a1
{
  if (a1)
  {
    if (*(void *)(a1 + 48)) {
      -[_UIIdentifierDiffer _prepareDiffResultsFromCollectionDifference:]((void *)a1, *(void **)(a1 + 48));
    }
    else {
      -[_UIIdentifierDiffer _performFoundationDiffWithOptions:](a1, a2);
    }
  }
}

- (BOOL)hasChanges
{
  if (result)
  {
    uint64_t v1 = result;
    return [*(id *)(result + 24) count]
        || [*(id *)(v1 + 32) count]
        || [*(id *)(v1 + 40) count] != 0;
  }
  return result;
}

- (void)_performFoundationDiffWithOptions:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1 && ([*(id *)(a1 + 8) count] || objc_msgSend(*(id *)(a1 + 16), "count")))
  {
    uint64_t v4 = a2 & 2;
    v32 = (void *)a1;
    v33 = [*(id *)(a1 + 16) differenceFromOrderedSet:*(void *)(a1 + 8) withOptions:(2 * v4) ^ 4];
    id v38 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v37 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v34 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v35 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v5 = [v33 insertions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v44;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
          uint64_t v10 = [v9 index];
          if (v4 || (uint64_t v11 = [v9 associatedIndex], v11 == 0x7FFFFFFFFFFFFFFFLL))
          {
            [v38 addIndex:v10];
          }
          else
          {
            v12 = [_UIIdentifierDifferMovePair alloc];
            if (v12)
            {
              v47.receiver = v12;
              v47.super_class = (Class)_UIIdentifierDifferMovePair;
              id v13 = objc_msgSendSuper2(&v47, sel_init);
              v14 = v13;
              if (v13)
              {
                *((void *)v13 + 1) = v11;
                *((void *)v13 + 2) = v10;
              }
            }
            else
            {
              v14 = 0;
            }
            [v36 addObject:v14];
            [v34 addIndex:v11];
            [v35 addIndex:v10];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v15 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
        uint64_t v6 = v15;
      }
      while (v15);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v16 = [v33 removals];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v40;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
          uint64_t v21 = [v20 index];
          if (v4 || (uint64_t v22 = [v20 associatedIndex], v22 == 0x7FFFFFFFFFFFFFFFLL))
          {
            [v37 addIndex:v21];
          }
          else
          {
            v23 = [_UIIdentifierDifferMovePair alloc];
            if (v23)
            {
              v47.receiver = v23;
              v47.super_class = (Class)_UIIdentifierDifferMovePair;
              id v24 = objc_msgSendSuper2(&v47, sel_init);
              v25 = v24;
              if (v24)
              {
                *((void *)v24 + 1) = v21;
                *((void *)v24 + 2) = v22;
              }
            }
            else
            {
              v25 = 0;
            }
            [v36 addObject:v25];
            [v34 addIndex:v21];
            [v35 addIndex:v22];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v26 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
        uint64_t v17 = v26;
      }
      while (v26);
    }

    v27 = (void *)v32[3];
    v32[3] = v38;
    id v28 = v38;

    v29 = (void *)v32[4];
    v32[4] = v37;
    id v30 = v37;

    v31 = (void *)v32[5];
    v32[5] = v36;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionDifference, 0);
  objc_storeStrong((id *)&self->_movePairs, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_afterIdentifiers, 0);
  objc_storeStrong((id *)&self->_beforeIdentifiers, 0);
}

- (id)collectionDifference
{
  uint64_t v1 = a1;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = a1[6];
    if (v2)
    {
      uint64_t v1 = (id *)v2;
    }
    else
    {
      uint64_t v3 = [a1[3] count];
      uint64_t v4 = [v1[4] count] + v3;
      uint64_t v5 = v4 + 2 * [v1[5] count];
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
      id v7 = v1[3];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __43___UIIdentifierDiffer_collectionDifference__block_invoke;
      v29[3] = &unk_1E52E4660;
      v29[4] = v1;
      id v8 = v6;
      id v30 = v8;
      objc_msgSend(v7, "enumerateIndexesUsingBlock:", v29, v8);
      id v9 = v1[4];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __43___UIIdentifierDiffer_collectionDifference__block_invoke_2;
      v27[3] = &unk_1E52E4660;
      v27[4] = v1;
      id v10 = v8;
      id v28 = v10;
      [v9 enumerateIndexesUsingBlock:v27];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id obj = v1[5];
      uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v24;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
            if (v14)
            {
              uint64_t v15 = *(void *)(v14 + 8);
              uint64_t v16 = *(void *)(v14 + 16);
            }
            else
            {
              uint64_t v15 = 0;
              uint64_t v16 = 0;
            }
            uint64_t v17 = [v1[1] objectAtIndexedSubscript:v15];
            uint64_t v18 = [MEMORY[0x1E4F28F18] changeWithObject:v17 type:1 index:v15 associatedIndex:v16];
            uint64_t v19 = [MEMORY[0x1E4F28F18] changeWithObject:v17 type:0 index:v16 associatedIndex:v15];
            [v10 addObject:v18];
            [v10 addObject:v19];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v20 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
          uint64_t v11 = v20;
        }
        while (v20);
      }

      uint64_t v1 = (id *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v10];
    }
  }
  return v1;
}

- (id)description
{
  uint64_t v3 = [(NSSet *)self->_movePairs allObjects];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  uint64_t v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  objc_msgSend(v5, "stringWithFormat:", @"<%@: %p; beforeCount = %lu; afterCount = %lu; inserted: %@; deleted: %@; moved: %@",
    v7,
    self,
    [(NSOrderedSet *)self->_beforeIdentifiers count],
    [(NSOrderedSet *)self->_afterIdentifiers count],
    self->_insertedIndexes,
    self->_deletedIndexes,
  id v8 = v4);

  return v8;
}

- (void)_prepareDiffResultsFromCollectionDifference:(void *)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  if (a1)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v27 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v2 = [v25 removals];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v34;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v34 != v4) {
            objc_enumerationMutation(v2);
          }
          uint64_t v6 = *(void **)(*((void *)&v33 + 1) + 8 * v5);
          uint64_t v7 = [v6 index];
          uint64_t v8 = [v6 associatedIndex];
          if (v8 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v27 addIndex:v7];
          }
          else
          {
            id v9 = [_UIIdentifierDifferMovePair alloc];
            if (v9)
            {
              v37.receiver = v9;
              v37.super_class = (Class)_UIIdentifierDifferMovePair;
              id v10 = objc_msgSendSuper2(&v37, sel_init);
              uint64_t v11 = v10;
              if (v10)
              {
                *((void *)v10 + 1) = v7;
                *((void *)v10 + 2) = v8;
              }
            }
            else
            {
              uint64_t v11 = 0;
            }
            [v28 addObject:v11];
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v12 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v3 = v12;
      }
      while (v12);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = [v25 insertions];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v18 = [v17 index];
          if ([v17 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL) {
            [v26 addIndex:v18];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v14);
    }

    uint64_t v19 = (void *)a1[3];
    a1[3] = v26;
    id v20 = v26;

    uint64_t v21 = (void *)a1[4];
    a1[4] = v27;
    id v22 = v27;

    long long v23 = (void *)a1[5];
    a1[5] = v28;
  }
}

@end