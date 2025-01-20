@interface NSDictionary
@end

@implementation NSDictionary

void __51__NSDictionary_TRI__triKeys_values_fromDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
}

void __38__NSDictionary_TRIDAG__triReversedDag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v11];
        if (!v12)
        {
          v12 = objc_opt_new();
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __52__NSDictionary_TRIDAG__triTransformValuesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v8 forKeyedSubscript:v7];
}

@end