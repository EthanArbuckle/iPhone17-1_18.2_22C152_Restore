@interface PSSearchModel
+ (id)sharedInstance;
- (BOOL)hasCompletedIndexing;
- (BOOL)isIndexing;
- (BOOL)isLoadingResults;
- (BOOL)showSectionInDetailText;
- (BOOL)waitUntilFinished;
- (NSArray)rootEntries;
- (NSString)currentQuery;
- (PSSearchModel)init;
- (PSSearchModelDataSource)dataSource;
- (PSSearchOperation)activeSearchOperation;
- (PSSearchResults)currentResults;
- (id)_defaultSearchResultsSectionComparator;
- (id)_rootSpecifiers;
- (id)_searchEntriesForSpecifierDataSource:(id)a3;
- (id)recursiveDescription;
- (id)searchOperation:(id)a3 filteredEntriesForEntries:(id)a4;
- (int64_t)observerType;
- (void)_addSearchEntries:(id)a3 parent:(id)a4 usingBlock:(id)a5;
- (void)_addSpecifierDataSource:(id)a3 forSearchEntry:(id)a4;
- (void)_beginIndexingIfNecessary;
- (void)_beginSearchingEntriesForCurrentQuery:(id)a3 newSearch:(BOOL)a4;
- (void)_cancelAllSearchOperations;
- (void)_enumerateDelegatesUsingBlock:(id)a3;
- (void)_finishedIndexingEntry:(id)a3;
- (void)_loadChildrenForEntry:(id)a3;
- (void)_performDeferredUpdatesForEntry:(id)a3;
- (void)_performSpecifierUpdates:(id)a3 forSearchEntries:(id)a4;
- (void)_reloadSearchEntries:(id)a3;
- (void)_removeSearchEntries:(id)a3 usingBlock:(id)a4;
- (void)_removeSearchEntries:(id)a3 usingBlock:(id)a4 forReload:(BOOL)a5;
- (void)_updateWithNewSearchResults:(id)a3 forQuery:(id)a4 newSearch:(BOOL)a5;
- (void)_updatedEntry:(id)a3 withChildren:(id)a4;
- (void)addDelegate:(id)a3;
- (void)addRootSpecifier:(id)a3;
- (void)dataSource:(id)a3 performUpdates:(id)a4;
- (void)dealloc;
- (void)invalidateSpecifiersForDataSource:(id)a3;
- (void)preheat;
- (void)reloadRootSpecifier:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeRootSpecifier:(id)a3;
- (void)searchForQuery:(id)a3;
- (void)searchIndexOperation:(id)a3 didFindSpecifierDataSource:(id)a4;
- (void)searchIndexOperationDidCancel:(id)a3;
- (void)searchIndexOperationDidFinish:(id)a3 searchEntries:(id)a4;
- (void)searchOperation:(id)a3 configureSearchResults:(id)a4;
- (void)searchOperationDidBegin:(id)a3;
- (void)searchOperationDidCancel:(id)a3;
- (void)searchOperationDidFinish:(id)a3 withResults:(id)a4;
- (void)setActiveSearchOperation:(id)a3;
- (void)setCurrentQuery:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setShowSectionInDetailText:(BOOL)a3;
- (void)setWaitUntilFinished:(BOOL)a3;
@end

