@interface ICCrossAppHashtagManager
+ (id)bundleIDsForHashtagSupportingAppsOtherThanNotes;
+ (id)hashtagDisplayTextsFromOtherApps;
+ (void)prefetchHashtagDisplayTextsFromOtherApps;
+ (void)updateUserDefaultsCacheIfNecessaryWithNewlyFetchedHastags:(id)a3;
@end

@implementation ICCrossAppHashtagManager

+ (id)hashtagDisplayTextsFromOtherApps
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  v3 = [v2 objectForKey:@"CrossAppHashtagDisplayText"];

  objc_opt_class();
  v4 = ICCheckedDynamicCast();
  v5 = v4;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    objc_opt_class();
    v11 = ICDynamicCast();
    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v11, v14);
  }
  else
  {
LABEL_12:
    v12 = objc_opt_new();
  }

  return v12;
}

+ (id)bundleIDsForHashtagSupportingAppsOtherThanNotes
{
  return &unk_1F1F62C70;
}

+ (void)prefetchHashtagDisplayTextsFromOtherApps
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [a1 bundleIDsForHashtagSupportingAppsOtherThanNotes];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__32;
  v15[4] = __Block_byref_object_dispose__32;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F237E0]) initWithQueryString:0 bundleIDs:v3];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke;
  v14[3] = &unk_1E64A7088;
  v14[4] = v15;
  [v4 setHashTagCompletionHandler:v14];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke_15;
  v10 = &unk_1E64A70B0;
  v12 = v15;
  id v5 = v3;
  id v11 = v5;
  id v13 = a1;
  [v4 setCompletionHandler:&v7];
  id v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Starting to fetch hashtags from bundleIDs: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "start", v7, v8, v9, v10);
  _Block_object_dispose(v15, 8);
}

void __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = [v3 count];
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "hashTagCompletionHandler returned %lu hasthags", (uint8_t *)&v7, 0xCu);
  }

  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = [v3 allObjects];
  [v5 addObjectsFromArray:v6];
}

void __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = @"success.";
    if (v3) {
      id v5 = v3;
    }
    int v9 = 138412290;
    uint64_t v10 = (uint64_t)v5;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "hashtagQuery completed with %@", (uint8_t *)&v9, 0xCu);
  }

  if (!v3)
  {
    id v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 134218242;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Fetched %lu hasthags from bundleIDs: %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 48) updateUserDefaultsCacheIfNecessaryWithNewlyFetchedHastags:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

+ (void)updateUserDefaultsCacheIfNecessaryWithNewlyFetchedHastags:(id)a3
{
  id v8 = a3;
  v4 = [a1 hashtagDisplayTextsFromOtherApps];
  if (([v8 isEqualToSet:v4] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    id v6 = [v8 allObjects];
    [v5 setObject:v6 forKey:@"CrossAppHashtagDisplayText"];

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"ICCrossAppHashtagDisplayTextUpdatedNotification" object:0];
  }
}

@end