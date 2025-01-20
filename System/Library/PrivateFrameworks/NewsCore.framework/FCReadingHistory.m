@interface FCReadingHistory
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
+ (void)configureKeyValueStoreForJSONHandling:(id)a3;
+ (void)populateLocalStoreClassRegistry:(id)a3;
- (BOOL)canHelpPruneZoneName:(id)a3;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)hasArticleBeenConsumed:(id)a3;
- (BOOL)hasArticleBeenMarkedAsOffensive:(id)a3;
- (BOOL)hasArticleBeenRead:(id)a3;
- (BOOL)hasArticleBeenReadMoreThanThreshold:(id)a3;
- (BOOL)hasArticleBeenRemovedFromAudio:(id)a3;
- (BOOL)hasArticleBeenSeen:(id)a3;
- (BOOL)hasArticleBeenVisited:(id)a3;
- (BOOL)hasArticleCompletedListening:(id)a3;
- (BOOL)hasArticleCompletedReading:(id)a3;
- (BOOL)markArticle:(id)a3 withCompletedListening:(BOOL)a4;
- (BOOL)markArticle:(id)a3 withCompletedReading:(BOOL)a4;
- (BOOL)markArticle:(id)a3 withLikingStatus:(unint64_t)a4;
- (BOOL)markArticle:(id)a3 withRemovedFromAudio:(BOOL)a4;
- (BOOL)markArticleAsReadWithArticleID:(id)a3 articleVersion:(int64_t)a4 readDate:(id)a5;
- (BOOL)markArticleAsSeenWithHeadline:(id)a3;
- (BOOL)markArticleAsSeenWithHeadline:(id)a3 rememberForever:(BOOL)a4;
- (BOOL)toggleArticleHasBeenMarkedAsOffensive:(id)a3;
- (BOOL)toggleDislikeForArticleWithID:(id)a3;
- (BOOL)toggleLikeForArticleWithID:(id)a3;
- (FCReadingHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSArray)readingHistoryItems;
- (NSArray)sortedListenedArticleIDs;
- (NSArray)sortedVisitedArticleIDs;
- (NSDictionary)readingHistoryItemsByArticleID;
- (NSSet)allConsumedArticleIDs;
- (NSSet)allDislikedArticleIDs;
- (NSSet)allLikedArticleIDs;
- (NSSet)allReadArticleIDs;
- (NSSet)allSeenArticleIDs;
- (double)listeningProgressFor:(id)a3;
- (double)softMaxRecordAgeWhenMigratingZoneName:(id)a3;
- (id)_readingHistoryItemForArticleID:(uint64_t)a1;
- (id)_sortedReadingHistoryItemsWithMaxCount:(void *)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)consumedArticleIDsForTagID:(id)a3 fromTime:(id)a4;
- (id)firstSeenDateFor:(id)a3;
- (id)historyItemsByArticleIDForArticleIDs:(id)a3;
- (id)historyItemsForArticleIDs:(id)a3;
- (id)lastListenedFor:(id)a3;
- (id)lastVisitedDateForArticleID:(id)a3;
- (id)listeningProgressSavedDateFor:(id)a3;
- (id)localStoreMigrator;
- (id)markArticlesAsSeenWithHeadlines:(id)a3;
- (id)markArticlesAsSeenWithHeadlines:(int)a3 rememberForever:;
- (id)mostRecentlyCompletedListeningArticlesWithMaxCount:(unint64_t)a3;
- (id)mostRecentlyReadArticlesWithMaxCount:(unint64_t)a3;
- (id)pruneRecords:(id)a3 forZoneName:(id)a4;
- (id)readingPositionJSONFor:(id)a3;
- (id)readingPositionSavedDateFor:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (id)sortedVisitedArticleIDsSatisfying:(id)a3;
- (int64_t)listenedCountFor:(id)a3;
- (unint64_t)likingStatusForArticleID:(id)a3;
- (unint64_t)softMaxRecordCountWhenMigratingZoneName:(id)a3;
- (void)_addHistoryItems:(uint64_t)a1 addToStore:(void *)a2;
- (void)_cacheHistoryItemByArticleID:(uint64_t)a1;
- (void)_markArticle:(uint64_t)a3 withLikingStatus:;
- (void)_markArticleAsSeenWithArticleID:(int)a3 rememberForever:(uint64_t)a4 articleVersion:(void *)a5 historyItem:(uint64_t *)a6 modifiedHistoryFeaturesOut:;
- (void)_modifyHistoryForArticleID:(void *)a3 withBlock:;
- (void)addObserver:(id)a3;
- (void)clearHistory;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)markArticle:(id)a3 asArticleConsumed:(BOOL)a4 sourceChannelTagID:(id)a5;
- (void)markArticle:(id)a3 asOffensive:(BOOL)a4;
- (void)markArticle:(id)a3 withLastListened:(id)a4;
- (void)markArticle:(id)a3 withListeningProgress:(double)a4;
- (void)markArticle:(id)a3 withReadingPositionJSON:(id)a4;
- (void)markArticleAsReadWithHeadline:(id)a3;
- (void)markArticleAsReadWithHeadline:(id)a3 fromGroupType:(int64_t)a4 swipedToArticle:(BOOL)a5 onScreenChecker:(id)a6;
- (void)removeArticleFromHistory:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation FCReadingHistory

void __52__FCReadingHistory__readingHistoryItemForArticleID___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2) {
    v2 = (void *)v2[13];
  }
  uint64_t v3 = a1[5];
  v4 = v2;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v8 = (void *)a1[4];
    if (v8) {
      v8 = (void *)v8[12];
    }
    uint64_t v9 = a1[5];
    v10 = v8;
    v11 = FCHistoryItemIDFromArticleID(v9);
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = *(void *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = a1[4];
    v16 = *(void **)(*(void *)(a1[6] + 8) + 40);
    -[FCReadingHistory _cacheHistoryItemByArticleID:](v15, v16);
  }
}

- (void)_cacheHistoryItemByArticleID:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      uint64_t v5 = *(void **)(a1 + 112);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_2;
      v10[3] = &unk_1E5B4BE70;
      v10[4] = a1;
      id v11 = v4;
      [v5 performWriteSync:v10];
      uint64_t v6 = v11;
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_3;
      v7[3] = &unk_1E5B4BE70;
      id v8 = v4;
      uint64_t v9 = a1;
      dispatch_async(MEMORY[0x1E4F14428], v7);
      uint64_t v6 = v8;
    }
  }
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCReadingHistory;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

void __41__FCReadingHistory_allDislikedArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    objc_super v3 = *(void **)(v2 + 96);
  }
  else {
    objc_super v3 = 0;
  }
  v4 = objc_msgSend(v3, "allValues", (void)v12);
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 articleLikingStatus] == 2)
        {
          v10 = *(void **)(a1 + 40);
          id v11 = [v9 articleID];
          [v10 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __38__FCReadingHistory_allLikedArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    objc_super v3 = *(void **)(v2 + 96);
  }
  else {
    objc_super v3 = 0;
  }
  v4 = objc_msgSend(v3, "allValues", (void)v12);
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 articleLikingStatus] == 1)
        {
          v10 = *(void **)(a1 + 40);
          id v11 = [v9 articleID];
          [v10 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __39__FCReadingHistory_readingHistoryItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[12];
  }
  objc_super v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  else {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
}

- (id)localStoreMigrator
{
  uint64_t v2 = objc_alloc_init(FCReadingHistoryMigrator);
  return v2;
}

+ (void)populateLocalStoreClassRegistry:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class()];
}

+ (unint64_t)localStoreVersion
{
  return 9;
}

+ (id)localStoreFilename
{
  return @"history";
}

+ (void)configureKeyValueStoreForJSONHandling:(id)a3
{
}

+ (id)commandStoreFileName
{
  return @"history-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 0;
}

- (NSSet)allLikedArticleIDs
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__FCReadingHistory_allLikedArticleIDs__block_invoke;
  v9[3] = &unk_1E5B4BE70;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(FCMTWriterLock *)itemsLock performReadSync:v9];
  uint64_t v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

- (void)loadLocalCachesFromStore
{
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

- (BOOL)hasArticleBeenMarkedAsOffensive:(id)a3
{
  id v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleBeenMarkedOffensive];

  return v4;
}

- (unint64_t)likingStatusForArticleID:(id)a3
{
  id v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  unint64_t v4 = [v3 articleLikingStatus];

  return v4;
}

- (id)_readingHistoryItemForArticleID:(uint64_t)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x3032000000;
    long long v14 = __Block_byref_object_copy__1;
    long long v15 = __Block_byref_object_dispose__1;
    id v16 = 0;
    id v6 = *(id *)(a1 + 112);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__FCReadingHistory__readingHistoryItemForArticleID___block_invoke_2;
    v8[3] = &unk_1E5B4C230;
    id v10 = &v11;
    v8[4] = a1;
    id v9 = v4;
    [v6 performReadSync:v8];

    id v5 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  return v5;
}

