@interface FrequentlyVisitedSitesController
+ (FrequentlyVisitedSitesController)sharedController;
- (BOOL)bookmarkIsFrequentlyVistedSite:(id)a3;
- (FrequentlyVisitedSitesController)initWithBookmarkCollection:(id)a3 history:(id)a4 bannedURLStore:(id)a5 tabCollection:(id)a6 profileIdentifier:(id)a7;
- (NSArray)suggestions;
- (NSString)providerSectionIdentifier;
- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate;
- (id)_canonicalizedFavoritesURLStringSet;
- (id)_createEmptyMetadataWithBookmark:(id)a3;
- (id)_frequentlyVisitedBookmarksToCachedLinkMetadata;
- (id)_frequentlyVisitedSitesURLStringSet;
- (id)frequentlyVisitedSites;
- (unint64_t)displayIndexOfFrequentlyVisitedSite:(id)a3;
- (void)_associateHistoryToFrequentlyVisitedSites;
- (void)_clearFrequentlyVisitedSitesInBookmarksDB;
- (void)_deleteFrequentlyVisistedSiteInCurrentPofile:(id)a3;
- (void)_frequentlyVisitedSitesDidLoadHistory;
- (void)_historyWasLoaded:(id)a3;
- (void)_postFrequentlyVisitedSitesDidChangeNotification;
- (void)_saveFrequentlyVisitedSites:(id)a3 completionHandler:(id)a4;
- (void)_updateCachedFrequentlyVisitesSitesIfNecessary;
- (void)_updateFrequentlyVisitedBookmarksToCachedLinkMetadata;
- (void)banFrequentlyVisitedSite:(id)a3 inMemoryBookmarkChangeTrackingAvailable:(BOOL)a4;
- (void)clearFrequentlyVisitedSites;
- (void)dealloc;
- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4;
- (void)promoteFrequentlyVisitedSite:(id)a3 toFavoriteAtIndex:(unint64_t)a4;
- (void)saveFrequentlyVisitedSitesToBookmarksDBWithCompletion:(id)a3;
- (void)setSuggestionsProviderDelegate:(id)a3;
@end

@implementation FrequentlyVisitedSitesController

- (NSString)providerSectionIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F99698];
}

- (FrequentlyVisitedSitesController)initWithBookmarkCollection:(id)a3 history:(id)a4 bannedURLStore:(id)a5 tabCollection:(id)a6 profileIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)FrequentlyVisitedSitesController;
  v15 = [(WBSFrequentlyVisitedSitesController *)&v28 initWithHistory:a4 bannedURLStore:a5 profileIdentifier:a7];
  v16 = v15;
  if (v15)
  {
    p_bookmarkCollection = (id *)&v15->_bookmarkCollection;
    objc_storeStrong((id *)&v15->_bookmarkCollection, a3);
    objc_storeStrong((id *)&v16->_tabCollection, a6);
    if ([*(id *)((char *)&v16->super.super.isa + (int)*MEMORY[0x1E4F99008]) isEqualToString:*MEMORY[0x1E4F980C8]])
    {
      v18 = [*p_bookmarkCollection frequentlyVisitedSitesList];
      v19 = v18;
      if (v18)
      {
        v20 = [v18 bookmarkArray];
        uint64_t v21 = [v20 mutableCopy];
        cachedFrequentlyVisitedBookmarks = v16->_cachedFrequentlyVisitedBookmarks;
        v16->_cachedFrequentlyVisitedBookmarks = (NSMutableArray *)v21;

        v16->_bookmarksNeedToSave = 1;
        [*p_bookmarkCollection deleteFrequentlyVisitedSitesFolder];
        [(FrequentlyVisitedSitesController *)v16 _postFrequentlyVisitedSitesDidChangeNotification];
      }
    }
    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    frequentlyVisitedBookmarksToMetadataTokens = v16->_frequentlyVisitedBookmarksToMetadataTokens;
    v16->_frequentlyVisitedBookmarksToMetadataTokens = (NSMapTable *)v23;

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v16 selector:sel__historyWasLoaded_ name:*MEMORY[0x1E4F99270] object:0];

    v26 = v16;
  }

  return v16;
}