@implementation PSSearchModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __31__PSSearchModel_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PSSearchModel);
  uint64_t v1 = sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PSSearchModel)init
{
  v28.receiver = self;
  v28.super_class = (Class)PSSearchModel;
  v2 = [(PSSearchModel *)&v28 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    indexOperationQueue = v2->_indexOperationQueue;
    v2->_indexOperationQueue = v3;

    [(NSOperationQueue *)v2->_indexOperationQueue setName:@"com.apple.preferences.search.indexingOperationQueue"];
    [(NSOperationQueue *)v2->_indexOperationQueue setMaxConcurrentOperationCount:8];
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    searchOperationQueue = v2->_searchOperationQueue;
    v2->_searchOperationQueue = v5;

    [(NSOperationQueue *)v2->_searchOperationQueue setName:@"com.apple.preferences.search.searchOperationQueue"];
    [(NSOperationQueue *)v2->_searchOperationQueue setMaxConcurrentOperationCount:1];
    uint64_t v7 = objc_opt_new();
    delegates = v2->_delegates;
    v2->_delegates = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    specifierDataSources = v2->_specifierDataSources;
    v2->_specifierDataSources = (NSMapTable *)v9;

    uint64_t v11 = objc_opt_new();
    rootEntries = v2->_rootEntries;
    v2->_rootEntries = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    entriesBeingIndexed = v2->_entriesBeingIndexed;
    v2->_entriesBeingIndexed = (NSMutableSet *)v13;

    uint64_t v15 = objc_opt_new();
    indexingEntriesWithLoadedDataSources = v2->_indexingEntriesWithLoadedDataSources;
    v2->_indexingEntriesWithLoadedDataSources = (NSMutableSet *)v15;

    uint64_t v17 = objc_opt_new();
    removedEntriesStillIndexing = v2->_removedEntriesStillIndexing;
    v2->_removedEntriesStillIndexing = (NSMutableSet *)v17;

    uint64_t v19 = objc_opt_new();
    deferredSpecifierUpdates = v2->_deferredSpecifierUpdates;
    v2->_deferredSpecifierUpdates = (NSMutableArray *)v19;

    uint64_t v21 = objc_opt_new();
    entriesPendingSearch = v2->_entriesPendingSearch;
    v2->_entriesPendingSearch = (NSMutableSet *)v21;

    uint64_t v23 = objc_opt_new();
    removedEntriesStillSearching = v2->_removedEntriesStillSearching;
    v2->_removedEntriesStillSearching = (NSMutableSet *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.preferences.search.pendingSearchAccessQueue", 0);
    searchStateAccessQueue = v2->_searchStateAccessQueue;
    v2->_searchStateAccessQueue = (OS_dispatch_queue *)v25;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(NSOperationQueue *)self->_indexOperationQueue operations];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_43_1];

  [(NSOperationQueue *)self->_indexOperationQueue cancelAllOperations];
  v4 = [(NSOperationQueue *)self->_searchOperationQueue operations];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_45];

  [(NSOperationQueue *)self->_searchOperationQueue cancelAllOperations];
  v5.receiver = self;
  v5.super_class = (Class)PSSearchModel;
  [(PSSearchModel *)&v5 dealloc];
}

uint64_t __24__PSSearchModel_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

uint64_t __24__PSSearchModel_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDelegate:0];
}

- (id)_rootSpecifiers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_super v5 = [WeakRetained rootSpecifiersForSearchModel:self];

  if (![v5 count])
  {
    id v6 = objc_loadWeakRetained((id *)p_dataSource);
    NSLog(&cfstr_ErrorDataSourc.isa, self, v6);
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[PSSpecifier specifierWithSpecifier:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)preheat
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (!WeakRetained) {
    NSLog(&cfstr_ErrorWasAskedT.isa, self);
  }
  if (!self->_hasLoadedRootEntries)
  {
    objc_super v5 = [(PSSearchModel *)self _rootSpecifiers];
    if ([v5 count])
    {
      SearchEntriesFromSpecifiers(v5, 0, 0);
      id v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      rootEntries = self->_rootEntries;
      self->_rootEntries = v6;

      id v8 = objc_loadWeakRetained((id *)p_dataSource);
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)p_dataSource);
        uint64_t v11 = (void *)[v10 rootSearchControllerClassForSearchModel:self];

        if (objc_opt_respondsToSelector()) {
          [v11 formatSearchEntries:self->_rootEntries parent:0];
        }
      }
      self->_hasLoadedRootEntries = 1;
    }
  }
  if ([(NSMutableArray *)self->_rootEntries count])
  {
    [(PSSearchModel *)self _beginIndexingIfNecessary];
  }
}

- (void)addDelegate:(id)a3
{
  if (a3)
  {
    delegates = self->_delegates;
    +[PSWeakReference weakReferenceWithObject:](PSWeakReference, "weakReferenceWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableSet *)delegates addObject:v4];
  }
}

- (void)removeDelegate:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_delegates, "removeObject:");
  }
}

- (void)_enumerateDelegatesUsingBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    delegates = self->_delegates;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__PSSearchModel__enumerateDelegatesUsingBlock___block_invoke;
    v7[3] = &unk_1E5C5F158;
    id v8 = v4;
    [(NSMutableSet *)delegates enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __47__PSSearchModel__enumerateDelegatesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 object];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v4 = v6;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)_searchEntriesForSpecifierDataSource:(id)a3
{
  return [(NSMapTable *)self->_specifierDataSources objectForKey:a3];
}

- (void)_addSpecifierDataSource:(id)a3 forSearchEntry:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_specifierDataSources objectForKey:v8];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    [(NSMapTable *)self->_specifierDataSources setObject:v7 forKey:v8];
  }
  [v7 addObject:v6];
  [v8 addObserver:self];
}

