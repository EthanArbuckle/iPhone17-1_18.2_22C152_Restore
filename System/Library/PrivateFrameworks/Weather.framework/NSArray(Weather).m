@interface NSArray(Weather)
- (uint64_t)wa_allObjectsPassTest:()Weather;
@end

@implementation NSArray(Weather)

- (uint64_t)wa_allObjectsPassTest:()Weather
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

@end