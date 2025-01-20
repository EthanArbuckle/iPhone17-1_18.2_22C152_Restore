@interface WBSHistory
+ (id)defaultHistoryDatabaseDirectoryURL;
+ (id)existingSharedHistory;
+ (id)historyDatabaseURL;
+ (id)historyDatabaseWriteAheadLogURL;
+ (id)profileDirectoryURLForProfileID:(id)a3;
+ (void)clearExistingSharedHistory;
- (BOOL)_isStringForUserTypedDomainExpansionInHistory:(id)a3;
- (BOOL)canRecordRedirectFromVisit:(id)a3 to:(id)a4;
- (BOOL)hasAnyHistoryItems;
- (BOOL)hasItemSince:(id)a3;
- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3;
- (Class)_historyItemClass;
- (NSArray)allItems;
- (NSString)databaseID;
- (NSString)profileLocalIdentifier;
- (WBSHistory)initWithDatabaseID:(id)a3;
- (WBSHistoryTagMap)historyTagMap;
- (double)historyAgeLimit;
- (id)_createHistoryStore;
- (id)_removeItemForURLString:(id)a3;
- (id)historyStore:(id)a3 itemForURLString:(id)a4 createIfNeeded:(BOOL)a5;
- (id)itemForURL:(id)a3;
- (id)itemForURLString:(id)a3;
- (id)itemForURLString:(id)a3 createIfNeeded:(BOOL)a4;
- (id)itemRedirectedFrom:(id)a3 to:(id)a4 origin:(int64_t)a5 date:(id)a6;
- (id)itemRedirectedFrom:(id)a3 to:(id)a4 origin:(int64_t)a5 date:(id)a6 statusCode:(int64_t)a7;
- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 origin:(int64_t)a9;
- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 origin:(int64_t)a9 attributes:(unint64_t)a10;
- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 statusCode:(int64_t)a9 origin:(int64_t)a10;
- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 statusCode:(int64_t)a9 origin:(int64_t)a10 attributes:(unint64_t)a11;
- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 wasHTTPNonGet:(BOOL)a5 wasFailure:(BOOL)a6 increaseVisitCount:(BOOL)a7;
- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 wasHTTPNonGet:(BOOL)a5 wasFailure:(BOOL)a6 increaseVisitCount:(BOOL)a7 statusCode:(int64_t)a8;
- (id)lastVisitForHighLevelDomain:(id)a3;
- (unint64_t)numberOfHistoryItems;
- (unint64_t)numberOfHistoryItemsOnHistoryQueue;
- (void)_addItem:(id)a3 addToStringsForUserTypedDomainExpansions:(BOOL)a4;
- (void)_addItemToStringsForUserTypedDomainExpansion:(id)a3;
- (void)_createHistoryStoreIfNeeded;
- (void)_dispatchHistoryCleared:(id)a3;
- (void)_dispatchHistoryItemAdded:(id)a3 withVisitOrigin:(int64_t)a4;
- (void)_dispatchHistoryItemDidChange:(id)a3 byUserInitiatedAction:(BOOL)a4;
- (void)_dispatchHistoryItemWillChange:(id)a3;
- (void)_dispatchHistoryItemsLoaded:(id)a3;
- (void)_dispatchHistoryItemsRemoved:(id)a3;
- (void)_dispatchHistoryLoaded;
- (void)_dispatchHistoryVisitAdded:(id)a3;
- (void)_loadHistory;
- (void)_loadHistoryWithCompletionHandler:(id)a3;
- (void)_removeHistoryItemsInResponseToUserAction:(id)a3;
- (void)_removeItemFromStringsForUserTypedDomainExpansion:(id)a3;
- (void)_removeItemsInResponseToUserAction:(id)a3 completionHandler:(id)a4;
- (void)_sendNotification:(id)a3 withItems:(id)a4;
- (void)_setAttributes:(unint64_t)a3 forVisit:(id)a4;
- (void)_unload;
- (void)_waitUntilHistoryHasLoadedMainThread;
- (void)addAttributes:(unint64_t)a3 toVisit:(id)a4;
- (void)addAutocompleteTrigger:(id)a3 forURLString:(id)a4;
- (void)addTagWithIdentifier:(id)a3 title:(id)a4 toItemAtURL:(id)a5 level:(int64_t)a6 completionHandler:(id)a7;
- (void)checkIfLocalVisitExistsInAnyOfItems:(id)a3 withCompletion:(id)a4;
- (void)clearHistory;
- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)clearHistoryWithCompletionHandler:(id)a3;
- (void)close;
- (void)closeWithCompletionHandler:(id)a3;
- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9;
- (void)enumerateItemsAsynchronouslyUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)exportHistoryToFileWithURL:(id)a3 completionHandler:(id)a4;
- (void)fetchHistoricalHighLevelDomainsWithCompletionHandler:(id)a3;
- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 completionHandler:(id)a5;
- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5 minimumItemCount:(unint64_t)a6 sortOrder:(int64_t)a7 completionHandler:(id)a8;
- (void)getAllItemsWithCompletionHandler:(id)a3;
- (void)getAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4;
- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6;
- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4;
- (void)getVisitsCreatedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5;
- (void)historyLoader:(id)a3 didLoadItems:(id)a4 stringsForUserTypeDomainExpansion:(id)a5;
- (void)historyLoaderDidFinishLoading:(id)a3;
- (void)historyStore:(id)a3 didAddVisits:(id)a4;
- (void)historyStore:(id)a3 didPrepareToDeleteWithDeletionPlan:(id)a4;
- (void)historyStore:(id)a3 didRemoveHighLevelDomains:(id)a4;
- (void)historyStore:(id)a3 didRemoveHostnames:(id)a4;
- (void)historyStore:(id)a3 didRemoveItems:(id)a4;
- (void)historyStore:(id)a3 didRemoveVisits:(id)a4;
- (void)historyStoreWasCleared:(id)a3;
- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)loadHistoryAsynchronouslyIfNeeded;
- (void)performBlockAfterHistoryHasLoaded:(id)a3;
- (void)performMaintenance;
- (void)performMaintenance:(id)a3;
- (void)releaseCloudHistory:(id)a3;
- (void)removeItemsInResponseToUserAction:(id)a3;
- (void)removeItemsInResponseToUserAction:(id)a3 completionHandler:(id)a4;
- (void)savePendingChangesBeforeTerminationWithCompletionHandler:(id)a3;
- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationBlock:(id)a6 completionHandler:(id)a7;
- (void)setHistoryAgeLimit:(double)a3;
- (void)setTitle:(id)a3 ofTag:(id)a4 completionHandler:(id)a5;
- (void)updateTitle:(id)a3 forVisit:(id)a4;
- (void)vacuumHistoryWithCompletionHandler:(id)a3;
- (void)waitUntilHistoryHasLoaded;
@end

