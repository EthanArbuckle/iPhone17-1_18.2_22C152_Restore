@interface SearchUIAppClipValidationCache
- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUIAppClipValidationCache

- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v14 = [v13 url];
        if (v14)
        {
          v15 = (void *)v14;
          v16 = [v13 applicationBundleIdentifier];

          if (v16)
          {
            v17 = [v13 applicationBundleIdentifier];
            v18 = [v13 url];
            [v7 setObject:v17 forKey:v18];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F59128]) initWithValidation:v7];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__SearchUIAppClipValidationCache_computeObjectsForKeys_completionHandler___block_invoke;
  v22[3] = &unk_1E6E744B8;
  id v23 = v8;
  id v24 = v6;
  id v20 = v6;
  id v21 = v8;
  [v19 validateWithCompletion:v22];
}

void __74__SearchUIAppClipValidationCache_computeObjectsForKeys_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v17 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    id v8 = (void *)MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v3, "availabilities", v17);
        v12 = [v10 url];
        uint64_t v13 = [v11 objectForKeyedSubscript:v12];
        uint64_t v14 = (void *)v13;
        if (v13) {
          v15 = (void *)v13;
        }
        else {
          v15 = v8;
        }
        id v16 = v15;

        [v4 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(v17 + 40) + 16))();
}

@end