void __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [*(id *)(a1 + 32) localStore];
  [v3 addAllEntriesToDictionary:v2];

  unint64_t v4 = [(id)objc_opt_class() internalLocalStoreKeys];
  id v5 = [v4 allObjects];
  [v2 removeObjectsForKeys:v5];

  if (([*(id *)(a1 + 32) isSyncingEnabled] & 1) == 0)
  {
    uint64_t v6 = [v2 count];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v7 = [v2 allValues];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke_2;
    v15[3] = &unk_1E5B4C460;
    v15[4] = *(void *)(a1 + 32);
    id v16 = v2;
    uint64_t v17 = &v18;
    FCVisitLocallyPrunableHistoryItems(v7, v15);

    if (v19[3])
    {
      id v8 = (id)FCPrivateDataLog;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (objc_class *)objc_opt_class();
        id v10 = NSStringFromClass(v9);
        uint64_t v11 = v19[3];
        *(_DWORD *)buf = 138543874;
        v23 = v10;
        __int16 v24 = 2048;
        uint64_t v25 = v11;
        __int16 v26 = 2048;
        uint64_t v27 = v6;
        _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ pruned %lu of %lu history items", buf, 0x20u);
      }
    }

    _Block_object_dispose(&v18, 8);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    objc_storeStrong((id *)(v12 + 96), v2);
  }
  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    objc_storeStrong((id *)(v14 + 104), v13);
  }
}

- (NSArray)sortedVisitedArticleIDs
{
  uint64_t v2 = -[FCReadingHistory _sortedReadingHistoryItemsWithMaxCount:](self, -1);
  id v3 = objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_53);

  return (NSArray *)v3;
}

- (id)_sortedReadingHistoryItemsWithMaxCount:(void *)a1
{
  if (a1)
  {
    unint64_t v4 = [a1 context];
    id v5 = [v4 bundleSubscriptionManager];
    uint64_t v6 = [v5 bundleSubscription];
    id v7 = objc_getAssociatedObject((id)v6, (const void *)(v6 + 1));
    uint64_t v8 = [v7 unsignedIntegerValue];
    char v9 = v8;
    id v10 = objc_getAssociatedObject((id)v6, (const void *)~v8);
    char v11 = [v10 unsignedIntegerValue] ^ v9;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke;
    aBlock[3] = &__block_descriptor_33_e40___NSDate_16__0___FCReadingHistoryItem__8l;
    char v24 = v11 & 1;
    uint64_t v12 = _Block_copy(aBlock);
    uint64_t v13 = [a1 readingHistoryItems];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_2;
    v21[3] = &__block_descriptor_33_e32_B16__0___FCReadingHistoryItem__8l;
    char v22 = v11 & 1;
    uint64_t v14 = objc_msgSend(v13, "fc_arrayOfObjectsPassingTest:", v21);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_3;
    v19[3] = &unk_1E5B4C580;
    id v20 = v12;
    id v15 = v12;
    id v16 = [v14 sortedArrayUsingComparator:v19];
    uint64_t v17 = objc_msgSend(v16, "fc_subarrayWithMaxCount:", a2);
  }
  else
  {
    uint64_t v17 = 0;
  }
  return v17;
}

- (NSArray)readingHistoryItems
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  unint64_t v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FCReadingHistory_readingHistoryItems__block_invoke;
  v7[3] = &unk_1E5B4C258;
  void v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSSet)allDislikedArticleIDs
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__FCReadingHistory_allDislikedArticleIDs__block_invoke;
  v9[3] = &unk_1E5B4BE70;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(FCMTWriterLock *)itemsLock performReadSync:v9];
  uint64_t v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

- (FCReadingHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FCReadingHistory;
  id v5 = [(FCPrivateDataController *)&v9 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;
  }
  return v5;
}

- (void)_addHistoryItems:(uint64_t)a1 addToStore:(void *)a2
{
  id v3 = a2;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v3)
  {
    unint64_t v4 = *(void **)(a1 + 112);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke;
    v5[3] = &unk_1E5B4C710;
    v5[4] = a1;
    char v7 = 1;
    id v6 = v3;
    [v4 performWriteSync:v5];
  }
}

