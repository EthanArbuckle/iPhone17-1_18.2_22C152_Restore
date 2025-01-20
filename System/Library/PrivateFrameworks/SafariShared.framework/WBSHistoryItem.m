@interface WBSHistoryItem
+ (double)timeIntervalForDailyAndWeeklyVisitCountScores;
+ (id)synchronizationQueue;
+ (void)initialize;
- (BOOL)_visitsPendingWriteSetContains:(id)a3;
- (BOOL)lastVisitWasFailure;
- (BOOL)lastVisitWasHTTPNonGet;
- (NSArray)visits;
- (NSDate)lastVisitedDate;
- (NSSet)visitsPendingWriteToDataStoreOnSynchronizationQueue;
- (NSString)stringForUserTypedDomainExpansion;
- (NSString)title;
- (NSString)urlString;
- (NSString)userVisibleHostOrFallbackURLString;
- (NSString)userVisibleURLString;
- (NSURL)url;
- (WBSHistoryItem)endOfLastVisitRedirectChain;
- (WBSHistoryItem)initWithHistoryStreamedItem:(const _HistoryStreamedItem *)a3;
- (WBSHistoryItem)initWithSQLiteRow:(id)a3;
- (WBSHistoryItem)initWithURLString:(id)a3;
- (WBSHistoryItem)lastVisitRedirectDestinationItem;
- (WBSHistoryVisit)lastVisit;
- (WBSHistoryVisit)lastVisitOnSynchronizationQueue;
- (const)dailyVisitCountScoresPtrOnSynchronizationQueue;
- (const)weeklyVisitCountScoresPtrOnSynchronizationQueue;
- (double)lastVisitedTimeInterval;
- (double)lastVisitedTimeIntervalOnSynchronizationQueue;
- (id)_visitsPendingWriteSetCreatingIfNeeded:(BOOL)a3;
- (id)visitForTimeOnSynchronizationQueue:(double)a3;
- (int64_t)databaseID;
- (int64_t)statusCode;
- (unint64_t)dailyVisitCountScoresCountOnSynchronizationQueue;
- (unint64_t)weeklyVisitCountScoresCountOnSynchronizationQueue;
- (void)_addExistingVisit:(id)a3;
- (void)_addVisit:(id)a3;
- (void)_addVisitToPendingWriteSet:(id)a3;
- (void)addExistingVisit:(id)a3;
- (void)clearVisitsPendingWriteToDataStoreFromSynchronizationQueue;
- (void)dealloc;
- (void)mergeDataFromItem:(id)a3;
- (void)removeVisits:(id)a3 candidateLastVisit:(id)a4;
- (void)removeVisitsOnSynchronizationQueue:(id)a3 candidateLastVisit:(id)a4;
- (void)setDatabaseID:(int64_t)a3;
- (void)setLastVisitWasFailure:(BOOL)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)updateLastVisitIfNil:(id)a3;
- (void)updateWithServiceItem:(id)a3;
- (void)updateWithStreamedItem:(const _HistoryStreamedItem *)a3;
- (void)visitWasModified:(id)a3;
- (void)wasRedirectedFrom:(id)a3 to:(id)a4;
- (void)wasVisited:(id)a3;
@end

@implementation WBSHistoryItem

+ (id)synchronizationQueue
{
  return (id)WBSHistoryItemSynchronizationQueue;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryItem.Synchronization", 0);
    v3 = (void *)WBSHistoryItemSynchronizationQueue;
    WBSHistoryItemSynchronizationQueue = (uint64_t)v2;

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryItem.Cache", 0);
    v5 = (void *)WBSHistoryItemCacheQueue;
    WBSHistoryItemCacheQueue = (uint64_t)v4;
  }
}

+ (double)timeIntervalForDailyAndWeeklyVisitCountScores
{
  return 86400.0 * (double)0x31uLL;
}

- (WBSHistoryItem)initWithURLString:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryItem;
  v5 = [(WBSHistoryItem *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    visits = v5->_visits;
    v5->_visits = (NSMutableArray *)v6;

    uint64_t v8 = [v4 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (WBSHistoryItem)initWithSQLiteRow:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 stringAtIndex:1];
  uint64_t v6 = [(WBSHistoryItem *)self initWithURLString:v5];
  if (v6)
  {
    v6->_int64_t databaseID = [v4 int64AtIndex:0];
    v7 = objc_msgSend(v5, "safari_userVisibleURL");

    if (!v7)
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int64_t databaseID = v6->_databaseID;
        int v14 = 134217984;
        int64_t v15 = databaseID;
        _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Nil user-visible URL string found when loading history item with id %ld", (uint8_t *)&v14, 0xCu);
      }
    }
    v6->_statusCode = [v4 int64AtIndex:9];
    v10 = [[WBSHistoryVisit alloc] initWithHistoryItem:v6 sqliteRow:v4 baseColumnIndex:10];
    lastVisit = v6->_lastVisit;
    v6->_lastVisit = v10;

    objc_super v12 = v6;
  }

  return v6;
}

