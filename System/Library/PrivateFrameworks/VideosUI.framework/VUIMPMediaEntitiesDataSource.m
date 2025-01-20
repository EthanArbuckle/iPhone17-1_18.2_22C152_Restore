@interface VUIMPMediaEntitiesDataSource
- (BOOL)shouldPauseAutoFetchingArtworkInfoDictionaries;
- (NSArray)mediaEntitiesToFetch;
- (NSOrderedSet)mediaEntitiesSet;
- (VUIMPMediaEntitiesDataSource)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4;
- (VUIMediaEntitiesFetchController)fetchController;
- (VUIMediaLibrary)mediaLibrary;
- (_NSRange)requestedRange;
- (id)_getPurchaseHistoryIdsFromMediaEntities:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)inFlightArtworkRequests;
- (void)_fetchArtworkInfoIfNecessary;
- (void)_loadImageUrlsByPurchaseHistoryIds:(id)a3;
- (void)_notifyDelegateFetchDidComplete;
- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5;
- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5;
- (void)dealloc;
- (void)setFetchController:(id)a3;
- (void)setInFlightArtworkRequests:(unint64_t)a3;
- (void)setMediaEntitiesSet:(id)a3;
- (void)setMediaEntitiesToFetch:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setRequestedRange:(_NSRange)a3;
- (void)setShouldPauseAutoFetchingArtworkInfoDictionaries:(BOOL)a3;
- (void)startFetch;
@end

@implementation VUIMPMediaEntitiesDataSource

- (VUIMPMediaEntitiesDataSource)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIMPMediaEntitiesDataSource;
  v8 = [(VUIMediaEntitiesDataSource *)&v11 initWithFetchRequest:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaLibrary, a3);
    v9->_requestedRange = (_NSRange)xmmword_1E38FD930;
    v9->_inFlightArtworkRequests = 0;
  }

  return v9;
}

- (void)startFetch
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = [VUIMediaEntitiesFetchController alloc];
  v4 = [(VUIMPMediaEntitiesDataSource *)self mediaLibrary];
  v5 = [(VUIMediaEntitiesDataSource *)self fetchRequest];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v7 = [(VUIMediaEntitiesFetchController *)v3 initWithMediaLibrary:v4 fetchRequests:v6];
  [(VUIMPMediaEntitiesDataSource *)self setFetchController:v7];

  v8 = [(VUIMPMediaEntitiesDataSource *)self fetchController];
  [v8 setDelegate:self];

  [(VUILibraryDataSource *)self setHasCompletedInitialFetch:0];
  v9 = [(VUIMPMediaEntitiesDataSource *)self mediaLibrary];
  v10 = +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:v9];
  objc_super v11 = [(VUIMPMediaEntitiesDataSource *)self fetchController];
  [v10 addFetchController:v11];
}

- (void)setShouldPauseAutoFetchingArtworkInfoDictionaries:(BOOL)a3
{
  BOOL shouldPauseAutoFetchingArtworkInfoDictionaries = self->_shouldPauseAutoFetchingArtworkInfoDictionaries;
  self->_BOOL shouldPauseAutoFetchingArtworkInfoDictionaries = a3;
  if (shouldPauseAutoFetchingArtworkInfoDictionaries && !a3 && !self->_inFlightArtworkRequests) {
    [(VUIMPMediaEntitiesDataSource *)self _fetchArtworkInfoIfNecessary];
  }
}

