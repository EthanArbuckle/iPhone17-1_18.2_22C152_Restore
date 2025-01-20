@interface NSRegularExpression(IC)
+ (id)ic_patternForTokens:()IC matchWordBoundaries:;
+ (id)ic_regexForPrefixMatchingTokens:()IC substringMatchingTokens:;
+ (id)ic_regexForSearchStrings:()IC matchWordBoundaries:;
+ (id)ic_uuidRegex;
+ (uint64_t)ic_regexForSearchStrings:()IC;
- (BOOL)ic_matchesString:()IC;
- (id)ic_attributedStringByReplacingMatchesInAttributedString:()IC options:range:withTemplate:;
@end

@implementation NSRegularExpression(IC)

+ (uint64_t)ic_regexForSearchStrings:()IC
{
  return objc_msgSend(a1, "ic_regexForSearchStrings:matchWordBoundaries:", a3, 0);
}

+ (id)ic_regexForSearchStrings:()IC matchWordBoundaries:
{
  id v6 = a3;
  if ([v6 count])
  {
    v7 = objc_msgSend(a1, "ic_patternForTokens:matchWordBoundaries:", v6, a4);
    uint64_t v10 = 0;
    v8 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v7 options:1 error:&v10];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)ic_patternForTokens:()IC matchWordBoundaries:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend(v6, "appendString:", @"(");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
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
        v12 = [MEMORY[0x263F08AE8] escapedPatternForString:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        v13 = v12;
        if (a4)
        {
          id v14 = [NSString stringWithFormat:@"\\b%@", v12];
        }
        else
        {
          id v14 = v12;
        }
        v15 = v14;
        [v6 appendString:v14];
        [v6 appendString:@"|"];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if ([v6 length]) {
    objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 1, 1, &stru_26C13B138);
  }
  [v6 appendString:@""]);
  v16 = (void *)[v6 copy];

  return v16;
}

+ (id)ic_regexForPrefixMatchingTokens:()IC substringMatchingTokens:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = objc_msgSend(a1, "ic_patternForTokens:matchWordBoundaries:", v6, 1);
    if (![v7 count])
    {
      uint64_t v9 = 0;
LABEL_8:
      if (v8)
      {
        id v12 = v8;
        uint64_t v8 = v12;
LABEL_12:
        uint64_t v15 = 0;
        v13 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v12 options:1 error:&v15];
        goto LABEL_14;
      }
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v10 = objc_msgSend(a1, "ic_patternForTokens:matchWordBoundaries:", v7, 0);
    uint64_t v9 = (void *)v10;
    if (v8 && v10)
    {
      id v11 = [NSString stringWithFormat:@"(%@) | (%@)", v8, v10];
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if ([v7 count]) {
    goto LABEL_5;
  }
LABEL_10:
  id v11 = v9;
  uint64_t v9 = v11;
  uint64_t v8 = 0;
LABEL_11:
  id v12 = v11;
  if (v11) {
    goto LABEL_12;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)ic_matchesString:()IC
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  uint64_t v7 = v6;

  return v5 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0;
}

- (id)ic_attributedStringByReplacingMatchesInAttributedString:()IC options:range:withTemplate:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a7;
  id v14 = (void *)[v12 mutableCopy];
  uint64_t v15 = [v12 string];
  v16 = objc_msgSend(a1, "matchesInString:options:range:", v15, a4, a5, a6);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v28 = v16;
  id obj = [v16 reverseObjectEnumerator];
  uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v22 = [v12 string];
        uint64_t v23 = [a1 replacementStringForResult:v21 inString:v22 offset:0 template:v13];

        uint64_t v24 = [v21 range];
        objc_msgSend(v14, "replaceCharactersInRange:withString:", v24, v25, v23);
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  v26 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v14];
  return v26;
}

+ (id)ic_uuidRegex
{
  uint64_t v2 = 0;
  v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}" options:17 error:&v2];
  return v0;
}

@end