- (void)addRootSpecifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_hasLoadedRootEntries)
  {
    id v6 = SearchEntryFromSpecifier(v4, 0);
    if (v6)
    {
      objc_initWeak(&location, self->_rootEntries);
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __34__PSSearchModel_addRootSpecifier___block_invoke;
      v8[3] = &unk_1E5C5D7C8;
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      [(PSSearchModel *)self _addSearchEntries:v7 parent:0 usingBlock:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __34__PSSearchModel_addRootSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addObject:*(void *)(a1 + 32)];
}

- (void)reloadRootSpecifier:(id)a3
{
  id v4 = a3;
  [(PSSearchModel *)self removeRootSpecifier:v4];
  [(PSSearchModel *)self addRootSpecifier:v4];
}

- (void)removeRootSpecifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasLoadedRootEntries)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v5 = self->_rootEntries;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v19;
LABEL_4:
      uint64_t v10 = 0;
      uint64_t v16 = v8 + v7;
      while (1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v10) identifier];
        v12 = [v4 identifier];
        char v13 = [v11 isEqualToString:v12];

        if (v13) {
          break;
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
          uint64_t v8 = v16;
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      if ((v8 ^ 0x7FFFFFFFFFFFFFFFLL) == v10) {
        goto LABEL_12;
      }
      v14 = [(NSMutableArray *)self->_rootEntries objectAtIndexedSubscript:v8 + v10];
      long long v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __37__PSSearchModel_removeRootSpecifier___block_invoke;
      v17[3] = &unk_1E5C5F180;
      v17[4] = self;
      v17[5] = v8 + v10;
      [(PSSearchModel *)self _removeSearchEntries:v15 usingBlock:v17];
    }
    else
    {
LABEL_10:

LABEL_12:
      NSLog(&cfstr_ErrorNoRootSea.isa, v4);
    }
  }
}

uint64_t __37__PSSearchModel_removeRootSpecifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:*(void *)(a1 + 40)];
}

- (void)_addSearchEntries:(id)a3 parent:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  id v10 = a4;
  uint64_t v11 = [(PSSearchModel *)self currentQuery];

  if (v11)
  {
    searchStateAccessQueue = self->_searchStateAccessQueue;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __53__PSSearchModel__addSearchEntries_parent_usingBlock___block_invoke;
    long long v17 = &unk_1E5C5DDD0;
    long long v18 = self;
    id v13 = v8;
    id v19 = v13;
    dispatch_async(searchStateAccessQueue, &v14);

    v9[2](v9);
    -[PSSearchModel _beginSearchingEntriesForCurrentQuery:newSearch:](self, "_beginSearchingEntriesForCurrentQuery:newSearch:", v13, 0, v14, v15, v16, v17, v18);
  }
  else
  {
    v9[2](v9);
  }
  [(PSSearchModel *)self _updatedEntry:v10 withChildren:v8];
}

uint64_t __53__PSSearchModel__addSearchEntries_parent_usingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) unionSet:*(void *)(a1 + 40)];
}

- (void)_removeSearchEntries:(id)a3 usingBlock:(id)a4
{
}

- (void)_removeSearchEntries:(id)a3 usingBlock:(id)a4 forReload:(BOOL)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a4;
  id v10 = [(PSSearchModel *)self currentQuery];
  if (v10)
  {
    searchStateAccessQueue = self->_searchStateAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke;
    block[3] = &unk_1E5C5DDD0;
    block[4] = self;
    id v24 = v8;
    dispatch_async(searchStateAccessQueue, block);
  }
  if (!a5)
  {
    removedEntriesStillIndexing = self->_removedEntriesStillIndexing;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_2;
    v22[3] = &unk_1E5C5F1A8;
    v22[4] = self;
    id v13 = [v8 objectsPassingTest:v22];
    [(NSMutableSet *)removedEntriesStillIndexing unionSet:v13];
  }
  v9[2](v9);
  if (v10)
  {
    currentResults = self->_currentResults;
    uint64_t v15 = [v8 allObjects];
    uint64_t v16 = [(PSSearchResults *)currentResults removeEntries:v15];

    if (v16)
    {
      [(PSSearchResults *)self->_currentResults sortResults];
      long long v17 = [(PSSearchModel *)self currentResults];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_3;
      v19[3] = &unk_1E5C5F1D0;
      v19[4] = self;
      id v20 = v17;
      id v21 = v10;
      id v18 = v17;
      [(PSSearchModel *)self _enumerateDelegatesUsingBlock:v19];
    }
  }
}

uint64_t __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) unionSet:*(void *)(a1 + 40)];
}

uint64_t __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) containsObject:a2];
}

void __59__PSSearchModel__removeSearchEntries_usingBlock_forReload___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 searchModel:a1[4] updatedWithNewResults:a1[5] forQuery:a1[6]];
  }
}