- (void)dealloc
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WBSHistoryItem_dealloc__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, block);
  v3.receiver = self;
  v3.super_class = (Class)WBSHistoryItem;
  [(WBSHistoryItem *)&v3 dealloc];
}

uint64_t __25__WBSHistoryItem_dealloc__block_invoke(uint64_t a1)
{
  return [(id)visitsPendingWriteTable removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_int64_t databaseID = a3;
}

- (NSString)title
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__WBSHistoryItem_title__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __23__WBSHistoryItem_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSURL)url
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__WBSHistoryItem_url__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemCacheQueue, block);
  return self->_url;
}

void __21__WBSHistoryItem_url__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 32))
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", *(void *)(v1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;
  }
}

- (NSString)userVisibleURLString
{
  uint64_t v2 = [(NSString *)self->_urlString safari_userVisibleURL];
  uint64_t v3 = objc_msgSend(v2, "safari_stringByFoldingWideCharactersAndNormalizing");

  return (NSString *)v3;
}

- (NSString)userVisibleHostOrFallbackURLString
{
  uint64_t v2 = [(WBSHistoryItem *)self url];
  uint64_t v3 = objc_msgSend(v2, "safari_userVisibleHostWithoutWWWSubdomain");
  if (![v3 length])
  {
    uint64_t v4 = objc_msgSend(v2, "safari_userVisibleString");

    uint64_t v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (WBSHistoryVisit)lastVisit
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__WBSHistoryItem_lastVisit__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (WBSHistoryVisit *)v2;
}

void __27__WBSHistoryItem_lastVisit__block_invoke(uint64_t a1)
{
}

- (WBSHistoryVisit)lastVisitOnSynchronizationQueue
{
  return self->_lastVisit;
}

- (double)lastVisitedTimeInterval
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__WBSHistoryItem_lastVisitedTimeInterval__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__WBSHistoryItem_lastVisitedTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) visitTime];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)lastVisitedTimeIntervalOnSynchronizationQueue
{
  [(WBSHistoryVisit *)self->_lastVisit visitTime];
  return result;
}

- (NSDate)lastVisitedDate
{
  double v2 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v3 = [(WBSHistoryItem *)self lastVisit];
  [v3 visitTime];
  uint64_t v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  return (NSDate *)v4;
}

- (BOOL)lastVisitWasFailure
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__WBSHistoryItem_lastVisitWasFailure__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __37__WBSHistoryItem_lastVisitWasFailure__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) loadWasSuccessful];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result ^ 1;
  return result;
}

- (void)setLastVisitWasFailure:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__WBSHistoryItem_setLastVisitWasFailure___block_invoke;
  v3[3] = &unk_1E5C8D4B0;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v3);
}

uint64_t __41__WBSHistoryItem_setLastVisitWasFailure___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setLoadSuccessful:*(unsigned char *)(a1 + 40) == 0];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  return [v2 _addVisitToPendingWriteSet:v3];
}

- (BOOL)lastVisitWasHTTPNonGet
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__WBSHistoryItem_lastVisitWasHTTPNonGet__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__WBSHistoryItem_lastVisitWasHTTPNonGet__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) wasHTTPNonGet];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)stringForUserTypedDomainExpansion
{
  char v2 = [(WBSHistoryItem *)self url];
  uint64_t v3 = [v2 host];

  if ((objc_msgSend(v3, "safari_hasCaseInsensitiveSuffix:", @".com") & 1) == 0)
  {
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", @"www.") & 1) == 0)
  {
    uint64_t v7 = [v3 length];
    uint64_t v5 = 0;
    uint64_t v4 = v7 - 4;
    goto LABEL_7;
  }
  if ([v3 caseInsensitiveCompare:@"www.com"])
  {
    uint64_t v4 = [v3 length] - 8;
    uint64_t v5 = 4;
LABEL_7:
    objc_msgSend(v3, "substringWithRange:", v5, v4);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v6 = @"www";
LABEL_8:

  return (NSString *)v6;
}

- (WBSHistoryItem)lastVisitRedirectDestinationItem
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__WBSHistoryItem_lastVisitRedirectDestinationItem__block_invoke;
  v4[3] = &unk_1E5C8E190;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (WBSHistoryItem *)v2;
}

void __50__WBSHistoryItem_lastVisitRedirectDestinationItem__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) redirectDestination];
  uint64_t v2 = [v5 item];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (WBSHistoryItem)endOfLastVisitRedirectChain
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__22;
  v9 = __Block_byref_object_dispose__22;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__WBSHistoryItem_endOfLastVisitRedirectChain__block_invoke;
  v4[3] = &unk_1E5C8E1B8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (WBSHistoryItem *)v2;
}

