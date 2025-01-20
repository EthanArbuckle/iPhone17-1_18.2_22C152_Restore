@interface VUIDownloadDataSource
- (BOOL)_doesEpisodeSet:(id)a3 containMediaEntity:(id)a4;
- (BOOL)_downloadsDidChange:(id)a3;
- (BOOL)hasFetchedAllDownloadEntities;
- (BOOL)hasFetchedAllDownloadedEntities;
- (BOOL)performingRentalExpirationFetch;
- (NSArray)activelyDownloadingAdamIds;
- (NSArray)activelyDownloadingMediaItems;
- (NSArray)downloadEntities;
- (NSArray)localMediaItems;
- (NSMutableDictionary)episodesDownloadingForShow;
- (NSMutableDictionary)groupingByShowIdentifier;
- (NSTimer)libraryContentsChangeDebounceTimer;
- (SSDownloadManager)sDownloadManager;
- (VUIDownloadDataSource)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4;
- (VUIDownloadDataSourceDelegate)downloadDelegate;
- (VUIMediaLibrary)mediaLibrary;
- (id)_coalesceActiveDownloadEntitiesAndDownloadedEntities;
- (id)_createDownloadEntitiesFromLatestDownloads:(id)a3;
- (id)_createGroupingByShowIdentifierWithLatestMediaEntityGroups:(id)a3;
- (id)_deDupedMediaEntities:(id)a3;
- (id)_getDownloadEntityInDownloadEntities:(id)a3 containingMediaEntity:(id)a4;
- (id)_mediaEntitiesForAdamIDs:(id)a3;
- (id)_sortDownloadEntities:(id)a3;
- (id)_upsertDownloadEntities:(id)a3 withEpisodesDownloadingForShow:(id)a4;
- (void)_downloadedMediaEntitiesDidUpdate:(id)a3 grouping:(id)a4;
- (void)_downloadingMediaEntitiesDidUpdate:(id)a3;
- (void)_getActivelyDownloadingAdamIDsWithCompletion:(id)a3;
- (void)_handleDownloadingStateDidChange;
- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3;
- (void)_loadActiveDownloads;
- (void)_loadDownloadedEntities;
- (void)_notifyDelegatesDownloadsFetchCompletedWithChanges:(BOOL)a3;
- (void)_rentalsDidExpire:(id)a3;
- (void)_upsertEpisodesDownloadingForShowWithMediaEntity:(id)a3;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)downloadManagerDownloadsDidChange:(id)a3;
- (void)loadDownloadData;
- (void)setActivelyDownloadingAdamIds:(id)a3;
- (void)setActivelyDownloadingMediaItems:(id)a3;
- (void)setDownloadDelegate:(id)a3;
- (void)setDownloadEntities:(id)a3;
- (void)setEpisodesDownloadingForShow:(id)a3;
- (void)setGroupingByShowIdentifier:(id)a3;
- (void)setHasFetchedAllDownloadEntities:(BOOL)a3;
- (void)setHasFetchedAllDownloadedEntities:(BOOL)a3;
- (void)setLibraryContentsChangeDebounceTimer:(id)a3;
- (void)setLocalMediaItems:(id)a3;
- (void)setPerformingRentalExpirationFetch:(BOOL)a3;
- (void)setSDownloadManager:(id)a3;
- (void)startFetch;
@end

@implementation VUIDownloadDataSource

- (VUIDownloadDataSource)initWithMediaLibrary:(id)a3 fetchRequest:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  }
  v31.receiver = self;
  v31.super_class = (Class)VUIDownloadDataSource;
  v9 = [(VUIMediaEntitiesDataSource *)&v31 initWithFetchRequest:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, a3);
    v10->_hasFetchedAllDownloadEntities = 0;
    v10->_hasFetchedAllDownloadedEntities = 0;
    uint64_t v11 = objc_opt_new();
    episodesDownloadingForShow = v10->_episodesDownloadingForShow;
    v10->_episodesDownloadingForShow = (NSMutableDictionary *)v11;

    v13 = +[VUIDownloadManager sharedInstance];
    [v13 addDelegate:v10];

    id v14 = objc_alloc_init(MEMORY[0x1E4FA8178]);
    uint64_t v15 = *MEMORY[0x1E4FA84C0];
    v33[0] = *MEMORY[0x1E4FA8490];
    v33[1] = v15;
    id v30 = v7;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    [v14 setDownloadKinds:v16];

    [v14 setShouldFilterExternalOriginatedDownloads:0];
    uint64_t v17 = *MEMORY[0x1E4FA8630];
    v32[0] = *MEMORY[0x1E4FA85F8];
    v32[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v14 setPrefetchedDownloadProperties:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x1E4FA8170]) initWithManagerOptions:v14];
    [v19 addObserver:v10];
    sDownloadManager = v10->_sDownloadManager;
    v10->_sDownloadManager = (SSDownloadManager *)v19;
    id v29 = v19;

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v10 selector:sel__rentalsDidExpire_ name:@"VUIRentalExpirationMonitorRentalDidExpireNotification" object:0];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v23 = +[VUIMediaLibraryManager defaultManager];
    v24 = [v23 deviceMediaLibrary];
    [v22 addObserver:v10 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v24];

    id v7 = v30;
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v26 = +[VUIMediaLibraryManager defaultManager];
    v27 = [v26 sidebandMediaLibrary];
    [v25 addObserver:v10 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v27];

    [(VUIDownloadDataSource *)v10 _loadDownloadedEntities];
    [(VUIDownloadDataSource *)v10 _loadActiveDownloads];
  }
  return v10;
}

