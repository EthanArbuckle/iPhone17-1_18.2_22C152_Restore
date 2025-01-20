@interface FCReadingList
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
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)isArticleOnReadingList:(id)a3;
- (BOOL)shouldHideHeadline:(id)a3;
- (FCReadingList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (id)_allEntriesInReadingList;
- (id)_readingListEntryForArticleID:(id *)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)allNonConsumedArticleIDs;
- (id)allNonConsumedArticleIDsIntersectingSet:(id)a3;
- (id)allSortedArticleIDsInReadingList;
- (id)dateArticleWasAdded:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (unint64_t)countOfAllArticlesSavedOutsideOfNewsSince:(id)a3;
- (void)_addedArticleIDs:(void *)a3 removedArticleIDs:(uint64_t)a4 eventInitiationLevel:;
- (void)addArticleToReadingList:(id)a3;
- (void)addArticleToReadingList:(id)a3 eventInitiationLevel:(int64_t)a4 origin:(unint64_t)a5;
- (void)addObserver:(id)a3;
- (void)clearArticlesFromReadingList;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)removeArticleFromReadingList:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation FCReadingList

void __47__FCReadingList__readingListEntryForArticleID___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (v2) {
    v2 = (void *)v2[12];
  }
  uint64_t v3 = a1[5];
  v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __41__FCReadingList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    objc_storeStrong((id *)(v3 + 96), v2);
  }

  uint64_t v4 = [*(id *)(a1 + 32) localStore];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v10] & 1) == 0)
        {
          objc_opt_class();
          v11 = [v4 objectForKey:v10];
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              v12 = v11;
            }
            else {
              v12 = 0;
            }
          }
          else
          {
            v12 = 0;
          }
          id v13 = v12;

          if (v13)
          {
            v14 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v10, v13);
            if (v14)
            {
              v15 = *(void **)(a1 + 32);
              if (v15) {
                v15 = (void *)v15[12];
              }
              v16 = v15;
              id v17 = v14[2];
              [v16 setObject:v14 forKey:v17];
            }
          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              v21 = NSStringFromClass(v20);
              *(_DWORD *)buf = 138412546;
              v27 = v21;
              __int16 v28 = 2114;
              v29 = v10;
              _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %@ is not dictionary for key %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }
}

+ (unint64_t)localStoreVersion
{
  return 3;
}

+ (id)localStoreFilename
{
  return @"reading-list";
}