void __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 localStore];
  id v6 = [v4 identifier];
  [v5 removeObjectForKey:v6];

  char v7 = (void *)a1[5];
  uint64_t v8 = [v4 identifier];

  [v7 removeObjectForKey:v8];
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v3 = (void *)[v2 initWithZoneName:@"ReadingHistory" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v7 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (([a1 isLocalStoreKeyInternal:v12] & 1) == 0)
        {
          id v13 = [v5 objectForKeyedSubscript:v12];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [[FCModifyHistoryCommand alloc] initWithHistoryItems:v6 merge:1];
  uint64_t v21 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];

  return v15;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  v134 = objc_opt_new();
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v163 objects:v173 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v164;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v164 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v163 + 1) + 8 * i);
        id v13 = [v12 recordType];
        int v14 = [v13 isEqualToString:@"ReadingHistoryItem"];

        if (v14) {
          [v134 addObject:v12];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v163 objects:v173 count:16];
    }
    while (v9);
  }

  v136 = objc_opt_new();
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  id v132 = v7;
  uint64_t v15 = [v132 countByEnumeratingWithState:&v159 objects:v172 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v160;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v160 != v17) {
          objc_enumerationMutation(v132);
        }
        long long v19 = *(void **)(*((void *)&v159 + 1) + 8 * v18);
        if (self) {
          itemsByIdentifier = self->_itemsByIdentifier;
        }
        else {
          itemsByIdentifier = 0;
        }
        uint64_t v21 = [(NSMutableDictionary *)itemsByIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v159 + 1) + 8 * v18)];
        char v22 = [v21 articleID];

        if (v22)
        {
          uint64_t v23 = [v21 articleID];
          [v136 addObject:v23];
        }
        char v24 = [v21 articleID];
        id v25 = v19;
        id v26 = v24;
        if (self)
        {
          [MEMORY[0x1E4F29060] isMainThread];
          if (!v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "itemID != nil");
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "-[FCReadingHistory _removeHistoryItemWithItemID:articleID:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "FCReadingHistory.m";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1632;
            *(_WORD *)&buf[28] = 2114;
            *(void *)&buf[30] = v28;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          itemsLocuint64_t k = self->_itemsLock;
          v174[0] = MEMORY[0x1E4F143A8];
          v174[1] = 3221225472;
          v174[2] = __59__FCReadingHistory__removeHistoryItemWithItemID_articleID___block_invoke;
          v174[3] = &unk_1E5B4C738;
          id v175 = v25;
          v176 = self;
          id v177 = v26;
          [(FCMTWriterLock *)itemsLock performWriteSync:v174];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v29 = [v132 countByEnumeratingWithState:&v159 objects:v172 count:16];
      uint64_t v16 = v29;
    }
    while (v29);
  }

  id v30 = v134;
  v124 = v30;
  id v125 = v136;
  if (self)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    id v129 = (id)objc_opt_new();
    id v127 = (id)objc_opt_new();
    v126 = objc_opt_new();
    v31 = objc_opt_new();
    memset(buf, 0, sizeof(buf));
    long long v179 = 0u;
    id v130 = v30;
    uint64_t v32 = [v130 countByEnumeratingWithState:buf objects:v174 count:16];
    v128 = v31;
    if (v32)
    {
      uint64_t v33 = v32;
      char v133 = 0;
      uint64_t v137 = **(void **)&buf[16];
      unint64_t v34 = 0x1E4F82000uLL;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (**(void **)&buf[16] != v137) {
            objc_enumerationMutation(v130);
          }
          id v36 = *(id *)(*(void *)&buf[8] + 8 * j);
          self;
          if (!v36 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v70 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "record != nil");
            *(_DWORD *)v180 = 136315906;
            *(void *)&v180[4] = "+[NTPBReadingHistoryItem(FCReadingHistory) readingHistoryItemWithCKRecord:]";
            *(_WORD *)&v180[12] = 2080;
            *(void *)&v180[14] = "FCReadingHistory.m";
            __int16 v181 = 1024;
            int v182 = 1742;
            __int16 v183 = 2114;
            v184 = v70;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v180, 0x26u);
          }
          unint64_t v37 = v34;
          id v38 = objc_alloc_init(*(Class *)(v34 + 2952));
          v39 = [v36 objectForKeyedSubscript:@"articleID"];
          [v38 setArticleID:v39];

          v40 = [v36 objectForKeyedSubscript:@"sourceChannelTagID"];
          [v38 setSourceChannelTagID:v40];

          v41 = [v36 objectForKeyedSubscript:@"deviceID"];
          [v38 setDeviceID:v41];

          v42 = [v36 objectForKeyedSubscript:@"lastVisited"];
          [v38 setLastVisitedAt:v42];

          v43 = [v36 objectForKeyedSubscript:@"articleRead"];
          objc_msgSend(v38, "setHasArticleBeenRead:", objc_msgSend(v43, "BOOLValue"));

          v44 = [v36 objectForKeyedSubscript:@"articleSeen"];
          objc_msgSend(v38, "setHasArticleBeenSeen:", objc_msgSend(v44, "BOOLValue"));

          v45 = [v36 objectForKeyedSubscript:@"articleConsumed"];
          objc_msgSend(v38, "setHasArticleBeenConsumed:", objc_msgSend(v45, "BOOLValue"));

          v46 = [v36 objectForKeyedSubscript:@"offensive"];
          objc_msgSend(v38, "setHasArticleBeenMarkedOffensive:", objc_msgSend(v46, "BOOLValue"));

          v47 = [v36 objectForKeyedSubscript:@"removedFromAudio"];
          objc_msgSend(v38, "setHasArticleBeenRemovedFromAudio:", objc_msgSend(v47, "BOOLValue"));

          v48 = [v36 objectForKeyedSubscript:@"completedListening"];
          objc_msgSend(v38, "setHasArticleCompletedListening:", objc_msgSend(v48, "BOOLValue"));

          v49 = [v36 objectForKeyedSubscript:@"completedReading"];
          objc_msgSend(v38, "setHasArticleCompletedReading:", objc_msgSend(v49, "BOOLValue"));

          v50 = [v36 objectForKeyedSubscript:@"listenedCount"];
          objc_msgSend(v38, "setListenedCount:", (int)objc_msgSend(v50, "intValue"));

          v51 = [v36 objectForKeyedSubscript:@"listeningProgress"];
          [v51 doubleValue];
          objc_msgSend(v38, "setListeningProgress:");

          v52 = [v36 objectForKeyedSubscript:@"listeningProgressLastSaved"];
          [v38 setListeningProgressSavedAt:v52];

          v53 = [v36 objectForKeyedSubscript:@"lastListened"];
          [v38 setLastListenedAt:v53];

          v54 = [v36 objectForKeyedSubscript:@"readingPosition"];
          [v38 setReadingPosition:v54];

          v55 = [v36 objectForKeyedSubscript:@"readingPositionLastSaved"];
          [v38 setReadingPositionSavedAt:v55];

          v56 = [v36 objectForKeyedSubscript:@"readCount"];
          objc_msgSend(v38, "setReadCount:", (int)objc_msgSend(v56, "intValue"));

          v57 = [v36 objectForKeyedSubscript:@"pruningDisabled"];
          objc_msgSend(v38, "setPruningDisabled:", objc_msgSend(v57, "BOOLValue"));

          v58 = [v36 objectForKeyedSubscript:@"liked"];
          int v59 = [v58 BOOLValue];

          if (v59) {
            [v38 setArticleLikingStatus:1];
          }
          v60 = [v36 objectForKeyedSubscript:@"disliked"];
          int v61 = [v60 BOOLValue];

          if (v61) {
            [v38 setArticleLikingStatus:2];
          }

          v62 = [v38 articleID];
          if (v62)
          {
            v63 = [(NSMutableDictionary *)self->_itemsByArticleID objectForKeyedSubscript:v62];
            v64 = v63;
            if (v63)
            {
              uint64_t v65 = [v63 lastVisitedAt];
              if (v65)
              {
                v66 = (void *)v65;
                v67 = [v38 lastVisitedAt];

                if (v67)
                {
                  char v68 = 0;
                }
                else
                {
                  [v126 addObject:v62];
                  char v68 = 1;
                }
                v31 = v128;
              }
              else
              {
                char v68 = 0;
              }
              v133 |= v68;
              v69 = v129;
            }
            else
            {
              v69 = v127;
            }
            [v69 addObject:v62];
            [v31 addObject:v38];
          }
          unint64_t v34 = v37;
        }
        uint64_t v33 = [v130 countByEnumeratingWithState:buf objects:v174 count:16];
      }
      while (v33);
    }
    else
    {
      char v133 = 0;
    }

    -[FCReadingHistory _addHistoryItems:addToStore:]((uint64_t)self, v31);
    int v71 = v133 & 1;
    v72 = [FCReadingHistorySyncResults alloc];
    if (v125) {
      id v73 = v125;
    }
    else {
      id v73 = (id)MEMORY[0x1E4F1CBF0];
    }
    v74 = [v126 arrayByAddingObjectsFromArray:v73];
    id v75 = v129;
    id v76 = v74;
    id v77 = v127;
    if (v72)
    {
      *(void *)v180 = v72;
      *(void *)&v180[8] = FCReadingHistorySyncResults;
      v78 = (id *)objc_msgSendSuper2((objc_super *)v180, sel_init);
      v79 = v78;
      if (v78)
      {
        objc_storeStrong(v78 + 1, v129);
        objc_storeStrong(v79 + 2, v74);
        objc_storeStrong(v79 + 3, v127);
      }
    }
    else
    {
      v79 = 0;
    }
  }
  else
  {
    int v71 = 0;
    v79 = 0;
  }

  if (v79) {
    id v80 = v79[1];
  }
  else {
    id v80 = 0;
  }
  id v81 = v80;
  [v81 arrayByAddingObjectsFromArray:v125];
  v138 = v135 = v81;
  if (v79) {
    id v82 = v79[3];
  }
  else {
    id v82 = 0;
  }
  id v83 = v82;
  if (v71 || [v125 count])
  {
    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    v84 = [(FCPrivateDataController *)self observers];
    v85 = (void *)[v84 copy];

    uint64_t v86 = [v85 countByEnumeratingWithState:&v155 objects:v171 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v156;
      do
      {
        uint64_t v89 = 0;
        do
        {
          if (*(void *)v156 != v88) {
            objc_enumerationMutation(v85);
          }
          v90 = *(void **)(*((void *)&v155 + 1) + 8 * v89);
          if (objc_opt_respondsToSelector())
          {
            if (v79) {
              id v91 = v79[2];
            }
            else {
              id v91 = 0;
            }
            [v90 readingHistory:self didRemoveArticlesWithIDs:v91];
          }
          ++v89;
        }
        while (v87 != v89);
        uint64_t v92 = [v85 countByEnumeratingWithState:&v155 objects:v171 count:16];
        uint64_t v87 = v92;
      }
      while (v92);
    }
  }
  if ([v83 count])
  {
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    v93 = [(FCPrivateDataController *)self observers];
    v94 = (void *)[v93 copy];

    uint64_t v95 = [v94 countByEnumeratingWithState:&v151 objects:v170 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v152;
      do
      {
        for (uint64_t k = 0; k != v96; ++k)
        {
          if (*(void *)v152 != v97) {
            objc_enumerationMutation(v94);
          }
          v99 = *(void **)(*((void *)&v151 + 1) + 8 * k);
          if (objc_opt_respondsToSelector()) {
            [v99 readingHistory:self didAddArticlesWithIDs:v83];
          }
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v151 objects:v170 count:16];
      }
      while (v96);
    }
  }
  if ([v138 count])
  {
    v100 = objc_opt_new();
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    id v101 = v138;
    uint64_t v102 = [v101 countByEnumeratingWithState:&v147 objects:v169 count:16];
    if (v102)
    {
      uint64_t v103 = v102;
      uint64_t v104 = *(void *)v148;
      do
      {
        for (uint64_t m = 0; m != v103; ++m)
        {
          if (*(void *)v148 != v104) {
            objc_enumerationMutation(v101);
          }
          [v100 setObject:&unk_1EF8D7488 forKeyedSubscript:*(void *)(*((void *)&v147 + 1) + 8 * m)];
        }
        uint64_t v103 = [v101 countByEnumeratingWithState:&v147 objects:v169 count:16];
      }
      while (v103);
    }

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v106 = [(FCPrivateDataController *)self observers];
    v107 = (void *)[v106 copy];

    uint64_t v108 = [v107 countByEnumeratingWithState:&v143 objects:v168 count:16];
    if (v108)
    {
      uint64_t v109 = v108;
      uint64_t v110 = *(void *)v144;
      do
      {
        for (uint64_t n = 0; n != v109; ++n)
        {
          if (*(void *)v144 != v110) {
            objc_enumerationMutation(v107);
          }
          v112 = *(void **)(*((void *)&v143 + 1) + 8 * n);
          if (objc_opt_respondsToSelector()) {
            [v112 readingHistory:self didChangeFeaturesForArticles:v100];
          }
        }
        uint64_t v109 = [v107 countByEnumeratingWithState:&v143 objects:v168 count:16];
      }
      while (v109);
    }
  }
  if ([v132 count])
  {
    v113 = [(FCPrivateDataController *)self context];
    v114 = [v113 personalizationData];
    [v114 markAsDirty];

    v115 = [(FCPrivateDataController *)self context];
    v116 = [v115 userEventHistory];
    [v116 markAsDirty];

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    v117 = [(FCPrivateDataController *)self observers];
    v118 = (void *)[v117 copy];

    uint64_t v119 = [v118 countByEnumeratingWithState:&v139 objects:v167 count:16];
    if (v119)
    {
      uint64_t v120 = v119;
      uint64_t v121 = *(void *)v140;
      do
      {
        for (iuint64_t i = 0; ii != v120; ++ii)
        {
          if (*(void *)v140 != v121) {
            objc_enumerationMutation(v118);
          }
          v123 = *(void **)(*((void *)&v139 + 1) + 8 * ii);
          if (objc_opt_respondsToSelector()) {
            [v123 readingHistoryLikelyClearedRemotely:self];
          }
        }
        uint64_t v120 = [v118 countByEnumeratingWithState:&v139 objects:v167 count:16];
      }
      while (v120);
    }
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    itemsByIdentifier = self->_itemsByIdentifier;
  }
  else {
    itemsByIdentifier = 0;
  }
  return (id)[(NSMutableDictionary *)itemsByIdentifier allKeys];
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCReadingHistory;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"ReadingHistory"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  objc_super v3 = [(FCReadingHistory *)self readingHistoryItems];
  id v4 = _FCPruneHistoryForUpload(v3, &__block_literal_global_105, &__block_literal_global_11_2);
  id v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_3);

  return v5;
}