- (void)startFetch
{
  [(VUIDownloadDataSource *)self _loadDownloadedEntities];
  [(VUIDownloadDataSource *)self _loadActiveDownloads];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(VUIDownloadDataSource *)self libraryContentsChangeDebounceTimer];
  [v4 invalidate];

  v5 = [(VUIDownloadDataSource *)self sDownloadManager];
  [v5 removeObserver:self];

  v6 = +[VUIDownloadManager sharedInstance];
  [v6 removeDelegate:self];

  v7.receiver = self;
  v7.super_class = (Class)VUIDownloadDataSource;
  [(VUIDownloadDataSource *)&v7 dealloc];
}

- (void)loadDownloadData
{
  v3 = +[VUIDownloadManager sharedInstance];
  [v3 addDelegate:self];

  [(VUIDownloadDataSource *)self setHasFetchedAllDownloadEntities:0];
  [(VUIDownloadDataSource *)self setHasFetchedAllDownloadedEntities:0];
  v4 = objc_opt_new();
  [(VUIDownloadDataSource *)self setEpisodesDownloadingForShow:v4];

  [(VUIDownloadDataSource *)self _loadDownloadedEntities];
  [(VUIDownloadDataSource *)self _loadActiveDownloads];
}

- (void)setDownloadEntities:(id)a3
{
  v4 = [(VUIDownloadDataSource *)self _sortDownloadEntities:a3];
  if (self->_downloadEntities != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_downloadEntities, v4);
    v4 = v5;
  }
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __65__VUIDownloadDataSource_downloadManager_downloadStatesDidChange___block_invoke;
  v12 = &unk_1E6DF4A30;
  objc_copyWeak(&v13, &location);
  id v8 = &v9;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v9, v10)) {
    v11((uint64_t)v8);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __65__VUIDownloadDataSource_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDownloadingStateDidChange];
}

- (void)downloadManagerDownloadsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __59__VUIDownloadDataSource_downloadManagerDownloadsDidChange___block_invoke;
  uint64_t v9 = &unk_1E6DF4A30;
  objc_copyWeak(&v10, &location);
  v5 = &v6;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v6, v7)) {
    v8((uint64_t)v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__VUIDownloadDataSource_downloadManagerDownloadsDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDownloadingStateDidChange];
}

- (void)_downloadingMediaEntitiesDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(VUIDownloadDataSource *)self episodesDownloadingForShow];
  [v5 removeAllObjects];

  [(VUIDownloadDataSource *)self setHasFetchedAllDownloadEntities:1];
  uint64_t v6 = [(VUIDownloadDataSource *)self _deDupedMediaEntities:v4];

  [(VUIDownloadDataSource *)self setActivelyDownloadingMediaItems:v6];
  id v8 = [(VUIDownloadDataSource *)self _coalesceActiveDownloadEntitiesAndDownloadedEntities];
  BOOL v7 = [(VUIDownloadDataSource *)self _downloadsDidChange:v8];
  [(VUIDownloadDataSource *)self setDownloadEntities:v8];
  [(VUIDownloadDataSource *)self _notifyDelegatesDownloadsFetchCompletedWithChanges:v7];
}

- (void)_downloadedMediaEntitiesDidUpdate:(id)a3 grouping:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(VUIDownloadDataSource *)self setHasFetchedAllDownloadedEntities:1];
  id v8 = [(VUIDownloadDataSource *)self _deDupedMediaEntities:v7];

  [(VUIDownloadDataSource *)self setLocalMediaItems:v8];
  uint64_t v9 = [(VUIDownloadDataSource *)self _createGroupingByShowIdentifierWithLatestMediaEntityGroups:v6];

  [(VUIDownloadDataSource *)self setGroupingByShowIdentifier:v9];
  id v11 = [(VUIDownloadDataSource *)self _coalesceActiveDownloadEntitiesAndDownloadedEntities];
  BOOL v10 = [(VUIDownloadDataSource *)self _downloadsDidChange:v11];
  [(VUIDownloadDataSource *)self setDownloadEntities:v11];
  [(VUIDownloadDataSource *)self _notifyDelegatesDownloadsFetchCompletedWithChanges:v10];
}

- (id)_sortDownloadEntities:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 punctuationCharacterSet];
  id v6 = +[VUILocalizationManager sharedInstance];
  id v7 = [v6 localizedStringForKey:@"TV.Library.Sorting.Prefix.Articles"];
  id v8 = [v7 componentsSeparatedByString:@"|"];

  uint64_t v9 = [v8 count];
  BOOL v10 = &unk_1F3F3E390;
  if (v9) {
    BOOL v10 = v8;
  }
  id v11 = (void *)MEMORY[0x1E4F1CA48];
  id v12 = v10;
  id v13 = [v11 array];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke;
  v26[3] = &unk_1E6DF9618;
  id v14 = v13;
  id v27 = v14;
  [v12 enumerateObjectsUsingBlock:v26];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_2;
  aBlock[3] = &unk_1E6DF9640;
  id v24 = v5;
  id v25 = v14;
  id v15 = v14;
  id v16 = v5;
  uint64_t v17 = _Block_copy(aBlock);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_3;
  v21[3] = &unk_1E6DF9668;
  id v22 = v17;
  id v18 = v17;
  v19 = [v4 sortedArrayUsingComparator:v21];

  return v19;
}