+ (id)commandStoreFileName
{
  return @"reading-list-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

- (BOOL)shouldHideHeadline:(id)a3
{
  id v4 = a3;
  if ([v4 isDeleted])
  {
    uint64_t v5 = [v4 articleID];
    BOOL v6 = ![(FCReadingList *)self isArticleOnReadingList:v5];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
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
  v3[2] = __41__FCReadingList_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

- (BOOL)isArticleOnReadingList:(id)a3
{
  uint64_t v3 = -[FCReadingList _readingListEntryForArticleID:]((id *)&self->super.super.isa, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_readingListEntryForArticleID:(id *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__26;
    v15 = __Block_byref_object_dispose__26;
    id v16 = 0;
    if (v3)
    {
      id v5 = a1[14];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __47__FCReadingList__readingListEntryForArticleID___block_invoke;
      v8[3] = &unk_1E5B4C230;
      v10 = &v11;
      v8[4] = a1;
      id v9 = v4;
      [v5 performReadSync:v8];

      BOOL v6 = (void *)v12[5];
    }
    else
    {
      BOOL v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);
  }
  return a1;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCReadingList;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

- (FCReadingList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCReadingList;
  v10 = [(FCPrivateDataController *)&v17 initWithContext:v9 pushNotificationCenter:a4 storeDirectory:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cloudContext, a3);
    v12 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v11->_itemsLock;
    v11->_itemsLock = v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    entriesByArticleID = v11->_entriesByArticleID;
    v11->_entriesByArticleID = (NSMutableDictionary *)v14;
  }
  return v11;
}

- (void)addArticleToReadingList:(id)a3
{
}

- (void)addArticleToReadingList:(id)a3 eventInitiationLevel:(int64_t)a4 origin:(unint64_t)a5
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v8)
  {
    id v9 = [FCReadingListEntry alloc];
    v10 = [NSString stringWithFormat:@"rl-%@", v8];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    v12 = -[FCReadingListEntry initWithEntryID:articleID:dateAdded:origin:]((id *)&v9->super.isa, v10, v8, v11, (void *)a5);

    if (v12)
    {
      v37[0] = @"articleID";
      id v13 = v12[2];
      *(void *)buf = v13;
      v37[1] = @"dateAdded";
      id v14 = v12[3];
      *(void *)&buf[8] = v14;
      v37[2] = @"origin";
      if ((char *)v12[4] - 1 >= (char *)3) {
        id v15 = 0;
      }
      else {
        id v15 = v12[4];
      }
      id v16 = [NSNumber numberWithUnsignedInteger:v15];
      *(void *)&buf[16] = v16;
      objc_super v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v37 count:3];

      if (self) {
        itemsLock = self->_itemsLock;
      }
      else {
        itemsLock = 0;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __69__FCReadingList_addArticleToReadingList_eventInitiationLevel_origin___block_invoke;
      v28[3] = &unk_1E5B4C738;
      v28[4] = self;
      v19 = v12;
      v29 = v19;
      id v20 = v8;
      id v30 = v20;
      [(FCMTWriterLock *)itemsLock performWriteSync:v28];
      v21 = [(FCPrivateDataController *)self localStore];
      id v22 = v19[1];
      [v21 setObject:v17 forKey:v22];

      id v32 = v20;
      long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, v23, MEMORY[0x1E4F1CBF0], a4);

      long long v24 = [FCModifyReadingListCommand alloc];
      uint64_t v31 = v19;
      long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      v26 = [(FCModifyReadingListCommand *)v24 initWithReadingListEntries:v25 merge:0];

      [(FCPrivateDataController *)self addCommandToCommandQueue:v26];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v27 = (id *)objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCReadingList addArticleToReadingList:eventInitiationLevel:origin:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCReadingList.m";
      *(_WORD *)&buf[22] = 1024;
      int v34 = 95;
      __int16 v35 = 2114;
      v36 = v27;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (id *)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[FCReadingList addArticleToReadingList:eventInitiationLevel:origin:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCReadingList.m";
    *(_WORD *)&buf[22] = 1024;
    int v34 = 87;
    __int16 v35 = 2114;
    v36 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_13:
  }
}

uint64_t __69__FCReadingList_addArticleToReadingList_eventInitiationLevel_origin___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[12];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

- (void)_addedArticleIDs:(void *)a3 removedArticleIDs:(uint64_t)a4 eventInitiationLevel:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1) {
    goto LABEL_15;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "addedArticleIDs");
    *(_DWORD *)buf = 136315906;
    long long v23 = "-[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:]";
    __int16 v24 = 2080;
    long long v25 = "FCReadingList.m";
    __int16 v26 = 1024;
    int v27 = 442;
    __int16 v28 = 2114;
    v29 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "removedArticleIDs");
        *(_DWORD *)buf = 136315906;
        long long v23 = "-[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:]";
        __int16 v24 = 2080;
        long long v25 = "FCReadingList.m";
        __int16 v26 = 1024;
        int v27 = 443;
        __int16 v28 = 2114;
        v29 = v16;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [a1 observers];
  v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v14++) readingList:a1 didAddArticles:v7 removeArticles:v8 eventInitiationLevel:a4];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

LABEL_15:
}