@implementation WBSHistory

uint64_t __47__WBSHistory_loadHistoryAsynchronouslyIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadHistory];
}

- (NSString)databaseID
{
  return self->_databaseID;
}

uint64_t __34__WBSHistory_releaseCloudHistory___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) releaseCloudHistory:*(void *)(a1 + 40)];
}

+ (id)existingSharedHistory
{
  return (id)existingSharedHistory;
}

- (void)_loadHistory
{
  ct_green_tea_logger_create_static();
  v3 = getCTGreenTeaOsLogHandle();
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  if (!self->_hasStartedLoadingHistory)
  {
    self->_hasStartedLoadingHistory = 1;
    [(WBSHistory *)self _createHistoryStoreIfNeeded];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__WBSHistory__loadHistory__block_invoke;
    v5[3] = &unk_1E5C8D348;
    v5[4] = self;
    [(WBSHistory *)self _loadHistoryWithCompletionHandler:v5];
  }
}

- (void)_createHistoryStoreIfNeeded
{
  if (!self->_historyStore)
  {
    v3 = [(WBSHistory *)self _createHistoryStore];
    historyStore = self->_historyStore;
    self->_historyStore = v3;

    v5 = self->_historyStore;
    [(WBSHistoryStore *)v5 setDelegate:self];
  }
}

- (void)_loadHistoryWithCompletionHandler:(id)a3
{
}

void __42__WBSHistory__sendNotification_withItems___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

void __36__WBSHistory__dispatchHistoryLoaded__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  v6 = @"WBSHistoryInMemoryDatabase";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(v3 + 56), "isUsingInMemoryDatabase"));
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WBSHistoryWasLoadedNotification" object:v3 userInfo:v5];
}

- (WBSHistory)initWithDatabaseID:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSHistory;
  id v6 = [(WBSHistory *)&v19 init];
  if (v6)
  {
    v7 = [[WBSHistoryActivityThrottler alloc] initWithLimitPerSecond:20];
    v8 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SafariShared.WBSHistory.entriesByURLString", 0);
    v10 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v11;

    uint64_t v13 = [MEMORY[0x1E4F28BD0] set];
    v14 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SafariShared.WBSHistory.waitUntilHistoryHasLoaded", 0);
    v16 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v15;

    dispatch_suspend(*((dispatch_object_t *)v6 + 6));
    objc_storeStrong((id *)v6 + 9, a3);
    if (!v5)
    {
      objc_storeStrong((id *)&existingSharedHistory, v6);
      objc_storeStrong((id *)v6 + 9, (id)*MEMORY[0x1E4F980C8]);
    }
    id v17 = v6;
  }

  return (WBSHistory *)v6;
}

void __39__WBSHistory_enumerateItemsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __26__WBSHistory__loadHistory__block_invoke(uint64_t a1)
{
}

- (void)historyLoaderDidFinishLoading:(id)a3
{
  ct_green_tea_logger_create_static();
  v4 = getCTGreenTeaOsLogHandle();
  id v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Read Safari history", v6, 2u);
  }

  [(WBSHistory *)self _dispatchHistoryLoaded];
}

- (void)historyLoader:(id)a3 didLoadItems:(id)a4 stringsForUserTypeDomainExpansion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  ct_green_tea_logger_create_static();
  dispatch_queue_t v9 = getCTGreenTeaOsLogHandle();
  v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  if (v8)
  {
    if (self->_stringsForUserTypedDomainExpansion) {
      [(NSCountedSet *)self->_stringsForUserTypedDomainExpansion unionSet:v8];
    }
    else {
      objc_storeStrong((id *)&self->_stringsForUserTypedDomainExpansion, a5);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        -[WBSHistory _addItem:addToStringsForUserTypedDomainExpansions:](self, "_addItem:addToStringsForUserTypedDomainExpansions:", *(void *)(*((void *)&v15 + 1) + 8 * i), v8 == 0, (void)v15);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }

  [(WBSHistory *)self _dispatchHistoryItemsLoaded:v11];
}

- (void)_sendNotification:(id)a3 withItems:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    objc_super v19 = @"WBSHistoryItemsKey";
    v20[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42__WBSHistory__sendNotification_withItems___block_invoke_2;
    v12[3] = &unk_1E5C8D840;
    id v13 = v6;
    v14 = self;
    id v15 = v8;
    id v9 = v8;
    id v10 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__WBSHistory__sendNotification_withItems___block_invoke;
    block[3] = &unk_1E5C8D980;
    id v17 = v6;
    long long v18 = self;
    id v11 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v9 = v17;
  }
}

- (void)_dispatchHistoryLoaded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WBSHistory__dispatchHistoryLoaded__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_dispatchHistoryItemsLoaded:(id)a3
{
}

+ (id)historyDatabaseURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__WBSHistory_historyDatabaseURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (+[WBSHistory historyDatabaseURL]::onceToken != -1) {
    dispatch_once(&+[WBSHistory historyDatabaseURL]::onceToken, block);
  }
  uint64_t v2 = (void *)+[WBSHistory historyDatabaseURL]::historyURL;
  return v2;
}

- (void)waitUntilHistoryHasLoaded
{
  [(WBSHistory *)self loadHistoryAsynchronouslyIfNeeded];
  waitUntilHistoryHasLoadedQueue = self->_waitUntilHistoryHasLoadedQueue;
  dispatch_sync(waitUntilHistoryHasLoadedQueue, &__block_literal_global_72);
}

- (void)performBlockAfterHistoryHasLoaded:(id)a3
{
  dispatch_block_t block = a3;
  [(WBSHistory *)self loadHistoryAsynchronouslyIfNeeded];
  dispatch_async((dispatch_queue_t)self->_waitUntilHistoryHasLoadedQueue, block);
}

