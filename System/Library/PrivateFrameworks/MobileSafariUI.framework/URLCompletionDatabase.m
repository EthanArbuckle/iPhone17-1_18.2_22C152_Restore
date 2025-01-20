@interface URLCompletionDatabase
- (URLCompletionDatabase)initWithCloudTabStore:(id)a3 profileIdentifier:(id)a4 searchableCollectionsMask:(int)a5 bookmarkProvider:(id)a6;
- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5;
- (int)searchableCollectionsMask;
- (void)_updateCloudDevices:(id)a3;
- (void)clearBookmarksCache;
- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4;
- (void)dealloc;
- (void)enumerateMatchDataForTypedStringHint:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 options:(unint64_t)a5 withBlock:(id)a6;
- (void)setSearchableCollectionsMask:(int)a3;
@end

@implementation URLCompletionDatabase

- (URLCompletionDatabase)initWithCloudTabStore:(id)a3 profileIdentifier:(id)a4 searchableCollectionsMask:(int)a5 bookmarkProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)URLCompletionDatabase;
  v14 = [(WBSURLCompletionDatabase *)&v27 init];
  v15 = v14;
  if (v14)
  {
    [(WBSURLCompletionDatabase *)v14 setDataSource:v14];
    v15->_searchableCollectionsMask = a5;
    uint64_t v16 = [v12 copy];
    profileIdentifier = v15->_profileIdentifier;
    v15->_profileIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_cloudTabStore, a3);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.mobilesafari.iCloudTabsAccessQueue", 0);
    cloudTabsAccessQueue = v15->_cloudTabsAccessQueue;
    v15->_cloudTabsAccessQueue = (OS_dispatch_queue *)v18;

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v15 selector:sel__updateCloudDevices_ name:@"CloudTabStoreDidUpdateNotification" object:0];
    v21 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    bookmarksCache = v15->_bookmarksCache;
    v15->_bookmarksCache = v21;

    [(NSCache *)v15->_bookmarksCache setCountLimit:1];
    objc_storeStrong((id *)&v15->_bookmarkProvider, a6);
    v23 = +[Application sharedApplication];
    v24 = [v23 tabGroupManager];
    [v24 addCloudTabsObserver:v15];

    v25 = v15;
  }

  return v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)URLCompletionDatabase;
  [(URLCompletionDatabase *)&v4 dealloc];
}

- (void)clearBookmarksCache
{
}

- (void)_updateCloudDevices:(id)a3
{
  cloudTabsAccessQueue = self->_cloudTabsAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__URLCompletionDatabase__updateCloudDevices___block_invoke;
  block[3] = &unk_1E6D79060;
  block[4] = self;
  dispatch_sync(cloudTabsAccessQueue, block);
}

void __45__URLCompletionDatabase__updateCloudDevices___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 128) syncedRemoteCloudTabDevicesForProfileWithIdentifier:*(void *)(*(void *)(a1 + 32) + 168)];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = v2;
}

- (void)cloudTabDeviceProvider:(id)a3 didUpdateCloudTabsInProfileWithIdentifier:(id)a4
{
}

- (void)enumerateMatchDataForTypedStringHint:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 options:(unint64_t)a5 withBlock:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v49 = a4;
  id v10 = a6;
  id v11 = +[Application sharedApplication];
  id v12 = [v11 historyController];
  v48 = [v12 historyForProfileIdentifier:v49 loadIfNeeded:1];

  group = dispatch_group_create();
  int searchableCollectionsMask = self->_searchableCollectionsMask;
  if ((searchableCollectionsMask & 4) != 0)
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    dispatch_group_enter(group);
    v15 = [MEMORY[0x1E4F1C9C8] date];
    [v15 timeIntervalSinceReferenceDate];
    double v17 = v16;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke;
    v75[3] = &unk_1E6D7DFA0;
    id v76 = v48;
    id v18 = v14;
    id v77 = v18;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2;
    v72[3] = &unk_1E6D7DFC8;
    id v73 = v53;
    v74 = group;
    [v76 searchForUserTypedString:v73 options:a5 currentTime:v75 enumerationBlock:v72 completionHandler:v17];

    int searchableCollectionsMask = self->_searchableCollectionsMask;
    v50 = v18;
    if ((searchableCollectionsMask & 2) == 0)
    {
LABEL_3:
      if ((searchableCollectionsMask & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v50 = 0;
    if ((searchableCollectionsMask & 2) == 0) {
      goto LABEL_3;
    }
  }
  cloudTabsAccessQueue = self->_cloudTabsAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_273;
  block[3] = &unk_1E6D7DFF0;
  block[4] = self;
  id v69 = v53;
  unint64_t v71 = a5;
  id v70 = v10;
  dispatch_sync(cloudTabsAccessQueue, block);

  int searchableCollectionsMask = self->_searchableCollectionsMask;
  if ((searchableCollectionsMask & 1) == 0)
  {
LABEL_4:
    if ((searchableCollectionsMask & 4) == 0) {
      goto LABEL_35;
    }
    goto LABEL_24;
  }
LABEL_8:
  bookmarksCache = self->_bookmarksCache;
  v21 = [v53 normalizedString];
  v47 = [(NSCache *)bookmarksCache objectForKey:v21];

  if (v47)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v47;
    uint64_t v22 = [obj countByEnumeratingWithState:&v64 objects:v79 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v65 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          v26 = [v25 address];
          objc_super v27 = [v25 title];
          char hasMatchWithOptions = SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions();

          if (hasMatchWithOptions)
          {
            v31 = matchDataWithBookmark((WebBookmark *)v25, v29, v30);
            (*((void (**)(id, void *))v10 + 2))(v10, v31);
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v64 objects:v79 count:16];
      }
      while (v22);
    }
  }
  else
  {
    v32 = [v53 components];
    v33 = [v32 firstObject];
    v34 = v33;
    if (v33)
    {
      obuint64_t j = v33;
    }
    else
    {
      obuint64_t j = [v53 normalizedString];
    }

    v35 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:16];
    bookmarkProvider = self->_bookmarkProvider;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_276;
    v58[3] = &unk_1E6D7E018;
    id v37 = v53;
    id v59 = v37;
    unint64_t v63 = a5;
    id v38 = v35;
    id v60 = v38;
    id v62 = v10;
    id v61 = v48;
    [(WBBookmarkProvider *)bookmarkProvider enumerateBookmarks:1 andReadingListItems:1 matchingString:obj usingBlock:v58];
    v39 = self->_bookmarksCache;
    v40 = [v37 normalizedString];
    [(NSCache *)v39 setObject:v38 forKey:v40];
  }
  if ((self->_searchableCollectionsMask & 4) != 0)
  {
LABEL_24:
    dispatch_time_t v41 = dispatch_time(0, 2000000000);
    if (dispatch_group_wait(group, v41))
    {
      v42 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[URLCompletionDatabase enumerateMatchDataForTypedStringHint:filterResultsUsingProfileIdentifier:options:withBlock:]((uint64_t)v53, v42);
      }
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v43 = v50;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v54 objects:v78 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v55 != v45) {
              objc_enumerationMutation(v43);
            }
            (*((void (**)(id, void))v10 + 2))(v10, *(void *)(*((void *)&v54 + 1) + 8 * j));
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v54 objects:v78 count:16];
        }
        while (v44);
      }
    }
  }