void __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSString stringWithFormat:@"%@ ", a2];
  [*(id *)(a1 + 32) addObject:v3];
}

id __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v3, "rangeOfString:options:", v9, 9, (void)v14) != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v9, "length"));

          id v3 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v12 = [v3 stringByTrimmingCharactersInSet:v11];

  return v12;
}

uint64_t __47__VUIDownloadDataSource__sortDownloadEntities___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 title];
  uint64_t v7 = [v5 title];

  id v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if ([v8 length])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    int v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;
  }
  else
  {
    int v11 = 1;
  }
  if ([v8 length])
  {
    id v12 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    int v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;
  }
  else
  {
    int v13 = 1;
  }
  if ([v9 length])
  {
    long long v14 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    int v15 = objc_msgSend(v14, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0)) ^ 1;
  }
  else
  {
    int v15 = 1;
  }
  if ([v9 length]
    && ([MEMORY[0x1E4F28B88] decimalDigitCharacterSet],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", 0)) ^ 1,
        v16,
        (v11 | v17) != 1))
  {
    uint64_t v18 = -1;
  }
  else if ((v15 | v13) == 1)
  {
    uint64_t v18 = [v8 compare:v9 options:129];
  }
  else
  {
    uint64_t v18 = 1;
  }

  return v18;
}

- (void)_handleMediaLibraryContentsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDownloadDataSource *)self libraryContentsChangeDebounceTimer];

  if (!v5)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __74__VUIDownloadDataSource__handleMediaLibraryContentsDidChangeNotification___block_invoke;
    int v11 = &unk_1E6DF66E0;
    objc_copyWeak(&v12, &location);
    uint64_t v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:&v8 block:1.0];
    -[VUIDownloadDataSource setLibraryContentsChangeDebounceTimer:](self, "setLibraryContentsChangeDebounceTimer:", v7, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __74__VUIDownloadDataSource__handleMediaLibraryContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setLibraryContentsChangeDebounceTimer:0];
    [v2 _loadDownloadedEntities];
    [v2 _loadActiveDownloads];
    id WeakRetained = v2;
  }
}

- (void)_loadDownloadedEntities
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = +[VUIMediaLibraryManager defaultManager];
  id v3 = [v2 sidebandMediaLibrary];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3D1A8, &unk_1F3F3D1C0, 0);
  id v5 = [v3 videosWithDownloadStates:v4 entitlementTypes:0 sortDescriptors:0 useMainThreadContext:1];

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v85 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        if (([v11 markedAsDeleted] & 1) == 0)
        {
          id v12 = [v11 entitlementType];
          uint64_t v13 = [v12 integerValue];

          if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            long long v14 = [v11 adamID];
            if ([(VUISidebandMediaItem *)v14 length])
            {
              int v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[VUISidebandMediaItem longLongValue](v14, "longLongValue"));
              if (v15) {
                [v68 addObject:v15];
              }
            }
          }
          else
          {
            long long v16 = [VUISidebandMediaItem alloc];
            int v17 = +[VUIMediaLibraryManager defaultManager];
            uint64_t v18 = [v17 sidebandMediaLibrary];
            uint64_t v19 = VUIMediaEntityFetchRequestAllPropertiesSet();
            long long v14 = [(VUISidebandMediaItem *)v16 initWithMediaLibrary:v18 videoManagedObject:v11 requestedProperties:v19];

            if (v14) {
              [v75 addObject:v14];
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v8);
  }
  v60 = v6;

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v20 = (void *)MEMORY[0x1E4F31970];
  v21 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
  id v22 = objc_msgSend(v20, "vui_moviesQueryWithMediaLibrary:", v21);
  v92[0] = v22;
  v23 = (void *)MEMORY[0x1E4F31970];
  id v24 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
  id v25 = objc_msgSend(v23, "vui_movieRentalsQueryWithMediaLibrary:", v24);
  v92[1] = v25;
  v26 = (void *)MEMORY[0x1E4F31970];
  id v27 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
  v28 = objc_msgSend(v26, "vui_episodesQueryWithMediaLibrary:", v27);
  v92[2] = v28;
  id v29 = (void *)MEMORY[0x1E4F31970];
  id v30 = [MEMORY[0x1E4F31940] defaultMediaLibrary];
  objc_super v31 = objc_msgSend(v29, "vui_homeVideosQueryWithMediaLibrary:", v30);
  v92[3] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];

  obuint64_t j = v32;
  uint64_t v67 = [v32 countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v67)
  {
    uint64_t v65 = *MEMORY[0x1E4F313E0];
    uint64_t v66 = *(void *)v81;
    uint64_t v63 = *MEMORY[0x1E4F31500];
    uint64_t v64 = *MEMORY[0x1E4F31410];
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v81 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v74 = v33;
        v34 = *(void **)(*((void *)&v80 + 1) + 8 * v33);
        uint64_t v35 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC38] forProperty:v65];
        uint64_t v36 = [MEMORY[0x1E4F31968] predicateWithValue:MEMORY[0x1E4F1CC28] forProperty:v64];
        v37 = (void *)MEMORY[0x1E4F318F0];
        v72 = (void *)v36;
        v73 = (void *)v35;
        v91[0] = v35;
        v91[1] = v36;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
        uint64_t v39 = [v37 predicateMatchingPredicates:v38];

        v40 = (void *)MEMORY[0x1E4F31900];
        v41 = [MEMORY[0x1E4F1CAD0] setWithArray:v68];
        uint64_t v42 = [v40 predicateWithProperty:v63 values:v41];

        v43 = (void *)MEMORY[0x1E4F318F8];
        v70 = (void *)v42;
        v71 = (void *)v39;
        v90[0] = v39;
        v90[1] = v42;
        v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
        uint64_t v45 = [v43 predicateMatchingPredicates:v44];

        v69 = (void *)v45;
        [v34 addFilterPredicate:v45];
        [v34 setIgnoreSystemFilterPredicates:1];
        v46 = [v34 items];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v76 objects:v89 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v77;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v77 != v49) {
                objc_enumerationMutation(v46);
              }
              uint64_t v51 = *(void *)(*((void *)&v76 + 1) + 8 * j);
              v52 = [VUIMPMediaItem alloc];
              v53 = +[VUIMediaLibraryManager defaultManager];
              v54 = [v53 deviceMediaLibrary];
              v55 = VUIMediaEntityFetchRequestAllPropertiesSet();
              v56 = [(VUIMPMediaItem *)v52 initWithMediaLibrary:v54 mediaItem:v51 requestedProperties:v55];

              if (v56) {
                [v75 addObject:v56];
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v76 objects:v89 count:16];
          }
          while (v48);
        }

        uint64_t v33 = v74 + 1;
      }
      while (v74 + 1 != v67);
      uint64_t v67 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v67);
  }

  v57 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  v88 = v57;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  [v75 sortUsingDescriptors:v58];

  v59 = +[VUIMediaLibraryUtilities groupingForMediaEntities:v75 groupingKeyPath:@"showTitle" groupingSortComparator:0 performDefaultSort:1 sortIndexPropertyKey:0];
  [(VUIDownloadDataSource *)self _downloadedMediaEntitiesDidUpdate:v75 grouping:v59];
}

