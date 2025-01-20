@interface VUIFamilySharingMenuDataSource
- (BOOL)_hasCompletedAllFetches;
- (BOOL)hasFetchedGenres;
- (BOOL)hasFetchedMovies;
- (BOOL)hasFetchedRecentPurchases;
- (BOOL)hasFetchedShows;
- (BOOL)hasMovies;
- (BOOL)hasRecentPurchases;
- (BOOL)hasShows;
- (NSArray)genres;
- (NSString)ownerIdentifier;
- (VUIFamilySharingMenuDataSource)initWithValidCategories:(id)a3;
- (VUIMediaAPIClient)mediaClient;
- (id)_categoryTypesSortComparator;
- (id)_constructGenreMenuItems;
- (id)_constructGenreTypes;
- (id)_constructMainMenuItems;
- (id)_constructVUIMenuDataSource;
- (id)getGenreByGenreTitle:(id)a3;
- (void)_fetchGenres;
- (void)_fetchMovies;
- (void)_fetchRecentPurchases;
- (void)_fetchShows;
- (void)_notifyDelegatesFetchDidComplete;
- (void)setGenres:(id)a3;
- (void)setHasFetchedGenres:(BOOL)a3;
- (void)setHasFetchedMovies:(BOOL)a3;
- (void)setHasFetchedRecentPurchases:(BOOL)a3;
- (void)setHasFetchedShows:(BOOL)a3;
- (void)setHasMovies:(BOOL)a3;
- (void)setHasRecentPurchases:(BOOL)a3;
- (void)setHasShows:(BOOL)a3;
- (void)setMediaClient:(id)a3;
- (void)setOwnerIdentifier:(id)a3;
- (void)startFetch;
@end

@implementation VUIFamilySharingMenuDataSource

- (VUIFamilySharingMenuDataSource)initWithValidCategories:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUIFamilySharingMenuDataSource;
  v3 = [(VUILibraryMenuDataSource *)&v7 initWithValidCategories:a3];
  if (v3)
  {
    +[VUIMediaAPIClient initializeWithAppleTVClientIdentifier];
    uint64_t v4 = +[VUIMediaAPIClient sharedInstance];
    mediaClient = v3->_mediaClient;
    v3->_mediaClient = (VUIMediaAPIClient *)v4;

    v3->_hasFetchedRecentPurchases = 0;
    v3->_hasFetchedGenres = 0;
    v3->_hasFetchedMovies = 0;
    v3->_hasFetchedShows = 0;
    v3->_hasRecentPurchases = 0;
    v3->_hasMovies = 0;
    v3->_hasShows = 0;
  }
  return v3;
}

- (void)startFetch
{
  [(VUIFamilySharingMenuDataSource *)self _fetchGenres];
  [(VUIFamilySharingMenuDataSource *)self _fetchRecentPurchases];
  [(VUIFamilySharingMenuDataSource *)self _fetchMovies];
  [(VUIFamilySharingMenuDataSource *)self _fetchShows];
}