- (NSArray)suggestions
{
  v2 = [(FrequentlyVisitedSitesController *)self frequentlyVisitedSites];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)_postFrequentlyVisitedSitesDidChangeNotification
{
  v5.receiver = self;
  v5.super_class = (Class)FrequentlyVisitedSitesController;
  [(WBSFrequentlyVisitedSitesController *)&v5 _postFrequentlyVisitedSitesDidChangeNotification];
  [(FrequentlyVisitedSitesController *)self _updateFrequentlyVisitedBookmarksToCachedLinkMetadata];
  v3 = [(FrequentlyVisitedSitesController *)self suggestionsProviderDelegate];
  v4 = [(FrequentlyVisitedSitesController *)self frequentlyVisitedSites];
  [v3 startPageSuggestionsProvider:self didUpdateSuggestions:v4];
}

- (void)_frequentlyVisitedSitesDidLoadHistory
{
  [(FrequentlyVisitedSitesController *)self _updateFrequentlyVisitedBookmarksToCachedLinkMetadata];
  id v4 = [(FrequentlyVisitedSitesController *)self suggestionsProviderDelegate];
  v3 = [(FrequentlyVisitedSitesController *)self frequentlyVisitedSites];
  [v4 startPageSuggestionsProvider:self forceReloadSuggestions:v3];
}

- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate
{
  v2 = objc_getAssociatedObject(self, &suggestionsProviderDelegateKey);
  v3 = [v2 object];

  return (WBSStartPageSuggestionsProviderDelegate *)v3;
}

- (void)_updateFrequentlyVisitedBookmarksToCachedLinkMetadata
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(FrequentlyVisitedSitesController *)self frequentlyVisitedSites];
  id v4 = (void *)[v3 copy];

  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(FrequentlyVisitedSitesController *)self _frequentlyVisitedBookmarksToCachedLinkMetadata];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (([v4 containsObject:v11] & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (id)frequentlyVisitedSites
{
  [(FrequentlyVisitedSitesController *)self _updateCachedFrequentlyVisitesSitesIfNecessary];
  cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
  return cachedFrequentlyVisitedBookmarks;
}

- (void)_updateCachedFrequentlyVisitesSitesIfNecessary
{
  if (!self->_cachedFrequentlyVisitedBookmarks)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
    self->_cachedFrequentlyVisitedBookmarks = v3;

    tabCollection = self->_tabCollection;
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F99008]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke;
    v7[3] = &unk_1E6D78008;
    v7[4] = self;
    [(WBTabCollection *)tabCollection frequentlyVisitedSitesForProfileWithIdentifier:v6 completionHandler:v7];
  }
}

- (id)_frequentlyVisitedBookmarksToCachedLinkMetadata
{
  v3 = objc_getAssociatedObject(self, &frequentlyVisitedBookmarksToCachedLinkMetadataKey);
  if (!v3)
  {
    v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    objc_setAssociatedObject(self, &frequentlyVisitedBookmarksToCachedLinkMetadataKey, v3, (void *)1);
  }
  return v3;
}

- (void)_historyWasLoaded:(id)a3
{
  [(FrequentlyVisitedSitesController *)self _associateHistoryToFrequentlyVisitedSites];
  [(FrequentlyVisitedSitesController *)self _frequentlyVisitedSitesDidLoadHistory];
}

uint64_t __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  [*(id *)(a1 + 32) _associateHistoryToFrequentlyVisitedSites];
  objc_super v5 = *(void **)(a1 + 32);
  return [v5 _postFrequentlyVisitedSitesDidChangeNotification];
}

- (void)_associateHistoryToFrequentlyVisitedSites
{
  cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__FrequentlyVisitedSitesController__associateHistoryToFrequentlyVisitedSites__block_invoke;
  v3[3] = &unk_1E6D7BD98;
  v3[4] = self;
  [(NSMutableArray *)cachedFrequentlyVisitedBookmarks enumerateObjectsUsingBlock:v3];
}

- (void)setSuggestionsProviderDelegate:(id)a3
{
  id v4 = [MEMORY[0x1E4F98008] wrapperWithObject:a3];
  objc_setAssociatedObject(self, &suggestionsProviderDelegateKey, v4, (void *)1);
}