- (void)_loadActiveDownloads
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__VUIDownloadDataSource__loadActiveDownloads__block_invoke;
  v3[3] = &unk_1E6DF9690;
  objc_copyWeak(&v4, &location);
  [(VUIDownloadDataSource *)self _getActivelyDownloadingAdamIDsWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __45__VUIDownloadDataSource__loadActiveDownloads__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = v3;
  [WeakRetained setActivelyDownloadingAdamIds:v6];
  id v5 = [WeakRetained _mediaEntitiesForAdamIDs:v6];

  [WeakRetained _downloadingMediaEntitiesDidUpdate:v5];
}

- (id)_mediaEntitiesForAdamIDs:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    id v43 = v3;
    uint64_t v4 = [v3 valueForKeyPath:@"stringValue"];
    id v5 = +[VUIMediaLibraryManager defaultManager];
    id v6 = [v5 sidebandMediaLibrary];
    uint64_t v42 = (void *)v4;
    uint64_t v7 = [v6 videosForAdamIDs:v4 useMainThreadContext:1];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v51 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v13 = [v12 entitlementType];
          unint64_t v14 = [v13 integerValue];

          if (v14 <= 4 && ((1 << v14) & 0x13) != 0)
          {
            long long v16 = [VUISidebandMediaItem alloc];
            int v17 = +[VUIMediaLibraryManager defaultManager];
            uint64_t v18 = [v17 sidebandMediaLibrary];
            uint64_t v19 = VUIMediaEntityFetchRequestAllPropertiesSet();
            v20 = [(VUISidebandMediaItem *)v16 initWithMediaLibrary:v18 videoManagedObject:v12 requestedProperties:v19];

            if (v20) {
              [v45 addObject:v20];
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v9);
    }

    v21 = (void *)MEMORY[0x1E4F31900];
    uint64_t v22 = *MEMORY[0x1E4F31500];
    v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v43];
    uint64_t v24 = [v21 predicateWithProperty:v22 values:v23];

    id v25 = objc_alloc(MEMORY[0x1E4F31970]);
    v41 = (void *)v24;
    v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v24];
    id v27 = (void *)[v25 initWithFilterPredicates:v26];

    [v27 setIgnoreSystemFilterPredicates:1];
    v40 = v27;
    v28 = [v27 items];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          v34 = [VUIMPMediaItem alloc];
          uint64_t v35 = +[VUIMediaLibraryManager defaultManager];
          uint64_t v36 = [v35 deviceMediaLibrary];
          v37 = VUIMediaEntityFetchRequestAllPropertiesSet();
          v38 = [(VUIMPMediaItem *)v34 initWithMediaLibrary:v36 mediaItem:v33 requestedProperties:v37];

          if (v38) {
            [v45 addObject:v38];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v30);
    }

    id v3 = v43;
  }

  return v45;
}

