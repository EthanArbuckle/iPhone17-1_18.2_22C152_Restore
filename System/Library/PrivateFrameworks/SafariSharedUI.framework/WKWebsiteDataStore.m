@interface WKWebsiteDataStore
@end

@implementation WKWebsiteDataStore

void __117__WKWebsiteDataStore_SafariSharedExtras__safari_fetchExistingDataStoresForProfilesWithIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (*(unsigned char *)(a1 + 56))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F46710], "safari_defaultDataStore");
    [v4 addObject:v5];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "UUIDString", (void)v15);
        if ([*(id *)(a1 + 32) containsObject:v11])
        {
          v12 = objc_msgSend(*(id *)(a1 + 48), "safari_dataStoreWithoutCachingForProfileWithIdentifier:", v11);
          [v4 addObject:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  v14 = (void *)[v4 copy];
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
}

@end