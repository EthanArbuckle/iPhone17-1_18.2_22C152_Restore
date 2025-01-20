@interface FCUserEventHistoryStorage
- (FCNewsAppConfigurationManager)configurationManager;
- (FCUserEventHistoryMetadata)metadata;
- (FCUserEventHistoryStorage)initWithPrivateDataDirectory:(id)a3;
- (FCUserEventHistoryStorage)initWithPrivateDataDirectory:(id)a3 configurationManager:(id)a4;
- (NFLazy)lazyRootDirectory;
- (NSArray)prunedSessionIDs;
- (NSArray)sessionIDs;
- (NSArray)sessions;
- (NSDate)earliestSessionDate;
- (NSHashTable)observers;
- (id)_deleteSessions:(id)a3 pruned:(BOOL)a4;
- (id)_filePathForSessionID:(id)a3;
- (id)pruneWithPolicies:(id)a3;
- (id)rootDirectory;
- (id)sizeString;
- (unint64_t)currentSize;
- (unint64_t)prunedSessionSize;
- (unint64_t)size;
- (void)_pruneSessions:(id)a3;
- (void)_pruneToMaxSessionAge:(unint64_t)a3;
- (void)_pruneToMaxSessionCount:(unint64_t)a3;
- (void)_pruneToMaxSize:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)clearAllSessions;
- (void)clearHistory;
- (void)clearSessionsWithIDs:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setCurrentSize:(unint64_t)a3;
- (void)setLazyRootDirectory:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataWithAggregateStoreGenerationTime:(int64_t)a3 aggregateTotalCount:(int64_t)a4 meanCountOfEvents:(double)a5 standardDeviationOfEvents:(double)a6 totalEventsCount:(int64_t)a7 headlineEventCount:(int64_t)a8 headlinesWithValidTitleEmbeddingsEventCount:(int64_t)a9 headlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a10 headlinesWithValidBodyEmbeddingsEventCount:(int64_t)a11 headlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a12 eventCounts:(id)a13 aggregateStoreData:(id)a14;
- (void)setPrunedSessionIDs:(id)a3;
- (void)setPrunedSessionSize:(unint64_t)a3;
- (void)storeSessionID:(id)a3 compressedSessionData:(id)a4 notify:(BOOL)a5;
- (void)storeSessionID:(id)a3 sessionData:(id)a4;
- (void)writeJSON:(id)a3;
@end

@implementation FCUserEventHistoryStorage

- (FCUserEventHistoryStorage)initWithPrivateDataDirectory:(id)a3 configurationManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FCUserEventHistoryStorage;
  v8 = [(FCUserEventHistoryStorage *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    objc_initWeak(&location, v8);
    objc_storeStrong((id *)&v8->_configurationManager, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F81BD0]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__FCUserEventHistoryStorage_initWithPrivateDataDirectory_configurationManager___block_invoke;
    v15[3] = &unk_1E5B519B0;
    id v16 = v6;
    objc_copyWeak(&v17, &location);
    uint64_t v12 = [v11 initWithConstructor:v15];
    lazyRootDirectory = v8->_lazyRootDirectory;
    v8->_lazyRootDirectory = (NFLazy *)v12;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    v5 = [(FCUserEventHistoryStorage *)self observers];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      id v7 = FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v10 = v4;
        _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "%p is already an observer", buf, 0xCu);
      }
    }
    v8 = [(FCUserEventHistoryStorage *)self observers];
    [v8 addObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCUserEventHistoryStorage addObserver:]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCUserEventHistoryStorage.m";
    __int16 v13 = 1024;
    int v14 = 94;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (id)pruneWithPolicies:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  v5 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "User event history storage pruning with policies %{public}@", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v16 = v4;
  int v6 = [v4 policies];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = MEMORY[0x1E4F14500];
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        switch([v12 type])
        {
          case 0:
            if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
            {
              __int16 v13 = (void *)[[NSString alloc] initWithFormat:@"Given an pruning policy with an unknown type"];
              *(_DWORD *)buf = 136315906;
              v22 = "-[FCUserEventHistoryStorage pruneWithPolicies:]";
              __int16 v23 = 2080;
              v24 = "FCUserEventHistoryStorage.m";
              __int16 v25 = 1024;
              int v26 = 129;
              __int16 v27 = 2114;
              v28 = v13;
              _os_log_fault_impl(&dword_1A460D000, v9, OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidPruningPolicy) : %s %s:%d %{public}@", buf, 0x26u);
            }
            break;
          case 1:
            -[FCUserEventHistoryStorage _pruneToMaxSize:](self, "_pruneToMaxSize:", [v12 value]);
            break;
          case 2:
            -[FCUserEventHistoryStorage _pruneToMaxSessionCount:](self, "_pruneToMaxSessionCount:", [v12 value]);
            break;
          case 3:
            -[FCUserEventHistoryStorage _pruneToMaxSessionAge:](self, "_pruneToMaxSessionAge:", [v12 value]);
            break;
          default:
            continue;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v8);
  }

  int v14 = [(FCUserEventHistoryStorage *)self prunedSessionIDs];

  return v14;
}

