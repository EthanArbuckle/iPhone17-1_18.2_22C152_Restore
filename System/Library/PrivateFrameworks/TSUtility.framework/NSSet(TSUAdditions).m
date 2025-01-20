@interface NSSet(TSUAdditions)
+ (uint64_t)tsu_set:()TSUAdditions isEqualToSet:;
- (uint64_t)tsu_containsObjectIdenticalTo:()TSUAdditions;
@end

@implementation NSSet(TSUAdditions)

+ (uint64_t)tsu_set:()TSUAdditions isEqualToSet:
{
  if (a3 == (void *)a4) {
    return 1;
  }
  uint64_t v11 = v5;
  uint64_t v12 = v4;
  uint64_t v8 = a4;
  v9 = a3;
  if (!a3)
  {
    v9 = (void *)[MEMORY[0x263EFFA08] set];
    if (v8) {
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFFA08], "set", v11, v12, v6);
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_9;
  }
LABEL_4:
  return [v9 isEqualToSet:v8];
}

- (uint64_t)tsu_containsObjectIdenticalTo:()TSUAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a1);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8 * v8) == a3) {
          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

@end