- (void)_reloadSearchEntries:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__PSSearchModel__reloadSearchEntries___block_invoke;
  v3[3] = &unk_1E5C5F1F8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __38__PSSearchModel__reloadSearchEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 childEntries];
  if ([v4 count])
  {
    objc_super v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)[v4 copy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__PSSearchModel__reloadSearchEntries___block_invoke_2;
    v7[3] = &unk_1E5C5D680;
    id v8 = v4;
    [v5 _removeSearchEntries:v6 usingBlock:v7 forReload:1];
  }
  [*(id *)(a1 + 32) _loadChildrenForEntry:v3];
}

uint64_t __38__PSSearchModel__reloadSearchEntries___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

- (void)_performDeferredUpdatesForEntry:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_deferredSpecifierUpdates, "count"));
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  deferredSpecifierUpdates = self->_deferredSpecifierUpdates;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke;
  v25[3] = &unk_1E5C5F220;
  id v7 = v4;
  id v26 = v7;
  id v8 = v5;
  id v27 = v8;
  objc_super v28 = &v29;
  [(NSMutableArray *)deferredSpecifierUpdates enumerateObjectsUsingBlock:v25];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_2;
  v22[3] = &unk_1E5C5F248;
  id v10 = v7;
  id v23 = v10;
  id v11 = v9;
  id v24 = v11;
  v12 = (void *)MEMORY[0x1AD0BE2A0](v22);
  if (v30[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [MEMORY[0x1E4F28D60] indexSetWithIndexesInRange:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_3;
    v20[3] = &unk_1E5C5F270;
    id v21 = v12;
    [v8 enumerateObjectsAtIndexes:v13 options:0 usingBlock:v20];
    [v8 removeObjectsAtIndexes:v13];
  }
  uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_4;
  v17[3] = &unk_1E5C5F298;
  v17[4] = self;
  id v15 = v14;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [v8 enumerateObjectsUsingBlock:v17];
  if ([v11 count]) {
    [(NSMutableArray *)self->_deferredSpecifierUpdates removeObjectsInArray:v11];
  }

  _Block_object_dispose(&v29, 8);
}

void __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 searchEntries];
  int v4 = [v3 containsObject:*(void *)(a1 + 32)];

  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v5];
    if ([v5 invalidatedSpecifiers]) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) count] - 1;
    }
  }
}

void __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 searchEntries];
  [v3 removeObject:*(void *)(a1 + 32)];

  int v4 = [v6 searchEntries];
  uint64_t v5 = [v4 count];

  if (!v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__PSSearchModel__performDeferredUpdatesForEntry___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 invalidatedSpecifiers])
  {
    [*(id *)(a1 + 32) _reloadSearchEntries:*(void *)(a1 + 40)];
    *a4 = 1;
  }
  else
  {
    id v6 = [v9 specifierUpdates];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v9 specifierUpdates];
      [v7 _performSpecifierUpdates:v8 forSearchEntries:*(void *)(a1 + 40)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)hasCompletedIndexing
{
  return self->_hasStartedIndexing && !self->_indexing;
}

- (void)_beginIndexingIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_hasStartedIndexing)
  {
    self->_hasStartedIndexing = 1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__PSSearchModel__beginIndexingIfNecessary__block_invoke;
    v12[3] = &unk_1E5C5F2C0;
    v12[4] = self;
    [(PSSearchModel *)self _enumerateDelegatesUsingBlock:v12];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = self->_rootEntries;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[PSSearchModel _loadChildrenForEntry:](self, "_loadChildrenForEntry:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

void __42__PSSearchModel__beginIndexingIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 searchModelWillBeginIndexing:*(void *)(a1 + 32)];
  }
}

- (void)_loadChildrenForEntry:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[PSSearchIndexOperation alloc] initWithSearchEntry:v4 delegate:self];
  if (v5)
  {
    self->_indexing = 1;
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    uint64_t v6 = [v4 specifier];
    uint64_t v7 = [v6 propertyForKey:@"dataSourceClass"];

    entriesBeingIndexed = self->_entriesBeingIndexed;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __39__PSSearchModel__loadChildrenForEntry___block_invoke;
    id v15 = &unk_1E5C5F2E8;
    id v9 = v7;
    id v16 = v9;
    long long v17 = &v18;
    [(NSMutableSet *)entriesBeingIndexed enumerateObjectsUsingBlock:&v12];
    if (!*((unsigned char *)v19 + 24))
    {
      -[NSMutableSet addObject:](self->_entriesBeingIndexed, "addObject:", v4, v12, v13, v14, v15);
      [(PSSearchIndexOperation *)v5 setQueuePriority:-4];
      indexOperationQueue = self->_indexOperationQueue;
      v22[0] = v5;
      long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [(NSOperationQueue *)indexOperationQueue addOperations:v11 waitUntilFinished:self->_waitUntilFinished];
    }
    _Block_object_dispose(&v18, 8);
  }
}

