@interface NSArray(ULExtensions)
- (id)getFilteredArrayByDistinctProperty:()ULExtensions;
@end

@implementation NSArray(ULExtensions)

- (id)getFilteredArrayByDistinctProperty:()ULExtensions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "valueForKey:", v4, (void)v18);
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          v15 = [v12 valueForKey:v4];
          [v5 addObject:v15];

          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v16 = (void *)[v6 copy];
  return v16;
}

@end