- (NSArray)prunedSessionIDs
{
  return self->_prunedSessionIDs;
}

- (void)_pruneToMaxSize:(int64_t)a3
{
  v4 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(FCUserEventHistoryStorage *)self size];
  int64_t v6 = v5;
  uint64_t v7 = v5 - a3;
  if (v5 <= a3)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __45__FCUserEventHistoryStorage__pruneToMaxSize___block_invoke;
    v44[3] = &__block_descriptor_48_e5_v8__0l;
    v44[4] = v5;
    v44[5] = a3;
    __45__FCUserEventHistoryStorage__pruneToMaxSize___block_invoke((uint64_t)v44);
    return;
  }
  uint64_t v8 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28B68];
    uint64_t v10 = v8;
    __int16 v11 = [v9 stringFromByteCount:v6 countStyle:0];
    uint64_t v12 = [MEMORY[0x1E4F28B68] stringFromByteCount:a3 countStyle:0];
    __int16 v13 = [MEMORY[0x1E4F28B68] stringFromByteCount:v7 countStyle:0];
    *(_DWORD *)buf = 138543874;
    uint64_t v47 = (uint64_t)v11;
    __int16 v48 = 2114;
    v49 = v12;
    __int16 v50 = 2114;
    v51 = v13;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "Current size %{public}@ does violate max size %{public}@, attempting to prune %{public}@ from sessions", buf, 0x20u);
  }
  int v14 = [(FCUserEventHistoryStorage *)v4 sessions];
  if (!v14)
  {
    v28 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v28, OS_LOG_TYPE_ERROR, "Failed to get session IDs to prune, skipping", buf, 2u);
    }
    goto LABEL_26;
  }
  __int16 v15 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = [v14 reverseObjectEnumerator];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v38 = v14;
    v39 = v4;
    uint64_t v19 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v15, "addObject:", v21, v38, v39);
        uint64_t v22 = [v21 size];
        v7 -= v22;
        __int16 v23 = (void *)FCUserEventsStorageLog;
        if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          __int16 v25 = [v21 identifier];
          int v26 = [MEMORY[0x1E4F28B68] stringFromByteCount:v22 countStyle:0];
          __int16 v27 = [MEMORY[0x1E4F28B68] stringFromByteCount:v7 countStyle:0];
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = (uint64_t)v25;
          __int16 v48 = 2114;
          v49 = v26;
          __int16 v50 = 2114;
          v51 = v27;
          _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "Found session %{public}@ to prune with size %{public}@, remaining size to prune %{public}@", buf, 0x20u);
        }
        if (v7 <= 0)
        {

          int v14 = v38;
          v4 = v39;
          goto LABEL_23;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v18) {
        continue;
      }
      break;
    }

    int v14 = v38;
    v4 = v39;
    goto LABEL_21;
  }

  if (v7 >= 1)
  {
LABEL_21:
    v29 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)MEMORY[0x1E4F28B68];
      v36 = v29;
      v37 = [v35 stringFromByteCount:v7 countStyle:0];
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = (uint64_t)v37;
      _os_log_error_impl(&dword_1A460D000, v36, OS_LOG_TYPE_ERROR, "Finished collecting sessions to prune but still need to remove %{public}@", buf, 0xCu);
    }
  }
LABEL_23:
  [(FCUserEventHistoryStorage *)v4 _pruneSessions:v15];
  uint64_t v30 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    uint64_t v32 = [v15 count];
    v33 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[FCUserEventHistoryStorage prunedSessionSize](v4, "prunedSessionSize"), 0);
    v34 = [(FCUserEventHistoryStorage *)v4 sizeString];
    *(_DWORD *)buf = 134218498;
    uint64_t v47 = v32;
    __int16 v48 = 2114;
    v49 = v33;
    __int16 v50 = 2114;
    v51 = v34;
    _os_log_impl(&dword_1A460D000, v31, OS_LOG_TYPE_DEFAULT, "Finished pruning %lu sessions account for %{public}@, session size after pruning %{public}@", buf, 0x20u);
  }
LABEL_26:
}