- (void)dealloc
{
  v3 = [(VUIMPMediaEntitiesDataSource *)self fetchController];

  if (v3)
  {
    v4 = [(VUIMPMediaEntitiesDataSource *)self mediaLibrary];
    v5 = +[VUIMediaLibraryFetchControllerQueue defaultQueueWithMediaLibrary:v4];
    v6 = [(VUIMPMediaEntitiesDataSource *)self fetchController];
    [v5 removeFetchController:v6];

    id v7 = [(VUIMPMediaEntitiesDataSource *)self fetchController];
    [v7 setDelegate:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)VUIMPMediaEntitiesDataSource;
  [(VUIMPMediaEntitiesDataSource *)&v8 dealloc];
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didCompleteWithResult:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = self;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "[VUIMPMediaEntitiesDataSource %p] - Fetch completed successfully", buf, 0xCu);
  }

  objc_super v8 = [v6 fetchResponses];

  if (v8)
  {
    v9 = [v8 firstObject];
    v10 = [v9 mediaEntities];

    objc_super v11 = [v8 firstObject];
    v12 = [v11 grouping];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke;
  v20[3] = &unk_1E6DF5308;
  id v14 = v13;
  id v21 = v14;
  [v10 enumerateObjectsUsingBlock:v20];
  v15 = [v14 array];
  if ([(VUIMediaEntitiesDataSource *)self shouldAutoFetchArtworkInfoDictionaries])
  {
    v16 = [(VUIMPMediaEntitiesDataSource *)self mediaEntitiesSet];

    if (v16)
    {
      v17 = (void *)[v14 mutableCopy];
      v18 = [(VUIMPMediaEntitiesDataSource *)self mediaEntitiesSet];
      [v17 minusOrderedSet:v18];

      id v19 = [v17 array];
    }
    else
    {
      id v19 = v15;
    }
  }
  else
  {
    id v19 = 0;
  }
  [(VUIMPMediaEntitiesDataSource *)self setMediaEntitiesSet:v14];
  [(VUIMediaEntitiesDataSource *)self setMediaEntities:v15];
  [(VUIMPMediaEntitiesDataSource *)self setMediaEntitiesToFetch:v19];
  -[VUIMPMediaEntitiesDataSource setRequestedRange:](self, "setRequestedRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(VUIMediaEntitiesDataSource *)self setGrouping:v12];
  [(VUIMPMediaEntitiesDataSource *)self _fetchArtworkInfoIfNecessary];
  [(VUILibraryDataSource *)self setHasCompletedInitialFetch:1];
  [(VUIMPMediaEntitiesDataSource *)self _notifyDelegateFetchDidComplete];
}

void __79__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didCompleteWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_notifyDelegateFetchDidComplete
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  v5 = __63__VUIMPMediaEntitiesDataSource__notifyDelegateFetchDidComplete__block_invoke;
  id v6 = &unk_1E6DF4A30;
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

void __63__VUIMPMediaEntitiesDataSource__notifyDelegateFetchDidComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (void)controller:(id)a3 fetchRequests:(id)a4 didFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
  [(VUIMediaEntitiesDataSource *)self setMediaEntities:MEMORY[0x1E4F1CBF0]];
  [(VUIMediaEntitiesDataSource *)self setGrouping:v11];
  [(VUILibraryDataSource *)self setHasCompletedInitialFetch:1];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __74__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didFailWithError___block_invoke;
  v16 = &unk_1E6DF4A30;
  objc_copyWeak(&v17, &location);
  v12 = &v13;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v13, v14)) {
    v15((uint64_t)v12);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __74__VUIMPMediaEntitiesDataSource_controller_fetchRequests_didFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 dataSourceDidFinishFetching:WeakRetained];
  }
}

- (void)_fetchArtworkInfoIfNecessary
{
  if (!self->_shouldPauseAutoFetchingArtworkInfoDictionaries && [(NSArray *)self->_mediaEntitiesToFetch count])
  {
    NSUInteger location = self->_requestedRange.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v4 = 0;
    }
    else {
      NSUInteger v4 = location + self->_requestedRange.length + 1;
    }
    v5 = -[VUIMPMediaEntitiesDataSource _getPurchaseHistoryIdsFromMediaEntities:inRange:](self, "_getPurchaseHistoryIdsFromMediaEntities:inRange:", self->_mediaEntitiesToFetch, v4, 74);
    id v6 = v5;
    if (v5)
    {
      id v8 = v5;
      uint64_t v7 = [v5 count];
      id v6 = v8;
      if (v7)
      {
        self->_requestedRange.NSUInteger location = v4;
        self->_requestedRange.length = 74;
        [(VUIMPMediaEntitiesDataSource *)self _loadImageUrlsByPurchaseHistoryIds:v8];
        id v6 = v8;
      }
    }
  }
}