uint64_t __48__FCReadingHistory_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)canHelpPruneZoneName:(id)a3
{
  return [a3 isEqualToString:@"ReadingHistory"];
}

- (id)pruneRecords:(id)a3 forZoneName:(id)a4
{
  return _FCPruneHistoryForUpload(a3, &__block_literal_global_14_0, &__block_literal_global_17_0);
}

- (double)softMaxRecordAgeWhenMigratingZoneName:(id)a3
{
  return 2419200.0;
}

- (unint64_t)softMaxRecordCountWhenMigratingZoneName:(id)a3
{
  return 1000;
}

- (id)historyItemsForArticleIDs:(id)a3
{
  objc_super v3 = [(FCReadingHistory *)self historyItemsByArticleIDForArticleIDs:a3];
  id v4 = [v3 allValues];

  return v4;
}

- (id)historyItemsByArticleIDForArticleIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__1;
    uint64_t v16 = __Block_byref_object_dispose__1;
    id v17 = 0;
    if (self) {
      itemsLocuint64_t k = self->_itemsLock;
    }
    else {
      itemsLocuint64_t k = 0;
    }
    id v6 = itemsLock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_42;
    v9[3] = &unk_1E5B4C4D0;
    v9[4] = self;
    id v10 = v4;
    char v11 = &v12;
    [(FCMTWriterLock *)v6 performReadSync:v9];

    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

void __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_42(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[13];
  }
  uint64_t v3 = a1[5];
  id v4 = v2;
  id v5 = objc_msgSend(v4, "fc_subdictionaryForKeys:", v3);

  uint64_t v6 = [v5 count];
  if (v6 == [(id)a1[5] count])
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
  }
  else
  {
    id v7 = (void *)a1[5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_2;
    v13[3] = &unk_1E5B4C4A8;
    id v8 = v5;
    uint64_t v9 = a1[4];
    id v14 = v8;
    uint64_t v15 = v9;
    uint64_t v10 = objc_msgSend(v7, "fc_dictionaryWithValueBlock:", v13);
    uint64_t v11 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

id __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v5 = *(void **)(a1 + 40);
    if (v5) {
      id v5 = (void *)v5[12];
    }
    uint64_t v6 = v5;
    id v7 = FCHistoryItemIDFromArticleID((uint64_t)v3);
    id v4 = [v6 objectForKeyedSubscript:v7];

    -[FCReadingHistory _cacheHistoryItemByArticleID:](*(void *)(a1 + 40), v4);
  }

  return v4;
}

- (id)mostRecentlyReadArticlesWithMaxCount:(unint64_t)a3
{
  return -[FCReadingHistory _sortedReadingHistoryItemsWithMaxCount:](self, a3);
}

- (id)mostRecentlyCompletedListeningArticlesWithMaxCount:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastListenedAt" ascending:0];
  if (self)
  {
    id v6 = &__block_literal_global_50;
    id v7 = v5;
    id v8 = [(FCReadingHistory *)self readingHistoryItems];
    uint64_t v9 = objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_50);

    v14[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

    uint64_t v11 = [v9 sortedArrayUsingDescriptors:v10];
    uint64_t v12 = objc_msgSend(v11, "fc_subarrayWithMaxCount:", a3);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __71__FCReadingHistory_mostRecentlyCompletedListeningArticlesWithMaxCount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasArticleCompletedListening];
}

uint64_t __43__FCReadingHistory_sortedVisitedArticleIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

- (id)sortedVisitedArticleIDsSatisfying:(id)a3
{
  id v4 = a3;
  id v5 = -[FCReadingHistory _sortedReadingHistoryItemsWithMaxCount:](self, -1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__FCReadingHistory_sortedVisitedArticleIDsSatisfying___block_invoke;
  v9[3] = &unk_1E5B4C4F8;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v9);

  return v7;
}

id __54__FCReadingHistory_sortedVisitedArticleIDsSatisfying___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    id v4 = [v3 articleID];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)sortedListenedArticleIDs
{
  id v2 = [(FCReadingHistory *)self readingHistoryItems];
  id v3 = objc_msgSend(v2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_55);
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_58];
  id v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_60);

  return (NSArray *)v5;
}

BOOL __44__FCReadingHistory_sortedListenedArticleIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 lastListenedAt];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __44__FCReadingHistory_sortedListenedArticleIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 lastListenedAt];
  id v6 = [v4 lastListenedAt];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __44__FCReadingHistory_sortedListenedArticleIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

id __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  id v5 = [v3 lastVisitedAt];
  if (v4)
  {
    id v6 = [v3 lastListenedAt];
    if (objc_msgSend(v5, "fc_isLaterThanOrEqualTo:", v6)) {
      [v3 lastVisitedAt];
    }
    else {
    uint64_t v7 = [v3 lastListenedAt];
    }

    id v5 = (void *)v7;
  }

  return v5;
}

BOOL __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = [v3 lastVisitedAt];
  id v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [v3 lastListenedAt];
      BOOL v7 = v8 != 0;
    }
  }
  else
  {
    BOOL v7 = v5 != 0;
  }

  return v7;
}

uint64_t __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  id v8 = v6(v5, a3);
  uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v10 = [v8 compare:v9];
  return v10;
}

- (NSSet)allReadArticleIDs
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    itemsLocuint64_t k = self->_itemsLock;
  }
  else {
    itemsLocuint64_t k = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__FCReadingHistory_allReadArticleIDs__block_invoke;
  v9[3] = &unk_1E5B4BE70;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(FCMTWriterLock *)itemsLock performReadSync:v9];
  id v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

void __37__FCReadingHistory_allReadArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 96);
  }
  else {
    id v3 = 0;
  }
  int v4 = objc_msgSend(v3, "allValues", (void)v12);
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 hasArticleBeenRead])
        {
          id v10 = *(void **)(a1 + 40);
          uint64_t v11 = [v9 articleID];
          [v10 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSSet)allSeenArticleIDs
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    itemsLocuint64_t k = self->_itemsLock;
  }
  else {
    itemsLocuint64_t k = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__FCReadingHistory_allSeenArticleIDs__block_invoke;
  v9[3] = &unk_1E5B4BE70;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(FCMTWriterLock *)itemsLock performReadSync:v9];
  uint64_t v6 = v10;
  uint64_t v7 = (NSSet *)v5;

  return v7;
}

void __37__FCReadingHistory_allSeenArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 96);
  }
  else {
    id v3 = 0;
  }
  int v4 = objc_msgSend(v3, "allValues", (void)v12);
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 hasArticleBeenSeen])
        {
          id v10 = *(void **)(a1 + 40);
          uint64_t v11 = [v9 articleID];
          [v10 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSSet)allConsumedArticleIDs
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self) {
    itemsLocuint64_t k = self->_itemsLock;
  }
  else {
    itemsLocuint64_t k = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__FCReadingHistory_allConsumedArticleIDs__block_invoke;
  v9[3] = &unk_1E5B4BE70;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(FCMTWriterLock *)itemsLock performReadSync:v9];
  uint64_t v6 = v10;
  uint64_t v7 = (NSSet *)v5;

  return v7;
}

