@interface NSMutableArray(TSUAdditions)
- (id)pop_tsu;
- (uint64_t)tsu_addObjects:()TSUAdditions;
- (uint64_t)tsu_enqueue:()TSUAdditions;
- (uint64_t)tsu_removeObjectsIdenticalToObjectsInArray:()TSUAdditions;
- (uint64_t)tsu_removeObjectsIdenticalToObjectsInSet:()TSUAdditions;
- (void)initWithResultsOfPerformingSelector:()TSUAdditions onObjectsFromArray:;
- (void)initWithResultsOfPerformingSelector:()TSUAdditions withObject:onObjectsFromArray:;
- (void)tsu_addNonNilObject:()TSUAdditions;
- (void)tsu_addObjectsFromNonNilArray:()TSUAdditions;
@end

@implementation NSMutableArray(TSUAdditions)

- (void)initWithResultsOfPerformingSelector:()TSUAdditions onObjectsFromArray:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(a1, "initWithCapacity:", objc_msgSend(a4, "count"));
  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
            objc_enumerationMutation(a4);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "performSelector:", a3));
        }
        while (v8 != v10);
        uint64_t v8 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v6;
}

- (void)initWithResultsOfPerformingSelector:()TSUAdditions withObject:onObjectsFromArray:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend(a1, "initWithCapacity:", objc_msgSend(a5, "count"));
  if (v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [a5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(a5);
          }
          objc_msgSend(v8, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "performSelector:withObject:", a3, a4));
        }
        while (v10 != v12);
        uint64_t v10 = [a5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  return v8;
}

- (uint64_t)tsu_enqueue:()TSUAdditions
{
  return [a1 insertObject:a3 atIndex:0];
}

- (id)pop_tsu
{
  id v2 = (id)[a1 lastObject];
  if (v2) {
    [a1 removeLastObject];
  }
  return v2;
}

- (uint64_t)tsu_addObjects:()TSUAdditions
{
  uint64_t v11 = &a9;
  if (a3)
  {
    uint64_t v9 = (void *)result;
    do
    {
      result = objc_msgSend(v9, "addObject:");
      uint64_t v10 = v11++;
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

- (uint64_t)tsu_removeObjectsIdenticalToObjectsInSet:()TSUAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [a1 removeObjectIdenticalTo:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t result = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
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

@end