- (void)loadHistoryAsynchronouslyIfNeeded
{
  if (!self->_hasStartedLoadingHistory)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__WBSHistory_loadHistoryAsynchronouslyIfNeeded__block_invoke;
    block[3] = &unk_1E5C8CA70;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)releaseCloudHistory:(id)a3
{
  id v4 = a3;
  waitUntilHistoryHasLoadedQueue = self->_waitUntilHistoryHasLoadedQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __34__WBSHistory_releaseCloudHistory___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(waitUntilHistoryHasLoadedQueue, v7);
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__17;
  objc_super v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSHistory_enumerateItemsUsingBlock___block_invoke;
  block[3] = &unk_1E5C8E190;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v16[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

+ (id)defaultHistoryDatabaseDirectoryURL
{
  if (+[WBSHistory defaultHistoryDatabaseDirectoryURL]::onceToken != -1) {
    dispatch_once(&+[WBSHistory defaultHistoryDatabaseDirectoryURL]::onceToken, &__block_literal_global_59);
  }
  uint64_t v2 = (void *)+[WBSHistory defaultHistoryDatabaseDirectoryURL]::historyDirectoryURL;
  return v2;
}

void __48__WBSHistory_defaultHistoryDatabaseDirectoryURL__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v0 = objc_msgSend(v2, "safari_nonContaineredSettingsDirectoryURL");
  v1 = (void *)+[WBSHistory defaultHistoryDatabaseDirectoryURL]::historyDirectoryURL;
  +[WBSHistory defaultHistoryDatabaseDirectoryURL]::historyDirectoryURL = v0;
}

void __32__WBSHistory_historyDatabaseURL__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) defaultHistoryDatabaseDirectoryURL];
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"History.db" isDirectory:0];
  id v2 = (void *)+[WBSHistory historyDatabaseURL]::historyURL;
  +[WBSHistory historyDatabaseURL]::historyURL = v1;
}

+ (id)profileDirectoryURLForProfileID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = objc_msgSend(v5, "safari_profileDirectoryURLWithID:createIfNeeded:", v4, 0);
  }
  else
  {
    id v6 = [a1 defaultHistoryDatabaseDirectoryURL];
  }

  return v6;
}

+ (id)historyDatabaseWriteAheadLogURL
{
  {
    id v4 = (void *)MEMORY[0x1E4F97F98];
    id v5 = [a1 historyDatabaseURL];
    +[WBSHistory historyDatabaseWriteAheadLogURL]::historyWriteAheadLogURL = [v4 writeAheadLogURLForDatabaseURL:v5];
  }
  id v2 = (void *)+[WBSHistory historyDatabaseWriteAheadLogURL]::historyWriteAheadLogURL;
  return v2;
}

- (NSString)profileLocalIdentifier
{
  return self->_databaseID;
}

- (id)itemForURLString:(id)a3
{
  id v3 = [(WBSHistory *)self itemForURLString:a3 createIfNeeded:0];
  return v3;
}

- (id)itemForURLString:(id)a3 createIfNeeded:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    long long v18 = __Block_byref_object_copy__17;
    objc_super v19 = __Block_byref_object_dispose__17;
    id v20 = 0;
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__WBSHistory_itemForURLString_createIfNeeded___block_invoke;
    v11[3] = &unk_1E5C9BF98;
    long long v13 = &v15;
    v11[4] = self;
    id v12 = v6;
    BOOL v14 = a4;
    dispatch_sync(entriesByURLStringAccessQueue, v11);
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __46__WBSHistory_itemForURLString_createIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(unsigned char *)(a1 + 56) && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "_historyItemClass")), "initWithURLString:", *(void *)(a1 + 40));
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v10 = *(void **)(*(void *)(a1 + 32) + 16);
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
}

- (id)lastVisitForHighLevelDomain:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__17;
    v31 = __Block_byref_object_dispose__17;
    id v32 = 0;
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__WBSHistory_lastVisitForHighLevelDomain___block_invoke;
    block[3] = &unk_1E5C8E190;
    void block[4] = self;
    void block[5] = &v27;
    dispatch_sync(entriesByURLStringAccessQueue, block);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = (id)v28[5];
    uint64_t v7 = 0;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "url", (void)v22);
          long long v13 = objc_msgSend(v12, "safari_userVisibleHostWithoutWWWSubdomain");
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            if (!v7
              || ([v7 visitTime],
                  double v16 = v15,
                  [v11 lastVisit],
                  uint64_t v17 = objc_claimAutoreleasedReturnValue(),
                  [v17 visitTime],
                  BOOL v19 = v16 > v18,
                  v17,
                  !v19))
            {
              uint64_t v20 = [v11 lastVisit];

              uint64_t v7 = (void *)v20;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v33 count:16];
      }
      while (v8);
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __42__WBSHistory_lastVisitForHighLevelDomain___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasItemSince:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__WBSHistory_hasItemSince___block_invoke;
  block[3] = &unk_1E5C9BFE8;
  void block[4] = self;
  id v9 = v4;
  long long v10 = &v11;
  id v6 = v4;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  LOBYTE(entriesByURLStringAccessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)entriesByURLStringAccessQueue;
}

void __27__WBSHistory_hasItemSince___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__WBSHistory_hasItemSince___block_invoke_2;
  v5[3] = &unk_1E5C9BFC0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void __27__WBSHistory_hasItemSince___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 lastVisitedDate];
  unint64_t v7 = *(void *)(a1 + 32);

  if ((unint64_t)v6 >= v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)removeItemsInResponseToUserAction:(id)a3
{
}

- (void)removeItemsInResponseToUserAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    [(WBSHistory *)self _removeItemsInResponseToUserAction:v6 completionHandler:v7];
  }
  else
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Empty list of items to remove", v9, 2u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)_removeHistoryItemsInResponseToUserAction:(id)a3
{
}

- (void)_removeItemsInResponseToUserAction:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  [(WBSHistory *)self _waitUntilHistoryHasLoadedMainThread];
  id v6 = dispatch_group_create();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v15;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v11 = [v10 urlString];
        id v12 = [(WBSHistory *)self _removeItemForURLString:v11];

        dispatch_group_enter(v6);
        historyStore = self->_historyStore;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        void v20[2] = __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke;
        v20[3] = &unk_1E5C8CA70;
        uint64_t v21 = v6;
        [(WBSHistoryStore *)historyStore removePastHistoryVisitsForItem:v10 completionHandler:v20];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke_2;
  block[3] = &unk_1E5C8D5F0;
  id v19 = v16;
  id v14 = v16;
  dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
}

void __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke(uint64_t a1)
{
}

uint64_t __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)itemForURL:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "safari_originalDataAsString");
  uint64_t v5 = [(WBSHistory *)self itemForURLString:v4];

  return v5;
}

- (void)addAutocompleteTrigger:(id)a3 forURLString:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    uint64_t v7 = [(WBSHistory *)self itemForURLString:v6];
    if (v7) {
      [(WBSHistoryStore *)self->_historyStore addAutocompleteTrigger:v8 forItem:v7];
    }
  }
}

