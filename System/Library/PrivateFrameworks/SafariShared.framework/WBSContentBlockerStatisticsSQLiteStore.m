@interface WBSContentBlockerStatisticsSQLiteStore
+ (BOOL)storeExistsForProfileWithIdentifier:(id)a3;
+ (NSArray)allStores;
+ (WBSContentBlockerStatisticsSQLiteStore)standardStore;
+ (id)_databaseURLForProfileWithIdentifier:(id)a3;
+ (id)_defaultDatabaseURL;
+ (id)storeForProfileWithIdentifier:(id)a3;
- (BOOL)_createDatabaseSchemaIfNeeded;
- (BOOL)_openDatabaseIfNeeded;
- (BOOL)_openDatabaseIfNeededFallingBackToInMemory:(BOOL)a3;
- (BOOL)_tryOpenDatabase:(id *)a3;
- (NSString)description;
- (WBSContentBlockerStatisticsSQLiteStore)initWithDatabaseURL:(id)a3;
- (int64_t)_idForFirstPartyWithHighLevelDomain:(id)a3;
- (int64_t)_idForThirdPartyWithHighLevelDomain:(id)a3;
- (int64_t)_schemaVersion;
- (void)_clearStatisticsAfter:(id)a3 before:(id)a4;
- (void)_clearStatisticsForDomain:(id)a3;
- (void)_closeDatabaseOnDatabaseQueue;
- (void)_deleteDatabase;
- (void)_deleteUnusedDomains;
- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 completionHandler:(id)a5;
- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 onFirstParty:(id)a5 completionHandler:(id)a6;
- (void)clearAllStatisticsWithCompletionHandler:(id)a3;
- (void)clearStatisticsAfter:(id)a3 before:(id)a4;
- (void)clearStatisticsForDomains:(id)a3;
- (void)closeDatabase;
- (void)dealloc;
- (void)recordThirdPartyResourceBlocked:(id)a3 onFirstParty:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSContentBlockerStatisticsSQLiteStore

+ (WBSContentBlockerStatisticsSQLiteStore)standardStore
{
  if (+[WBSContentBlockerStatisticsSQLiteStore standardStore]::onceToken != -1) {
    dispatch_once(&+[WBSContentBlockerStatisticsSQLiteStore standardStore]::onceToken, &__block_literal_global_29);
  }
  v2 = (void *)+[WBSContentBlockerStatisticsSQLiteStore standardStore]::sharedStore;
  return (WBSContentBlockerStatisticsSQLiteStore *)v2;
}

void __55__WBSContentBlockerStatisticsSQLiteStore_standardStore__block_invoke()
{
  v0 = [WBSContentBlockerStatisticsSQLiteStore alloc];
  id v3 = +[WBSContentBlockerStatisticsSQLiteStore _defaultDatabaseURL];
  uint64_t v1 = -[WBSContentBlockerStatisticsSQLiteStore initWithDatabaseURL:](v0, "initWithDatabaseURL:");
  v2 = (void *)+[WBSContentBlockerStatisticsSQLiteStore standardStore]::sharedStore;
  +[WBSContentBlockerStatisticsSQLiteStore standardStore]::sharedStore = v1;
}

+ (NSArray)allStores
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [a1 standardStore];
  v5 = [v3 arrayWithObject:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = allProfileDatabaseIdentifiers();
  v7 = objc_msgSend(v6, "copy", 0);

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [a1 storeForProfileWithIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return (NSArray *)v12;
}

+ (id)storeForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    v5 = [a1 standardStore];
  }
  else
  {
    v6 = storesByProfileIdentifier();
    v5 = [v6 objectForKey:v4];

    if (!v5)
    {
      v7 = [a1 _databaseURLForProfileWithIdentifier:v4];
      v5 = [[WBSContentBlockerStatisticsSQLiteStore alloc] initWithDatabaseURL:v7];
      uint64_t v8 = storesByProfileIdentifier();
      [v8 setObject:v5 forKey:v4];

      uint64_t v9 = allProfileDatabaseIdentifiers();
      [v9 addObject:v4];
    }
  }

  return v5;
}