- (void)removeArticleFromReadingList:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      entriesByArticleID = self->_entriesByArticleID;
    }
    else {
      entriesByArticleID = 0;
    }
    BOOL v6 = [(NSMutableDictionary *)entriesByArticleID objectForKey:v4];
    if (v6)
    {
      if (self) {
        itemsLock = self->_itemsLock;
      }
      else {
        itemsLock = 0;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__FCReadingList_removeArticleFromReadingList___block_invoke;
      v14[3] = &unk_1E5B4BE70;
      v14[4] = self;
      id v8 = v4;
      id v15 = v8;
      [(FCMTWriterLock *)itemsLock performWriteSync:v14];
      id v9 = v6[1];
      v10 = [(FCPrivateDataController *)self localStore];
      [v10 removeObjectForKey:v9];

      id v16 = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, MEMORY[0x1E4F1CBF0], v11, 0);

      uint64_t v12 = [[FCRemoveFromReadingListCommand alloc] initWithEntryID:v9];
      [(FCPrivateDataController *)self addCommandToCommandQueue:v12];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (id *)objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "entry");
      *(_DWORD *)buf = 136315906;
      long long v18 = "-[FCReadingList removeArticleFromReadingList:]";
      __int16 v19 = 2080;
      long long v20 = "FCReadingList.m";
      __int16 v21 = 1024;
      int v22 = 121;
      __int16 v23 = 2114;
      __int16 v24 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v6 = (id *)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    long long v18 = "-[FCReadingList removeArticleFromReadingList:]";
    __int16 v19 = 2080;
    long long v20 = "FCReadingList.m";
    __int16 v21 = 1024;
    int v22 = 117;
    __int16 v23 = 2114;
    __int16 v24 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_12:
  }
}

uint64_t __46__FCReadingList_removeArticleFromReadingList___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  return [v1 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)clearArticlesFromReadingList
{
  [MEMORY[0x1E4F29060] isMainThread];
  objc_super v3 = -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  if ([v3 count])
  {
    if (self) {
      itemsLock = self->_itemsLock;
    }
    else {
      itemsLock = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__FCReadingList_clearArticlesFromReadingList__block_invoke;
    v15[3] = &unk_1E5B4C018;
    v15[4] = self;
    [(FCMTWriterLock *)itemsLock performWriteSync:v15];
    id v5 = [MEMORY[0x1E4F1CA48] array];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__FCReadingList_clearArticlesFromReadingList__block_invoke_2;
    v13[3] = &unk_1E5B51388;
    id v14 = v5;
    id v6 = v5;
    [v3 enumerateObjectsUsingBlock:v13];
    id v7 = [(FCPrivateDataController *)self localStore];
    [v7 removeObjectsForKeys:v6];

    id v8 = [[FCRemoveFromReadingListCommand alloc] initWithEntryIDs:v6];
    [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
    id v9 = [MEMORY[0x1E4F1CA48] array];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__FCReadingList_clearArticlesFromReadingList__block_invoke_3;
    v11[3] = &unk_1E5B51388;
    id v12 = v9;
    id v10 = v9;
    [v3 enumerateObjectsUsingBlock:v11];
    -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, MEMORY[0x1E4F1CBF0], v10, 0);
  }
}

- (id)_allEntriesInReadingList
{
  v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__26;
    id v9 = __Block_byref_object_dispose__26;
    id v10 = 0;
    id v2 = a1[14];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __41__FCReadingList__allEntriesInReadingList__block_invoke;
    v4[3] = &unk_1E5B4C258;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadSync:v4];

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __45__FCReadingList_clearArticlesFromReadingList__block_invoke(uint64_t a1)
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

void __45__FCReadingList_clearArticlesFromReadingList__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    objc_super v3 = *(void **)(a2 + 8);
  }
  else {
    objc_super v3 = 0;
  }
  id v4 = v3;
  [v2 addObject:v4];
}

void __45__FCReadingList_clearArticlesFromReadingList__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    objc_super v3 = *(void **)(a2 + 16);
  }
  else {
    objc_super v3 = 0;
  }
  id v4 = v3;
  [v2 addObject:v4];
}

- (id)dateArticleWasAdded:(id)a3
{
  objc_super v3 = -[FCReadingList _readingListEntryForArticleID:]((id *)&self->super.super.isa, a3);
  id v4 = v3;
  if (v3) {
    objc_super v3 = (void *)v3[3];
  }
  uint64_t v5 = v3;

  return v5;
}

- (id)allSortedArticleIDsInReadingList
{
  if (self)
  {
    id v2 = -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
    objc_super v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_51_0];
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_42);

  return v4;
}

uint64_t __49__FCReadingList_allSortedArticleIDsInReadingList__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(void *)(a2 + 16);
  }
  else {
    return 0;
  }
}