void __39__PSSearchModel__loadChildrenForEntry___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 specifier];
  uint64_t v6 = [v5 propertyForKey:@"dataSourceClass"];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_updatedEntry:(id)a3 withChildren:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableSet *)self->_removedEntriesStillIndexing containsObject:v6])
  {
    [(NSMutableSet *)self->_removedEntriesStillIndexing removeObject:v6];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          -[PSSearchModel _loadChildrenForEntry:](self, "_loadChildrenForEntry:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)_finishedIndexingEntry:(id)a3
{
  entriesBeingIndexed = self->_entriesBeingIndexed;
  id v5 = a3;
  [(NSMutableSet *)entriesBeingIndexed removeObject:v5];
  [(NSMutableSet *)self->_indexingEntriesWithLoadedDataSources removeObject:v5];
  [(PSSearchModel *)self _performDeferredUpdatesForEntry:v5];

  if (![(NSMutableSet *)self->_entriesBeingIndexed count])
  {
    self->_indexing = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__PSSearchModel__finishedIndexingEntry___block_invoke;
    v6[3] = &unk_1E5C5F2C0;
    v6[4] = self;
    [(PSSearchModel *)self _enumerateDelegatesUsingBlock:v6];
  }
}

void __40__PSSearchModel__finishedIndexingEntry___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 searchModelDidFinishIndexing:*(void *)(a1 + 32)];
  }
}

- (void)searchIndexOperation:(id)a3 didFindSpecifierDataSource:(id)a4
{
  id v6 = a4;
  id v7 = [a3 searchEntry];
  [(NSMutableSet *)self->_indexingEntriesWithLoadedDataSources addObject:v7];
  [(PSSearchModel *)self _addSpecifierDataSource:v6 forSearchEntry:v7];
}

- (void)searchIndexOperationDidFinish:(id)a3 searchEntries:(id)a4
{
  id v6 = a4;
  id v7 = [a3 searchEntry];
  if ([v6 count])
  {
    id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __61__PSSearchModel_searchIndexOperationDidFinish_searchEntries___block_invoke;
    long long v13 = &unk_1E5C5DDD0;
    id v14 = v7;
    id v15 = v8;
    id v9 = v8;
    [(PSSearchModel *)self _addSearchEntries:v9 parent:v14 usingBlock:&v10];
  }
  -[PSSearchModel _finishedIndexingEntry:](self, "_finishedIndexingEntry:", v7, v10, v11, v12, v13);
}

void __61__PSSearchModel_searchIndexOperationDidFinish_searchEntries___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) childEntries];
  [v2 unionSet:*(void *)(a1 + 40)];
}

- (void)searchIndexOperationDidCancel:(id)a3
{
  id v4 = [a3 searchEntry];
  [(PSSearchModel *)self _finishedIndexingEntry:v4];
}

- (BOOL)isLoadingResults
{
  return [(NSOperationQueue *)self->_searchOperationQueue operationCount] != 0;
}

- (PSSearchResults)currentResults
{
  id v3 = [(PSSearchModel *)self activeSearchOperation];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 currentResults];
    if (([v4 isNewQuery] & 1) != 0
      || ([(PSSearchModel *)self currentQuery],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 isEqualToString:self->_queryForCurrentResults],
          v6,
          (v7 & 1) == 0))
    {
      id v8 = v5;
    }
    else
    {
      id v8 = [v5 resultsByMergingWithResults:self->_currentResults];
      [v8 sortResults];
    }
  }
  else
  {
    id v8 = (id)[(PSSearchResults *)self->_currentResults copy];
  }

  return (PSSearchResults *)v8;
}

- (void)searchForQuery:(id)a3
{
  id v7 = a3;
  [(PSSearchModel *)self preheat];
  id v4 = [(PSSearchModel *)self currentQuery];
  char v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    [(PSSearchModel *)self setCurrentQuery:v7];
    id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_rootEntries];
    [(PSSearchModel *)self _beginSearchingEntriesForCurrentQuery:v6 newSearch:1];
  }
}

- (id)_defaultSearchResultsSectionComparator
{
  id v2 = [MEMORY[0x1E4F1C978] arrayWithArray:self->_rootEntries];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PSSearchModel__defaultSearchResultsSectionComparator__block_invoke;
  v6[3] = &unk_1E5C5F310;
  id v7 = v2;
  id v3 = v2;
  id v4 = (void *)[v6 copy];

  return v4;
}