- (void)getAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 length])
  {
    uint64_t v7 = [(WBSHistory *)self itemForURLString:v8];
    if (v7) {
      [(WBSHistoryStore *)self->_historyStore getAutocompleteTriggersForItem:v7 completionHandler:v6];
    }
  }
}

- (void)_addItem:(id)a3 addToStringsForUserTypedDomainExpansions:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 urlString];
  if (v7)
  {
    id v8 = [(WBSHistory *)self _removeItemForURLString:v7];
    if (v8)
    {
      [v6 mergeDataFromItem:v8];
      [(WBSHistoryStore *)self->_historyStore itemWasReplaced:v8 byItem:v6];
    }

    if (v4) {
      [(WBSHistory *)self _addItemToStringsForUserTypedDomainExpansion:v6];
    }
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__WBSHistory__addItem_addToStringsForUserTypedDomainExpansions___block_invoke;
    block[3] = &unk_1E5C8D840;
    void block[4] = self;
    id v19 = v7;
    id v20 = v6;
    dispatch_sync(entriesByURLStringAccessQueue, block);
  }
  else
  {
    long long v10 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSHistory _addItem:addToStringsForUserTypedDomainExpansions:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

uint64_t __64__WBSHistory__addItem_addToStringsForUserTypedDomainExpansions___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)_removeItemForURLString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = __Block_byref_object_copy__17;
    long long v24 = __Block_byref_object_dispose__17;
    id v25 = 0;
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__WBSHistory__removeItemForURLString___block_invoke;
    block[3] = &unk_1E5C9A498;
    id v19 = &v20;
    void block[4] = self;
    id v18 = v4;
    dispatch_sync(entriesByURLStringAccessQueue, block);
    if (v21[5])
    {
      -[WBSHistory _removeItemFromStringsForUserTypedDomainExpansion:](self, "_removeItemFromStringsForUserTypedDomainExpansion:");
      if (![(NSMutableDictionary *)self->_entriesByURLString count]) {
        [(WBSHistory *)self _removeAllVisitedLinks];
      }
      id v7 = (id)v21[5];
    }
    else
    {
      id v7 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSHistory _removeItemForURLString:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    id v7 = 0;
  }

  return v7;
}

uint64_t __38__WBSHistory__removeItemForURLString___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  id v6 = *(void **)(a1[4] + 16);
  return [v6 removeObjectForKey:v5];
}

- (BOOL)_isStringForUserTypedDomainExpansionInHistory:(id)a3
{
  id v4 = a3;
  if (v4) {
    char v5 = [(NSCountedSet *)self->_stringsForUserTypedDomainExpansion containsObject:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_addItemToStringsForUserTypedDomainExpansion:(id)a3
{
  id v4 = [a3 stringForUserTypedDomainExpansion];
  if (v4) {
    [(NSCountedSet *)self->_stringsForUserTypedDomainExpansion addObject:v4];
  }
}

- (void)_removeItemFromStringsForUserTypedDomainExpansion:(id)a3
{
  id v4 = [a3 stringForUserTypedDomainExpansion];
  if (v4) {
    [(NSCountedSet *)self->_stringsForUserTypedDomainExpansion removeObject:v4];
  }
}

- (NSArray)allItems
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__17;
  uint64_t v10 = __Block_byref_object_dispose__17;
  id v11 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__WBSHistory_allItems__block_invoke;
  v5[3] = &unk_1E5C8E190;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(entriesByURLStringAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __22__WBSHistory_allItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasAnyHistoryItems
{
  return [(WBSHistory *)self numberOfHistoryItems] != 0;
}

- (unint64_t)numberOfHistoryItems
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__WBSHistory_numberOfHistoryItems__block_invoke;
  v5[3] = &unk_1E5C8E190;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(entriesByURLStringAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__WBSHistory_numberOfHistoryItems__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfHistoryItemsOnHistoryQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)numberOfHistoryItemsOnHistoryQueue
{
  return [(NSMutableDictionary *)self->_entriesByURLString count];
}

- (void)enumerateItemsAsynchronouslyUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E5C9C038;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(entriesByURLStringAccessQueue, block);
}

void __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5C9C010;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

uint64_t __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__WBSHistory_getAllItemsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C660;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(entriesByURLStringAccessQueue, v7);
}

void __47__WBSHistory_getAllItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)setHistoryAgeLimit:(double)a3
{
  if (self->_historyAgeLimit != a3)
  {
    self->_historyAgeLimit = a3;
    -[WBSHistoryStore setHistoryAgeLimit:](self->_historyStore, "setHistoryAgeLimit:");
  }
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 wasHTTPNonGet:(BOOL)a5 wasFailure:(BOOL)a6 increaseVisitCount:(BOOL)a7
{
  id v7 = [(WBSHistory *)self itemVisitedAtURLString:a3 title:a4 wasHTTPNonGet:a5 wasFailure:a6 increaseVisitCount:a7 statusCode:0];
  return v7;
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 wasHTTPNonGet:(BOOL)a5 wasFailure:(BOOL)a6 increaseVisitCount:(BOOL)a7 statusCode:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v16 = -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:](self, "itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:", v14, v15, v11, v10, v9, a8, 0);

  return v16;
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 origin:(int64_t)a9
{
  BOOL v9 = [(WBSHistory *)self itemVisitedAtURLString:a3 title:a4 timeOfVisit:a6 wasHTTPNonGet:a7 wasFailure:a8 increaseVisitCount:0 statusCode:a5 origin:a9];
  return v9;
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 statusCode:(int64_t)a9 origin:(int64_t)a10
{
  BOOL v10 = [(WBSHistory *)self itemVisitedAtURLString:a3 title:a4 timeOfVisit:a6 wasHTTPNonGet:a7 wasFailure:a8 increaseVisitCount:a9 statusCode:a5 origin:a10 attributes:0];
  return v10;
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 origin:(int64_t)a9 attributes:(unint64_t)a10
{
  BOOL v10 = [(WBSHistory *)self itemVisitedAtURLString:a3 title:a4 timeOfVisit:a6 wasHTTPNonGet:a7 wasFailure:a8 increaseVisitCount:0 statusCode:a5 origin:a9 attributes:a10];
  return v10;
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 statusCode:(int64_t)a9 origin:(int64_t)a10 attributes:(unint64_t)a11
{
  BOOL v12 = a7;
  uint64_t v13 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v41 = a4;
  if (!v17)
  {
    uint64_t v22 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:attributes:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_24;
  }
  ct_green_tea_logger_create_static();
  id v18 = getCTGreenTeaOsLogHandle();
  id v19 = v18;
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v19, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  [(WBSHistory *)self loadHistoryAsynchronouslyIfNeeded];
  uint64_t v20 = [(WBSHistory *)self itemForURLString:v17];
  if (!v20)
  {
    if ([(WBSHistoryActivityThrottler *)self->_entryCreationThrottler shouldRecordHistoryVisitAtTime:a5])
    {
      v30 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 141558275;
        uint64_t v47 = 1752392040;
        __int16 v48 = 2117;
        id v49 = v17;
        _os_log_impl(&dword_1A6B5F000, v30, OS_LOG_TYPE_INFO, "Adding new global history item for %{sensitive, mask.hash}@", buf, 0x16u);
      }
      v31 = objc_msgSend(objc_alloc(-[WBSHistory _historyItemClass](self, "_historyItemClass")), "initWithURLString:", v17);
      unsigned int v40 = v13;
      entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __128__WBSHistory_itemVisitedAtURLString_title_timeOfVisit_wasHTTPNonGet_wasFailure_increaseVisitCount_statusCode_origin_attributes___block_invoke;
      block[3] = &unk_1E5C8D840;
      void block[4] = self;
      id v43 = v17;
      id v21 = v31;
      id v44 = v21;
      dispatch_sync(entriesByURLStringAccessQueue, block);
      [(WBSHistory *)self _addItemToStringsForUserTypedDomainExpansion:v21];

      uint64_t v13 = v40;
      goto LABEL_13;
    }
    v38 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      uint64_t v47 = (uint64_t)v17;
      _os_log_impl(&dword_1A6B5F000, v38, OS_LOG_TYPE_DEFAULT, "Did not create history item for %{sensitive}@ because of excessive history activity requests", buf, 0xCu);
    }
LABEL_24:
    uint64_t v34 = 0;
    goto LABEL_25;
  }
  [(WBSHistory *)self _dispatchHistoryItemWillChange:v20];
  id v21 = (id)v20;
LABEL_13:
  v33 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 141558275;
    uint64_t v47 = 1752392040;
    __int16 v48 = 2117;
    id v49 = v17;
    _os_log_impl(&dword_1A6B5F000, v33, OS_LOG_TYPE_INFO, "Updating global history item %{sensitive, mask.hash}@", buf, 0x16u);
  }
  uint64_t v34 = [[WBSHistoryVisit alloc] initWithHistoryItem:v21 visitTime:!v12 loadWasSuccesful:v13 wasHTTPNonGet:a10 origin:a11 attributes:a5];
  v35 = WBSHistoryTruncatePageTitle(v41, 0x200uLL);
  [(WBSHistoryVisit *)v34 setTitle:v35];

  [v21 wasVisited:v34];
  if (WBSStatusCodeGroupFromStatusCode()
    || ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled] & 1) == 0)
  {
    [v21 setStatusCode:a9];
  }
  [(WBSHistory *)self _dispatchHistoryVisitAdded:v34];
  if (v20) {
    [(WBSHistory *)self _dispatchHistoryItemDidChange:v21 byUserInitiatedAction:(unint64_t)(a10 - 4) < 0xFFFFFFFFFFFFFFFDLL];
  }
  else {
    [(WBSHistory *)self _dispatchHistoryItemAdded:v21 withVisitOrigin:a10];
  }
  historyStore = self->_historyStore;
  v45 = v34;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  [(WBSHistoryStore *)historyStore visitsWereAdded:v37];

LABEL_25:
  return v34;
}

