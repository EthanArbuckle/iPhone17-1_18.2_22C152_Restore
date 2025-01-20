@interface WLSQLController
+ (int64_t)persistentValueForDate:(id)a3;
- (BOOL)_foundHandleIDs:(id)a3 representSameGroupMessageAsHandleIDs:(id)a4 handleIDsAreComplete:(BOOL)a5;
- (BOOL)deleteAccountsAndSummariesForMigrator:(id)a3 device:(id)a4;
- (NSString)databasePath;
- (WLSQLController)init;
- (id)_migratableAppsForDevice:(id)a3;
- (id)_sqlite3_column_NSDateForStatement:(sqlite3_stmt *)a3 column:(int)a4;
- (id)accountsForMigrator:(id)a3 device:(id)a4;
- (id)dataForSummary:(id)a3;
- (id)groupMessageInfoMatchingSortedHandleIDs:(id)a3 handleIDsAreComplete:(BOOL)a4 didMatchExactly:(BOOL *)a5;
- (id)groupMessageInfoMatchingSourceThreadID:(id)a3;
- (id)messagePhoneNumberIccForCcAcNumber:(id)a3;
- (id)migratableAppsForAllDevices;
- (id)migrationErrors;
- (id)migrationMetadataForSourceDevice:(id)a3 strictMatch:(BOOL)a4;
- (id)statisticsForContentType:(id)a3;
- (id)summariesForAccount:(id)a3;
- (id)summariesForAccounts:(id)a3 sortedByModifiedDate:(BOOL)a4;
- (int)_sqlite3_bind_NSDate:(id)a3 forStatement:(sqlite3_stmt *)a4 position:(int)a5;
- (int64_t)_performQuery:(id)a3 rowHandler:(id)a4;
- (int64_t)_schemaVersion;
- (unint64_t)_totalSummarySegmentCountForAccounts:(id)a3 migrationStateComparisonOperator:(id)a4 migrationState:(int64_t)a5;
- (unint64_t)insertAccount:(id)a3 migrator:(id)a4 device:(id)a5;
- (unint64_t)insertRecordSummary:(id)a3 account:(id)a4;
- (unint64_t)totalSummaryDownloadSegmentCountForAccounts:(id)a3;
- (unint64_t)totalSummaryDownloadedSegmentCountForAccounts:(id)a3;
- (void)_deleteAccounts;
- (void)_deleteSummaries;
- (void)_ensureCorrectSchema;
- (void)_insertStatistics_onDatabaseQueue:(id)a3;
- (void)_onDatabaseQueue_updateMigrationState:(int)a3 forSummary:(id)a4 removeData:(BOOL)a5;
- (void)_openDatabase;
- (void)closeDatabase;
- (void)dealloc;
- (void)deleteAccountsAndSummariesForAllDevices;
- (void)deleteGroupMessageInfoForAllDevices;
- (void)deleteMessagePhoneNumbersForAllDevices;
- (void)deleteMetadataForAllDevices;
- (void)deleteMigratableAppsForAllDevices;
- (void)deleteStatisticsForAllDevices;
- (void)deleteSuggestedAppBundleIDsForAllDevices;
- (void)deleteSummaryDataForAllDevices;
- (void)insertGroupMessageInfoWithSortedHandleIDs:(id)a3 handleIDsAreComplete:(BOOL)a4 roomName:(id)a5 groupID:(id)a6;
- (void)insertGroupMessageInfoWithSourceThreadID:(id)a3 roomName:(id)a4 groupID:(id)a5;
- (void)insertMessagePhoneNumberWithIcc:(id)a3 ccAcNumber:(id)a4;
- (void)insertMetadata:(id)a3 forSourceDevice:(id)a4;
- (void)insertMigratableApp:(id)a3 forDevice:(id)a4;
- (void)removeDataAndSetDidImportForSummary:(id)a3;
- (void)setData:(id)a3 forSummary:(id)a4;
- (void)setDatabasePath:(id)a3;
- (void)setDidDownloadForSummary:(id)a3 forSourceDevice:(id)a4;
- (void)setMetadata:(id)a3 forSourceDevice:(id)a4;
- (void)setMigrationError:(id)a3 forSummary:(id)a4;
- (void)setWillImportForSummary:(id)a3;
- (void)totalSummaryItemSizeForAccounts:(id)a3 addOverhead:(BOOL)a4 completion:(id)a5;
- (void)updateModifiedDateForSummary:(id)a3;
- (void)updateStatistics:(id)a3;
@end

@implementation WLSQLController

- (WLSQLController)init
{
  v8.receiver = self;
  v8.super_class = (Class)WLSQLController;
  v2 = [(WLSQLController *)&v8 init];
  if (v2)
  {
    v3 = NSHomeDirectory();
    v4 = [v3 stringByAppendingPathComponent:@"/Library/WelcomeKit/migration.db"];
    [(WLSQLController *)v2 setDatabasePath:v4];

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.welcomekit.WLSQLController.databaseQueue", 0);
    databaseQueue = v2->_databaseQueue;
    v2->_databaseQueue = (OS_dispatch_queue *)v5;

    [(WLSQLController *)v2 _openDatabase];
  }
  return v2;
}

- (void)dealloc
{
  [(WLSQLController *)self closeDatabase];
  v3.receiver = self;
  v3.super_class = (Class)WLSQLController;
  [(WLSQLController *)&v3 dealloc];
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)deleteMetadataForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WLSQLController_deleteMetadataForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __46__WLSQLController_deleteMetadataForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM metadata", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteAccountsAndSummariesForAllDevices
{
  [(WLSQLController *)self _deleteSummaries];
  [(WLSQLController *)self _deleteAccounts];
}

- (void)deleteMigratableAppsForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WLSQLController_deleteMigratableAppsForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __52__WLSQLController_deleteMigratableAppsForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM migratableApps", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteSuggestedAppBundleIDsForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WLSQLController_deleteSuggestedAppBundleIDsForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __59__WLSQLController_deleteSuggestedAppBundleIDsForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM bundleIDs", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_deleteSummaries
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__WLSQLController__deleteSummaries__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __35__WLSQLController__deleteSummaries__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM summaries", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_deleteAccounts
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WLSQLController__deleteAccounts__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __34__WLSQLController__deleteAccounts__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM accounts", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteSummaryDataForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WLSQLController_deleteSummaryDataForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __49__WLSQLController_deleteSummaryDataForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "UPDATE summaries SET data=NULL", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)insertAccount:(id)a3 migrator:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = -1;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__WLSQLController_insertAccount_migrator_device___block_invoke;
  block[3] = &unk_26490C1C8;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v21 = &v22;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(databaseQueue, block);
  unint64_t v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

uint64_t __49__WLSQLController_insertAccount_migrator_device___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT INTO accounts (identifier, migrator, device) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    objc_super v3 = ppStmt;
    id v4 = [*(id *)(a1 + 40) identifier];
    sqlite3_bind_text(v3, 1, (const char *)[v4 UTF8String], -1, 0);

    dispatch_queue_t v5 = ppStmt;
    id v6 = [*(id *)(a1 + 48) contentType];
    sqlite3_bind_text(v5, 2, (const char *)[v6 UTF8String], -1, 0);

    v7 = [*(id *)(a1 + 56) persistentIdentifier];
    if (![v7 length]) {
      __49__WLSQLController_insertAccount_migrator_device___block_invoke_cold_1();
    }

    id v8 = ppStmt;
    id v9 = [*(id *)(a1 + 56) persistentIdentifier];
    sqlite3_bind_text(v8, 3, (const char *)[v9 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) == 101)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    }
    else
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)accountsForMigrator:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__1;
  uint64_t v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  databaseQueue = self->_databaseQueue;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  unint64_t v15 = __46__WLSQLController_accountsForMigrator_device___block_invoke;
  v16 = &unk_26490C1F0;
  v17 = self;
  id v9 = v7;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  id v20 = &v21;
  dispatch_sync(databaseQueue, &v13);
  v11 = objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

