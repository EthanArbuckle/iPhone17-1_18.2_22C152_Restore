@interface SearchUICoreSpotlightAppTopHitAsyncSectionLoader
- (CSSearchQuery)query;
- (NSMutableArray)foundItems;
- (NSRecursiveLock)lock;
- (SearchUICoreSpotlightAppTopHitAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5;
- (id)buildCardSectionsForFoundItems:(id)a3;
- (id)buildSearchQueryForBundleIdentifier:(id)a3;
- (id)defaultFetchAttributes;
- (id)responseForFoundItems:(id)a3 animated:(BOOL)a4;
- (void)fetchCardSectionsWithCompletionHandler:(id)a3;
- (void)setFoundItems:(id)a3;
- (void)setLock:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation SearchUICoreSpotlightAppTopHitAsyncSectionLoader

- (SearchUICoreSpotlightAppTopHitAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUICoreSpotlightAppTopHitAsyncSectionLoader;
  v5 = [(SearchUIAppTopHitAsyncSectionLoader *)&v8 initWithSectionModel:a3 result:a4 queryId:a5];
  if (v5)
  {
    v6 = objc_opt_new();
    [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)v5 setLock:v6];
  }
  return v5;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SearchUIAppTopHitSectionLoaderLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier];
    v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412546;
    v27 = v6;
    __int16 v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Fetching Spotlight AppTopHit results for bundle %@ using sectionLoader %@", buf, 0x16u);
  }
  v9 = [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self lock];
  [v9 lock];

  v10 = objc_opt_new();
  [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self setFoundItems:v10];

  v11 = [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self lock];
  [v11 unlock];

  v12 = [(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier];
  v13 = [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self buildSearchQueryForBundleIdentifier:v12];

  if (v13)
  {
    v14 = SSGetDisabledBundleSet();
    v15 = [v14 allObjects];
    v16 = [v13 queryContext];
    [v16 setDisableBundles:v15];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke;
    v25[3] = &unk_1E6E728C0;
    v25[4] = self;
    [v13 setFoundItemsHandler:v25];
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E6E728E8;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v4;
    [v13 setCompletionHandler:v22];
    [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self setQuery:v13];
    [v13 start];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = SearchUIAppTopHitSectionLoaderLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(SearchUIAppTopHitAsyncSectionLoader *)self bundleIdentifier];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412546;
      v27 = v18;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_1E45B5000, v17, OS_LOG_TYPE_DEFAULT, "Failed to fetch Spotlight AppTopHit results for bundle %@ using sectionLoader %@: No query generated", buf, 0x16u);
    }
    v21 = [(SearchUIAppTopHitAsyncSectionLoader *)self responseForCardSections:MEMORY[0x1E4F1CBF0] animated:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v21);
  }
}

void __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 lock];
  [v5 lock];

  v6 = [*(id *)(a1 + 32) foundItems];
  [v6 addObjectsFromArray:v4];

  id v7 = [*(id *)(a1 + 32) lock];
  [v7 unlock];
}

void __91__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_fetchCardSectionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = SearchUIAppTopHitSectionLoaderLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      id v7 = [WeakRetained bundleIdentifier];
      objc_super v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v18 = 138412802;
      v19 = v7;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = (uint64_t)v3;
      _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch Spotlight AppTopHit results for bundle %@ using sectionLoader %@: %@", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = [WeakRetained responseForCardSections:MEMORY[0x1E4F1CBF0] animated:0];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    if (v6)
    {
      v12 = [WeakRetained bundleIdentifier];
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = [WeakRetained foundItems];
      int v18 = 138412802;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = [v15 count];
      _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "Successfully fetched Spotlight AppTopHit results for bundle %@ using sectionLoader %@. Count: %lu", (uint8_t *)&v18, 0x20u);
    }
    uint64_t v16 = *(void *)(a1 + 32);
    v11 = [WeakRetained foundItems];
    v17 = [WeakRetained responseForFoundItems:v11 animated:0];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
}

- (id)defaultFetchAttributes
{
  if (defaultFetchAttributes_onceToken != -1) {
    dispatch_once(&defaultFetchAttributes_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultFetchAttributes_fetchAttributes;
  return v2;
}

void __74__SearchUICoreSpotlightAppTopHitAsyncSectionLoader_defaultFetchAttributes__block_invoke()
{
  v0 = rankingPrefetchedAttributesArray();
  v1 = (void *)[v0 mutableCopy];

  [v1 removeObject:*MEMORY[0x1E4F22B68]];
  v2 = (void *)defaultFetchAttributes_fetchAttributes;
  defaultFetchAttributes_fetchAttributes = (uint64_t)v1;
}

- (id)buildSearchQueryForBundleIdentifier:(id)a3
{
  return 0;
}

- (id)buildCardSectionsForFoundItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  unint64_t v6 = [(id)objc_opt_class() maxNumOfTopHitEntities];
  unint64_t v7 = [v4 count];
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    unint64_t v9 = 0;
    v32 = v4;
    v33 = self;
    v31 = v5;
    do
    {
      unint64_t v36 = v9;
      uint64_t v10 = [v4 objectAtIndexedSubscript:v9];
      id v35 = objc_alloc(MEMORY[0x1E4FA5DC8]);
      v34 = [v10 uniqueIdentifier];
      v11 = [v10 bundleID];
      v12 = [v10 protection];
      v13 = [v10 attributeSet];
      v14 = [v13 serializedAttributes];
      v15 = [v14 allKeys];
      uint64_t v16 = [v10 attributeSet];
      v17 = [v16 serializedAttributes];
      int v18 = [v17 allValues];
      v19 = (void *)[v35 initWithIdentifier:v34 bundleIdentifier:v11 protectionClass:v12 attributeKeys:v15 attributeValues:v18 type:3 completion:0];

      v5 = v31;
      __int16 v20 = [MEMORY[0x1E4FA5DE0] resultBuilderWithResult:v19];
      v21 = [v20 buildAppTopHitEntityCardSection];
      __int16 v22 = [(SearchUIAppTopHitAsyncSectionLoader *)v33 bundleIdentifier];
      [v19 setApplicationBundleIdentifier:v22];

      uint64_t v23 = [(SearchUIAsyncSectionLoader *)v33 searchResult];
      uint64_t v24 = [v23 completion];
      [v19 setCompletion:v24];

      v25 = [(SearchUIAsyncSectionLoader *)v33 searchResult];
      v26 = [v25 title];
      [v19 setTitle:v26];

      id v4 = v32;
      [v21 setSpotlightBackingResult:v19];
      [v31 addObject:v21];

      unint64_t v37 = v36 + 1;
      unint64_t v27 = [(id)objc_opt_class() maxNumOfTopHitEntities];
      unint64_t v28 = [v32 count];
      unint64_t v9 = v37;
      if (v27 >= v28) {
        unint64_t v29 = v28;
      }
      else {
        unint64_t v29 = v27;
      }
    }
    while (v37 < v29);
  }

  return v5;
}

- (id)responseForFoundItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(SearchUICoreSpotlightAppTopHitAsyncSectionLoader *)self buildCardSectionsForFoundItems:a3];
  unint64_t v7 = [(SearchUIAppTopHitAsyncSectionLoader *)self responseForCardSections:v6 animated:v4];

  return v7;
}

- (NSMutableArray)foundItems
{
  return self->_foundItems;
}

- (void)setFoundItems:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end