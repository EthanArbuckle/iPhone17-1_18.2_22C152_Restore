@interface NSURL(VideosUI)
+ (id)vui_sortedQueryItemsFromDictionary:()VideosUI;
- (id)vui_URLByAddingQueryParamWithName:()VideosUI value:;
- (id)vui_URLByAddingQueryParamsDictionary:()VideosUI;
- (id)vui_URLByRemovingQueryParamWithName:()VideosUI;
- (id)vui_parsedQueryParametersDictionary;
- (uint64_t)vui_containsQueryParamWithName:()VideosUI;
@end

@implementation NSURL(VideosUI)

- (id)vui_parsedQueryParametersDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v1 = [a1 query];
  v2 = [v1 componentsSeparatedByString:@"&"];

  uint64_t v3 = [v2 count];
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "stringByRemovingPercentEncoding", (void)v16);
          v11 = [v10 componentsSeparatedByString:@"="];

          if ([v11 count] == 2)
          {
            v12 = [v11 objectAtIndex:1];
            v13 = [v11 objectAtIndex:0];
            [v4 setObject:v12 forKey:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    v14 = (void *)[v4 copy];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)vui_containsQueryParamWithName:()VideosUI
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v6 = 0;
  if ([v4 length] && v5)
  {
    [v5 queryItems];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v7);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "name", (void)v13);
          uint64_t v11 = [v10 caseInsensitiveCompare:v4];

          if (!v11)
          {
            uint64_t v6 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

- (id)vui_URLByAddingQueryParamWithName:()VideosUI value:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v8 resolvingAgainstBaseURL:0];
    v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 percentEncodedQueryItems];
      id v12 = (id)[v11 mutableCopy];

      long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v6 value:v7];
      if (!v12) {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      if (v13) {
        [v12 addObject:v13];
      }
      [v10 setPercentEncodedQueryItems:v12];
      long long v14 = [v10 URL];
      long long v15 = v14;
      if (v14)
      {
        id v16 = v14;

        id v8 = v16;
      }
    }
  }

  return v8;
}

- (id)vui_URLByAddingQueryParamsDictionary:()VideosUI
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      v10 = v5;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v12 = [v4 objectForKeyedSubscript:v11];
        objc_msgSend(v10, "vui_URLByAddingQueryParamWithName:value:", v11, v12);
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)vui_URLByRemovingQueryParamWithName:()VideosUI
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  id v21 = v5;
  if ([v4 length])
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:0];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 percentEncodedQueryItems];
      id v9 = (id)[v8 mutableCopy];

      if (!v9) {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v10 = (void *)[v9 copy];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v10);
            }
            long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            long long v15 = [v14 name];
            int v16 = [v15 isEqualToString:v4];

            if (v16) {
              [v9 removeObject:v14];
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }

      [v7 setPercentEncodedQueryItems:v9];
      long long v17 = [v7 URL];
      uint64_t v18 = v17;
      if (v17)
      {
        id v19 = v17;

        id v21 = v19;
      }
    }
  }

  return v21;
}

+ (id)vui_sortedQueryItemsFromDictionary:()VideosUI
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [v3 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_14;
          }
          id v12 = [v11 stringValue];
        }
        long long v13 = v12;
        if (v12)
        {
          long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v10 value:v12];
          if (v14) {
            [v16 addObject:v14];
          }
        }
LABEL_14:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v16;
}

- (void)vui_URLByAddingQueryParamWithName:()VideosUI value:.cold.1()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, v0, v1, "Unable to add query param %@ to URL %@");
}

@end