+ (BOOL)storeExistsForProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    char v4 = 1;
  }
  else
  {
    v5 = allProfileDatabaseIdentifiers();
    char v4 = [v5 containsObject:v3];
  }
  return v4;
}

- (WBSContentBlockerStatisticsSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSContentBlockerStatisticsSQLiteStore;
  v6 = [(WBSContentBlockerStatisticsSQLiteStore *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseURL, a3);
    uint64_t v8 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.SafariShared.WBSContentBlockerStatisticsSQLiteStore", 0, v8);
    databaseQueue = v7->_databaseQueue;
    v7->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = v7;
  }

  return v7;
}

- (void)dealloc
{
  id v3 = self->_database;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSContentBlockerStatisticsSQLiteStore_dealloc__block_invoke;
  block[3] = &unk_1E5C8CA70;
  uint64_t v8 = v3;
  id v5 = v3;
  dispatch_async(databaseQueue, block);

  v6.receiver = self;
  v6.super_class = (Class)WBSContentBlockerStatisticsSQLiteStore;
  [(WBSContentBlockerStatisticsSQLiteStore *)&v6 dealloc];
}

uint64_t __49__WBSContentBlockerStatisticsSQLiteStore_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (void)recordThirdPartyResourceBlocked:(id)a3 onFirstParty:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 host];
  v12 = objc_msgSend(v11, "safari_highLevelDomainFromHost");

  objc_super v13 = [v9 host];
  long long v14 = objc_msgSend(v13, "safari_highLevelDomainFromHost");

  databaseQueue = self->_databaseQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__WBSContentBlockerStatisticsSQLiteStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke;
  v19[3] = &unk_1E5C8CA48;
  v19[4] = self;
  id v20 = v12;
  id v21 = v14;
  id v22 = v10;
  id v16 = v14;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(databaseQueue, v19);
}

uint64_t __105__WBSContentBlockerStatisticsSQLiteStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _openDatabaseIfNeeded])
  {
    uint64_t v13 = [*(id *)(a1 + 32) _idForThirdPartyWithHighLevelDomain:*(void *)(a1 + 40)];
    uint64_t v12 = [*(id *)(a1 + 32) _idForFirstPartyWithHighLevelDomain:*(void *)(a1 + 48)];
    v2 = [MEMORY[0x1E4F1C9C8] date];
    [v2 timeIntervalSince1970];
    uint64_t v4 = v3;

    uint64_t v11 = v4;
    int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long &,long &,double &>(*(void **)(*(void *)(a1 + 32) + 24), 0, @"INSERT INTO BlockedResources (thirdPartyDomainID, firstPartyDomainID, lastSeen) VALUES (?,?,?) ON CONFLICT(thirdPartyDomainID, firstPartyDomainID) DO UPDATE SET lastSeen = excluded.lastSeen", &v13, &v12, (double *)&v11);
    if (v5 != 101)
    {
      objc_super v6 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v9 = [*(id *)(*(void *)(a1 + 32) + 24) lastErrorWithMethodName:"-[WBSContentBlockerStatisticsSQLiteStore recordThirdPartyResourceBlocked:onFirstParty:completionHandler:]_block_invoke"];
        id v10 = objc_msgSend(v9, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543618;
        long long v15 = v10;
        __int16 v16 = 1024;
        int v17 = v5;
        _os_log_error_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_ERROR, "Failed to insert into BlockedResources table: %{public}@ (%d)", buf, 0x12u);
      }
    }
    uint64_t result = *(void *)(a1 + 56);
    if (result) {
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v5 == 101);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 onFirstParty:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [v10 timeIntervalSince1970];
  uint64_t v15 = v14;
  [v11 timeIntervalSince1970];
  uint64_t v17 = v16;
  uint64_t v18 = [v12 length];
  databaseQueue = self->_databaseQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__WBSContentBlockerStatisticsSQLiteStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke;
  v22[3] = &unk_1E5C9A170;
  id v23 = v12;
  id v24 = v13;
  BOOL v27 = v18 != 0;
  uint64_t v25 = v15;
  uint64_t v26 = v17;
  v22[4] = self;
  id v20 = v12;
  id v21 = v13;
  dispatch_async(databaseQueue, v22);
}

