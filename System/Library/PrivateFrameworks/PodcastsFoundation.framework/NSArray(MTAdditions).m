@interface NSArray(MTAdditions)
- (id)arrayByRemovingObject:()MTAdditions;
- (id)filter:()MTAdditions compactMap:;
- (id)mt_allObjectsExcludingIndexes:()MTAdditions;
- (id)mt_compactMap:()MTAdditions;
- (id)mt_filter:()MTAdditions;
- (id)mt_firstObjectPassingTest:()MTAdditions;
- (id)mt_uniqueOrdered;
- (uint64_t)mt_uniqued;
@end

@implementation NSArray(MTAdditions)

- (id)mt_compactMap:()MTAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
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
        v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)mt_filter:()MTAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11)) {
          objc_msgSend(v5, "addObject:", v11, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (id)filter:()MTAdditions compactMap:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = a1;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (v6[2](v6, v14))
        {
          long long v15 = v7[2](v7, v14);
          if (v15) {
            objc_msgSend(v8, "addObject:", v15, (void)v18);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  long long v16 = (void *)[v8 copy];
  return v16;
}

- (id)arrayByRemovingObject:()MTAdditions
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  id v6 = (void *)[v5 copy];
  return v6;
}

- (id)mt_firstObjectPassingTest:()MTAdditions
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__NSArray_MTAdditions__mt_firstObjectPassingTest___block_invoke;
  aBlock[3] = &unk_1E5E61820;
  id v16 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __50__NSArray_MTAdditions__mt_firstObjectPassingTest___block_invoke_2;
  v13 = &unk_1E5E61820;
  id v14 = v5;
  id v6 = v5;
  uint64_t v7 = [a1 indexOfObjectPassingTest:&v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = objc_msgSend(a1, "objectAtIndexedSubscript:", v7, v10, v11, v12, v13, v14);
  }

  return v8;
}

- (id)mt_allObjectsExcludingIndexes:()MTAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, objc_msgSend(a1, "count"));
    [v5 removeIndexes:v4];
    if ([v5 count])
    {
      id v6 = [a1 objectsAtIndexes:v5];
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (uint64_t)mt_uniqued
{
  return [MEMORY[0x1E4F1CAD0] setWithArray:a1];
}

- (id)mt_uniqueOrdered
{
  if ([a1 count])
  {
    v2 = [MEMORY[0x1E4F1CAD0] setWithArray:a1];
    uint64_t v3 = [v2 count];
    if (v3 == [a1 count])
    {
      id v4 = a1;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1CA48] array];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__NSArray_MTAdditions__mt_uniqueOrdered__block_invoke;
      v9[3] = &unk_1E5E61848;
      id v10 = v2;
      id v6 = v5;
      id v11 = v6;
      [a1 enumerateObjectsUsingBlock:v9];
      uint64_t v7 = v11;
      id v4 = v6;
    }
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

@end