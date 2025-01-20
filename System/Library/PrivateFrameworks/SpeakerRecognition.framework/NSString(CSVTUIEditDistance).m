@interface NSString(CSVTUIEditDistance)
- (BOOL)_hasSubstring:()CSVTUIEditDistance;
- (BOOL)_matchesRegularExpression:()CSVTUIEditDistance;
- (id)_firstMatchesForRegularExpression:()CSVTUIEditDistance;
- (id)_firstMatchesForRegularExpressions:()CSVTUIEditDistance;
- (id)_stringByFixingNamePattern:()CSVTUIEditDistance;
- (id)_stringByStrippingLeadingNoise:()CSVTUIEditDistance;
- (id)_stringByStrippingNoiseLeadingNoise:()CSVTUIEditDistance TrailingNoise:;
- (id)_stringByStrippingTrailingNoise:()CSVTUIEditDistance;
- (uint64_t)_caseInsensitiveHasMatchInEnumeration:()CSVTUIEditDistance;
@end

@implementation NSString(CSVTUIEditDistance)

- (id)_firstMatchesForRegularExpression:()CSVTUIEditDistance
{
  uint64_t v12 = 0;
  v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a3 options:1 error:&v12];
  v5 = 0;
  if (!v12)
  {
    v6 = objc_msgSend(v4, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
    if (v6)
    {
      v5 = [MEMORY[0x263EFF980] array];
      if ([v6 numberOfRanges])
      {
        unint64_t v7 = 0;
        do
        {
          if ([v6 rangeAtIndex:v7] == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v5 addObject:&stru_26CD357C0];
          }
          else
          {
            uint64_t v8 = [v6 rangeAtIndex:v7];
            v10 = objc_msgSend(a1, "substringWithRange:", v8, v9);
            [v5 addObject:v10];
          }
          ++v7;
        }
        while (v7 < [v6 numberOfRanges]);
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)_firstMatchesForRegularExpressions:()CSVTUIEditDistance
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(a1, "_firstMatchesForRegularExpression:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (uint64_t)_caseInsensitiveHasMatchInEnumeration:()CSVTUIEditDistance
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 stringValue];
        }
        else {
        v10 = objc_msgSend(v9, "description", (void)v16);
        }
        v11 = objc_msgSend(v10, "lowercaseString", (void)v16);
        long long v12 = [a1 lowercaseString];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          uint64_t v14 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)_matchesRegularExpression:()CSVTUIEditDistance
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a3 options:1 error:&v7];
  if (v7) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;
  }

  return v5;
}

- (BOOL)_hasSubstring:()CSVTUIEditDistance
{
  return [a1 rangeOfString:a3 options:1] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_stringByStrippingNoiseLeadingNoise:()CSVTUIEditDistance TrailingNoise:
{
  id v6 = a4;
  uint64_t v7 = [a1 _stringByStrippingLeadingNoise:a3];
  uint64_t v8 = [v7 _stringByStrippingTrailingNoise:v6];

  return v8;
}

- (id)_stringByStrippingTrailingNoise:()CSVTUIEditDistance
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a3 options:1 error:&v7];
  BOOL v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_26CD357C0);

  return v5;
}

- (id)_stringByStrippingLeadingNoise:()CSVTUIEditDistance
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:a3 options:1 error:&v7];
  BOOL v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v5, 0, 0, objc_msgSend(v5, "length"), &stru_26CD357C0);

  return v5;
}

- (id)_stringByFixingNamePattern:()CSVTUIEditDistance
{
  id v4 = a3;
  BOOL v5 = [a1 lowercaseString];
  int v6 = [v5 hasPrefix:v4];

  if (v6)
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = a1;
  }
  uint64_t v8 = v7;

  return v8;
}

@end