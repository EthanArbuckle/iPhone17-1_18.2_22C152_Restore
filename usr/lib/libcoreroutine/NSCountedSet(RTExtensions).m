@interface NSCountedSet(RTExtensions)
- (id)arrayOrderedByHighestCount;
- (id)objectWithHighestCount;
- (uint64_t)countForAllObjects;
@end

@implementation NSCountedSet(RTExtensions)

- (id)objectWithHighestCount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = -1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v1);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v1 countForObject:v8];
        if (v9 > v6)
        {
          uint64_t v10 = v9;
          id v11 = v8;

          v4 = v11;
          uint64_t v6 = v10;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)countForAllObjects
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 += [v1 countForObject:*(void *)(*((void *)&v8 + 1) + 8 * i) (void)v8];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)arrayOrderedByHighestCount
{
  uint64_t v2 = [a1 allObjects];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NSCountedSet_RTExtensions__arrayOrderedByHighestCount__block_invoke;
  v5[3] = &unk_1E6B98C90;
  v5[4] = a1;
  uint64_t v3 = [v2 sortedArrayUsingComparator:v5];

  return v3;
}

@end