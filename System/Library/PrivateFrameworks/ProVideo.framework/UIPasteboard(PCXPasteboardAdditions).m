@interface UIPasteboard(PCXPasteboardAdditions)
+ (uint64_t)pcxPasteboardWithName:()PCXPasteboardAdditions;
- (uint64_t)pcxClearContents;
- (uint64_t)pcxTypes;
@end

@implementation UIPasteboard(PCXPasteboardAdditions)

+ (uint64_t)pcxPasteboardWithName:()PCXPasteboardAdditions
{
  if (PCInfo_IsUnitTesting())
  {
    if (pcxPasteboardWithName__s_makePasteboardOnce != -1) {
      dispatch_once(&pcxPasteboardWithName__s_makePasteboardOnce, &__block_literal_global_59);
    }
    return pcxPasteboardWithName__s_utPasteboard;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F42C50];
    return [v5 pasteboardWithName:a3 create:1];
  }
}

- (uint64_t)pcxTypes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[a1 pasteboardTypesForItemSet:0];
  v2 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = [v1 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * j);
              if (([v2 containsObject:v12] & 1) == 0) {
                [v2 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [v1 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", objc_msgSend(v2, "array"));

  return v13;
}

- (uint64_t)pcxClearContents
{
  [a1 setItems:MEMORY[0x1E4F1CBF0]];

  return [a1 changeCount];
}

@end