void __45__FCUserEventHistoryStorage__pruneToMaxSize___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x1E4F28B68];
    uint64_t v4 = *(void *)(a1 + 32);
    int64_t v5 = v2;
    int64_t v6 = [v3 stringFromByteCount:v4 countStyle:0];
    uint64_t v7 = [MEMORY[0x1E4F28B68] stringFromByteCount:*(void *)(a1 + 40) countStyle:0];
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Current size %{public}@ doesn't violate max size %{public}@, skipping pruning", (uint8_t *)&v8, 0x16u);
  }
}

- (void)setMetadataWithAggregateStoreGenerationTime:(int64_t)a3 aggregateTotalCount:(int64_t)a4 meanCountOfEvents:(double)a5 standardDeviationOfEvents:(double)a6 totalEventsCount:(int64_t)a7 headlineEventCount:(int64_t)a8 headlinesWithValidTitleEmbeddingsEventCount:(int64_t)a9 headlinesWithInvalidTitleEmbeddingsEventCount:(int64_t)a10 headlinesWithValidBodyEmbeddingsEventCount:(int64_t)a11 headlinesWithInvalidBodyEmbeddingsEventCount:(int64_t)a12 eventCounts:(id)a13 aggregateStoreData:(id)a14
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a14;
  id v22 = a13;
  __int16 v23 = [[FCUserEventHistoryMetadata alloc] initWithAggregateStoreGenerationTime:a3 aggregateTotalCount:a4 meanCountOfEvents:[(FCUserEventHistoryStorage *)self currentSize] sessionsOnDiskSize:a7 standardDeviationOfEvents:a8 totalEventsCount:a9 headlineEventCount:a5 headlinesWithValidTitleEmbeddingsEventCount:a6 headlinesWithInvalidTitleEmbeddingsEventCount:a10 headlinesWithValidBodyEmbeddingsEventCount:a11 headlinesWithInvalidBodyEmbeddingsEventCount:a12 eventCounts:v22 aggregateStoreData:v21];

  [(FCUserEventHistoryStorage *)self setMetadata:v23];
  v24 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = v24;
    int v26 = [(FCUserEventHistoryStorage *)self metadata];
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = v26;
    _os_log_impl(&dword_1A460D000, v25, OS_LOG_TYPE_DEFAULT, "Metadata set as %{public}@", buf, 0xCu);
  }
}

- (unint64_t)size
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(FCUserEventHistoryStorage *)self rootDirectory];
  id v10 = 0;
  unint64_t v5 = objc_msgSend(v3, "fc_sizeOfItemAtURL:error:", v4, &v10);
  id v6 = v10;

  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __33__FCUserEventHistoryStorage_size__block_invoke;
    v8[3] = &unk_1E5B51A78;
    v8[4] = self;
    id v9 = v6;
    unint64_t v5 = (int)__33__FCUserEventHistoryStorage_size__block_invoke((uint64_t)v8);
  }
  return v5;
}

NSObject *__79__FCUserEventHistoryStorage_initWithPrivateDataDirectory_configurationManager___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"personalization-sessions" isDirectory:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (!WeakRetained)
  {
    v23[1] = (id)MEMORY[0x1E4F143A8];
    v23[2] = (id)3221225472;
    v23[3] = __79__FCUserEventHistoryStorage_initWithPrivateDataDirectory_configurationManager___block_invoke_2;
    v23[4] = &unk_1E5B4C840;
    unint64_t v5 = v2;
    v23[5] = v5;
    goto LABEL_18;
  }
  unint64_t v5 = WeakRetained;
  if ([v2 fc_directoryExists])
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    -[NSObject setCurrentSize:](v5, "setCurrentSize:", objc_msgSend(v6, "fc_sizeOfItemAtURL:error:", v2, 0));

    uint64_t v7 = (void *)FCUserEventsStorageLog;
    if (!os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    int v8 = (void *)MEMORY[0x1E4F28B68];
    id v9 = v7;
    id v10 = objc_msgSend(v8, "stringFromByteCount:countStyle:", -[NSObject currentSize](v5, "currentSize"), 0);
    *(_DWORD *)buf = 138543618;
    __int16 v25 = v10;
    __int16 v26 = 2114;
    __int16 v27 = v2;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "User event history storage initialized. Current size %{public}@ at %{public}@", buf, 0x16u);
    goto LABEL_13;
  }
  __int16 v11 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v25 = v2;
    _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "User event history storage initialized, creating root directory at path %{public}@", buf, 0xCu);
  }
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v23[0] = 0;
  char v13 = [v12 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:v23];
  id v9 = v23[0];

  if (!v9
    || (int v14 = (void *)FCUserEventsStorageLog, !os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR)))
  {
    if (v13) {
      goto LABEL_11;
    }
LABEL_15:
    id v21 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v2;
      _os_log_error_impl(&dword_1A460D000, v21, OS_LOG_TYPE_ERROR, "Failed to create user event history storage root directory at %{public}@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v19 = v14;
  long long v20 = [v9 localizedDescription];
  *(_DWORD *)buf = 138543618;
  __int16 v25 = v2;
  __int16 v26 = 2114;
  __int16 v27 = v20;
  _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "Error creating event history storage root directory at %{public}@. Error: %{public}@", buf, 0x16u);

  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_11:
  __int16 v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  -[NSObject setCurrentSize:](v5, "setCurrentSize:", objc_msgSend(v15, "fc_sizeOfItemAtURL:error:", v2, 0));

  id v16 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28B68];
    id v10 = v16;
    uint64_t v18 = objc_msgSend(v17, "stringFromByteCount:countStyle:", -[NSObject currentSize](v5, "currentSize"), 0);
    *(_DWORD *)buf = 138543618;
    __int16 v25 = v18;
    __int16 v26 = 2114;
    __int16 v27 = v2;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "User event history storage initialized. Current size %{public}@ at %{public}@", buf, 0x16u);

