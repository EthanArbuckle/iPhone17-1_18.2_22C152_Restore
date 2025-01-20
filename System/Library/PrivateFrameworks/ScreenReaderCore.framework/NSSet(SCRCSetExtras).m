@interface NSSet(SCRCSetExtras)
- (uint64_t)containsObjectClass:()SCRCSetExtras;
- (void)scrc_deepMutableCopyWithZone:()SCRCSetExtras;
@end

@implementation NSSet(SCRCSetExtras)

- (void)scrc_deepMutableCopyWithZone:()SCRCSetExtras
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF9C0], "allocWithZone:"), "initWithCapacity:", objc_msgSend(a1, "count"));
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
          v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
          v12 = SCRCDeepMutableCopyClasses();
          int v13 = objc_msgSend(v12, "containsObjectClass:", v11, (void)v17);

          if (!v13
            || (v14 = objc_msgSend(v11, "scrc_deepMutableCopyWithZone:", a3),
                [v5 addObject:v14],
                !v14))
          {
            [v5 addObject:v11];
            v14 = 0;
          }

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

- (uint64_t)containsObjectClass:()SCRCSetExtras
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end