- (void)_loadImageUrlsByPurchaseHistoryIds:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  [(VUIMPMediaEntitiesDataSource *)self setInFlightArtworkRequests:[(VUIMPMediaEntitiesDataSource *)self inFlightArtworkRequests] + 1];
  v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(VUIMPMediaEntitiesDataSource *)self inFlightArtworkRequests];
    *(_DWORD *)buf = 134218240;
    v12 = self;
    __int16 v13 = 2048;
    unint64_t v14 = v6;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "[VUIMPMediaEntitiesDataSource %p] - Begining to fetch artwork by purchase history ids number of request %ld", buf, 0x16u);
  }

  uint64_t v7 = +[VUICloudClient sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke;
  v8[3] = &unk_1E6DF5358;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  [v7 loadArtworkURLsForPurchaseHistoryIDs:v4 completionHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unint64_t v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "[VUIMPMediaEntitiesDataSource %p] - Fetched artwork by purchase history ids", buf, 0xCu);
  }

  id v8 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v11 = [WeakRetained artworkInfoDictionaryByPurchaseID];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      [v10 setArtworkInfoDictionaryByPurchaseID:v5];
    }
    else
    {
      __int16 v13 = [v10 artworkInfoDictionaryByPurchaseID];
      unint64_t v14 = (void *)[v13 mutableCopy];

      [v14 addEntriesFromDictionary:v5];
      [v10 setArtworkInfoDictionaryByPurchaseID:v14];
    }
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke_10;
    id v19 = &unk_1E6DF5330;
    objc_copyWeak(&v20, v8);
    char v21 = a3;
    uint64_t v15 = &v16;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v16, v17)) {
      v18((uint64_t)v15);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }

    [v10 setHasCompletedInitialFetch:1];
    objc_destroyWeak(&v20);
  }
}

void __67__VUIMPMediaEntitiesDataSource__loadImageUrlsByPurchaseHistoryIds___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 dataSourceDidFinishFetchingArtwork:WeakRetained];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "setInFlightArtworkRequests:", objc_msgSend(WeakRetained, "inFlightArtworkRequests") - 1);
    if (([WeakRetained shouldPauseAutoFetchingArtworkInfoDictionaries] & 1) == 0
      && ![WeakRetained inFlightArtworkRequests])
    {
      [WeakRetained _fetchArtworkInfoIfNecessary];
    }
  }
}

- (id)_getPurchaseHistoryIdsFromMediaEntities:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v8 = location + length;
  if (location + length > [v6 count] - 1) {
    unint64_t v8 = [v6 count] - 1;
  }
  while (location <= v8)
  {
    id v9 = [v6 objectAtIndex:location];
    id v10 = [v9 purchaseHistoryID];
    if (v10) {
      [v7 addObject:v10];
    }

    ++location;
  }
  uint64_t v11 = (void *)[v7 copy];

  return v11;
}

- (BOOL)shouldPauseAutoFetchingArtworkInfoDictionaries
{
  return self->_shouldPauseAutoFetchingArtworkInfoDictionaries;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (VUIMediaEntitiesFetchController)fetchController
{
  return self->_fetchController;
}

- (void)setFetchController:(id)a3
{
}

- (NSOrderedSet)mediaEntitiesSet
{
  return self->_mediaEntitiesSet;
}

- (void)setMediaEntitiesSet:(id)a3
{
}

- (NSArray)mediaEntitiesToFetch
{
  return self->_mediaEntitiesToFetch;
}

- (void)setMediaEntitiesToFetch:(id)a3
{
}

- (_NSRange)requestedRange
{
  p_requestedRange = &self->_requestedRange;
  NSUInteger location = self->_requestedRange.location;
  NSUInteger length = p_requestedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRequestedRange:(_NSRange)a3
{
  self->_requestedRange = a3;
}

- (unint64_t)inFlightArtworkRequests
{
  return self->_inFlightArtworkRequests;
}

- (void)setInFlightArtworkRequests:(unint64_t)a3
{
  self->_inFlightArtworkRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntitiesToFetch, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesSet, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end