- (void)_rentalsDidExpire:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __43__VUIDownloadDataSource__rentalsDidExpire___block_invoke;
  uint64_t v9 = &unk_1E6DF4A30;
  objc_copyWeak(&v10, &location);
  id v5 = &v6;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v6, v7)) {
    v8((uint64_t)v5);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__VUIDownloadDataSource__rentalsDidExpire___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPerformingRentalExpirationFetch:1];
  [WeakRetained _loadDownloadedEntities];
  [WeakRetained _loadActiveDownloads];
}

- (void)_getActivelyDownloadingAdamIDsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  uint64_t v8 = __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke;
  uint64_t v9 = &unk_1E6DF4D78;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = v7;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v8((uint64_t)v6);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[VUIDownloadManager sharedInstance];
  id v4 = [v3 downloads];

  id v5 = [WeakRetained sDownloadManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6DF96B8;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  [v5 getDownloadsUsingBlock:v7];
}

void __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    uint64_t v8 = *MEMORY[0x1E4FA85F8];
    uint64_t v9 = *MEMORY[0x1E4FA8630];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        v42[0] = v8;
        v42[1] = v9;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
        uint64_t v13 = objc_msgSend(v11, "vui_valuesForProperties:", v12);

        unint64_t v14 = [v13 objectForKey:v9];
        [v3 addObject:v14];

        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v6);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    uint64_t v19 = *MEMORY[0x1E4FAA0D8];
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = [*(id *)(*((void *)&v33 + 1) + 8 * v20) mediaItem];
        uint64_t v22 = [v21 mediaItemMetadataForProperty:v19];

        if (v22)
        {
          v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v22, "longLongValue"));
          [v3 addObject:v23];
        }
        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v17);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  uint64_t v29 = __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_3;
  uint64_t v30 = &unk_1E6DF41E8;
  id v24 = *(id *)(a1 + 40);
  id v31 = v3;
  id v32 = v24;
  id v25 = (void *)MEMORY[0x1E4F29060];
  id v26 = v3;
  if ([v25 isMainThread]) {
    v29((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __70__VUIDownloadDataSource__getActivelyDownloadingAdamIDsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_handleDownloadingStateDidChange
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__VUIDownloadDataSource__handleDownloadingStateDidChange__block_invoke;
  v3[3] = &unk_1E6DF9690;
  objc_copyWeak(&v4, &location);
  [(VUIDownloadDataSource *)self _getActivelyDownloadingAdamIDsWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __57__VUIDownloadDataSource__handleDownloadingStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = v3;
  uint64_t v5 = [WeakRetained activelyDownloadingAdamIds];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB3C58]);
  uint64_t v7 = [v6 changeSetFromObjects:v5 toObjects:v9 identifierBlock:&__block_literal_global_96 isEqualBlock:0];
  [WeakRetained setActivelyDownloadingAdamIds:v9];
  if ([v7 hasChanges])
  {
    uint64_t v8 = [WeakRetained _mediaEntitiesForAdamIDs:v9];
    [WeakRetained _downloadingMediaEntitiesDidUpdate:v8];
    [WeakRetained _loadDownloadedEntities];
  }
}

id __57__VUIDownloadDataSource__handleDownloadingStateDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)_getDownloadEntityInDownloadEntities:(id)a3 containingMediaEntity:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 showIdentifier];
  uint64_t v8 = [v6 identifier];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  id v10 = (id)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v21 = v6;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unint64_t v14 = [v13 mediaEntities];
        id v15 = [v14 firstObject];

        if (v7)
        {
          uint64_t v16 = [v15 showIdentifier];
          char v17 = [v16 isEqual:v7];

          if (v17) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v18 = [v15 identifier];
          int v19 = [v18 isEqual:v8];

          if (v19)
          {
LABEL_13:
            id v10 = v13;

            goto LABEL_14;
          }
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_14:
    id v6 = v21;
  }

  return v10;
}

- (void)_upsertEpisodesDownloadingForShowWithMediaEntity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 showIdentifier];
  if (v5)
  {
    id v6 = [(VUIDownloadDataSource *)self episodesDownloadingForShow];
    uint64_t v7 = [v6 objectForKey:v5];

    if (v7)
    {
      uint64_t v8 = [(VUIDownloadDataSource *)self episodesDownloadingForShow];
      id v9 = [v8 objectForKey:v5];

      if (!-[VUIDownloadDataSource _doesEpisodeSet:containMediaEntity:](self, "_doesEpisodeSet:containMediaEntity:", v9, v4))[v9 addObject:v4]; {
    }
      }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
      uint64_t v11 = [(VUIDownloadDataSource *)self episodesDownloadingForShow];
      [v11 setObject:v9 forKey:v5];
    }
  }
  else
  {
    id v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[VUIDownloadDataSource _upsertEpisodesDownloadingForShowWithMediaEntity:]((uint64_t)v4, v10);
    }
  }
}

