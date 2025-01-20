@interface _UICollectionPreferredSizes
- (_UICollectionPreferredSizes)init;
- (__n128)setObject:(uint64_t)a3 atIndexedSubscript:;
- (double)largestItemSize;
- (id)copyByDirtyingPreferredSizes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)elementKinds;
- (id)indexes;
- (id)indexesOfItemsWithoutPreferredSizesInRange:(uint64_t)a3;
- (id)initWithSizes:(void *)a3 indexes:(void *)a4 supplementarySizesDict:(uint64_t)a5 frameOffset:(void *)a6 supplementaryBaseOffsets:;
- (id)objectAtIndexedSubscript:(uint64_t)a1;
- (id)objectForKeyedSubscript:(uint64_t)a1;
- (id)preferredSizesApplyingFrameOffset:(void *)a3 supplementaryBaseOffsets:;
- (uint64_t)containsSupplementaryOffsets:(uint64_t)a1;
@end

@implementation _UICollectionPreferredSizes

- (id)objectAtIndexedSubscript:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32) + a2];
    v4 = [v2 objectForKeyedSubscript:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryBaseOffsets, 0);
  objc_storeStrong((id *)&self->_supplementarySizesDict, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_sizes, 0);
}

- (id)preferredSizesApplyingFrameOffset:(void *)a3 supplementaryBaseOffsets:
{
  id v3 = a1;
  if (a1)
  {
    uint64_t v5 = a1[4];
    v4 = (void *)a1[5];
    uint64_t v6 = v5 + a2;
    if (v4)
    {
      objc_msgSend(v4, "offsetsByApplyingOffsets:");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = a3;
    }
    v8 = v7;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10 = (void *)*((void *)v3 + 3);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90___UICollectionPreferredSizes_preferredSizesApplyingFrameOffset_supplementaryBaseOffsets___block_invoke;
    v14[3] = &unk_1E52E0838;
    id v15 = v8;
    id v16 = v9;
    id v11 = v9;
    id v12 = v8;
    [v10 enumerateKeysAndObjectsUsingBlock:v14];
    id v3 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], *((void **)v3 + 1), *((void **)v3 + 2), v11, v6, v12);
  }
  return v3;
}

- (id)initWithSizes:(void *)a3 indexes:(void *)a4 supplementarySizesDict:(uint64_t)a5 frameOffset:(void *)a6 supplementaryBaseOffsets:
{
  if (!a1) {
    return 0;
  }
  v19.receiver = a1;
  v19.super_class = (Class)_UICollectionPreferredSizes;
  id v11 = objc_msgSendSuper2(&v19, sel_init);
  if (v11)
  {
    if (a2) {
      id v12 = (id)[a2 mutableCopy];
    }
    else {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v13 = (void *)*((void *)v11 + 1);
    *((void *)v11 + 1) = v12;

    if (a3) {
      id v14 = (id)[a3 mutableCopy];
    }
    else {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    }
    id v15 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v14;

    if (a4) {
      id v16 = (id)[a4 mutableCopy];
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v17 = (void *)*((void *)v11 + 3);
    *((void *)v11 + 3) = v16;

    *((void *)v11 + 4) = a5;
    objc_storeStrong((id *)v11 + 5, a6);
  }
  return v11;
}

- (id)objectForKeyedSubscript:(uint64_t)a1
{
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_objectForKeyedSubscript_, a1, @"_UICollectionPreferredSizes.m", 167, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v4 = [*(id *)(a1 + 24) objectForKeyedSubscript:a2];
    if (!v4)
    {
      v4 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], 0, 0, 0, *(void *)(a1 + 32), *(void **)(a1 + 40));
      [*(id *)(a1 + 24) setObject:v4 forKeyedSubscript:a2];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_UICollectionPreferredSizes)init
{
  return (_UICollectionPreferredSizes *)-[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:](self, 0, 0, 0, 0, 0);
}

- (id)elementKinds
{
  if (a1)
  {
    v1 = (void *)MEMORY[0x1E4F1CAD0];
    v2 = [*(id *)(a1 + 24) allKeys];
    id v3 = [v1 setWithArray:v2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (__n128)setObject:(uint64_t)a3 atIndexedSubscript:
{
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 32) + a3;
    uint64_t v6 = *(void **)(a1 + 8);
    id v7 = [NSNumber numberWithInteger:v5];
    if (a2)
    {
      [v6 setObject:a2 forKeyedSubscript:v7];

      [*(id *)(a1 + 16) addIndex:v5];
    }
    else
    {
      [v6 removeObjectForKey:v7];

      [*(id *)(a1 + 16) removeIndex:v5];
    }
    __n128 result = *(__n128 *)MEMORY[0x1E4F1DB30];
    *(_OWORD *)(a1 + 48) = *MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (id)indexes
{
  if (a1)
  {
    if (*(void *)(a1 + 32))
    {
      id v2 = (id)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:*(void *)(a1 + 16)];
      [v2 shiftIndexesStartingAtIndex:0 by:*(void *)(a1 + 32)];
    }
    else
    {
      id v2 = *(id *)(a1 + 16);
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)copyByDirtyingPreferredSizes
{
  id v1 = a1;
  if (a1)
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1[1], "count"));
    id v3 = (void *)*((void *)v1 + 1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke;
    v11[3] = &unk_1E52E0860;
    id v12 = v2;
    id v4 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v11];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = (void *)*((void *)v1 + 3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke_2;
    v9[3] = &unk_1E52E0888;
    id v10 = v5;
    id v7 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    id v1 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], v4, *((void **)v1 + 2), v7, *((void *)v1 + 4), *((void **)v1 + 5));
  }
  return v1;
}

- (id)indexesOfItemsWithoutPreferredSizesInRange:(uint64_t)a3
{
  if (a1)
  {
    uint64_t v3 = a3;
    if (a3)
    {
      id v5 = -[_UICollectionPreferredSizes indexes](a1);
      id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      if (a2 < a2 + v3)
      {
        do
        {
          if (([v5 containsIndex:a2] & 1) == 0) {
            [v6 addIndex:a2];
          }
          ++a2;
          --v3;
        }
        while (v3);
      }
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28D60] indexSet];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_UICollectionPreferredSizes allocWithZone:a3];
  sizes = self->_sizes;
  indexes = self->_indexes;
  supplementarySizesDict = self->_supplementarySizesDict;
  int64_t frameOffset = self->_frameOffset;
  supplementaryBaseOffsets = self->_supplementaryBaseOffsets;
  return -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:](v4, sizes, indexes, supplementarySizesDict, frameOffset, supplementaryBaseOffsets);
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [NSNumber numberWithInteger:self->_frameOffset];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p: frameOffset=<%@>; supplementaryBaseOffsets=<%@>; sizes=%@ >",
    v5,
    self,
    v6,
    self->_supplementaryBaseOffsets,
  id v7 = self->_sizes);

  return v7;
}

