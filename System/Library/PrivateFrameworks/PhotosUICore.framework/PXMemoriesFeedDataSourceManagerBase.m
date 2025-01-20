@interface PXMemoriesFeedDataSourceManagerBase
+ (BOOL)shouldGroupTogetherMemoriesWithCreationDate:(id)a3 andCreationDate:(id)a4;
+ (id)_updatedFetchResultsForMemoriesForDatasource:(id)a3 changeDetails:(id)a4 changeInstance:(id)a5;
+ (id)baseFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)generateEntriesFromMemories:(id)a3 startingFromIndex:(unint64_t)a4 maximumNumberOfEntries:(unint64_t)a5 finalMemoryIndex:(unint64_t *)a6;
- (BOOL)_isGeneratingAdditionalEntries;
- (BOOL)hasAnyMemories;
- (NSDate)mostRecentCreationDate;
- (PHFetchResult)memoriesFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PXDiscoveryFeedDataSourceManager)discoveryDataSourceManager;
- (PXMemoriesFeedDataSourceManagerBase)initWithPhotoLibrary:(id)a3;
- (id)createInitialDataSource;
- (id)fetchOptions;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (unint64_t)firstUngroupedMemoryIndex;
- (void)_clearPendingNotificationForMemory:(id)a3;
- (void)_setGeneratingAdditionalEntries:(BOOL)a3;
- (void)generateAdditionalEntriesIfPossible;
- (void)handleChangedKeyAssetsForMemories:(id)a3;
- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4;
- (void)handleNonIncrementalFetchResultChange:(id)a3;
- (void)loadMoreContentWithCompletionHandler:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)reloadMemories:(BOOL)a3;
- (void)resetMemoriesFetchResult;
- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3;
- (void)setDiscoveryDataSourceManager:(id)a3;
- (void)setFirstUngroupedMemoryIndex:(unint64_t)a3;
- (void)setMemoriesFetchResult:(id)a3;
- (void)startGeneratingMemories;
- (void)startObservingChanges;
- (void)updateCurrentMemoriesNonPendingAndNotificationStatus;
@end

@implementation PXMemoriesFeedDataSourceManagerBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoriesFetchResult, 0);
  objc_storeStrong((id *)&self->_discoveryDataSourceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setFirstUngroupedMemoryIndex:(unint64_t)a3
{
  self->_firstUngroupedMemoryIndex = a3;
}

- (unint64_t)firstUngroupedMemoryIndex
{
  return self->_firstUngroupedMemoryIndex;
}

- (PHFetchResult)memoriesFetchResult
{
  return self->_memoriesFetchResult;
}

- (void)setDiscoveryDataSourceManager:(id)a3
{
}

- (PXDiscoveryFeedDataSourceManager)discoveryDataSourceManager
{
  return self->_discoveryDataSourceManager;
}

- (void)_setGeneratingAdditionalEntries:(BOOL)a3
{
  self->__generatingAdditionalEntries = a3;
}

- (BOOL)_isGeneratingAdditionalEntries
{
  return self->__generatingAdditionalEntries;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)updateCurrentMemoriesNonPendingAndNotificationStatus
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  v4 = +[PXMemoriesSeenHelper defaultHelper];
  [v4 clearAnyPendingNotificationsFromMemories:v3];
  unint64_t v5 = [(PXMemoriesFeedDataSourceManagerBase *)self firstUngroupedMemoryIndex];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = [v3 count];
    if (v6 >= v7) {
      unint64_t v8 = v7;
    }
    else {
      unint64_t v8 = v6;
    }
    v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v8);
    v10 = [v3 objectsAtIndexes:v9];
    [v4 clearAnyPendingStateFromMemories:v10];
  }
  else
  {
    v9 = PLMemoriesGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      v12 = "-[PXMemoriesFeedDataSourceManagerBase updateCurrentMemoriesNonPendingAndNotificationStatus]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = [v3 count];
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpected value for firstUngroupedMemoryIndex: %lu, memoriesFetchResult.count: %lu", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)_clearPendingNotificationForMemory:(id)a3
{
  id v4 = a3;
  photoLibrary = self->_photoLibrary;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PXMemoriesFeedDataSourceManagerBase__clearPendingNotificationForMemory___block_invoke;
  v10[3] = &unk_1E5DD36F8;
  id v11 = v4;
  id v6 = v4;
  [(PHPhotoLibrary *)photoLibrary performChanges:v10 completionHandler:&__block_literal_global_70191];
  unint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary assetsdClient];
  unint64_t v8 = [v7 notificationClient];
  v9 = [v6 uuid];
  [v8 asyncNotifyInterestingMemoryNotificationViewedForColletionID:v9];
}

