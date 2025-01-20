@interface NSOrderedSet(PLAdditions)
- (id)pl_shortDescription;
- (uint64_t)pl_indexOfObjectIdenticalTo:()PLAdditions;
- (uint64_t)pl_isSortedUsingComparator:()PLAdditions;
@end

@implementation NSOrderedSet(PLAdditions)

- (uint64_t)pl_isSortedUsingComparator:()PLAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        if (v11 && v4[2](v4, v11, *(void *)(*((void *)&v15 + 1) + 8 * v10)) == 1)
        {
          uint64_t v13 = 0;
          goto LABEL_12;
        }
        id v8 = v12;

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    uint64_t v13 = 1;
    v11 = v8;
LABEL_12:
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (uint64_t)pl_indexOfObjectIdenticalTo:()PLAdditions
{
  id v4 = a3;
  id v5 = [a1 array];
  uint64_t v6 = [v5 indexOfObjectIdenticalTo:v4];

  return v6;
}

- (id)pl_shortDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  v3 = (void *)MEMORY[0x19F38D3B0]();
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(*((void *)&v13 + 1) + 8 * i));
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [v4 componentsJoinedByString:@", "];
  [v2 appendString:v11];

  [v2 appendString:@"}"];
  return v2;
}

@end