@interface NSDictionary(Utilities)
- (id)mt_deepCopy;
- (id)mt_dictionarybyReplacingKey:()Utilities value:;
- (id)mt_removingKeys:()Utilities;
@end

@implementation NSDictionary(Utilities)

- (id)mt_removingKeys:()Utilities
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11, (void)v14) & 1) == 0) {
          [v5 removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

- (id)mt_deepCopy
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v27 = (uint64_t)&v27;
  uint64_t v28 = [a1 count];
  size_t v2 = 8 * v28;
  v3 = (char *)&v27 - ((8 * v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v3, 8 * v28);
  id v4 = v3;
  size_t v29 = v2;
  bzero(v3, v2);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      v30 = sel_mt_deepCopy;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = v8 + v10;
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        objc_storeStrong((id *)&v4[8 * (v8 + v10)], v12);
        v13 = [v5 objectForKeyedSubscript:v12];
        if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v13, "mt_deepCopy");
          id v14 = v5;
          long long v15 = v3;
          uint64_t v16 = v8;
          uint64_t v17 = v7;
          uint64_t v18 = v9;
          v20 = uint64_t v19 = v4;

          v13 = (void *)v20;
          id v4 = v19;
          uint64_t v9 = v18;
          uint64_t v7 = v17;
          uint64_t v8 = v16;
          v3 = v15;
          id v5 = v14;
        }
        v21 = *(void **)&v3[8 * v11];
        *(void *)&v3[8 * v11] = v13;

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
      uint64_t v8 = (v8 + v10);
    }
    while (v7);
  }

  uint64_t v22 = v28;
  v23 = [NSDictionary dictionaryWithObjects:v3 forKeys:v4 count:v28];
  size_t v24 = v29;
  if (v22)
  {
    size_t v25 = v29;
    do
    {

      v25 -= 8;
    }
    while (v25);
    do
    {

      v24 -= 8;
    }
    while (v24);
  }

  return v23;
}

- (id)mt_dictionarybyReplacingKey:()Utilities value:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 objectForKey:v6];
  uint64_t v9 = v8;
  if (v8 == v7 || [v8 isEqual:v7])
  {
    id v10 = a1;
  }
  else
  {
    int v11 = (void *)[a1 mutableCopy];
    [v11 setObject:v7 forKeyedSubscript:v6];
    id v10 = (id)[v11 copy];
  }

  return v10;
}

@end