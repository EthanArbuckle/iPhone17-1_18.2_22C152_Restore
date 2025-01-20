@interface NSIndexSet(PLAdditions)
- (id)_pl_indexSetByUpdatingWithChangedIndexes:()PLAdditions asInserts:;
- (id)pl_shortDescription;
- (uint64_t)pl_indexSetAdjustedForDeletions:()PLAdditions;
- (uint64_t)pl_indexSetAdjustedForInsertions:()PLAdditions;
- (uint64_t)pl_rangeCoveringIndexSet;
@end

@implementation NSIndexSet(PLAdditions)

- (uint64_t)pl_rangeCoveringIndexSet
{
  uint64_t v2 = [a1 firstIndex];
  if (((v2 != 0x7FFFFFFFFFFFFFFFLL) & ([a1 lastIndex] != 0x7FFFFFFFFFFFFFFFLL)) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

- (uint64_t)pl_indexSetAdjustedForInsertions:()PLAdditions
{
  return objc_msgSend(a1, "_pl_indexSetByUpdatingWithChangedIndexes:asInserts:", a3, 1);
}

- (uint64_t)pl_indexSetAdjustedForDeletions:()PLAdditions
{
  return objc_msgSend(a1, "_pl_indexSetByUpdatingWithChangedIndexes:asInserts:", a3, 0);
}

- (id)_pl_indexSetByUpdatingWithChangedIndexes:()PLAdditions asInserts:
{
  id v6 = a3;
  if ([v6 rangeCount])
  {
    v7 = (void *)[a1 mutableCopy];
    if (a4)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke;
      v14[3] = &unk_1E586AAA8;
      id v8 = v7;
      id v15 = v8;
      [v6 enumerateRangesUsingBlock:v14];
    }
    else
    {
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      v13[3] = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __78__NSIndexSet_PLAdditions___pl_indexSetByUpdatingWithChangedIndexes_asInserts___block_invoke_2;
      v10[3] = &unk_1E586AAD0;
      v12 = v13;
      id v8 = v7;
      id v11 = v8;
      [v6 enumerateRangesUsingBlock:v10];

      _Block_object_dispose(v13, 8);
    }
  }
  else
  {
    id v8 = (id)[a1 copy];
  }

  return v8;
}

- (id)pl_shortDescription
{
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NSIndexSet_PLAdditions__pl_shortDescription__block_invoke;
  v7[3] = &unk_1E586AAA8;
  id v8 = v3;
  id v4 = v3;
  [a1 enumerateRangesUsingBlock:v7];
  v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

@end