void __74__PXMemoriesFeedDataSourceManagerBase__clearPendingNotificationForMemory___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v1 setNotificationState:2];
}

void __74__PXMemoriesFeedDataSourceManagerBase__clearPendingNotificationForMemory___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    unint64_t v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Error while updating memory notification state: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleChangedKeyAssetsForMemories:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSourceManagerBase.m", 276, @"Method %s is a responsibility of subclass %@", "-[PXMemoriesFeedDataSourceManagerBase handleChangedKeyAssetsForMemories:]", v8 object file lineNumber description];

  abort();
}

- (void)handleNonIncrementalFetchResultChange:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSourceManagerBase.m", 272, @"Method %s is a responsibility of subclass %@", "-[PXMemoriesFeedDataSourceManagerBase handleNonIncrementalFetchResultChange:]", v8 object file lineNumber description];

  abort();
}

- (void)handleIncrementalFetchResultChange:(id)a3 updatedFetchResultsForMemoriesWithChangedKeyAssets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSourceManagerBase.m", 268, @"Method %s is a responsibility of subclass %@", "-[PXMemoriesFeedDataSourceManagerBase handleIncrementalFetchResultChange:updatedFetchResultsForMemoriesWithChangedKeyAssets:]", v11 object file lineNumber description];

  abort();
}

- (void)reloadMemories:(BOOL)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSourceManagerBase.m", 264, @"Method %s is a responsibility of subclass %@", "-[PXMemoriesFeedDataSourceManagerBase reloadMemories:]", v7 object file lineNumber description];

  abort();
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"memoriesFetchResultChangeDetails"];
  id v8 = [v6 objectForKeyedSubscript:@"updatedFetchResultsForMemoriesWithChangedKeyAssets"];
  v9 = [v6 objectForKeyedSubscript:@"datasource"];
  v10 = [(PXSectionedDataSourceManager *)self dataSource];
  id v11 = [v6 objectForKeyedSubscript:@"memoriesFetchResult"];

  uint64_t v12 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  __int16 v13 = (void *)v12;
  if (v9 == v10 && v11 == (void *)v12)
  {
    if (v7) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v14 = [v16 changeDetailsForFetchResult:v12];

    uint64_t v15 = +[PXMemoriesFeedDataSourceManagerBase _updatedFetchResultsForMemoriesForDatasource:v10 changeDetails:v14 changeInstance:v16];

    id v8 = (void *)v15;
    id v7 = (void *)v14;
    if (v14)
    {
LABEL_4:
      if ([v7 hasIncrementalChanges]) {
        [(PXMemoriesFeedDataSourceManagerBase *)self handleIncrementalFetchResultChange:v16 updatedFetchResultsForMemoriesWithChangedKeyAssets:v8];
      }
      else {
        [(PXMemoriesFeedDataSourceManagerBase *)self handleNonIncrementalFetchResultChange:v7];
      }
      goto LABEL_10;
    }
  }
  if ([v8 count]) {
    [(PXMemoriesFeedDataSourceManagerBase *)self handleChangedKeyAssetsForMemories:v8];
  }