uint64_t __46__WLSQLController_accountsForMigrator_device___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT id, identifier FROM accounts WHERE device=? AND migrator=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    objc_super v3 = [*(id *)(a1 + 40) persistentIdentifier];
    if (![v3 length]) {
      __46__WLSQLController_accountsForMigrator_device___block_invoke_cold_1();
    }

    id v4 = ppStmt;
    id v5 = [*(id *)(a1 + 40) persistentIdentifier];
    sqlite3_bind_text(v4, 1, (const char *)[v5 UTF8String], -1, 0);

    id v6 = ppStmt;
    id v7 = [*(id *)(a1 + 48) contentType];
    sqlite3_bind_text(v6, 2, (const char *)[v7 UTF8String], -1, 0);

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    while (sqlite3_step(ppStmt) == 100)
    {
      v11 = objc_alloc_init(WLSourceDeviceAccount);
      [(WLSourceDeviceAccount *)v11 setSqlID:sqlite3_column_int64(ppStmt, 0)];
      id v12 = sqlite3_column_text(ppStmt, 1);
      if (v12)
      {
        uint64_t v13 = [NSString stringWithUTF8String:v12];
        [(WLSourceDeviceAccount *)v11 setIdentifier:v13];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v11];
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (BOOL)deleteAccountsAndSummariesForMigrator:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  databaseQueue = self->_databaseQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke;
  v12[3] = &unk_26490C1F0;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  unint64_t v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(databaseQueue, v12);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

uint64_t __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM summaries WHERE accountID IN (SELECT id FROM accounts WHERE device=? AND migrator=?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    _WLLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    v2 = [*(id *)(a1 + 40) persistentIdentifier];
    if (![v2 length]) {
      __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_1();
    }

    objc_super v3 = ppStmt;
    id v4 = [*(id *)(a1 + 40) persistentIdentifier];
    sqlite3_bind_text(v3, 1, (const char *)[v4 UTF8String], -1, 0);

    id v5 = ppStmt;
    id v6 = [*(id *)(a1 + 48) contentType];
    sqlite3_bind_text(v5, 2, (const char *)[v6 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM accounts WHERE device=? AND migrator=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    uint64_t result = _WLLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) persistentIdentifier];
    if (![v8 length]) {
      __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_2();
    }

    id v9 = ppStmt;
    id v10 = [*(id *)(a1 + 40) persistentIdentifier];
    sqlite3_bind_text(v9, 1, (const char *)[v10 UTF8String], -1, 0);

    v11 = ppStmt;
    id v12 = [*(id *)(a1 + 48) contentType];
    sqlite3_bind_text(v11, 2, (const char *)[v12 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    return sqlite3_finalize(ppStmt);
  }
  return result;
}

- (unint64_t)insertRecordSummary:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = -1;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__WLSQLController_insertRecordSummary_account___block_invoke;
  v13[3] = &unk_26490C1F0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  uint64_t v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(databaseQueue, v13);
  unint64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __47__WLSQLController_insertRecordSummary_account___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT INTO summaries (accountID, identifier, itemSize, relativePath, modifiedDate, storeDataAsFile, dataFilePath, downloadSegmentCount, metadata, bucket) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, [*(id *)(a1 + 40) sqlID]);
    objc_super v3 = ppStmt;
    id v4 = [*(id *)(a1 + 48) identifier];
    sqlite3_bind_text(v3, 2, (const char *)[v4 UTF8String], -1, 0);

    sqlite3_bind_int64(ppStmt, 3, [*(id *)(a1 + 48) itemSize]);
    id v5 = ppStmt;
    id v6 = [*(id *)(a1 + 48) relativePath];
    sqlite3_bind_text(v5, 4, (const char *)[v6 UTF8String], -1, 0);

    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 48) modifiedDate];
    objc_msgSend(v7, "_sqlite3_bind_NSDate:forStatement:position:", v8, ppStmt, 5);

    sqlite3_bind_int(ppStmt, 6, [*(id *)(a1 + 48) storeDataAsFile]);
    id v9 = [*(id *)(a1 + 48) dataFilePath];

    id v10 = ppStmt;
    if (v9)
    {
      id v11 = [*(id *)(a1 + 48) dataFilePath];
      sqlite3_bind_text(v10, 7, (const char *)[v11 UTF8String], -1, 0);
    }
    else
    {
      sqlite3_bind_null(ppStmt, 7);
    }
    sqlite3_bind_int64(ppStmt, 8, [*(id *)(a1 + 48) downloadSegmentCount]);
    id v12 = [*(id *)(a1 + 48) metadata];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x263F08900];
      id v14 = [*(id *)(a1 + 48) metadata];
      id v25 = 0;
      id v15 = [v13 dataWithJSONObject:v14 options:0 error:&v25];
      id v16 = v25;

      if (v15)
      {
        uint64_t v17 = ppStmt;
        id v18 = v15;
        sqlite3_bind_blob(v17, 9, (const void *)[v18 bytes], objc_msgSend(v18, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        uint64_t v23 = *(void *)(a1 + 48);
        id v24 = v16;
        uint64_t v22 = *(void *)(a1 + 32);
        _WLLog();
        sqlite3_bind_null(ppStmt, 9);
      }
    }
    else
    {
      sqlite3_bind_null(ppStmt, 9);
    }
    uint64_t v19 = objc_msgSend(*(id *)(a1 + 48), "bucket", v22, v23, v24);

    uint64_t v20 = ppStmt;
    if (v19)
    {
      id v21 = [*(id *)(a1 + 48) bucket];
      sqlite3_bind_text(v20, 10, (const char *)[v21 UTF8String], -1, 0);
    }
    else
    {
      sqlite3_bind_null(ppStmt, 10);
    }
    if (sqlite3_step(ppStmt) == 101)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    }
    else
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)totalSummaryDownloadedSegmentCountForAccounts:(id)a3
{
  return [(WLSQLController *)self _totalSummarySegmentCountForAccounts:a3 migrationStateComparisonOperator:@">=" migrationState:1];
}

- (unint64_t)_totalSummarySegmentCountForAccounts:(id)a3 migrationStateComparisonOperator:(id)a4 migrationState:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__WLSQLController__totalSummarySegmentCountForAccounts_migrationStateComparisonOperator_migrationState___block_invoke;
  block[3] = &unk_26490C218;
  id v16 = v8;
  id v17 = v9;
  uint64_t v19 = &v21;
  int64_t v20 = a5;
  id v18 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(databaseQueue, block);
  unint64_t v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __104__WLSQLController__totalSummarySegmentCountForAccounts_migrationStateComparisonOperator_migrationState___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v2 = 0;
    objc_super v3 = &stru_26DF81F20;
    do
    {
      if ([(__CFString *)v3 length]) {
        id v4 = @", ?";
      }
      else {
        id v4 = @"?";
      }
      id v5 = [(__CFString *)v3 stringByAppendingString:v4];

      ++v2;
      objc_super v3 = v5;
    }
    while (v2 < [*(id *)(a1 + 32) count]);
  }
  else
  {
    id v5 = &stru_26DF81F20;
  }
  id v6 = [NSString stringWithFormat:@"SELECT sum(downloadSegmentCount) FROM summaries WHERE accountID IN(%@) AND migrationState %@ ?", v5, *(void *)(a1 + 40)];
  id v7 = (const char *)[v6 UTF8String];

  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 48) + 8), v7, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 48) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 48) + 8));
    _WLLog();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      int v12 = 1;
      do
      {
        uint64_t v13 = 0;
        int v14 = v12;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          sqlite3_bind_int64(ppStmt, v14 + v13, [*(id *)(*((void *)&v16 + 1) + 8 * v13) sqlID]);
          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        int v12 = v14 + v13;
      }
      while (v10);
      int v15 = v14 + v13;
    }
    else
    {
      int v15 = 1;
    }

    sqlite3_bind_int64(ppStmt, v15, *(void *)(a1 + 64));
    while (sqlite3_step(ppStmt) == 100)
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 48) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 48) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 48) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 48) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)totalSummaryItemSizeForAccounts:(id)a3 addOverhead:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  databaseQueue = self->_databaseQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__WLSQLController_totalSummaryItemSizeForAccounts_addOverhead_completion___block_invoke;
  v12[3] = &unk_26490C240;
  id v11 = v8;
  BOOL v16 = a4;
  id v13 = v11;
  int v14 = self;
  int v15 = &v17;
  dispatch_sync(databaseQueue, v12);
  if (v9) {
    v9[2](v9, v18[3], 0);
  }

  _Block_object_dispose(&v17, 8);
}

