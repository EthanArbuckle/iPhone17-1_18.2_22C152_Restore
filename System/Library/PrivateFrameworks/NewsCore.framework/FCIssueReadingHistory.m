@interface FCIssueReadingHistory
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
+ (void)populateLocalStoreClassRegistry:(id)a3;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)hasIssueWithIDBeenBadged:(id)a3;
- (BOOL)hasIssueWithIDBeenEngaged:(id)a3;
- (BOOL)hasIssueWithIDBeenSeen:(id)a3;
- (BOOL)hasIssueWithIDBeenVisited:(id)a3;
- (FCIssueReadingHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSArray)allEngagedIssueIDs;
- (NSArray)recentlyEngagedIssueIDs;
- (NSArray)recentlyVisitedIssueIDs;
- (NSString)mostRecentlyVisitedIssueID;
- (id)_allHistoryItems;
- (id)_historyItemForIssueID:(uint64_t)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)bookmarkForLastVisitToIssueWithID:(id)a3;
- (id)lastEngagedDateForIssueWithID:(id)a3;
- (id)lastRemovedFromMyMagazinesDateForIssueWithID:(id)a3;
- (id)lastSeenDateForIssueWithID:(id)a3;
- (id)lastVisitedDateForIssueWithID:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (void)_addHistoryItems:(uint64_t)a1;
- (void)_didChangeForIssueIDs:(void *)a1;
- (void)_modifyHistoryForIssueID:(void *)a3 withBlock:;
- (void)addObserver:(id)a3;
- (void)clearHistory;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)markIssueAsBadgedWithID:(id)a3;
- (void)markIssueAsEngagedWithID:(id)a3;
- (void)markIssueAsRemovedFromMyMagazinesWithID:(id)a3;
- (void)markIssueAsSeenWithID:(id)a3;
- (void)markIssueWithID:(id)a3 asVisitedWithBookmark:(id)a4;
- (void)removeObserver:(id)a3;
@end

@implementation FCIssueReadingHistory

void __49__FCIssueReadingHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  id obj = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = [*(id *)(a1 + 32) localStore];
  [v2 addAllEntriesToDictionary:obj];

  v3 = [(id)objc_opt_class() internalLocalStoreKeys];
  v4 = [v3 allObjects];
  [obj removeObjectsForKeys:v4];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    objc_storeStrong((id *)(v5 + 96), obj);
  }
}

+ (void)populateLocalStoreClassRegistry:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class()];
}

+ (unint64_t)localStoreVersion
{
  return 2;
}

+ (id)localStoreFilename
{
  return @"issue-history";
}

+ (id)commandStoreFileName
{
  return @"issue-history-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 1;
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
  v3[2] = __49__FCIssueReadingHistory_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

- (FCIssueReadingHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]";
    __int16 v21 = 2080;
    v22 = "FCIssueReadingHistory.m";
    __int16 v23 = 1024;
    int v24 = 49;
    __int16 v25 = 2114;
    v26 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "pushNotificationCenter != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]";
    __int16 v21 = 2080;
    v22 = "FCIssueReadingHistory.m";
    __int16 v23 = 1024;
    int v24 = 50;
    __int16 v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storeDirectory != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCIssueReadingHistory initWithContext:pushNotificationCenter:storeDirectory:]";
    __int16 v21 = 2080;
    v22 = "FCIssueReadingHistory.m";
    __int16 v23 = 1024;
    int v24 = 51;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v18.receiver = self;
  v18.super_class = (Class)FCIssueReadingHistory;
  v11 = [(FCPrivateDataController *)&v18 initWithContext:v8 pushNotificationCenter:v9 storeDirectory:v10];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    itemsLock = v11->_itemsLock;
    v11->_itemsLock = (FCMTWriterLock *)v12;
  }
  return v11;
}

- (void)markIssueWithID:(id)a3 asVisitedWithBookmark:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCIssueReadingHistory markIssueWithID:asVisitedWithBookmark:]";
    __int16 v15 = 2080;
    v16 = "FCIssueReadingHistory.m";
    __int16 v17 = 1024;
    int v18 = 66;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "bookmark != nil");
    *(_DWORD *)buf = 136315906;
    v14 = "-[FCIssueReadingHistory markIssueWithID:asVisitedWithBookmark:]";
    __int16 v15 = 2080;
    v16 = "FCIssueReadingHistory.m";
    __int16 v17 = 1024;
    int v18 = 67;
    __int16 v19 = 2114;
    v20 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__FCIssueReadingHistory_markIssueWithID_asVisitedWithBookmark___block_invoke;
  v11[3] = &unk_1E5B4C108;
  id v12 = v7;
  id v8 = v7;
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v6, v11);
}

