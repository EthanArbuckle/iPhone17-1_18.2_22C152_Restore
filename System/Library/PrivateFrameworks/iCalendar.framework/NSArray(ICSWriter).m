@interface NSArray(ICSWriter)
- (void)_ICSParametersAppendingToString:()ICSWriter;
- (void)_ICSStringWithOptions:()ICSWriter appendingToString:;
- (void)_ICSStringsForPropertyValuesWithOptions:()ICSWriter appendingToString:;
@end

@implementation NSArray(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  id v14 = a4;
  uint64_t v6 = [a1 count];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = a1;
    v9 = v8;
    if ((a3 & 8) != 0)
    {
      uint64_t v10 = [v8 sortedArrayUsingComparator:&__block_literal_global_243];

      v9 = (void *)v10;
    }
    v11 = [v9 objectAtIndex:0];
    [v11 _ICSStringWithOptions:a3 appendingToString:v14];

    if (v7 >= 2)
    {
      for (uint64_t i = 1; i != v7; ++i)
      {
        [v14 appendString:@","];
        v13 = [v9 objectAtIndex:i];
        [v13 _ICSStringWithOptions:a3 appendingToString:v14];
      }
    }
  }
}

- (void)_ICSParametersAppendingToString:()ICSWriter
{
  id v11 = a3;
  uint64_t v4 = [a1 count];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = v4 - 1;
    do
    {
      id v8 = [a1 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 absoluteString];
      }
      else {
      v9 = [v8 description];
      }
      uint64_t v10 = [v9 _ICSStringForParameterValue];
      [v11 appendString:v10];

      if (v6 < v7) {
        [v11 appendString:@","];
      }

      ++v6;
    }
    while (v5 != v6);
  }
}

- (void)_ICSStringsForPropertyValuesWithOptions:()ICSWriter appendingToString:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (v10) {
          objc_msgSend(v6, "appendString:", @",", (void)v15);
        }
        id v14 = objc_msgSend(v13, "_ICSStringForProperyValue", (void)v15);
        [v14 _ICSStringWithOptions:a3 appendingToString:v6];

        ++v12;
        char v10 = 1;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

@end