void __74__WLSQLController_totalSummaryItemSizeForAccounts_addOverhead_completion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v2 = 0;
    objc_super v3 = &stru_26DF81F20;
    do
    {
      if ([(__CFString *)v3 length]) {
        id v4 = @", ?";
      }
      else {
        id v4 = @"?";
      }
      id v5 = [(__CFString *)v3 stringByAppendingString:v4];

      ++v2;
      objc_super v3 = v5;
    }
    while (v2 < [*(id *)(a1 + 32) count]);
  }
  else
  {
    id v5 = &stru_26DF81F20;
  }
  id v6 = [NSString stringWithFormat:@"SELECT sum(itemSize) + max(itemSize) FROM summaries WHERE accountID IN(%@) AND migrationState < ?", v5];
  uint64_t v7 = [v6 UTF8String];

  id v8 = [NSString stringWithFormat:@"SELECT sum(itemSize) FROM summaries WHERE accountID IN(%@) AND migrationState < ?", v5];
  uint64_t v9 = [v8 UTF8String];

  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v10 = (const char *)v7;
  }
  else {
    uint64_t v10 = (const char *)v9;
  }
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 40) + 8), v10, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
    _WLLog();
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      int v15 = 1;
      do
      {
        uint64_t v16 = 0;
        int v17 = v15;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          sqlite3_bind_int64(ppStmt, v17 + v16, [*(id *)(*((void *)&v19 + 1) + 8 * v16) sqlID]);
          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
        int v15 = v17 + v16;
      }
      while (v13);
      int v18 = v17 + v16;
    }
    else
    {
      int v18 = 1;
    }

    sqlite3_bind_int64(ppStmt, v18, 1);
    while (sqlite3_step(ppStmt) == 100)
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(ppStmt, 0);
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)totalSummaryDownloadSegmentCountForAccounts:(id)a3
{
  return [(WLSQLController *)self _totalSummarySegmentCountForAccounts:a3 migrationStateComparisonOperator:@"<" migrationState:1];
}

- (void)setData:(id)a3 forSummary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WLSQLController_setData_forSummary___block_invoke;
  block[3] = &unk_26490C268;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, block);
}

uint64_t __38__WLSQLController_setData_forSummary___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "UPDATE summaries SET data=? WHERE rowID=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    objc_super v3 = *(void **)(a1 + 40);
    if (v3) {
      sqlite3_bind_blob(ppStmt, 1, (const void *)[v3 bytes], objc_msgSend(*(id *)(a1 + 40), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else {
      sqlite3_bind_null(ppStmt, 1);
    }
    sqlite3_bind_int64(ppStmt, 2, [*(id *)(a1 + 48) sqlID]);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)dataForSummary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WLSQLController_dataForSummary___block_invoke;
  block[3] = &unk_26490C290;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __34__WLSQLController_dataForSummary___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT data FROM summaries WHERE rowID=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, [*(id *)(a1 + 40) sqlID]);
    while (sqlite3_step(ppStmt) == 100)
    {
      int v3 = sqlite3_column_bytes(ppStmt, 0);
      if (v3 >= 1)
      {
        uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", sqlite3_column_blob(ppStmt, 0), v3);
        uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
        id v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;
      }
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)setDidDownloadForSummary:(id)a3 forSourceDevice:(id)a4
{
  id v5 = a3;
  databaseQueue = self->_databaseQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__WLSQLController_setDidDownloadForSummary_forSourceDevice___block_invoke;
  v8[3] = &unk_26490C2B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(databaseQueue, v8);
}

uint64_t __60__WLSQLController_setDidDownloadForSummary_forSourceDevice___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDatabaseQueue_updateMigrationState:forSummary:removeData:", 1, *(void *)(a1 + 40), 0);
}

- (void)setWillImportForSummary:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__WLSQLController_setWillImportForSummary___block_invoke;
  v7[3] = &unk_26490C2B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(databaseQueue, v7);
}

uint64_t __43__WLSQLController_setWillImportForSummary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDatabaseQueue_updateMigrationState:forSummary:removeData:", 2, *(void *)(a1 + 40), 0);
}

- (void)removeDataAndSetDidImportForSummary:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__WLSQLController_removeDataAndSetDidImportForSummary___block_invoke;
  v7[3] = &unk_26490C2B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(databaseQueue, v7);
}

uint64_t __55__WLSQLController_removeDataAndSetDidImportForSummary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDatabaseQueue_updateMigrationState:forSummary:removeData:", 3, *(void *)(a1 + 40), 1);
}

- (void)_onDatabaseQueue_updateMigrationState:(int)a3 forSummary:(id)a4 removeData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_databaseQueue);
  if (v5) {
    id v9 = "UPDATE summaries SET data=NULL, migrationState=? WHERE rowID=?";
  }
  else {
    id v9 = "UPDATE summaries SET migrationState=? WHERE rowID=?";
  }
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, v9, -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, a3);
    sqlite3_bind_int64(ppStmt, 2, [v8 sqlID]);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)setMigrationError:(id)a3 forSummary:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "wl_encodableError");
  id v14 = 0;
  id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
  id v9 = v14;
  if (v8)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__WLSQLController_setMigrationError_forSummary___block_invoke;
    block[3] = &unk_26490C268;
    void block[4] = self;
    id v12 = v8;
    id v13 = v6;
    dispatch_sync(databaseQueue, block);
  }
  else
  {
    _WLLog();
  }
}

