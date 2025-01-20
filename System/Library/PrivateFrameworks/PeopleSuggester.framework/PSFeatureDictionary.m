@interface PSFeatureDictionary
@end

@implementation PSFeatureDictionary

void __44___PSFeatureDictionary__removeObjectForKey___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v8 = a3;
  v9 = [v8 objectForKeyedSubscript:a1[4]];

  if (v9)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    [v8 setObject:0 forKeyedSubscript:a1[4]];
    if (![v8 count]) {
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    }
    --*(void *)(a1[5] + 24);
    *a4 = 1;
  }
}

void __44___PSFeatureDictionary_mutableCopyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = (id)[a3 mutableCopy];
  v6 = -[_PSFeatureDictionary _timeBucketsCreateIfNeeded](*(void **)(a1 + 32));
  [v6 setObject:v7 forKeyedSubscript:v5];
}

void __59___PSFeatureDictionary_addEntriesFromDictionary_overwrite___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v5];
  if (v7)
  {
    id v18 = v5;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (!*(unsigned char *)(a1 + 40))
          {
            v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];

            if (v15) {
              continue;
            }
          }
          ++*(void *)(*(void *)(a1 + 32) + 24);
          v14 = [v8 objectForKeyedSubscript:v13];
          [v7 setObject:v14 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v5 = v18;
  }
  else
  {
    v16 = (void *)[v6 mutableCopy];
    v17 = -[_PSFeatureDictionary _timeBucketsCreateIfNeeded](*(void **)(a1 + 32));
    [v17 setObject:v16 forKeyedSubscript:v5];

    *(void *)(*(void *)(a1 + 32) + 24) += [v6 count];
  }
}

@end