uint64_t __55__PSSearchModel__defaultSearchResultsSectionComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 rootEntry];
  id v8 = [v6 rootEntry];
  unint64_t v9 = [*(id *)(a1 + 32) indexOfObject:v7];
  unint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = 1;
    }
  }
  else
  {
    if (v9 == v10)
    {
LABEL_14:
      id v14 = [v5 name];
      id v15 = [v6 name];
      uint64_t v13 = [v14 localizedCaseInsensitiveCompare:v15];

      goto LABEL_15;
    }
    if (v9 > v10) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = -1;
    }
  }
LABEL_15:

  return v13;
}

- (void)_cancelAllSearchOperations
{
  [(NSOperationQueue *)self->_searchOperationQueue cancelAllOperations];
  [(PSSearchModel *)self setActiveSearchOperation:0];
  searchStateAccessQueue = self->_searchStateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PSSearchModel__cancelAllSearchOperations__block_invoke;
  block[3] = &unk_1E5C5D680;
  block[4] = self;
  dispatch_async(searchStateAccessQueue, block);
}

uint64_t __43__PSSearchModel__cancelAllSearchOperations__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  return [v2 removeAllObjects];
}

- (void)_beginSearchingEntriesForCurrentQuery:(id)a3 newSearch:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4) {
    [(PSSearchModel *)self _cancelAllSearchOperations];
  }
  id v7 = [(PSSearchModel *)self currentQuery];
  if ([v7 length])
  {
    id v8 = [[PSSearchOperation alloc] initWithSearchQuery:v7 rootEntries:v6];
    [(PSSearchOperation *)v8 setDelegate:self];
    [(PSSearchOperation *)v8 setNewQuery:v4];
    searchOperationQueue = self->_searchOperationQueue;
    v11[0] = v8;
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [(NSOperationQueue *)searchOperationQueue addOperations:v10 waitUntilFinished:self->_waitUntilFinished];
  }
  else
  {
    [(PSSearchModel *)self _updateWithNewSearchResults:0 forQuery:v7 newSearch:1];
  }
}

- (void)_updateWithNewSearchResults:(id)a3 forQuery:(id)a4 newSearch:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v5)
  {
    uint64_t v12 = (NSString *)[v10 copy];
    queryForCurrentResults = self->_queryForCurrentResults;
    self->_queryForCurrentResults = v12;

    objc_storeStrong((id *)&self->_currentResults, a3);
  }
  else
  {
    [(PSSearchResults *)self->_currentResults mergeWithResults:v9];
    [(PSSearchResults *)self->_currentResults sortResults];
  }
  id v14 = [(PSSearchModel *)self currentResults];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PSSearchModel__updateWithNewSearchResults_forQuery_newSearch___block_invoke;
  v17[3] = &unk_1E5C5F1D0;
  v17[4] = self;
  id v18 = v14;
  id v19 = v11;
  id v15 = v11;
  id v16 = v14;
  [(PSSearchModel *)self _enumerateDelegatesUsingBlock:v17];
}

uint64_t __64__PSSearchModel__updateWithNewSearchResults_forQuery_newSearch___block_invoke(void *a1, void *a2)
{
  return [a2 searchModel:a1[4] updatedWithNewResults:a1[5] forQuery:a1[6]];
}

- (void)searchOperationDidBegin:(id)a3
{
  id v4 = a3;
  [(PSSearchModel *)self setActiveSearchOperation:v4];
  searchStateAccessQueue = self->_searchStateAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__PSSearchModel_searchOperationDidBegin___block_invoke;
  v7[3] = &unk_1E5C5DDD0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(searchStateAccessQueue, v7);
}

void __41__PSSearchModel_searchOperationDidBegin___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 80);
  id v2 = [*(id *)(a1 + 40) rootEntries];
  [v1 minusSet:v2];
}

- (void)searchOperation:(id)a3 configureSearchResults:(id)a4
{
  id v6 = a4;
  searchStateAccessQueue = self->_searchStateAccessQueue;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke;
  id v14 = &unk_1E5C5DDD0;
  id v8 = v6;
  id v15 = v8;
  id v16 = self;
  id v9 = a3;
  dispatch_sync(searchStateAccessQueue, &v11);
  LODWORD(searchStateAccessQueue) = objc_msgSend(v9, "isNewQuery", v11, v12, v13, v14);

  if (searchStateAccessQueue)
  {
    id v10 = [(PSSearchModel *)self _defaultSearchResultsSectionComparator];
    [v8 setSectionComparator:v10];

    [v8 sortResults];
  }
}