uint64_t __128__WBSHistory_itemVisitedAtURLString_title_timeOfVisit_wasHTTPNonGet_wasFailure_increaseVisitCount_statusCode_origin_attributes___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)itemRedirectedFrom:(id)a3 to:(id)a4 origin:(int64_t)a5 date:(id)a6
{
  id v6 = [(WBSHistory *)self itemRedirectedFrom:a3 to:a4 origin:a5 date:a6 statusCode:0];
  return v6;
}

- (id)itemRedirectedFrom:(id)a3 to:(id)a4 origin:(int64_t)a5 date:(id)a6 statusCode:(int64_t)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  BOOL v12 = (WBSHistoryVisit *)a3;
  id v13 = a4;
  id v14 = a6;
  ct_green_tea_logger_create_static();
  id v15 = getCTGreenTeaOsLogHandle();
  uint64_t v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v16, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  if ([(WBSHistory *)self canRecordRedirectFromVisit:v12 to:v13])
  {
    [(WBSHistory *)self loadHistoryAsynchronouslyIfNeeded];
    if (v14) {
      [v14 timeIntervalSinceReferenceDate];
    }
    else {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    }
    double v19 = v17;
    uint64_t v20 = [(WBSHistoryVisit *)v12 item];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      id v18 = [(WBSHistory *)self itemVisitedAtURLString:v13 title:0 timeOfVisit:0 wasHTTPNonGet:0 wasFailure:1 increaseVisitCount:a7 statusCode:v19 origin:0];
    }
    else if (v13)
    {
      uint64_t v22 = [(WBSHistory *)self itemForURLString:v13];
      if (v22)
      {
        [(WBSHistory *)self _dispatchHistoryItemWillChange:v22];
        id v23 = (id)v22;
      }
      else
      {
        uint64_t v25 = WBS_LOG_CHANNEL_PREFIXHistory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 141558275;
          uint64_t v40 = 1752392040;
          __int16 v41 = 2117;
          id v42 = v13;
          _os_log_impl(&dword_1A6B5F000, v25, OS_LOG_TYPE_INFO, "Synthesizing item for destination of redirect: %{sensitive, mask.hash}@", buf, 0x16u);
        }
        uint64_t v26 = objc_msgSend(objc_alloc(-[WBSHistory _historyItemClass](self, "_historyItemClass")), "initWithURLString:", v13);
        entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __59__WBSHistory_itemRedirectedFrom_to_origin_date_statusCode___block_invoke;
        block[3] = &unk_1E5C8D840;
        void block[4] = self;
        id v37 = v13;
        id v23 = v26;
        id v38 = v23;
        dispatch_sync(entriesByURLStringAccessQueue, block);
        [(WBSHistory *)self _addItemToStringsForUserTypedDomainExpansion:v23];
      }
      uint64_t v28 = [(WBSHistoryVisit *)v12 item];
      [(WBSHistory *)self _dispatchHistoryItemWillChange:v28];
      id v18 = [[WBSHistoryVisit alloc] initWithHistoryItem:v23 visitTime:1 loadWasSuccesful:0 wasHTTPNonGet:a5 origin:0 attributes:v19];
      [v23 wasRedirectedFrom:v12 to:v18];
      if (WBSStatusCodeGroupFromStatusCode()
        || ([MEMORY[0x1E4F97EA0] isStreamlinedCompletionListEnabled] & 1) == 0)
      {
        [v23 setStatusCode:a7];
      }
      [(WBSHistory *)self _dispatchHistoryVisitAdded:v18];
      [(WBSHistory *)self _dispatchHistoryItemDidChange:v28 byUserInitiatedAction:(unint64_t)(a5 - 4) < 0xFFFFFFFFFFFFFFFDLL];
      if (v22) {
        [(WBSHistory *)self _dispatchHistoryItemDidChange:v23 byUserInitiatedAction:(unint64_t)(a5 - 4) < 0xFFFFFFFFFFFFFFFDLL];
      }
      else {
        [(WBSHistory *)self _dispatchHistoryItemAdded:v23 withVisitOrigin:a5];
      }
      if ([(WBSHistoryVisit *)v12 didUserInteractWithPage]) {
        [(WBSHistoryVisit *)v12 setAttributes:[(WBSHistoryVisit *)v12 attributes] | 0x10];
      }
      historyStore = self->_historyStore;
      v48[0] = v12;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
      [(WBSHistoryStore *)historyStore visitsWereModified:v30];

      v31 = self->_historyStore;
      uint64_t v47 = v18;
      id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      [(WBSHistoryStore *)v31 visitsWereAdded:v32];

      v33 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = [v28 urlString];
        *(_DWORD *)buf = 141558787;
        uint64_t v40 = 1752392040;
        __int16 v41 = 2117;
        id v42 = v34;
        __int16 v43 = 2160;
        uint64_t v44 = 1752392040;
        __int16 v45 = 2117;
        id v46 = v13;
        _os_log_impl(&dword_1A6B5F000, v33, OS_LOG_TYPE_INFO, "Recorded redirect from %{sensitive, mask.hash}@ to %{sensitive, mask.hash}@", buf, 0x2Au);
      }
    }
    else
    {
      uint64_t v24 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[WBSHistory itemRedirectedFrom:to:origin:date:statusCode:](v24);
      }
      id v18 = 0;
    }
  }
  else
  {
    id v18 = v12;
  }

  return v18;
}

