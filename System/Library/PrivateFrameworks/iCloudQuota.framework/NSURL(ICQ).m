@interface NSURL(ICQ)
- (id)icq_URLByAppendingQueryItems:()ICQ;
- (id)icq_URLByAppendingQueryParamName:()ICQ value:;
- (id)icq_URLByAppendingQueryParamtersFromContext:()ICQ;
- (id)icq_queryItemForName:()ICQ;
- (uint64_t)icq_isICQLaunchURL;
@end

@implementation NSURL(ICQ)

- (uint64_t)icq_isICQLaunchURL
{
  v2 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  v3 = [v2 scheme];
  if (([v3 isEqualToString:@"icq"] & 1) == 0)
  {

    goto LABEL_5;
  }
  v1 = [v2 host];
  char v4 = [v1 isEqualToString:@"launch"];

  if ((v4 & 1) == 0)
  {
LABEL_5:
    v6 = [v2 host];
    char v7 = [v6 isEqualToString:@"icq.icloud.com"];
    if ((v7 & 1) != 0
      || ([v2 host],
          v1 = objc_claimAutoreleasedReturnValue(),
          [v1 isEqualToString:@"icq.apple.com"]))
    {
      v8 = [v2 path];
      uint64_t v5 = [v8 isEqualToString:@"/launch"];

      if (v7) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  uint64_t v5 = 1;
LABEL_12:

  return v5;
}

- (id)icq_URLByAppendingQueryItems:()ICQ
{
  char v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  v6 = [v4 componentsWithURL:a1 resolvingAgainstBaseURL:1];
  char v7 = (void *)MEMORY[0x1E4F1CA48];
  v8 = [v6 queryItems];
  v9 = [v7 arrayWithArray:v8];

  [v9 addObjectsFromArray:v5];
  [v6 setQueryItems:v9];
  v10 = [v6 URL];

  return v10;
}

- (id)icq_URLByAppendingQueryParamName:()ICQ value:
{
  v6 = (void *)MEMORY[0x1E4F29088];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 componentsWithURL:a1 resolvingAgainstBaseURL:1];
  v10 = [MEMORY[0x1E4F290C8] queryItemWithName:v8 value:v7];

  v11 = (void *)MEMORY[0x1E4F1CA48];
  v12 = [v9 queryItems];
  v13 = [v11 arrayWithArray:v12];

  [v13 addObject:v10];
  [v9 setQueryItems:v13];
  v14 = [v9 URL];

  return v14;
}

- (id)icq_queryItemForName:()ICQ
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend(v5, "queryItems", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 name];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)icq_URLByAppendingQueryParamtersFromContext:()ICQ
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
    v6 = (void *)MEMORY[0x1E4F1CA48];
    v36 = v5;
    id v7 = [v5 queryItems];
    uint64_t v8 = [v6 arrayWithArray:v7];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = [*(id *)(*((void *)&v42 + 1) + 8 * i) name];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v12);
    }
    v35 = v10;

    long long v16 = [MEMORY[0x1E4F29088] componentsWithString:v4];
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v34 = v16;
    long long v17 = [v16 queryItems];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(id *)(*((void *)&v38 + 1) + 8 * j);
          v23 = [v22 name];
          v24 = [v23 lowercaseString];
          int v25 = [v24 isEqualToString:@"context"];

          if (v25)
          {
            v26 = (void *)MEMORY[0x1E4F290C8];
            v27 = [v22 value];
            uint64_t v28 = [v26 queryItemWithName:@"clientContext" value:v27];

            id v22 = (id)v28;
          }
          v29 = [v22 name];
          char v30 = [v9 containsObject:v29];

          if ((v30 & 1) == 0) {
            [v37 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v19);
    }

    [v35 addObjectsFromArray:v37];
    v31 = v36;
    [v36 setQueryItems:v35];
    v32 = [v36 URL];
  }
  else
  {
    v31 = _ICQGetLogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v49 = "-[NSURL(ICQ) icq_URLByAppendingQueryParamtersFromContext:]";
      _os_log_impl(&dword_1D5851000, v31, OS_LOG_TYPE_DEFAULT, "%s Context is unavailable bailing.", buf, 0xCu);
    }
    v32 = 0;
  }

  return v32;
}

@end