void __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke_2;
  v6[3] = &unk_1E5C5F1A8;
  id v7 = *(id *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1AD0BE2A0](v6);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 88) objectsPassingTest:v2];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 80) objectsPassingTest:v2];
  BOOL v5 = [MEMORY[0x1E4F1CA80] setWithSet:v3];
  [v5 unionSet:v4];
  [*(id *)(*(void *)(a1 + 40) + 88) minusSet:v5];
}

uint64_t __56__PSSearchModel_searchOperation_configureSearchResults___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEntry:a2];
}

- (id)searchOperation:(id)a3 filteredEntriesForEntries:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__7;
  id v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  searchStateAccessQueue = self->_searchStateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PSSearchModel_searchOperation_filteredEntriesForEntries___block_invoke;
  block[3] = &unk_1E5C5F338;
  block[4] = self;
  id v12 = v5;
  uint64_t v13 = &v14;
  id v7 = v5;
  dispatch_sync(searchStateAccessQueue, block);
  id v8 = (void *)v15[5];
  if (!v8) {
    id v8 = v7;
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __59__PSSearchModel_searchOperation_filteredEntriesForEntries___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 80) count] || objc_msgSend(*(id *)(a1[4] + 88), "count"))
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:a1[5]];
    [v2 minusSet:*(void *)(a1[4] + 80)];
    [v2 minusSet:*(void *)(a1[4] + 88)];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (void)searchOperationDidFinish:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSSearchModel *)self activeSearchOperation];

  if (v8 == v6) {
    [(PSSearchModel *)self setActiveSearchOperation:0];
  }
  id v9 = [v6 query];
  -[PSSearchModel _updateWithNewSearchResults:forQuery:newSearch:](self, "_updateWithNewSearchResults:forQuery:newSearch:", v7, v9, [v6 isNewQuery]);

  if (![(NSOperationQueue *)self->_searchOperationQueue operationCount])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke;
    v12[3] = &unk_1E5C5F2C0;
    v12[4] = self;
    [(PSSearchModel *)self _enumerateDelegatesUsingBlock:v12];
    searchStateAccessQueue = self->_searchStateAccessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke_2;
    v11[3] = &unk_1E5C5D680;
    v11[4] = self;
    dispatch_async(searchStateAccessQueue, v11);
  }
}

void __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 searchModelDidFinishQuery:*(void *)(a1 + 32)];
  }
}

uint64_t __54__PSSearchModel_searchOperationDidFinish_withResults___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
}

- (void)searchOperationDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(PSSearchModel *)self activeSearchOperation];

  if (v5 == v4)
  {
    [(PSSearchModel *)self setActiveSearchOperation:0];
  }
}

- (int64_t)observerType
{
  return 2;
}

- (void)_performSpecifierUpdates:(id)a3 forSearchEntries:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 updates];
  id v10 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
  id v12 = [v8 updates];
  uint64_t v13 = objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));

  uint64_t v14 = (void *)MEMORY[0x1E4F1CA80];
  id v15 = [v8 updates];
  uint64_t v16 = objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke;
  v28[3] = &unk_1E5C5F360;
  id v17 = v10;
  id v29 = v17;
  id v18 = v16;
  id v30 = v18;
  id v19 = v13;
  id v31 = v19;
  [v8 enumerateUpdatesUsingBlock:v28];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_2;
  v23[3] = &unk_1E5C5F388;
  id v24 = v17;
  dispatch_queue_t v25 = self;
  id v26 = v19;
  id v27 = v18;
  id v20 = v18;
  id v21 = v19;
  id v22 = v17;
  [v7 enumerateObjectsUsingBlock:v23];
}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 specifier];
  uint64_t v4 = [v3 operation];

  if (v4 == 4)
  {
    id v6 = *(void **)(a1 + 48);
LABEL_7:
    id v7 = [v8 identifier];
    [v6 addObject:v7];

    goto LABEL_8;
  }
  if (v4 == 3)
  {
    id v6 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  id v5 = v8;
  if (v4 != 1) {
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) addObject:v8];
LABEL_8:
  id v5 = v8;
