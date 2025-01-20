@interface NSArray(REArrayOperations)
- (id)re_arrayMappedWithArray:()REArrayOperations;
@end

@implementation NSArray(REArrayOperations)

- (id)re_arrayMappedWithArray:()REArrayOperations
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(a1, "indexOfObject:", v11, (void)v16);
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v5 addObject:v11];
        }
        else
        {
          v13 = [a1 objectAtIndex:v12];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

@end