void __41__FCReadingHistory_allConsumedArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 96);
  }
  else {
    id v3 = 0;
  }
  int v4 = objc_msgSend(v3, "allValues", (void)v12);
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 hasArticleBeenConsumed])
        {
          id v10 = *(void **)(a1 + 40);
          uint64_t v11 = [v9 articleID];
          [v10 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSDictionary)readingHistoryItemsByArticleID
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1;
  long long v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  if (self) {
    itemsLocuint64_t k = self->_itemsLock;
  }
  else {
    itemsLocuint64_t k = 0;
  }
  int v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__FCReadingHistory_readingHistoryItemsByArticleID__block_invoke;
  v7[3] = &unk_1E5B4C258;
  void v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __50__FCReadingHistory_readingHistoryItemsByArticleID__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[12];
  }
  uint64_t v6 = v2;
  uint64_t v3 = objc_msgSend(v6, "fc_dictionaryByTransformingKeysWithKeyAndValueBlock:", &__block_literal_global_67);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __50__FCReadingHistory_readingHistoryItemsByArticleID__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 articleID];
}

- (id)consumedArticleIDsForTagID:(id)a3 fromTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [(FCReadingHistory *)self readingHistoryItems];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__FCReadingHistory_consumedArticleIDsForTagID_fromTime___block_invoke;
  v16[3] = &unk_1E5B4C5C8;
  id v17 = v6;
  id v18 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  [v9 enumerateObjectsUsingBlock:v16];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

uint64_t __56__FCReadingHistory_consumedArticleIDsForTagID_fromTime___block_invoke(void *a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 hasArticleBeenConsumed];
  id v4 = v11;
  if (v3)
  {
    uint64_t v3 = [v11 sourceChannelTagID];
    id v4 = v11;
    if (v3)
    {
      id v5 = (void *)v3;
      id v6 = [v11 sourceChannelTagID];
      if ([v6 isEqualToString:a1[4]])
      {
        id v7 = [v11 lastVisitedAt];
        int v8 = objc_msgSend(v7, "fc_isLaterThan:", a1[5]);

        id v4 = v11;
        if (!v8) {
          goto LABEL_8;
        }
        uint64_t v9 = (void *)a1[6];
        id v5 = [v11 articleID];
        [v9 addObject:v5];
      }
      else
      {
      }
      id v4 = v11;
    }
  }
LABEL_8:
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)lastVisitedDateForArticleID:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  id v4 = [v3 lastVisitedAt];

  return v4;
}

- (BOOL)hasArticleBeenRead:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleBeenRead];

  return v4;
}

- (BOOL)hasArticleBeenReadMoreThanThreshold:(id)a3
{
  char v4 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  uint64_t v5 = [v4 readCount];
  id v6 = [(FCPrivateDataController *)self context];
  id v7 = [v6 appConfigurationManager];
  int v8 = [v7 appConfiguration];
  LOBYTE(v5) = v5 > [v8 articleReadCountThreshold];

  return v5;
}

- (BOOL)hasArticleBeenVisited:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 lastVisitedAt];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)hasArticleBeenSeen:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleBeenSeen];

  return v4;
}

- (BOOL)markArticleAsSeenWithHeadline:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v10 = a3;
  char v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v10 count:1];

  id v7 = -[FCReadingHistory markArticlesAsSeenWithHeadlines:rememberForever:](self, v6, 0);
  BOOL v8 = objc_msgSend(v7, "count", v10, v11) != 0;

  return v8;
}

- (id)markArticlesAsSeenWithHeadlines:(int)a3 rememberForever:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    id v38 = 0;
    goto LABEL_36;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  id v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = [MEMORY[0x1E4F1CA48] array];
  v40 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v36 = v5;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v6) {
    goto LABEL_24;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v47;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v47 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
      uint64_t v11 = [v10 articleID];
      id v12 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)a1, v11);
      id v13 = (id)[v12 mutableCopyWithZone:0];

      if (!v13)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F82B88]);
        id v14 = [v10 articleID];
        [v13 setArticleID:v14];
      }
      uint64_t v45 = 0;
      id v15 = v10;
      id v16 = v13;
      if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        char v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "headline");
        *(_DWORD *)buf = 136315906;
        v53 = "-[FCReadingHistory _markArticleAsSeenWithHeadline:rememberForever:historyItem:modifiedHistoryFeaturesOut:]";
        __int16 v54 = 2080;
        v55 = "FCReadingHistory.m";
        __int16 v56 = 1024;
        int v57 = 917;
        __int16 v58 = 2114;
        int v59 = v24;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        if (v16) {
          goto LABEL_14;
        }
      }
      else if (v16)
      {
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item");
        *(_DWORD *)buf = 136315906;
        v53 = "-[FCReadingHistory _markArticleAsSeenWithHeadline:rememberForever:historyItem:modifiedHistoryFeaturesOut:]";
        __int16 v54 = 2080;
        v55 = "FCReadingHistory.m";
        __int16 v56 = 1024;
        int v57 = 918;
        __int16 v58 = 2114;
        int v59 = v25;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
LABEL_14:
      id v17 = [v15 articleID];
      id v18 = [v16 articleID];
      char v19 = [v17 isEqualToString:v18];

      if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "[headline.articleID isEqualToString:item.articleID]");
        *(_DWORD *)buf = 136315906;
        v53 = "-[FCReadingHistory _markArticleAsSeenWithHeadline:rememberForever:historyItem:modifiedHistoryFeaturesOut:]";
        __int16 v54 = 2080;
        v55 = "FCReadingHistory.m";
        __int16 v56 = 1024;
        int v57 = 919;
        __int16 v58 = 2114;
        int v59 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      long long v20 = [v15 articleID];
      -[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]((uint64_t)a1, v20, a3, [v15 publisherArticleVersion], v16, &v45);

      if (v45)
      {
        [v38 addObject:v15];
        [v39 addObject:v16];
        uint64_t v21 = [NSNumber numberWithUnsignedInteger:v45];
        char v22 = [v15 articleID];
        [v40 setObject:v21 forKey:v22];
      }
      ++v9;
    }
    while (v7 != v9);
    uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    uint64_t v7 = v26;
  }
  while (v26);
LABEL_24:

  -[FCReadingHistory _addHistoryItems:addToStore:]((uint64_t)a1, v39);
  uint64_t v27 = [[FCModifyHistoryCommand alloc] initWithHistoryItems:v39 merge:0];
  [a1 addCommandToCommandQueue:v27];
  if ([v40 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v28 = [a1 observers];
    uint64_t v29 = (void *)[v28 copy];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v29);
          }
          unint64_t v34 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v34 readingHistory:a1 didChangeFeaturesForArticles:v40];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v31);
    }
  }
  id v5 = v36;
LABEL_36:

  return v38;
}

- (BOOL)markArticleAsSeenWithHeadline:(id)a3 rememberForever:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id v12 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v12 count:1];

  uint64_t v9 = -[FCReadingHistory markArticlesAsSeenWithHeadlines:rememberForever:](self, v8, v4);
  BOOL v10 = objc_msgSend(v9, "count", v12, v13) != 0;

  return v10;
}

- (id)markArticlesAsSeenWithHeadlines:(id)a3
{
  return -[FCReadingHistory markArticlesAsSeenWithHeadlines:rememberForever:](self, a3, 0);
}

- (BOOL)hasArticleCompletedListening:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleCompletedListening];

  return v4;
}

- (BOOL)markArticle:(id)a3 withCompletedListening:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  int v7 = [(FCReadingHistory *)self hasArticleCompletedListening:v6] ^ v4;
  if (v7 == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__FCReadingHistory_markArticle_withCompletedListening___block_invoke;
    v9[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    BOOL v10 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7;
}

void __55__FCReadingHistory_markArticle_withCompletedListening___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [v7 hasArticleCompletedListening];
  int v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    [v7 setHasArticleCompletedListening:v6 != 0];
    *a3 = 0x2000;
  }
}

- (void)_modifyHistoryForArticleID:(void *)a3 withBlock:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void (**)(void, void, void))v6;
  if (!a1) {
    goto LABEL_24;
  }
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCReadingHistory _modifyHistoryForArticleID:withBlock:]";
      __int16 v37 = 2080;
      id v38 = "FCReadingHistory.m";
      __int16 v39 = 1024;
      int v40 = 1526;
      __int16 v41 = 2114;
      long long v42 = v23;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    if (v7) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (!v6)
  {
LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "modifyBlock != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCReadingHistory _modifyHistoryForArticleID:withBlock:]";
      __int16 v37 = 2080;
      id v38 = "FCReadingHistory.m";
      __int16 v39 = 1024;
      int v40 = 1527;
      __int16 v41 = 2114;
      long long v42 = v24;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
LABEL_23:
    [MEMORY[0x1E4F29060] isMainThread];
    goto LABEL_24;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)a1, v5);
  id v9 = (id)[v8 mutableCopyWithZone:0];

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F82B88]);
    [v9 setArticleID:v5];
  }
  *(void *)buf = 0;
  ((void (**)(void, id, unsigned char *))v7)[2](v7, v9, buf);
  id v35 = v9;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  -[FCReadingHistory _addHistoryItems:addToStore:]((uint64_t)a1, v10);

  uint64_t v11 = [FCModifyHistoryCommand alloc];
  id v34 = v9;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  uint64_t v13 = [(FCModifyHistoryCommand *)v11 initWithHistoryItems:v12 merge:0];

  [a1 addCommandToCommandQueue:v13];
  if (*(void *)buf)
  {
    id v25 = v7;
    id v26 = v5;
    id v32 = v5;
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v33 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = [a1 observers];
    id v17 = (void *)[v16 copy];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          char v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v22 readingHistory:a1 didChangeFeaturesForArticles:v15];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v19);
    }

    id v7 = v25;
    id v5 = v26;
  }

