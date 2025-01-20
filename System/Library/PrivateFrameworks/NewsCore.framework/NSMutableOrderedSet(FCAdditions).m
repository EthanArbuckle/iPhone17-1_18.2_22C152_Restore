@interface NSMutableOrderedSet(FCAdditions)
- (id)fc_mergeSortedOrderedCollection:()FCAdditions usingComparator:;
- (id)fc_removeAndReturnObjectsPassingTest:()FCAdditions;
- (void)fc_insertObjects:()FCAdditions atIndex:;
- (void)fc_transformWithBlock:()FCAdditions;
@end

@implementation NSMutableOrderedSet(FCAdditions)

- (id)fc_mergeSortedOrderedCollection:()FCAdditions usingComparator:
{
  return mergeSortedOrderedCollections(a3, a1, a4);
}

- (id)fc_removeAndReturnObjectsPassingTest:()FCAdditions
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__NSMutableOrderedSet_FCAdditions__fc_removeAndReturnObjectsPassingTest___block_invoke;
  v9[3] = &unk_1E5B58608;
  id v10 = v4;
  id v5 = v4;
  v6 = [a1 indexesOfObjectsPassingTest:v9];
  v7 = [a1 objectsAtIndexes:v6];
  [a1 removeObjectsAtIndexes:v6];

  return v7;
}

- (void)fc_insertObjects:()FCAdditions atIndex:
{
  v6 = (void *)MEMORY[0x1E4F28D60];
  id v7 = a3;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", a4, objc_msgSend(v7, "count"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [a1 insertObjects:v7 atIndexes:v8];
}

- (void)fc_transformWithBlock:()FCAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5 - 1;
    do
    {
      id v8 = [a1 objectAtIndex:v6];
      unsigned __int8 v12 = 0;
      v9 = v4[2](v4, v8, v6, &v12);
      if (v9 != v8) {
        [a1 replaceObjectAtIndex:v6 withObject:v9];
      }
      int v10 = v12;

      if (v10) {
        break;
      }
    }
    while (v7 != v6++);
  }
}

@end