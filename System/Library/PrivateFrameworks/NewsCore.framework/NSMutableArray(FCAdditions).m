@interface NSMutableArray(FCAdditions)
- (id)fc_mergeSortedOrderedCollection:()FCAdditions usingComparator:;
- (id)fc_popFirstObject;
- (id)fc_popLastObject;
- (id)fc_popLeadingObjectsOfCount:()FCAdditions;
- (id)fc_safelyPopFirstObject;
- (uint64_t)fc_removeFirstObject;
- (uint64_t)fc_removeObject:()FCAdditions sortedUsingSelector:;
- (uint64_t)fc_reverseObjects;
- (uint64_t)fc_safelyAddObjectsFromArray:()FCAdditions;
- (unint64_t)fc_trimFromFrontToMaxCount:()FCAdditions;
- (unint64_t)fc_trimToMaxCount:()FCAdditions;
- (void)fc_insertObject:()FCAdditions inOrderRelativeToContents:;
- (void)fc_insertObject:()FCAdditions sortedUsingSelector:;
- (void)fc_insertObjects:()FCAdditions atIndex:;
- (void)fc_insertObjects:()FCAdditions inOrderRelativeToContents:;
- (void)fc_removeObjectsPassingTest:()FCAdditions;
- (void)fc_replaceObjectIdenticalTo:()FCAdditions withObject:;
- (void)fc_replaceObjectIdenticalTo:()FCAdditions withObjects:;
- (void)fc_rotateRightWithCount:()FCAdditions;
- (void)fc_safelyAddObject:()FCAdditions;
@end

@implementation NSMutableArray(FCAdditions)

- (void)fc_safelyAddObject:()FCAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (uint64_t)fc_safelyAddObjectsFromArray:()FCAdditions
{
  if (!a3) {
    a3 = MEMORY[0x1E4F1CBF0];
  }
  return [a1 addObjectsFromArray:a3];
}

- (id)fc_popFirstObject
{
  v2 = [a1 objectAtIndex:0];
  [a1 removeObjectAtIndex:0];
  return v2;
}

- (void)fc_removeObjectsPassingTest:()FCAdditions
{
  v7 = a3;
  uint64_t v4 = [a1 count];
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      v6 = [a1 objectAtIndex:v5];
      if (v7[2](v7, v6)) {
        [a1 removeObjectAtIndex:v5];
      }

      --v5;
    }
    while (v5 != -1);
  }
}

- (void)fc_insertObjects:()FCAdditions atIndex:
{
  v6 = (void *)MEMORY[0x1E4F28D60];
  id v7 = a3;
  objc_msgSend(v6, "indexSetWithIndexesInRange:", a4, objc_msgSend(v7, "count"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [a1 insertObjects:v7 atIndexes:v8];
}

- (unint64_t)fc_trimFromFrontToMaxCount:()FCAdditions
{
  unint64_t result = [a1 count];
  if (result > a3)
  {
    return objc_msgSend(a1, "removeObjectsInRange:", 0, result - a3);
  }
  return result;
}

- (id)fc_mergeSortedOrderedCollection:()FCAdditions usingComparator:
{
  return mergeSortedOrderedCollections(a3, a1, a4);
}

- (void)fc_insertObject:()FCAdditions sortedUsingSelector:
{
  id v6 = a3;
  uint64_t v7 = [a1 count];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__NSMutableArray_FCAdditions__fc_insertObject_sortedUsingSelector___block_invoke_0;
  v8[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v8[4] = a4;
  objc_msgSend(a1, "insertObject:atIndex:", v6, objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v7, 1024, v8));
}

- (uint64_t)fc_removeObject:()FCAdditions sortedUsingSelector:
{
  id v6 = a3;
  uint64_t v7 = [a1 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__NSMutableArray_FCAdditions__fc_removeObject_sortedUsingSelector___block_invoke_0;
  v10[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v10[4] = a4;
  uint64_t v8 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v7, 256, v10);

  return [a1 removeObjectAtIndex:v8];
}

- (uint64_t)fc_removeFirstObject
{
  uint64_t result = [a1 count];
  if (result)
  {
    return [a1 removeObjectAtIndex:0];
  }
  return result;
}

- (id)fc_safelyPopFirstObject
{
  if ([a1 count])
  {
    v2 = [a1 objectAtIndex:0];
    [a1 removeObjectAtIndex:0];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)fc_popLeadingObjectsOfCount:()FCAdditions
{
  unint64_t v5 = [a1 count];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v6);
  uint64_t v8 = [a1 objectsAtIndexes:v7];
  [a1 removeObjectsAtIndexes:v7];

  return v8;
}

- (id)fc_popLastObject
{
  v2 = [a1 lastObject];
  [a1 removeLastObject];
  return v2;
}

- (void)fc_insertObject:()FCAdditions inOrderRelativeToContents:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "object");
    *(_DWORD *)buf = 136315906;
    v10 = "-[NSMutableArray(FCAdditions) fc_insertObject:inOrderRelativeToContents:]";
    __int16 v11 = 2080;
    v12 = "NSMutableArray+FCAdditions.m";
    __int16 v13 = 1024;
    int v14 = 101;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a4 == 1)
  {
    uint64_t v7 = [a1 count];
  }
  else if (a4)
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = 0;
  }
  [a1 insertObject:v6 atIndex:v7];
}

- (void)fc_insertObjects:()FCAdditions inOrderRelativeToContents:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "objects");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[NSMutableArray(FCAdditions) fc_insertObjects:inOrderRelativeToContents:]";
    __int16 v12 = 2080;
    __int16 v13 = "NSMutableArray+FCAdditions.m";
    __int16 v14 = 1024;
    int v15 = 124;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (a4 == 1)
  {
    uint64_t v7 = [a1 count];
  }
  else if (a4)
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7, objc_msgSend(v6, "count"));
  [a1 insertObjects:v6 atIndexes:v8];
}

- (unint64_t)fc_trimToMaxCount:()FCAdditions
{
  unint64_t result = [a1 count];
  if (result > a3)
  {
    return objc_msgSend(a1, "removeObjectsInRange:", a3, result - a3);
  }
  return result;
}

- (void)fc_replaceObjectIdenticalTo:()FCAdditions withObject:
{
  id v7 = a4;
  uint64_t v6 = [a1 indexOfObjectIdenticalTo:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 replaceObjectAtIndex:v6 withObject:v7];
  }
}

- (void)fc_replaceObjectIdenticalTo:()FCAdditions withObjects:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 indexOfObjectIdenticalTo:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    [a1 removeObjectAtIndex:v7];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(a1, "insertObject:atIndex:", *(void *)(*((void *)&v14 + 1) + 8 * i), v8 + i, (void)v14);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        v8 += i;
      }
      while (v11);
    }
  }
}

- (uint64_t)fc_reverseObjects
{
  uint64_t result = [a1 count];
  if (result)
  {
    uint64_t result = [a1 count];
    unint64_t v3 = result - 1;
    if (result != 1)
    {
      unint64_t v4 = 1;
      do
        uint64_t result = [a1 exchangeObjectAtIndex:v4 - 1 withObjectAtIndex:v3--];
      while (v4++ < v3);
    }
  }
  return result;
}

- (void)fc_rotateRightWithCount:()FCAdditions
{
  if (a3)
  {
    objc_msgSend(a1, "fc_popLastObject");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [a1 insertObject:v5 atIndex:0];
    objc_msgSend(a1, "fc_rotateRightWithCount:", a3 - 1);
  }
}

@end