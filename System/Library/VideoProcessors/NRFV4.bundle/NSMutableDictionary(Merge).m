@interface NSMutableDictionary(Merge)
- (void)sisp_mergeEntriesFromDictionary:()Merge;
@end

@implementation NSMutableDictionary(Merge)

- (void)sisp_mergeEntriesFromDictionary:()Merge
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      unint64_t v9 = 0x263EFF000uLL;
      unint64_t v10 = 0x263EFF000uLL;
      v20 = v5;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v5 objectForKeyedSubscript:v12];
          v14 = [a1 objectForKeyedSubscript:v12];
          if (!v14) {
            goto LABEL_13;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = v7;
              uint64_t v16 = v8;
              unint64_t v17 = v9;
              unint64_t v18 = v10;
              uint64_t v19 = [v14 mutableCopy];

              [a1 setObject:v19 forKeyedSubscript:v12];
              v14 = (void *)v19;
              unint64_t v10 = v18;
              unint64_t v9 = v17;
              uint64_t v8 = v16;
              uint64_t v7 = v15;
              v5 = v20;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v14, "sisp_mergeEntriesFromDictionary:", v13);
          }
          else {
LABEL_13:
          }
            [a1 setObject:v13 forKeyedSubscript:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

@end