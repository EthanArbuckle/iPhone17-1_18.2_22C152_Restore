@interface NSURL(ICAdditions)
+ (id)ic_queryParametersDictionaryFromString:()ICAdditions;
- (id)ic_URLByAppendingQueryItems:()ICAdditions;
- (id)ic_URLByAppendingQueryParameters:()ICAdditions;
- (id)ic_queryParametersDictionary;
@end

@implementation NSURL(ICAdditions)

- (id)ic_queryParametersDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = objc_msgSend(v3, "queryItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        if (v10)
        {
          v11 = (void *)v10;
          v12 = [v9 value];

          if (v12)
          {
            v13 = [v9 value];
            v14 = [v9 name];
            [v2 setObject:v13 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v2;
}

- (id)ic_URLByAppendingQueryParameters:()ICAdditions
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v25 = v5;
  uint64_t v7 = [v5 queryItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v13 = [v12 name];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v14 = [v4 allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        v20 = [v4 objectForKeyedSubscript:v19];
        uint64_t v21 = [MEMORY[0x1E4F290C8] queryItemWithName:v19 value:v20];
        [v6 setObject:v21 forKeyedSubscript:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  v22 = [v6 allValues];
  [v25 setQueryItems:v22];

  v23 = [v25 URL];

  return v23;
}

- (id)ic_URLByAppendingQueryItems:()ICAdditions
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v6 = [v5 queryItems];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v7 addObjectsFromArray:v4];
  [v5 setQueryItems:v7];
  uint64_t v8 = [v5 URL];

  return v8;
}

+ (id)ic_queryParametersDictionaryFromString:()ICAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v5 setQuery:v3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = objc_msgSend(v5, "queryItems", 0);
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
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = [v11 name];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [v11 value];

          if (v14)
          {
            uint64_t v15 = [v11 value];
            uint64_t v16 = [v11 name];
            [v4 setObject:v15 forKeyedSubscript:v16];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

@end