void __105__WBSContentBlockerStatisticsSQLiteStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _openDatabaseIfNeeded])
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v3 = @" AND FirstPartyDomains.domain = ?";
    }
    else {
      uint64_t v3 = &stru_1EFBE3CF8;
    }
    uint64_t v18 = [NSString stringWithFormat:@"WHERE lastSeen >= ? AND lastSeen <= ?%@", v3];
    [NSString stringWithFormat:@"SELECT ThirdPartyDomains.domain, FirstPartyDomains.domain, lastSeen FROM BlockedResources JOIN ThirdPartyDomains on BlockedResources.thirdPartyDomainID = ThirdPartyDomains.thirdPartyDomainID JOIN FirstPartyDomains on BlockedResources.firstPartyDomainID = FirstPartyDomains.firstPartyDomainID %@", v18];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
    int v5 = (double *)(a1 + 56);
    objc_super v6 = (double *)(a1 + 64);
    if (*(unsigned char *)(a1 + 72)) {
      SafariShared::WBSSQLiteDatabaseFetch<double const&,double const&,NSString * const {__strong}&>(v4, v19, v5, v6, (void *)(a1 + 40));
    }
    else {
    id v8 = SafariShared::WBSSQLiteDatabaseFetch<double const&,double const&>(v4, v19, v5, v6);
    }
    while (1)
    {
      id v9 = [v8 nextObject];
      id v10 = v9;
      if (!v9) {
        break;
      }
      id v11 = [v9 stringAtIndex:0];
      id v12 = [WBSContentBlockerStatisticsFirstParty alloc];
      uint64_t v13 = [v10 stringAtIndex:1];
      [v10 doubleAtIndex:2];
      uint64_t v14 = -[WBSContentBlockerStatisticsFirstParty initWithDomain:lastSeen:](v12, "initWithDomain:lastSeen:", v13);

      uint64_t v15 = [v2 objectForKeyedSubscript:v11];
      LOBYTE(v13) = v15 == 0;

      if (v13)
      {
        v21[0] = v14;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        uint64_t v17 = (void *)[v16 mutableCopy];
        [v2 setObject:v17 forKeyedSubscript:v11];
      }
      else
      {
        uint64_t v16 = [v2 objectForKeyedSubscript:v11];
        [v16 addObject:v14];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v20 = [MEMORY[0x1E4F1C9E8] dictionary];
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 completionHandler:(id)a5
{
}

- (void)clearAllStatisticsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__WBSContentBlockerStatisticsSQLiteStore_clearAllStatisticsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8C9F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __82__WBSContentBlockerStatisticsSQLiteStore_clearAllStatisticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _openDatabaseIfNeededFallingBackToInMemory:0])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v2 _clearStatisticsAfter:v3 before:v4];
  }
  else
  {
    int v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Failed to open database to clear statistics. Deleting.", v7, 2u);
    }
    [*(id *)(a1 + 32) _deleteDatabase];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)clearStatisticsAfter:(id)a3 before:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsAfter_before___block_invoke;
  block[3] = &unk_1E5C8D840;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(databaseQueue, block);
}

uint64_t __70__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsAfter_before___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _clearStatisticsAfter:v3 before:v4];
}

- (void)clearStatisticsForDomains:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsForDomains___block_invoke;
  v7[3] = &unk_1E5C8D980;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(databaseQueue, v7);
}

