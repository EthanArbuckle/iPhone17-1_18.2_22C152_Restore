@interface _UICollectionViewPrefetchingContext
- (id)initWithPrefetchItems:(double)a3 prefetchRect:(double)a4;
- (id)peekNextItem;
- (id)popNextItem;
- (id)remainingIndexPaths;
@end

@implementation _UICollectionViewPrefetchingContext

- (id)peekNextItem
{
  if (a1)
  {
    a1 = [a1[2] firstObject];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)initWithPrefetchItems:(double)a3 prefetchRect:(double)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  if (a1)
  {
    v34.receiver = a1;
    v34.super_class = (Class)_UICollectionViewPrefetchingContext;
    a1 = (id *)objc_msgSendSuper2(&v34, sel_init);
    if (a1)
    {
      v12 = (void *)MEMORY[0x1E4F1CBF0];
      if (v11) {
        v12 = v11;
      }
      id v13 = v12;

      uint64_t v14 = [v13 mutableCopy];
      id v15 = a1[2];
      a1[2] = (id)v14;

      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
      id v17 = a1[3];
      a1[3] = (id)v16;

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v13;
      uint64_t v18 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v11);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * v21);
            if (v22) {
              v23 = *(void **)(v22 + 16);
            }
            else {
              v23 = 0;
            }
            v24 = v23;
            v25 = [v24 indexPath];
            v26 = v25;
            if (!v24 || (v24[144] & 1) == 0 || (unint64_t)[v25 length] <= 1)
            {
              v27 = [MEMORY[0x1E4F28B00] currentHandler];
              [v27 handleFailureInMethod:sel_initWithPrefetchItems_prefetchRect_, a1, @"_UICollectionViewPrefetchingContext.m", 32, @"UICollectionView internal bug: Attempting to create prefetching context using invalid attributes. Attributes: %@", v24 object file lineNumber description];
            }
            [a1[3] setObject:v22 forKeyedSubscript:v26];

            ++v21;
          }
          while (v19 != v21);
          uint64_t v28 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
          uint64_t v19 = v28;
        }
        while (v28);
      }

      *((double *)a1 + 4) = a3;
      *((double *)a1 + 5) = a4;
      *((double *)a1 + 6) = a5;
      *((double *)a1 + 7) = a6;
    }
  }

  return a1;
}

- (id)popNextItem
{
  if (a1 && [*(id *)(a1 + 16) count])
  {
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    v3 = [*(id *)(a1 + 16) firstObject];
    v4 = v3;
    if (v3) {
      v3 = (void *)v3[2];
    }
    v5 = [v3 indexPath];
    if (v5) {
      [*(id *)(a1 + 24) removeObjectForKey:v5];
    }
    [*(id *)(a1 + 16) removeObjectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)remainingIndexPaths
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = [a1[2] count];
    if (v2)
    {
      id v3 = v1[1];
      if (!v3)
      {
        v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v5 = v1[2];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
              if (v10) {
                v10 = (void *)v10[2];
              }
              id v11 = v10;
              v12 = objc_msgSend(v11, "indexPath", (void)v15);
              [v4 addObject:v12];

              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v7);
        }

        id v13 = v1[1];
        v1[1] = v4;

        id v3 = v1[1];
      }
      a1 = (id *)v3;
    }
    else
    {
      a1 = (id *)MEMORY[0x1E4F1CBF0];
    }
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsDict, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_remainingIndexPaths, 0);
}

@end