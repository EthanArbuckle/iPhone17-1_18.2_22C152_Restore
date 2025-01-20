@interface NSMutableArray(TSUAdditions)
- (id)tsu_pop;
- (uint64_t)tsu_addObjects:()TSUAdditions;
- (uint64_t)tsu_enqueue:()TSUAdditions;
- (uint64_t)tsu_insertObject:()TSUAdditions usingComparator:;
- (uint64_t)tsu_removeObjectsIdenticalToObjectsInArray:()TSUAdditions;
- (unint64_t)tsu_trimObjectsFromIndex:()TSUAdditions;
- (void)tsu_addNonNilObject:()TSUAdditions;
- (void)tsu_addObjectsFromNonNilArray:()TSUAdditions;
@end

@implementation NSMutableArray(TSUAdditions)

- (uint64_t)tsu_enqueue:()TSUAdditions
{
  return [a1 insertObject:a3 atIndex:0];
}

- (id)tsu_pop
{
  id v2 = (id)[a1 lastObject];
  if (v2) {
    [a1 removeLastObject];
  }
  return v2;
}

- (uint64_t)tsu_addObjects:()TSUAdditions
{
  v11 = &a9;
  if (a3)
  {
    v9 = (void *)result;
    do
    {
      result = objc_msgSend(v9, "addObject:");
      v10 = v11++;
    }
    while (*v10);
  }
  return result;
}

- (void)tsu_addNonNilObject:()TSUAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)tsu_addObjectsFromNonNilArray:()TSUAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addObjectsFromArray:");
  }
  return a1;
}

- (uint64_t)tsu_removeObjectsIdenticalToObjectsInArray:()TSUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a1 == a3)
  {
    return [a1 removeAllObjects];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          uint64_t v10 = [a1 indexOfObjectIdenticalTo:v9];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (uint64_t i = v10; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [a1 indexOfObjectIdenticalTo:v9])
              [a1 removeObjectAtIndex:i];
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t result = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

- (unint64_t)tsu_trimObjectsFromIndex:()TSUAdditions
{
  unint64_t result = [a1 count];
  if (result > a3)
  {
    return objc_msgSend(a1, "removeObjectsInRange:", a3, result - a3);
  }
  return result;
}

- (uint64_t)tsu_insertObject:()TSUAdditions usingComparator:
{
  uint64_t v6 = objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a1, "count"), 1024, a4);
  [a1 insertObject:a3 atIndex:v6];
  return v6;
}

@end