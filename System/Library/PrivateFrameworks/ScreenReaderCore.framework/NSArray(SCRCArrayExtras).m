@interface NSArray(SCRCArrayExtras)
- (void)scrc_deepMutableCopyWithZone:()SCRCArrayExtras;
@end

@implementation NSArray(SCRCArrayExtras)

- (void)scrc_deepMutableCopyWithZone:()SCRCArrayExtras
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF980], "allocWithZone:"), "initWithCapacity:", objc_msgSend(a1, "count"));
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v17 + 1) + 8 * v10);
          v12 = SCRCDeepMutableCopyClasses();
          int v13 = objc_msgSend(v12, "containsObjectClass:", v11, (void)v17);

          if (v13)
          {
            uint64_t v14 = objc_msgSend(v11, "scrc_deepMutableCopyWithZone:", a3);

            id v11 = (id)v14;
          }
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id v15 = v5;
  }

  return v5;
}

@end