void __45__WBSHistoryItem_endOfLastVisitRedirectChain__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = (void *)v2[1];
  do
  {
    uint64_t v6 = [v5 endOfRedirectChain];

    uint64_t v7 = [v6 item];
    char v8 = v7;
    if (v7)
    {
      v9 = v7;

      id v2 = v9;
    }

    uint64_t v5 = (void *)v2[1];
    if (v6 == v5) {
      break;
    }
    uint64_t v4 = v6;
  }
  while (v3++ < 4);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v2;
  v13 = v2;
}

- (void)mergeDataFromItem:(id)a3
{
  uint64_t v4 = (WBSHistoryItem *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = WBSHistoryItemSynchronizationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__WBSHistoryItem_mergeDataFromItem___block_invoke;
    v7[3] = &unk_1E5C8D980;
    char v8 = v4;
    v9 = self;
    dispatch_sync(v6, v7);
  }
}

void __36__WBSHistoryItem_mergeDataFromItem___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) lastVisitOnSynchronizationQueue];
  [v2 visitTime];
  double v4 = v3;
  [*(id *)(*(void *)(a1 + 40) + 8) visitTime];
  double v6 = v5;

  if (v4 > v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) lastVisitOnSynchronizationQueue];
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = v7;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13++), "setItem:", *(void *)(a1 + 40), (void)v16);
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) addObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 24)];
  int v14 = [*(id *)(a1 + 32) _visitsPendingWriteSetCreatingIfNeeded:0];
  if (v14)
  {
    int64_t v15 = [*(id *)(a1 + 40) _visitsPendingWriteSetCreatingIfNeeded:1];
    [v15 unionSet:v14];
  }
}

- (void)wasVisited:(id)a3
{
  id v4 = a3;
  double v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__WBSHistoryItem_wasVisited___block_invoke;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __29__WBSHistoryItem_wasVisited___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wasVisitedOnSynchronizationQueue:*(void *)(a1 + 40)];
}

- (void)_addVisit:(id)a3
{
  id v4 = a3;
  -[WBSHistoryItem _addExistingVisit:](self, "_addExistingVisit:");
  [(WBSHistoryItem *)self _addVisitToPendingWriteSet:v4];
}

- (void)addExistingVisit:(id)a3
{
  id v4 = a3;
  double v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WBSHistoryItem_addExistingVisit___block_invoke;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __35__WBSHistoryItem_addExistingVisit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addExistingVisit:*(void *)(a1 + 40)];
}

- (void)_addExistingVisit:(id)a3
{
  p_lastVisit = &self->_lastVisit;
  if (!self->_lastVisit
    || ([a3 visitTime], double v7 = v6, -[WBSHistoryVisit visitTime](*p_lastVisit, "visitTime"), v7 >= v8))
  {
    objc_storeStrong((id *)p_lastVisit, a3);
  }
  visits = self->_visits;
  [(NSMutableArray *)visits addObject:a3];
}

- (void)wasRedirectedFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = WBSHistoryItemSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSHistoryItem_wasRedirectedFrom_to___block_invoke;
  block[3] = &unk_1E5C8D840;
  id v12 = v7;
  id v13 = v6;
  int v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __39__WBSHistoryItem_wasRedirectedFrom_to___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRedirectSource:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setRedirectDestination:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 _wasVisitedOnSynchronizationQueue:v3];
}

- (void)removeVisits:(id)a3 candidateLastVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = WBSHistoryItemSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSHistoryItem_removeVisits_candidateLastVisit___block_invoke;
  block[3] = &unk_1E5C8D840;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __50__WBSHistoryItem_removeVisits_candidateLastVisit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeVisitsOnSynchronizationQueue:*(void *)(a1 + 40) candidateLastVisit:*(void *)(a1 + 48)];
}

- (void)removeVisitsOnSynchronizationQueue:(id)a3 candidateLastVisit:(id)a4
{
  id v11 = a4;
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  double v8 = [(WBSHistoryItem *)self _visitsPendingWriteSetCreatingIfNeeded:0];
  [v8 minusSet:v7];
  if (![v8 count]) {
    [(WBSHistoryItem *)self clearVisitsPendingWriteToDataStoreFromSynchronizationQueue];
  }
  lastVisit = self->_lastVisit;
  p_lastVisit = &self->_lastVisit;
  if ([v7 containsObject:lastVisit]) {
    objc_storeStrong((id *)p_lastVisit, a4);
  }
}

