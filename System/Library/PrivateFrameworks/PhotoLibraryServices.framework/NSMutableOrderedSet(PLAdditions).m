@interface NSMutableOrderedSet(PLAdditions)
- (void)pl_addObjectsFromArray:()PLAdditions;
- (void)pl_insertObjects:()PLAdditions atIndex:;
- (void)pl_removeObjectsInArray:()PLAdditions;
- (void)pl_removeObjectsPassingTest:()PLAdditions;
@end

@implementation NSMutableOrderedSet(PLAdditions)

- (void)pl_removeObjectsPassingTest:()PLAdditions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__NSMutableOrderedSet_PLAdditions__pl_removeObjectsPassingTest___block_invoke;
    v7[3] = &unk_1E586FBD8;
    id v8 = v4;
    v6 = [a1 indexesOfObjectsPassingTest:v7];
    [a1 removeObjectsAtIndexes:v6];
  }
}

- (void)pl_insertObjects:()PLAdditions atIndex:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        uint64_t v12 = [a1 indexOfObject:v11];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [a1 insertObject:v11 atIndex:a4 + i];
        }
        else if (a4 + i != v12)
        {
          v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v12];
          [a1 moveObjectsAtIndexes:v13 toIndex:a4 + i];
        }
      }
      a4 += i;
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)pl_removeObjectsInArray:()PLAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28E60] indexSet];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "indexOfObject:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
          if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [a1 removeObjectsAtIndexes:v5];
  }
}

- (void)pl_addObjectsFromArray:()PLAdditions
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [a1 count];
    uint64_t v6 = [v4 count];
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v5, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [a1 insertObjects:v4 atIndexes:v7];
  }
}

@end