uint64_t __59__WBSHistory_itemRedirectedFrom_to_origin_date_statusCode___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)getVisitsCreatedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ct_green_tea_logger_create_static();
  BOOL v11 = getCTGreenTeaOsLogHandle();
  BOOL v12 = v11;
  if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__WBSHistory_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9B058;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [(WBSHistory *)self performBlockAfterHistoryHasLoaded:v16];
}

uint64_t __69__WBSHistory_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 56) getVisitsCreatedAfterDate:a1[5] beforeDate:a1[6] completionHandler:a1[7]];
}

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__WBSHistory_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E5C9C060;
  v16[4] = self;
  id v17 = v10;
  BOOL v20 = a5;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(WBSHistory *)self performBlockAfterHistoryHasLoaded:v16];
}

uint64_t __108__WBSHistory_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) getHighLevelHTTPFamilyDomainsVisitedAfterDate:*(void *)(a1 + 40) beforeDate:*(void *)(a1 + 48) onlyFromThisDevice:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
}

- (void)checkIfLocalVisitExistsInAnyOfItems:(id)a3 withCompletion:(id)a4
{
}

- (BOOL)canRecordRedirectFromVisit:(id)a3 to:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 item];
  id v8 = [v7 urlString];

  if ([v8 isEqualToString:v6])
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 141558275;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2117;
      id v19 = v6;
      id v10 = "Ignoring redirect from %{sensitive, mask.hash}@ to itself";
      id v11 = v9;
      uint32_t v12 = 22;
LABEL_7:
      _os_log_impl(&dword_1A6B5F000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, v12);
    }
  }
  else
  {
    if ((unint64_t)[v5 redirectSourceChainLength] < 0x15)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    id v13 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 141558787;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2117;
      id v19 = v8;
      __int16 v20 = 2160;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2117;
      id v23 = v6;
      id v10 = "Ignoring redirect from %{sensitive, mask.hash}@ to %{sensitive, mask.hash}@ due to exceeding maximum redirect chain length";
      id v11 = v13;
      uint32_t v12 = 42;
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

- (void)updateTitle:(id)a3 forVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 item];
  if (v8)
  {
    WBSHistoryTruncatePageTitle(v6, 0x200uLL);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v9 = [v7 title];
    char v10 = [v9 isEqualToString:v11];

    if ((v10 & 1) == 0)
    {
      [(WBSHistory *)self _dispatchHistoryItemWillChange:v8];
      objc_msgSend(v7, "setTitle:");
      [v8 _lastVisitTitleMayHaveChanged];
      [(WBSHistory *)self _dispatchHistoryItemDidChange:v8 byUserInitiatedAction:0];
      [(WBSHistoryStore *)self->_historyStore visitTitleWasUpdated:v7];
    }
  }
  else
  {
    id v11 = v6;
  }
}

- (void)_setAttributes:(unint64_t)a3 forVisit:(id)a4
{
  id v7 = a4;
  id v6 = [v7 item];
  [(WBSHistory *)self _dispatchHistoryItemWillChange:v6];
  [v7 setAttributes:a3];
  [(WBSHistory *)self _dispatchHistoryItemDidChange:v6 byUserInitiatedAction:0];
  [(WBSHistoryStore *)self->_historyStore visitAttributeWasUpdated:v7 removeAttributes:0 addAttributes:a3];
}

- (void)addAttributes:(unint64_t)a3 toVisit:(id)a4
{
  id v6 = a4;
  if (([v6 hasAttributes:a3] & 1) == 0) {
    -[WBSHistory _setAttributes:forVisit:](self, "_setAttributes:forVisit:", [v6 attributes] | a3, v6);
  }
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 completionHandler:(id)a5
{
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5 minimumItemCount:(unint64_t)a6 sortOrder:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)addTagWithIdentifier:(id)a3 title:(id)a4 toItemAtURL:(id)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  int v16 = [(WBSHistory *)self itemForURL:v14];
  if (v16)
  {
    historyStore = self->_historyStore;
    v26[0] = v12;
    __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v25 = v13;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke;
    v20[3] = &unk_1E5C9C0B0;
    id v21 = v12;
    id v24 = v15;
    __int16 v22 = self;
    id v23 = v16;
    [(WBSHistoryStore *)historyStore tagsWithIdentifiers:v18 type:1 level:a6 creatingIfNecessary:1 withTitles:v19 completionHandler:v20];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v15 + 2))(v15, 1, 0);
  }
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    char v10 = [v7 arrayByAddingObjectsFromArray:v8];
    id v11 = *(void **)(a1 + 48);
    id v12 = *(void **)(*(void *)(a1 + 40) + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_63;
    v15[3] = &unk_1E5C9C088;
    id v16 = v11;
    id v17 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 56);
    [v12 assignHistoryItem:v16 toTopicTags:v10 completionHandler:v15];
  }
  else
  {
    id v13 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_2();
    }

    id v14 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_1(a1, v14);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_63(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 32) databaseID];
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_63_cold_2();
    }

    id v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_63_cold_1(a1, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setTitle:(id)a3 ofTag:(id)a4 completionHandler:(id)a5
{
}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
}