- (unint64_t)countOfAllArticlesSavedOutsideOfNewsSince:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__FCReadingList_countOfAllArticlesSavedOutsideOfNewsSince___block_invoke;
  v9[3] = &unk_1E5B513D0;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = objc_msgSend(v5, "fc_countOfObjectsPassingTest:", v9);

  return v7;
}

uint64_t __59__FCReadingList_countOfAllArticlesSavedOutsideOfNewsSince___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = a2;
  id v4 = v3;
  if (v3 && v3[4])
  {
    id v5 = v3[3];
    uint64_t v6 = objc_msgSend(v5, "fc_isLaterThan:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)allNonConsumedArticleIDs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_28_0];
  uint64_t v6 = [(FCCloudContext *)self->_cloudContext readingHistory];
  unint64_t v7 = [v6 allConsumedArticleIDs];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
        if (v13) {
          id v14 = *(void **)(v13 + 16);
        }
        else {
          id v14 = 0;
        }
        id v15 = v14;
        char v16 = objc_msgSend(v7, "containsObject:", v15, (void)v21);

        if ((v16 & 1) == 0)
        {
          if (v13) {
            long long v17 = *(void **)(v13 + 16);
          }
          else {
            long long v17 = 0;
          }
          id v18 = v17;
          [v3 addObject:v18];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v19 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v10 = v19;
    }
    while (v19);
  }

  return v3;
}

uint64_t __41__FCReadingList_allNonConsumedArticleIDs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if (a3) {
    id v5 = *(void **)(a3 + 24);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v4) {
    unint64_t v7 = (void *)v4[3];
  }
  else {
    unint64_t v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v6 compare:v8];
  return v9;
}

- (id)allNonConsumedArticleIDsIntersectingSet:(id)a3
{
  id v4 = a3;
  id v5 = [(FCReadingList *)self allNonConsumedArticleIDs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FCReadingList_allNonConsumedArticleIDsIntersectingSet___block_invoke;
  v9[3] = &unk_1E5B4DBB0;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = objc_msgSend(v5, "fc_arrayOfObjectsPassingTest:", v9);

  return v7;
}

uint64_t __57__FCReadingList_allNonConsumedArticleIDsIntersectingSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCReadingList;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  id v8 = [(FCPrivateDataController *)self localStore];
  uint64_t v9 = objc_opt_new();
  id v10 = objc_opt_new();
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__FCReadingList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v17[3] = &unk_1E5B51418;
  id v18 = v6;
  id v19 = v8;
  long long v20 = self;
  id v21 = v9;
  id v22 = v7;
  id v23 = v10;
  id v12 = v10;
  id v13 = v7;
  id v14 = v9;
  id v15 = v8;
  id v16 = v6;
  [(FCMTWriterLock *)itemsLock performWriteSync:v17];
  -[FCReadingList _addedArticleIDs:removedArticleIDs:eventInitiationLevel:](self, v14, v12, 1);
}

