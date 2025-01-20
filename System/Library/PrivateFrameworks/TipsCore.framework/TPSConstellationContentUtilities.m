@interface TPSConstellationContentUtilities
+ (BOOL)contentContainsInlineIcon:(id)a3;
+ (BOOL)contentContainsLink:(id)a3;
+ (id)altTextRepresentationForContent:(id)a3;
+ (id)contentClasses;
+ (id)hrefForLinkMark:(id)a3;
+ (id)textContentWithText:(id)a3;
+ (id)textForContentNode:(id)a3;
+ (id)textRepresentationForContent:(id)a3;
+ (int64_t)contentTypeForContentDictionary:(id)a3;
+ (int64_t)markTypeForMarkDictionary:(id)a3;
@end

@implementation TPSConstellationContentUtilities

void __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (![*(id *)(a1 + 40) contentTypeForContentDictionary:v6])
  {
    v7 = [v6 TPSSafeArrayForKey:@"marks"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke_2;
    v10[3] = &unk_1E5907148;
    long long v11 = *(_OWORD *)(a1 + 32);
    [v7 enumerateObjectsUsingBlock:v10];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    v9 = [v6 TPSSafeArrayForKey:@"content"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 contentContainsLink:v9];
  }
}

+ (BOOL)contentContainsLink:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke;
    v8[3] = &unk_1E5907148;
    v8[4] = &v9;
    v8[5] = a1;
    [v4 enumerateObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)textRepresentationForContent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count] == 1)
  {
    BOOL v6 = [v5 firstObject];
    v7 = [v6 TPSSafeArrayForKey:@"content"];
    if ([v7 count] == 1)
    {
      v8 = [v7 firstObject];
      if ([a1 contentTypeForContentDictionary:v8])
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = [v8 TPSSafeStringForKey:@"text"];
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (int64_t)contentTypeForContentDictionary:(id)a3
{
  v3 = [a3 TPSSafeStringForKey:@"type"];
  if ([v3 isEqualToString:@"text"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"p"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"symbol"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"inlineIcon"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"personalizedText"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

uint64_t __56__TPSConstellationContentUtilities_contentContainsLink___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 40) markTypeForMarkDictionary:a2];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (int64_t)markTypeForMarkDictionary:(id)a3
{
  v3 = [a3 TPSSafeStringForKey:@"type"];
  if ([v3 isEqualToString:@"a"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"strong"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"em"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"accentColor"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (id)contentClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)contentContainsInlineIcon:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      uint64_t v9 = @"content";
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = v9;
          char v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) TPSSafeArrayForKey:v9];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v22;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ([a1 contentTypeForContentDictionary:*(void *)(*((void *)&v21 + 1) + 8 * j)] == 3)
                {

                  BOOL v18 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v11;
          uint64_t v8 = v20;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        BOOL v18 = 0;
      }
      while (v7);
    }
    else
    {
      BOOL v18 = 0;
    }
LABEL_21:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)altTextRepresentationForContent:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v4;
    obuint64_t j = v4;
    uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (!v26) {
      goto LABEL_29;
    }
    uint64_t v25 = *(void *)v34;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
        uint64_t v8 = [obj firstObject];

        if (v7 != v8 && [a1 contentTypeForContentDictionary:v7] == 1) {
          [v5 appendString:@" "];
        }
        uint64_t v9 = [v7 TPSSafeArrayForKey:@"content"];
        v10 = v9;
        uint64_t v28 = v6;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          v38 = v7;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        }
        char v12 = v11;

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v13);
              }
              BOOL v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v19 = [a1 contentTypeForContentDictionary:v18];
              if ((unint64_t)(v19 - 2) >= 2)
              {
                if (v19) {
                  continue;
                }
                uint64_t v20 = [a1 textForContentNode:v18];
                [v5 appendString:v20];
              }
              else
              {
                uint64_t v20 = [v18 TPSSafeDictionaryForKey:@"attrs"];
                long long v21 = [v20 TPSSafeStringForKey:@"alt"];
                if ([v21 length]) {
                  [v5 appendString:v21];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v15);
        }

        uint64_t v6 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (!v26)
      {
LABEL_29:

        if (v5) {
          long long v22 = (void *)[v5 copy];
        }
        else {
          long long v22 = 0;
        }

        id v4 = v24;
        goto LABEL_34;
      }
    }
  }
  long long v22 = 0;
LABEL_34:

  return v22;
}

+ (id)textForContentNode:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"text"];
}

+ (id)textContentWithText:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"type";
  v10 = @"text";
  uint64_t v3 = &stru_1EED877F8;
  if (a3) {
    uint64_t v3 = (__CFString *)a3;
  }
  id v11 = @"text";
  char v12 = v3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithObjects:&v11 forKeys:&v9 count:2];
  v13[0] = v6;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 1, v9, v10, v11, v12);

  return v7;
}

+ (id)hrefForLinkMark:(id)a3
{
  uint64_t v3 = [a3 TPSSafeDictionaryForKey:@"attrs"];
  id v4 = [v3 TPSSafeStringForKey:@"href"];

  return v4;
}

@end