uint64_t __48__WLSQLController_setMigrationError_forSummary___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "UPDATE summaries SET migrationError=? WHERE rowID=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_blob(ppStmt, 1, (const void *)[*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int64(ppStmt, 2, [*(id *)(a1 + 48) sqlID]);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)migrationErrors
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  databaseQueue = self->_databaseQueue;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __34__WLSQLController_migrationErrors__block_invoke;
  id v12 = &unk_26490C2B8;
  id v13 = self;
  id v14 = v3;
  id v5 = v3;
  dispatch_sync(databaseQueue, &v9);
  if (objc_msgSend(v5, "count", v9, v10, v11, v12, v13)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

uint64_t __34__WLSQLController_migrationErrors__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT migrationError FROM summaries WHERE migrationError IS NOT NULL", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(v1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(v1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v10 = v1;
      do
      {
        int v3 = sqlite3_column_bytes(ppStmt, 0);
        if (v3 >= 1)
        {
          id v4 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", sqlite3_column_blob(ppStmt, 0), v3);
          if (v4)
          {
            id v5 = (void *)MEMORY[0x263F08928];
            id v6 = objc_msgSend(MEMORY[0x263F087E8], "wl_encodableErrorSupportedClasses");
            id v11 = 0;
            id v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:&v11];
            id v8 = v11;

            if (v7)
            {
              [*(id *)(v1 + 40) addObject:v7];
            }
            else
            {
              uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
              _WLLog();

              uint64_t v1 = v10;
            }
          }
        }
      }
      while (sqlite3_step(ppStmt) == 100);
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(v1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(v1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(v1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(v1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)updateModifiedDateForSummary:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__WLSQLController_updateModifiedDateForSummary___block_invoke;
  v7[3] = &unk_26490C2B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(databaseQueue, v7);
}

uint64_t __48__WLSQLController_updateModifiedDateForSummary___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "UPDATE summaries SET modifiedDate=? WHERE rowID=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    int v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) modifiedDate];
    objc_msgSend(v3, "_sqlite3_bind_NSDate:forStatement:position:", v4, ppStmt, 1);

    sqlite3_bind_int64(ppStmt, 2, [*(id *)(a1 + 40) sqlID]);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)summariesForAccount:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[WLSQLController summariesForAccounts:sortedByModifiedDate:](self, "summariesForAccounts:sortedByModifiedDate:", v6, 0, v9, v10);

  return v7;
}

- (id)summariesForAccounts:(id)a3 sortedByModifiedDate:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "sqlID"));
        [v7 setObject:v12 forKey:v13];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__WLSQLController_summariesForAccounts_sortedByModifiedDate___block_invoke;
  block[3] = &unk_26490C2E0;
  id v15 = v8;
  BOOL v24 = a4;
  id v20 = v15;
  long long v21 = self;
  uint64_t v23 = &v29;
  id v16 = v7;
  id v22 = v16;
  dispatch_sync(databaseQueue, block);
  id v17 = (void *)[(id)v30[5] copy];

  _Block_object_dispose(&v29, 8);
  return v17;
}

void __61__WLSQLController_summariesForAccounts_sortedByModifiedDate___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v2 = 0;
    int v3 = &stru_26DF81F20;
    do
    {
      if ([(__CFString *)v3 length]) {
        id v4 = @", ?";
      }
      else {
        id v4 = @"?";
      }
      id v5 = [(__CFString *)v3 stringByAppendingString:v4];

      ++v2;
      int v3 = v5;
    }
    while (v2 < [*(id *)(a1 + 32) count]);
  }
  else
  {
    id v5 = &stru_26DF81F20;
  }
  id v6 = [NSString stringWithFormat:@"SELECT id, identifier, itemSize, relativePath, modifiedDate, storeDataAsFile, dataFilePath, downloadSegmentCount, metadata, accountID, migrationState, bucket FROM summaries WHERE accountID IN(%@) AND migrationState < ?", v5];
  id v7 = v6;
  if (*(unsigned char *)(a1 + 64))
  {
    id v8 = [NSString stringWithFormat:@"%@ %@", v6, @"ORDER BY modifiedDate ASC"];
    uint64_t v9 = (const char *)[v8 UTF8String];
  }
  else
  {
    uint64_t v9 = (const char *)[v6 UTF8String];
  }
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 40) + 8), v9, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
    _WLLog();
  }
  else
  {
    v42 = v7;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v45;
      int v14 = 1;
      do
      {
        uint64_t v15 = 0;
        int v16 = v14;
        do
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v10);
          }
          sqlite3_bind_int64(ppStmt, v16 + v15, [*(id *)(*((void *)&v44 + 1) + 8 * v15) sqlID]);
          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
        int v14 = v16 + v15;
      }
      while (v12);
      int v17 = v16 + v15;
    }
    else
    {
      int v17 = 1;
    }

    sqlite3_bind_int64(ppStmt, v17, 2);
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    while (sqlite3_step(ppStmt) == 100)
    {
      long long v21 = objc_alloc_init(WLSourceDeviceRecordSummary);
      [(WLSourceDeviceRecordSummary *)v21 setSqlID:sqlite3_column_int64(ppStmt, 0)];
      id v22 = sqlite3_column_text(ppStmt, 1);
      if (v22)
      {
        uint64_t v23 = [NSString stringWithUTF8String:v22];
        [(WLSourceDeviceRecordSummary *)v21 setIdentifier:v23];
      }
      [(WLSourceDeviceRecordSummary *)v21 setItemSize:sqlite3_column_int64(ppStmt, 2)];
      BOOL v24 = sqlite3_column_text(ppStmt, 3);
      if (v24)
      {
        long long v25 = [NSString stringWithUTF8String:v24];
        [(WLSourceDeviceRecordSummary *)v21 setRelativePath:v25];
      }
      long long v26 = objc_msgSend(*(id *)(a1 + 40), "_sqlite3_column_NSDateForStatement:column:", ppStmt, 4);
      [(WLSourceDeviceRecordSummary *)v21 setModifiedDate:v26];

      [(WLSourceDeviceRecordSummary *)v21 setStoreDataAsFile:sqlite3_column_int(ppStmt, 5) != 0];
      long long v27 = sqlite3_column_text(ppStmt, 6);
      if (v27)
      {
        long long v28 = [NSString stringWithUTF8String:v27];
        [(WLSourceDeviceRecordSummary *)v21 setDataFilePath:v28];
      }
      [(WLSourceDeviceRecordSummary *)v21 setDownloadSegmentCount:sqlite3_column_int64(ppStmt, 7)];
      int v29 = sqlite3_column_bytes(ppStmt, 8);
      v30 = sqlite3_column_blob(ppStmt, 8);
      if (v30 && v29 >= 1)
      {
        uint64_t v31 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v30 length:v29 freeWhenDone:0];
        if (v31)
        {
          id v43 = 0;
          v32 = [MEMORY[0x263F08900] JSONObjectWithData:v31 options:0 error:&v43];
          id v33 = v43;
          if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [(WLSourceDeviceRecordSummary *)v21 setMetadata:v32];
          }
          else if (v33)
          {
            uint64_t v40 = *(void *)(a1 + 40);
            id v41 = v33;
            _WLLog();
          }
        }
      }
      sqlite3_int64 v34 = sqlite3_column_int64(ppStmt, 9);
      v35 = *(void **)(a1 + 48);
      uint64_t v36 = [NSNumber numberWithUnsignedInteger:v34];
      v37 = [v35 objectForKeyedSubscript:v36];
      [(WLSourceDeviceRecordSummary *)v21 setAccount:v37];

      -[WLSourceDeviceRecordSummary setDidDownload:](v21, "setDidDownload:", sqlite3_column_int(ppStmt, 10) > 0, v40, v41);
      v38 = sqlite3_column_text(ppStmt, 11);
      if (v38)
      {
        v39 = [NSString stringWithUTF8String:v38];
        [(WLSourceDeviceRecordSummary *)v21 setBucket:v39];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v21];
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
    id v7 = v42;
  }
}

