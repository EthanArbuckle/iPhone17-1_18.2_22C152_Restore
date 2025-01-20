@interface NSMutableSet(TSUAdditions)
- (uint64_t)tsu_removeEqualObject:()TSUAdditions;
- (uint64_t)tsu_xorSet:()TSUAdditions;
- (void)tsu_addNonNilObject:()TSUAdditions;
- (void)tsu_addObjectsFromNonNilArray:()TSUAdditions;
- (void)tsu_removeObjectsPassingTest:()TSUAdditions;
@end

@implementation NSMutableSet(TSUAdditions)

- (uint64_t)tsu_xorSet:()TSUAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if ([a1 containsObject:v9]) {
          [a1 removeObject:v9];
        }
        else {
          [a1 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = result;
    }
    while (result);
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

- (uint64_t)tsu_removeEqualObject:()TSUAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = (void *)[a1 allObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if ([v10 isEqual:a3]) {
          [a1 removeObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (void)tsu_removeObjectsPassingTest:()TSUAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = result;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t result = (void *)[result countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      v5 = result;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v8);
          if ((*(unsigned int (**)(uint64_t, uint64_t))(a3 + 16))(a3, v9))
          {
            if (!v6) {
              uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
            }
            [v6 addObject:v9];
          }
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        uint64_t result = (void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        v5 = result;
      }
      while (result);
      if (v6) {
        return (void *)[v4 minusSet:v6];
      }
    }
  }
  return result;
}

@end