void __63__FCIssueReadingHistory_markIssueWithID_asVisitedWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v6 setLastVisitedDate:v3];

  uint64_t v4 = [*(id *)(a1 + 32) issueType];
  if (v4 == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 32) pageID];
    [v6 setLastVisitedPageID:v5];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    uint64_t v5 = [*(id *)(a1 + 32) articleID];
    [v6 setLastVisitedArticleID:v5];
  }

LABEL_6:
}

- (void)_modifyHistoryForIssueID:(void *)a3 withBlock:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_10;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "-[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:]";
    __int16 v22 = 2080;
    __int16 v23 = "FCIssueReadingHistory.m";
    __int16 v24 = 1024;
    int v25 = 475;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v6)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = "-[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:]";
        __int16 v22 = 2080;
        __int16 v23 = "FCIssueReadingHistory.m";
        __int16 v24 = 1024;
        int v25 = 476;
        __int16 v26 = 2114;
        uint64_t v27 = v16;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  id v7 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)a1, v5);
  id v8 = (void *)[v7 mutableCopyWithZone:0];

  if (!v8)
  {
    id v8 = objc_opt_new();
    id v9 = FCIssueHistoryItemIDFromIssueID((uint64_t)v5);
    [v8 setIdentifier:v9];

    [v8 setIssueID:v5];
  }
  v6[2](v6, v8);
  __int16 v19 = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  -[FCIssueReadingHistory _addHistoryItems:]((uint64_t)a1, v10);

  v11 = [FCModifyIssueHistoryCommand alloc];
  int v18 = v8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v13 = [(FCModifyIssueHistoryCommand *)v11 initWithIssueHistoryItems:v12 merge:0];

  [a1 addCommandToCommandQueue:v13];
  id v17 = v5;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  -[FCIssueReadingHistory _didChangeForIssueIDs:](a1, v14);

LABEL_10:
}

- (BOOL)hasIssueWithIDBeenVisited:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCIssueReadingHistory hasIssueWithIDBeenVisited:]";
    __int16 v11 = 2080;
    id v12 = "FCIssueReadingHistory.m";
    __int16 v13 = 1024;
    int v14 = 86;
    __int16 v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = [(FCIssueReadingHistory *)self bookmarkForLastVisitToIssueWithID:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)markIssueAsBadgedWithID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCIssueReadingHistory markIssueAsBadgedWithID:]";
    __int16 v8 = 2080;
    id v9 = "FCIssueReadingHistory.m";
    __int16 v10 = 1024;
    int v11 = 93;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_0);
}

void __49__FCIssueReadingHistory_markIssueAsBadgedWithID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 setLastBadgedDate:v4];
}

- (BOOL)hasIssueWithIDBeenBadged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    int v11 = "-[FCIssueReadingHistory hasIssueWithIDBeenBadged:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCIssueReadingHistory.m";
    __int16 v14 = 1024;
    int v15 = 101;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  BOOL v6 = [v5 lastBadgedDate];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)_historyItemForIssueID:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCIssueReadingHistory _historyItemForIssueID:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCIssueReadingHistory.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = 452;
      WORD2(v19) = 2114;
      *(void *)((char *)&v19 + 6) = v10;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    FCIssueHistoryItemIDFromIssueID((uint64_t)v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCIssueReadingHistory _historyItemForID:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCIssueReadingHistory.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = 460;
      WORD2(v19) = 2114;
      *(void *)((char *)&v19 + 6) = v11;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v12 = 0;
    __int16 v13 = &v12;
    uint64_t v14 = 0x3032000000;
    int v15 = __Block_byref_object_copy__0;
    __int16 v16 = __Block_byref_object_dispose__0;
    id v17 = 0;
    id v6 = *(id *)(a1 + 104);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __43__FCIssueReadingHistory__historyItemForID___block_invoke;
    *(void *)&long long v19 = &unk_1E5B4C230;
    uint64_t v21 = &v12;
    *((void *)&v19 + 1) = a1;
    id v7 = v5;
    id v20 = v7;
    [v6 performReadSync:buf];

    id v8 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)markIssueAsEngagedWithID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCIssueReadingHistory markIssueAsEngagedWithID:]";
    __int16 v8 = 2080;
    id v9 = "FCIssueReadingHistory.m";
    __int16 v10 = 1024;
    int v11 = 108;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_18);
}