LABEL_24:
}

- (BOOL)hasArticleCompletedReading:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleCompletedReading];

  return v4;
}

- (BOOL)markArticle:(id)a3 withCompletedReading:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  int v7 = [(FCReadingHistory *)self hasArticleCompletedReading:v6] ^ v4;
  if (v7 == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__FCReadingHistory_markArticle_withCompletedReading___block_invoke;
    v9[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    BOOL v10 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7;
}

void __53__FCReadingHistory_markArticle_withCompletedReading___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [v7 hasArticleCompletedReading];
  int v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    [v7 setHasArticleCompletedReading:v6 != 0];
    *a3 = 0x10000;
  }
}

- (BOOL)hasArticleBeenRemovedFromAudio:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleBeenRemovedFromAudio];

  return v4;
}

- (BOOL)markArticle:(id)a3 withRemovedFromAudio:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  int v7 = [(FCReadingHistory *)self hasArticleBeenRemovedFromAudio:v6] ^ v4;
  if (v7 == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__FCReadingHistory_markArticle_withRemovedFromAudio___block_invoke;
    v9[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    BOOL v10 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7;
}

void __53__FCReadingHistory_markArticle_withRemovedFromAudio___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [v7 hasArticleBeenRemovedFromAudio];
  int v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    [v7 setHasArticleBeenRemovedFromAudio:v6 != 0];
    *a3 = 0x20000;
  }
}

- (void)_markArticleAsSeenWithArticleID:(int)a3 rememberForever:(uint64_t)a4 articleVersion:(void *)a5 historyItem:(uint64_t *)a6 modifiedHistoryFeaturesOut:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (!a1) {
    goto LABEL_22;
  }
  id v12 = (void *)MEMORY[0x1E4F29060];
  id v13 = a2;
  [v12 isMainThread];
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID");
    *(_DWORD *)buf = 136315906;
    char v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    __int16 v25 = 2080;
    id v26 = "FCReadingHistory.m";
    __int16 v27 = 1024;
    int v28 = 936;
    __int16 v29 = 2114;
    long long v30 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11) {
      goto LABEL_7;
    }
  }
  else if (v11)
  {
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "item");
    *(_DWORD *)buf = 136315906;
    char v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    __int16 v25 = 2080;
    id v26 = "FCReadingHistory.m";
    __int16 v27 = 1024;
    int v28 = 937;
    __int16 v29 = 2114;
    long long v30 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_7:
  id v14 = [v11 articleID];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "[articleID isEqualToString:item.articleID]");
    *(_DWORD *)buf = 136315906;
    char v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    __int16 v25 = 2080;
    id v26 = "FCReadingHistory.m";
    __int16 v27 = 1024;
    int v28 = 938;
    __int16 v29 = 2114;
    long long v30 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (a6) {
      goto LABEL_12;
    }
  }
  else if (a6)
  {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "modifiedHistoryFeaturesOut");
    *(_DWORD *)buf = 136315906;
    char v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    __int16 v25 = 2080;
    id v26 = "FCReadingHistory.m";
    __int16 v27 = 1024;
    int v28 = 939;
    __int16 v29 = 2114;
    long long v30 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_12:
  int v16 = [v11 hasArticleBeenSeen];
  id v17 = [MEMORY[0x1E4F1C9C8] date];
  if ((v16 & 1) == 0)
  {
    [v11 setHasArticleBeenSeen:1];
    [v11 setFirstSeenAt:v17];
    uint64_t v18 = 9;
    if (!a3) {
      goto LABEL_18;
    }
LABEL_16:
    if (([v11 isPruningDisabled] & 1) == 0)
    {
      [v11 setPruningDisabled:1];
      v18 |= 0x8000uLL;
    }
    goto LABEL_18;
  }
  uint64_t v18 = 0;
  if (a3) {
    goto LABEL_16;
  }
LABEL_18:
  if (!v16 || [v11 maxVersionSeen] < a4)
  {
    [v11 setMaxVersionSeen:a4];
    [v11 setFirstSeenAtOfMaxVersionSeen:v17];
    v18 |= 0x90uLL;
  }
  *a6 = v18;

LABEL_22:
}

- (BOOL)markArticle:(id)a3 withLikingStatus:(unint64_t)a4
{
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  unint64_t v7 = [(FCReadingHistory *)self likingStatusForArticleID:v6];
  if (v7 != a4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__FCReadingHistory_markArticle_withLikingStatus___block_invoke;
    v9[3] = &__block_descriptor_40_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    void v9[4] = a4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7 != a4;
}

void __49__FCReadingHistory_markArticle_withLikingStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([v5 articleLikingStatus] != *(void *)(a1 + 32))
  {
    objc_msgSend(v5, "setArticleLikingStatus:");
    *a3 = 32;
  }
}

- (void)_markArticle:(uint64_t)a3 withLikingStatus:
{
  if (a1)
  {
    id v5 = (void *)MEMORY[0x1E4F29060];
    id v6 = a2;
    [v5 isMainThread];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__FCReadingHistory__markArticle_withLikingStatus___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    void v7[4] = a3;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](a1, v6, v7);
  }
}

uint64_t __50__FCReadingHistory__markArticle_withLikingStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a2 setArticleLikingStatus:*(void *)(a1 + 32)];
  *a3 = 32;
  return result;
}

- (BOOL)toggleLikeForArticleWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPrivateDataController *)self context];
  id v6 = [v5 appConfigurationManager];
  unint64_t v7 = [v6 appConfiguration];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    goto LABEL_9;
  }
  id v9 = [(FCPrivateDataController *)self context];
  BOOL v10 = [v9 appConfigurationManager];
  id v11 = [v10 appConfiguration];
  uint64_t v12 = [v11 likeDislikeBehavior];

  if (v12 == 2) {
    goto LABEL_7;
  }
  if (v12 != 1)
  {
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  unint64_t v13 = [(FCReadingHistory *)self likingStatusForArticleID:v4];
  if (v13 == 2) {
    goto LABEL_7;
  }
  BOOL v14 = 0;
  if (v13 == 1)
  {
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  if (!v13)
  {
LABEL_7:
    uint64_t v15 = 1;
    BOOL v14 = 1;
LABEL_8:
    -[FCReadingHistory _markArticle:withLikingStatus:](self, v4, v15);
  }
LABEL_10:

  return v14;
}

- (BOOL)toggleDislikeForArticleWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPrivateDataController *)self context];
  id v6 = [v5 appConfigurationManager];
  unint64_t v7 = [v6 appConfiguration];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    goto LABEL_6;
  }
  id v9 = [(FCPrivateDataController *)self context];
  BOOL v10 = [v9 appConfigurationManager];
  id v11 = [v10 appConfiguration];
  uint64_t v12 = [v11 likeDislikeBehavior];

  if (v12 == 2)
  {
    BOOL v14 = 1;
    goto LABEL_10;
  }
  if (v12 == 1)
  {
    unint64_t v13 = [(FCReadingHistory *)self likingStatusForArticleID:v4];
    if (v13 < 2)
    {
      BOOL v14 = 1;
      uint64_t v12 = 2;
LABEL_10:
      -[FCReadingHistory _markArticle:withLikingStatus:](self, v4, v12);
      goto LABEL_11;
    }
    BOOL v14 = 0;
    if (v13 == 2)
    {
      uint64_t v12 = 0;
      goto LABEL_10;
    }
  }
  else
  {
LABEL_6:
    BOOL v14 = 0;
  }
LABEL_11:

  return v14;
}

- (BOOL)toggleArticleHasBeenMarkedAsOffensive:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FCReadingHistory *)self hasArticleBeenMarkedAsOffensive:v4] ^ 1;
  [(FCReadingHistory *)self markArticle:v4 asOffensive:v5];

  return v5;
}

- (void)markArticle:(id)a3 asOffensive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if ([(FCReadingHistory *)self hasArticleBeenMarkedAsOffensive:v6] != v4)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__FCReadingHistory_markArticle_asOffensive___block_invoke;
    v19[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    BOOL v20 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v19);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v7 = [(FCPrivateDataController *)self observers];
    char v8 = (void *)[v7 copy];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector())
          {
            id v21 = v6;
            BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
            [v13 readingHistory:self didChangeOffensiveStateForArticlesWithIDs:v14];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v10);
    }
  }
}