LABEL_13:
  }
LABEL_17:

LABEL_18:
  return v2;
}

- (unint64_t)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(unint64_t)a3
{
  self->_currentSize = a3;
}

- (void)setMetadata:(id)a3
{
}

- (FCUserEventHistoryMetadata)metadata
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  metadata = self->_metadata;
  if (metadata)
  {
    uint64_t v4 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      char v13 = metadata;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Found user event history metadata %{public}@", (uint8_t *)&v12, 0xCu);
      metadata = self->_metadata;
    }
    unint64_t v5 = metadata;
  }
  else
  {
    id v6 = [(FCUserEventHistoryStorage *)self configurationManager];
    if (v6)
    {
      uint64_t v7 = [(FCUserEventHistoryStorage *)self configurationManager];
      int v8 = [v7 possiblyUnfetchedAppConfiguration];
      uint64_t v9 = [v8 personalizationAnalyticsEnabled];
    }
    else
    {
      uint64_t v9 = 0;
    }

    unint64_t v5 = +[FCUserEventHistoryMetadata emptyWithSessionsOnDiskSize:[(FCUserEventHistoryStorage *)self currentSize] personalizationAnalyticsEnabled:v9];
    id v10 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      char v13 = v5;
      _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_DEFAULT, "User event history metadata requested, but none found, returning empty metadata with only session size on disk %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  return v5;
}

- (NSArray)sessions
{
  v3 = [(FCUserEventHistoryStorage *)self sessionIDs];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__FCUserEventHistoryStorage_sessions__block_invoke;
  v6[3] = &unk_1E5B519D8;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", v6);

  return (NSArray *)v4;
}

- (NSArray)sessionIDs
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(FCUserEventHistoryStorage *)self rootDirectory];
  unint64_t v5 = [v4 path];
  id v13 = 0;
  id v6 = [v3 contentsOfDirectoryAtPath:v5 error:&v13];
  id v7 = v13;

  if (v6)
  {
    int v8 = [v6 sortedArrayUsingComparator:&__block_literal_global_43_1];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__FCUserEventHistoryStorage_sessionIDs__block_invoke;
    v10[3] = &unk_1E5B4E868;
    id v11 = v7;
    int v12 = self;
    int v8 = __39__FCUserEventHistoryStorage_sessionIDs__block_invoke((uint64_t)v10);
  }
  return (NSArray *)v8;
}

- (id)rootDirectory
{
  v2 = [(FCUserEventHistoryStorage *)self lazyRootDirectory];
  v3 = [v2 value];

  return v3;
}

- (NFLazy)lazyRootDirectory
{
  return self->_lazyRootDirectory;
}

- (FCUserEventHistoryStorage)initWithPrivateDataDirectory:(id)a3
{
  return [(FCUserEventHistoryStorage *)self initWithPrivateDataDirectory:a3 configurationManager:0];
}