LABEL_35:
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v5 = [v3 originalURLString];
  v6 = [v4 itemForURLString:v5];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_super v4 = (id)WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend(v3, "safari_privacyPreservingDescription");
      __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_cold_1(v5, a1, v6, v4);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_273(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 136))
  {
    id v3 = [*(id *)(v2 + 128) syncedRemoteCloudTabDevicesForProfileWithIdentifier:*(void *)(v2 + 168)];
    uint64_t v4 = [v3 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v4;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = *(id *)(v2 + 136);
  uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v24 = v7;
        id v25 = [v7 tabs];
        uint64_t v8 = [v25 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v25);
              }
              id v11 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              id v12 = [v11 url];
              id v13 = [v12 absoluteString];

              v14 = [v11 title];
              if (SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions())
              {
                v15 = (void *)[objc_alloc(MEMORY[0x1E4FB60E0]) initWithTitle:v14 address:v13 collectionType:0];
                uint64_t v16 = *(void *)(a1 + 48);
                id v17 = objc_alloc(MEMORY[0x1E4F784B0]);
                id v18 = [v24 disambiguatedName];
                v19 = (void *)[v17 initWithCloudTab:v15 deviceName:v18];
                (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v19);
              }
            }
            uint64_t v8 = [v25 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v8);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_276(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  v6 = a4;
  if (SafariShared::BookmarkAndHistoryCompletionMatch::hasMatchWithOptions())
  {
    v6[2](v6);
    uint64_t v7 = (WebBookmark *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) addObject:v7];
    uint64_t v8 = *(void *)(a1 + 56);
    id v11 = matchDataWithBookmark(v7, v9, v10);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
  }
}

- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB60E0]) initWithTitle:v8 address:v7 collectionType:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F784B0]) initWithBookmark:v9 shouldPreload:v5];

  return v10;
}

- (int)searchableCollectionsMask
{
  return self->_searchableCollectionsMask;
}

- (void)setSearchableCollectionsMask:(int)a3
{
  self->_int searchableCollectionsMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
  objc_storeStrong((id *)&self->_bookmarksCache, 0);
  objc_storeStrong((id *)&self->_cloudTabsAccessQueue, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_cloudTabStore, 0);
}

- (void)enumerateMatchDataForTypedStringHint:(uint64_t)a1 filterResultsUsingProfileIdentifier:(NSObject *)a2 options:withBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 141558275;
  uint64_t v3 = 1752392040;
  __int16 v4 = 2117;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Timeout while processing user-typed string: %{sensitive, mask.hash}@", (uint8_t *)&v2, 0x16u);
}

void __116__URLCompletionDatabase_enumerateMatchDataForTypedStringHint_filterResultsUsingProfileIdentifier_options_withBlock___block_invoke_2_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *(void *)(a2 + 32);
  *(_DWORD *)buf = 138543875;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2160;
  *(void *)(buf + 14) = 1752392040;
  *((_WORD *)buf + 11) = 2117;
  *((void *)buf + 3) = v5;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Error searching history: %{public}@ for user-typed string: %{sensitive, mask.hash}@", buf, 0x20u);
}

@end