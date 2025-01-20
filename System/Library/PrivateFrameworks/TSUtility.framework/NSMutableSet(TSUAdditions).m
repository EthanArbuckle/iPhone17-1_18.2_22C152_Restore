@interface NSMutableSet(TSUAdditions)
- (uint64_t)tsu_xorSet:()TSUAdditions;
- (void)tsu_addNonNilObject:()TSUAdditions;
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

@end