id __79__FCUserEventHistoryStorage_initWithPrivateDataDirectory_configurationManager___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)sizeString
{
  v2 = (void *)MEMORY[0x1E4F28B68];
  unint64_t v3 = [(FCUserEventHistoryStorage *)self size];
  return (id)[v2 stringFromByteCount:v3 countStyle:0];
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    unint64_t v5 = [(FCUserEventHistoryStorage *)self observers];
    [v5 removeObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    unint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCUserEventHistoryStorage removeObserver:]";
    __int16 v8 = 2080;
    uint64_t v9 = "FCUserEventHistoryStorage.m";
    __int16 v10 = 1024;
    int v11 = 106;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (void)clearSessionsWithIDs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = (const char *)[v4 count];
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "User event history storage will attempt to clear %lu sessions", buf, 0xCu);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__FCUserEventHistoryStorage_clearSessionsWithIDs___block_invoke;
  v16[3] = &unk_1E5B519D8;
  v16[4] = self;
  id v7 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v16);
  __int16 v8 = [(FCUserEventHistoryStorage *)self _deleteSessions:v7 pruned:0];
  unint64_t v9 = [v8 count];
  if (v9 >= [v4 count])
  {
    unint64_t v13 = [v8 count];
    if (v13 <= [v4 count])
    {
      uint64_t v14 = (void *)FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = v14;
        uint64_t v15 = [v4 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = (const char *)v15;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Successfully cleared %lu sessions", buf, 0xCu);
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Somehow cleared %lu sessions even though only %lu sessions were requested to be cleared", objc_msgSend(v8, "count"), objc_msgSend(v4, "count"));
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = "-[FCUserEventHistoryStorage clearSessionsWithIDs:]";
      __int16 v19 = 2080;
      long long v20 = "FCUserEventHistoryStorage.m";
      __int16 v21 = 1024;
      int v22 = 148;
      __int16 v23 = 2114;
      v24 = v11;
      _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: InvalidSessionClearing) : %s %s:%d %{public}@", buf, 0x26u);
      goto LABEL_11;
    }
  }
  else
  {
    __int16 v10 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      int v11 = v10;
      uint64_t v12 = [v4 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v18 = (const char *)v12;
      __int16 v19 = 2114;
      long long v20 = (char *)v4;
      _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "Failed to find %lu sessions to clear. %{public}@", buf, 0x16u);
LABEL_11:
    }
  }
}

FCUserEventHistorySession *__50__FCUserEventHistoryStorage_clearSessionsWithIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [FCUserEventHistorySession alloc];
  unint64_t v5 = [*(id *)(a1 + 32) _filePathForSessionID:v3];
  id v6 = [(FCUserEventHistorySession *)v4 initWithSessionID:v3 path:v5];

  return v6;
}

- (void)writeJSON:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(FCUserEventHistoryStorage *)self rootDirectory];
  id v6 = [v5 URLByDeletingLastPathComponent];
  id v7 = [v6 URLByAppendingPathComponent:@"personalization-sessions-json" isDirectory:1];

  if (objc_msgSend(v7, "fc_directoryExists"))
  {
LABEL_2:
    __int16 v8 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v43 = v7;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "Found JSON folder at %{public}@", buf, 0xCu);
    }
    unint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v11 = [v7 path];
    id v40 = 0;
    uint64_t v12 = [v10 contentsOfDirectoryAtPath:v11 error:&v40];
    id v13 = v40;
    uint64_t v14 = [v9 setWithArray:v12];
    uint64_t v15 = objc_msgSend(v14, "fc_setByTransformingWithBlock:", &__block_literal_global_47);

    if (v13)
    {
      id v16 = (void *)FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v16;
        uint64_t v18 = [v13 localizedDescription];
        *(_DWORD *)buf = 138412290;
        long long v43 = v18;
        _os_log_error_impl(&dword_1A460D000, v17, OS_LOG_TYPE_ERROR, "Failed to get existing contents of JSON folder %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v25 = [(FCUserEventHistoryStorage *)self sessions];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __39__FCUserEventHistoryStorage_writeJSON___block_invoke_28;
      v38[3] = &unk_1E5B51A00;
      id v26 = v15;
      id v39 = v26;
      __int16 v27 = objc_msgSend(v25, "fc_arrayOfObjectsFailingTest:", v38);

      uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
      v29 = [(FCUserEventHistoryStorage *)self sessionIDs];
      uint64_t v30 = [v28 setWithArray:v29];
      uint64_t v31 = objc_msgSend(v26, "fc_setByMinusingSet:", v30);

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __39__FCUserEventHistoryStorage_writeJSON___block_invoke_2;
      v36[3] = &unk_1E5B51A28;
      id v32 = v7;
      id v37 = v32;
      [v31 enumerateObjectsUsingBlock:v36];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __39__FCUserEventHistoryStorage_writeJSON___block_invoke_31;
      v33[3] = &unk_1E5B51A50;
      id v35 = v4;
      id v34 = v32;
      [v27 enumerateObjectsUsingBlock:v33];
    }
    goto LABEL_14;
  }
  __int16 v19 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v43 = v7;
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "Creating user event history JSON directory at path %{public}@", buf, 0xCu);
  }
  long long v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = 0;
  char v21 = [v20 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v41];
  id v13 = v41;

  int v22 = FCUserEventsStorageLog;
  if (!v13)
  {
    if (v21)
    {
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v43 = v7;
        _os_log_impl(&dword_1A460D000, v22, OS_LOG_TYPE_DEFAULT, "Successfully created user event history JSON directory at %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v43 = v7;
      _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "Failed to create user event history storage JSON directory at %{public}@", buf, 0xCu);
    }
    goto LABEL_2;
  }
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    __int16 v23 = v22;
    v24 = [v13 localizedDescription];
    *(_DWORD *)buf = 138543618;
    long long v43 = v7;
    __int16 v44 = 2114;
    v45 = v24;
    _os_log_error_impl(&dword_1A460D000, v23, OS_LOG_TYPE_ERROR, "Error creating user event history JSON directory at %{public}@. Error: %{public}@", buf, 0x16u);
  }