LABEL_10:
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__70215;
  v21 = __Block_byref_object_dispose__70216;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__70215;
  uint64_t v15 = __Block_byref_object_dispose__70216;
  id v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PXMemoriesFeedDataSourceManagerBase_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5DCCE38;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  id v5 = [v4 changeDetailsForFetchResult:v12[5]];
  id v6 = +[PXMemoriesFeedDataSourceManagerBase _updatedFetchResultsForMemoriesForDatasource:v18[5] changeDetails:v5 changeInstance:v4];
  id v7 = objc_opt_new();
  [v7 setObject:v18[5] forKeyedSubscript:@"datasource"];
  [v7 setObject:v6 forKeyedSubscript:@"updatedFetchResultsForMemoriesWithChangedKeyAssets"];
  uint64_t v8 = v12[5];
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:@"memoriesFetchResult"];
  }
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:@"memoriesFetchResultChangeDetails"];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __68__PXMemoriesFeedDataSourceManagerBase_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSource];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) memoriesFetchResult];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)startObservingChanges
{
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4 = a3;
  id v5 = [(PXMemoriesFeedDataSourceManagerBase *)self photoLibrary];
  objc_msgSend(v5, "px_endPausingChanges:", v4);
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = [(PXMemoriesFeedDataSourceManagerBase *)self photoLibrary];
  uint64_t v8 = objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, a3);

  return v8;
}

- (void)loadMoreContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[PXMemoriesRelatedSettings sharedInstance];
  int v6 = [v5 enableDiscoveryFeed];

  if (v6)
  {
    id v7 = [(PXMemoriesFeedDataSourceManagerBase *)self discoveryDataSourceManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PXMemoriesFeedDataSourceManagerBase_loadMoreContentWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5DB5948;
    v8[4] = self;
    id v9 = v4;
    [v7 loadMoreContentWithCompletionHandler:v8];
  }
}

uint64_t __76__PXMemoriesFeedDataSourceManagerBase_loadMoreContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 resetMemoriesFetchResult];
}

- (void)generateAdditionalEntriesIfPossible
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSourceManagerBase.m", 145, @"Method %s is a responsibility of subclass %@", "-[PXMemoriesFeedDataSourceManagerBase generateAdditionalEntriesIfPossible]", v6 object file lineNumber description];

  abort();
}

- (void)startGeneratingMemories
{
  self->_memoryGenerationHasStarted = 1;
  [(PXMemoriesFeedDataSourceManagerBase *)self resetMemoriesFetchResult];
}

- (void)resetMemoriesFetchResult
{
  if (self->_memoryGenerationHasStarted)
  {
    uint64_t v3 = +[PXMemoriesRelatedSettings sharedInstance];
    int v4 = [v3 enableDiscoveryFeed];

    if (v4)
    {
      id v6 = [(PXSectionedDataSourceManager *)self->_discoveryDataSourceManager dataSource];
      [v6 assetCollections];
    }
    else
    {
      id v6 = [(PXMemoriesFeedDataSourceManagerBase *)self fetchOptions];
      objc_msgSend(MEMORY[0x1E4F38EE8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL);
    id v5 = };
    [(PXMemoriesFeedDataSourceManagerBase *)self setMemoriesFetchResult:v5];
  }
}

- (void)setMemoriesFetchResult:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = (PHFetchResult *)a3;
  if (self->_memoriesFetchResult != v5)
  {
    objc_storeStrong((id *)&self->_memoriesFetchResult, a3);
    if (!v5)
    {
      id v6 = PLMemoriesGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        uint64_t v8 = "-[PXMemoriesFeedDataSourceManagerBase setMemoriesFetchResult:]";
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Set memoriesFetchResult to nil, %s", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (id)fetchOptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PXMemoriesFeedDataSourceManagerBase *)self photoLibrary];
  uint64_t v3 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v2];
  int v4 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v3];
  id v5 = +[PXMemoriesFeedDataSourceManagerBase baseFetchOptionsWithPhotoLibrary:v2];
  [v5 setPhotoLibrary:v2];
  v10[0] = *MEMORY[0x1E4F397B8];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v5 setFetchPropertySets:v6];

  uint64_t v7 = [(PXLibraryFilterState *)v4 viewMode];
  if (v7 == 2) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2 * (v7 != 1);
  }
  [v5 setSharingFilter:v8];

  return v5;
}