- (void)clearHistory
{
}

- (void)clearHistoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(WBSHistory *)self _waitUntilHistoryHasLoadedMainThread];
  if (!v4) {
    id v4 = &__block_literal_global_67;
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__17;
  uint64_t v19 = __Block_byref_object_dispose__17;
  id v20 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C8E190;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E5C9C0D8;
  id v6 = v4;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  id v7 = (void *)MEMORY[0x1AD0C4F80](v11);
  if ([(id)v16[5] count])
  {
    historyStore = self->_historyStore;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E5C8C9F8;
    v9[4] = self;
    id v10 = v7;
    [(WBSHistoryStore *)historyStore clearHistoryWithCompletionHandler:v9];
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }

  _Block_object_dispose(&v15, 8);
}

void __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;
}

uint64_t __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  return [v2 _dispatchHistoryCleared:v3];
}

uint64_t __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAllVisitedLinks];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WBSHistory_vacuumHistoryWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5C8C9F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSHistory *)self performBlockAfterHistoryHasLoaded:v6];
}

uint64_t __49__WBSHistory_vacuumHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) vacuumHistoryWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)exportHistoryToFileWithURL:(id)a3 completionHandler:(id)a4
{
  v17[4] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v17[0] = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F97EC0]) initWithURL:v6 error:v17];
  id v9 = v17[0];
  id v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    historyStore = self->_historyStore;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke;
    v14[3] = &unk_1E5C9C100;
    id v16 = v7;
    id v15 = v8;
    [(WBSHistoryStore *)historyStore exportHistory:v15 completionHandler:v14];
  }
  else
  {
    id v12 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[WBSHistory exportHistoryToFileWithURL:completionHandler:]();
    }

    v7[2](v7);
  }
}

void __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke_cold_1();
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke_69;
    v6[3] = &unk_1E5C8D8B8;
    id v5 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v5 finishWithCompletionHandler:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke_69_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performMaintenance
{
}

- (void)performMaintenance:(id)a3
{
}

- (void)close
{
}

- (void)closeWithCompletionHandler:(id)a3
{
}

- (void)_waitUntilHistoryHasLoadedMainThread
{
  [(WBSHistory *)self _loadHistory];
  historyStore = self->_historyStore;
  [(WBSHistoryStore *)historyStore waitForLoadingToComplete];
}

- (void)savePendingChangesBeforeTerminationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  historyStore = self->_historyStore;
  id v6 = v4;
  if (historyStore) {
    [(WBSHistoryStore *)historyStore closeWithCompletionHandler:v4];
  }
  else {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)historyStore:(id)a3 didPrepareToDeleteWithDeletionPlan:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __62__WBSHistory_historyStore_didPrepareToDeleteWithDeletionPlan___block_invoke;
  v7[3] = &unk_1E5C8D980;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __62__WBSHistory_historyStore_didPrepareToDeleteWithDeletionPlan___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  __int16 v22 = [*(id *)(a1 + 32) discoveredItemsToDelete];
  if ([v22 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v2 = v22;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v28 != v4) {
            objc_enumerationMutation(v2);
          }
          id v6 = *(void **)(a1 + 40);
          id v7 = [*(id *)(*((void *)&v27 + 1) + 8 * i) urlString];
          id v8 = (id)[v6 _removeItemForURLString:v7];
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v3);
    }

    id v9 = *(void **)(a1 + 40);
    id v10 = [v2 allObjects];
    [v9 _dispatchHistoryItemsRemoved:v10];
  }
  [*(id *)(a1 + 32) allVisitsToDeleteByItemExcludingItemsBeingDeleted];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        id v16 = [v11 objectForKey:v15];
        uint64_t v17 = [*(id *)(a1 + 32) updatedLastVisitsByItem];
        id v18 = [v17 objectForKey:v15];

        if (v18)
        {
          uint64_t v19 = *(void **)(a1 + 40);
          id v20 = [v15 urlString];
          id v21 = [v19 itemForURLString:v20];
          LOBYTE(v19) = v21 == 0;

          if ((v19 & 1) == 0)
          {
            [*(id *)(a1 + 40) _dispatchHistoryItemWillChange:v15];
            [v15 removeVisits:v16 candidateLastVisit:v18];
            [*(id *)(a1 + 40) _dispatchHistoryItemDidChange:v15 byUserInitiatedAction:0];
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v12);
  }
}

void __42__WBSHistory__sendNotification_withItems___block_invoke_2(void *a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

- (void)_dispatchHistoryItemAdded:(id)a3 withVisitOrigin:(int64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  historyStore = self->_historyStore;
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(WBSHistoryStore *)historyStore itemsWereAdded:v8 byUserInitiatedAction:(unint64_t)(a4 - 4) < 0xFFFFFFFFFFFFFFFDLL];

  [(WBSHistory *)self _addVisitedLinkForItemIfNeeded:v6 withVisitOrigin:a4];
  id v10 = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [(WBSHistory *)self _sendNotification:@"WBSHistoryItemsWereAddedNotification" withItems:v9];
}

- (void)_dispatchHistoryItemWillChange:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(WBSHistory *)self _sendNotification:@"WBSHistoryItemWillChangeNotification" withItems:v5];
}

- (void)_dispatchHistoryItemDidChange:(id)a3 byUserInitiatedAction:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  historyStore = self->_historyStore;
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(WBSHistoryStore *)historyStore itemsWereModified:v8 byUserInitiatedAction:v4];

  id v10 = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [(WBSHistory *)self _sendNotification:@"WBSHistoryItemDidChangeNotification" withItems:v9];
}

- (void)_dispatchHistoryItemsRemoved:(id)a3
{
}

- (void)_dispatchHistoryCleared:(id)a3
{
}