- (id)migrationMetadataForSourceDevice:(id)a3 strictMatch:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(WLSourceDeviceMigrationMetadata);
  uint64_t v7 = [v5 osAPIVersion];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_26DF81F20;
  }
  [(WLSourceDeviceMigrationMetadata *)v6 setDeviceOSVersion:v9];

  id v10 = NSString;
  uint64_t v11 = [v5 hardwareBrand];
  uint64_t v12 = [v5 hardwareModel];
  uint64_t v13 = [v5 hardwareDesign];
  int v14 = [v5 hardwareMaker];
  uint64_t v15 = [v5 hardwareProduct];
  int v16 = [v10 stringWithFormat:@"%@/%@/%@/%@/%@", v11, v12, v13, v14, v15];
  [(WLSourceDeviceMigrationMetadata *)v6 setDeviceType:v16];

  int v17 = NSString;
  uint64_t v18 = [v5 hardwareModel];
  uint64_t v19 = [v17 stringWithFormat:@"%@", v18];
  [(WLSourceDeviceMigrationMetadata *)v6 setDeviceModel:v19];

  id v20 = [v5 clientVersion];
  [(WLSourceDeviceMigrationMetadata *)v6 setClientVersion:v20];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke;
  block[3] = &unk_26490C308;
  BOOL v31 = a4;
  void block[4] = self;
  id v29 = v5;
  id v22 = v6;
  v30 = v22;
  id v23 = v5;
  dispatch_sync(databaseQueue, block);
  BOOL v24 = v30;
  long long v25 = v22;

  return v25;
}

uint64_t __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    unint64_t v2 = "SELECT state, communicationDate, attemptCount, crashCount FROM metadata WHERE device=? LIMIT 1";
  }
  else {
    unint64_t v2 = "SELECT state, communicationDate, attemptCount, crashCount FROM metadata LIMIT 1";
  }
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), v2, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v4 = [*(id *)(a1 + 40) persistentIdentifier];
      if (![v4 length]) {
        __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke_cold_1();
      }

      id v5 = ppStmt;
      id v6 = [*(id *)(a1 + 40) persistentIdentifier];
      sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, 0);
    }
    while (sqlite3_step(ppStmt) == 100)
    {
      objc_msgSend(*(id *)(a1 + 48), "setState:", sqlite3_column_int64(ppStmt, 0));
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_sqlite3_column_NSDateForStatement:column:", ppStmt, 1);
      [*(id *)(a1 + 48) setCommunicationDate:v7];

      objc_msgSend(*(id *)(a1 + 48), "setAttemptCount:", sqlite3_column_int64(ppStmt, 2));
      objc_msgSend(*(id *)(a1 + 48), "setCrashCount:", sqlite3_column_int64(ppStmt, 3));
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)insertMetadata:(id)a3 forSourceDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke;
  block[3] = &unk_26490C268;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(databaseQueue, block);
}

uint64_t __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT INTO metadata (device, state, communicationDate, attemptCount, crashCount) VALUES (?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    int v3 = [*(id *)(a1 + 40) persistentIdentifier];
    if (![v3 length]) {
      __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke_cold_1();
    }

    id v4 = ppStmt;
    id v5 = [*(id *)(a1 + 40) persistentIdentifier];
    sqlite3_bind_text(v4, 1, (const char *)[v5 UTF8String], -1, 0);

    sqlite3_bind_int64(ppStmt, 2, [*(id *)(a1 + 48) state]);
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) communicationDate];
    objc_msgSend(v6, "_sqlite3_bind_NSDate:forStatement:position:", v7, ppStmt, 3);

    sqlite3_bind_int64(ppStmt, 4, [*(id *)(a1 + 48) attemptCount]);
    sqlite3_bind_int64(ppStmt, 5, [*(id *)(a1 + 48) crashCount]);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)setMetadata:(id)a3 forSourceDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__WLSQLController_setMetadata_forSourceDevice___block_invoke;
  block[3] = &unk_26490C268;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, block);
}

uint64_t __47__WLSQLController_setMetadata_forSourceDevice___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "UPDATE metadata SET state=?, communicationDate=?, attemptCount=?, crashCount=? WHERE device=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, [*(id *)(a1 + 40) state]);
    int v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) communicationDate];
    objc_msgSend(v3, "_sqlite3_bind_NSDate:forStatement:position:", v4, ppStmt, 2);

    sqlite3_bind_int64(ppStmt, 3, [*(id *)(a1 + 40) attemptCount]);
    sqlite3_bind_int64(ppStmt, 4, [*(id *)(a1 + 40) crashCount]);
    id v5 = [*(id *)(a1 + 48) persistentIdentifier];
    if (![v5 length]) {
      __47__WLSQLController_setMetadata_forSourceDevice___block_invoke_cold_1();
    }

    id v6 = ppStmt;
    id v7 = [*(id *)(a1 + 48) persistentIdentifier];
    sqlite3_bind_text(v6, 5, (const char *)[v7 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)insertMigratableApp:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v14 = 0;
  id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v14];
  id v9 = v14;
  if (v8)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__WLSQLController_insertMigratableApp_forDevice___block_invoke;
    block[3] = &unk_26490C268;
    void block[4] = self;
    id v12 = v7;
    id v13 = v8;
    dispatch_sync(databaseQueue, block);
  }
  else
  {
    _WLLog();
  }
}

uint64_t __49__WLSQLController_insertMigratableApp_forDevice___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT INTO migratableApps (device, data) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    int v3 = [*(id *)(a1 + 40) persistentIdentifier];
    if (![v3 length]) {
      __49__WLSQLController_insertMigratableApp_forDevice___block_invoke_cold_1();
    }

    id v4 = ppStmt;
    id v5 = [*(id *)(a1 + 40) persistentIdentifier];
    sqlite3_bind_text(v4, 1, (const char *)[v5 UTF8String], -1, 0);

    sqlite3_bind_blob(ppStmt, 2, (const void *)[*(id *)(a1 + 48) bytes], objc_msgSend(*(id *)(a1 + 48), "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)_migratableAppsForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WLSQLController__migratableAppsForDevice___block_invoke;
  block[3] = &unk_26490C268;
  id v12 = v4;
  id v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(databaseQueue, block);
  id v9 = (void *)[v7 copy];

  return v9;
}

uint64_t __44__WLSQLController__migratableAppsForDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    int v3 = "SELECT data FROM migratableApps WHERE device=?";
  }
  else {
    int v3 = "SELECT data FROM migratableApps";
  }
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(v2 + 8), v3, -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
    return _WLLog();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    if (v5)
    {
      id v6 = [v5 persistentIdentifier];
      if (![v6 length]) {
        __44__WLSQLController__migratableAppsForDevice___block_invoke_cold_1();
      }

      id v7 = ppStmt;
      id v8 = [*(id *)(a1 + 32) persistentIdentifier];
      sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], -1, 0);
    }
    if (sqlite3_step(ppStmt) == 100)
    {
      unint64_t v9 = 0x263EFF000uLL;
      unint64_t v10 = 0x263F08000uLL;
      do
      {
        int v11 = sqlite3_column_bytes(ppStmt, 0);
        if (v11 >= 1)
        {
          id v12 = objc_msgSend(*(id *)(v9 + 2296), "dataWithBytes:length:", sqlite3_column_blob(ppStmt, 0), v11);
          if (v12)
          {
            id v13 = (void *)MEMORY[0x263F08928];
            id v14 = (void *)MEMORY[0x263EFFA08];
            uint64_t v15 = objc_opt_class();
            uint64_t v16 = objc_opt_class();
            int v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
            id v21 = 0;
            uint64_t v18 = [v13 unarchivedObjectOfClasses:v17 fromData:v12 error:&v21];
            id v19 = v21;

            if (v18)
            {
              [*(id *)(a1 + 48) addObject:v18];
            }
            else
            {
              id v20 = objc_msgSend(*(id *)(v10 + 2584), "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
              unint64_t v9 = 0x263EFF000;
              _WLLog();
            }
            unint64_t v10 = 0x263F08000;
          }
        }
      }
      while (sqlite3_step(ppStmt) == 100);
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 40) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)migratableAppsForAllDevices
{
  return [(WLSQLController *)self _migratableAppsForDevice:0];
}