- (BOOL)hasAnyMemories
{
  uint64_t v2 = [(PXMemoriesFeedDataSourceManagerBase *)self memoriesFetchResult];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)createInitialDataSource
{
  return +[PXSectionedDataSource emptyDataSource];
}

- (PXMemoriesFeedDataSourceManagerBase)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXMemoriesFeedDataSourceManagerBase;
  id v5 = [(PXSectionedDataSourceManager *)&v14 init];
  if (v5)
  {
    id v6 = v4;
    if (!v4)
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    }
    objc_storeStrong((id *)&v5->_photoLibrary, v6);
    if (!v4) {

    }
    uint64_t v7 = +[PXMemoriesRelatedSettings sharedInstance];
    int v8 = [v7 enableDiscoveryFeed];

    if (v8)
    {
      uint64_t v9 = [[PXDiscoveryFeedDataSourceManager alloc] initWithPhotoLibrary:v5->_photoLibrary];
      discoveryDataSourceManager = v5->_discoveryDataSourceManager;
      v5->_discoveryDataSourceManager = v9;

      uint64_t v11 = [(PXSectionedDataSourceManager *)v5->_discoveryDataSourceManager dataSource];
      uint64_t v12 = [v11 assetCollections];
      [(PXMemoriesFeedDataSourceManagerBase *)v5 setMemoriesFetchResult:v12];
    }
  }

  return v5;
}

- (NSDate)mostRecentCreationDate
{
  BOOL v3 = objc_opt_class();
  id v4 = [(PXMemoriesFeedDataSourceManagerBase *)self photoLibrary];
  id v5 = [v3 baseFetchOptionsWithPhotoLibrary:v4];

  [v5 setFetchLimit:1];
  id v6 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v5];
  uint64_t v7 = [v6 firstObject];
  int v8 = [v7 creationDate];

  return (NSDate *)v8;
}

+ (BOOL)shouldGroupTogetherMemoriesWithCreationDate:(id)a3 andCreationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[PXMemoriesRelatedSettings sharedInstance];
  char v10 = [v9 enableDiscoveryFeed];

  if (v10)
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v12 = +[PXMemoriesFeedSettings sharedInstance];
    uint64_t v13 = [v12 memoryGroupingMethod];
    switch(v13)
    {
      case 1:
        char v11 = objc_msgSend(v7, "px_isSameDayAsDate:", v8);
        break;
      case 2:
        [v7 timeIntervalSinceDate:v8];
        double v15 = fabs(v14);
        [v12 memoryGroupingInterval];
        char v11 = v15 <= v16;
        break;
      case 0:
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:a1 file:@"PXMemoriesFeedDataSourceManagerBase.m" lineNumber:342 description:@"Code which should be unreachable has been reached"];

        abort();
      default:
        char v11 = 0;
        break;
    }
  }
  return v11;
}