LABEL_14:
}

uint64_t __39__FCUserEventHistoryStorage_writeJSON___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringByDeletingPathExtension];
}

uint64_t __39__FCUserEventHistoryStorage_writeJSON___block_invoke_28(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __39__FCUserEventHistoryStorage_writeJSON___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) URLByAppendingPathComponent:a2];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v4 = [v3 removeItemAtURL:v2 error:&v9];
  id v5 = v9;

  id v6 = FCUserEventsStorageLog;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v11 = v2;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "Deleted session at %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    id v7 = v6;
    __int16 v8 = [v5 localizedDescription];
    *(_DWORD *)buf = 138412546;
    int v11 = v2;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Failed to get delete session at %@. Error %@", buf, 0x16u);
  }
}

void __39__FCUserEventHistoryStorage_writeJSON___block_invoke_31(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 identifier];
    id v7 = [v5 URLByAppendingPathComponent:v6];
    __int16 v8 = [v7 URLByAppendingPathExtension:@"json"];

    id v9 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = (void *)MEMORY[0x1E4F28B68];
      int v11 = v9;
      objc_msgSend(v10, "stringFromByteCount:countStyle:", objc_msgSend(v4, "length"), 0);
      __int16 v12 = (char *)objc_claimAutoreleasedReturnValue();
      id v13 = [v3 identifier];
      int v15 = 138412802;
      id v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      v20[0] = v8;
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Got back session JSON data of size %@ for session %@. Writing to %@", (uint8_t *)&v15, 0x20u);
    }
    if (([v4 writeToURL:v8 atomically:1] & 1) == 0)
    {
      uint64_t v14 = FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v8;
        _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "Failed to write json data for session to %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    __int16 v8 = (char *)[[NSString alloc] initWithFormat:@"Missing session data for session we want to write as JSON"];
    int v15 = 136315906;
    id v16 = "-[FCUserEventHistoryStorage writeJSON:]_block_invoke";
    __int16 v17 = 2080;
    uint64_t v18 = "FCUserEventHistoryStorage.m";
    __int16 v19 = 1024;
    LODWORD(v20[0]) = 212;
    WORD2(v20[0]) = 2114;
    *(void *)((char *)v20 + 6) = v8;
    _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingSessionData) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
  }

LABEL_9:
}

uint64_t __33__FCUserEventHistoryStorage_size__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    char v4 = *(void **)(a1 + 32);
    id v5 = v2;
    id v6 = [v4 rootDirectory];
    id v7 = [*(id *)(a1 + 40) localizedDescription];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    int v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Error looking up contents of user event history storage at %{public}@. Error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __39__FCUserEventHistoryStorage_sessionIDs__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      char v4 = *(void **)(a1 + 40);
      id v5 = v2;
      id v6 = [v4 rootDirectory];
      int v7 = 138543362;
      int v8 = v6;
      _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to lookup session IDs in %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  return 0;
}

uint64_t __39__FCUserEventHistoryStorage_sessionIDs__block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2 options:64];
}