- (void)insertMessagePhoneNumberWithIcc:(id)a3 ccAcNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__WLSQLController_insertMessagePhoneNumberWithIcc_ccAcNumber___block_invoke;
  block[3] = &unk_26490C268;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, block);
}

uint64_t __62__WLSQLController_insertMessagePhoneNumberWithIcc_ccAcNumber___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT OR IGNORE INTO messagePhoneNumbers (icc, ccAcNumber) VALUES (?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    sqlite3_bind_text(ppStmt, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)messagePhoneNumberIccForCcAcNumber:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WLSQLController_messagePhoneNumberIccForCcAcNumber___block_invoke;
  block[3] = &unk_26490C290;
  void block[4] = self;
  id v10 = v4;
  int v11 = &v12;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __54__WLSQLController_messagePhoneNumberIccForCcAcNumber___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT icc FROM messagePhoneNumbers WHERE ccAcNumber=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    while (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)deleteMessagePhoneNumbersForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__WLSQLController_deleteMessagePhoneNumbersForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __57__WLSQLController_deleteMessagePhoneNumbersForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM messagePhoneNumbers", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)groupMessageInfoMatchingSourceThreadID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__WLSQLController_groupMessageInfoMatchingSourceThreadID___block_invoke;
  block[3] = &unk_26490C290;
  void block[4] = self;
  id v10 = v4;
  int v11 = &v12;
  id v6 = v4;
  dispatch_sync(databaseQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __58__WLSQLController_groupMessageInfoMatchingSourceThreadID___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT roomName, groupID FROM groupMessageInfo WHERE sourceThreadID=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    while (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      uint64_t v5 = +[WLGroupMessageInfo groupMessageInfoWithSourceThreadID:*(void *)(a1 + 40) sortedHandleIDs:0 handleIDsAreComplete:0 roomName:v3 groupID:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)groupMessageInfoMatchingSortedHandleIDs:(id)a3 handleIDsAreComplete:(BOOL)a4 didMatchExactly:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__1;
  id v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke;
  block[3] = &unk_26490C330;
  void block[4] = self;
  id v10 = v8;
  BOOL v24 = a4;
  id v21 = v10;
  id v22 = &v25;
  id v23 = a5;
  dispatch_sync(databaseQueue, block);
  int v11 = (void *)v26[5];
  if (!v11)
  {
    uint64_t v12 = self->_databaseQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke_2;
    v15[3] = &unk_26490C330;
    v15[4] = self;
    BOOL v19 = a4;
    id v16 = v10;
    id v17 = &v25;
    uint64_t v18 = a5;
    dispatch_sync(v12, v15);

    int v11 = (void *)v26[5];
  }
  id v13 = v11;

  _Block_object_dispose(&v25, 8);
  return v13;
}

void __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT roomName, groupID FROM groupMessageInfo WHERE sortedHandleIDs=? AND handleIDsAreComplete=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 40) componentsJoinedByString:@","];
    uint64_t v3 = ppStmt;
    id v4 = v2;
    sqlite3_bind_text(v3, 1, (const char *)[v4 UTF8String], -1, 0);
    sqlite3_bind_int(ppStmt, 2, *(unsigned __int8 *)(a1 + 64));
    while (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
      uint64_t v7 = +[WLGroupMessageInfo groupMessageInfoWithSourceThreadID:0 sortedHandleIDs:*(void *)(a1 + 40) handleIDsAreComplete:*(unsigned __int8 *)(a1 + 64) roomName:v5 groupID:v6];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v10 = *(unsigned char **)(a1 + 56);
      if (v10) {
        *id v10 = 1;
      }
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

void __96__WLSQLController_groupMessageInfoMatchingSortedHandleIDs_handleIDsAreComplete_didMatchExactly___block_invoke_2(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "SELECT sortedHandleIDs, roomName, groupID FROM groupMessageInfo WHERE handleIDsCount=? AND handleIDsAreComplete=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    int v2 = [*(id *)(a1 + 40) count];
    sqlite3_bind_int(ppStmt, 1, v2 - 1);
    int v3 = *(unsigned __int8 *)(a1 + 64);
    sqlite3_bind_int(ppStmt, 2, *(unsigned char *)(a1 + 64) == 0);
    if (sqlite3_step(ppStmt) == 100)
    {
      id v4 = 0;
      while (1)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
        uint64_t v6 = objc_msgSend(v5, "wl_sqlIDComponentsSeparatedByString:", @",");

        uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
        uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 2));
        if (!v4)
        {
          id v4 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
        }
        if ([*(id *)(a1 + 32) _foundHandleIDs:v6 representSameGroupMessageAsHandleIDs:v4 handleIDsAreComplete:*(unsigned __int8 *)(a1 + 64)])break; {

        }
        if (sqlite3_step(ppStmt) != 100) {
          goto LABEL_14;
        }
      }
      uint64_t v9 = +[WLGroupMessageInfo groupMessageInfoWithSourceThreadID:0 sortedHandleIDs:v6 handleIDsAreComplete:v3 == 0 roomName:v7 groupID:v8];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      int v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v12 = *(unsigned char **)(a1 + 56);
      if (v12) {
        *uint64_t v12 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
LABEL_14:
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 101
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) != 100
      && sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) >= 1)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

- (BOOL)_foundHandleIDs:(id)a3 representSameGroupMessageAsHandleIDs:(id)a4 handleIDsAreComplete:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = a4;
  uint64_t v9 = [v7 setWithArray:a3];
  uint64_t v10 = v9;
  if (v5)
  {
    id v11 = v8;
  }
  else
  {
    uint64_t v9 = v8;
    id v11 = v10;
  }
  char v12 = [v9 isSubsetOfSet:v11];

  return v12;
}

- (void)insertGroupMessageInfoWithSourceThreadID:(id)a3 roomName:(id)a4 groupID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__WLSQLController_insertGroupMessageInfoWithSourceThreadID_roomName_groupID___block_invoke;
  v15[3] = &unk_26490C358;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(databaseQueue, v15);
}

uint64_t __77__WLSQLController_insertGroupMessageInfoWithSourceThreadID_roomName_groupID___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT INTO groupMessageInfo (sourceThreadID, roomName, groupID) VALUES (?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[*(id *)(a1 + 40) UTF8String], -1, 0);
    sqlite3_bind_text(ppStmt, 2, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
    sqlite3_bind_text(ppStmt, 3, (const char *)[*(id *)(a1 + 56) UTF8String], -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)insertGroupMessageInfoWithSortedHandleIDs:(id)a3 handleIDsAreComplete:(BOOL)a4 roomName:(id)a5 groupID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__WLSQLController_insertGroupMessageInfoWithSortedHandleIDs_handleIDsAreComplete_roomName_groupID___block_invoke;
  block[3] = &unk_26490C380;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(databaseQueue, block);
}

void __99__WLSQLController_insertGroupMessageInfoWithSortedHandleIDs_handleIDsAreComplete_roomName_groupID___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "INSERT INTO groupMessageInfo (sortedHandleIDs, handleIDsAreComplete, handleIDsCount, roomName, groupID) VALUES (?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    int v2 = [*(id *)(a1 + 40) componentsJoinedByString:@","];
    int v3 = ppStmt;
    id v4 = v2;
    sqlite3_bind_text(v3, 1, (const char *)[v4 UTF8String], -1, 0);
    sqlite3_bind_int(ppStmt, 2, *(unsigned __int8 *)(a1 + 64));
    sqlite3_bind_int(ppStmt, 3, [*(id *)(a1 + 40) count]);
    sqlite3_bind_text(ppStmt, 4, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
    sqlite3_bind_text(ppStmt, 5, (const char *)[*(id *)(a1 + 56) UTF8String], -1, 0);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)deleteGroupMessageInfoForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__WLSQLController_deleteGroupMessageInfoForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __54__WLSQLController_deleteGroupMessageInfoForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM groupMessageInfo", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (id)statisticsForContentType:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[WLStatistics _statisticsWithContentType:v4];
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WLSQLController_statisticsForContentType___block_invoke;
  block[3] = &unk_26490C268;
  void block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(databaseQueue, block);
  id v9 = v14;
  id v10 = v7;

  return v10;
}