void __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__FrequentlyVisitedSitesController__updateCachedFrequentlyVisitesSitesIfNecessary__block_invoke_2;
    v5[3] = &unk_1E6D77D90;
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = v6;
  uint64_t v9 = [(FrequentlyVisitedSitesController *)self _frequentlyVisitedBookmarksToCachedLinkMetadata];
  v10 = [v9 objectForKey:v8];
  if (v10)
  {
    v7[2](v7, v10);
  }
  else
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke;
    v20[3] = &unk_1E6D7AB78;
    objc_copyWeak(&v24, &location);
    id v11 = v8;
    id v21 = v11;
    id v22 = v9;
    long long v23 = v7;
    id v12 = (void (**)(void, void))MEMORY[0x1E4E42950](v20);
    if ([MEMORY[0x1E4F785B0] hasSharedSiteMetadataManager])
    {
      id v13 = objc_alloc(MEMORY[0x1E4F98BF0]);
      uint64_t v14 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v15 = [v11 address];
      v16 = [v14 URLWithString:v15];
      long long v17 = (void *)[v13 initWithURL:v16];

      long long v18 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
      long long v19 = [v18 registerOneTimeRequest:v17 priority:2 responseHandler:v12];

      [(NSMapTable *)self->_frequentlyVisitedBookmarksToMetadataTokens setObject:v19 forKey:v11];
    }
    else
    {
      v12[2](v12, 0);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke_2;
  block[3] = &unk_1E6D7AB50;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = a1[4];
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __102__FrequentlyVisitedSitesController_SuggestionsProvider__fetchMetadataForSuggestion_completionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    [WeakRetained[5] removeObjectForKey:*(void *)(a1 + 32)];
    id v3 = [v11 frequentlyVisitedSites];
    int v4 = [v3 containsObject:*(void *)(a1 + 32)];

    WeakRetained = v11;
    if (v4)
    {
      objc_super v5 = [MEMORY[0x1E4F98BE8] unpackMetadataFromResponse:*(void *)(a1 + 40)];
      id v6 = *(void **)(a1 + 48);
      if (v5)
      {
        [v6 setObject:v5 forKey:*(void *)(a1 + 32)];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        id v7 = [v6 objectForKey:*(void *)(a1 + 32)];

        if (v7)
        {
          uint64_t v8 = *(void *)(a1 + 56);
          id v9 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 32)];
          (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
        }
        else
        {
          id v10 = [v11 _createEmptyMetadataWithBookmark:*(void *)(a1 + 32)];
          [*(id *)(a1 + 48) setObject:v10 forKey:*(void *)(a1 + 32)];
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }

      WeakRetained = v11;
    }
  }
}

- (id)_createEmptyMetadataWithBookmark:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F30A78];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = [v4 address];
  uint64_t v8 = [v6 URLWithString:v7];
  [v5 setOriginalURL:v8];

  id v9 = [v5 originalURL];
  [v5 setURL:v9];

  id v10 = [v4 title];

  [v5 setTitle:v10];
  return v5;
}