FCUserEventHistorySession *__37__FCUserEventHistoryStorage_sessions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) _filePathForSessionID:v3];
  id v5 = [[FCUserEventHistorySession alloc] initWithSessionID:v3 path:v4];
  id v6 = v5;
  if (v5)
  {
    int v7 = v5;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__FCUserEventHistoryStorage_sessions__block_invoke_2;
    v9[3] = &unk_1E5B4C840;
    id v10 = v3;
    __37__FCUserEventHistoryStorage_sessions__block_invoke_2((uint64_t)v9);
    int v7 = (FCUserEventHistorySession *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

uint64_t __37__FCUserEventHistoryStorage_sessions__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error creating user event history session for session id %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (void)storeSessionID:(id)a3 compressedSessionData:(id)a4 notify:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = FCPersistenceQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke;
  v13[3] = &unk_1E5B51AA0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _filePathForSessionID:*(void *)(a1 + 40)];
  id v3 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28B68];
    uint64_t v6 = *(void *)(a1 + 40);
    int v5 = *(void **)(a1 + 48);
    uint64_t v7 = v3;
    id v8 = objc_msgSend(v4, "stringFromByteCount:countStyle:", objc_msgSend(v5, "length"), 0);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v6;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    __int16 v27 = v2;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Storing session %{public}@ with size %{public}@ at %{public}@", buf, 0x20u);
  }
  id v9 = *(void **)(a1 + 48);
  id v21 = 0;
  char v10 = [v9 writeToFile:v2 options:1 error:&v21];
  id v11 = v21;
  if (v11)
  {
    id v12 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = v12;
      id v15 = [v11 localizedDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v13;
      __int16 v24 = 2114;
      uint64_t v25 = v15;
      _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "Error storing session %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else if (v10)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke_44;
      v18[3] = &unk_1E5B4C738;
      v18[4] = *(void *)(a1 + 32);
      id v19 = *(id *)(a1 + 48);
      id v20 = *(id *)(a1 + 40);
      FCPerformBlockOnMainThread(v18);
    }
  }
  else
  {
    BOOL v16 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v17;
      _os_log_error_impl(&dword_1A460D000, v16, OS_LOG_TYPE_ERROR, "Error storing session %{public}@ but no error...", buf, 0xCu);
    }
  }
}

void __73__FCUserEventHistoryStorage_storeSessionID_compressedSessionData_notify___block_invoke_44(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) storage:*(void *)(a1 + 32) didStoreData:*(void *)(a1 + 40) forSessionID:*(void *)(a1 + 48)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)storeSessionID:(id)a3 sessionData:(id)a4
{
  id v6 = a3;
  id v12 = 0;
  uint64_t v7 = [a4 compressedDataUsingAlgorithm:0 error:&v12];
  id v8 = v12;
  long long v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__FCUserEventHistoryStorage_storeSessionID_sessionData___block_invoke;
    v10[3] = &unk_1E5B4C018;
    id v11 = v8;
    __56__FCUserEventHistoryStorage_storeSessionID_sessionData___block_invoke((uint64_t)v10);
  }
  else
  {
    [(FCUserEventHistoryStorage *)self storeSessionID:v6 compressedSessionData:v7 notify:1];
  }
}

void __56__FCUserEventHistoryStorage_storeSessionID_sessionData___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 localizedDescription];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "Failed to compress data with error %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)clearAllSessions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(FCUserEventHistoryStorage *)self sessions];
  if (v3)
  {
    uint64_t v4 = [(FCUserEventHistoryStorage *)self _deleteSessions:v3 pruned:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(FCUserEventHistoryStorage *)self observers];
    int v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * i) storage:self didClearAllSessions:v4];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v11 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v11, OS_LOG_TYPE_ERROR, "Failed to get sessions IDs for clearing all sessions", buf, 2u);
    }
  }
}

- (NSDate)earliestSessionDate
{
  v2 = [(FCUserEventHistoryStorage *)self sessionIDs];
  id v3 = [v2 lastObject];

  if (v3)
  {
    uint64_t v4 = +[FCUserEventHistorySession dateFromSessionID:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)clearHistory
{
  [MEMORY[0x1E4F29060] isMainThread];
  [(FCUserEventHistoryStorage *)self clearAllSessions];
}

- (id)_filePathForSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCUserEventHistoryStorage *)self rootDirectory];
  int v6 = [v5 path];
  uint64_t v7 = [v6 stringByAppendingPathComponent:v4];

  return v7;
}

- (id)_deleteSessions:(id)a3 pruned:(BOOL)a4
{
  BOOL v26 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v27 = (id)objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v30;
    *(void *)&long long v7 = 138543874;
    long long v24 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v11, "size", v24);
        long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        long long v14 = [v11 path];
        id v28 = 0;
        char v15 = [v13 removeItemAtPath:v14 error:&v28];
        id v16 = v28;

        if (v15)
        {
          if (v26) {
            [(FCUserEventHistoryStorage *)self setPrunedSessionSize:[(FCUserEventHistoryStorage *)self prunedSessionSize] + v12];
          }
          uint64_t v17 = [v11 identifier];
          [v27 addObject:v17];
          goto LABEL_10;
        }
        uint64_t v18 = (void *)FCUserEventsStorageLog;
        if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = v18;
          id v19 = [v11 identifier];
          id v20 = [v11 path];
          id v21 = [v16 localizedDescription];
          *(_DWORD *)buf = v24;
          id v34 = v19;
          __int16 v35 = 2114;
          v36 = v20;
          __int16 v37 = 2114;
          v38 = v21;
          _os_log_error_impl(&dword_1A460D000, v17, OS_LOG_TYPE_ERROR, "Encountered error removing session %{public}@ at path %{public}@. Error: %{public}@", buf, 0x20u);