- (id)_upsertDownloadEntities:(id)a3 withEpisodesDownloadingForShow:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v29 = a4;
  id v5 = [v29 allKeys];
  id v31 = (id)[v26 mutableCopy];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v5;
  uint64_t v30 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v44 = 0;
        id v45 = &v44;
        uint64_t v46 = 0x3032000000;
        long long v47 = __Block_byref_object_copy__18;
        long long v48 = __Block_byref_object_dispose__18;
        id v49 = 0;
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __80__VUIDownloadDataSource__upsertDownloadEntities_withEpisodesDownloadingForShow___block_invoke;
        v43[3] = &unk_1E6DF9700;
        v43[4] = v6;
        v43[5] = &v44;
        objc_msgSend(v31, "enumerateObjectsUsingBlock:", v43, v26);
        if (v45[5])
        {
          uint64_t v7 = [v29 objectForKey:v6];
          uint64_t v8 = (void *)MEMORY[0x1E4F1CA48];
          id v9 = [(id)v45[5] mediaEntities];
          long long v33 = [v8 arrayWithArray:v9];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v34 = v7;
          uint64_t v10 = [v34 countByEnumeratingWithState:&v39 objects:v55 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v40 != v11) {
                  objc_enumerationMutation(v34);
                }
                uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                unint64_t v14 = [v13 identifier];
                long long v37 = 0u;
                long long v38 = 0u;
                long long v35 = 0u;
                long long v36 = 0u;
                id v15 = [(id)v45[5] mediaEntities];
                uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v54 count:16];
                if (v16)
                {
                  uint64_t v17 = *(void *)v36;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v16; ++k)
                    {
                      if (*(void *)v36 != v17) {
                        objc_enumerationMutation(v15);
                      }
                      int v19 = [*(id *)(*((void *)&v35 + 1) + 8 * k) identifier];
                      if (v19 && ([v14 isEqual:v19] & 1) != 0)
                      {

                        goto LABEL_23;
                      }
                    }
                    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v54 count:16];
                    if (v16) {
                      continue;
                    }
                    break;
                  }
                }

                [v33 addObject:v13];
LABEL_23:
              }
              uint64_t v10 = [v34 countByEnumeratingWithState:&v39 objects:v55 count:16];
            }
            while (v10);
          }

          [(id)v45[5] setDownloadType:2];
          uint64_t v20 = (void *)v45[5];
          id v21 = (VUIDownloadEntity *)[v33 copy];
          [v20 setMediaEntities:v21];
        }
        else
        {
          long long v22 = [v29 objectForKey:v6];
          long long v23 = (void *)MEMORY[0x1E4F1C978];
          id v34 = v22;
          long long v24 = [v22 allObjects];
          long long v33 = [v23 arrayWithArray:v24];

          id v21 = [[VUIDownloadEntity alloc] initWithMediaEntities:v33 withDownloadType:2];
          [v31 addObject:v21];
        }

        _Block_object_dispose(&v44, 8);
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v30);
  }

  return v31;
}