void __44__FCReadingHistory_markArticle_asOffensive___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  int v5 = [v7 hasArticleBeenMarkedOffensive];
  int v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    [v7 setHasArticleBeenMarkedOffensive:v6 != 0];
    *a3 = 512;
  }
}

- (BOOL)hasArticleBeenConsumed:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  char v4 = [v3 hasArticleBeenConsumed];

  return v4;
}

- (void)markArticle:(id)a3 asArticleConsumed:(BOOL)a4 sourceChannelTagID:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x1E4F29060] isMainThread];
  if ([(FCReadingHistory *)self hasArticleBeenConsumed:v8] != v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__FCReadingHistory_markArticle_asArticleConsumed_sourceChannelTagID___block_invoke;
    v10[3] = &unk_1E5B4C630;
    BOOL v12 = v6;
    id v11 = v9;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v8, v10);
  }
}

void __69__FCReadingHistory_markArticle_asArticleConsumed_sourceChannelTagID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  int v5 = [v8 hasArticleBeenConsumed];
  int v6 = *(unsigned __int8 *)(a1 + 40);
  if (v6 != v5)
  {
    [v8 setHasArticleBeenConsumed:v6 != 0];
    if (*(void *)(a1 + 32))
    {
      id v7 = FCDeviceIdentifierForVendor();
      [v8 setDeviceID:v7];
      [v8 setSourceChannelTagID:*(void *)(a1 + 32)];
    }
    *a3 = 256;
  }
}

- (BOOL)markArticleAsReadWithArticleID:(id)a3 articleVersion:(int64_t)a4 readDate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__FCReadingHistory_markArticleAsReadWithArticleID_articleVersion_readDate___block_invoke;
  v13[3] = &unk_1E5B4C658;
  id v10 = v9;
  int64_t v18 = a4;
  id v14 = v10;
  long long v15 = self;
  id v11 = v8;
  id v16 = v11;
  long long v17 = &v19;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v11, v13);
  LOBYTE(self) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

void __75__FCReadingHistory_markArticleAsReadWithArticleID_articleVersion_readDate___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v7 = a2;
  [v7 setLastVisitedAt:*(void *)(a1 + 32)];
  char v5 = [v7 hasArticleBeenRead];
  if (v5)
  {
    uint64_t v6 = 4;
  }
  else
  {
    [v7 setHasArticleBeenRead:1];
    uint64_t v6 = 6;
  }
  if ([v7 maxVersionRead] < *(void *)(a1 + 64))
  {
    objc_msgSend(v7, "setMaxVersionRead:");
    v6 |= 0x40uLL;
  }
  objc_msgSend(v7, "setReadCount:", objc_msgSend(v7, "readCount") + 1);
  -[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:](*(void *)(a1 + 40), *(void **)(a1 + 48), 0, *(void *)(a1 + 64), v7, a3);
  *a3 = v6 | 0x4000;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5 ^ 1;
}

- (void)markArticleAsReadWithHeadline:(id)a3 fromGroupType:(int64_t)a4 swipedToArticle:(BOOL)a5 onScreenChecker:(id)a6
{
  BOOL v30 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  id v10 = v8;
  id v31 = v9;
  id v11 = [v8 articleID];
  if (v11)
  {
    BOOL v12 = [v8 articleID];
    uint64_t v13 = [v8 publisherArticleVersion];
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    LODWORD(v13) = [(FCReadingHistory *)self markArticleAsReadWithArticleID:v12 articleVersion:v13 readDate:v14];

    if (v13)
    {
      __int16 v27 = v11;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v15 = [(FCPrivateDataController *)self observers];
      id v28 = v8;
      uint64_t v16 = [v15 copy];

      long long v17 = (void *)v16;
      int64_t v18 = (void *)v16;
      id v10 = v28;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v17);
            }
            uint64_t v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v23 readingHistory:self didAddHeadline:v10 fromGroupType:a4 swipedToArticle:v30 withOnScreenChecker:v31];
            }
            if (objc_opt_respondsToSelector())
            {
              char v24 = [v10 articleID];
              id v36 = v24;
              __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
              [v23 readingHistory:self didAddArticlesWithIDs:v25];

              id v10 = v28;
            }
          }
          uint64_t v20 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v20);
      }

      id v11 = v27;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "articleID");
    *(_DWORD *)buf = 136315906;
    __int16 v39 = "-[FCReadingHistory markArticleAsReadWithHeadline:fromGroupType:swipedToArticle:onScreenChecker:]";
    __int16 v40 = 2080;
    __int16 v41 = "FCReadingHistory.m";
    __int16 v42 = 1024;
    int v43 = 1215;
    __int16 v44 = 2114;
    uint64_t v45 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (void)markArticleAsReadWithHeadline:(id)a3
{
}

- (void)removeArticleFromHistory:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID");
    *(_DWORD *)buf = 136315906;
    char v22 = "-[FCReadingHistory removeArticleFromHistory:]";
    __int16 v23 = 2080;
    char v24 = "FCReadingHistory.m";
    __int16 v25 = 1024;
    int v26 = 1248;
    __int16 v27 = 2114;
    id v28 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  char v5 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, v4);

  if (v5)
  {
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v4, &__block_literal_global_104);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = [(FCPrivateDataController *)self observers];
    id v7 = (void *)[v6 copy];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (v4)
          {
            BOOL v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector())
            {
              id v19 = v4;
              uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
              [v12 readingHistory:self didRemoveArticlesWithIDs:v13];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

void __45__FCReadingHistory_removeArticleFromHistory___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v4 = a2;
  char v5 = (void *)MEMORY[0x1E4FBA8A8];
  id v13 = v4;
  uint64_t v6 = [v4 lastVisitedAt];
  LOBYTE(v5) = objc_msgSend(v5, "nf_object:isEqualToObject:", v6, 0);

  uint64_t v7 = 0;
  if ((v5 & 1) == 0)
  {
    [v13 setLastVisitedAt:0];
    uint64_t v7 = 4;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v9 = [v13 readingPosition];
  LOBYTE(v8) = objc_msgSend(v8, "nf_object:isEqualToObject:", v9, 0);

  if ((v8 & 1) == 0)
  {
    [v13 setReadingPosition:0];
    v7 |= 0x1000uLL;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v11 = [v13 lastListenedAt];
  LOBYTE(v10) = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, 0);

  if ((v10 & 1) == 0)
  {
    [v13 setLastListenedAt:0];
    v7 |= 0x800uLL;
  }
  [v13 listeningProgress];
  if (v12 != 0.0)
  {
    [v13 setListeningProgress:0.0];
    v7 |= 0x400uLL;
  }
  if ([v13 hasArticleBeenRead])
  {
    [v13 setHasArticleBeenRead:0];
    v7 |= 2uLL;
  }
  if ([v13 hasArticleBeenSeen])
  {
    [v13 setHasArticleBeenSeen:0];
    v7 |= 1uLL;
  }
  if ([v13 hasArticleCompletedListening])
  {
    [v13 setHasArticleCompletedListening:0];
    v7 |= 0x2000uLL;
  }
  if ([v13 hasArticleCompletedReading])
  {
    [v13 setHasArticleCompletedReading:0];
    v7 |= 0x10000uLL;
  }
  if ([v13 hasArticleBeenRemovedFromAudio])
  {
    [v13 setHasArticleBeenRemovedFromAudio:0];
    v7 |= 0x20000uLL;
  }
  *a3 = v7;
}

- (void)clearHistory
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    itemsByIdentifier = self->_itemsByIdentifier;
  }
  else {
    itemsByIdentifier = 0;
  }
  id v4 = [(NSMutableDictionary *)itemsByIdentifier allKeys];
  if ([v4 count])
  {
    if (self) {
      char v5 = self->_itemsByIdentifier;
    }
    else {
      char v5 = 0;
    }
    uint64_t v6 = [(NSMutableDictionary *)v5 allValues];
    uint64_t v7 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_108);

    uint64_t v8 = [(FCPrivateDataController *)self localStore];
    [v8 removeObjectsForKeys:v4];

    if (self) {
      itemsLocuint64_t k = self->_itemsLock;
    }
    else {
      itemsLocuint64_t k = 0;
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __32__FCReadingHistory_clearHistory__block_invoke_2;
    v44[3] = &unk_1E5B4C018;
    v44[4] = self;
    [(FCMTWriterLock *)itemsLock performWriteSync:v44];
    BOOL v30 = [[FCRemoveHistoryCommand alloc] initWithHistoryItemIDs:v4];
    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:");
    uint64_t v10 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 setObject:&unk_1EF8D7488 forKeyedSubscript:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v13);
    }
    id v31 = v4;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v16 = [(FCPrivateDataController *)self observers];
    long long v17 = (void *)[v16 copy];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          char v22 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v22 readingHistory:self didChangeFeaturesForArticles:v10];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v19);
    }

    id v4 = v31;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v23 = [(FCPrivateDataController *)self observers];
  char v24 = (void *)[v23 copy];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v32 + 1) + 8 * k);
        if (objc_opt_respondsToSelector()) {
          [v29 readingHistoryDidClear:self];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v26);
  }
}