LABEL_10:
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v22 = [v5 countByEnumeratingWithState:&v29 objects:v39 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }

  return v27;
}

- (void)_pruneSessions:(id)a3
{
  id v7 = [(FCUserEventHistoryStorage *)self _deleteSessions:a3 pruned:1];
  id v4 = [(FCUserEventHistoryStorage *)self prunedSessionIDs];
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v7];
  [(FCUserEventHistoryStorage *)self setPrunedSessionIDs:v6];

  [(FCUserEventHistoryStorage *)self setCurrentSize:[(FCUserEventHistoryStorage *)self size]];
}

- (void)_pruneToMaxSessionCount:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to prune to max session count %lu", buf, 0xCu);
  }
  uint64_t v6 = [(FCUserEventHistoryStorage *)self sessions];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    if ([v8 count] <= a3)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __53__FCUserEventHistoryStorage__pruneToMaxSessionCount___block_invoke_58;
      v15[3] = &unk_1E5B51AE8;
      id v16 = v8;
      unint64_t v17 = a3;
      __53__FCUserEventHistoryStorage__pruneToMaxSessionCount___block_invoke_58((uint64_t)v15);
      long long v13 = v16;
    }
    else
    {
      unint64_t v9 = [v8 count] - a3;
      uint64_t v10 = (void *)FCUserEventsStorageLog;
      if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        uint64_t v12 = [v8 count];
        *(_DWORD *)buf = 134218496;
        unint64_t v19 = v12;
        __int16 v20 = 2048;
        unint64_t v21 = a3;
        __int16 v22 = 2048;
        unint64_t v23 = v9;
        _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Current session count %lu violates max session count %lu, attempting to prune %lu sessions", buf, 0x20u);
      }
      long long v13 = objc_msgSend(v8, "fc_safeSubarrayWithCountFromBack:", v9);
      [(FCUserEventHistoryStorage *)self _pruneSessions:v13];
    }
  }
  else
  {
    long long v14 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "Encountered error getting sessions to prune, skipping", buf, 2u);
    }
  }
}

void __53__FCUserEventHistoryStorage__pruneToMaxSessionCount___block_invoke_58(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Current session count %lu doesn't violate max session count %lu, skipping pruning", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_pruneToMaxSessionAge:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = FCUserEventsStorageLog;
  if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = a3;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to prune to max session age %lu", buf, 0xCu);
  }
  uint64_t v6 = [(FCUserEventHistoryStorage *)self sessions];
  if (v6)
  {
    int v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)-(int)a3];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__FCUserEventHistoryStorage__pruneToMaxSessionAge___block_invoke_62;
    v14[3] = &unk_1E5B51A00;
    id v8 = v7;
    id v15 = v8;
    __int16 v9 = objc_msgSend(v6, "fc_arrayOfObjectsFailingTest:", v14);
    uint64_t v10 = (void *)FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v9 count];
      *(_DWORD *)buf = 134218242;
      unint64_t v17 = v12;
      __int16 v18 = 2114;
      unint64_t v19 = v9;
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Found %lu sessions violating max age. Pruning %{public}@", buf, 0x16u);
    }
    [(FCUserEventHistoryStorage *)self _pruneSessions:v9];
  }
  else
  {
    long long v13 = FCUserEventsStorageLog;
    if (os_log_type_enabled((os_log_t)FCUserEventsStorageLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "Failed to get session IDs for pruning", buf, 2u);
    }
  }
}

uint64_t __51__FCUserEventHistoryStorage__pruneToMaxSessionAge___block_invoke_62(uint64_t a1, void *a2)
{
  id v3 = [a2 date];
  uint64_t v4 = objc_msgSend(v3, "fc_isLaterThanOrEqualTo:", *(void *)(a1 + 32));

  return v4;
}

- (void)setLazyRootDirectory:(id)a3
{
}

- (void)setPrunedSessionIDs:(id)a3
{
}

- (unint64_t)prunedSessionSize
{
  return self->_prunedSessionSize;
}

- (void)setPrunedSessionSize:(unint64_t)a3
{
  self->_prunedSessionSize = a3;
}

- (FCNewsAppConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_prunedSessionIDs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lazyRootDirectory, 0);
}

@end