- (id)getGenreByGenreTitle:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(VUIFamilySharingMenuDataSource *)self genres];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 genreTitle];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_fetchGenres
{
  v3 = [(VUIFamilySharingMenuDataSource *)self ownerIdentifier];
  id v4 = +[VUIMediaAPIRequestFactory genresRequestWithOwnerIdentifier:v3];

  objc_initWeak(&location, self);
  v5 = [(VUIFamilySharingMenuDataSource *)self mediaClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VUIFamilySharingMenuDataSource__fetchGenres__block_invoke;
  v6[3] = &unk_1E6DF4FD0;
  objc_copyWeak(&v7, &location);
  [v5 fetchContentForUrl:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__VUIFamilySharingMenuDataSource__fetchGenres__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasFetchedGenres:1];
  if (!a3)
  {
    id v6 = objc_alloc_init(VUIGenresRequestResponseParser);
    id v7 = [(VUIGenresRequestResponseParser *)v6 parseAMSURLResult:v9];
    [WeakRetained setGenres:v7];
  }
  if ([WeakRetained _hasCompletedAllFetches])
  {
    v8 = [WeakRetained _constructVUIMenuDataSource];
    [WeakRetained setMenuItems:v8];
    [WeakRetained _notifyDelegatesFetchDidComplete];
  }
}

- (void)_fetchRecentPurchases
{
  v3 = [(VUIFamilySharingMenuDataSource *)self ownerIdentifier];
  id v4 = +[VUIMediaAPIRequestFactory recentPurchasesRequestWithOwnerIdentifier:v3];

  objc_initWeak(&location, self);
  v5 = [(VUIFamilySharingMenuDataSource *)self mediaClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__VUIFamilySharingMenuDataSource__fetchRecentPurchases__block_invoke;
  v6[3] = &unk_1E6DF4FD0;
  objc_copyWeak(&v7, &location);
  [v5 fetchContentForUrl:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__VUIFamilySharingMenuDataSource__fetchRecentPurchases__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasFetchedRecentPurchases:1];
  if (!a3)
  {
    id v6 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    id v7 = [(VUIFamilySharingEntityRequestResponseParser *)v6 parseAMSURLResult:v9];
    objc_msgSend(WeakRetained, "setHasRecentPurchases:", objc_msgSend(v7, "count") != 0);
  }
  if ([WeakRetained _hasCompletedAllFetches])
  {
    v8 = [WeakRetained _constructVUIMenuDataSource];
    [WeakRetained setMenuItems:v8];
    [WeakRetained _notifyDelegatesFetchDidComplete];
  }
}

- (void)_fetchMovies
{
  v3 = [(VUIFamilySharingMenuDataSource *)self ownerIdentifier];
  id v4 = +[VUIMediaAPIRequestFactory moviesPurchasesRequestWithOwnerIdentifier:v3 sortType:0];

  objc_initWeak(&location, self);
  v5 = [(VUIFamilySharingMenuDataSource *)self mediaClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__VUIFamilySharingMenuDataSource__fetchMovies__block_invoke;
  v6[3] = &unk_1E6DF4FD0;
  objc_copyWeak(&v7, &location);
  [v5 fetchContentForUrl:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__VUIFamilySharingMenuDataSource__fetchMovies__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasFetchedMovies:1];
  if (!a3)
  {
    id v6 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    id v7 = [(VUIFamilySharingEntityRequestResponseParser *)v6 parseAMSURLResult:v9];
    objc_msgSend(WeakRetained, "setHasMovies:", objc_msgSend(v7, "count") != 0);
  }
  if ([WeakRetained _hasCompletedAllFetches])
  {
    v8 = [WeakRetained _constructVUIMenuDataSource];
    [WeakRetained setMenuItems:v8];
    [WeakRetained _notifyDelegatesFetchDidComplete];
  }
}

- (void)_fetchShows
{
  v3 = [(VUIFamilySharingMenuDataSource *)self ownerIdentifier];
  id v4 = +[VUIMediaAPIRequestFactory showsPurchasesRequestWithOwnerIdentifier:v3 sortType:0];

  objc_initWeak(&location, self);
  v5 = [(VUIFamilySharingMenuDataSource *)self mediaClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__VUIFamilySharingMenuDataSource__fetchShows__block_invoke;
  v6[3] = &unk_1E6DF4FD0;
  objc_copyWeak(&v7, &location);
  [v5 fetchContentForUrl:v4 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__VUIFamilySharingMenuDataSource__fetchShows__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasFetchedShows:1];
  if (!a3)
  {
    id v6 = objc_alloc_init(VUIFamilySharingEntityRequestResponseParser);
    id v7 = [(VUIFamilySharingEntityRequestResponseParser *)v6 parseAMSURLResult:v9];
    objc_msgSend(WeakRetained, "setHasShows:", objc_msgSend(v7, "count") != 0);
  }
  if ([WeakRetained _hasCompletedAllFetches])
  {
    v8 = [WeakRetained _constructVUIMenuDataSource];
    [WeakRetained setMenuItems:v8];
    [WeakRetained _notifyDelegatesFetchDidComplete];
  }
}

- (BOOL)_hasCompletedAllFetches
{
  return self->_hasFetchedRecentPurchases
      && self->_hasFetchedMovies
      && self->_hasFetchedShows
      && self->_hasFetchedGenres;
}

- (id)_constructVUIMenuDataSource
{
  v3 = [(VUIFamilySharingMenuDataSource *)self _constructMainMenuItems];
  id v4 = [(VUIFamilySharingMenuDataSource *)self _constructGenreMenuItems];
  v5 = [[VUIMenuDataSource alloc] initWithMainMenuItems:v3 genreMenuItems:v4];
  id v6 = [(VUIFamilySharingMenuDataSource *)self _constructGenreTypes];
  [(VUIMenuDataSource *)v5 setGenreTypes:v6];

  return v5;
}

- (id)_constructMainMenuItems
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(VUIFamilySharingMenuDataSource *)self hasRecentPurchases]) {
    [v3 addObject:&unk_1F3F3C668];
  }
  if ([(VUIFamilySharingMenuDataSource *)self hasMovies]) {
    [v3 addObject:&unk_1F3F3C680];
  }
  if ([(VUIFamilySharingMenuDataSource *)self hasShows]) {
    [v3 addObject:&unk_1F3F3C698];
  }
  id v4 = [(VUIFamilySharingMenuDataSource *)self _categoryTypesSortComparator];
  [v3 sortUsingComparator:v4];

  v5 = (void *)[v3 copy];
  return v5;
}

- (id)_constructGenreMenuItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VUIFamilySharingMenuDataSource *)self genres];
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
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) genreTitle];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (id)_constructGenreTypes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(VUIFamilySharingMenuDataSource *)self genres];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) genreIdentifiers];
        v10 = [v9 firstObject];

        if (v10) {
          uint64_t v11 = VUILibraryGenreFromGenreID([v10 integerValue]);
        }
        else {
          uint64_t v11 = 0;
        }
        long long v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v11];
        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = (void *)[v3 copy];
  return v13;
}