+ (id)generateEntriesFromMemories:(id)a3 startingFromIndex:(unint64_t)a4 maximumNumberOfEntries:(unint64_t)a5 finalMemoryIndex:(unint64_t *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = PLMemoriesGetLog();
  char v10 = &unk_1AB2ED000;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = [v8 count];
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Generating feed entries from %lu entries...", buf, 0xCu);
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __125__PXMemoriesFeedDataSourceManagerBase_generateEntriesFromMemories_startingFromIndex_maximumNumberOfEntries_finalMemoryIndex___block_invoke;
  aBlock[3] = &unk_1E5DB59C0;
  id v13 = v12;
  id v29 = v13;
  id v26 = v11;
  id v30 = v26;
  double v14 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  if (![v8 count])
  {
    double v15 = 0;
    a4 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a6) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v24 = a6;
  if ([v8 count] <= a4)
  {
    double v15 = 0;
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  double v15 = 0;
  unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v17 = v15;
    v18 = [v8 objectAtIndexedSubscript:a4];
    double v15 = [v18 creationDate];
    if (!v17 || ([a1 shouldGroupTogetherMemoriesWithCreationDate:v15 andCreationDate:v17] & 1) != 0) {
      goto LABEL_10;
    }
    v14[2](v14, v17, v13);
    unint64_t v16 = a4 - 1;
    if ([v26 count] >= a5) {
      break;
    }
    [v13 removeAllObjects];
LABEL_10:
    uint64_t v19 = +[PXMemoryInfo memoryInfoWithMemory:v18];
    [v13 addObject:v19];

    if (++a4 >= [v8 count]) {
      goto LABEL_15;
    }
  }

  double v15 = v17;
LABEL_15:
  if (![v13 count])
  {
    a4 = v16;
    a6 = v24;
    char v10 = &unk_1AB2ED000;
    if (!v24) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  a6 = v24;
  char v10 = (void *)&unk_1AB2ED000;
  if ([v26 count] < a5)
  {
    v14[2](v14, v15, v13);
    if (!v24) {
      goto LABEL_21;
    }
LABEL_20:
    *a6 = a4;
    goto LABEL_21;
  }
  a4 = v16;
  if (v24) {
    goto LABEL_20;
  }
LABEL_21:
  v20 = PLMemoriesGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v26 count];
    *(_DWORD *)buf = v10[107];
    uint64_t v32 = v21;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "Generated %lu feed entries:", buf, 0xCu);
  }

  id v22 = v26;
  return v22;
}

void __125__PXMemoriesFeedDataSourceManagerBase_generateEntriesFromMemories_startingFromIndex_maximumNumberOfEntries_finalMemoryIndex___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[PXMemoryEntryInfo alloc] initWithMemories:*(void *)(a1 + 32)];
  BOOL v3 = PLMemoriesGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "Generated feed entry: %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 40) addObject:v2];
}

+ (id)_updatedFetchResultsForMemoriesForDatasource:(id)a3 changeDetails:(id)a4 changeInstance:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  char v10 = objc_opt_new();
  id v11 = [v9 entries];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke;
  v18[3] = &unk_1E5DB5998;
  id v19 = v7;
  id v20 = v8;
  id v12 = v10;
  id v21 = v12;
  id v13 = v8;
  id v14 = v7;
  [v11 enumerateObjectsUsingBlock:v18];
  double v15 = v21;
  id v16 = v12;

  return v16;
}

void __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke(id *a1, void *a2)
{
  BOOL v3 = [a2 memories];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke_2;
  v4[3] = &unk_1E5DB5970;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  [v3 enumerateObjectsUsingBlock:v4];
}

void __113__PXMemoriesFeedDataSourceManagerBase__updatedFetchResultsForMemoriesForDatasource_changeDetails_changeInstance___block_invoke_2(id *a1, void *a2)
{
  id v16 = a2;
  BOOL v3 = [v16 assetCollection];
  int v4 = [a1[4] removedObjects];
  char v5 = [v4 containsObject:v3];

  if ((v5 & 1) == 0)
  {
    id v6 = a1[5];
    id v7 = [v16 keyAssetFetchResult];
    id v8 = [v6 changeDetailsForFetchResult:v7];

    if (v8)
    {
      id v9 = [v16 keyAssetFetchResult];
      char v10 = [v9 firstObject];

      id v11 = [a1[5] changeDetailsForObject:v10];
      char v12 = [v11 assetContentChanged];
      id v13 = [v8 fetchResultAfterChanges];
      id v14 = [v13 firstObject];
      int v15 = [v14 isEqual:v10];

      if ((v12 & 1) != 0 || !v15) {
        [a1[6] setObject:v13 forKey:v3];
      }
    }
  }
}

+ (id)baseFetchOptionsWithPhotoLibrary:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludePendingMemories:1];
  int v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"rejected = NO"];
  [v3 setPredicate:v4];

  char v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v3 setSortDescriptors:v7];

  return v3;
}

@end