LABEL_9:
}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_2(void **a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] count])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = SearchEntriesFromSpecifiers(a1[4], v3, 0);
    id v6 = [v4 setWithArray:v5];

    if ([v6 count])
    {
      id v7 = a1[5];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_3;
      v23[3] = &unk_1E5C5DDD0;
      id v24 = v3;
      id v25 = v6;
      [v7 _addSearchEntries:v25 parent:v24 usingBlock:v23];
    }
  }
  if ([a1[6] count])
  {
    id v8 = [v3 childEntries];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_4;
    v21[3] = &unk_1E5C5F1A8;
    id v22 = a1[6];
    id v9 = [v8 objectsPassingTest:v21];

    if ([v9 count])
    {
      id v10 = a1[5];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_5;
      v18[3] = &unk_1E5C5DDD0;
      id v19 = v3;
      id v20 = v9;
      [v10 _removeSearchEntries:v20 usingBlock:v18];
    }
  }
  if ([a1[7] count])
  {
    uint64_t v11 = [v3 childEntries];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_6;
    uint64_t v16 = &unk_1E5C5F1A8;
    id v17 = a1[7];
    id v12 = [v11 objectsPassingTest:&v13];

    if (objc_msgSend(v12, "count", v13, v14, v15, v16)) {
      [a1[5] _reloadSearchEntries:v12];
    }
  }
}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) childEntries];
  [v2 unionSet:*(void *)(a1 + 40)];
}

uint64_t __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) childEntries];
  [v2 minusSet:*(void *)(a1 + 40)];
}

uint64_t __59__PSSearchModel__performSpecifierUpdates_forSearchEntries___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)dataSource:(id)a3 performUpdates:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(PSSearchModel *)self _searchEntriesForSpecifierDataSource:v11];
  id v8 = (void *)[v7 mutableCopy];

  if ([v8 count])
  {
    id v9 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    [v9 intersectSet:self->_indexingEntriesWithLoadedDataSources];
    [v8 minusSet:v9];
    if ([v8 count]) {
      [(PSSearchModel *)self _performSpecifierUpdates:v6 forSearchEntries:v8];
    }
    if ([v9 count])
    {
      id v10 = +[_PSDeferredUpdates deferredUpdatesWithEntries:v9 specifierUpdates:v6];
      [(NSMutableArray *)self->_deferredSpecifierUpdates addObject:v10];
    }
  }
  else
  {
    NSLog(&cfstr_ErrorCouldNotF.isa, v11);
  }
}

- (void)invalidateSpecifiersForDataSource:(id)a3
{
  id v8 = a3;
  uint64_t v4 = -[PSSearchModel _searchEntriesForSpecifierDataSource:](self, "_searchEntriesForSpecifierDataSource:");
  id v5 = (void *)[v4 mutableCopy];

  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithSet:v5];
    [v6 intersectSet:self->_indexingEntriesWithLoadedDataSources];
    [v5 minusSet:v6];
    if ([v5 count]) {
      [(PSSearchModel *)self _reloadSearchEntries:v5];
    }
    if ([v6 count])
    {
      id v7 = +[_PSDeferredUpdates deferredInvalidationUpdatesWithEntries:v6];
      [(NSMutableArray *)self->_deferredSpecifierUpdates addObject:v7];
    }
  }
  else
  {
    NSLog(&cfstr_ErrorCouldNotF.isa, v8);
  }
}

- (id)recursiveDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_rootEntries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) recursiveDescription];
        [v3 appendFormat:@"%@\n", v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x1E4F28E78] string];
  [v10 appendFormat:@"<%@ %p> entries:\n%@", objc_opt_class(), self, v3];

  return v10;
}

- (PSSearchModelDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PSSearchModelDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)currentQuery
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentQuery:(id)a3
{
}

- (BOOL)isIndexing
{
  return self->_indexing;
}

- (BOOL)waitUntilFinished
{
  return self->_waitUntilFinished;
}

- (void)setWaitUntilFinished:(BOOL)a3
{
  self->_waitUntilFinished = a3;
}

- (PSSearchOperation)activeSearchOperation
{
  return (PSSearchOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setActiveSearchOperation:(id)a3
{
}

- (BOOL)showSectionInDetailText
{
  return self->_showSectionInDetailText;
}

- (void)setShowSectionInDetailText:(BOOL)a3
{
  self->_showSectionInDetailText = a3;
}

- (NSArray)rootEntries
{
  return &self->_rootEntries->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSearchOperation, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_searchOperationQueue, 0);
  objc_storeStrong((id *)&self->_indexOperationQueue, 0);
  objc_storeStrong((id *)&self->_searchStateAccessQueue, 0);
  objc_storeStrong((id *)&self->_removedEntriesStillSearching, 0);
  objc_storeStrong((id *)&self->_entriesPendingSearch, 0);
  objc_storeStrong((id *)&self->_queryForCurrentResults, 0);
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_deferredSpecifierUpdates, 0);
  objc_storeStrong((id *)&self->_removedEntriesStillIndexing, 0);
  objc_storeStrong((id *)&self->_indexingEntriesWithLoadedDataSources, 0);
  objc_storeStrong((id *)&self->_entriesBeingIndexed, 0);
  objc_storeStrong((id *)&self->_rootEntries, 0);
  objc_storeStrong((id *)&self->_specifierDataSources, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end