- (void)_dispatchHistoryVisitAdded:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = @"WBSHistoryVisitKey";
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"WBSHistoryVisitWasAddedNotification" object:self userInfo:v6];
}

- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3
{
  return 0;
}

- (void)historyStoreWasCleared:(id)a3
{
}

- (void)historyStore:(id)a3 didAddVisits:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v25 + 1) + 8 * v11) item];
        uint64_t v13 = v12;
        if (v12)
        {
          id v14 = [v12 lastVisitOnSynchronizationQueue];
          BOOL v15 = v14 == 0;

          if (v15) {
            id v16 = v7;
          }
          else {
            id v16 = v6;
          }
          [v16 addObject:v13];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __40__WBSHistory_historyStore_didAddVisits___block_invoke;
  v20[3] = &unk_1E5C9B5C8;
  id v21 = v6;
  __int16 v22 = self;
  id v23 = v8;
  id v24 = v7;
  id v17 = v7;
  id v18 = v8;
  id v19 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

uint64_t __40__WBSHistory_historyStore_didAddVisits___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count]) {
    [a1[5] _sendNotification:@"WBSHistoryItemWillChangeNotification" withItems:a1[4]];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = a1[6];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "item", (void)v10);
        id v8 = v7;
        if (v7) {
          [v7 addExistingVisit:v6];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }

  if ([a1[4] count]) {
    [a1[5] _sendNotification:@"WBSHistoryItemDidChangeNotification" withItems:a1[4]];
  }
  uint64_t result = objc_msgSend(a1[7], "count", (void)v10);
  if (result) {
    return [a1[5] _sendNotification:@"WBSHistoryItemsWereAddedNotification" withItems:a1[7]];
  }
  return result;
}

- (void)historyStore:(id)a3 didRemoveVisits:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __43__WBSHistory_historyStore_didRemoveVisits___block_invoke;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __43__WBSHistory_historyStore_didRemoveVisits___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"WBSHistoryVisitsKey";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WBSHistoryVisitsWereRemovedFromDatabaseNotification" object:v4 userInfo:v5];
}

- (void)historyStore:(id)a3 didRemoveItems:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __42__WBSHistory_historyStore_didRemoveItems___block_invoke;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __42__WBSHistory_historyStore_didRemoveItems___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"WBSHistoryItemsKey";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"WBSHistoryItemsWereRemovedFromDatabaseNotification" object:v4 userInfo:v5];
}

- (void)historyStore:(id)a3 didRemoveHostnames:(id)a4
{
  id v5 = a4;
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"WBSHistoryDidRemoveHostnamesNotification" object:v5];
}

- (void)historyStore:(id)a3 didRemoveHighLevelDomains:(id)a4
{
  id v5 = a4;
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"WBSHistoryDidRemoveHighLevelDomainsNotification" object:v5];
}

- (id)historyStore:(id)a3 itemForURLString:(id)a4 createIfNeeded:(BOOL)a5
{
  id v5 = [(WBSHistory *)self itemForURLString:a4 createIfNeeded:a5];
  return v5;
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationBlock:(id)a6 completionHandler:(id)a7
{
}

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  waitUntilHistoryHasLoadedQueue = self->_waitUntilHistoryHasLoadedQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WBSHistory_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E5C8D730;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(waitUntilHistoryHasLoadedQueue, block);
}

uint64_t __72__WBSHistory_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 56) initializeCloudHistoryWithConfiguration:a1[5] completionHandler:a1[6]];
}

+ (void)clearExistingSharedHistory
{
  if (existingSharedHistory)
  {
    [*(id *)(existingSharedHistory + 56) closeWithCompletionHandler:0];
    id v2 = (void *)existingSharedHistory;
    existingSharedHistory = 0;
  }
}

- (void)_unload
{
  self->_hasStartedLoadingHistory = 0;
  dispatch_suspend((dispatch_object_t)self->_waitUntilHistoryHasLoadedQueue);
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__WBSHistory__unload__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  historyStore = self->_historyStore;
  self->_historyStore = 0;
}

uint64_t __21__WBSHistory__unload__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (id)_createHistoryStore
{
  return 0;
}

- (Class)_historyItemClass
{
  return (Class)objc_opt_class();
}

- (void)fetchHistoricalHighLevelDomainsWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __67__WBSHistory_fetchHistoricalHighLevelDomainsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C9C128;
  id v6 = v5;
  id v8 = v6;
  [(WBSHistory *)self enumerateItemsUsingBlock:v7];
  v4[2](v4, v6);
}

void __67__WBSHistory_fetchHistoricalHighLevelDomainsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 url];
  uint64_t v4 = [v3 host];
  objc_msgSend(v4, "safari_highLevelDomainFromHost");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (double)historyAgeLimit
{
  return self->_historyAgeLimit;
}

- (WBSHistoryTagMap)historyTagMap
{
  return self->_historyTagMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyTagMap, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_entryCreationThrottler, 0);
  objc_storeStrong((id *)&self->_historyStore, 0);
  objc_storeStrong((id *)&self->_waitUntilHistoryHasLoadedQueue, 0);
  objc_storeStrong((id *)&self->_stringsForUserTypedDomainExpansion, 0);
  objc_storeStrong((id *)&self->_entriesByURLString, 0);
  objc_storeStrong((id *)&self->_entriesByURLStringAccessQueue, 0);
}

- (void)_addItem:(uint64_t)a3 addToStringsForUserTypedDomainExpansions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_removeItemForURLString:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)itemVisitedAtURLString:(uint64_t)a3 title:(uint64_t)a4 timeOfVisit:(uint64_t)a5 wasHTTPNonGet:(uint64_t)a6 wasFailure:(uint64_t)a7 increaseVisitCount:(uint64_t)a8 statusCode:origin:attributes:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)itemRedirectedFrom:(os_log_t)log to:origin:date:statusCode:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Destination URL for redirect is nil: %@", (uint8_t *)&v1, 0xCu);
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Identifier: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Could not find or create a topic tag with error: %{public}@", v5);
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_63_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Identifier: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_63_cold_2()
{
  OUTLINED_FUNCTION_1_4();
  *(_DWORD *)uint64_t v1 = 134218242;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(void *)(v1 + 14) = v3;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Could not assign history item (%ld) to topic with error: %{public}@", v4, 0x16u);
}

- (void)exportHistoryToFileWithURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error creating history exporter: %{public}@", v5);
}

void __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error exporting history: %{public}@", v5);
}

void __59__WBSHistory_exportHistoryToFileWithURL_completionHandler___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1A6B5F000, v3, v4, "Error finishing history file: %{public}@", v5);
}

@end