+ (FrequentlyVisitedSitesController)sharedController
{
  uint64_t v2 = [NSClassFromString((NSString *)@"Application") sharedApplication];
  id v3 = [v2 historyController];

  id v4 = [v3 frequentlyVisitedSitesControllerForProfileIdentifier:*MEMORY[0x1E4F980C8] loadIfNeeded:1];

  return (FrequentlyVisitedSitesController *)v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if ([MEMORY[0x1E4F785B0] hasSharedSiteMetadataManager])
  {
    id v4 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    id v5 = [(NSMapTable *)self->_frequentlyVisitedBookmarksToMetadataTokens objectEnumerator];
    id v6 = [v5 allObjects];
    [v4 cancelRequestsWithTokens:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)FrequentlyVisitedSitesController;
  [(FrequentlyVisitedSitesController *)&v7 dealloc];
}

- (unint64_t)displayIndexOfFrequentlyVisitedSite:(id)a3
{
  return [(NSMutableArray *)self->_cachedFrequentlyVisitedBookmarks indexOfObject:a3];
}

- (void)clearFrequentlyVisitedSites
{
  cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
  self->_cachedFrequentlyVisitedBookmarks = 0;

  [(FrequentlyVisitedSitesController *)self _clearFrequentlyVisitedSitesInBookmarksDB];
  v4.receiver = self;
  v4.super_class = (Class)FrequentlyVisitedSitesController;
  [(WBSFrequentlyVisitedSitesController *)&v4 clearFrequentlyVisitedSites];
}

- (void)promoteFrequentlyVisitedSite:(id)a3 toFavoriteAtIndex:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4FB60E0];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [v7 title];
  id v10 = [v7 address];
  id v11 = [(WebBookmarkCollection *)self->_bookmarkCollection configuration];
  id v15 = (id)objc_msgSend(v8, "initWithTitle:address:collectionType:", v9, v10, objc_msgSend(v11, "collectionType"));

  id v12 = [v7 iconData];
  [v15 setIconData:v12];

  objc_msgSend(v15, "setFetchedIconData:", objc_msgSend(v7, "fetchedIconData"));
  [(FrequentlyVisitedSitesController *)self _deleteFrequentlyVisistedSiteInCurrentPofile:v7];
  bookmarkCollection = self->_bookmarkCollection;
  uint64_t v14 = [(WebBookmarkCollection *)bookmarkCollection favoritesFolder];
  -[WebBookmarkCollection moveBookmark:toFolderWithID:](bookmarkCollection, "moveBookmark:toFolderWithID:", v15, [v14 identifier]);

  [(WebBookmarkCollection *)self->_bookmarkCollection saveBookmark:v15];
  [(WebBookmarkCollection *)self->_bookmarkCollection reorderBookmark:v15 toIndex:a4];
  LOBYTE(a4) = [v7 isInserted];

  if ((a4 & 1) == 0) {
    [(FrequentlyVisitedSitesController *)self _postFrequentlyVisitedSitesDidChangeNotification];
  }
}

- (void)_deleteFrequentlyVisistedSiteInCurrentPofile:(id)a3
{
  [(NSMutableArray *)self->_cachedFrequentlyVisitedBookmarks removeObject:a3];
  [(WBTabCollection *)self->_tabCollection setFrequentlyVisitedSites:self->_cachedFrequentlyVisitedBookmarks forProfileWithIdentifier:*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F99008]) completionHandler:0];
  [(FrequentlyVisitedSitesController *)self _postFrequentlyVisitedSitesDidChangeNotification];
}

- (void)banFrequentlyVisitedSite:(id)a3 inMemoryBookmarkChangeTrackingAvailable:(BOOL)a4
{
  id v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F98FF8]);
  id v7 = a3;
  id v6 = [v7 address];
  [v5 addURLString:v6];

  [(FrequentlyVisitedSitesController *)self _deleteFrequentlyVisistedSiteInCurrentPofile:v7];
}

- (void)_clearFrequentlyVisitedSitesInBookmarksDB
{
}

- (id)_canonicalizedFavoritesURLStringSet
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(WebBookmarkCollection *)self->_bookmarkCollection bookmarksInFavoritesList];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "address", (void)v12);
        id v10 = objc_msgSend(v9, "safari_canonicalURLStringForFrequentlyVisitedSites");

        if ([v10 length]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_frequentlyVisitedSitesURLStringSet
{
  uint64_t v2 = [(FrequentlyVisitedSitesController *)self frequentlyVisitedSites];
  id v3 = objc_msgSend(v2, "safari_setByApplyingBlock:", &__block_literal_global_41);

  return v3;
}

uint64_t __71__FrequentlyVisitedSitesController__frequentlyVisitedSitesURLStringSet__block_invoke(uint64_t a1, void *a2)
{
  return [a2 address];
}

- (void)saveFrequentlyVisitedSitesToBookmarksDBWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = v4;
  if (self->_bookmarksNeedToSave)
  {
    tabCollection = self->_tabCollection;
    cachedFrequentlyVisitedBookmarks = self->_cachedFrequentlyVisitedBookmarks;
    uint64_t v8 = *(uint64_t *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F99008]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__FrequentlyVisitedSitesController_saveFrequentlyVisitedSitesToBookmarksDBWithCompletion___block_invoke;
    v9[3] = &unk_1E6D7BD48;
    id v10 = v4;
    [(WBTabCollection *)tabCollection setFrequentlyVisitedSites:cachedFrequentlyVisitedBookmarks forProfileWithIdentifier:v8 completionHandler:v9];
    self->_bookmarksNeedToSave = 0;
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __90__FrequentlyVisitedSitesController_saveFrequentlyVisitedSitesToBookmarksDBWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)bookmarkIsFrequentlyVistedSite:(id)a3
{
  int v4 = [a3 parentID];
  return v4 == [(WBTabCollection *)self->_tabCollection frequentlyVisitedSitesFolderIDForProfileWithIdentifier:*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F99008])];
}