uint64_t __32__FCReadingHistory_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 articleID];
}

uint64_t __32__FCReadingHistory_clearHistory__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 96);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 removeAllObjects];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    char v5 = *(void **)(v4 + 104);
  }
  else {
    char v5 = 0;
  }
  return [v5 removeAllObjects];
}

- (double)listeningProgressFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  [v3 listeningProgress];
  double v5 = v4;

  return v5;
}

- (id)listeningProgressSavedDateFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  double v4 = [v3 listeningProgressSavedAt];

  return v4;
}

- (id)firstSeenDateFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  double v4 = [v3 firstSeenAt];

  return v4;
}

- (void)markArticle:(id)a3 withListeningProgress:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__FCReadingHistory_markArticle_withListeningProgress___block_invoke;
  v4[3] = &__block_descriptor_40_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
  *(double *)&v4[4] = a4;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, a3, v4);
}

void __54__FCReadingHistory_markArticle_withListeningProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  double v6 = *(double *)(a1 + 32);
  id v9 = v5;
  [v5 listeningProgress];
  if (v6 != v7 && vabdd_f64(v6, v7) >= fabs(v7 * 0.000000999999997))
  {
    [v9 setListeningProgress:*(double *)(a1 + 32)];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    [v9 setListeningProgressSavedAt:v8];

    *a3 = 1024;
  }
}

- (id)lastListenedFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  double v4 = [v3 lastListenedAt];

  return v4;
}

- (void)markArticle:(id)a3 withLastListened:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__FCReadingHistory_markArticle_withLastListened___block_invoke;
  v8[3] = &unk_1E5B4C6C0;
  id v9 = v6;
  id v7 = v6;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, a3, v8);
}

void __49__FCReadingHistory_markArticle_withLastListened___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v8 = [v5 lastListenedAt];
  LOBYTE(v6) = objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8);

  if (v6)
  {
    uint64_t v9 = 0x40000;
  }
  else
  {
    [v10 setLastListenedAt:*(void *)(a1 + 32)];
    uint64_t v9 = 264192;
  }
  objc_msgSend(v10, "setListenedCount:", objc_msgSend(v10, "listenedCount") + 1);
  *a3 = v9;
}

- (int64_t)listenedCountFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  int64_t v4 = [v3 listenedCount];

  return v4;
}

- (id)readingPositionJSONFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  int64_t v4 = [v3 readingPosition];

  return v4;
}

- (id)readingPositionSavedDateFor:(id)a3
{
  uint64_t v3 = -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  int64_t v4 = [v3 readingPositionSavedAt];

  return v4;
}

- (void)markArticle:(id)a3 withReadingPositionJSON:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__FCReadingHistory_markArticle_withReadingPositionJSON___block_invoke;
  v8[3] = &unk_1E5B4C6C0;
  id v9 = v6;
  id v7 = v6;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, a3, v8);
}

void __56__FCReadingHistory_markArticle_withReadingPositionJSON___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v8 = [v5 readingPosition];
  LOBYTE(v6) = objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8);

  if ((v6 & 1) == 0)
  {
    [v10 setReadingPosition:*(void *)(a1 + 32)];
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setReadingPositionSavedAt:v9];

    *a3 = 4096;
  }
}

void __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1) {
    v1 = (void *)v1[13];
  }
  uint64_t v3 = v1;
  id v4 = [v2 articleID];
  [v3 setObject:v2 forKeyedSubscript:v4];
}

void __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_3(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    uint64_t v2 = (void *)v2[12];
  }
  id v4 = v2;
  id v5 = [v3 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v3 == v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 112);
    }
    else {
      uint64_t v8 = 0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_4;
    v9[3] = &unk_1E5B4BE70;
    void v9[4] = v7;
    id v10 = *(id *)(a1 + 32);
    [v8 performWriteSync:v9];
  }
}

void __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v1) {
    v1 = (void *)v1[13];
  }
  uint64_t v3 = v1;
  id v4 = [v2 articleID];
  [v3 setObject:v2 forKeyedSubscript:v4];
}

void __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke_2;
  aBlock[3] = &unk_1E5B4C6E8;
  void aBlock[4] = *(void *)(a1 + 32);
  uint64_t v2 = (void (**)(void *, void))_Block_copy(aBlock);
  if (*(unsigned char *)(a1 + 48))
  {
    id v28 = [*(id *)(a1 + 32) localStore];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v34;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v34 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = v2[2](v2, *(void *)(*((void *)&v33 + 1) + 8 * v6));
          uint64_t v8 = [v7 identifier];
          uint64_t v9 = *(void *)(a1 + 32);
          if (v9) {
            id v10 = *(void **)(v9 + 96);
          }
          else {
            id v10 = 0;
          }
          [v10 setObject:v7 forKeyedSubscript:v8];
          id v11 = *(void **)(a1 + 32);
          if (v11) {
            id v11 = (void *)v11[13];
          }
          uint64_t v12 = v11;
          uint64_t v13 = [v7 articleID];
          [v12 setObject:v7 forKeyedSubscript:v13];

          [v28 setObject:v7 forKeyedSubscript:v8];
          ++v6;
        }
        while (v4 != v6);
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v4 = v14;
      }
      while (v14);
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v28 = *(id *)(a1 + 40);
    uint64_t v15 = [v28 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v28);
          }
          uint64_t v19 = v2[2](v2, *(void *)(*((void *)&v29 + 1) + 8 * v18));
          uint64_t v20 = [v19 identifier];
          uint64_t v21 = *(void *)(a1 + 32);
          if (v21) {
            char v22 = *(void **)(v21 + 96);
          }
          else {
            char v22 = 0;
          }
          [v22 setObject:v19 forKeyedSubscript:v20];
          __int16 v23 = *(void **)(a1 + 32);
          if (v23) {
            __int16 v23 = (void *)v23[13];
          }
          char v24 = v23;
          uint64_t v25 = [v19 articleID];
          [v24 setObject:v19 forKeyedSubscript:v25];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v26 = [v28 countByEnumeratingWithState:&v29 objects:v38 count:16];
        uint64_t v16 = v26;
      }
      while (v26);
    }
  }
}

id __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    uint64_t v4 = (void *)v4[12];
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v3 identifier];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = v3;
  if (v7)
  {
    uint64_t v8 = (void *)[v3 mutableCopyWithZone:0];
    uint64_t v9 = [v8 maxVersionRead];
    uint64_t v10 = [v7 maxVersionRead];
    if (v9 <= v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v9;
    }
    [v8 setMaxVersionRead:v11];
    FCMergeHistoryItemSeenFields(v8, v7);
  }
  return v8;
}

void __59__FCReadingHistory__removeHistoryItemWithItemID_articleID___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      id v3 = *(void **)(v2 + 96);
    }
    else {
      id v3 = 0;
    }
    objc_msgSend(v3, "removeObjectForKey:");
    uint64_t v4 = [*(id *)(a1 + 40) localStore];
    [v4 removeObjectForKey:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 104);
    }
    else {
      uint64_t v6 = 0;
    }
    objc_msgSend(v6, "removeObjectForKey:");
  }
}

id __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 dictionaryRepresentation];

  return v5;
}

id __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_class();
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  int v8 = [v7 isEqualToString:@"flags"];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke_3;
    v12[3] = &unk_1E5B4BF78;
    id v13 = v4;
    id v10 = v4;
    objc_msgSend(v9, "fc_dictionary:", v12);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "unsignedIntegerValue") & 1);
  [v5 setObject:v6 forKeyedSubscript:@"hasBeenRead"];

  id v7 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 1) & 1);
  [v5 setObject:v7 forKeyedSubscript:@"hasBeenSeen"];

  int v8 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 2) & 1);
  [v5 setObject:v8 forKeyedSubscript:@"hasBeenMarkedOffensive"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 3) & 1);
  [v5 setObject:v9 forKeyedSubscript:@"hasBeenLiked"];

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 4) & 1);
  [v5 setObject:v10 forKeyedSubscript:@"hasBeenDisliked"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 5) & 1);
  [v5 setObject:v11 forKeyedSubscript:@"hasBeenConsumed"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 6) & 1);
  [v5 setObject:v12 forKeyedSubscript:@"hasCompletedListening"];

  id v13 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 8) & 1);
  [v5 setObject:v13 forKeyedSubscript:@"hasCompletedReading"];

  objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 9) & 1);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v14 forKeyedSubscript:@"hasBeenRemovedFromAudio"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_itemsByArticleID, 0);
  objc_storeStrong((id *)&self->_itemsByIdentifier, 0);
}

@end