uint64_t __68__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsForDomains___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _openDatabaseIfNeeded];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v14;
    *(void *)&long long v4 = 138477827;
    long long v12 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "safari_highLevelDomainFromHost", v12, (void)v13);
        char v9 = [v7 isEqualToString:v8];

        if (v9)
        {
          [*(id *)(a1 + 32) _clearStatisticsForDomain:v7];
        }
        else
        {
          id v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            uint64_t v18 = v7;
            _os_log_error_impl(&dword_1A6B5F000, v10, OS_LOG_TYPE_ERROR, "Could not remove content blocker statistics for non high-level domain %{private}@", buf, 0xCu);
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 32) _deleteUnusedDomains];
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WBSContentBlockerStatisticsSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E5C8CA70;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __55__WBSContentBlockerStatisticsSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDatabaseOnDatabaseQueue];
}

+ (id)_defaultDatabaseURL
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = objc_msgSend(v2, "safari_settingsDirectoryURL");
  long long v4 = [v3 URLByAppendingPathComponent:@"ContentBlockerStatistics.db" isDirectory:0];

  return v4;
}

+ (id)_databaseURLForProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  long long v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = objc_msgSend(v4, "safari_profileDirectoryURLWithID:createIfNeeded:", v3, 0);
  id v6 = [v5 URLByAppendingPathComponent:@"ContentBlockerStatistics.db" isDirectory:0];

  return v6;
}

