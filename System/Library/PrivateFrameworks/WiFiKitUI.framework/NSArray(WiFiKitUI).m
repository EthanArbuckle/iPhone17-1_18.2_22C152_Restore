@interface NSArray(WiFiKitUI)
- (id)arrayAfterFilteringOutEmptyStrings;
- (id)stringFromContentsOfArrayWithDelimiter:()WiFiKitUI;
- (uint64_t)stringFromContentsOfArray;
@end

@implementation NSArray(WiFiKitUI)

- (uint64_t)stringFromContentsOfArray
{
  return [a1 stringFromContentsOfArrayWithDelimiter:@","];
}

- (id)stringFromContentsOfArrayWithDelimiter:()WiFiKitUI
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = [a1 count];
    v6 = [MEMORY[0x263F089D8] string];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v7);
          }
          [v6 appendString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (v5 - 1 - v10 != i) {
            [v6 appendFormat:@"%@ ", v4];
          }
        }
        v10 += v9;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)arrayAfterFilteringOutEmptyStrings
{
  v1 = (void *)[a1 mutableCopy];
  v2 = v1;
  if (v1)
  {
    [v1 removeObject:&stru_26D8F6070];
    v3 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end