void __65__FCReadingList_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v40 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v46;
    *(void *)&long long v2 = 136315906;
    long long v37 = v2;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v46 != v39) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v45 + 1) + 8 * v3);
        id v5 = objc_msgSend(v4, "recordID", v37);
        id v6 = [v5 recordName];

        id v7 = [*(id *)(a1 + 40) objectForKey:v6];
        id v8 = [v4 objectForKeyedSubscript:@"articleID"];
        uint64_t v9 = [v4 objectForKeyedSubscript:@"dateAdded"];
        uint64_t v10 = [v4 objectForKeyedSubscript:@"origin"];
        uint64_t v11 = (void *)v10;
        id v12 = &unk_1EF8D7B60;
        if (v10) {
          id v12 = (void *)v10;
        }
        id v13 = v12;

        if (v7)
        {
          id v14 = (void *)[v7 mutableCopy];
          id v15 = v14;
          if (v8) {
            [v14 setObject:v8 forKeyedSubscript:@"articleID"];
          }
          if (v9) {
            [v15 setObject:v9 forKeyedSubscript:@"dateAdded"];
          }
          [v15 setObject:v13 forKeyedSubscript:@"origin"];
          [*(id *)(a1 + 40) setObject:v15 forKey:v6];
          if (v8)
          {
            id v16 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v6, v15);
            uint64_t v17 = *(void *)(a1 + 48);
            if (v17) {
              id v18 = *(void **)(v17 + 96);
            }
            else {
              id v18 = 0;
            }
            [v18 setObject:v16 forKey:v8];
          }
          goto LABEL_17;
        }
        if (v8)
        {
          if (v9)
          {
            v50[0] = @"articleID";
            v50[1] = @"dateAdded";
            v51[0] = v8;
            v51[1] = v9;
            v50[2] = @"origin";
            v51[2] = v13;
            id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
            long long v20 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v6, v19);
            uint64_t v21 = *(void *)(a1 + 48);
            if (v21) {
              id v22 = *(void **)(v21 + 96);
            }
            else {
              id v22 = 0;
            }
            [v22 setObject:v20 forKey:v8];
            [*(id *)(a1 + 40) setObject:v19 forKey:v6];
            [*(id *)(a1 + 56) addObject:v8];

            goto LABEL_18;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v23 = (void *)[[NSString alloc] initWithFormat:@"should never have a reading list entry without an article ID"];
            *(_DWORD *)buf = v37;
            v53 = "-[FCReadingList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
            __int16 v54 = 2080;
            v55 = "FCReadingList.m";
            __int16 v56 = 1024;
            int v57 = 284;
            __int16 v58 = 2114;
            v59 = v23;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          if (v9) {
            goto LABEL_18;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v15 = (void *)[[NSString alloc] initWithFormat:@"should never have a reading list entry without a date added"];
          *(_DWORD *)buf = v37;
          v53 = "-[FCReadingList handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          __int16 v54 = 2080;
          v55 = "FCReadingList.m";
          __int16 v56 = 1024;
          int v57 = 285;
          __int16 v58 = 2114;
          v59 = v15;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_17:
        }
LABEL_18:

        ++v3;
      }
      while (v40 != v3);
      uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
      uint64_t v40 = v24;
    }
    while (v24);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = *(id *)(a1 + 64);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * v29);
        uint64_t v31 = [*(id *)(a1 + 40) objectForKey:v30];
        id v32 = v31;
        if (v31)
        {
          v33 = [v31 objectForKeyedSubscript:@"articleID"];
          uint64_t v34 = *(void *)(a1 + 48);
          if (v34) {
            __int16 v35 = *(void **)(v34 + 96);
          }
          else {
            __int16 v35 = 0;
          }
          [v35 removeObjectForKey:v33];
          [*(id *)(a1 + 40) removeObjectForKey:v30];
          [*(id *)(a1 + 72) addObject:v33];
        }
        ++v29;
      }
      while (v27 != v29);
      uint64_t v36 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
      uint64_t v27 = v36;
    }
    while (v36);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    entriesByArticleID = self->_entriesByArticleID;
  }
  else {
    entriesByArticleID = 0;
  }
  id v5 = [(NSMutableDictionary *)entriesByArticleID allValues];
  id v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_43_0);

  return v6;
}

uint64_t __59__FCReadingList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(void *)(a2 + 8);
  }
  else {
    return 0;
  }
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v3 = (void *)[v2 initWithZoneName:@"ReadingList" ownerName:*MEMORY[0x1E4F19C08]];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([a1 isLocalStoreKeyInternal:v12] & 1) == 0)
        {
          id v13 = [v5 objectForKey:v12];
          id v14 = -[FCReadingListEntry initWithEntryID:dictionaryRepresentation:]((id *)[FCReadingListEntry alloc], v12, v13);
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }

  id v15 = [[FCModifyReadingListCommand alloc] initWithReadingListEntries:v6 merge:1];
  id v22 = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v16;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"ReadingList"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  uint64_t v3 = -[FCReadingList _allEntriesInReadingList]((id *)&self->super.super.isa);
  id v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_47_1);

  return v4;
}

id __45__FCReadingList_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return -[FCReadingListEntry asCKRecord](a2);
}

void __41__FCReadingList__allEntriesInReadingList__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[12];
  }
  uint64_t v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __47__FCReadingList__allSortedEntriesInReadingList__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  if (a3) {
    uint64_t v5 = *(void **)(a3 + 24);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v4) {
    id v7 = (void *)v4[3];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v6 compare:v8];
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_entriesByArticleID, 0);
}

@end