- (void)_closeDatabaseOnDatabaseQueue
{
  [(WBSSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (BOOL)_openDatabaseIfNeeded
{
  return [(WBSContentBlockerStatisticsSQLiteStore *)self _openDatabaseIfNeededFallingBackToInMemory:1];
}

- (BOOL)_openDatabaseIfNeededFallingBackToInMemory:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_database)
  {
    BOOL v3 = a3;
    id v20 = 0;
    BOOL v5 = [(WBSContentBlockerStatisticsSQLiteStore *)self _tryOpenDatabase:&v20];
    id v6 = v20;
    id v7 = v6;
    if (v5)
    {
      LOBYTE(v3) = 1;
LABEL_21:

      return v3;
    }
    if ((objc_msgSend(v6, "safari_isSQLiteCorruptionError") & 1) != 0
      || objc_msgSend(v7, "safari_isSQLiteError") && objc_msgSend(v7, "code") == 26)
    {
      [(WBSContentBlockerStatisticsSQLiteStore *)self _deleteDatabase];
      id v19 = v7;
      BOOL v8 = [(WBSContentBlockerStatisticsSQLiteStore *)self _tryOpenDatabase:&v19];
      id v9 = v19;

      if (v8)
      {
        LOBYTE(v3) = 1;
        id v7 = v9;
        goto LABEL_21;
      }
      id v7 = v9;
      if (!v3) {
        goto LABEL_21;
      }
    }
    else if (!v3)
    {
      goto LABEL_21;
    }
    id v10 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
    databaseURL = self->_databaseURL;
    self->_databaseURL = v10;

    long long v12 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      long long v13 = objc_msgSend(v7, "safari_privacyPreservingDescription");
      [(WBSContentBlockerStatisticsSQLiteStore *)v13 _openDatabaseIfNeededFallingBackToInMemory:v12];
    }

    id v18 = v7;
    BOOL v14 = [(WBSContentBlockerStatisticsSQLiteStore *)self _tryOpenDatabase:&v18];
    id v15 = v18;

    if (v14)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      long long v16 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[WBSContentBlockerStatisticsSQLiteStore _openDatabaseIfNeededFallingBackToInMemory:](v16);
      }
      LOBYTE(v3) = 0;
    }
    id v7 = v15;
    goto LABEL_21;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (void)_deleteDatabase
{
  databaseURL = self->_databaseURL;
  id v14 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
  LOBYTE(databaseURL) = -[NSURL isEqual:](databaseURL, "isEqual:");

  if ((databaseURL & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v4 = [(NSURL *)self->_databaseURL absoluteString];
    [v15 removeItemAtURL:self->_databaseURL error:0];
    BOOL v5 = (void *)MEMORY[0x1E4F1CB10];
    id v6 = [v4 stringByAppendingString:@"-lock"];
    id v7 = [v5 URLWithString:v6];
    [v15 removeItemAtURL:v7 error:0];

    BOOL v8 = (void *)MEMORY[0x1E4F1CB10];
    id v9 = [v4 stringByAppendingString:@"-shm"];
    id v10 = [v8 URLWithString:v9];
    [v15 removeItemAtURL:v10 error:0];

    id v11 = (void *)MEMORY[0x1E4F1CB10];
    long long v12 = [v4 stringByAppendingString:@"-wal"];
    long long v13 = [v11 URLWithString:v12];
    [v15 removeItemAtURL:v13 error:0];
  }
}

- (BOOL)_tryOpenDatabase:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_databaseURL = &self->_databaseURL;
  id v6 = (WBSSQLiteDatabase *)[objc_alloc(MEMORY[0x1E4F97F98]) initWithURL:self->_databaseURL queue:self->_databaseQueue];
  database = self->_database;
  self->_database = v6;

  BOOL v8 = self->_database;
  id v27 = 0;
  char v9 = [(WBSSQLiteDatabase *)v8 openWithAccessType:3 error:&v27];
  id v10 = v27;
  if ((v9 & 1) == 0)
  {
    uint64_t v17 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = (uint64_t)*p_databaseURL;
      id v19 = objc_msgSend(v10, "safari_privacyPreservingDescription");
      [(WBSContentBlockerStatisticsSQLiteStore *)v18 _tryOpenDatabase:(uint64_t)v28];
    }

    id v20 = self->_database;
    self->_database = 0;

    if (a3)
    {
      id v10 = v10;
      BOOL v16 = 0;
      *a3 = v10;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v16 = 0;
    goto LABEL_21;
  }
  id v11 = *p_databaseURL;
  long long v12 = [MEMORY[0x1E4F97F98] inMemoryDatabaseURL];
  LOBYTE(v11) = [(NSURL *)v11 isEqual:v12];

  if ((v11 & 1) == 0) {
    SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA locking_mode = EXCLUSIVE");
  }
  long long v13 = self->_database;
  id v26 = v10;
  char v14 = [(WBSSQLiteDatabase *)v13 enableWAL:&v26];
  id v15 = v26;

  id v10 = v15;
  if ((v14 & 1) == 0)
  {
    if ([v15 code] == 5)
    {
      id v21 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:]((uint64_t *)&self->_databaseURL, v21);
      }
    }
    else
    {
      uint64_t v22 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = (uint64_t)*p_databaseURL;
        id v24 = objc_msgSend(v15, "safari_privacyPreservingDescription");
        [(WBSContentBlockerStatisticsSQLiteStore *)v23 _tryOpenDatabase:(uint64_t)v28];
      }
    }
    if (a3) {
      *a3 = v15;
    }
    goto LABEL_19;
  }
  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA foreign_keys = ON");
  if (![(WBSContentBlockerStatisticsSQLiteStore *)self _createDatabaseSchemaIfNeeded])
  {
LABEL_19:
    [(WBSContentBlockerStatisticsSQLiteStore *)self _closeDatabaseOnDatabaseQueue];
    goto LABEL_20;
  }
  BOOL v16 = 1;
LABEL_21:

  return v16;
}