void __50__FCIssueReadingHistory_markIssueAsEngagedWithID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 setLastEngagedDate:v4];
}

- (BOOL)hasIssueWithIDBeenEngaged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    int v11 = "-[FCIssueReadingHistory hasIssueWithIDBeenEngaged:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCIssueReadingHistory.m";
    __int16 v14 = 1024;
    int v15 = 116;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastEngagedDate];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)markIssueAsSeenWithID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    BOOL v7 = "-[FCIssueReadingHistory markIssueAsSeenWithID:]";
    __int16 v8 = 2080;
    id v9 = "FCIssueReadingHistory.m";
    __int16 v10 = 1024;
    int v11 = 123;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_20);
}

void __47__FCIssueReadingHistory_markIssueAsSeenWithID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 setLastSeenDate:v4];
}

- (BOOL)hasIssueWithIDBeenSeen:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    int v11 = "-[FCIssueReadingHistory hasIssueWithIDBeenSeen:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCIssueReadingHistory.m";
    __int16 v14 = 1024;
    int v15 = 131;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastSeenDate];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)markIssueAsRemovedFromMyMagazinesWithID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    BOOL v7 = "-[FCIssueReadingHistory markIssueAsRemovedFromMyMagazinesWithID:]";
    __int16 v8 = 2080;
    id v9 = "FCIssueReadingHistory.m";
    __int16 v10 = 1024;
    int v11 = 138;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  -[FCIssueReadingHistory _modifyHistoryForIssueID:withBlock:](self, v4, &__block_literal_global_22);
}

void __65__FCIssueReadingHistory_markIssueAsRemovedFromMyMagazinesWithID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 setLastRemovedFromMyMagazinesDate:v4];
}

- (id)bookmarkForLastVisitToIssueWithID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v13 = "-[FCIssueReadingHistory bookmarkForLastVisitToIssueWithID:]";
    __int16 v14 = 2080;
    int v15 = "FCIssueReadingHistory.m";
    __int16 v16 = 1024;
    int v17 = 147;
    __int16 v18 = 2114;
    long long v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastVisitedArticleID];

  if (v6)
  {
    BOOL v7 = [v5 lastVisitedArticleID];
    uint64_t v8 = +[FCIssueBookmark ANFBookmarkWithArticleID:v7];
  }
  else
  {
    id v9 = [v5 lastVisitedPageID];

    if (!v9) {
      goto LABEL_9;
    }
    BOOL v7 = [v5 lastVisitedPageID];
    uint64_t v8 = +[FCIssueBookmark PDFBookmarkWithPageID:v7];
  }
  id v9 = (void *)v8;

LABEL_9:
  return v9;
}

- (id)lastVisitedDateForIssueWithID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCIssueReadingHistory lastVisitedDateForIssueWithID:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCIssueReadingHistory.m";
    __int16 v13 = 1024;
    int v14 = 168;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastVisitedDate];

  return v6;
}

- (id)lastEngagedDateForIssueWithID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCIssueReadingHistory lastEngagedDateForIssueWithID:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCIssueReadingHistory.m";
    __int16 v13 = 1024;
    int v14 = 176;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastEngagedDate];

  return v6;
}

- (id)lastSeenDateForIssueWithID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCIssueReadingHistory lastSeenDateForIssueWithID:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCIssueReadingHistory.m";
    __int16 v13 = 1024;
    int v14 = 184;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastSeenDate];

  return v6;
}

- (id)lastRemovedFromMyMagazinesDateForIssueWithID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v10 = "-[FCIssueReadingHistory lastRemovedFromMyMagazinesDateForIssueWithID:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCIssueReadingHistory.m";
    __int16 v13 = 1024;
    int v14 = 192;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = -[FCIssueReadingHistory _historyItemForIssueID:]((uint64_t)self, v4);
  id v6 = [v5 lastRemovedFromMyMagazinesDate];

  return v6;
}

- (NSString)mostRecentlyVisitedIssueID
{
  v2 = -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_26];
  id v4 = [v3 lastObject];
  id v5 = [v4 issueID];

  return (NSString *)v5;
}

- (id)_allHistoryItems
{
  v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__0;
    id v9 = __Block_byref_object_dispose__0;
    id v10 = 0;
    id v2 = a1[13];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__FCIssueReadingHistory__allHistoryItems__block_invoke;
    v4[3] = &unk_1E5B4C258;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadSync:v4];

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __51__FCIssueReadingHistory_mostRecentlyVisitedIssueID__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a3;
  id v6 = [a2 lastVisitedDate];
  uint64_t v7 = [v5 lastVisitedDate];

  uint64_t v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

