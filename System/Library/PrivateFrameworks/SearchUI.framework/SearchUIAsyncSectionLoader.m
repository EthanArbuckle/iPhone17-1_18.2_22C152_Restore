@interface SearchUIAsyncSectionLoader
+ (BOOL)supportsSectionModel:(id)a3;
+ (id)asyncLoaderSupportingSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5;
- (BOOL)supportsPreloading;
- (NSArray)objectCache;
- (NSString)sectionIdentifier;
- (SFSearchResult)searchResult;
- (SearchUIAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5;
- (SearchUIAsyncSectionLoaderDelegate)delegate;
- (id)backgroundColor;
- (id)cacheIdentifier;
- (id)cachedValue;
- (id)cardSections;
- (id)placeholderCardSections;
- (unint64_t)queryId;
- (void)fetchCardSectionsWithCompletionHandler:(id)a3;
- (void)preloadIfNecessary;
- (void)reloadWithCardSections:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setObjectCache:(id)a3;
- (void)start;
@end

@implementation SearchUIAsyncSectionLoader

+ (id)asyncLoaderSupportingSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)asyncLoaderSupportingSectionModel_result_queryId__classes;
  if (!asyncLoaderSupportingSectionModel_result_queryId__classes)
  {
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    v11 = (void *)asyncLoaderSupportingSectionModel_result_queryId__classes;
    asyncLoaderSupportingSectionModel_result_queryId__classes = v10;

    v9 = (void *)asyncLoaderSupportingSectionModel_result_queryId__classes;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(objc_class **)(*((void *)&v20 + 1) + 8 * i);
        if (-[objc_class supportsSectionModel:](v17, "supportsSectionModel:", v7, (void)v20))
        {
          v18 = (void *)[[v17 alloc] initWithSectionModel:v7 result:v8 queryId:a5];
          goto LABEL_13;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  v18 = 0;
LABEL_13:

  return v18;
}

+ (BOOL)supportsSectionModel:(id)a3
{
  return 0;
}

- (SearchUIAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SearchUIAsyncSectionLoader *)self init];
  if (v10)
  {
    v11 = [v8 section];
    uint64_t v12 = [v11 sectionIdentifier];
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v10->_searchResult, a4);
    v10->_queryId = a5;
    if (initWithSectionModel_result_queryId__onceToken[0] != -1) {
      dispatch_once(initWithSectionModel_result_queryId__onceToken, &__block_literal_global);
    }
  }

  return v10;
}

uint64_t __66__SearchUIAsyncSectionLoader_initWithSectionModel_result_queryId___block_invoke()
{
  computeCache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)backgroundColor
{
  return 0;
}

- (id)placeholderCardSections
{
  return 0;
}

- (id)cacheIdentifier
{
  return 0;
}

- (BOOL)supportsPreloading
{
  return 1;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
}

- (id)cardSections
{
  v3 = [(SearchUIAsyncSectionLoader *)self cachedValue];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SearchUIAsyncSectionLoader *)self placeholderCardSections];
  }
  v6 = v5;

  return v6;
}

- (void)preloadIfNecessary
{
  if ([(SearchUIAsyncSectionLoader *)self supportsPreloading])
  {
    [(SearchUIAsyncSectionLoader *)self start];
  }
}

- (void)start
{
  v3 = [(SearchUIAsyncSectionLoader *)self cachedValue];

  if (!v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__SearchUIAsyncSectionLoader_start__block_invoke;
    aBlock[3] = &unk_1E6E724E8;
    objc_copyWeak(&v11, &location);
    v4 = _Block_copy(aBlock);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __35__SearchUIAsyncSectionLoader_start__block_invoke_2;
    v8[3] = &unk_1E6E72510;
    objc_copyWeak(&v9, &location);
    id v5 = (void (**)(void *, void *))_Block_copy(v8);
    v6 = [(SearchUIAsyncSectionLoader *)self cacheIdentifier];
    if (v6)
    {
      id v7 = objc_opt_new();
      [v7 setIdentifier:v6];
      [v7 setComputeBlock:v5];
      [(id)computeCache getObjectForKey:v7 completionHandler:v4];
    }
    else
    {
      v5[2](v5, v4);
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __35__SearchUIAsyncSectionLoader_start__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [v6 cardSection];

  if (v4)
  {
    id v5 = [v6 cardSection];
    objc_msgSend(WeakRetained, "reloadWithCardSections:animated:reconfigureExisting:", v5, objc_msgSend(v6, "animated"), objc_msgSend(v6, "reconfigureExisting"));
  }
}

void __35__SearchUIAsyncSectionLoader_start__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = SearchUIAppTopHitSectionLoaderLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = SearchUIAppTopHitSectionLoaderLog();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E45B5000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "performAsyncSectionLoader", "", buf, 2u);
  }

  [WeakRetained fetchCardSectionsWithCompletionHandler:v3];
  id v9 = SearchUIAppTopHitSectionLoaderLog();
  uint64_t v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E45B5000, v10, OS_SIGNPOST_INTERVAL_END, v6, "performAsyncSectionLoader", "", v11, 2u);
  }
}

- (void)reloadWithCardSections:(id)a3 animated:(BOOL)a4 reconfigureExisting:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__SearchUIAsyncSectionLoader_reloadWithCardSections_animated_reconfigureExisting___block_invoke;
    v9[3] = &unk_1E6E72538;
    objc_copyWeak(&v11, &location);
    id v10 = v8;
    BOOL v12 = a4;
    BOOL v13 = a5;
    +[SearchUIUtilities dispatchMainIfNecessary:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __82__SearchUIAsyncSectionLoader_reloadWithCardSections_animated_reconfigureExisting___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setObjectCache:*(void *)(a1 + 32)];
  v2 = [WeakRetained delegate];
  id v3 = [WeakRetained sectionIdentifier];
  [v2 reloadSectionWithIdentifier:v3 animated:*(unsigned __int8 *)(a1 + 48) reconfigureExisting:*(unsigned __int8 *)(a1 + 49)];
}

- (id)cachedValue
{
  id v3 = [(SearchUIAsyncSectionLoader *)self cacheIdentifier];

  if (v3)
  {
    v4 = objc_opt_new();
    id v5 = [(SearchUIAsyncSectionLoader *)self cacheIdentifier];
    [v4 setIdentifier:v5];

    os_signpost_id_t v6 = [(id)computeCache getCachedObjectIfAvailableForKey:v4];
    id v7 = [v6 cardSection];
  }
  else
  {
    id v7 = [(SearchUIAsyncSectionLoader *)self objectCache];
  }
  return v7;
}

- (SearchUIAsyncSectionLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIAsyncSectionLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFSearchResult)searchResult
{
  return (SFSearchResult *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (NSArray)objectCache
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObjectCache:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_objectCache, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end