- (void)_saveFrequentlyVisitedSites:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(WBTabCollection *)self->_tabCollection frequentlyVisitedSitesFolderIDForProfileWithIdentifier:*(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F99008])];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__FrequentlyVisitedSitesController__saveFrequentlyVisitedSites_completionHandler___block_invoke;
  v11[3] = &unk_1E6D7BD70;
  id v12 = v6;
  long long v13 = self;
  int v15 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __82__FrequentlyVisitedSitesController__saveFrequentlyVisitedSites_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 64), "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v36 = a1;
  id v3 = *(id *)(*(void *)(a1 + 40) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v9 = [v8 address];
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v5);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = v36;
  obuint64_t j = *(id *)(v36 + 32);
  id v11 = (void *)v35;
  uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v43;
    uint64_t v38 = *MEMORY[0x1E4FB6160];
    v40 = v2;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        id v14 = [v13 title];
        int v15 = [v13 urlString];
        v16 = [v2 objectForKeyedSubscript:v15];
        if (v16)
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
          [v13 score];
          long long v18 = objc_msgSend(v17, "numberWithFloat:");
          [v16 setLocalAttributesValue:v18 forKey:v38];

          id v19 = v16;
        }
        else
        {
          id v20 = objc_alloc(MEMORY[0x1E4FB60E0]);
          uint64_t v21 = *(unsigned int *)(v10 + 56);
          id v22 = [*(id *)(*(void *)(v10 + 40) + 48) configuration];
          uint64_t v23 = [v22 collectionType];
          id v24 = (void *)MEMORY[0x1E4F28ED0];
          [v13 score];
          v25 = objc_msgSend(v24, "numberWithFloat:");
          id v19 = (id)[v20 initWithTitle:v14 address:v15 parentID:v21 subtype:5 deviceIdentifier:0 collectionType:v23 score:v25];

          id v11 = (void *)v35;
          uint64_t v10 = v36;
        }
        v26 = *(void **)(*(void *)(v10 + 40) + (int)*MEMORY[0x1E4F99000]);
        uint64_t v27 = (void *)MEMORY[0x1E4F1CB10];
        objc_super v28 = [v19 address];
        v29 = [v27 URLWithString:v28];
        v30 = [v26 itemForURL:v29];
        [v19 setHistoryItem:v30];

        [v11 addObject:v19];
        uint64_t v2 = v40;
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v41);
  }

  uint64_t v31 = *(void *)(v10 + 40);
  v32 = *(void **)(v31 + 64);
  *(void *)(v31 + 64) = v11;
  id v33 = v11;

  *(unsigned char *)(*(void *)(v10 + 40) + 56) = 1;
  v34 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  [v34 scheduleLowPriorityRequestForBookmarks:*(void *)(*(void *)(v10 + 40) + 64)];

  (*(void (**)(void))(*(void *)(v10 + 48) + 16))();
}

void __77__FrequentlyVisitedSitesController__associateHistoryToFrequentlyVisitedSites__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F99000]);
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  id v7 = [v4 address];
  uint64_t v5 = [v3 URLWithString:v7];
  uint64_t v6 = [v2 itemForURL:v5];
  [v4 setHistoryItem:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_cachedFrequentlyVisitedBookmarks, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedBookmarksToMetadataTokens, 0);
}

@end