@interface VATUtils
+ (id)formatFromTokens:(id)a3;
@end

@implementation VATUtils

+ (id)formatFromTokens:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    LOBYTE(v8) = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v4, "length", (void)v17)
          && ((v8 & 1) != 0 || [v11 hasSpaceBefore]))
        {
          [v4 appendString:@" "];
        }
        v12 = [v11 tokenName];
        [v4 appendString:v12];

        int v8 = [v11 hasSpaceAfter];
        [v4 appendString:@" Confidence: "];
        v13 = NSNumber;
        [v11 confidence];
        v14 = objc_msgSend(v13, "numberWithDouble:");
        v15 = [v14 stringValue];
        [v4 appendString:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);

    if (v8) {
      [v4 appendString:@" "];
    }
  }
  else
  {
  }
  return v4;
}

@end