- (BOOL)_createDatabaseSchemaIfNeeded
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(WBSContentBlockerStatisticsSQLiteStore *)self _schemaVersion]) {
    return 1;
  }
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE IF NOT EXISTS FirstPartyDomains (firstPartyDomainID INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE ON CONFLICT FAIL)");
  if (v4 == 101)
  {
    int v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE IF NOT EXISTS ThirdPartyDomains (thirdPartyDomainID INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE ON CONFLICT FAIL)");
    if (v5 == 101)
    {
      int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"CREATE TABLE IF NOT EXISTS BlockedResources (firstPartyDomainID INTEGER NOT NULL,thirdPartyDomainID INTEGER NOT NULL,lastSeen REAL NOT NULL,FOREIGN KEY (firstPartyDomainID) REFERENCES FirstPartyDomains(firstPartyDomainID) ON DELETE CASCADE,FOREIGN KEY (thirdPartyDomainID) REFERENCES ThirdPartyDomains(thirdPartyDomainID) ON DELETE CASCADE,PRIMARY KEY (firstPartyDomainID, thirdPartyDomainID))");
      if (v6 == 101)
      {
        int v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"PRAGMA user_version = 1");
        if (v7 == 101) {
          return 1;
        }
        int v8 = v7;
        char v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
          id v11 = objc_msgSend(v10, "safari_privacyPreservingDescription");
          int v21 = 138543618;
          uint64_t v22 = v11;
          __int16 v23 = 1024;
          int v24 = v8;
          _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to set Content Blocker Statistics database schema version: %{public}@ (%d)", (uint8_t *)&v21, 0x12u);
        }
      }
      else
      {
        int v18 = v6;
        char v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v19 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
          id v20 = objc_msgSend(v19, "safari_privacyPreservingDescription");
          int v21 = 138543618;
          uint64_t v22 = v20;
          __int16 v23 = 1024;
          int v24 = v18;
          _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to create BlockedResources table: %{public}@, (%d)", (uint8_t *)&v21, 0x12u);
        }
      }
    }
    else
    {
      int v15 = v5;
      char v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
        uint64_t v17 = objc_msgSend(v16, "safari_privacyPreservingDescription");
        int v21 = 138543618;
        uint64_t v22 = v17;
        __int16 v23 = 1024;
        int v24 = v15;
        _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to create ThirdPartyDomains table: %{public}@ (%d)", (uint8_t *)&v21, 0x12u);
      }
    }
  }
  else
  {
    int v12 = v4;
    char v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v13 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
      char v14 = objc_msgSend(v13, "safari_privacyPreservingDescription");
      int v21 = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 1024;
      int v24 = v12;
      _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to create FirstPartyDomains table: %{public}@ (%d)", (uint8_t *)&v21, 0x12u);
    }
  }

  return 0;
}

- (int64_t)_schemaVersion
{
  id v2 = SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, @"PRAGMA user_version");
  BOOL v3 = [v2 nextObject];
  int v4 = [v3 intAtIndex:0];

  int v5 = [v2 statement];
  [v5 invalidate];

  return v4;
}

- (int64_t)_idForThirdPartyWithHighLevelDomain:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  int v4 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, @"SELECT thirdPartyDomainID FROM ThirdPartyDomains WHERE domain = ?", &v13);
  int v5 = [v4 nextObject];
  int v6 = v5;
  if (v5)
  {
    int64_t v7 = (int)[v5 intAtIndex:0];
  }
  else
  {
    int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, @"INSERT INTO ThirdPartyDomains (domain) VALUES (?)", &v13);
    if (v8 == 101)
    {
      int64_t v7 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
    }
    else
    {
      char v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _idForThirdPartyWithHighLevelDomain:]");
        int v12 = objc_msgSend(v11, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543618;
        int v15 = v12;
        __int16 v16 = 1024;
        int v17 = v8;
        _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to insert row into ThirdPartyDomains: %{public}@ (%d)", buf, 0x12u);
      }
      int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      int v6 = v9;
    }
  }

  return v7;
}