uint64_t __44__WLSQLController_statisticsForContentType___block_invoke(id *a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*((sqlite3 **)a1[4] + 1), "SELECT selectedForMigration, downloadDuration, downloadByteCount, importStartDate, importEndDate, importStartBytesFree, importEndBytesFree, importRecordCount, importFailedRecordCount FROM statistics WHERE contentType=? LIMIT 1", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*((sqlite3 **)a1[4] + 1));
    sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[a1[5] UTF8String], -1, 0);
    int v3 = sqlite3_step(ppStmt);
    int v4 = v3;
    while (v3 == 100)
    {
      objc_msgSend(a1[6], "setSelectedForMigration:", sqlite3_column_int(ppStmt, 0) != 0);
      objc_msgSend(a1[6], "setDownloadDuration:", sqlite3_column_int64(ppStmt, 1));
      objc_msgSend(a1[6], "setDownloadByteCount:", sqlite3_column_int64(ppStmt, 2));
      BOOL v5 = objc_msgSend(a1[4], "_sqlite3_column_NSDateForStatement:column:", ppStmt, 3);
      [a1[6] setImportStartDate:v5];

      uint64_t v6 = objc_msgSend(a1[4], "_sqlite3_column_NSDateForStatement:column:", ppStmt, 4);
      [a1[6] setImportEndDate:v6];

      objc_msgSend(a1[6], "setImportStartBytesFree:", sqlite3_column_int64(ppStmt, 5));
      objc_msgSend(a1[6], "setImportEndBytesFree:", sqlite3_column_int64(ppStmt, 6));
      objc_msgSend(a1[6], "setImportRecordCount:", sqlite3_column_int64(ppStmt, 7));
      objc_msgSend(a1[6], "setImportFailedRecordCount:", sqlite3_column_int64(ppStmt, 8));
      int v3 = sqlite3_step(ppStmt);
    }
    if (sqlite3_errcode(*((sqlite3 **)a1[4] + 1)) != 101 && sqlite3_errcode(*((sqlite3 **)a1[4] + 1)) >= 1)
    {
      sqlite3_errcode(*((sqlite3 **)a1[4] + 1));
      sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
      _WLLog();
    }
    uint64_t result = sqlite3_finalize(ppStmt);
    if (v4 != 100) {
      return objc_msgSend(a1[4], "_insertStatistics_onDatabaseQueue:", a1[6]);
    }
  }
  return result;
}

- (void)updateStatistics:(id)a3
{
  id v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__WLSQLController_updateStatistics___block_invoke;
  v7[3] = &unk_26490C2B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(databaseQueue, v7);
}

uint64_t __36__WLSQLController_updateStatistics___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "UPDATE statistics SET selectedForMigration=?, downloadDuration=?, downloadByteCount=?, importStartDate=?, importEndDate=?, importStartBytesFree=?, importEndBytesFree=?, importRecordCount=?, importFailedRecordCount=? WHERE contentType=?", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, [*(id *)(a1 + 40) selectedForMigration]);
    sqlite3_bind_int64(ppStmt, 2, [*(id *)(a1 + 40) downloadDuration]);
    sqlite3_bind_int64(ppStmt, 3, [*(id *)(a1 + 40) downloadByteCount]);
    int v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) importStartDate];
    objc_msgSend(v3, "_sqlite3_bind_NSDate:forStatement:position:", v4, ppStmt, 4);

    BOOL v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) importEndDate];
    objc_msgSend(v5, "_sqlite3_bind_NSDate:forStatement:position:", v6, ppStmt, 5);

    sqlite3_bind_int64(ppStmt, 6, [*(id *)(a1 + 40) importStartBytesFree]);
    sqlite3_bind_int64(ppStmt, 7, [*(id *)(a1 + 40) importEndBytesFree]);
    sqlite3_bind_int64(ppStmt, 8, [*(id *)(a1 + 40) importRecordCount]);
    sqlite3_bind_int64(ppStmt, 9, [*(id *)(a1 + 40) importFailedRecordCount]);
    id v7 = ppStmt;
    id v8 = [*(id *)(a1 + 40) contentType];
    sqlite3_bind_text(v7, 10, (const char *)[v8 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_insertStatistics_onDatabaseQueue:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, "INSERT INTO statistics (contentType, selectedForMigration, downloadDuration, downloadByteCount, importStartDate, importEndDate, importStartBytesFree, importEndBytesFree, importRecordCount, importFailedRecordCount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &ppStmt, 0))
  {
    sqlite3_errcode(self->_database);
    sqlite3_errmsg(self->_database);
    _WLLog();
  }
  else
  {
    BOOL v5 = ppStmt;
    id v6 = [v4 contentType];
    sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, 0);

    sqlite3_bind_int(ppStmt, 2, [v4 selectedForMigration]);
    sqlite3_bind_int64(ppStmt, 3, [v4 downloadDuration]);
    sqlite3_bind_int64(ppStmt, 4, [v4 downloadByteCount]);
    id v7 = [v4 importStartDate];
    [(WLSQLController *)self _sqlite3_bind_NSDate:v7 forStatement:ppStmt position:5];

    id v8 = [v4 importEndDate];
    [(WLSQLController *)self _sqlite3_bind_NSDate:v8 forStatement:ppStmt position:6];

    sqlite3_bind_int64(ppStmt, 7, [v4 importStartBytesFree]);
    sqlite3_bind_int64(ppStmt, 8, [v4 importEndBytesFree]);
    sqlite3_bind_int64(ppStmt, 9, [v4 importRecordCount]);
    sqlite3_bind_int64(ppStmt, 10, [v4 importFailedRecordCount]);
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(self->_database);
      sqlite3_errmsg(self->_database);
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)deleteStatisticsForAllDevices
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WLSQLController_deleteStatisticsForAllDevices__block_invoke;
  block[3] = &unk_26490C1A0;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __48__WLSQLController_deleteStatisticsForAllDevices__block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare(*(sqlite3 **)(*(void *)(a1 + 32) + 8), "DELETE FROM statistics", -1, &ppStmt, 0))
  {
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    return _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    return sqlite3_finalize(ppStmt);
  }
}

