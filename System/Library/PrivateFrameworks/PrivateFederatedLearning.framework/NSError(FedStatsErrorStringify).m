@interface NSError(FedStatsErrorStringify)
- (id)describe;
@end

@implementation NSError(FedStatsErrorStringify)

- (id)describe
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v3 = NSString;
  v4 = [a1 domain];
  uint64_t v5 = [a1 code];
  v6 = [a1 userInfo];
  v7 = [v6 objectForKey:*MEMORY[0x263F08320]];
  v8 = [v3 stringWithFormat:@"domain = \"%@\", code = %lu, description = \"%@\"", v4, v5, v7];
  [v2 addObject:v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = [a1 underlyingErrors];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) describe];
        [v2 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  if ((unint64_t)[v2 count] >= 2)
  {
    unint64_t v15 = 1;
    do
    {
      v16 = [v2 objectAtIndexedSubscript:v15];
      v17 = [v2 firstObject];

      if (v17 == v16)
      {
        v19 = @"├── ";
      }
      else
      {
        v18 = [v2 lastObject];

        if (v18 == v16) {
          v19 = @"└── ";
        }
        else {
          v19 = @"│   ";
        }
      }
      v20 = [(__CFString *)v19 stringByAppendingString:v16];
      [v2 setObject:v20 atIndexedSubscript:v15];

      ++v15;
    }
    while (v15 < [v2 count]);
  }
  return v2;
}

@end