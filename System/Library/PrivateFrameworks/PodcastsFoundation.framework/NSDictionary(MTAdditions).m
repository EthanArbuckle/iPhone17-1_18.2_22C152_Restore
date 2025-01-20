@interface NSDictionary(MTAdditions)
- (id)mt_compactMap:()MTAdditions;
- (id)mt_invertedDictionary;
- (id)mt_subdictionaryWithKeys:()MTAdditions;
@end

@implementation NSDictionary(MTAdditions)

- (id)mt_invertedDictionary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = [a1 objectForKey:v8];
        if (v9) {
          [v2 setObject:v8 forKey:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)mt_compactMap:()MTAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__NSDictionary_MTAdditions__mt_compactMap___block_invoke;
    v10[3] = &unk_1E5E62F68;
    id v12 = v4;
    id v6 = v5;
    id v11 = v6;
    [a1 enumerateKeysAndObjectsUsingBlock:v10];
    v7 = v11;
    id v8 = v6;
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)mt_subdictionaryWithKeys:()MTAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
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
        id v12 = objc_msgSend(a1, "objectForKey:", v11, (void)v14);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

@end