- (NSArray)recentlyVisitedIssueIDs
{
  id v3 = [(FCPrivateDataController *)self context];
  id v4 = [v3 configurationManager];
  id v5 = [v4 configuration];
  id v6 = [v5 paidBundleConfig];
  double v7 = (double)[v6 recentIssuesMaxAge];

  uint64_t v8 = -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke;
  v13[3] = &__block_descriptor_40_e44_B16__0___FCMutableIssueReadingHistoryItem__8l;
  *(double *)&v13[4] = v7;
  id v9 = objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v13);

  id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_30];
  __int16 v11 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_33);

  return (NSArray *)v11;
}

BOOL __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 lastVisitedDate];
  if (v4)
  {
    id v5 = [v3 lastVisitedDate];
    objc_msgSend(v5, "fc_timeIntervalUntilNow");
    BOOL v7 = v6 <= *(double *)(a1 + 32);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a2;
  double v6 = [a3 lastVisitedDate];
  BOOL v7 = [v5 lastVisitedDate];

  uint64_t v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

uint64_t __48__FCIssueReadingHistory_recentlyVisitedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 issueID];
}

- (NSArray)recentlyEngagedIssueIDs
{
  id v3 = [(FCPrivateDataController *)self context];
  id v4 = [v3 configurationManager];
  id v5 = [v4 configuration];
  double v6 = [v5 paidBundleConfig];
  double v7 = (double)[v6 recentIssuesMaxAge];

  uint64_t v8 = -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke;
  v13[3] = &__block_descriptor_40_e44_B16__0___FCMutableIssueReadingHistoryItem__8l;
  *(double *)&v13[4] = v7;
  id v9 = objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v13);

  id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_35];
  __int16 v11 = objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_37);

  return (NSArray *)v11;
}

BOOL __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 lastEngagedDate];
  if (v4)
  {
    id v5 = [v3 lastEngagedDate];
    objc_msgSend(v5, "fc_timeIntervalUntilNow");
    BOOL v7 = v6 <= *(double *)(a1 + 32);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a2;
  double v6 = [a3 lastEngagedDate];
  BOOL v7 = [v5 lastEngagedDate];

  uint64_t v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

uint64_t __48__FCIssueReadingHistory_recentlyEngagedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 issueID];
}

- (NSArray)allEngagedIssueIDs
{
  id v2 = -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  id v3 = objc_msgSend(v2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_39);

  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_41_0];
  id v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_43);

  return (NSArray *)v5;
}

BOOL __43__FCIssueReadingHistory_allEngagedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 lastEngagedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __43__FCIssueReadingHistory_allEngagedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4FBA8A8];
  id v5 = a2;
  double v6 = [a3 lastEngagedDate];
  BOOL v7 = [v5 lastEngagedDate];

  uint64_t v8 = objc_msgSend(v4, "nf_compareObject:toObject:", v6, v7);
  return v8;
}

uint64_t __43__FCIssueReadingHistory_allEngagedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 issueID];
}

- (void)addObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCIssueReadingHistory addObserver:]";
    __int16 v9 = 2080;
    id v10 = "FCIssueReadingHistory.m";
    __int16 v11 = 1024;
    int v12 = 272;
    __int16 v13 = 2114;
    int v14 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v6.receiver = self;
  v6.super_class = (Class)FCIssueReadingHistory;
  [(FCPrivateDataController *)&v6 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCIssueReadingHistory removeObserver:]";
    __int16 v9 = 2080;
    id v10 = "FCIssueReadingHistory.m";
    __int16 v11 = 1024;
    int v12 = 280;
    __int16 v13 = 2114;
    int v14 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v6.receiver = self;
  v6.super_class = (Class)FCIssueReadingHistory;
  [(FCPrivateDataController *)&v6 removeObserver:v4];
}

- (void)clearHistory
{
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    itemsByID = self->_itemsByID;
  }
  else {
    itemsByID = 0;
  }
  id v4 = [(NSMutableDictionary *)itemsByID allKeys];
  if (self) {
    id v5 = self->_itemsByID;
  }
  else {
    id v5 = 0;
  }
  objc_super v6 = [(NSMutableDictionary *)v5 allValues];
  BOOL v7 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_51);

  uint64_t v8 = [(FCPrivateDataController *)self localStore];
  [v8 removeObjectsForKeys:v4];

  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__FCIssueReadingHistory_clearHistory__block_invoke_2;
  v11[3] = &unk_1E5B4C018;
  void v11[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v11];
  id v10 = [[FCRemoveIssueHistoryCommand alloc] initWithIssueHistoryItemIDs:v4];
  [(FCPrivateDataController *)self addCommandToCommandQueue:v10];
  -[FCIssueReadingHistory _didChangeForIssueIDs:](self, v7);
}