- (id)_categoryTypesSortComparator
{
  return &__block_literal_global_14;
}

uint64_t __62__VUIFamilySharingMenuDataSource__categoryTypesSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_notifyDelegatesFetchDidComplete
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  uint64_t v5 = __66__VUIFamilySharingMenuDataSource__notifyDelegatesFetchDidComplete__block_invoke;
  uint64_t v6 = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  v2 = &v3;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v3, v4)) {
    v5((uint64_t)v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__VUIFamilySharingMenuDataSource__notifyDelegatesFetchDidComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
}

- (NSArray)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
}

- (BOOL)hasFetchedGenres
{
  return self->_hasFetchedGenres;
}

- (void)setHasFetchedGenres:(BOOL)a3
{
  self->_hasFetchedGenres = a3;
}

- (BOOL)hasFetchedRecentPurchases
{
  return self->_hasFetchedRecentPurchases;
}

- (void)setHasFetchedRecentPurchases:(BOOL)a3
{
  self->_hasFetchedRecentPurchases = a3;
}

- (BOOL)hasFetchedMovies
{
  return self->_hasFetchedMovies;
}

- (void)setHasFetchedMovies:(BOOL)a3
{
  self->_hasFetchedMovies = a3;
}

- (BOOL)hasFetchedShows
{
  return self->_hasFetchedShows;
}

- (void)setHasFetchedShows:(BOOL)a3
{
  self->_hasFetchedShows = a3;
}

- (BOOL)hasRecentPurchases
{
  return self->_hasRecentPurchases;
}

- (void)setHasRecentPurchases:(BOOL)a3
{
  self->_hasRecentPurchases = a3;
}

- (BOOL)hasMovies
{
  return self->_hasMovies;
}

- (void)setHasMovies:(BOOL)a3
{
  self->_hasMovies = a3;
}

- (BOOL)hasShows
{
  return self->_hasShows;
}

- (void)setHasShows:(BOOL)a3
{
  self->_hasShows = a3;
}

- (VUIMediaAPIClient)mediaClient
{
  return self->_mediaClient;
}

- (void)setMediaClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaClient, 0);
  objc_storeStrong((id *)&self->_genres, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

@end