void __80__VUIDownloadDataSource__upsertDownloadEntities_withEpisodesDownloadingForShow___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v12 = v7;
  id v9 = [v7 mediaEntities];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v10 showIdentifier];
  LODWORD(v8) = [v8 isEqual:v11];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_createGroupingByShowIdentifierWithLatestMediaEntityGroups:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v17);
        id v12 = [v11 description];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          unint64_t v14 = [v10 mediaEntities];
          id v15 = [v10 identifier];
          [v4 setObject:v14 forKey:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_createDownloadEntitiesFromLatestDownloads:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v55 = (id)objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v54 = self;
  uint64_t v6 = [(VUIDownloadDataSource *)self groupingByShowIdentifier];
  long long v53 = (void *)[v5 initWithDictionary:v6];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v4;
  uint64_t v57 = [obj countByEnumeratingWithState:&v75 objects:v82 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v76;
    uint64_t v7 = &off_1E6DF2000;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v76 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v58 = v8;
        id v9 = *(void **)(*((void *)&v75 + 1) + 8 * v8);
        uint64_t v10 = [v9 showTitle];
        uint64_t v11 = [v9 type];
        id v12 = [v7[261] episode];
        if (v11 == v12)
        {
          long long v25 = [v53 objectForKey:v10];

          if (v25)
          {
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v26 = [(VUIDownloadDataSource *)v54 downloadEntities];
            uint64_t v61 = [v26 countByEnumeratingWithState:&v71 objects:v81 count:16];
            if (v61)
            {
              long long v51 = v10;
              v62 = 0;
              id v59 = v26;
              uint64_t v60 = *(void *)v72;
              do
              {
                for (uint64_t i = 0; i != v61; ++i)
                {
                  if (*(void *)v72 != v60) {
                    objc_enumerationMutation(v59);
                  }
                  uint64_t v28 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                  long long v67 = 0u;
                  long long v68 = 0u;
                  long long v69 = 0u;
                  long long v70 = 0u;
                  id v29 = objc_msgSend(v28, "mediaEntities", v51);
                  uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v80 count:16];
                  if (v30)
                  {
                    uint64_t v31 = v30;
                    uint64_t v32 = *(void *)v68;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v31; ++j)
                      {
                        if (*(void *)v68 != v32) {
                          objc_enumerationMutation(v29);
                        }
                        id v34 = [*(id *)(*((void *)&v67 + 1) + 8 * j) identifier];
                        long long v35 = [v9 identifier];
                        int v36 = [v34 isEqual:v35];

                        if (v36)
                        {
                          long long v37 = v28;

                          v62 = v37;
                          goto LABEL_29;
                        }
                      }
                      uint64_t v31 = [v29 countByEnumeratingWithState:&v67 objects:v80 count:16];
                      if (v31) {
                        continue;
                      }
                      break;
                    }
                  }
LABEL_29:
                }
                uint64_t v61 = [v59 countByEnumeratingWithState:&v71 objects:v81 count:16];
              }
              while (v61);

              long long v38 = v53;
              uint64_t v7 = &off_1E6DF2000;
              uint64_t v10 = v51;
              long long v39 = v62;
              if (!v62)
              {
LABEL_48:
                id v49 = [v38 objectForKey:v10];
                long long v39 = [[VUIDownloadEntity alloc] initWithMediaEntities:v49 withDownloadType:1];
              }
              [v55 addObject:v39];
              [v38 removeObjectForKey:v10];
              goto LABEL_50;
            }

            long long v38 = v53;
            goto LABEL_48;
          }
        }
        else
        {
        }
        uint64_t v13 = [v9 type];
        uint64_t v14 = [v7[261] movie];
        id v15 = v13;
        if (v13 == (void *)v14) {
          goto LABEL_34;
        }
        uint64_t v16 = (void *)v14;
        long long v17 = v10;
        long long v18 = [v9 type];
        long long v19 = [v7[261] movieRental];
        long long v20 = v19;
        if (v18 == v19)
        {

          id v15 = v16;
          uint64_t v10 = v17;
LABEL_34:

LABEL_35:
          long long v40 = v10;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v41 = [(VUIDownloadDataSource *)v54 downloadEntities];
          uint64_t v42 = [v41 countByEnumeratingWithState:&v63 objects:v79 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v64;
LABEL_37:
            uint64_t v45 = 0;
            while (1)
            {
              if (*(void *)v64 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void **)(*((void *)&v63 + 1) + 8 * v45);
              long long v47 = [v46 mediaEntities];
              long long v48 = [v47 firstObject];

              if (v48 == v9) {
                break;
              }
              if (v43 == ++v45)
              {
                uint64_t v43 = [v41 countByEnumeratingWithState:&v63 objects:v79 count:16];
                if (v43) {
                  goto LABEL_37;
                }
                goto LABEL_43;
              }
            }
            long long v39 = v46;

            if (v39) {
              goto LABEL_46;
            }
          }
          else
          {
LABEL_43:
          }
          long long v39 = [[VUIDownloadEntity alloc] initWithMediaEntity:v9 withDownloadType:0];
LABEL_46:
          [v55 addObject:v39];
          uint64_t v7 = &off_1E6DF2000;
          uint64_t v10 = v40;
LABEL_50:

          goto LABEL_51;
        }
        id v21 = v7;
        uint64_t v22 = [v9 type];
        long long v23 = [v7[261] homeVideo];

        BOOL v24 = v22 == v23;
        uint64_t v7 = v21;
        uint64_t v10 = v17;
        if (v24) {
          goto LABEL_35;
        }
LABEL_51:

        uint64_t v8 = v58 + 1;
      }
      while (v58 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v75 objects:v82 count:16];
    }
    while (v57);
  }

  return v55;
}

- (void)_notifyDelegatesDownloadsFetchCompletedWithChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VUIDownloadDataSource *)self downloadEntities];
  uint64_t v6 = (void *)[v5 copy];

  BOOL v7 = [(VUIDownloadDataSource *)self performingRentalExpirationFetch];
  BOOL v8 = [(VUIDownloadDataSource *)self hasFetchedAllDownloadEntities];
  BOOL v9 = [(VUIDownloadDataSource *)self hasFetchedAllDownloadedEntities];
  if (![(VUILibraryDataSource *)self hasCompletedInitialFetch] && v8 && v9 && !v7)
  {
    [(VUILibraryDataSource *)self setHasCompletedInitialFetch:1];
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    long long v20 = __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke;
    id v21 = &unk_1E6DF5490;
    uint64_t v10 = &v23;
    objc_copyWeak(&v23, &location);
    id v22 = v6;
    uint64_t v11 = v19;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v20((uint64_t)v11);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v11);
    }

    uint64_t v13 = v22;
LABEL_17:

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  if ([(VUILibraryDataSource *)self hasCompletedInitialFetch] && (v3 || v7))
  {
    if (v7) {
      [(VUIDownloadDataSource *)self setPerformingRentalExpirationFetch:0];
    }
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v15 = __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke_2;
    uint64_t v16 = &unk_1E6DF5490;
    uint64_t v10 = &v18;
    objc_copyWeak(&v18, &location);
    id v17 = v6;
    id v12 = v14;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v15((uint64_t)v12);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }

    uint64_t v13 = v17;
    goto LABEL_17;
  }
LABEL_18:
}

void __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained downloadDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 downloadManager:WeakRetained downloadedFetchDidFinishWithEntities:*(void *)(a1 + 32)];
  }
}

void __76__VUIDownloadDataSource__notifyDelegatesDownloadsFetchCompletedWithChanges___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained downloadDelegate];
  if (objc_opt_respondsToSelector()) {
    [v2 downloadManager:WeakRetained downloadsDidChange:*(void *)(a1 + 32)];
  }
}