uint64_t __37__FCIssueReadingHistory_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 issueID];
}

uint64_t __37__FCIssueReadingHistory_clearHistory__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    id v2 = *(void **)(v1 + 96);
  }
  else {
    id v2 = 0;
  }
  return [v2 removeAllObjects];
}

- (void)_didChangeForIssueIDs:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(a1, "observers", 0);
    id v5 = (void *)[v4 copy];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 issueReadingHistoryDidChange:a1 forIssueIDs:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
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
  id v3 = (void *)[v2 initWithZoneName:@"IssueReadingHistory" ownerName:*MEMORY[0x1E4F19C08]];
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
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = objc_msgSend(v5, "allKeys", 0);
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
          long long v13 = [v5 objectForKeyedSubscript:v12];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  long long v14 = [[FCModifyIssueHistoryCommand alloc] initWithIssueHistoryItems:v6 merge:1];
  uint64_t v21 = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];

  return v15;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = a3;
  [v7 isMainThread];
  uint64_t v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_61);

  uint64_t v10 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", &__block_literal_global_64);
  if (self) {
    itemsByID = self->_itemsByID;
  }
  else {
    itemsByID = 0;
  }
  uint64_t v12 = [(NSMutableDictionary *)itemsByID nf_objectsForKeysWithoutMarker:v6];
  long long v13 = objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", &__block_literal_global_66);

  -[FCIssueReadingHistory _addHistoryItems:]((uint64_t)self, v9);
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_4;
  uint64_t v21 = &unk_1E5B4BE70;
  uint64_t v22 = self;
  id v15 = v6;
  id v23 = v15;
  [(FCMTWriterLock *)itemsLock performWriteSync:&v18];
  uint64_t v16 = [(FCPrivateDataController *)self localStore];
  [v16 removeObjectsForKeys:v15];

  if ([v10 count] || objc_msgSend(v13, "count"))
  {
    long long v17 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", v10, v13);
    -[FCIssueReadingHistory _didChangeForIssueIDs:](self, v17);
  }
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F82A70] issueReadingHistoryItemWithCKRecord:a2];
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 issueID];
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 issueID];
}

- (void)_addHistoryItems:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "items != nil");
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = "-[FCIssueReadingHistory _addHistoryItems:]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCIssueReadingHistory.m";
      __int16 v13 = 1024;
      int v14 = 501;
      __int16 v15 = 2114;
      uint64_t v16 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v4 = *(void **)(a1 + 104);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __42__FCIssueReadingHistory__addHistoryItems___block_invoke;
    v6[3] = &unk_1E5B4BE70;
    id v7 = v3;
    uint64_t v8 = a1;
    [v4 performWriteSync:v6];
  }
}

uint64_t __73__FCIssueReadingHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[12];
  }
  return [v1 removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    itemsByID = self->_itemsByID;
  }
  else {
    itemsByID = 0;
  }
  return (id)[(NSMutableDictionary *)itemsByID allKeys];
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"IssueReadingHistory"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  id v3 = -[FCIssueReadingHistory _allHistoryItems]((id *)&self->super.super.isa);
  id v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_69);

  return v4;
}

uint64_t __53__FCIssueReadingHistory_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

void __43__FCIssueReadingHistory__historyItemForID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[12];
  }
  uint64_t v3 = a1[5];
  id v7 = v2;
  uint64_t v4 = [v7 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __42__FCIssueReadingHistory__addHistoryItems___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "identifier", (void)v13);
        uint64_t v9 = *(void *)(a1 + 40);
        if (v9) {
          uint64_t v10 = *(void **)(v9 + 96);
        }
        else {
          uint64_t v10 = 0;
        }
        [v10 setObject:v7 forKeyedSubscript:v8];
        __int16 v11 = [*(id *)(a1 + 40) localStore];
        [v11 setObject:v7 forKeyedSubscript:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v12 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v4 = v12;
    }
    while (v12);
  }
}

void __41__FCIssueReadingHistory__allHistoryItems__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[12];
  }
  uint64_t v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_itemsByID, 0);
}

@end