- (void)visitWasModified:(id)a3
{
  id v4 = a3;
  double v5 = WBSHistoryItemSynchronizationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__WBSHistoryItem_visitWasModified___block_invoke;
  v7[3] = &unk_1E5C8D980;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __35__WBSHistoryItem_visitWasModified___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addVisitToPendingWriteSet:*(void *)(a1 + 40)];
}

- (id)visitForTimeOnSynchronizationQueue:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_visits;
  id v5 = (id)[(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "visitTime", (void)v11);
        if (v9 == a3)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_visitsPendingWriteSetCreatingIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(id)visitsPendingWriteTable objectForKey:self];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    id v7 = (void *)visitsPendingWriteTable;
    if (!visitsPendingWriteTable)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:1];
      double v9 = (void *)visitsPendingWriteTable;
      visitsPendingWriteTable = v8;

      id v7 = (void *)visitsPendingWriteTable;
    }
    [v7 setObject:v5 forKey:self];
  }
  return v5;
}

- (void)_addVisitToPendingWriteSet:(id)a3
{
  id v5 = a3;
  id v4 = [(WBSHistoryItem *)self _visitsPendingWriteSetCreatingIfNeeded:1];
  [v4 addObject:v5];
}

- (BOOL)_visitsPendingWriteSetContains:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSHistoryItem *)self _visitsPendingWriteSetCreatingIfNeeded:0];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)visitsPendingWriteToDataStoreOnSynchronizationQueue
{
  id v2 = [(WBSHistoryItem *)self _visitsPendingWriteSetCreatingIfNeeded:0];
  if (v2)
  {
    BOOL v3 = v2;
    id v4 = (void *)[v2 copy];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v4;
}

- (void)clearVisitsPendingWriteToDataStoreFromSynchronizationQueue
{
  [(id)visitsPendingWriteTable removeObjectForKey:self];
  if (![(id)visitsPendingWriteTable count])
  {
    id v2 = (void *)visitsPendingWriteTable;
    visitsPendingWriteTable = 0;
  }
}

- (void)updateWithServiceItem:(id)a3
{
  id v4 = a3;
  self->_int64_t databaseID = [v4 databaseID];
  self->_statusCode = [v4 statusCode];
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSArray)visits
{
  return &self->_visits->super;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (unint64_t)dailyVisitCountScoresCountOnSynchronizationQueue
{
  return self->_dailyVisitCountScoresCountOnSynchronizationQueue;
}

- (const)dailyVisitCountScoresPtrOnSynchronizationQueue
{
  return self->_dailyVisitCountScoresPtrOnSynchronizationQueue;
}

- (unint64_t)weeklyVisitCountScoresCountOnSynchronizationQueue
{
  return self->_weeklyVisitCountScoresCountOnSynchronizationQueue;
}

- (const)weeklyVisitCountScoresPtrOnSynchronizationQueue
{
  return self->_weeklyVisitCountScoresPtrOnSynchronizationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
}

- (WBSHistoryItem)initWithHistoryStreamedItem:(const _HistoryStreamedItem *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WBSHistoryItem;
  id v4 = [(WBSHistoryItem *)&v9 init];
  if (v4)
  {
    id v5 = [NSString stringWithUTF8String:a3->var6];
    char v6 = [(WBSHistoryItem *)v4 initWithURLString:v5];
    id v4 = v6;
    if (v6)
    {
      v6->_int64_t databaseID = a3->var1;
      v6->_statusCode = a3->var5;
      id v7 = v6;
    }
  }
  return v4;
}

- (void)updateWithStreamedItem:(const _HistoryStreamedItem *)a3
{
  int64_t var1 = a3->var1;
  int64_t var5 = a3->var5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSHistoryItem_HistoryStreamedItem__updateWithStreamedItem___block_invoke;
  block[3] = &unk_1E5C9C7C8;
  void block[4] = self;
  void block[5] = var1;
  block[6] = var5;
  dispatch_async((dispatch_queue_t)WBSHistoryItemSynchronizationQueue, block);
}

void *__62__WBSHistoryItem_HistoryStreamedItem__updateWithStreamedItem___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(void *)(v1 + 16))
  {
    *(void *)(v1 + 16) = result[5];
    uint64_t v1 = result[4];
  }
  *(void *)(v1 + 48) = result[6];
  return result;
}

- (void)updateLastVisitIfNil:(id)a3
{
  id v5 = a3;
  lastVisit = self->_lastVisit;
  p_lastVisit = &self->_lastVisit;
  if (!lastVisit)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_lastVisit, a3);
    id v5 = v8;
  }
}

@end