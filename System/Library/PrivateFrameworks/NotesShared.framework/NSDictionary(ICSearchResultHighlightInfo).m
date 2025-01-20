@interface NSDictionary(ICSearchResultHighlightInfo)
+ (id)decomposedHighlightInfo:()ICSearchResultHighlightInfo;
+ (id)highlightInfoForSearchStringWithPrefixMatchInAllFields:()ICSearchResultHighlightInfo language:;
+ (id)mergeFieldElement:()ICSearchResultHighlightInfo withElement:;
+ (id)mergeHighlightInfo:()ICSearchResultHighlightInfo withHighlighInfo:;
+ (uint64_t)highlightInfoContainsPrefixMatch:()ICSearchResultHighlightInfo;
@end

@implementation NSDictionary(ICSearchResultHighlightInfo)

+ (id)highlightInfoForSearchStringWithPrefixMatchInAllFields:()ICSearchResultHighlightInfo language:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v5)
  {
    v8 = +[ICSearchQueryTokenizer tokensFromString:v5 language:v6];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:v9 forKeyedSubscript:&unk_1F1F628E0];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v9 setObject:v10 forKeyedSubscript:&unk_1F1F628F8];
    [v10 addObjectsFromArray:v8];
  }
  v11 = (void *)[v7 copy];

  return v11;
}

+ (id)mergeHighlightInfo:()ICSearchResultHighlightInfo withHighlighInfo:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  id v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v8 = 0;
    goto LABEL_16;
  }
  if (!v5) {
    goto LABEL_15;
  }
  if (!v6)
  {
    unint64_t v6 = v5;
LABEL_15:
    v8 = (void *)[(id)v6 copy];
    goto LABEL_16;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [(id)v5 allKeys];
  v13 = [v11 setWithArray:v12];
  [v10 unionSet:v13];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [v7 allKeys];
  v16 = [v14 setWithArray:v15];
  [v10 unionSet:v16];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v10;
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
        uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        [(id)v5 objectForKeyedSubscript:v21];
        v23 = unint64_t v22 = v5;
        [v7 objectForKeyedSubscript:v21];
        v25 = v24 = v7;
        v26 = [a1 mergeFieldElement:v23 withElement:v25];
        [v9 setObject:v26 forKeyedSubscript:v21];

        id v7 = v24;
        unint64_t v5 = v22;
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  v8 = (void *)[v9 copy];
LABEL_16:

  return v8;
}

+ (id)mergeFieldElement:()ICSearchResultHighlightInfo withElement:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  v8 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  if (!v6)
  {
    id v6 = v5;
LABEL_17:
    id v9 = (id)[v6 mutableCopy];
    goto LABEL_18;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [v8 allKeys];
  v13 = [v11 setWithArray:v12];
  [v10 unionSet:v13];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [v7 allKeys];
  v16 = [v14 setWithArray:v15];
  [v10 unionSet:v16];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v10;
  uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v23 = [v8 objectForKeyedSubscript:v21];
        v24 = [v7 objectForKeyedSubscript:v21];
        if (v23) {
          [v22 unionSet:v23];
        }
        if (v24) {
          [v22 unionSet:v24];
        }
        [v9 setObject:v22 forKeyedSubscript:v21];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

LABEL_18:
  return v9;
}

+ (uint64_t)highlightInfoContainsPrefixMatch:()ICSearchResultHighlightInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = objc_msgSend(v3, "allKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          v11 = [v10 objectForKeyedSubscript:&unk_1F1F628F8];

          if (v11)
          {
            uint64_t v12 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v12 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)decomposedHighlightInfo:()ICSearchResultHighlightInfo
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v22 = v3;
  id obj = [v3 allKeys];
  uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v39;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        id v5 = *(void **)(*((void *)&v38 + 1) + 8 * v4);
        uint64_t v27 = [v5 unsignedIntegerValue];
        uint64_t v6 = [v22 objectForKeyedSubscript:v5];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v28 = [&unk_1F1F62CD0 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v28)
        {
          uint64_t v26 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(&unk_1F1F62CD0);
              }
              uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              if (([v8 unsignedIntegerValue] & v27) != 0)
              {
                uint64_t v29 = i;
                id v9 = [v25 objectForKeyedSubscript:v8];
                if (!v9)
                {
                  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [v25 setObject:v9 forKeyedSubscript:v8];
                }
                long long v32 = 0u;
                long long v33 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                uint64_t v10 = [&unk_1F1F62CE8 countByEnumeratingWithState:&v30 objects:v42 count:16];
                if (v10)
                {
                  uint64_t v11 = v10;
                  uint64_t v12 = *(void *)v31;
                  do
                  {
                    for (uint64_t j = 0; j != v11; ++j)
                    {
                      if (*(void *)v31 != v12) {
                        objc_enumerationMutation(&unk_1F1F62CE8);
                      }
                      uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                      long long v15 = [v6 objectForKeyedSubscript:v14];
                      if (v15)
                      {
                        id v16 = [v9 objectForKeyedSubscript:v14];
                        if (!v16)
                        {
                          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                          [v9 setObject:v16 forKeyedSubscript:v14];
                        }
                        long long v17 = [v15 allObjects];
                        [v16 addObjectsFromArray:v17];
                      }
                    }
                    uint64_t v11 = [&unk_1F1F62CE8 countByEnumeratingWithState:&v30 objects:v42 count:16];
                  }
                  while (v11);
                }

                uint64_t i = v29;
              }
            }
            uint64_t v28 = [&unk_1F1F62CD0 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v28);
        }

        uint64_t v4 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v23);
  }

  uint64_t v18 = (void *)[v25 copy];
  return v18;
}

@end