- (uint64_t)containsSupplementaryOffsets:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel_containsSupplementaryOffsets_, v2, @"_UICollectionPreferredSizes.m", 187, @"Invalid parameter not satisfying: %@", @"supplementaryOffsets" object file lineNumber description];
    }
    id v4 = a2;
    id v5 = v4;
    if (*(void *)(v2 + 40))
    {
      uint64_t v6 = objc_msgSend(v4, "offsetsByApplyingOffsets:");

      id v5 = (void *)v6;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = -[_UICollectionPreferredSizes elementKinds](v2);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v13 = -[_UICollectionPreferredSizes objectForKeyedSubscript:](v2, v12);
          if (v13)
          {
            uint64_t v14 = [v5 rangeForElementKind:v12];
            if (v15)
            {
              uint64_t v16 = v14;
              uint64_t v17 = v15;
              v18 = -[_UICollectionPreferredSizes indexes]((uint64_t)v13);
              uint64_t v19 = objc_msgSend(v18, "countOfIndexesInRange:", v16, v17);

              if (v19)
              {

                uint64_t v2 = 1;
                goto LABEL_18;
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v2 = 0;
LABEL_18:
  }
  return v2;
}

- (double)largestItemSize
{
  if (!a1) {
    return 0.0;
  }
  if (![*(id *)(a1 + 8) count]) {
    return *MEMORY[0x1E4F1DB30];
  }
  double v2 = *(double *)(a1 + 48);
  if (v2 == *MEMORY[0x1E4F1DB30] && *(double *)(a1 + 56) == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    uint64_t v8 = 0;
    uint64_t v9 = (double *)&v8;
    uint64_t v10 = 0x3010000000;
    id v11 = &unk_186D7DBA7;
    long long v12 = *MEMORY[0x1E4F1DB30];
    id v4 = -[_UICollectionPreferredSizes indexes](a1);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46___UICollectionPreferredSizes_largestItemSize__block_invoke;
    v7[3] = &unk_1E52E08B0;
    v7[4] = a1;
    v7[5] = &v8;
    [v4 enumerateIndexesUsingBlock:v7];

    id v5 = v9;
    *(_OWORD *)(a1 + 48) = *((_OWORD *)v9 + 2);
    double v2 = v5[4];
    _Block_object_dispose(&v8, 8);
  }
  return v2;
}

@end