- (void)_openDatabase
{
  id v8 = [(NSString *)self->_databasePath stringByDeletingLastPathComponent];
  if (v8)
  {
    int v3 = [MEMORY[0x263F08850] defaultManager];
    char v4 = [v3 fileExistsAtPath:v8];

    if ((v4 & 1) == 0)
    {
      BOOL v5 = [MEMORY[0x263F08850] defaultManager];
      [v5 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  if (sqlite3_open([(NSString *)self->_databasePath UTF8String], &self->_database))
  {
    id v6 = self;
    databasePath = self->_databasePath;
    _WLLog();
  }
  [(WLSQLController *)self _performQuery:@"pragma foreign_keys=on", 0, v6, databasePath rowHandler];
  [(WLSQLController *)self _ensureCorrectSchema];
}

- (void)closeDatabase
{
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__WLSQLController_closeDatabase__block_invoke;
  block[3] = &unk_26490C1A0;
  void block[4] = self;
  dispatch_sync(databaseQueue, block);
}

sqlite3 *__32__WLSQLController_closeDatabase__block_invoke(uint64_t a1)
{
  uint64_t result = *(sqlite3 **)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t result = (sqlite3 *)sqlite3_close(result);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
  return result;
}

- (void)_ensureCorrectSchema
{
  if ([(WLSQLController *)self _schemaVersion] != 12)
  {
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS metadata" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE metadata (id INTEGER PRIMARY KEY, device TEXT NOT NULL, communicationDate INTEGER, state INTEGER, attemptCount INTEGER, crashCount INTEGER)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS accounts" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE accounts (id INTEGER PRIMARY KEY, identifier TEXT, device TEXT, migrator TEXT)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS summaries" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE summaries (id INTEGER PRIMARY KEY, accountID INTEGER REFERENCES accounts(id), identifier TEXT, migrationState INTEGER DEFAULT 0, itemSize INTEGER, relativePath TEXT, modifiedDate INTEGER, storeDataAsFile INTEGER, dataFilePath TEXT, downloadSegmentCount INTEGER CHECK (downloadSegmentCount > 0), metadata BLOB, data BLOB, migrationError BLOB DEFAULT NULL, bucket TEXT)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS migratableApps" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE migratableApps (id INTEGER PRIMARY KEY, device TEXT, data BLOB)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS bundleIDs" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE bundleIDs (id INTEGER PRIMARY KEY, device TEXT NOT NULL, bundleID TEXT NOT NULL)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP INDEX IF EXISTS messagePhoneNumbers_index" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS messagePhoneNumbers" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE messagePhoneNumbers (icc TEXT NOT NULL, ccAcNumber TEXT NOT NULL, PRIMARY KEY (icc, ccAcNumber))" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE INDEX messagePhoneNumbers_index ON messagePhoneNumbers(ccAcNumber)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS groupMessageInfo" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE groupMessageInfo (id INTEGER PRIMARY KEY, sourceThreadID TEXT UNIQUE, sortedHandleIDs TEXT UNIQUE, handleIDsAreComplete INTEGER, handleIDsCount INTEGER, roomName TEXT NOT NULL, groupID TEXT NOT NULL)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS statistics" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE statistics (contentType TEXT PRIMARY KEY, selectedForMigration INTEGER, downloadDuration INTEGER, downloadByteCount INTEGER, importStartDate INTEGER, importEndDate INTEGER, importStartBytesFree INTEGER, importEndBytesFree INTEGER, importRecordCount INTEGER, importFailedRecordCount INTEGER)" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"DROP TABLE IF EXISTS databaseProperties" rowHandler:0];
    [(WLSQLController *)self _performQuery:@"CREATE TABLE databaseProperties (key TEXT PRIMARY KEY, value TEXT)" rowHandler:0];
    id v3 = [NSString stringWithFormat:@"INSERT INTO databaseProperties (key, value) VALUES ('schemaVersion', '%@')", &unk_26DF8E5D0];
    [(WLSQLController *)self _performQuery:v3 rowHandler:0];
  }
}

- (int64_t)_schemaVersion
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__WLSQLController__schemaVersion__block_invoke;
  v4[3] = &unk_26490C3A8;
  v4[4] = &v5;
  [(WLSQLController *)self _performQuery:@"SELECT value FROM databaseProperties WHERE key='schemaVersion'" rowHandler:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__WLSQLController__schemaVersion__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v3 = sqlite3_column_text(a2, 0);
  if (v3)
  {
    id v4 = [NSString stringWithUTF8String:v3];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v4 integerValue];
  }
}

- (int64_t)_performQuery:(id)a3 rowHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = -1;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__WLSQLController__performQuery_rowHandler___block_invoke;
  v13[3] = &unk_26490C3D0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(databaseQueue, v13);
  int64_t v11 = *((int *)v18 + 6);

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __44__WLSQLController__performQuery_rowHandler___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 8), (const char *)[*(id *)(a1 + 40) UTF8String], -1, &ppStmt, 0))
  {
    int64_t v2 = (objc_class *)objc_opt_class();
    id v3 = NSStringFromClass(v2);
    sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
    _WLLog();
  }
  else
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      int v4 = 0;
      do
      {
        uint64_t v5 = *(void *)(a1 + 48);
        if (v5) {
          (*(void (**)(uint64_t, sqlite3_stmt *))(v5 + 16))(v5, ppStmt);
        }
        ++v4;
      }
      while (sqlite3_step(ppStmt) == 100);
    }
    else
    {
      int v4 = 0;
    }
    if (sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) == 101
      || sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8)) < 1)
    {
      uint64_t v8 = [*(id *)(a1 + 40) uppercaseString];
      int v9 = [v8 hasPrefix:@"INSERT"];

      if (v9)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      }
      else
      {
        id v10 = [*(id *)(a1 + 40) uppercaseString];
        int v11 = [v10 hasPrefix:@"SELECT"];

        if (v11) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;
        }
        else {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_changes(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
        }
      }
    }
    else
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      sqlite3_errcode(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
      _WLLog();
    }
    sqlite3_finalize(ppStmt);
  }
}

+ (int64_t)persistentValueForDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return (uint64_t)v3;
}

- (id)_sqlite3_column_NSDateForStatement:(sqlite3_stmt *)a3 column:(int)a4
{
  int v4 = (void *)sqlite3_column_int64(a3, a4);
  if (v4)
  {
    int v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(uint64_t)v4];
  }
  return v4;
}

- (int)_sqlite3_bind_NSDate:(id)a3 forStatement:(sqlite3_stmt *)a4 position:(int)a5
{
  sqlite3_int64 v7 = +[WLSQLController persistentValueForDate:a3];
  return sqlite3_bind_int64(a4, a5, v7);
}

- (void)setDatabasePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
}

void __49__WLSQLController_insertAccount_migrator_device___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController insertAccount:migrator:device:]_block_invoke", "WLSQLController.m", 214, "device.persistentIdentifier.length != 0");
}

void __46__WLSQLController_accountsForMigrator_device___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController accountsForMigrator:device:]_block_invoke", "WLSQLController.m", 248, "device.persistentIdentifier.length != 0");
}

void __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController deleteAccountsAndSummariesForMigrator:device:]_block_invoke", "WLSQLController.m", 285, "device.persistentIdentifier.length != 0");
}

void __64__WLSQLController_deleteAccountsAndSummariesForMigrator_device___block_invoke_cold_2()
{
  __assert_rtn("-[WLSQLController deleteAccountsAndSummariesForMigrator:device:]_block_invoke", "WLSQLController.m", 302, "device.persistentIdentifier.length != 0");
}

void __64__WLSQLController_migrationMetadataForSourceDevice_strictMatch___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController migrationMetadataForSourceDevice:strictMatch:]_block_invoke", "WLSQLController.m", 798, "device.persistentIdentifier.length != 0");
}

void __50__WLSQLController_insertMetadata_forSourceDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController insertMetadata:forSourceDevice:]_block_invoke", "WLSQLController.m", 831, "device.persistentIdentifier.length != 0");
}

void __47__WLSQLController_setMetadata_forSourceDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController setMetadata:forSourceDevice:]_block_invoke", "WLSQLController.m", 867, "device.persistentIdentifier.length != 0");
}

void __49__WLSQLController_insertMigratableApp_forDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController insertMigratableApp:forDevice:]_block_invoke", "WLSQLController.m", 899, "device.persistentIdentifier.length != 0");
}

void __44__WLSQLController__migratableAppsForDevice___block_invoke_cold_1()
{
  __assert_rtn("-[WLSQLController _migratableAppsForDevice:]_block_invoke", "WLSQLController.m", 940, "device.persistentIdentifier.length != 0");
}

@end