- (int64_t)_idForFirstPartyWithHighLevelDomain:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  int v4 = SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, @"SELECT firstPartyDomainID FROM FirstPartyDomains WHERE domain = ?", &v13);
  int v5 = [v4 nextObject];
  int v6 = v5;
  if (v5)
  {
    int64_t v7 = (int)[v5 intAtIndex:0];
  }
  else
  {
    int v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, @"INSERT INTO FirstPartyDomains (domain) VALUES (?)", &v13);
    if (v8 == 101)
    {
      int64_t v7 = [(WBSSQLiteDatabase *)self->_database lastInsertRowID];
    }
    else
    {
      char v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _idForFirstPartyWithHighLevelDomain:]");
        int v12 = objc_msgSend(v11, "safari_privacyPreservingDescription");
        *(_DWORD *)buf = 138543618;
        int v15 = v12;
        __int16 v16 = 1024;
        int v17 = v8;
        _os_log_error_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_ERROR, "Failed to insert row into FirstPartyDomains: %{public}@ (%d)", buf, 0x12u);
      }
      int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      int v6 = v9;
    }
  }

  return v7;
}

- (void)_clearStatisticsAfter:(id)a3 before:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  database = self->_database;
  [v6 timeIntervalSince1970];
  *(void *)buf = v9;
  [v7 timeIntervalSince1970];
  uint64_t v15 = v10;
  int v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double>(database, 0, @"DELETE FROM BlockedResources WHERE lastSeen >= ? AND lastSeen <= ?", (double *)buf, (double *)&v15);
  if (v11 != 101)
  {
    int v12 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _clearStatisticsAfter:before:]");
      char v14 = objc_msgSend(v13, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v17 = 1024;
      int v18 = v11;
      _os_log_error_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_ERROR, "Unable to clear rows from Blocked Resources: %{public}@ (%d)", buf, 0x12u);
    }
  }
  [(WBSContentBlockerStatisticsSQLiteStore *)self _deleteUnusedDomains];
}

- (void)_clearStatisticsForDomain:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, @"DELETE FROM FirstPartyDomains WHERE domain = ?", &v8);
  if (v4 != 101)
  {
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _clearStatisticsForDomain:]");
      id v7 = objc_msgSend(v6, "safari_privacyPreservingDescription");
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Unable to clear row from First Party Domains: %{public}@ (%d)", buf, 0x12u);
    }
  }
}

- (void)_deleteUnusedDomains
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DELETE FROM FirstPartyDomains WHERE (SELECT COUNT(rowid) FROM BlockedResources WHERE BlockedResources.firstPartyDomainID = FirstPartyDomains.firstPartyDomainID) = 0");
  if (v3 != 101)
  {
    int v4 = v3;
    int v5 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v8 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _deleteUnusedDomains]");
      uint64_t v9 = objc_msgSend(v8, "safari_privacyPreservingDescription");
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Unable to clear rows from First Party Domains: %{public}@ (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
  int v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, @"DELETE FROM ThirdPartyDomains WHERE (SELECT COUNT(rowid) FROM BlockedResources WHERE BlockedResources.thirdPartyDomainID = ThirdPartyDomains.thirdPartyDomainID) = 0");
  if (v6 != 101)
  {
    id v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _deleteUnusedDomains]");
      __int16 v11 = objc_msgSend(v10, "safari_privacyPreservingDescription");
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_error_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_ERROR, "Unable to clear rows from Third Party Domains: %@ (%d)", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; databaseURL: %@>",
                       objc_opt_class(),
                       self,
                       self->_databaseURL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_openDatabaseIfNeededFallingBackToInMemory:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to open in-memory database", v1, 2u);
}

- (void)_openDatabaseIfNeededFallingBackToInMemory:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_FAULT, "Failling back to in-memory database: %{public}@", buf, 0xCu);
}

- (void)_tryOpenDatabase:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to acquire exclusive access to Content Blocker Statistics SQLite store at %{private}@.", (uint8_t *)&v3, 0xCu);
}

- (void)_tryOpenDatabase:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on Content Blocker Statistics SQLite store at %{private}@: %{public}@", v4, 0x16u);
}

- (void)_tryOpenDatabase:(uint64_t)a3 .cold.3(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Failed to open Content Blocker Statistics SQLite store at %{private}@. Error: %{public}@", v4, 0x16u);
}

@end