- (BOOL)_doesEpisodeSet:(id)a3 containMediaEntity:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 identifier];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
        if (v11 && [v6 isEqual:v11])
        {

          LOBYTE(v8) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

- (id)_coalesceActiveDownloadEntitiesAndDownloadedEntities
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIDownloadDataSource *)self localMediaItems];
  id v4 = [(VUIDownloadDataSource *)self _createDownloadEntitiesFromLatestDownloads:v3];

  long long v20 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(VUIDownloadDataSource *)self activelyDownloadingMediaItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = [v10 type];
        id v12 = +[VUIMediaEntityType episode];

        if (v11 == v12)
        {
          [(VUIDownloadDataSource *)self _upsertEpisodesDownloadingForShowWithMediaEntity:v10];
        }
        else
        {
          long long v13 = [(VUIDownloadDataSource *)self _getDownloadEntityInDownloadEntities:v4 containingMediaEntity:v10];
          if (!v13)
          {
            long long v13 = [[VUIDownloadEntity alloc] initWithMediaEntity:v10 withDownloadType:0];
            [v20 addObject:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v14 = [(VUIDownloadDataSource *)self episodesDownloadingForShow];
  long long v15 = [(VUIDownloadDataSource *)self _upsertDownloadEntities:v4 withEpisodesDownloadingForShow:v14];

  [v15 addObjectsFromArray:v20];
  long long v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1];
  long long v25 = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [v15 sortUsingDescriptors:v17];

  uint64_t v18 = (void *)[v15 copy];
  return v18;
}

- (BOOL)_downloadsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDownloadDataSource *)self downloadEntities];
  if (v5 == v4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    uint64_t v6 = [(VUIDownloadDataSource *)self downloadEntities];
    int v7 = [v6 isEqualToArray:v4] ^ 1;
  }
  return v7;
}

- (id)_deDupedMediaEntities:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isFamilySharingContent])
        {
          id v12 = [v11 storeID];
          if (v12) {
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (objc_msgSend(v18, "isFamilySharingContent", (void)v21))
          {
            [v4 addObject:v18];
          }
          else
          {
            long long v19 = [v18 storeID];
            if (!v19 || ([v5 containsObject:v19] & 1) == 0) {
              [v4 addObject:v18];
            }
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  return v4;
}

- (VUIDownloadDataSourceDelegate)downloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadDelegate);
  return (VUIDownloadDataSourceDelegate *)WeakRetained;
}

- (void)setDownloadDelegate:(id)a3
{
}

- (NSArray)downloadEntities
{
  return self->_downloadEntities;
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (SSDownloadManager)sDownloadManager
{
  return self->_sDownloadManager;
}

- (void)setSDownloadManager:(id)a3
{
}

- (BOOL)hasFetchedAllDownloadEntities
{
  return self->_hasFetchedAllDownloadEntities;
}

- (void)setHasFetchedAllDownloadEntities:(BOOL)a3
{
  self->_hasFetchedAllDownloadEntities = a3;
}

- (BOOL)hasFetchedAllDownloadedEntities
{
  return self->_hasFetchedAllDownloadedEntities;
}

- (void)setHasFetchedAllDownloadedEntities:(BOOL)a3
{
  self->_hasFetchedAllDownloadedEntities = a3;
}

- (BOOL)performingRentalExpirationFetch
{
  return self->_performingRentalExpirationFetch;
}

- (void)setPerformingRentalExpirationFetch:(BOOL)a3
{
  self->_performingRentalExpirationFetch = a3;
}

- (NSArray)localMediaItems
{
  return self->_localMediaItems;
}

- (void)setLocalMediaItems:(id)a3
{
}

- (NSArray)activelyDownloadingAdamIds
{
  return self->_activelyDownloadingAdamIds;
}

- (void)setActivelyDownloadingAdamIds:(id)a3
{
}

- (NSArray)activelyDownloadingMediaItems
{
  return self->_activelyDownloadingMediaItems;
}

- (void)setActivelyDownloadingMediaItems:(id)a3
{
}

- (NSMutableDictionary)episodesDownloadingForShow
{
  return self->_episodesDownloadingForShow;
}

- (void)setEpisodesDownloadingForShow:(id)a3
{
}

- (NSMutableDictionary)groupingByShowIdentifier
{
  return self->_groupingByShowIdentifier;
}

- (void)setGroupingByShowIdentifier:(id)a3
{
}

- (NSTimer)libraryContentsChangeDebounceTimer
{
  return self->_libraryContentsChangeDebounceTimer;
}

- (void)setLibraryContentsChangeDebounceTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryContentsChangeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_groupingByShowIdentifier, 0);
  objc_storeStrong((id *)&self->_episodesDownloadingForShow, 0);
  objc_storeStrong((id *)&self->_activelyDownloadingMediaItems, 0);
  objc_storeStrong((id *)&self->_activelyDownloadingAdamIds, 0);
  objc_storeStrong((id *)&self->_localMediaItems, 0);
  objc_storeStrong((id *)&self->_sDownloadManager, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_downloadEntities, 0);
  objc_destroyWeak((id *)&self->_downloadDelegate);
}

- (void)_upsertEpisodesDownloadingForShowWithMediaEntity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "DownloadDataSource:: upsertEpisodes currentIdentifier is nil for mediaEntity %@", (uint8_t *)&v2, 0xCu);
}

@end