@interface NSDictionary(SCRCDictionaryExtras)
- (void)scrc_deepMutableCopyWithZone:()SCRCDictionaryExtras;
@end

@implementation NSDictionary(SCRCDictionaryExtras)

- (void)scrc_deepMutableCopyWithZone:()SCRCDictionaryExtras
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF9A0], "allocWithZone:"), "initWithCapacity:", objc_msgSend(a1, "count"));
  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v12 = objc_msgSend(v6, "objectForKey:", v11, (void)v18);
          v13 = SCRCDeepMutableCopyClasses();
          int v14 = [v13 containsObjectClass:v12];

          if (v14)
          {
            uint64_t v15 = objc_msgSend(v12, "scrc_deepMutableCopyWithZone:", a3);

            v12 = (void *)v15;
          }
          [v5 setObject:v12 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v16 = v5;
  }

  return v5;
}

@end