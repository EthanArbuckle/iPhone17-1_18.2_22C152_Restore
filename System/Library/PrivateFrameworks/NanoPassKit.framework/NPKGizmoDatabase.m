@interface NPKGizmoDatabase
+ (id)_migrationDataSource;
+ (id)_migrationDelegateQueue;
+ (id)sharedDatabase;
+ (int64_t)maxDatabaseVersion;
+ (unint64_t)latestWatchOSMajorVersion;
+ (void)setMigrationDataSource:(id)a3;
- (BOOL)_executeSQL:(id)a3;
- (BOOL)_getDeletePendingForUniqueID:(id)a3;
- (BOOL)_migrateDatabase:(id)a3;
- (BOOL)_passDBIsAvailableLocked;
- (BOOL)_preconditionsMetForDatabaseOpen;
- (BOOL)_removePassWithUniqueIDLocked:(id)a3;
- (BOOL)_repairEncodedImagesDuringMigration:(id)a3;
- (BOOL)_table:(id)a3 containsColumn:(id)a4;
- (BOOL)_updateAvailableActionsDuringMigration:(id)a3;
- (BOOL)_updateCompleteLocalHashesDuringMigration:(id)a3;
- (BOOL)_updateCompleteRemoteHashesDuringMigration;
- (BOOL)_updateDeviceAndPreferredPaymentApplicationsDuringMigration:(id)a3;
- (BOOL)_updateDevicePaymentApplicationsDuringMigration:(id)a3;
- (BOOL)_updateEffectivePaymentApplicationStateDuringMigration:(id)a3;
- (BOOL)_updateEncodedImageSetsDuringMigration:(id)a3;
- (BOOL)_updateEncodedPaymentPassDuringMigration:(id)a3;
- (BOOL)_updateExpressPassTypesMaskDuringMigration:(id)a3;
- (BOOL)_updateFrontAndBackFieldBucketsDuringMigration:(id)a3;
- (BOOL)_updateHasStoredValueDuringMigration:(id)a3;
- (BOOL)_updateHasUserSelectableContactlessPaymentApplications:(id)a3;
- (BOOL)_updateIngestedDatesDuringMigration:(id)a3;
- (BOOL)_updateIssuerCountryCodesDuringMigration:(id)a3;
- (BOOL)_updateLocalizedDescriptionDuringMigration:(id)a3;
- (BOOL)_updateNFCPayloadDuringMigration:(id)a3;
- (BOOL)_updateOrganizationNamesDuringMigration:(id)a3;
- (BOOL)_updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration:(id)a3;
- (BOOL)_updatePrivateLabelAndCobrandDuringMigration:(id)a3;
- (BOOL)_updateSettingsDuringMigration:(id)a3;
- (BOOL)_updateTransactionSourceIdentifiersDuringMigration:(id)a3;
- (BOOL)hasPassesMatchingPassDescriptionPredicate:(id)a3;
- (BOOL)passDBIsAvailable;
- (NPKGizmoDatabase)init;
- (NSArray)passDescriptions;
- (NSData)libraryHash;
- (NSDictionary)manifestHashes;
- (id)_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:(id)a3;
- (id)_decodeObjectOfClass:(Class)a3 fromStatement:(sqlite3_stmt *)a4 column:(int)a5;
- (id)_decodeObjectOfClasses:(id)a3 fromStatement:(sqlite3_stmt *)a4 column:(int)a5;
- (id)_diffForUniqueIDLocked:(id)a3;
- (id)_getPreferredPaymentApplicationForPaymentPass:(id)a3 aid:(id *)a4;
- (id)_lastAddValueAmountForPassWithUniqueIDLocked:(id)a3;
- (id)_libraryHashLockedForWatchOSMajorVersion:(unint64_t)a3;
- (id)_passForUniqueIDLocked:(id)a3 includeImageSets:(BOOL)a4;
- (id)_passUniqueIdentifierForTransactionSourceIdentifierLocked:(id)a3;
- (id)_paymentBalancesForPassWithUniqueIDLocked:(id)a3;
- (id)_pendingAddValueDateForPassWithUniqueIDLocked:(id)a3;
- (id)_subcredentialsForPassWithUniqueIDLocked:(id)a3;
- (id)_transactionSourceIdentifierForPassUniqueIdentifierLocked:(id)a3;
- (id)_transactionSourceIdentifierForTransactionWithIdentifierLocked:(id)a3;
- (id)_transactionSourceIdentifierForTransactionWithServiceIdentifierLocked:(id)a3;
- (id)_transactionWithIdentifierLocked:(id)a3;
- (id)_transactionWithServiceIdentifierLocked:(id)a3;
- (id)_transactionsForTransactionSourceIdentifierLocked:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderByDate:(int64_t)a8 limit:(unint64_t)a9;
- (id)_transitAppletStateForPassWithUniqueIDLocked:(id)a3;
- (id)currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:(id)a3;
- (id)diffForUniqueID:(id)a3;
- (id)filteredPassesUsingPassDescriptionPredicate:(id)a3 includeImageSets:(BOOL)a4;
- (id)lastAddValueAmountForPassWithUniqueID:(id)a3;
- (id)libraryHashForWatchOSMajorVersion:(unint64_t)a3;
- (id)manifestHashesForWatchOSMajorVersion:(unint64_t)a3;
- (id)passForUniqueID:(id)a3;
- (id)passForUniqueID:(id)a3 includeImageSets:(BOOL)a4;
- (id)passUniqueIDForTransactionSourceIdentifier:(id)a3;
- (id)paymentBalancesForPassWithUniqueID:(id)a3;
- (id)pendingAddValueDateForPassWithUniqueID:(id)a3;
- (id)preferredPaymentApplicationForPaymentPass:(id)a3;
- (id)rebuildDatabaseWithPasses:(id)a3;
- (id)removePassWithUniqueID:(id)a3;
- (id)restoreBlockForVolatilePassData;
- (id)savePass:(id)a3 isLocalPass:(BOOL)a4;
- (id)subcredentialsForPassWithUniqueID:(id)a3;
- (id)transactionSourceIdentifierForPassWithUniqueID:(id)a3;
- (id)transactionSourceIdentifierForTransactionWithIdentifier:(id)a3;
- (id)transactionSourceIdentifierForTransactionWithServiceIdentifier:(id)a3;
- (id)transactionSourcesForPassWithUniqueID:(id)a3;
- (id)transactionWithIdentifier:(id)a3;
- (id)transactionWithServiceIdentifier:(id)a3;
- (id)transactionsForTransactionSourceIdentifier:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9;
- (id)transitAppletStateForPassWithUniqueID:(id)a3;
- (int64_t)_databaseVersionExists:(BOOL *)a3 valid:(BOOL *)a4;
- (sqlite3)database;
- (sqlite3_stmt)currentEphemeralTransactionIdentifierStatement;
- (sqlite3_stmt)deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
- (sqlite3_stmt)deleteStatement;
- (sqlite3_stmt)deleteTransactionSourceIdentifierForPassStatement;
- (sqlite3_stmt)deleteTransactionsForTransactionSourceStatement;
- (sqlite3_stmt)insertDiffStatement;
- (sqlite3_stmt)insertEphemeralTransactionStatement;
- (sqlite3_stmt)insertStatement;
- (sqlite3_stmt)insertTransactionSourceIdentifierForPassStatement;
- (sqlite3_stmt)insertTransactionStatement;
- (sqlite3_stmt)removeTransactionStatement;
- (sqlite3_stmt)removeTransactionWithServiceIdentifierStatement;
- (sqlite3_stmt)selectBalancesForPassStatement;
- (sqlite3_stmt)selectDeletePendingStatement;
- (sqlite3_stmt)selectLastAddValueAmountForPassStatement;
- (sqlite3_stmt)selectPassAndImageSetsDataStatement;
- (sqlite3_stmt)selectPassDataStatement;
- (sqlite3_stmt)selectPassDiffStatement;
- (sqlite3_stmt)selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
- (sqlite3_stmt)selectPendingAddValueDateForPassStatement;
- (sqlite3_stmt)selectPreferredAIDStatement;
- (sqlite3_stmt)selectSubcredentialsForPassStatement;
- (sqlite3_stmt)selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
- (sqlite3_stmt)selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
- (sqlite3_stmt)selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement;
- (sqlite3_stmt)selectTransactionWithIdentifierStatement;
- (sqlite3_stmt)selectTransactionWithServiceIdentifierStatement;
- (sqlite3_stmt)selectTransactionsStatementWithTransactionSource:(unint64_t)a3 orderByDate:(int64_t)a4 limit:(unint64_t)a5;
- (sqlite3_stmt)selectTransitAppletStateForPassStatement;
- (sqlite3_stmt)trimTransactionsForTransactionSourceStatement;
- (sqlite3_stmt)updateBalancesForPassStatement;
- (sqlite3_stmt)updateDeletePendingStatement;
- (sqlite3_stmt)updateLastAddValueAmountForPassStatement;
- (sqlite3_stmt)updatePendingAddValueDateForPassStatement;
- (sqlite3_stmt)updatePreferredAIDStatement;
- (sqlite3_stmt)updateSubcredentialsForPassStatement;
- (sqlite3_stmt)updateTransitAppletStateForPassStatement;
- (unint64_t)numberOfPasses;
- (void)_attemptDatabaseOpen;
- (void)_createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:(id)a3;
- (void)_enumerateAllPassesForMigration:(id)a3;
- (void)_executeSQLQuery:(id)a3 processResultsBlock:(id)a4;
- (void)_handleDatabaseChangedExternally;
- (void)_handleFirstUnlock;
- (void)_handleHasMigrationDataSource;
- (void)_inQueue_teardownDB;
- (void)_insertDatabaseVersionRow:(int64_t)a3;
- (void)_loadInitialManifestLocked;
- (void)_notifyDatabaseChangedExternally;
- (void)_notifyDatabaseChangedWithNoop:(BOOL)a3;
- (void)_notifyDatabaseChangedWithNoop:(BOOL)a3 firstUnlock:(BOOL)a4;
- (void)_notifyForFirstUnlock;
- (void)_performTransactionWithBlock:(id)a3;
- (void)_rebuildDatabaseWithPassesFromCompanionPasses;
- (void)_removeTransactionSourceIdentifierForPassWithUniqueIDLocked:(id)a3;
- (void)_removeTransactionWithIdentifier:(id)a3;
- (void)_removeTransactionWithServiceIdentifierLocked:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_removeTransactionsForTransactionSource:(id)a3;
- (void)_saveDiffLocked:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_savePassLocked:(id)a3 locallyAdded:(BOOL)a4 wasUpdate:(BOOL *)a5;
- (void)_saveTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 withPaymentCredentialType:(int64_t)a5 shouldTrim:(BOOL)a6;
- (void)_saveTransactionLocked:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_setCurrentEphemeralTransactionIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)_setLastAddValueAmountLocked:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_setPaymentBalancesLocked:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_setPendingAddValueDateLocked:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_setSubcredentialsLocked:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_setTransitAppletStateLocked:(id)a3 forPassWithUniqueID:(id)a4;
- (void)_trimTransactionsForTransactionSourceIdentifierLocked:(id)a3 withPaymentCredentialType:(int64_t)a4;
- (void)_updateDatabaseVersionRow:(int64_t)a3;
- (void)_verifyPassDataIsUnarchivedCorrectlyWithData:(id)a3 forPassWithUniqueID:(id)a4;
- (void)dealloc;
- (void)enumerateAllPassesAndDescriptionsWithBlock:(id)a3 includeImageSets:(BOOL)a4;
- (void)enumerateAllPassesWithBlock:(id)a3 includeImageSets:(BOOL)a4;
- (void)removeTransactionWithIdentifier:(id)a3;
- (void)removeTransactionsForTransactionSource:(id)a3;
- (void)saveDiff:(id)a3 forPassWithUniqueID:(id)a4;
- (void)saveTransaction:(id)a3 forPass:(id)a4;
- (void)setCurrentEphemeralTransactionIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)setDeletePending:(BOOL)a3 forUniqueID:(id)a4;
- (void)setLastAddValueAmount:(id)a3 forPassWithUniqueID:(id)a4;
- (void)setPassDBIsAvailable:(BOOL)a3;
- (void)setPaymentBalances:(id)a3 forPassWithUniqueID:(id)a4;
- (void)setPendingAddValueDate:(id)a3 forPassWithUniqueID:(id)a4;
- (void)setPreferredPaymentApplication:(id)a3 forPaymentPass:(id)a4;
- (void)setSubcredentials:(id)a3 forPassWithUniqueID:(id)a4;
- (void)setTransitAppletState:(id)a3 forPassWithUniqueID:(id)a4;
- (void)teardownDB;
@end

@implementation NPKGizmoDatabase

+ (id)sharedDatabase
{
  if (sharedDatabase_onceToken != -1) {
    dispatch_once(&sharedDatabase_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)sharedDatabase_sharedDatabase;
  return v2;
}

void __34__NPKGizmoDatabase_sharedDatabase__block_invoke()
{
  v0 = objc_alloc_init(NPKGizmoDatabase);
  v1 = (void *)sharedDatabase_sharedDatabase;
  sharedDatabase_sharedDatabase = (uint64_t)v0;
}

+ (int64_t)maxDatabaseVersion
{
  return 60;
}

+ (id)_migrationDelegateQueue
{
  if (_migrationDelegateQueue_onceToken != -1) {
    dispatch_once(&_migrationDelegateQueue_onceToken, &__block_literal_global_222);
  }
  v2 = (void *)_migrationDelegateQueue_queue;
  return v2;
}

void __43__NPKGizmoDatabase__migrationDelegateQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("NPKGizmoDatabaseMigrationDelegateQueue", 0);
  v1 = (void *)_migrationDelegateQueue_queue;
  _migrationDelegateQueue_queue = (uint64_t)v0;
}

+ (id)_migrationDataSource
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  v2 = [a1 _migrationDelegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NPKGizmoDatabase__migrationDataSource__block_invoke;
  block[3] = &unk_2644D30F8;
  block[4] = &v6;
  dispatch_sync(v2, block);

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__NPKGizmoDatabase__migrationDataSource__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&__MigrationDataSource);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

+ (void)setMigrationDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v5 = [a1 _migrationDelegateQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __43__NPKGizmoDatabase_setMigrationDataSource___block_invoke;
  id v11 = &unk_2644D2960;
  v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, &v8);

  if (v6 && !*((unsigned char *)v15 + 24))
  {
    v7 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v8, v9, v10, v11);
    [v7 postNotificationName:@"NPKGizmoDatabaseMigrationDataSourceSetNotification" object:0];
  }
  _Block_object_dispose(&v14, 8);
}

id __43__NPKGizmoDatabase_setMigrationDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained(&__MigrationDataSource);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = WeakRetained != 0;

  uint64_t v3 = *(void **)(a1 + 32);
  return objc_storeWeak(&__MigrationDataSource, v3);
}

- (NPKGizmoDatabase)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPKGizmoDatabase;
  v2 = [(NPKGizmoDatabase *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoPassbook.NPKGizmoDatabase", 0);
    dbQueue = v2->_dbQueue;
    v2->_dbQueue = (OS_dispatch_queue *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NPKGizmoDatabaseChangedExternally, (CFStringRef)_NPKGizmoDatabaseExternallyChangedNotificationName, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_NPKGizmoDatabaseKeybagFirstUnlock, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleHasMigrationDataSource name:@"NPKGizmoDatabaseMigrationDataSourceSetNotification" object:0];
    [(NPKGizmoDatabase *)v2 setPassDBIsAvailable:0];
  }
  return v2;
}

- (void)dealloc
{
  sqlite3_finalize(self->_deleteStatement);
  sqlite3_finalize(self->_insertStatement);
  sqlite3_finalize(self->_insertDiffStatement);
  sqlite3_finalize(self->_selectPassDataStatement);
  sqlite3_finalize(self->_selectPassAndImageSetsDataStatement);
  sqlite3_finalize(self->_selectPassDiffStatement);
  sqlite3_finalize(self->_updateDeletePendingStatement);
  sqlite3_finalize(self->_selectDeletePendingStatement);
  sqlite3_finalize(self->_updatePreferredAIDStatement);
  sqlite3_finalize(self->_selectPreferredAIDStatement);
  sqlite3_finalize(self->_insertTransactionStatement);
  sqlite3_finalize(self->_removeTransactionStatement);
  sqlite3_finalize(self->_removeTransactionWithServiceIdentifier);
  sqlite3_finalize(self->_selectTransactionsStatement);
  sqlite3_finalize(self->_selectTransactionsStatementWithSource);
  sqlite3_finalize(self->_selectTransactionsStatementWithoutSource);
  sqlite3_finalize(self->_selectTransactionWithIdentifierStatement);
  sqlite3_finalize(self->_selectTransactionWithServiceIdentifierStatement);
  sqlite3_finalize(self->_insertTransactionSourceIdentifierForPassStatement);
  sqlite3_finalize(self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement);
  sqlite3_finalize(self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement);
  sqlite3_finalize(self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement);
  sqlite3_finalize(self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement);
  sqlite3_finalize(self->_deleteTransactionSourceIdentifierForPassStatement);
  sqlite3_finalize(self->_deleteTransactionsForTransactionSourceStatement);
  sqlite3_finalize(self->_trimTransactionsForTransactionSourceStatement);
  sqlite3_finalize(self->_selectTransitAppletStateForPassStatement);
  sqlite3_finalize(self->_updateTransitAppletStateForPassStatement);
  sqlite3_finalize(self->_insertEphemeralTransactionStatement);
  sqlite3_finalize(self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement);
  sqlite3_finalize(self->_currentEphemeralTransactionIdentifierStatement);
  sqlite3_finalize(self->_selectLastAddValueAmountForPassStatement);
  sqlite3_finalize(self->_updateLastAddValueAmountForPassStatement);
  sqlite3_finalize(self->_selectPendingAddValueDateForPassStatement);
  sqlite3_finalize(self->_updatePendingAddValueDateForPassStatement);
  sqlite3_finalize(self->_selectBalancesForPassStatement);
  sqlite3_finalize(self->_updateBalancesForPassStatement);
  sqlite3_finalize(self->_selectSubcredentialsForPassStatement);
  sqlite3_finalize(self->_updateSubcredentialsForPassStatement);
  sqlite3_close(self->_database);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)NPKGizmoDatabase;
  [(NPKGizmoDatabase *)&v5 dealloc];
}

- (BOOL)_executeSQL:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  errmsg = 0;
  objc_super v5 = [(NPKGizmoDatabase *)self database];
  id v6 = v4;
  int v7 = sqlite3_exec(v5, (const char *)[v6 UTF8String], 0, 0, &errmsg);
  if (v7)
  {
    objc_super v8 = errmsg;
    if (!errmsg) {
      objc_super v8 = (void *)sqlite3_errmsg([(NPKGizmoDatabase *)self database]);
    }
    uint64_t v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      id v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_opt_class();
        *(_DWORD *)buf = 138413058;
        char v17 = v12;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 1024;
        int v21 = v7;
        __int16 v22 = 2080;
        v23 = v8;
        id v13 = v12;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: %@: Could not execute SQL: %@: [%d, %s]", buf, 0x26u);
      }
    }
  }

  return v7 == 0;
}

- (void)_executeSQLQuery:(id)a3 processResultsBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, sqlite3_stmt *))a4;
  ppStmt = 0;
  objc_super v8 = [(NPKGizmoDatabase *)self database];
  id v9 = v6;
  if (sqlite3_prepare_v2(v8, (const char *)[v9 UTF8String], -1, &ppStmt, 0))
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v15 = "-[NPKGizmoDatabase _executeSQLQuery:processResultsBlock:]";
        __int16 v16 = 2082;
        char v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v18 = 2048;
        uint64_t v19 = 437;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"%@\" statement)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  v7[2](v7, 1, ppStmt);
  sqlite3_reset(ppStmt);
  sqlite3_finalize(ppStmt);
}

- (sqlite3)database
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  p_database = &self->_database;
  if (self->_database) {
    return *p_database;
  }
  int v43 = 0;
  while ([(NPKGizmoDatabase *)self _preconditionsMetForDatabaseOpen])
  {
    objc_super v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = NPKHomeDirectoryPath();
    if (([v5 fileExistsAtPath:v6] & 1) == 0) {
      [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
    }
    int v7 = NPKHomeDirectoryPath();
    objc_super v8 = [v7 stringByAppendingPathComponent:@"nanopasses.sqlite3"];

    id v9 = v8;
    int v10 = sqlite3_open_v2((const char *)[v9 UTF8String], p_database, 3145734, 0);
    if (!v10)
    {
      while (1)
      {
        int v22 = sqlite3_exec(*p_database, "PRAGMA journal_mode = WAL;", 0, 0, 0);
        if (v22 != 5) {
          break;
        }
        usleep(0x14u);
      }
      int v23 = v22;
      if (v22)
      {
        uint64_t v24 = pk_General_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

        if (v25)
        {
          v26 = pk_General_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v49) = v23;
            _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_ERROR, "Error: Couldn't set journal mode on database (result %d)", buf, 8u);
          }
        }
      }
      else
      {
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __28__NPKGizmoDatabase_database__block_invoke;
        v47[3] = &unk_2644D5AE0;
        v47[4] = self;
        if ([(NPKGizmoDatabase *)self _migrateDatabase:v47])
        {
LABEL_40:
          [(NPKGizmoDatabase *)self setPassDBIsAvailable:1];
          v36 = pk_General_log();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

          if (v37)
          {
            v38 = pk_General_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = *p_database;
              *(_DWORD *)buf = 134218242;
              v49 = (const char *)v39;
              __int16 v50 = 2112;
              v51 = (const char *)v9;
              _os_log_impl(&dword_21E92F000, v38, OS_LOG_TYPE_DEFAULT, "Notice: Gizmo database %p opened! at:%@ Broadcasting database changed notification", buf, 0x16u);
            }
          }
          [(NPKGizmoDatabase *)self _notifyForFirstUnlock];
          char v18 = 0;
          goto LABEL_45;
        }
      }
      v27 = pk_General_log();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
        v29 = pk_General_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_ERROR, "Error: Database is in a bad state; deleting and recreating",
            buf,
            2u);
        }
      }
      sqlite3_close_v2(self->_database);
      self->_database = 0;
      v30 = [MEMORY[0x263F08850] defaultManager];
      id v46 = 0;
      [v30 removeItemAtPath:v9 error:&v46];
      id v31 = v46;
      v32 = [NSString stringWithFormat:@"%@-shm", v9];
      id v45 = v31;
      [v30 removeItemAtPath:v32 error:&v45];
      id v33 = v45;

      v34 = [NSString stringWithFormat:@"%@-wal", v9];
      id v44 = v33;
      [v30 removeItemAtPath:v34 error:&v44];
      id v35 = v44;

      [(NPKGizmoDatabase *)self _notifyDatabaseChangedExternally];
      ++v43;

      goto LABEL_40;
    }
    int v11 = v10;
    if (v10 != 23 && v10 != 14)
    {
      uint64_t v19 = pk_General_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

      if (v20)
      {
        id v21 = pk_General_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447234;
          v49 = "-[NPKGizmoDatabase database]";
          __int16 v50 = 2082;
          v51 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          __int16 v52 = 2048;
          uint64_t v53 = 482;
          __int16 v54 = 2112;
          id v55 = v9;
          __int16 v56 = 1024;
          int v57 = v11;
          _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Couldn't open %@ (result %d))", buf, 0x30u);
        }
      }
      _NPKAssertAbort();
    }
    id v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      uint64_t v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = (const char *)v9;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Authorization denied to pass database: %@", buf, 0xCu);
      }
    }
    if (NPKProtectedDataAvailable())
    {
      v15 = pk_General_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        char v17 = pk_General_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447234;
          v49 = "-[NPKGizmoDatabase database]";
          __int16 v50 = 2082;
          v51 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          __int16 v52 = 2048;
          uint64_t v53 = 474;
          __int16 v54 = 2112;
          id v55 = v9;
          __int16 v56 = 1024;
          int v57 = v11;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Couldn't open %@ (result %d), and NPKProtectedDataAvailable = YES)", buf, 0x30u);
        }
      }
      _NPKAssertAbort();
    }
    *p_database = 0;
    char v18 = 1;
LABEL_45:

    if (*p_database || (v18 & 1) != 0 || v43 >= 5) {
      return *p_database;
    }
  }
  v40 = pk_Payment_log();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

  if (v41)
  {
    v42 = pk_Payment_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v42, OS_LOG_TYPE_DEFAULT, "Notice: Not opening database because we don't have what we need to migrate it", buf, 2u);
    }
  }
  return *p_database;
}

uint64_t __28__NPKGizmoDatabase_database__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  unsigned int v6 = 1;
  if (a2 < 1 && a3 >= 1)
  {
    if (![*(id *)(a1 + 32) _executeSQL:@"CREATE TABLE IF NOT EXISTS pass (unique_id TEXT NOT NULL, type_id TEXT NOT NULL, style INTEGER, hash BLOB NOT NULL, encoded_pass BLOB NOT NULL, encoded_diff BLOB, logo_text TEXT, logo_image BLOB, background_color BLOB, label_color BLOB, foreground_color BLOB, delete_pending INTEGER DEFAULT 0, background_image BLOB);"])
    {
      uint64_t v10 = 0;
      BOOL v8 = 1;
      BOOL v7 = 1;
      goto LABEL_26;
    }
    unsigned int v6 = [*(id *)(a1 + 32) _executeSQL:@"CREATE UNIQUE INDEX IF NOT EXISTS pass_unique_id_idx ON pass(unique_id)"];
  }
  if (a2 < 2 && a3 >= 2 && v6) {
    unsigned int v6 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD preferred_aid TEXT;"];
  }
  BOOL v7 = a2 < 3;
  if (a2 <= 2 && a3 >= 3 && v6)
  {
    unsigned int v6 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD nfc_payload BLOB;"];
    BOOL v7 = 1;
  }
  BOOL v8 = a2 < 4;
  BOOL v9 = a2 > 3 || a3 < 4;
  if (v9) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0;
  }
  if (!v9 && v6)
  {
    if ([*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD private_label INTEGER DEFAULT 0;"]) {
      uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD cobranded INTEGER DEFAULT 0;"];
    }
    else {
      uint64_t v10 = 0;
    }
    BOOL v8 = 1;
  }
LABEL_26:
  BOOL v43 = v8;
  BOOL v44 = v7;
  if (a2 < 5 && a3 >= 5)
  {
    if (v10)
    {
      if ([*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD device_primary_payment_application BLOB;"])
      {
        uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD preferred_payment_application BLOB;"];
        goto LABEL_31;
      }
      uint64_t v10 = 0;
    }
    BOOL v12 = 1;
    BOOL v39 = 1;
    BOOL v40 = 1;
    BOOL v41 = 1;
    BOOL v42 = 1;
    BOOL v38 = 1;
    goto LABEL_70;
  }
LABEL_31:
  if (a2 < 6 && a3 >= 6 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD ingested_date INTEGER;"];
  }
  if (a2 < 7 && a3 >= 7 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD complete_hash BLOB"];
  }
  BOOL v41 = a2 < 8;
  if (a2 < 8 && a3 >= 8 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD effective_payment_application_state INTEGER DEFAULT 0"];
  }
  BOOL v40 = a2 < 9;
  BOOL v42 = a2 < 6;
  if (a2 <= 8 && a3 >= 9 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD has_user_selectable_payment_applications INTEGER DEFAULT 0"];
  }
  if (a2 < 11 && a3 >= 11 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD has_stored_value INTEGER DEFAULT 0"];
  }
  BOOL v38 = a2 < 12;
  if (a2 < 12 && a3 >= 12 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD settings INTEGER DEFAULT 0"];
  }
  BOOL v39 = a2 < 11;
  if (a2 <= 12 && a3 >= 13 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD complete_hashes BLOB"];
  }
  BOOL v11 = a2 < 45;
  if (a2 <= 44 && a3 >= 45 && v10)
  {
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD available_actions BLOB"];
    [*(id *)(a1 + 32) _executeSQL:@"CREATE TABLE IF NOT EXISTS transactions (pass_unique_id TEXT NOT NULL, transaction_id TEXT NOT NULL UNIQUE ON CONFLICT REPLACE, transaction_date INTEGER, transaction_sources INTEGER, encoded_transaction BLOB NOT NULL);"];
    [*(id *)(a1 + 32) _executeSQL:@"CREATE INDEX IF NOT EXISTS transactions_pass_unique_id_index ON transactions(pass_unique_id)"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD organization_name TEXT"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE transactions ADD transaction_source INTEGER"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE transactions ADD has_notification_service_data INTEGER"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD felica_transit_applet_state BLOB"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD front_field_buckets BLOB"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD back_field_buckets BLOB"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE transactions ADD transaction_type INTEGER"];
    [*(id *)(a1 + 32) _executeSQL:@"CREATE TABLE IF NOT EXISTS ephemeral_transactions (pass_unique_id TEXT NOT NULL UNIQUE ON CONFLICT REPLACE, transaction_id TEXT NOT NULL);"];
    [*(id *)(a1 + 32) _executeSQL:@"CREATE INDEX IF NOT EXISTS ephemeral_transactions_pass_index ON ephemeral_transactions(pass_unique_id)"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD last_add_value_amount TEXT"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD localized_description TEXT"];
    [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD pending_add_value_date INTEGER"];
  }
  BOOL v12 = a2 < 28;
  BOOL v13 = a3 > 27 && a2 < 28;
  if ((v13 & v10) == 1)
  {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD device_payment_applications BLOB"];
    BOOL v12 = 1;
LABEL_70:
    BOOL v11 = 1;
  }
  if (a2 > 33 || a3 < 34) {
    goto LABEL_76;
  }
  if (!v10)
  {
    int v34 = 0;
LABEL_104:
    BOOL v35 = 1;
    BOOL v36 = 1;
    BOOL v37 = 1;
    goto LABEL_105;
  }
  if (![*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD device_primary_contactless_payment_application BLOB;"])
  {
    int v34 = 0;
    uint64_t v10 = 0;
    goto LABEL_104;
  }
  uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD device_primary_in_app_payment_application BLOB;"];
LABEL_76:
  BOOL v37 = a2 < 44;
  if (a2 <= 43 && a3 >= 44 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD encoded_image_sets BLOB"];
  }
  BOOL v36 = a2 < 47;
  if (a2 < 47 && a3 >= 47 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD issuer_country_code BLOB"];
  }
  BOOL v35 = a2 < 48;
  if (a2 <= 47 && a3 >= 48 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD express_pass_types_mask INTEGER DEFAULT 0"];
  }
  if (a2 <= 49 && a3 >= 50 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD complete_remote_hashes BLOB"];
  }
  if ((unint64_t)(a2 - 48) > 2)
  {
    int v34 = 0;
  }
  else
  {
    if (([*(id *)(a1 + 32) _table:@"pass" containsColumn:@"issuer_country_code"] & 1) == 0)
    {
      uint64_t v14 = pk_General_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

      if (v15)
      {
        BOOL v16 = pk_General_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Solving DB corruption cause by DB v48", buf, 2u);
        }
      }
      if (v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD issuer_country_code BLOB"];
      }
    }
    int v34 = 1;
  }
LABEL_105:
  if (a2 < 53 && a3 >= 53)
  {
    if (!v10) {
      goto LABEL_123;
    }
    if (![*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE transactions ADD cloudkit_archived INTEGER"])
    {
      uint64_t v10 = 0;
      goto LABEL_123;
    }
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD supports_pp INTEGER"];
  }
  if (a2 <= 53 && a3 >= 54 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE transactions ADD service_identifier TEXT"];
  }
  if (a2 < 56 && a3 >= 56 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD balances BLOB"];
  }
  if (a2 < 57 && a3 >= 57 && v10) {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD subcredentials BLOB"];
  }
LABEL_123:
  char v17 = 0;
  if (a2 < 58 && a3 >= 58)
  {
    int v18 = [*(id *)(a1 + 32) _table:@"transactions" containsColumn:@"transaction_source_identifier"];
    if ((v18 | v10 ^ 1))
    {
      uint64_t v10 = v18 & v10;
      char v17 = v18 ^ 1;
    }
    else
    {
      if ([*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE transactions ADD transaction_source_identifier TEXT"]&& objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", @"ALTER TABLE ephemeral_transactions ADD transaction_source_identifier TEXT")&& objc_msgSend(*(id *)(a1 + 32), "_executeSQL:", @"CREATE TABLE IF NOT EXISTS transaction_source (transaction_source_identifier TEXT NOT NULL UNIQUE ON CONFLICT REPLACE, type INTEGER DEFAULT 0, pass_unique_id TEXT);"))
      {
        uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"CREATE INDEX IF NOT EXISTS transaction_source_index ON transactions(transaction_source_identifier)"];
      }
      else
      {
        uint64_t v10 = 0;
      }
      char v17 = 1;
    }
  }
  if (a2 <= 58
    && a3 >= 59
    && (([*(id *)(a1 + 32) _table:@"pass" containsColumn:@"subcredentials"] | v10 ^ 1) & 1) == 0)
  {
    uint64_t v10 = [*(id *)(a1 + 32) _executeSQL:@"ALTER TABLE pass ADD subcredentials BLOB"];
  }
  BOOL v20 = a2 < 60 && a3 > 59;
  id v21 = pk_General_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    int v23 = pk_General_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: schema applied successfully: %d", buf, 8u);
    }
  }
  char v24 = v10 ^ 1;
  if (a3 <= a2) {
    char v24 = 1;
  }
  if ((v24 & 1) == 0)
  {
    BOOL v25 = pk_General_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      v27 = pk_General_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Generating potentially-missing description fields", buf, 2u);
      }
    }
    *(void *)buf = 0;
    v48 = buf;
    uint64_t v49 = 0x3032000000;
    __int16 v50 = __Block_byref_object_copy__14;
    v51 = __Block_byref_object_dispose__14;
    id v52 = [MEMORY[0x263EFF980] array];
    BOOL v28 = *(void **)(a1 + 32);
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __28__NPKGizmoDatabase_database__block_invoke_255;
    v46[3] = &unk_2644D5AB8;
    v46[5] = buf;
    v46[6] = a2;
    v46[4] = v28;
    [v28 _enumerateAllPassesForMigration:v46];
    if ([*((id *)v48 + 5) count])
    {
      if (v44) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateNFCPayloadDuringMigration:*((void *)v48 + 5)];
      }
      else {
        uint64_t v10 = 1;
      }
      if ((v43 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updatePrivateLabelAndCobrandDuringMigration:*((void *)v48 + 5)];
      }
      if (a2 <= 4 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateDeviceAndPreferredPaymentApplicationsDuringMigration:*((void *)v48 + 5)];
      }
      if ((v42 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateIngestedDatesDuringMigration:*((void *)v48 + 5)];
      }
      if ((v41 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateEffectivePaymentApplicationStateDuringMigration:*((void *)v48 + 5)];
      }
      if ((v40 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateHasUserSelectableContactlessPaymentApplications:*((void *)v48 + 5)];
      }
      if (a2 <= 9 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateEncodedPaymentPassDuringMigration:*((void *)v48 + 5)];
      }
      if (a2 <= 9 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateEffectivePaymentApplicationStateDuringMigration:*((void *)v48 + 5)];
      }
      if (a2 <= 9 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateHasUserSelectableContactlessPaymentApplications:*((void *)v48 + 5)];
      }
      if ((v39 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateHasStoredValueDuringMigration:*((void *)v48 + 5)];
      }
      if ((v38 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateSettingsDuringMigration:*((void *)v48 + 5)];
      }
      if (a2 <= 13 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateCompleteLocalHashesDuringMigration:*((void *)v48 + 5)];
      }
      if ((v11 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateAvailableActionsDuringMigration:*((void *)v48 + 5)];
      }
      if ((v11 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateOrganizationNamesDuringMigration:*((void *)v48 + 5)];
      }
      if ((v11 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateFrontAndBackFieldBucketsDuringMigration:*((void *)v48 + 5)];
      }
      if ((v11 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateLocalizedDescriptionDuringMigration:*((void *)v48 + 5)];
      }
      if ((v11 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateLocalizedDescriptionDuringMigration:*((void *)v48 + 5)];
      }
      if ((v12 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateDevicePaymentApplicationsDuringMigration:*((void *)v48 + 5)];
      }
      if (a2 <= 33 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration:*((void *)v48 + 5)];
      }
      if ((v37 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateEncodedImageSetsDuringMigration:*((void *)v48 + 5)];
      }
      if (a2 <= 45 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _repairEncodedImagesDuringMigration:*((void *)v48 + 5)];
      }
      if ((v36 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateIssuerCountryCodesDuringMigration:*((void *)v48 + 5)];
      }
      if ((v35 & v10) == 1) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateExpressPassTypesMaskDuringMigration:*((void *)v48 + 5)];
      }
      if ((v34 & v10) == 1)
      {
        if ([*(id *)(a1 + 32) _table:@"pass" containsColumn:@"issuer_country_code"]) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = [*(id *)(a1 + 32) _updateIssuerCountryCodesDuringMigration:*((void *)v48 + 5)];
        }
      }
      if (a2 <= 54 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateCompleteRemoteHashesDuringMigration];
      }
      char v29 = v17 ^ 1;
      if (a2 > 57) {
        char v29 = 1;
      }
      if ((v29 & 1) == 0 && v10) {
        uint64_t v10 = [*(id *)(a1 + 32) _updateTransactionSourceIdentifiersDuringMigration:*((void *)v48 + 5)];
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    if (v20)
    {
      v30 = pk_General_log();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        v32 = pk_General_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v45 = 0;
          _os_log_impl(&dword_21E92F000, v32, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding payment passes migration step needed", v45, 2u);
        }
      }
      [*(id *)(a1 + 32) _rebuildDatabaseWithPassesFromCompanionPasses];
    }
    _Block_object_dispose(buf, 8);
  }
  return v10;
}

void __28__NPKGizmoDatabase_database__block_invoke_255(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 < 3)
  {
    BOOL v9 = [v5 nfcPayload];

    if (v9)
    {
      uint64_t v10 = [v5 nfcPayload];
      [v7 setObject:v10 forKeyedSubscript:@"nfcPayload"];
    }
    uint64_t v8 = *(void *)(a1 + 48);
  }
  unint64_t v11 = 0x263F08000uLL;
  if (v8 <= 3)
  {
    BOOL v12 = NSNumber;
    BOOL v13 = [v5 paymentPass];
    uint64_t v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isPrivateLabel"));
    [v7 setObject:v14 forKeyedSubscript:@"privateLabel"];

    BOOL v15 = NSNumber;
    BOOL v16 = [v5 paymentPass];
    char v17 = objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "isCobranded"));
    [v7 setObject:v17 forKeyedSubscript:@"cobranded"];

    uint64_t v8 = *(void *)(a1 + 48);
  }
  if (v8 < 10)
  {
    int v18 = [v5 paymentPass];
    uint64_t v19 = [(id)objc_opt_class() _migrationDataSource];
    BOOL v20 = [v19 secureElementIdentifiers];

    if (v20) {
      [v18 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v20];
    }
    if (v18)
    {
      id v21 = [v18 devicePrimaryPaymentApplication];
      [v7 setObject:v21 forKeyedSubscript:@"devicePrimaryPaymentApplication"];

      if (v6)
      {
        BOOL v22 = [v18 devicePaymentApplications];
        uint64_t v73 = MEMORY[0x263EF8330];
        uint64_t v74 = 3221225472;
        v75 = __28__NPKGizmoDatabase_database__block_invoke_2;
        v76 = &unk_2644D5A90;
        id v77 = v6;
        id v78 = v7;
        [v22 enumerateObjectsUsingBlock:&v73];
      }
      int v23 = NPKSecureArchiveObject(v18);
      [v7 setObject:v23 forKeyedSubscript:@"encodedPass"];
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8 <= 5)
    {
      char v24 = [v5 ingestedDate];

      if (v24)
      {
        BOOL v25 = [v5 ingestedDate];
        [v7 setObject:v25 forKeyedSubscript:@"ingestedDate"];
      }
      uint64_t v8 = *(void *)(a1 + 48);
    }
    if (v8 < 10)
    {
      BOOL v26 = [v5 paymentPass];
      v27 = v26;
      if (v26)
      {
        BOOL v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "effectiveContactlessPaymentApplicationState"));
        [v7 setObject:v28 forKeyedSubscript:@"effectivePaymentApplicationState"];
      }
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8 < 10)
      {
        char v29 = [v5 paymentPass];
        v30 = v29;
        if (v29)
        {
          BOOL v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v29, "npkHasUserSelectableContactlessPaymentApplications"));
          [v7 setObject:v31 forKeyedSubscript:@"hasUserSelectableContactlessPaymentApplications"];
        }
        uint64_t v8 = *(void *)(a1 + 48);
      }
    }
  }
  if (v8 < 11)
  {
    v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "hasStoredValue"));
    [v7 setObject:v32 forKeyedSubscript:@"hasStoredValue"];

    uint64_t v8 = *(void *)(a1 + 48);
  }
  if (v8 <= 11)
  {
    id v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "settings"));
    [v7 setObject:v33 forKeyedSubscript:@"settings"];

    uint64_t v8 = *(void *)(a1 + 48);
  }
  if (v8 <= 13)
  {
    int v34 = [v5 npkCompleteHash];
    [v7 setObject:v34 forKeyedSubscript:@"completeHash"];

    BOOL v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
    if ([(id)objc_opt_class() latestWatchOSMajorVersion])
    {
      unint64_t v36 = 0;
      do
      {
        BOOL v37 = objc_msgSend(v5, "npkCompleteHashForWatchOSVersion:", v36 + 1, v73, v74, v75, v76);
        [v35 setObject:v37 atIndexedSubscript:v36];

        ++v36;
      }
      while (v36 < [(id)objc_opt_class() latestWatchOSMajorVersion]);
    }
    BOOL v38 = objc_msgSend(v35, "copy", v73, v74, v75, v76);
    [v7 setObject:v38 forKeyedSubscript:@"completeLocalHashes"];

    uint64_t v8 = *(void *)(a1 + 48);
  }
  if (v8 <= 44)
  {
    BOOL v39 = [v5 paymentPass];
    BOOL v40 = [v39 availableActions];
    [v7 setObject:v40 forKeyedSubscript:@"availableActions"];

    if (*(uint64_t *)(a1 + 48) <= 44)
    {
      BOOL v41 = [v5 organizationName];
      [v7 setObject:v41 forKeyedSubscript:@"organizationName"];

      if (*(uint64_t *)(a1 + 48) <= 44)
      {
        BOOL v42 = [v5 frontFieldBuckets];
        [v7 setObject:v42 forKeyedSubscript:@"frontFieldBuckets"];

        BOOL v43 = [v5 backFieldBuckets];
        [v7 setObject:v43 forKeyedSubscript:@"backFieldBuckets"];

        if (*(uint64_t *)(a1 + 48) <= 44)
        {
          BOOL v44 = [v5 localizedDescription];
          [v7 setObject:v44 forKeyedSubscript:@"localizedDescription"];
        }
      }
    }
  }
  id v45 = objc_msgSend(v5, "paymentPass", v73, v74, v75, v76);
  if (v45)
  {
    id v46 = [(id)objc_opt_class() _migrationDataSource];
    v47 = [v46 secureElementIdentifiers];

    if (v47) {
      [v45 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v47];
    }
  }
  uint64_t v48 = *(void *)(a1 + 48);
  if (v48 <= 27)
  {
    uint64_t v49 = [v45 devicePaymentApplications];
    [v7 setObject:v49 forKeyedSubscript:@"devicePaymentApplications"];

    uint64_t v48 = *(void *)(a1 + 48);
  }
  if (v48 <= 33)
  {
    __int16 v50 = [v45 devicePrimaryContactlessPaymentApplication];
    [v7 setObject:v50 forKeyedSubscript:@"devicePrimaryContactlessPaymentApplication"];

    v51 = [v45 devicePrimaryInAppPaymentApplication];
    [v7 setObject:v51 forKeyedSubscript:@"devicePrimaryInAppPaymentApplication"];

    uint64_t v48 = *(void *)(a1 + 48);
  }
  if (v48 <= 43)
  {
    id v52 = objc_alloc(MEMORY[0x263F5BF38]);
    uint64_t v53 = (void *)[v52 initWithDictionary:MEMORY[0x263EFFA78] bundle:0];
    if (v53)
    {
      __int16 v54 = (void *)[v5 copy];
      [v53 setMissingImageSetsFromObject:v54];
      [v54 flushLoadedImageSets];
      id v55 = NPKSecureArchiveObject(v53);
      [v7 setObject:v55 forKeyedSubscript:@"encodedImageSets"];

      __int16 v56 = NPKSecureArchiveObject(v54);
      [v7 setObject:v56 forKeyedSubscript:@"encodedPassWithoutImageSets"];
    }
    uint64_t v48 = *(void *)(a1 + 48);
  }
  if (v48 < 46)
  {
    int v57 = [v5 logoImage];
    uint64_t v58 = v57;
    if (v57)
    {
      v59 = NPKSecureArchiveObject(v57);
      if (v59) {
        [v7 setObject:v59 forKeyedSubscript:@"encodedLogoImageData"];
      }
    }
    v60 = [v5 backgroundImage];
    if (!v60) {
      goto LABEL_63;
    }
    if ([v5 style] == 2)
    {
      v61 = (void *)MEMORY[0x263F5BEE0];
      v62 = [v5 backgroundImage];
      [v62 size];
      v63 = objc_msgSend(v61, "constraintsWithFixedSize:");

      v64 = [v5 backgroundImage];
      v65 = [v64 blurredImageWithRadius:27 constraints:v63];

      unint64_t v11 = 0x263F08000;
      if (!v65) {
        goto LABEL_62;
      }
    }
    else
    {
      v65 = [v5 backgroundImage];
      if (!v65)
      {
LABEL_62:

LABEL_63:
        uint64_t v48 = *(void *)(a1 + 48);
        goto LABEL_64;
      }
    }
    v66 = NPKSecureArchiveObject(v65);
    [v7 setObject:v66 forKeyedSubscript:@"encodedBackgroundImageData"];

    goto LABEL_62;
  }
LABEL_64:
  if (v48 < 47)
  {
    v67 = [v45 issuerCountryCode];
    [v7 setObject:v67 forKeyedSubscript:@"issuerCountryCode"];

    uint64_t v48 = *(void *)(a1 + 48);
  }
  if (v48 <= 47)
  {
    v68 = [*(id *)(v11 + 2584) numberWithUnsignedInteger:NPKPassDescriptionExpressTypesMaskWithPass(v5)];
    [v7 setObject:v68 forKeyedSubscript:@"expressPassTypesMask"];

    uint64_t v48 = *(void *)(a1 + 48);
  }
  if ((unint64_t)(v48 - 48) <= 2)
  {
    if (([*(id *)(a1 + 32) _table:@"pass" containsColumn:@"issuer_country_code"] & 1) == 0)
    {
      v69 = [v45 issuerCountryCode];
      [v7 setObject:v69 forKeyedSubscript:@"issuerCountryCode"];
    }
    uint64_t v48 = *(void *)(a1 + 48);
  }
  if (v48 <= 54)
  {
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"migrateCompleteHashes"];
    uint64_t v48 = *(void *)(a1 + 48);
  }
  if (v45 && v48 <= 57)
  {
    v70 = [MEMORY[0x263F08C38] UUID];
    v71 = [v70 UUIDString];
    [v7 setObject:v71 forKeyedSubscript:@"transactionSourceIdentifier"];
  }
  if ([v7 count])
  {
    v72 = [v5 uniqueID];
    [v7 setObject:v72 forKeyedSubscript:@"uniqueID"];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void __28__NPKGizmoDatabase_database__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v5 = [v7 applicationIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"preferredPaymentApplication"];
    *a3 = 1;
  }
}

- (sqlite3_stmt)deleteStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_deleteStatement = &self->_deleteStatement;
  if (!self->_deleteStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM pass WHERE unique_id = ?", -1, p_deleteStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase deleteStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1034;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare deletion statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_deleteStatement;
}

- (sqlite3_stmt)insertStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_insertStatement = &self->_insertStatement;
  if (!self->_insertStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "INSERT INTO pass (unique_id, type_id, style, hash, encoded_pass, encoded_image_sets, encoded_diff, logo_text, logo_image, background_color, label_color, foreground_color, background_image, nfc_payload, private_label, cobranded, device_payment_applications, device_primary_payment_application, device_primary_contactless_payment_application, device_primary_in_app_payment_application, preferred_aid, preferred_payment_application, ingested_date, complete_hash, delete_pending, effective_payment_application_state, has_user_selectable_payment_applications, has_stored_value, settings, complete_hashes, issuer_country_code, available_actions, organization_name, felica_transit_applet_state, front_field_buckets, back_field_buckets, last_add_value_amount, localized_description, pending_add_value_date, express_pass_types_mask, complete_remote_hashes, supports_pp, balances, subcredentials) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, p_insertStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase insertStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1044;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare pass insertion statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_insertStatement;
}

- (sqlite3_stmt)insertDiffStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_insertDiffStatement = &self->_insertDiffStatement;
  if (!self->_insertDiffStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET encoded_diff = ? WHERE unique_id = ?", -1, p_insertDiffStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase insertDiffStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1054;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare diff insertion statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_insertDiffStatement;
}

- (sqlite3_stmt)updateDeletePendingStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updateDeletePendingStatement = &self->_updateDeletePendingStatement;
  if (!self->_updateDeletePendingStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET delete_pending = ? WHERE unique_id = ?", -1, p_updateDeletePendingStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updateDeletePendingStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1064;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update delete pending\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updateDeletePendingStatement;
}

- (sqlite3_stmt)selectDeletePendingStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectDeletePendingStatement = &self->_selectDeletePendingStatement;
  if (!self->_selectDeletePendingStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT delete_pending FROM pass WHERE unique_id = ?", -1, p_selectDeletePendingStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectDeletePendingStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1073;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass diff\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectDeletePendingStatement;
}

- (sqlite3_stmt)updatePreferredAIDStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updatePreferredAIDStatement = &self->_updatePreferredAIDStatement;
  if (!self->_updatePreferredAIDStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET preferred_aid = ?, preferred_payment_application = ? WHERE unique_id = ?", -1, p_updatePreferredAIDStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updatePreferredAIDStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1083;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update delete pending\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updatePreferredAIDStatement;
}

- (sqlite3_stmt)selectPreferredAIDStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectPreferredAIDStatement = &self->_selectPreferredAIDStatement;
  if (!self->_selectPreferredAIDStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT preferred_aid FROM pass WHERE unique_id = ?", -1, p_selectPreferredAIDStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectPreferredAIDStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1092;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass diff\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectPreferredAIDStatement;
}

- (sqlite3_stmt)selectPassDataStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectPassDataStatement = &self->_selectPassDataStatement;
  if (!self->_selectPassDataStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT encoded_pass FROM pass WHERE unique_id = ?", -1, p_selectPassDataStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectPassDataStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1101;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass data\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectPassDataStatement;
}

- (sqlite3_stmt)selectPassAndImageSetsDataStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectPassAndImageSetsDataStatement = &self->_selectPassAndImageSetsDataStatement;
  if (!self->_selectPassAndImageSetsDataStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT encoded_pass, encoded_image_sets FROM pass WHERE unique_id = ?", -1, p_selectPassAndImageSetsDataStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectPassAndImageSetsDataStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1112;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass data\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectPassAndImageSetsDataStatement;
}

- (sqlite3_stmt)selectPassDiffStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectPassDiffStatement = &self->_selectPassDiffStatement;
  if (!self->_selectPassDiffStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT encoded_diff FROM pass WHERE unique_id = ?", -1, p_selectPassDiffStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectPassDiffStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1121;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pass diff\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectPassDiffStatement;
}

- (sqlite3_stmt)insertTransactionStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_insertTransactionStatement = &self->_insertTransactionStatement;
  if (!self->_insertTransactionStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "INSERT INTO transactions (transaction_source_identifier, pass_unique_id, transaction_id, transaction_date, transaction_source, transaction_type, has_notification_service_data, encoded_transaction, cloudkit_archived, service_identifier) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, p_insertTransactionStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase insertTransactionStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1130;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"insert transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_insertTransactionStatement;
}

- (sqlite3_stmt)removeTransactionStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_removeTransactionStatement = &self->_removeTransactionStatement;
  if (!self->_removeTransactionStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM transactions WHERE transaction_id = ?", -1, p_removeTransactionStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase removeTransactionStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1138;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"remove transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_removeTransactionStatement;
}

- (sqlite3_stmt)removeTransactionWithServiceIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_removeTransactionWithServiceIdentifier = &self->_removeTransactionWithServiceIdentifier;
  if (!self->_removeTransactionWithServiceIdentifier
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM transactions WHERE transaction_source_identifier = ? AND service_identifier = ?", -1, p_removeTransactionWithServiceIdentifier, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase removeTransactionWithServiceIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1146;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"remove transaction with service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_removeTransactionWithServiceIdentifier;
}

- (sqlite3_stmt)selectTransactionsStatementWithTransactionSource:(unint64_t)a3 orderByDate:(int64_t)a4 limit:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a4 == -1) {
    uint64_t v8 = @"ORDER BY transaction_date ASC";
  }
  else {
    uint64_t v8 = @"ORDER BY transaction_date DESC";
  }
  __int16 v9 = (void *)[(__CFString *)v8 mutableCopy];
  uint64_t v10 = v9;
  if (a5) {
    [v9 appendString:@" LIMIT ?"];
  }
  if (a3 == 2)
  {
    [NSString stringWithFormat:@"%@ AND transaction_source == 0 %@", @"SELECT encoded_transaction FROM transactions WHERE transaction_source_identifier = ? AND ((? OR has_notification_service_data == ?) OR ((? OR transaction_type == ?) AND (? OR transaction_type != ?))) AND transaction_date >= ? AND transaction_date <= ?", v10];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    p_selectTransactionsStatementWithoutSource = &self->_selectTransactionsStatementWithoutSource;
    if (self->_selectTransactionsStatementWithoutSource) {
      goto LABEL_27;
    }
    int v18 = [(NPKGizmoDatabase *)self database];
    id v11 = v11;
    if (!sqlite3_prepare_v2(v18, (const char *)[v11 UTF8String], -1, p_selectTransactionsStatementWithoutSource, 0))goto LABEL_27; {
    uint64_t v19 = pk_General_log();
    }
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

    if (!v20) {
      goto LABEL_26;
    }
    BOOL v16 = pk_General_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136446722;
    v27 = "-[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:]";
    __int16 v28 = 2082;
    char v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
    __int16 v30 = 2048;
    uint64_t v31 = 1191;
    char v17 = "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transactions"
          " without source for pass\" statement)";
    goto LABEL_24;
  }
  if (a3 == 1)
  {
    [NSString stringWithFormat:@"%@ AND transaction_source != 0 %@", @"SELECT encoded_transaction FROM transactions WHERE transaction_source_identifier = ? AND ((? OR has_notification_service_data == ?) OR ((? OR transaction_type == ?) AND (? OR transaction_type != ?))) AND transaction_date >= ? AND transaction_date <= ?", v10];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    p_selectTransactionsStatementWithoutSource = &self->_selectTransactionsStatementWithSource;
    if (self->_selectTransactionsStatementWithSource) {
      goto LABEL_27;
    }
    id v21 = [(NPKGizmoDatabase *)self database];
    id v11 = v11;
    if (!sqlite3_prepare_v2(v21, (const char *)[v11 UTF8String], -1, p_selectTransactionsStatementWithoutSource, 0))goto LABEL_27; {
    BOOL v22 = pk_General_log();
    }
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (!v23) {
      goto LABEL_26;
    }
    BOOL v16 = pk_General_log();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_25:

LABEL_26:
      _NPKAssertAbort();
    }
    *(_DWORD *)buf = 136446722;
    v27 = "-[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:]";
    __int16 v28 = 2082;
    char v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
    __int16 v30 = 2048;
    uint64_t v31 = 1184;
    char v17 = "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transactions"
          " with source for pass\" statement)";
LABEL_24:
    _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
    goto LABEL_25;
  }
  if (a3)
  {
    char v24 = 0;
    goto LABEL_29;
  }
  [NSString stringWithFormat:@"%@ %@", @"SELECT encoded_transaction FROM transactions WHERE transaction_source_identifier = ? AND ((? OR has_notification_service_data == ?) OR ((? OR transaction_type == ?) AND (? OR transaction_type != ?))) AND transaction_date >= ? AND transaction_date <= ?", v10];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  p_selectTransactionsStatementWithoutSource = &self->_selectTransactionsStatement;
  if (!self->_selectTransactionsStatement)
  {
    uint64_t v13 = [(NPKGizmoDatabase *)self database];
    id v11 = v11;
    if (sqlite3_prepare_v2(v13, (const char *)[v11 UTF8String], -1, p_selectTransactionsStatementWithoutSource, 0))
    {
      uint64_t v14 = pk_General_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (!v15) {
        goto LABEL_26;
      }
      BOOL v16 = pk_General_log();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136446722;
      v27 = "-[NPKGizmoDatabase selectTransactionsStatementWithTransactionSource:orderByDate:limit:]";
      __int16 v28 = 2082;
      char v29 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
      __int16 v30 = 2048;
      uint64_t v31 = 1177;
      char v17 = "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transactio"
            "ns for pass\" statement)";
      goto LABEL_24;
    }
  }
LABEL_27:
  char v24 = *p_selectTransactionsStatementWithoutSource;

LABEL_29:
  return v24;
}

- (sqlite3_stmt)selectTransactionWithIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectTransactionWithIdentifierStatement = &self->_selectTransactionWithIdentifierStatement;
  if (!self->_selectTransactionWithIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT encoded_transaction FROM transactions WHERE transaction_id = ?", -1, p_selectTransactionWithIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectTransactionWithIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1203;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)selectTransactionWithServiceIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectTransactionWithIdentifierStatement = &self->_selectTransactionWithIdentifierStatement;
  if (!self->_selectTransactionWithIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT encoded_transaction FROM transactions WHERE service_identifier = ?", -1, p_selectTransactionWithIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectTransactionWithServiceIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1211;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction with service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)insertTransactionSourceIdentifierForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_insertTransactionSourceIdentifierForPassStatement = &self->_insertTransactionSourceIdentifierForPassStatement;
  if (!self->_insertTransactionSourceIdentifierForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "INSERT INTO transaction_source (transaction_source_identifier, type, pass_unique_id) VALUES (?, ?, ?)", -1, p_insertTransactionSourceIdentifierForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase insertTransactionSourceIdentifierForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1219;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"insert transaction source identifier for pass\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_insertTransactionSourceIdentifierForPassStatement;
}

- (sqlite3_stmt)selectTransactionSourceIdentifierForTransactionWithIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement = &self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
  if (!self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT transaction_source_identifier FROM transactions WHERE transaction_id = ?", -1, p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectTransactionSourceIdentifierForTransactionWithIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1227;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT transaction_source_identifier FROM transactions WHERE service_identifier = ?", -1, &self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1235;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
}

- (sqlite3_stmt)selectTransactionSourceIdentifierForPassUniqueIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement = &self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
  if (!self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT transaction_source_identifier FROM transaction_source WHERE pass_unique_id = ?", -1, p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectTransactionSourceIdentifierForPassUniqueIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1243;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
}

- (sqlite3_stmt)selectPassUniqueIdentifierForTransactionSourceIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement = &self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
  if (!self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT pass_unique_id FROM transaction_source WHERE transaction_source_identifier = ?", -1, p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectPassUniqueIdentifierForTransactionSourceIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1251;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transaction source identifier for transaction service identifier\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
}

- (sqlite3_stmt)deleteTransactionSourceIdentifierForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_deleteTransactionSourceIdentifierForPassStatement = &self->_deleteTransactionSourceIdentifierForPassStatement;
  if (!self->_deleteTransactionSourceIdentifierForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM transaction_source WHERE pass_unique_id = ?", -1, p_deleteTransactionSourceIdentifierForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase deleteTransactionSourceIdentifierForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1259;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"delete transaction source identifier for pass\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_deleteTransactionSourceIdentifierForPassStatement;
}

- (sqlite3_stmt)deleteTransactionsForTransactionSourceStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_deleteTransactionsForTransactionSourceStatement = &self->_deleteTransactionsForTransactionSourceStatement;
  if (!self->_deleteTransactionsForTransactionSourceStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM transactions WHERE transaction_source_identifier = ?", -1, p_deleteTransactionsForTransactionSourceStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase deleteTransactionsForTransactionSourceStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1267;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"delete transactions for transaction source\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_deleteTransactionsForTransactionSourceStatement;
}

- (sqlite3_stmt)trimTransactionsForTransactionSourceStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_trimTransactionsForTransactionSourceStatement = &self->_trimTransactionsForTransactionSourceStatement;
  if (!self->_trimTransactionsForTransactionSourceStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM transactions WHERE transaction_source_identifier = ? AND transaction_id NOT IN (SELECT transaction_id FROM transactions WHERE transaction_source_identifier = ? ORDER BY transaction_date DESC LIMIT ?)", -1, p_trimTransactionsForTransactionSourceStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase trimTransactionsForTransactionSourceStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1275;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"trim transactions for transaction source\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_trimTransactionsForTransactionSourceStatement;
}

- (sqlite3_stmt)selectTransitAppletStateForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectTransitAppletStateForPassStatement = &self->_selectTransitAppletStateForPassStatement;
  if (!self->_selectTransitAppletStateForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT felica_transit_applet_state FROM pass WHERE unique_id = ?", -1, p_selectTransitAppletStateForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectTransitAppletStateForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1288;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select transit applet state\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectTransitAppletStateForPassStatement;
}

- (sqlite3_stmt)updateTransitAppletStateForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updateTransitAppletStateForPassStatement = &self->_updateTransitAppletStateForPassStatement;
  if (!self->_updateTransitAppletStateForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET felica_transit_applet_state = ? WHERE unique_id = ?", -1, p_updateTransitAppletStateForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updateTransitAppletStateForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1302;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update transit applet state\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updateTransitAppletStateForPassStatement;
}

- (sqlite3_stmt)insertEphemeralTransactionStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_insertEphemeralTransactionStatement = &self->_insertEphemeralTransactionStatement;
  if (!self->_insertEphemeralTransactionStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "INSERT INTO ephemeral_transactions (transaction_source_identifier, transaction_id) VALUES (?, ?)", -1, p_insertEphemeralTransactionStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase insertEphemeralTransactionStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1311;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"insert ephemeral transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_insertEphemeralTransactionStatement;
}

- (sqlite3_stmt)deleteEphemeralTransactionByTransactionSourceIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement = &self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
  if (!self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "DELETE FROM ephemeral_transactions WHERE transaction_source_identifier = ?", -1, p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase deleteEphemeralTransactionByTransactionSourceIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1320;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"delete ephemeral transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
}

- (sqlite3_stmt)currentEphemeralTransactionIdentifierStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_currentEphemeralTransactionIdentifierStatement = &self->_currentEphemeralTransactionIdentifierStatement;
  if (!self->_currentEphemeralTransactionIdentifierStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT transaction_id FROM ephemeral_transactions WHERE transaction_source_identifier = ? LIMIT 1", -1, p_currentEphemeralTransactionIdentifierStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase currentEphemeralTransactionIdentifierStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1328;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"current ephemeral transaction\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_currentEphemeralTransactionIdentifierStatement;
}

- (sqlite3_stmt)selectLastAddValueAmountForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectLastAddValueAmountForPassStatement = &self->_selectLastAddValueAmountForPassStatement;
  if (!self->_selectLastAddValueAmountForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT last_add_value_amount FROM pass WHERE unique_id = ?", -1, p_selectLastAddValueAmountForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectLastAddValueAmountForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1337;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select last add value amount\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectLastAddValueAmountForPassStatement;
}

- (sqlite3_stmt)updateLastAddValueAmountForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updateLastAddValueAmountForPassStatement = &self->_updateLastAddValueAmountForPassStatement;
  if (!self->_updateLastAddValueAmountForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET last_add_value_amount = ? WHERE unique_id = ?", -1, p_updateLastAddValueAmountForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updateLastAddValueAmountForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1346;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update last add value amount\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updateLastAddValueAmountForPassStatement;
}

- (sqlite3_stmt)selectPendingAddValueDateForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectPendingAddValueDateForPassStatement = &self->_selectPendingAddValueDateForPassStatement;
  if (!self->_selectPendingAddValueDateForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT pending_add_value_date FROM pass WHERE unique_id = ?", -1, p_selectPendingAddValueDateForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectPendingAddValueDateForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1355;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select pending add value date\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectPendingAddValueDateForPassStatement;
}

- (sqlite3_stmt)updatePendingAddValueDateForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updatePendingAddValueDateForPassStatement = &self->_updatePendingAddValueDateForPassStatement;
  if (!self->_updatePendingAddValueDateForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET pending_add_value_date = ? WHERE unique_id = ?", -1, p_updatePendingAddValueDateForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updatePendingAddValueDateForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1364;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update pending add value date\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updatePendingAddValueDateForPassStatement;
}

- (sqlite3_stmt)selectBalancesForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectBalancesForPassStatement = &self->_selectBalancesForPassStatement;
  if (!self->_selectBalancesForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT balances FROM pass WHERE unique_id = ?", -1, p_selectBalancesForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectBalancesForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1373;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select balances state\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectBalancesForPassStatement;
}

- (sqlite3_stmt)updateBalancesForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updateBalancesForPassStatement = &self->_updateBalancesForPassStatement;
  if (!self->_updateBalancesForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET balances = ? WHERE unique_id = ?", -1, p_updateBalancesForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updateBalancesForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1382;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update balances state\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updateBalancesForPassStatement;
}

- (sqlite3_stmt)selectSubcredentialsForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_selectSubcredentialsForPassStatement = &self->_selectSubcredentialsForPassStatement;
  if (!self->_selectSubcredentialsForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT subcredentials FROM pass WHERE unique_id = ?", -1, p_selectSubcredentialsForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase selectSubcredentialsForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1391;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"select subcredentials state\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_selectSubcredentialsForPassStatement;
}

- (sqlite3_stmt)updateSubcredentialsForPassStatement
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_updateSubcredentialsForPassStatement = &self->_updateSubcredentialsForPassStatement;
  if (!self->_updateSubcredentialsForPassStatement
    && sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "UPDATE pass SET subcredentials = ? WHERE unique_id = ?", -1, p_updateSubcredentialsForPassStatement, 0))
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v7 = 136446722;
        uint64_t v8 = "-[NPKGizmoDatabase updateSubcredentialsForPassStatement]";
        __int16 v9 = 2082;
        uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v11 = 2048;
        uint64_t v12 = 1400;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare \"update subcredentials state\" statement)", (uint8_t *)&v7, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return *p_updateSubcredentialsForPassStatement;
}

- (void)_loadInitialManifestLocked
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  if ((!self->_manifest || !self->_passDescriptions) && [(NPKGizmoDatabase *)self database])
  {
    dispatch_queue_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Lazily loading initial manifest", buf, 2u);
      }
    }
    int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    manifest = self->_manifest;
    self->_manifest = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    passDescriptions = self->_passDescriptions;
    self->_passDescriptions = v8;

    ppStmt = 0;
    if (sqlite3_prepare_v2([(NPKGizmoDatabase *)self database], "SELECT unique_id, type_id, style, hash, logo_text, logo_image, background_color, label_color, foreground_color, delete_pending, background_image, nfc_payload, private_label, cobranded, device_payment_applications, device_primary_payment_application, device_primary_contactless_payment_application, device_primary_in_app_payment_application, preferred_payment_application, ingested_date, complete_hash, effective_payment_application_state, has_user_selectable_payment_applications, has_stored_value, settings, complete_hashes, issuer_country_code, available_actions, organization_name, felica_transit_applet_state, front_field_buckets, back_field_buckets, last_add_value_amount, localized_description, pending_add_value_date, express_pass_types_mask, complete_remote_hashes, supports_pp, subcredentials FROM pass", -1, &ppStmt, 0))
    {
      uint64_t v10 = pk_General_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (!v11) {
        return;
      }
      uint64_t v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = NPKHomeDirectoryPath();
        uint64_t v14 = [v13 stringByAppendingPathComponent:@"nanopasses.sqlite3"];
        BOOL v15 = NPKGetMyProcessName();
        *(_DWORD *)buf = 138412546;
        v109 = v14;
        __int16 v110 = 2112;
        v111 = v15;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** CORRUPTED / INVALID PASS DATABASE: Unable to prepare \"select pass descriptions\" statement; this m"
          "ost likely means you need to delete the database at \"%@\" and kill %@",
          buf,
          0x16u);
      }
      goto LABEL_51;
    }
    if (sqlite3_step(ppStmt) == 100)
    {
      unint64_t v16 = 0x263F08000uLL;
      unint64_t v17 = 0x263EFF000uLL;
      unint64_t v18 = 0x263EFF000uLL;
      do
      {
        objc_msgSend(*(id *)(v16 + 2880), "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
        v106 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = objc_msgSend(*(id *)(v16 + 2880), "stringWithUTF8String:", sqlite3_column_text(ppStmt, 1));
        int v20 = sqlite3_column_int(ppStmt, 2);
        id v21 = sqlite3_column_blob(ppStmt, 3);
        uint64_t v22 = objc_msgSend(*(id *)(v17 + 2296), "dataWithBytes:length:", v21, sqlite3_column_bytes(ppStmt, 3));
        BOOL v23 = sqlite3_column_text(ppStmt, 4);
        v92 = (void *)v22;
        if (v23)
        {
          v103 = [*(id *)(v16 + 2880) stringWithUTF8String:v23];
        }
        else
        {
          v103 = 0;
        }
        char v24 = sqlite3_column_blob(ppStmt, 5);
        int v25 = sqlite3_column_bytes(ppStmt, 5);
        if (v25 < 1)
        {
          v102 = 0;
        }
        else
        {
          v102 = [*(id *)(v17 + 2296) dataWithBytes:v24 length:v25];
        }
        uint64_t v26 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:6];
        v100 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:7];
        v99 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:8];
        int v82 = sqlite3_column_int(ppStmt, 9);
        v27 = sqlite3_column_blob(ppStmt, 10);
        int v28 = sqlite3_column_bytes(ppStmt, 10);
        v104 = (void *)v19;
        v101 = (void *)v26;
        if (v28 < 1)
        {
          v98 = 0;
        }
        else
        {
          v98 = [*(id *)(v17 + 2296) dataWithBytes:v27 length:v28];
        }
        v97 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:11];
        int v85 = sqlite3_column_int(ppStmt, 12);
        int v84 = sqlite3_column_int(ppStmt, 13);
        char v29 = *(void **)(v18 + 2568);
        uint64_t v30 = objc_opt_class();
        uint64_t v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
        uint64_t v32 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v31 fromStatement:ppStmt column:14];

        v95 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:15];
        v94 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:16];
        v93 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:17];
        uint64_t v33 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:18];
        v91 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)sqlite3_column_int(ppStmt, 19));
        int v34 = sqlite3_column_blob(ppStmt, 20);
        int v35 = sqlite3_column_bytes(ppStmt, 20);
        v96 = (void *)v32;
        if (v35 < 1)
        {
          v90 = 0;
        }
        else
        {
          v90 = [*(id *)(v17 + 2296) dataWithBytes:v34 length:v35];
        }
        int v78 = sqlite3_column_int(ppStmt, 21);
        int v81 = sqlite3_column_int(ppStmt, 22);
        int v80 = sqlite3_column_int(ppStmt, 23);
        sqlite3_int64 v36 = sqlite3_column_int64(ppStmt, 24);
        BOOL v37 = *(void **)(v18 + 2568);
        uint64_t v38 = objc_opt_class();
        BOOL v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
        v105 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v39 fromStatement:ppStmt column:25];

        BOOL v40 = sqlite3_column_text(ppStmt, 26);
        if (v40)
        {
          v88 = [*(id *)(v16 + 2880) stringWithUTF8String:v40];
        }
        else
        {
          v88 = 0;
        }
        BOOL v41 = *(void **)(v18 + 2568);
        uint64_t v42 = objc_opt_class();
        BOOL v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
        uint64_t v44 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v43 fromStatement:ppStmt column:27];

        id v45 = sqlite3_column_text(ppStmt, 28);
        v89 = (void *)v33;
        v87 = (void *)v44;
        if (v45)
        {
          v79 = [*(id *)(v16 + 2880) stringWithUTF8String:v45];
        }
        else
        {
          v79 = 0;
        }
        id v77 = [(NPKGizmoDatabase *)self _decodeObjectOfClass:objc_opt_class() fromStatement:ppStmt column:29];
        id v46 = *(void **)(v18 + 2568);
        uint64_t v47 = objc_opt_class();
        uint64_t v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
        v76 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v48 fromStatement:ppStmt column:30];

        uint64_t v49 = *(void **)(v18 + 2568);
        uint64_t v50 = objc_opt_class();
        v51 = objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
        v75 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v51 fromStatement:ppStmt column:31];

        id v52 = sqlite3_column_text(ppStmt, 32);
        if (v52)
        {
          int v53 = v82;
          int v54 = v85;
          if (*v52)
          {
            id v55 = [*(id *)(v16 + 2880) stringWithUTF8String:v52];
            v70 = [MEMORY[0x263F087B0] decimalNumberWithString:v55];
          }
          else
          {
            v70 = 0;
          }
        }
        else
        {
          v70 = 0;
          int v53 = v82;
          int v54 = v85;
        }
        __int16 v56 = sqlite3_column_text(ppStmt, 33);
        if (v56)
        {
          v86 = [*(id *)(v16 + 2880) stringWithUTF8String:v56];
        }
        else
        {
          v86 = 0;
        }
        int v57 = sqlite3_column_int(ppStmt, 34);
        if (v57)
        {
          v83 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)v57];
        }
        else
        {
          v83 = 0;
        }
        sqlite3_int64 v74 = sqlite3_column_int64(ppStmt, 35);
        uint64_t v58 = *(void **)(v18 + 2568);
        uint64_t v59 = objc_opt_class();
        v60 = objc_msgSend(v58, "setWithObjects:", v59, objc_opt_class(), 0);
        v61 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v60 fromStatement:ppStmt column:36];

        int v72 = sqlite3_column_int(ppStmt, 37);
        v62 = objc_msgSend(*(id *)(v18 + 2568), "setWithObjects:", objc_opt_class(), 0);
        uint64_t v73 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v62 fromStatement:ppStmt column:38];

        v63 = pk_General_log();
        BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);

        if (v64)
        {
          v65 = pk_General_log();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v109 = v106;
            __int16 v110 = 2112;
            v111 = v105;
            __int16 v112 = 2112;
            v113 = v61;
            _os_log_impl(&dword_21E92F000, v65, OS_LOG_TYPE_DEFAULT, "Notice: Initial manifest encountered key %@ local %@ remote %@", buf, 0x20u);
          }
        }
        v71 = objc_alloc_init(NPKGizmoDatabaseManifestEntry);
        [(NPKGizmoDatabaseManifestEntry *)v71 setUniqueID:v106];
        [(NPKGizmoDatabaseManifestEntry *)v71 setLocalManifestHashes:v105];
        [(NPKGizmoDatabaseManifestEntry *)v71 setRemoteManifestHashes:v61];
        [(NSMutableDictionary *)self->_manifest setObject:v71 forKeyedSubscript:v106];
        v66 = objc_alloc_init(NPKPassDescription);
        [(NPKPassDescription *)v66 setUniqueID:v106];
        [(NPKPassDescription *)v66 setPassTypeIdentifier:v104];
        [(NPKPassDescription *)v66 setStyle:v20];
        [(NPKPassDescription *)v66 setManifestHash:v92];
        [(NPKPassDescription *)v66 setLogoText:v103];
        [(NPKPassDescription *)v66 setLogoImageEncoded:v102];
        [(NPKPassDescription *)v66 setBackgroundColor:v101];
        [(NPKPassDescription *)v66 setLabelColor:v100];
        [(NPKPassDescription *)v66 setForegroundColor:v99];
        [(NPKPassDescription *)v66 setDeletePending:v53 != 0];
        [(NPKPassDescription *)v66 setBackgroundImageEncoded:v98];
        [(NPKPassDescription *)v66 setNfcPayload:v97];
        [(NPKPassDescription *)v66 setPrivateLabel:v54 != 0];
        [(NPKPassDescription *)v66 setCobranded:v84 != 0];
        [(NPKPassDescription *)v66 setDevicePaymentApplications:v96];
        [(NPKPassDescription *)v66 setDevicePrimaryPaymentApplication:v95];
        [(NPKPassDescription *)v66 setDevicePrimaryContactlessPaymentApplication:v94];
        [(NPKPassDescription *)v66 setDevicePrimaryInAppPaymentApplication:v93];
        [(NPKPassDescription *)v66 setPreferredPaymentApplication:v89];
        [(NPKPassDescription *)v66 setEffectivePaymentApplicationState:v78];
        [(NPKPassDescription *)v66 setIngestionDate:v91];
        [(NPKPassDescription *)v66 setCompleteHash:v90];
        [(NPKPassDescription *)v66 setHasUserSelectableContactlessPaymentApplications:v81 != 0];
        [(NPKPassDescription *)v66 setHasStoredValue:v80 != 0];
        [(NPKPassDescription *)v66 setSettings:v36];
        [(NPKPassDescription *)v66 setIssuerCountryCode:v88];
        [(NPKPassDescription *)v66 setAvailableActions:v87];
        [(NPKPassDescription *)v66 setOrganizationName:v79];
        [(NPKPassDescription *)v66 setTransitAppletState:v77];
        [(NPKPassDescription *)v66 setFrontFieldBuckets:v76];
        [(NPKPassDescription *)v66 setBackFieldBuckets:v75];
        [(NPKPassDescription *)v66 setLastAddValueAmount:v70];
        [(NPKPassDescription *)v66 setLocalizedDescription:v86];
        [(NPKPassDescription *)v66 setPendingAddValueDate:v83];
        [(NPKPassDescription *)v66 setExpressPassTypesMask:v74];
        [(NPKPassDescription *)v66 setHasAssociatedPeerPaymentAccount:v72 != 0];
        [(NPKPassDescription *)v66 setSubcredentials:v73];
        [(NSMutableArray *)self->_passDescriptions addObject:v66];

        unint64_t v16 = 0x263F08000;
        unint64_t v17 = 0x263EFF000;
        unint64_t v18 = 0x263EFF000;
      }
      while (sqlite3_step(ppStmt) == 100);
    }
    sqlite3_clear_bindings(ppStmt);
    sqlite3_reset(ppStmt);
    sqlite3_finalize(ppStmt);
    v67 = pk_General_log();
    BOOL v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);

    if (v68)
    {
      uint64_t v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v69 = self->_manifest;
        *(_DWORD *)buf = 138412290;
        v109 = v69;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Loaded initial manifest: %@", buf, 0xCu);
      }
LABEL_51:
    }
  }
}

- (void)_performTransactionWithBlock:(id)a3
{
  BOOL v4 = (uint64_t (**)(void))a3;
  BOOL isInTransaction = self->_isInTransaction;
  if (self->_isInTransaction
    || (BOOL v6 = [(NPKGizmoDatabase *)self _executeSQL:@"BEGIN IMMEDIATE TRANSACTION;"],
        self->_BOOL isInTransaction = v6,
        v6))
  {
    int v7 = v4[2](v4);
    if (!isInTransaction)
    {
      if (v7)
      {
        [(NPKGizmoDatabase *)self _executeSQL:@"COMMIT;"];
        self->_BOOL isInTransaction = 0;
      }
      else
      {
        uint64_t v8 = pk_General_log();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

        if (v9)
        {
          uint64_t v10 = pk_General_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)BOOL v11 = 0;
            _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Rolling back transaction", v11, 2u);
          }
        }
        [(NPKGizmoDatabase *)self _executeSQL:@"ROLLBACK;"];
        self->_BOOL isInTransaction = 0;
      }
    }
  }
}

- (id)_decodeObjectOfClasses:(id)a3 fromStatement:(sqlite3_stmt *)a4 column:(int)a5
{
  id v7 = a3;
  uint64_t v8 = sqlite3_column_blob(a4, a5);
  int v9 = sqlite3_column_bytes(a4, a5);
  if (v9 < 1)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v9];
    if (v10)
    {
      BOOL v11 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v10 error:0];
      uint64_t v12 = [v11 decodeObjectOfClasses:v7 forKey:*MEMORY[0x263F081D0]];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  return v12;
}

- (id)_decodeObjectOfClass:(Class)a3 fromStatement:(sqlite3_stmt *)a4 column:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithObject:a3];
  int v9 = [(NPKGizmoDatabase *)self _decodeObjectOfClasses:v8 fromStatement:a4 column:v5];

  return v9;
}

- (id)savePass:(id)a3 isLocalPass:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[NPKGizmoDatabase savePass:isLocalPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        uint64_t v28 = 1648;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot save nil pass)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  BOOL v11 = [v6 uniqueID];

  if (!v11)
  {
    uint64_t v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      uint64_t v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "-[NPKGizmoDatabase savePass:isLocalPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        uint64_t v28 = 1649;
        LOWORD(v29) = 2112;
        *(void *)((char *)&v29 + 2) = v7;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Pass %@ has nil unique ID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  BOOL v15 = [v7 npkCompleteHash];

  if (!v15)
  {
    unint64_t v16 = pk_General_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      unint64_t v18 = pk_General_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "-[NPKGizmoDatabase savePass:isLocalPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        uint64_t v28 = 1650;
        LOWORD(v29) = 2112;
        *(void *)((char *)&v29 + 2) = v7;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Pass %@ has nil complete hash)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v28 = (uint64_t)__Block_byref_object_copy__14;
  *(void *)&long long v29 = __Block_byref_object_dispose__14;
  *((void *)&v29 + 1) = 0;
  dbQueue = self->_dbQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke;
  v23[3] = &unk_2644D5B08;
  v23[4] = self;
  id v24 = v7;
  BOOL v26 = a4;
  int v25 = buf;
  id v20 = v7;
  dispatch_sync(dbQueue, v23);
  id v21 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v21;
}

void __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      BOOL v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        BOOL v13 = "-[NPKGizmoDatabase savePass:isLocalPass:]_block_invoke";
        __int16 v14 = 2082;
        BOOL v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v16 = 2048;
        uint64_t v17 = 1655;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  buf[0] = 0;
  [*(id *)(a1 + 32) _savePassLocked:*(void *)(a1 + 40) locallyAdded:*(unsigned __int8 *)(a1 + 56) wasUpdate:buf];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke_443;
  block[3] = &unk_2644D3E10;
  uint8_t v11 = buf[0];
  uint64_t v8 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
  [*(id *)(a1 + 32) _notifyDatabaseChangedExternally];
  [*(id *)(a1 + 32) _notifyDatabaseChangedWithNoop:0];
}

void __41__NPKGizmoDatabase_savePass_isLocalPass___block_invoke_443(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v3 = &NPKGizmoDatabasePassUpdatedNotificationName;
  if (!*(unsigned char *)(a1 + 48)) {
    BOOL v3 = &NPKGizmoDatabasePassAddedNotificationName;
  }
  BOOL v4 = *v3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v8 = NPKGizmoDatabasePassKeyName;
  v9[0] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v2 postNotificationName:v4 object:v6 userInfo:v7];
}

- (void)saveDiff:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v18 = "-[NPKGizmoDatabase saveDiff:forPassWithUniqueID:]";
        __int16 v19 = 2082;
        id v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v21 = 2048;
        uint64_t v22 = 1673;
        __int16 v23 = 2112;
        uint64_t v24 = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unique ID %@ is nil)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NPKGizmoDatabase_saveDiff_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_sync(dbQueue, block);
}

uint64_t __49__NPKGizmoDatabase_saveDiff_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      BOOL v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase saveDiff:forPassWithUniqueID:]_block_invoke";
        __int16 v8 = 2082;
        BOOL v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1677;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  return [*(id *)(a1 + 32) _saveDiffLocked:*(void *)(a1 + 40) forPassWithUniqueID:*(void *)(a1 + 48)];
}

- (id)removePassWithUniqueID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        *(void *)&uint8_t buf[4] = "-[NPKGizmoDatabase removePassWithUniqueID:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        uint64_t v16 = 1685;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot remove pass with nil unique ID)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v16 = (uint64_t)__Block_byref_object_copy__14;
  uint64_t v17 = __Block_byref_object_dispose__14;
  id v18 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__NPKGizmoDatabase_removePassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5B30;
  block[4] = self;
  id v13 = v4;
  __int16 v14 = buf;
  id v9 = v4;
  dispatch_sync(dbQueue, block);
  id v10 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v10;
}

uint64_t __43__NPKGizmoDatabase_removePassWithUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  int v2 = [*(id *)(a1 + 32) _removePassWithUniqueIDLocked:*(void *)(a1 + 40)];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(a1 + 32) _notifyDatabaseChangedExternally];
  BOOL v6 = *(void **)(a1 + 32);
  return [v6 _notifyDatabaseChangedWithNoop:v2 ^ 1u];
}

- (id)rebuildDatabaseWithPasses:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  uint64_t v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke;
  block[3] = &unk_2644D5B30;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    int v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v16 = "-[NPKGizmoDatabase rebuildDatabaseWithPasses:]_block_invoke";
        __int16 v17 = 2082;
        id v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v19 = 2048;
        uint64_t v20 = 1706;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_445;
  uint64_t v12 = &unk_2644D5B58;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  [v5 _performTransactionWithBlock:&v9];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_libraryHashLockedForWatchOSMajorVersion:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion", v9, v10, v11, v12, v13));
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [*(id *)(a1 + 32) _notifyDatabaseChangedExternally];
  [*(id *)(a1 + 32) _notifyDatabaseChangedWithNoop:0];
}

uint64_t __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_445(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 344) allKeys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_2;
  v13[3] = &unk_2644D3188;
  v13[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v13];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(a1 + 32), "_savePassLocked:locallyAdded:wasUpdate:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), 0, 0, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  return 1;
}

uint64_t __46__NPKGizmoDatabase_rebuildDatabaseWithPasses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _removePassWithUniqueIDLocked:a2];
}

- (void)saveTransaction:(id)a3 forPass:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (NPKIsTransactionAllowedInUI(v6, v7))
  {
    __int16 v8 = [v6 transactionSourceIdentifier];
    long long v9 = [v7 paymentPass];
    long long v10 = [v9 devicePrimaryPaymentApplication];
    uint64_t v11 = [v10 paymentNetworkIdentifier];

    long long v12 = [v7 paymentPass];
    if ([v12 isPeerPaymentPass]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = PKTransactionsUnlimitedForCredentialType() ^ 1;
    }

    [(NPKGizmoDatabase *)self _saveTransaction:v6 forTransactionSourceIdentifier:v8 withPaymentCredentialType:v11 shouldTrim:v13];
  }
  else
  {
    id v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      uint64_t v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = [v7 uniqueID];
        int v18 = 138412546;
        id v19 = v6;
        __int16 v20 = 2112;
        uint64_t v21 = v17;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, "Error: Transaction is not allowed in UI; not inserting transaction %@ for pass: %@",
          (uint8_t *)&v18,
          0x16u);
      }
    }
  }
}

- (void)_saveTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 withPaymentCredentialType:(int64_t)a5 shouldTrim:(BOOL)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  long long v12 = v11;
  if (!v10)
  {
    int v18 = pk_General_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      __int16 v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v32 = "-[NPKGizmoDatabase _saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:]";
        __int16 v33 = 2082;
        int v34 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v35 = 2048;
        uint64_t v36 = 1746;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Transaction is nil)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  if (v11)
  {
    uint64_t v13 = [v10 identifier];

    if (v13)
    {
      if ([v10 suppressBehavior] != 1)
      {
        dbQueue = self->_dbQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __105__NPKGizmoDatabase__saveTransaction_forTransactionSourceIdentifier_withPaymentCredentialType_shouldTrim___block_invoke;
        block[3] = &unk_2644D5B80;
        block[4] = self;
        id v27 = v10;
        BOOL v30 = a6;
        id v28 = v12;
        int64_t v29 = a5;
        dispatch_sync(dbQueue, block);

        goto LABEL_22;
      }
      id v14 = pk_Payment_log();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (v15)
      {
        uint64_t v16 = pk_Payment_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = (const char *)v10;
          __int16 v17 = "Error: Transaction should be suppressed from UI; not inserting %@";
LABEL_19:
          _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
    else
    {
      __int16 v23 = pk_Payment_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        uint64_t v16 = pk_Payment_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = (const char *)v10;
          __int16 v17 = "Error: Transaction does not have identifier; not inserting %@";
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    uint64_t v21 = pk_Payment_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      uint64_t v16 = pk_Payment_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = (const char *)v10;
        __int16 v17 = "Error: No transaction source identifier; not inserting transaction %@";
        goto LABEL_19;
      }
LABEL_20:
    }
  }
LABEL_22:
}

uint64_t __105__NPKGizmoDatabase__saveTransaction_forTransactionSourceIdentifier_withPaymentCredentialType_shouldTrim___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    int v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      uint64_t v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase _saveTransaction:forTransactionSourceIdentifier:withPaymentCredentialType:shouldTrim:]_block_invoke";
        __int16 v8 = 2082;
        long long v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1760;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  uint64_t result = [*(id *)(a1 + 32) _saveTransactionLocked:*(void *)(a1 + 40) forTransactionSourceIdentifier:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 64)) {
    return [*(id *)(a1 + 32) _trimTransactionsForTransactionSourceIdentifierLocked:*(void *)(a1 + 48) withPaymentCredentialType:*(void *)(a1 + 56)];
  }
  return result;
}

- (void)removeTransactionWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v13 = "-[NPKGizmoDatabase removeTransactionWithIdentifier:]";
        __int16 v14 = 2082;
        BOOL v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v16 = 2048;
        uint64_t v17 = 1773;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Transaction Unique ID is nil)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__NPKGizmoDatabase_removeTransactionWithIdentifier___block_invoke;
  v10[3] = &unk_2644D2E08;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(dbQueue, v10);
}

uint64_t __52__NPKGizmoDatabase_removeTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    int v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase removeTransactionWithIdentifier:]_block_invoke";
        __int16 v8 = 2082;
        id v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1777;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return [*(id *)(a1 + 32) _removeTransactionWithIdentifier:*(void *)(a1 + 40)];
}

- (void)removeTransactionsForTransactionSource:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v13 = "-[NPKGizmoDatabase removeTransactionsForTransactionSource:]";
        __int16 v14 = 2082;
        BOOL v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v16 = 2048;
        uint64_t v17 = 1784;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: transaction source cannot not be nil)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__NPKGizmoDatabase_removeTransactionsForTransactionSource___block_invoke;
  v10[3] = &unk_2644D2E08;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(dbQueue, v10);
}

uint64_t __59__NPKGizmoDatabase_removeTransactionsForTransactionSource___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    int v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase removeTransactionsForTransactionSource:]_block_invoke";
        __int16 v8 = 2082;
        id v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1788;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  return [*(id *)(a1 + 32) _removeTransactionsForTransactionSource:*(void *)(a1 + 40)];
}

- (id)transactionSourcesForPassWithUniqueID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
}

- (id)transactionsForTransactionSourceIdentifier:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__14;
  uint64_t v37 = __Block_byref_object_dispose__14;
  id v38 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __139__NPKGizmoDatabase_transactionsForTransactionSourceIdentifier_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit___block_invoke;
  block[3] = &unk_2644D5BA8;
  block[4] = self;
  id v25 = v15;
  id v28 = &v33;
  unint64_t v29 = a4;
  id v26 = v16;
  id v27 = v17;
  unint64_t v30 = a5;
  int64_t v31 = a8;
  int64_t v32 = a9;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  dispatch_sync(dbQueue, block);
  id v22 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __139__NPKGizmoDatabase_transactionsForTransactionSourceIdentifier_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transactionsForTransactionSourceIdentifierLocked:*(void *)(a1 + 40) withTransactionSource:*(void *)(a1 + 72) withBackingData:*(void *)(a1 + 80) startDate:*(void *)(a1 + 48) endDate:*(void *)(a1 + 56) orderByDate:*(void *)(a1 + 88) limit:*(void *)(a1 + 96)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)transactionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__NPKGizmoDatabase_transactionWithIdentifier___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__NPKGizmoDatabase_transactionWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transactionWithIdentifierLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)transactionWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NPKGizmoDatabase_transactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __53__NPKGizmoDatabase_transactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transactionWithServiceIdentifierLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)transactionSourceIdentifierForTransactionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithIdentifier___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __76__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transactionSourceIdentifierForTransactionWithIdentifierLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)transactionSourceIdentifierForTransactionWithServiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithServiceIdentifier___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __83__NPKGizmoDatabase_transactionSourceIdentifierForTransactionWithServiceIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transactionSourceIdentifierForTransactionWithServiceIdentifierLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)transactionSourceIdentifierForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NPKGizmoDatabase_transactionSourceIdentifierForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __67__NPKGizmoDatabase_transactionSourceIdentifierForPassWithUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transactionSourceIdentifierForPassUniqueIdentifierLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)passUniqueIDForTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NPKGizmoDatabase_passUniqueIDForTransactionSourceIdentifier___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__NPKGizmoDatabase_passUniqueIDForTransactionSourceIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _passUniqueIdentifierForTransactionSourceIdentifierLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)transitAppletStateForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKGizmoDatabase_transitAppletStateForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__NPKGizmoDatabase_transitAppletStateForPassWithUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _transitAppletStateForPassWithUniqueIDLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (void)setTransitAppletState:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_setTransitAppletState_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(dbQueue, block);
}

uint64_t __62__NPKGizmoDatabase_setTransitAppletState_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase setTransitAppletState:forPassWithUniqueID:]_block_invoke";
        __int16 v8 = 2082;
        id v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1916;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  return [*(id *)(a1 + 32) _setTransitAppletStateLocked:*(void *)(a1 + 40) forPassWithUniqueID:*(void *)(a1 + 48)];
}

- (id)paymentBalancesForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NPKGizmoDatabase_paymentBalancesForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__NPKGizmoDatabase_paymentBalancesForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  uint64_t v2 = [*(id *)(a1 + 32) database];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [*(id *)(a1 + 32) database];
        int v10 = 134217984;
        uint64_t v11 = v6;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Will read payment balances from database: %p", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v7 = [*(id *)(a1 + 32) _paymentBalancesForPassWithUniqueIDLocked:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
LABEL_7:

    return;
  }
  if (v4)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Database is nil, returning nil", (uint8_t *)&v10, 2u);
    }
    goto LABEL_7;
  }
}

- (void)setPaymentBalances:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NPKGizmoDatabase_setPaymentBalances_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(dbQueue, block);
}

uint64_t __59__NPKGizmoDatabase_setPaymentBalances_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      BOOL v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase setPaymentBalances:forPassWithUniqueID:]_block_invoke";
        __int16 v8 = 2082;
        id v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1943;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  return [*(id *)(a1 + 32) _setPaymentBalancesLocked:*(void *)(a1 + 40) forPassWithUniqueID:*(void *)(a1 + 48)];
}

- (id)subcredentialsForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPKGizmoDatabase_subcredentialsForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__NPKGizmoDatabase_subcredentialsForPassWithUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _subcredentialsForPassWithUniqueIDLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (void)setSubcredentials:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKGizmoDatabase_setSubcredentials_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(dbQueue, block);
}

uint64_t __58__NPKGizmoDatabase_setSubcredentials_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136446722;
        id v7 = "-[NPKGizmoDatabase setSubcredentials:forPassWithUniqueID:]_block_invoke";
        __int16 v8 = 2082;
        id v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v10 = 2048;
        uint64_t v11 = 1967;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v6,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  return [*(id *)(a1 + 32) _setSubcredentialsLocked:*(void *)(a1 + 40) forPassWithUniqueID:*(void *)(a1 + 48)];
}

- (void)setCurrentEphemeralTransactionIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__NPKGizmoDatabase_setCurrentEphemeralTransactionIdentifier_forTransactionSourceIdentifier___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dbQueue, block);
}

uint64_t __92__NPKGizmoDatabase_setCurrentEphemeralTransactionIdentifier_forTransactionSourceIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCurrentEphemeralTransactionIdentifier:*(void *)(a1 + 40) forTransactionSourceIdentifier:*(void *)(a1 + 48)];
}

- (id)currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__NPKGizmoDatabase_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier___block_invoke;
  block[3] = &unk_2644D42D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __88__NPKGizmoDatabase_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setLastAddValueAmount:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_setLastAddValueAmount_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dbQueue, block);
}

uint64_t __62__NPKGizmoDatabase_setLastAddValueAmount_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setLastAddValueAmountLocked:*(void *)(a1 + 40) forPassWithUniqueID:*(void *)(a1 + 48)];
}

- (id)lastAddValueAmountForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKGizmoDatabase_lastAddValueAmountForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D42D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__NPKGizmoDatabase_lastAddValueAmountForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _lastAddValueAmountForPassWithUniqueIDLocked:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPendingAddValueDate:(id)a3 forPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NPKGizmoDatabase_setPendingAddValueDate_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dbQueue, block);
}

uint64_t __63__NPKGizmoDatabase_setPendingAddValueDate_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPendingAddValueDateLocked:*(void *)(a1 + 40) forPassWithUniqueID:*(void *)(a1 + 48)];
}

- (id)pendingAddValueDateForPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__14;
  id v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NPKGizmoDatabase_pendingAddValueDateForPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D42D8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__NPKGizmoDatabase_pendingAddValueDateForPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _pendingAddValueDateForPassWithUniqueIDLocked:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)restoreBlockForVolatilePassData
{
  uint64_t v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Fetching Volatile Pass Data from DB", buf, 2u);
    }
  }
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 v8 = [MEMORY[0x263EFF9A0] dictionary];
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v10 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v12 = [(NPKGizmoDatabase *)self passDescriptions];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke;
  v35[3] = &unk_2644D5BF8;
  id v13 = v9;
  id v36 = v13;
  uint64_t v37 = self;
  id v14 = v6;
  id v38 = v14;
  id v15 = v7;
  id v39 = v15;
  id v16 = v8;
  id v40 = v16;
  id v17 = v10;
  id v41 = v17;
  id v18 = v11;
  id v42 = v18;
  [v12 enumerateObjectsUsingBlock:v35];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2;
  v28[3] = &unk_2644D5C70;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v34 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  id v25 = (void *)MEMORY[0x223C37380](v28);
  id v26 = (void *)MEMORY[0x223C37380]();

  return v26;
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = [v22 uniqueID];
  [v3 setObject:v22 forKey:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v22 uniqueID];
  id v7 = [v5 transactionSourceIdentifierForPassWithUniqueID:v6];

  if (v7)
  {
    __int16 v8 = *(void **)(a1 + 48);
    id v9 = [v22 uniqueID];
    [v8 setObject:v7 forKey:v9];

    id v10 = [*(id *)(a1 + 40) transactionsForTransactionSourceIdentifier:v7 withTransactionSource:0 withBackingData:0 startDate:0 endDate:0 orderedByDate:1 limit:*MEMORY[0x263F5C5A8]];
    if (v10) {
      [*(id *)(a1 + 56) setObject:v10 forKey:v7];
    }
    uint64_t v11 = [*(id *)(a1 + 40) currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:v7];
    if (v11) {
      [*(id *)(a1 + 64) setObject:v11 forKey:v7];
    }
  }
  uint64_t v12 = *(void **)(a1 + 40);
  id v13 = [v22 uniqueID];
  id v14 = [v12 paymentBalancesForPassWithUniqueID:v13];

  if (v14)
  {
    id v15 = *(void **)(a1 + 72);
    id v16 = [v22 uniqueID];
    [v15 setObject:v14 forKey:v16];
  }
  id v17 = *(void **)(a1 + 40);
  id v18 = [v22 uniqueID];
  id v19 = [v17 subcredentialsForPassWithUniqueID:v18];

  if (v19)
  {
    id v20 = *(void **)(a1 + 80);
    id v21 = [v22 uniqueID];
    [v20 setObject:v19 forKey:v21];
  }
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Restoring Volatile Pass Data on DB", buf, 2u);
    }
  }
  id v7 = [v3 passDescriptions];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_449;
  v9[3] = &unk_2644D5BF8;
  id v10 = a1[4];
  id v11 = v3;
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = a1[7];
  id v15 = a1[8];
  id v16 = a1[9];
  id v8 = v3;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_449(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 uniqueID];
  BOOL v5 = [a1[4] objectForKey:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 transitAppletState];

    if (v7)
    {
      id v8 = a1[5];
      id v9 = [v6 transitAppletState];
      [v8 setTransitAppletState:v9 forPassWithUniqueID:v4];
    }
    id v10 = [v6 lastAddValueAmount];

    if (v10)
    {
      id v11 = a1[5];
      id v12 = [v6 lastAddValueAmount];
      [v11 setLastAddValueAmount:v12 forPassWithUniqueID:v4];
    }
    id v13 = [v6 pendingAddValueDate];

    if (v13)
    {
      id v14 = a1[5];
      id v15 = [v6 pendingAddValueDate];
      [v14 setPendingAddValueDate:v15 forPassWithUniqueID:v4];
    }
    id v16 = [v6 preferredPaymentApplication];

    if (v16)
    {
      id v17 = [v6 preferredPaymentApplication];
      id v18 = [v17 applicationIdentifier];

      id v19 = [v3 devicePaymentApplications];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2_450;
      v30[3] = &unk_2644D5C20;
      id v31 = v18;
      id v32 = v4;
      id v33 = a1[5];
      id v20 = v18;
      [v19 enumerateObjectsUsingBlock:v30];
    }
    id v21 = [a1[6] objectForKey:v4];
    if (v21)
    {
      id v22 = [a1[7] objectForKey:v21];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_3;
      v27[3] = &unk_2644D5C48;
      id v28 = a1[5];
      id v23 = v21;
      id v29 = v23;
      [v22 enumerateObjectsUsingBlock:v27];
      id v24 = [a1[8] objectForKey:v23];
      if (v24) {
        [a1[5] setCurrentEphemeralTransactionIdentifier:v24 forTransactionSourceIdentifier:v23];
      }
    }
    id v25 = [a1[9] objectForKey:v4];
    if (v25) {
      [a1[5] setPaymentBalances:v25 forPassWithUniqueID:v4];
    }
    id v26 = [a1[10] objectForKey:v4];
    if (v26) {
      [a1[5] setSubcredentials:v26 forPassWithUniqueID:v4];
    }
  }
}

void __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_2_450(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  BOOL v5 = [v11 applicationIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  id v7 = v11;
  if (v6)
  {
    id v8 = +[NPKGizmoDatabase sharedDatabase];
    id v9 = [v8 passForUniqueID:*(void *)(a1 + 40)];
    id v10 = [v9 paymentPass];

    if (v10) {
      [*(id *)(a1 + 48) setPreferredPaymentApplication:v11 forPaymentPass:v10];
    }
    *a3 = 1;

    id v7 = v11;
  }
}

uint64_t __51__NPKGizmoDatabase_restoreBlockForVolatilePassData__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _saveTransaction:a2 forTransactionSourceIdentifier:*(void *)(a1 + 40) withPaymentCredentialType:103 shouldTrim:0];
}

- (void)_notifyDatabaseChangedWithNoop:(BOOL)a3
{
}

- (void)_notifyForFirstUnlock
{
}

- (void)_notifyDatabaseChangedWithNoop:(BOOL)a3 firstUnlock:(BOOL)a4
{
  BOOL sendingLocalNotifyDatabaseChanged = self->_sendingLocalNotifyDatabaseChanged;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (sendingLocalNotifyDatabaseChanged)
  {
    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase already sending DB change, so coalescing", buf, 2u);
      }
    }
    self->_needsMoreLocalNotifyDatabaseChanged = 1;
  }
  else
  {
    if (v9)
    {
      id v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase alerting of DB change", buf, 2u);
      }
    }
    self->_BOOL sendingLocalNotifyDatabaseChanged = 1;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke;
    v12[3] = &unk_2644D5C98;
    BOOL v13 = a3;
    BOOL v14 = a4;
    v12[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

void __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = NPKGizmoDatabaseChangedWasNoOpKeyName;
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v11[0] = v2;
  v10[1] = NPKGizmoDatabaseChangedWasFirstUnlockKeyName;
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v11[1] = v3;
  BOOL v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  BOOL v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:NPKGizmoDatabaseChangedNotificationName object:*(void *)(a1 + 32) userInfo:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 328);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke_2;
  block[3] = &unk_2644D2938;
  block[4] = v6;
  char v9 = *(unsigned char *)(a1 + 40);
  dispatch_sync(v7, block);
}

uint64_t __63__NPKGizmoDatabase__notifyDatabaseChangedWithNoop_firstUnlock___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 372) = 0;
  if (*(unsigned char *)(*(void *)(result + 32) + 373))
  {
    uint64_t v1 = result;
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      BOOL v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Finished alerting of DB change, but a coalesced change was detected...rebroadcasting", v5, 2u);
      }
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 373) = 0;
    return [*(id *)(v1 + 32) _notifyDatabaseChangedWithNoop:*(unsigned __int8 *)(v1 + 40)];
  }
  return result;
}

- (void)_notifyDatabaseChangedExternally
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Alerting external clients of DB change...", v7, 2u);
    }
  }
  ++self->_externallyChangedBroadcasts;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)_NPKGizmoDatabaseExternallyChangedNotificationName, 0, 0, 1u);
}

- (BOOL)passDBIsAvailable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__NPKGizmoDatabase_passDBIsAvailable__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__NPKGizmoDatabase_passDBIsAvailable__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _passDBIsAvailableLocked];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)numberOfPasses
{
  uint64_t v2 = [(NPKGizmoDatabase *)self manifestHashes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)_passDBIsAvailableLocked
{
  return self->_passDBIsAvailable;
}

- (void)_savePassLocked:(id)a3 locallyAdded:(BOOL)a4 wasUpdate:(BOOL *)a5
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v7 = a3;
  context = (void *)MEMORY[0x223C37110]();
  uint64_t v8 = [v7 passTypeIdentifier];
  uint64_t v47 = (void *)[v8 copy];

  int v53 = v7;
  char v9 = (void *)[v7 copy];
  id v10 = [v9 uniqueID];
  id v11 = [(NPKGizmoDatabase *)self _passForUniqueIDLocked:v10 includeImageSets:0];

  uint64_t v12 = [v11 paymentPass];
  uint64_t v43 = NPKPassDescriptionExpressTypesMaskWithPass(v9);
  if (v11)
  {
    manifest = self->_manifest;
    BOOL v14 = [v9 uniqueID];
    id v15 = [(NSMutableDictionary *)manifest objectForKey:v14];
    id v45 = [v15 remoteManifestHashes];
  }
  else
  {
    id v45 = 0;
  }
  v51 = (void *)v12;
  if (v12)
  {
    id v69 = 0;
    id v16 = [(NPKGizmoDatabase *)self _getPreferredPaymentApplicationForPaymentPass:v12 aid:&v69];
    id v42 = v69;
    id v17 = [v9 uniqueID];
    BOOL v18 = [(NPKGizmoDatabase *)self _getDeletePendingForUniqueID:v17];

    id v19 = [v9 uniqueID];
    id v41 = [(NPKGizmoDatabase *)self _transitAppletStateForPassWithUniqueIDLocked:v19];

    id v20 = [v9 uniqueID];
    id v40 = [(NPKGizmoDatabase *)self _lastAddValueAmountForPassWithUniqueIDLocked:v20];

    id v21 = [v9 uniqueID];
    id v39 = [(NPKGizmoDatabase *)self _pendingAddValueDateForPassWithUniqueIDLocked:v21];

    id v22 = [v9 uniqueID];
    id v38 = [(NPKGizmoDatabase *)self _paymentBalancesForPassWithUniqueIDLocked:v22];

    id v23 = [v9 uniqueID];
    uint64_t v37 = [(NPKGizmoDatabase *)self _subcredentialsForPassWithUniqueIDLocked:v23];

    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v39 = 0;
  id v40 = 0;
  BOOL v18 = 0;
  uint64_t v37 = 0;
  id v38 = 0;
  id v41 = 0;
  id v42 = 0;
  if (a5) {
LABEL_6:
  }
    *a5 = v11 != 0;
LABEL_7:
  id v24 = [v11 diff:v9];
  id v25 = pk_General_log();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    id v27 = pk_General_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v24;
      _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Saving diff %@", buf, 0xCu);
    }
  }
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke;
  v54[3] = &unk_2644D5CC0;
  v54[4] = self;
  id v55 = v9;
  id v56 = v11;
  id v57 = v24;
  BOOL v67 = v18;
  id v36 = v24;
  id v58 = v42;
  id v59 = v41;
  id v60 = v40;
  id v61 = v39;
  BOOL v68 = a4;
  id v62 = v45;
  id v63 = v38;
  id v64 = v37;
  id v65 = v47;
  uint64_t v66 = v43;
  id v50 = v47;
  id v44 = v37;
  id v48 = v38;
  id v28 = v45;
  id v29 = v39;
  id v46 = v40;
  id v30 = v41;
  id v31 = v42;
  id v32 = v36;
  id v33 = v11;
  id v34 = v9;
  [(NPKGizmoDatabase *)self _performTransactionWithBlock:v54];
  uint64_t v35 = [v34 uniqueID];
  [(NPKGizmoDatabase *)self _createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:v35];
}

uint64_t __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke(uint64_t a1)
{
  uint64_t v241 = *MEMORY[0x263EF8340];
  uint64_t v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) deleteStatement];
  id v3 = [*(id *)(a1 + 40) uniqueID];
  sqlite3_bind_text(v2, 1, (const char *)[v3 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((sqlite3_step(v2) & 0xFFFFFFFE) != 0x64)
  {
    BOOL v4 = pk_General_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      uint64_t v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = sqlite3_sql(v2);
        uint64_t v8 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
        *(_DWORD *)buf = 136447234;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        __int16 v235 = 2082;
        v236 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v237 = 2048;
        uint64_t v238 = 2246;
        __int16 v239 = 2080;
        *(void *)v240 = v7;
        *(_WORD *)&v240[8] = 2080;
        *(void *)&v240[10] = v8;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v2);
  sqlite3_reset(v2);
  char v9 = (sqlite3_stmt *)[*(id *)(a1 + 32) insertStatement];
  id v10 = [*(id *)(a1 + 40) uniqueID];
  sqlite3_bind_text(v9, 1, (const char *)[v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  id v11 = [*(id *)(a1 + 40) passTypeIdentifier];
  uint64_t v12 = (void *)[v11 copy];

  id v208 = v12;
  BOOL v13 = (const char *)[v208 UTF8String];
  sqlite3_bind_text(v9, 2, v13, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v9, 3, [*(id *)(a1 + 40) style]);
  id v212 = [*(id *)(a1 + 40) npkCompleteHash];
  sqlite3_bind_blob(v9, 4, (const void *)[v212 bytes], objc_msgSend(v212, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  uint64_t v14 = [*(id *)(a1 + 48) ingestedDate];
  if (!v14)
  {
    uint64_t v14 = [MEMORY[0x263EFF910] date];
  }
  v204 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 40), "setIngestedDate:");
  v216 = (void *)[*(id *)(a1 + 40) copy];
  id v15 = objc_alloc(MEMORY[0x263F5BF38]);
  v211 = (void *)[v15 initWithDictionary:MEMORY[0x263EFFA78] bundle:0];
  [v211 setMissingImageSetsFromObject:v216];
  [v216 flushLoadedImageSets];
  NPKSecureArchiveObject(v216);
  id v215 = objc_claimAutoreleasedReturnValue();
  sqlite3_bind_blob(v9, 5, (const void *)[v215 bytes], objc_msgSend(v215, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (os_variant_has_internal_ui())
  {
    id v16 = objc_opt_class();
    id v17 = NPKSecureUnarchiveObject(v215, v16);
    BOOL v18 = v17;
    if (v17)
    {
      id v19 = [v17 passTypeIdentifier];
      BOOL v20 = [v19 length] == 0;

      if (!v20) {
        goto LABEL_19;
      }
      id v21 = pk_General_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (!v22) {
        goto LABEL_19;
      }
      id v23 = pk_General_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [*(id *)(a1 + 40) uniqueID];
        id v25 = [v216 passTypeIdentifier];
        NSStringFromBOOL();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        __int16 v235 = 2112;
        v236 = v24;
        __int16 v237 = 2112;
        uint64_t v238 = (uint64_t)v208;
        __int16 v239 = 2112;
        *(void *)v240 = v25;
        *(_WORD *)&v240[8] = 2112;
        *(void *)&v240[10] = v26;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass Encoding of pass with uniqueID %@ is missing the type identifier. Type identifier in stmt: %@. Type identifier from PKPass the archive was created from: %@ isUpdate?: %@", buf, 0x34u);
      }
    }
    else
    {
      id v27 = pk_General_log();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

      if (!v28)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v23 = pk_General_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [*(id *)(a1 + 40) uniqueID];
        NSStringFromBOOL();
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        __int16 v235 = 2112;
        v236 = v29;
        __int16 v237 = 2112;
        uint64_t v238 = (uint64_t)v30;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass There was a problem unarchiving the pass archive for pass with uniqueID %@. isUpdate?: %@", buf, 0x20u);
      }
    }

    goto LABEL_19;
  }
LABEL_20:
  if (v211)
  {
    NPKSecureArchiveObject(v211);
    id v31 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v9, 6, (const void *)[v31 bytes], objc_msgSend(v31, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 6);
  }
  id v32 = *(void **)(a1 + 56);
  if (v32)
  {
    NPKSecureArchiveObject(v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v9, 7, (const void *)[v33 bytes], objc_msgSend(v33, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  id v34 = [*(id *)(a1 + 40) logoText];

  if (v34)
  {
    id v35 = [*(id *)(a1 + 40) logoText];
    sqlite3_bind_text(v9, 8, (const char *)[v35 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  id v36 = [*(id *)(a1 + 40) logoImage];

  if (v36)
  {
    uint64_t v37 = [*(id *)(a1 + 40) logoImage];
    id v38 = NPKSecureArchiveObject(v37);

    id v214 = v38;
    sqlite3_bind_blob(v9, 9, (const void *)[v214 bytes], objc_msgSend(v214, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    id v214 = 0;
  }
  id v39 = [*(id *)(a1 + 40) displayProfile];
  id v40 = [v39 backgroundColor];

  if (v40)
  {
    id v41 = [*(id *)(a1 + 40) displayProfile];
    id v42 = [v41 backgroundColor];
    uint64_t v43 = NPKSecureArchiveObject(v42);

    id v44 = v43;
    sqlite3_bind_blob(v9, 10, (const void *)[v44 bytes], objc_msgSend(v44, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  id v45 = [*(id *)(a1 + 40) displayProfile];
  id v46 = [v45 labelColor];

  if (v46)
  {
    uint64_t v47 = [*(id *)(a1 + 40) displayProfile];
    id v48 = [v47 labelColor];
    uint64_t v49 = NPKSecureArchiveObject(v48);

    id v50 = v49;
    sqlite3_bind_blob(v9, 11, (const void *)[v50 bytes], objc_msgSend(v50, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  v51 = [*(id *)(a1 + 40) displayProfile];
  id v52 = [v51 foregroundColor];

  if (v52)
  {
    int v53 = [*(id *)(a1 + 40) displayProfile];
    int v54 = [v53 foregroundColor];
    id v55 = NPKSecureArchiveObject(v54);

    id v56 = v55;
    sqlite3_bind_blob(v9, 12, (const void *)[v56 bytes], objc_msgSend(v56, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  id v57 = [*(id *)(a1 + 40) backgroundImage];

  if (!v57)
  {
    id v213 = 0;
    goto LABEL_44;
  }
  if ([*(id *)(a1 + 40) style] != 2)
  {
    id v62 = [*(id *)(a1 + 40) backgroundImage];
    if (v62) {
      goto LABEL_39;
    }
LABEL_42:
    id v63 = 0;
    goto LABEL_43;
  }
  id v58 = (void *)MEMORY[0x263F5BEE0];
  id v59 = [*(id *)(a1 + 40) backgroundImage];
  [v59 size];
  id v60 = objc_msgSend(v58, "constraintsWithFixedSize:");

  id v61 = [*(id *)(a1 + 40) backgroundImage];
  id v62 = [v61 blurredImageWithRadius:27 constraints:v60];

  if (!v62) {
    goto LABEL_42;
  }
LABEL_39:
  id v63 = NPKSecureArchiveObject(v62);
LABEL_43:
  id v213 = v63;
  sqlite3_bind_blob(v9, 13, (const void *)[v213 bytes], objc_msgSend(v213, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

LABEL_44:
  id v64 = [*(id *)(a1 + 40) nfcPayload];

  if (v64)
  {
    id v65 = [*(id *)(a1 + 40) nfcPayload];
    uint64_t v66 = NPKSecureArchiveObject(v65);

    id v67 = v66;
    sqlite3_bind_blob(v9, 14, (const void *)[v67 bytes], objc_msgSend(v67, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  BOOL v68 = [*(id *)(a1 + 40) paymentPass];
  sqlite3_bind_int(v9, 15, [v68 isPrivateLabel]);

  id v69 = [*(id *)(a1 + 40) paymentPass];
  sqlite3_bind_int(v9, 16, [v69 isCobranded]);

  v218 = [*(id *)(a1 + 40) paymentPass];
  v70 = [v218 devicePaymentApplications];

  if (v70)
  {
    v71 = [v218 devicePaymentApplications];
    uint64_t v72 = NPKSecureArchiveObject(v71);

    id v73 = v72;
    sqlite3_bind_blob(v9, 17, (const void *)[v73 bytes], objc_msgSend(v73, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 17);
  }
  sqlite3_int64 v74 = [v218 devicePrimaryPaymentApplication];

  if (v74)
  {
    v75 = [v218 devicePrimaryPaymentApplication];
    v76 = NPKSecureArchiveObject(v75);

    id v77 = v76;
    sqlite3_bind_blob(v9, 18, (const void *)[v77 bytes], objc_msgSend(v77, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 18);
  }
  int v78 = [v218 devicePrimaryContactlessPaymentApplication];

  if (v78)
  {
    v79 = [v218 devicePrimaryContactlessPaymentApplication];
    int v80 = NPKSecureArchiveObject(v79);

    id v81 = v80;
    sqlite3_bind_blob(v9, 19, (const void *)[v81 bytes], objc_msgSend(v81, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 19);
  }
  int v82 = [v218 devicePrimaryInAppPaymentApplication];

  if (v82)
  {
    v83 = [v218 devicePrimaryInAppPaymentApplication];
    int v84 = NPKSecureArchiveObject(v83);

    id v85 = v84;
    sqlite3_bind_blob(v9, 20, (const void *)[v85 bytes], objc_msgSend(v85, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 20);
  }
  uint64_t v226 = 0;
  v227 = &v226;
  uint64_t v228 = 0x3032000000;
  v229 = __Block_byref_object_copy__14;
  v230 = __Block_byref_object_dispose__14;
  id v231 = 0;
  if (!v218) {
    goto LABEL_62;
  }
  if (!*(void *)(a1 + 64)) {
    goto LABEL_62;
  }
  v86 = [v218 devicePaymentApplications];
  v223[0] = MEMORY[0x263EF8330];
  v223[1] = 3221225472;
  v223[2] = __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke_454;
  v223[3] = &unk_2644D2EA8;
  id v224 = *(id *)(a1 + 64);
  v225 = &v226;
  [v86 enumerateObjectsUsingBlock:v223];

  if (v227[5])
  {
    sqlite3_bind_text(v9, 21, (const char *)[*(id *)(a1 + 64) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    NPKSecureArchiveObject((void *)v227[5]);
    id v87 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v9, 22, (const void *)[v87 bytes], objc_msgSend(v87, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
LABEL_62:
    sqlite3_bind_null(v9, 21);
    sqlite3_bind_null(v9, 22);
  }
  v88 = [*(id *)(a1 + 40) ingestedDate];
  [v88 timeIntervalSinceReferenceDate];
  sqlite3_bind_int(v9, 23, (int)v89);

  id v90 = [*(id *)(a1 + 40) npkCompleteHash];
  v91 = (const void *)[v90 bytes];
  v92 = [*(id *)(a1 + 40) npkCompleteHash];
  sqlite3_bind_blob(v9, 24, v91, [v92 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  sqlite3_bind_int(v9, 25, *(unsigned __int8 *)(a1 + 136));
  if (v218)
  {
    int v93 = [v218 effectiveContactlessPaymentApplicationState];
    unsigned int v207 = [v218 npkHasUserSelectableContactlessPaymentApplications];
  }
  else
  {
    unsigned int v207 = 0;
    int v93 = 0;
  }
  sqlite3_bind_int(v9, 26, v93);
  sqlite3_bind_int(v9, 27, v207);
  sqlite3_bind_int(v9, 28, [*(id *)(a1 + 40) hasStoredValue]);
  sqlite3_bind_int64(v9, 29, [*(id *)(a1 + 40) settings]);
  v94 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
  for (unint64_t i = 0; i < [(id)objc_opt_class() latestWatchOSMajorVersion]; ++i)
  {
    v96 = [*(id *)(a1 + 40) npkCompleteHashForWatchOSVersion:i + 1];
    [v94 setObject:v96 atIndexedSubscript:i];
  }
  v202 = (void *)[v94 copy];
  NPKSecureArchiveObject(v202);
  id v210 = objc_claimAutoreleasedReturnValue();
  sqlite3_bind_blob(v9, 30, (const void *)[v210 bytes], objc_msgSend(v210, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  v97 = [v218 issuerCountryCode];
  id v206 = v97;
  if (v97) {
    sqlite3_bind_text(v9, 31, (const char *)objc_msgSend(v97, "UTF8String", v202), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(v9, 31);
  }
  v98 = objc_msgSend(*(id *)(a1 + 40), "paymentPass", v202);
  v99 = [v98 availableActions];

  if (v99)
  {
    v100 = [*(id *)(a1 + 40) paymentPass];
    v101 = [v100 availableActions];
    v102 = NPKSecureArchiveObject(v101);

    id v103 = v102;
    sqlite3_bind_blob(v9, 32, (const void *)[v103 bytes], objc_msgSend(v103, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 32);
  }
  v104 = [*(id *)(a1 + 40) organizationName];

  if (v104)
  {
    id v105 = [*(id *)(a1 + 40) organizationName];
    sqlite3_bind_text(v9, 33, (const char *)[v105 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 33);
  }
  v106 = *(void **)(a1 + 72);
  if (v106)
  {
    NPKSecureArchiveObject(v106);
    id v107 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v9, 34, (const void *)[v107 bytes], objc_msgSend(v107, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 34);
  }
  v108 = [*(id *)(a1 + 40) frontFieldBuckets];

  if (v108)
  {
    v109 = [*(id *)(a1 + 40) frontFieldBuckets];
    __int16 v110 = NPKSecureArchiveObject(v109);

    id v111 = v110;
    sqlite3_bind_blob(v9, 35, (const void *)[v111 bytes], objc_msgSend(v111, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 35);
  }
  __int16 v112 = [*(id *)(a1 + 40) backFieldBuckets];

  if (v112)
  {
    v113 = [*(id *)(a1 + 40) backFieldBuckets];
    uint64_t v114 = NPKSecureArchiveObject(v113);

    id v115 = v114;
    sqlite3_bind_blob(v9, 36, (const void *)[v115 bytes], objc_msgSend(v115, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 36);
  }
  v116 = *(void **)(a1 + 80);
  if (v116)
  {
    id v117 = [v116 stringValue];
    sqlite3_bind_text(v9, 37, (const char *)[v117 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 37);
  }
  v118 = [*(id *)(a1 + 40) localizedDescription];

  if (v118)
  {
    id v119 = [*(id *)(a1 + 40) localizedDescription];
    sqlite3_bind_text(v9, 38, (const char *)[v119 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v9, 38);
  }
  v120 = *(void **)(a1 + 88);
  if (v120)
  {
    [v120 timeIntervalSinceReferenceDate];
    sqlite3_bind_int(v9, 39, (int)v121);
  }
  else
  {
    sqlite3_bind_null(v9, 39);
  }
  sqlite3_bind_int64(v9, 40, *(void *)(a1 + 128));
  v122 = v94;
  if (*(unsigned char *)(a1 + 137)) {
    v122 = *(void **)(a1 + 96);
  }
  id v205 = v122;
  NPKSecureArchiveObject(v205);
  id v209 = objc_claimAutoreleasedReturnValue();
  sqlite3_bind_blob(v9, 41, (const void *)[v209 bytes], objc_msgSend(v209, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v9, 42, [v218 isPeerPaymentPass]);
  if (*(void *)(a1 + 104))
  {
    v123 = pk_General_log();
    BOOL v124 = os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);

    if (v124)
    {
      v125 = pk_General_log();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        v126 = [*(id *)(a1 + 40) uniqueID];
        v127 = *(const char **)(a1 + 104);
        *(_DWORD *)buf = 138412546;
        v234 = v126;
        __int16 v235 = 2112;
        v236 = v127;
        _os_log_impl(&dword_21E92F000, v125, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalance restore) restoring old balances for pass %@ %@", buf, 0x16u);
      }
    }
    v128 = NPKSecureArchiveObject(*(void **)(a1 + 104));
    v129 = v128;
    if (v128)
    {
      id v130 = v128;
      sqlite3_bind_blob(v9, 43, (const void *)[v130 bytes], objc_msgSend(v130, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v131 = pk_General_log();
      BOOL v132 = os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT);

      if (v132)
      {
        v133 = pk_General_log();
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
        {
          v134 = [*(id *)(a1 + 40) uniqueID];
          v135 = *(const char **)(a1 + 104);
          *(_DWORD *)buf = 138412546;
          v234 = v134;
          __int16 v235 = 2112;
          v236 = v135;
          _os_log_impl(&dword_21E92F000, v133, OS_LOG_TYPE_DEFAULT, "Notice: (PKPaymentBalance restore) archiving old balances for pass %@ %@ returned nil", buf, 0x16u);
        }
      }
      sqlite3_bind_null(v9, 43);
    }
  }
  else
  {
    sqlite3_bind_null(v9, 43);
  }
  if (*(void *)(a1 + 112))
  {
    v136 = pk_General_log();
    BOOL v137 = os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT);

    if (v137)
    {
      v138 = pk_General_log();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
      {
        v139 = [*(id *)(a1 + 40) uniqueID];
        v140 = *(const char **)(a1 + 112);
        *(_DWORD *)buf = 138412546;
        v234 = v139;
        __int16 v235 = 2112;
        v236 = v140;
        _os_log_impl(&dword_21E92F000, v138, OS_LOG_TYPE_DEFAULT, "Notice: (PKAppletSubcredential restore) restoring old subcredentials for pass %@ %@", buf, 0x16u);
      }
    }
    v141 = NPKSecureArchiveObject(*(void **)(a1 + 112));
    v142 = v141;
    if (v141)
    {
      id v143 = v141;
      sqlite3_bind_blob(v9, 44, (const void *)[v143 bytes], objc_msgSend(v143, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v144 = pk_General_log();
      BOOL v145 = os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT);

      if (v145)
      {
        v146 = pk_General_log();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          v147 = [*(id *)(a1 + 40) uniqueID];
          v148 = *(const char **)(a1 + 112);
          *(_DWORD *)buf = 138412546;
          v234 = v147;
          __int16 v235 = 2112;
          v236 = v148;
          _os_log_impl(&dword_21E92F000, v146, OS_LOG_TYPE_DEFAULT, "Notice: (PKAppletSubcredential restore) archiving old subcredentials for pass %@ %@ returned nil", buf, 0x16u);
        }
      }
      sqlite3_bind_null(v9, 44);
    }
  }
  else
  {
    sqlite3_bind_null(v9, 44);
  }
  int v149 = sqlite3_step(v9);
  if ((v149 & 0xFFFFFFFE) != 0x64)
  {
    v150 = pk_General_log();
    BOOL v151 = os_log_type_enabled(v150, OS_LOG_TYPE_ERROR);

    if (v151)
    {
      v152 = pk_General_log();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
      {
        id v153 = *(id *)(a1 + 120);
        uint64_t v154 = [v153 UTF8String];
        *(_DWORD *)buf = 138413058;
        v234 = (const char *)v153;
        __int16 v235 = 2080;
        v236 = (const char *)v154;
        __int16 v237 = 2112;
        uint64_t v238 = (uint64_t)v208;
        __int16 v239 = 2080;
        *(void *)v240 = v13;
        _os_log_impl(&dword_21E92F000, v152, OS_LOG_TYPE_ERROR, "Error: Insert failed. passTypeIdentifier for insert stmt. Values inputStr: %@, inputUTF8: %s, stmtStr: %@, stmtUTF8: %s", buf, 0x2Au);
      }
    }
    v155 = pk_General_log();
    BOOL v156 = os_log_type_enabled(v155, OS_LOG_TYPE_ERROR);

    if (v156)
    {
      v157 = pk_General_log();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
      {
        v158 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
        v159 = sqlite3_sql(v9);
        *(_DWORD *)buf = 136447490;
        v234 = "-[NPKGizmoDatabase _savePassLocked:locallyAdded:wasUpdate:]_block_invoke";
        __int16 v235 = 2082;
        v236 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v237 = 2048;
        uint64_t v238 = 2530;
        __int16 v239 = 1024;
        *(_DWORD *)v240 = v149;
        *(_WORD *)&v240[4] = 2080;
        *(void *)&v240[6] = v158;
        *(_WORD *)&v240[14] = 2080;
        *(void *)&v240[16] = v159;
        _os_log_impl(&dword_21E92F000, v157, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Insert failed with result: %d, error: %s, stmt: %s)", buf, 0x3Au);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v9);
  sqlite3_reset(v9);
  v217 = objc_alloc_init(NPKGizmoDatabaseManifestEntry);
  v160 = [*(id *)(a1 + 40) uniqueID];
  [(NPKGizmoDatabaseManifestEntry *)v217 setUniqueID:v160];

  [(NPKGizmoDatabaseManifestEntry *)v217 setLocalManifestHashes:v94];
  [(NPKGizmoDatabaseManifestEntry *)v217 setRemoteManifestHashes:v205];
  v161 = *(void **)(*(void *)(a1 + 32) + 344);
  v162 = [*(id *)(a1 + 40) uniqueID];
  [v161 setObject:v217 forKeyedSubscript:v162];

  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  id v163 = *(id *)(*(void *)(a1 + 32) + 352);
  uint64_t v164 = [v163 countByEnumeratingWithState:&v219 objects:v232 count:16];
  if (v164)
  {
    uint64_t v165 = *(void *)v220;
LABEL_138:
    uint64_t v166 = 0;
    while (1)
    {
      if (*(void *)v220 != v165) {
        objc_enumerationMutation(v163);
      }
      v167 = *(void **)(*((void *)&v219 + 1) + 8 * v166);
      v168 = [v167 uniqueID];
      v169 = [*(id *)(a1 + 40) uniqueID];
      char v170 = [v168 isEqualToString:v169];

      if (v170) {
        break;
      }
      if (v164 == ++v166)
      {
        uint64_t v164 = [v163 countByEnumeratingWithState:&v219 objects:v232 count:16];
        if (v164) {
          goto LABEL_138;
        }
        goto LABEL_144;
      }
    }
    v171 = v167;

    if (v171) {
      goto LABEL_147;
    }
  }
  else
  {
LABEL_144:
  }
  v171 = objc_alloc_init(NPKPassDescription);
  v172 = [*(id *)(a1 + 40) uniqueID];
  [(NPKPassDescription *)v171 setUniqueID:v172];

  [*(id *)(*(void *)(a1 + 32) + 352) addObject:v171];
LABEL_147:
  v173 = [*(id *)(a1 + 40) npkCompleteHash];
  [(NPKPassDescription *)v171 setManifestHash:v173];

  v174 = [*(id *)(a1 + 40) passTypeIdentifier];
  [(NPKPassDescription *)v171 setPassTypeIdentifier:v174];

  -[NPKPassDescription setStyle:](v171, "setStyle:", [*(id *)(a1 + 40) style]);
  v175 = [*(id *)(a1 + 40) relevantDate];
  [(NPKPassDescription *)v171 setRelevantDate:v175];

  v176 = [*(id *)(a1 + 40) logoText];
  [(NPKPassDescription *)v171 setLogoText:v176];

  [(NPKPassDescription *)v171 setLogoImageEncoded:v214];
  v177 = [*(id *)(a1 + 40) displayProfile];
  v178 = [v177 backgroundColor];
  [(NPKPassDescription *)v171 setBackgroundColor:v178];

  v179 = [*(id *)(a1 + 40) displayProfile];
  v180 = [v179 labelColor];
  [(NPKPassDescription *)v171 setLabelColor:v180];

  v181 = [*(id *)(a1 + 40) displayProfile];
  v182 = [v181 foregroundColor];
  [(NPKPassDescription *)v171 setForegroundColor:v182];

  [(NPKPassDescription *)v171 setDeletePending:*(unsigned __int8 *)(a1 + 136)];
  [(NPKPassDescription *)v171 setBackgroundImageEncoded:v213];
  v183 = [*(id *)(a1 + 40) nfcPayload];
  [(NPKPassDescription *)v171 setNfcPayload:v183];

  v184 = [*(id *)(a1 + 40) paymentPass];
  -[NPKPassDescription setPrivateLabel:](v171, "setPrivateLabel:", [v184 isPrivateLabel]);

  v185 = [*(id *)(a1 + 40) paymentPass];
  -[NPKPassDescription setCobranded:](v171, "setCobranded:", [v185 isCobranded]);

  v186 = [v218 devicePaymentApplications];
  [(NPKPassDescription *)v171 setDevicePaymentApplications:v186];

  v187 = [v218 devicePrimaryPaymentApplication];
  [(NPKPassDescription *)v171 setDevicePrimaryPaymentApplication:v187];

  v188 = [v218 devicePrimaryContactlessPaymentApplication];
  [(NPKPassDescription *)v171 setDevicePrimaryContactlessPaymentApplication:v188];

  v189 = [v218 devicePrimaryInAppPaymentApplication];
  [(NPKPassDescription *)v171 setDevicePrimaryInAppPaymentApplication:v189];

  -[NPKPassDescription setEffectivePaymentApplicationState:](v171, "setEffectivePaymentApplicationState:", [v218 effectiveContactlessPaymentApplicationState]);
  [(NPKPassDescription *)v171 setHasUserSelectableContactlessPaymentApplications:v207];
  [(NPKPassDescription *)v171 setPreferredPaymentApplication:v227[5]];
  v190 = [*(id *)(a1 + 40) ingestedDate];
  [(NPKPassDescription *)v171 setIngestionDate:v190];

  v191 = [*(id *)(a1 + 40) npkCompleteHash];
  [(NPKPassDescription *)v171 setCompleteHash:v191];

  -[NPKPassDescription setHasStoredValue:](v171, "setHasStoredValue:", [*(id *)(a1 + 40) hasStoredValue]);
  -[NPKPassDescription setSettings:](v171, "setSettings:", [*(id *)(a1 + 40) settings]);
  v192 = [v218 issuerCountryCode];
  [(NPKPassDescription *)v171 setIssuerCountryCode:v192];

  v193 = [*(id *)(a1 + 40) paymentPass];
  v194 = [v193 availableActions];
  [(NPKPassDescription *)v171 setAvailableActions:v194];

  v195 = [*(id *)(a1 + 40) organizationName];
  [(NPKPassDescription *)v171 setOrganizationName:v195];

  [(NPKPassDescription *)v171 setTransitAppletState:*(void *)(a1 + 72)];
  [(NPKPassDescription *)v171 setLastAddValueAmount:*(void *)(a1 + 80)];
  v196 = [*(id *)(a1 + 40) localizedDescription];
  [(NPKPassDescription *)v171 setLocalizedDescription:v196];

  [(NPKPassDescription *)v171 setPendingAddValueDate:*(void *)(a1 + 88)];
  [(NPKPassDescription *)v171 setExpressPassTypesMask:*(void *)(a1 + 128)];
  -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v171, "setHasAssociatedPeerPaymentAccount:", [v218 hasAssociatedPeerPaymentAccount]);
  v197 = [v218 devicePrimaryPaymentApplication];
  v198 = [v197 subcredentials];
  [(NPKPassDescription *)v171 setSubcredentials:v198];

  uint64_t v199 = *(void *)(a1 + 32);
  v200 = *(void **)(v199 + 360);
  *(void *)(v199 + 360) = 0;

  _Block_object_dispose(&v226, 8);
  return 1;
}

void __59__NPKGizmoDatabase__savePassLocked_locallyAdded_wasUpdate___block_invoke_454(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  uint64_t v6 = [v8 applicationIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)_removePassWithUniqueIDLocked:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  BOOL v5 = self->_passDescriptions;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v35;
    while (2)
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "uniqueID", (void)v34);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v50 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if ([v6 deletePending])
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [(NPKGizmoDatabase *)self _passForUniqueIDLocked:v4 includeImageSets:0];
  }
  BOOL v13 = [(NPKGizmoDatabase *)self deleteStatement];
  id v14 = v4;
  sqlite3_bind_text(v13, 1, (const char *)[v14 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v13) & 0xFFFFFFFE) != 0x64)
  {
    id v15 = pk_General_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      id v17 = pk_General_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        BOOL v18 = sqlite3_sql(v13);
        id v19 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 136447234;
        id v41 = "-[NPKGizmoDatabase _removePassWithUniqueIDLocked:]";
        __int16 v42 = 2082;
        uint64_t v43 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v44 = 2048;
        uint64_t v45 = 2626;
        __int16 v46 = 2080;
        uint64_t v47 = v18;
        __int16 v48 = 2080;
        uint64_t v49 = v19;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v13);
  sqlite3_reset(v13);
  BOOL v20 = [(NPKGizmoDatabase *)self _transactionSourceIdentifierForPassUniqueIdentifierLocked:v14];
  if (v20)
  {
    id v21 = [(NPKGizmoDatabase *)self deleteTransactionsForTransactionSourceStatement];
    id v22 = v20;
    sqlite3_bind_text(v21, 1, (const char *)[v22 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((sqlite3_step(v21) & 0xFFFFFFFE) != 0x64)
    {
      id v23 = pk_General_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

      if (v24)
      {
        id v25 = pk_General_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v26 = sqlite3_sql(v21);
          id v27 = sqlite3_errmsg(self->_database);
          *(_DWORD *)buf = 136447234;
          id v41 = "-[NPKGizmoDatabase _removePassWithUniqueIDLocked:]";
          __int16 v42 = 2082;
          uint64_t v43 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          __int16 v44 = 2048;
          uint64_t v45 = 2640;
          __int16 v46 = 2080;
          uint64_t v47 = v26;
          __int16 v48 = 2080;
          uint64_t v49 = v27;
          _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
            buf,
            0x34u);
        }
      }
      _NPKAssertAbort();
    }
    sqlite3_clear_bindings(v21);
    sqlite3_reset(v21);
    [(NPKGizmoDatabase *)self setCurrentEphemeralTransactionIdentifier:0 forTransactionSourceIdentifier:v22];
    [(NPKGizmoDatabase *)self _removeTransactionSourceIdentifierForPassWithUniqueIDLocked:v14];
  }
  [(NSMutableDictionary *)self->_manifest removeObjectForKey:v14];
  libraryHashes = self->_libraryHashes;
  self->_libraryHashes = 0;

  [(NSMutableArray *)self->_passDescriptions removeObject:v6];
  if (v12)
  {
    id v29 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v30 = NPKGizmoDatabasePassRemovedNotificationName;
    uint64_t v38 = NPKGizmoDatabasePassKeyName;
    id v39 = v12;
    id v31 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [v29 postNotificationName:v30 object:self userInfo:v31];
  }
  char v32 = [v6 deletePending];

  return v32 ^ 1;
}

- (void)_saveTransactionLocked:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPKGizmoDatabase *)self insertTransactionStatement];
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  sqlite3_bind_text(v8, 1, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(v8, 2, "", -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v11 = [v6 identifier];
  sqlite3_bind_text(v8, 3, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  uint64_t v12 = [v6 transactionDate];
  [v12 timeIntervalSinceReferenceDate];
  sqlite3_bind_int(v8, 4, (int)v13);

  sqlite3_bind_int(v8, 5, [v6 transactionSource]);
  sqlite3_bind_int(v8, 6, [v6 transactionType]);
  sqlite3_bind_int(v8, 7, [v6 hasNotificationServiceData]);
  id v14 = NPKSecureArchiveObject(v6);
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
    sqlite3_bind_blob(v8, 8, (const void *)[v16 bytes], objc_msgSend(v16, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v8, 8);
  }
  id v17 = [v6 serviceIdentifier];
  sqlite3_bind_text(v8, 10, (const char *)[v17 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((sqlite3_step(v8) & 0xFFFFFFFE) != 0x64)
  {
    BOOL v18 = pk_General_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      BOOL v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = sqlite3_sql(v8);
        id v22 = sqlite3_errmsg(self->_database);
        int v23 = 136447234;
        BOOL v24 = "-[NPKGizmoDatabase _saveTransactionLocked:forTransactionSourceIdentifier:]";
        __int16 v25 = 2082;
        id v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v27 = 2048;
        uint64_t v28 = 2693;
        __int16 v29 = 2080;
        uint64_t v30 = v21;
        __int16 v31 = 2080;
        char v32 = v22;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Insert transaction failed: %s; %s)",
          (uint8_t *)&v23,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v8);
  sqlite3_reset(v8);
}

- (void)_removeTransactionWithServiceIdentifierLocked:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPKGizmoDatabase *)self removeTransactionWithServiceIdentifierStatement];
  id v9 = v6;
  id v10 = (const char *)[v9 UTF8String];

  sqlite3_bind_text(v8, 1, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v11 = v7;
  uint64_t v12 = (const char *)[v11 UTF8String];

  sqlite3_bind_text(v8, 2, v12, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v8) & 0xFFFFFFFE) != 0x64)
  {
    double v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      id v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = sqlite3_sql(v8);
        id v17 = sqlite3_errmsg(self->_database);
        int v18 = 136447234;
        BOOL v19 = "-[NPKGizmoDatabase _removeTransactionWithServiceIdentifierLocked:forTransactionSourceIdentifier:]";
        __int16 v20 = 2082;
        id v21 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v22 = 2048;
        uint64_t v23 = 2708;
        __int16 v24 = 2080;
        __int16 v25 = v16;
        __int16 v26 = 2080;
        __int16 v27 = v17;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete transaction failed: %s; %s)",
          (uint8_t *)&v18,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v8);
  sqlite3_reset(v8);
}

- (void)_removeTransactionWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(NPKGizmoDatabase *)self removeTransactionStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v5) & 0xFFFFFFFE) != 0x64)
  {
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = sqlite3_sql(v5);
        uint64_t v12 = sqlite3_errmsg(self->_database);
        int v13 = 136447234;
        BOOL v14 = "-[NPKGizmoDatabase _removeTransactionWithIdentifier:]";
        __int16 v15 = 2082;
        id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v17 = 2048;
        uint64_t v18 = 2723;
        __int16 v19 = 2080;
        __int16 v20 = v11;
        __int16 v21 = 2080;
        __int16 v22 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete transaction failed: %s; %s)",
          (uint8_t *)&v13,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
}

- (void)_removeTransactionsForTransactionSource:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(NPKGizmoDatabase *)self deleteTransactionsForTransactionSourceStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v5) & 0xFFFFFFFE) != 0x64)
  {
    id v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = sqlite3_sql(v5);
        uint64_t v12 = sqlite3_errmsg(self->_database);
        int v13 = 136447234;
        BOOL v14 = "-[NPKGizmoDatabase _removeTransactionsForTransactionSource:]";
        __int16 v15 = 2082;
        id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v17 = 2048;
        uint64_t v18 = 2737;
        __int16 v19 = 2080;
        __int16 v20 = v11;
        __int16 v21 = 2080;
        __int16 v22 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete failed: %s; %s)",
          (uint8_t *)&v13,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
}

- (void)_trimTransactionsForTransactionSourceIdentifierLocked:(id)a3 withPaymentCredentialType:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = PKMaxPaymentTransactionsForCredentialType();
  id v7 = [(NPKGizmoDatabase *)self trimTransactionsForTransactionSourceStatement];
  id v8 = v5;
  sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v9 = v8;
  id v10 = (const char *)[v9 UTF8String];

  sqlite3_bind_text(v7, 2, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v7, 3, v6);
  if ((sqlite3_step(v7) & 0xFFFFFFFE) != 0x64)
  {
    id v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      int v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        BOOL v14 = sqlite3_sql(v7);
        __int16 v15 = sqlite3_errmsg(self->_database);
        int v16 = 136447234;
        __int16 v17 = "-[NPKGizmoDatabase _trimTransactionsForTransactionSourceIdentifierLocked:withPaymentCredentialType:]";
        __int16 v18 = 2082;
        __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v20 = 2048;
        uint64_t v21 = 2755;
        __int16 v22 = 2080;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        __int16 v25 = v15;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Trim transactions failed: %s; %s)",
          (uint8_t *)&v16,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v7);
  sqlite3_reset(v7);
}

- (id)_transactionsForTransactionSourceIdentifierLocked:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderByDate:(int64_t)a8 limit:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  __int16 v18 = [MEMORY[0x263EFF980] array];
  __int16 v19 = [(NPKGizmoDatabase *)self selectTransactionsStatementWithTransactionSource:a4 orderByDate:a8 limit:a9];
  id v20 = v15;
  sqlite3_bind_text(v19, 1, (const char *)[v20 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int(v19, 2, a5 == 0);
  sqlite3_bind_int(v19, 3, a5 == 1);
  sqlite3_bind_int(v19, 4, a5 != 1);
  sqlite3_bind_int(v19, 5, 2);
  sqlite3_bind_int(v19, 6, a5 != 2);
  sqlite3_bind_int(v19, 7, 2);
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x263EFF910] distantPast];
    if (v17) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x263EFF910] distantFuture];
LABEL_3:
  [v16 timeIntervalSinceReferenceDate];
  sqlite3_bind_int(v19, 8, (int)v21);
  [v17 timeIntervalSinceReferenceDate];
  sqlite3_bind_int(v19, 9, (int)v22);
  if (a9) {
    sqlite3_bind_int(v19, 10, a9);
  }
  while (sqlite3_step(v19) == 100)
  {
    uint64_t v23 = sqlite3_column_blob(v19, 0);
    int v24 = sqlite3_column_bytes(v19, 0);
    __int16 v25 = (void *)MEMORY[0x223C37110]();
    uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytes:v23 length:v24];
    __int16 v27 = objc_opt_class();
    uint64_t v28 = NPKSecureUnarchiveObject(v26, v27);
    if (v28) {
      [v18 addObject:v28];
    }
  }
  sqlite3_clear_bindings(v19);
  sqlite3_reset(v19);

  return v18;
}

- (id)_transactionWithIdentifierLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectTransactionWithIdentifierStatement];
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    id v7 = sqlite3_column_blob(v5, 0);
    int v8 = sqlite3_column_bytes(v5, 0);
    id v9 = (void *)MEMORY[0x223C37110]();
    id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v8];
    id v11 = objc_opt_class();
    BOOL v12 = NPKSecureUnarchiveObject(v10, v11);
  }
  else
  {
    BOOL v12 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v12;
}

- (id)_transactionWithServiceIdentifierLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectTransactionWithServiceIdentifierStatement];
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    id v7 = sqlite3_column_blob(v5, 0);
    int v8 = sqlite3_column_bytes(v5, 0);
    id v9 = (void *)MEMORY[0x223C37110]();
    id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v8];
    id v11 = objc_opt_class();
    BOOL v12 = NPKSecureUnarchiveObject(v10, v11);
  }
  else
  {
    BOOL v12 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v12;
}

- (id)_transactionSourceIdentifierForTransactionWithIdentifierLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectTransactionSourceIdentifierForTransactionWithIdentifierStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v5, 0));
  }
  else
  {
    int v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (void)_createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self _transactionSourceIdentifierForPassUniqueIdentifierLocked:v4];

  if (!v5)
  {
    id v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = [v6 UUIDString];

    int v8 = [(NPKGizmoDatabase *)self insertTransactionSourceIdentifierForPassStatement];
    id v9 = v7;
    sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int(v8, 2, 0);
    sqlite3_bind_text(v8, 3, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if ((sqlite3_step(v8) & 0xFFFFFFFE) != 0x64)
    {
      id v10 = pk_General_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        BOOL v12 = pk_General_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = sqlite3_sql(v8);
          BOOL v14 = sqlite3_errmsg(self->_database);
          int v15 = 136447234;
          id v16 = "-[NPKGizmoDatabase _createTransactionSourceIdentifierIfNecessaryForPassWithUniqueIDLocked:]";
          __int16 v17 = 2082;
          __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          __int16 v19 = 2048;
          uint64_t v20 = 2869;
          __int16 v21 = 2080;
          double v22 = v13;
          __int16 v23 = 2080;
          int v24 = v14;
          _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Insert transaction source identifier failed: %s; %s)",
            (uint8_t *)&v15,
            0x34u);
        }
      }
      _NPKAssertAbort();
    }
    sqlite3_clear_bindings(v8);
    sqlite3_reset(v8);
  }
}

- (void)_removeTransactionSourceIdentifierForPassWithUniqueIDLocked:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self deleteTransactionSourceIdentifierForPassStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v5) & 0xFFFFFFFE) != 0x64)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = sqlite3_sql(v5);
        BOOL v12 = sqlite3_errmsg(self->_database);
        int v13 = 136447234;
        BOOL v14 = "-[NPKGizmoDatabase _removeTransactionSourceIdentifierForPassWithUniqueIDLocked:]";
        __int16 v15 = 2082;
        id v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v17 = 2048;
        uint64_t v18 = 2884;
        __int16 v19 = 2080;
        uint64_t v20 = v11;
        __int16 v21 = 2080;
        double v22 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete transaction source identifier failed: %s; %s)",
          (uint8_t *)&v13,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
}

- (id)_transactionSourceIdentifierForTransactionWithServiceIdentifierLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v5, 0));
  }
  else
  {
    int v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (id)_transactionSourceIdentifierForPassUniqueIdentifierLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectTransactionSourceIdentifierForPassUniqueIdentifierStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v5, 0));
  }
  else
  {
    int v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (id)_passUniqueIdentifierForTransactionSourceIdentifierLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectPassUniqueIdentifierForTransactionSourceIdentifierStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v5, 0));
  }
  else
  {
    int v8 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (id)_transitAppletStateForPassWithUniqueIDLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectTransitAppletStateForPassStatement];
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    id v7 = sqlite3_column_blob(v5, 0);
    int v8 = sqlite3_column_bytes(v5, 0);
    BOOL v9 = (void *)MEMORY[0x223C37110]();
    id v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v8];
    if ([v10 length])
    {
      BOOL v11 = objc_opt_class();
      BOOL v12 = NPKSecureUnarchiveObject(v10, v11);
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v12;
}

- (void)_setTransitAppletStateLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v18 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]";
        __int16 v19 = 2082;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v21 = 2048;
        uint64_t v22 = 2956;
        __int16 v23 = 2080;
        int v24 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(dbQueue, block);
}

void __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [a1[4] _loadInitialManifestLocked];
  if (![a1[4] database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v18 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]_block_invoke";
        __int16 v19 = 2082;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v21 = 2048;
        uint64_t v22 = 2959;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v5 = (sqlite3_stmt *)[a1[4] updateTransitAppletStateForPassStatement];
  id v6 = a1[5];
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v5, 1, (const void *)[v7 bytes], objc_msgSend(v7, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v5, 1);
  }
  sqlite3_bind_text(v5, 2, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) != 101)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = sqlite3_sql(v5);
        id v12 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        uint64_t v18 = "-[NPKGizmoDatabase _setTransitAppletStateLocked:forPassWithUniqueID:]_block_invoke";
        __int16 v19 = 2082;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v21 = 2048;
        uint64_t v22 = 2974;
        __int16 v23 = 2080;
        int v24 = v11;
        __int16 v25 = 2080;
        uint64_t v26 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Updating transit applet state failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  id v13 = (void *)*((void *)a1[4] + 44);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke_457;
  v14[3] = &unk_2644D5CE8;
  id v15 = a1[6];
  id v16 = a1[5];
  [v13 enumerateObjectsUsingBlock:v14];
}

void __69__NPKGizmoDatabase__setTransitAppletStateLocked_forPassWithUniqueID___block_invoke_457(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 uniqueID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    BOOL v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      BOOL v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new transit applet state %@", (uint8_t *)&v13, 0x16u);
      }
    }
    [v6 setTransitAppletState:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (void)_setCurrentEphemeralTransactionIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136446978;
        int v24 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        __int16 v25 = 2082;
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v27 = 2048;
        uint64_t v28 = 2990;
        __int16 v29 = 2080;
        uint64_t v30 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil transaction source identifier)", (uint8_t *)&v23, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  if (![(NPKGizmoDatabase *)self database])
  {
    BOOL v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      int v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v23 = 136446722;
        int v24 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        __int16 v25 = 2082;
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v27 = 2048;
        uint64_t v28 = 2991;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v23,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  if (v6)
  {
    id v14 = [(NPKGizmoDatabase *)self insertEphemeralTransactionStatement];
    sqlite3_bind_text(v14, 1, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    __int16 v15 = (const char *)[v6 UTF8String];
    uint64_t v16 = v14;
    int v17 = 2;
  }
  else
  {
    id v14 = [(NPKGizmoDatabase *)self deleteEphemeralTransactionByTransactionSourceIdentifierStatement];
    __int16 v15 = (const char *)[v7 UTF8String];
    uint64_t v16 = v14;
    int v17 = 1;
  }
  sqlite3_bind_text(v16, v17, v15, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if ((sqlite3_step(v14) & 0xFFFFFFFE) != 0x64)
  {
    uint64_t v18 = pk_General_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      uint64_t v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = sqlite3_sql(v14);
        uint64_t v22 = sqlite3_errmsg(self->_database);
        int v23 = 136447234;
        int v24 = "-[NPKGizmoDatabase _setCurrentEphemeralTransactionIdentifier:forTransactionSourceIdentifier:]";
        __int16 v25 = 2082;
        uint64_t v26 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v27 = 2048;
        uint64_t v28 = 3010;
        __int16 v29 = 2080;
        uint64_t v30 = v21;
        __int16 v31 = 2080;
        char v32 = v22;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Delete ephemeral transaction failed: %s; %s)",
          (uint8_t *)&v23,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v14);
  sqlite3_reset(v14);
}

- (id)_currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136446978;
        uint64_t v16 = "-[NPKGizmoDatabase _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:]";
        __int16 v17 = 2082;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v19 = 2048;
        uint64_t v20 = 3017;
        __int16 v21 = 2080;
        uint64_t v22 = "-[NPKGizmoDatabase _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:]";
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil transaction source identifier)", (uint8_t *)&v15, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  if (![(NPKGizmoDatabase *)self database])
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136446722;
        uint64_t v16 = "-[NPKGizmoDatabase _currentEphemeralTransactionIdentifierForTransactionSourceIdentifier:]";
        __int16 v17 = 2082;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v19 = 2048;
        uint64_t v20 = 3018;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v15,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  BOOL v11 = [(NPKGizmoDatabase *)self currentEphemeralTransactionIdentifierStatement];
  id v12 = v4;
  sqlite3_bind_text(v11, 1, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v11) == 100)
  {
    int v13 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v11, 0));
  }
  else
  {
    int v13 = 0;
  }
  sqlite3_clear_bindings(v11);
  sqlite3_reset(v11);

  return v13;
}

- (id)_lastAddValueAmountForPassWithUniqueIDLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectLastAddValueAmountForPassStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100 && (int v8 = sqlite3_column_text(v5, 0)) != 0 && *v8)
  {
    BOOL v9 = [NSString stringWithUTF8String:v8];
    BOOL v10 = [MEMORY[0x263F087B0] decimalNumberWithString:v9];
  }
  else
  {
    BOOL v10 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v10;
}

- (void)_setLastAddValueAmountLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v18 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]";
        __int16 v19 = 2082;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v21 = 2048;
        uint64_t v22 = 3051;
        __int16 v23 = 2080;
        int v24 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(dbQueue, block);
}

void __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [a1[4] _loadInitialManifestLocked];
  if (![a1[4] database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        __int16 v21 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]_block_invoke";
        __int16 v22 = 2082;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v24 = 2048;
        uint64_t v25 = 3054;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v5 = (sqlite3_stmt *)[a1[4] updateLastAddValueAmountForPassStatement];
  id v6 = a1[5];
  if (v6)
  {
    id v7 = [v6 stringValue];
    sqlite3_bind_text(v5, 1, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v5, 1);
  }
  sqlite3_bind_text(v5, 2, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) != 101)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = sqlite3_sql(v5);
        id v12 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        __int16 v21 = "-[NPKGizmoDatabase _setLastAddValueAmountLocked:forPassWithUniqueID:]_block_invoke";
        __int16 v22 = 2082;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v24 = 2048;
        uint64_t v25 = 3068;
        __int16 v26 = 2080;
        __int16 v27 = v11;
        __int16 v28 = 2080;
        __int16 v29 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Setting last add value amount failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  id v13 = (void *)*((void *)a1[4] + 44);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke_458;
  __int16 v17 = &unk_2644D5CE8;
  id v18 = a1[6];
  id v19 = a1[5];
  [v13 enumerateObjectsUsingBlock:&v14];
  objc_msgSend(a1[4], "_notifyDatabaseChangedExternally", v14, v15, v16, v17);
  [a1[4] _notifyDatabaseChangedWithNoop:0];
}

void __69__NPKGizmoDatabase__setLastAddValueAmountLocked_forPassWithUniqueID___block_invoke_458(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 uniqueID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    BOOL v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      BOOL v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new last add value amount %@", (uint8_t *)&v13, 0x16u);
      }
    }
    [v6 setLastAddValueAmount:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (id)_pendingAddValueDateForPassWithUniqueIDLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectPendingAddValueDateForPassStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100 && (int v8 = sqlite3_column_int(v5, 0)) != 0)
  {
    BOOL v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)v8];
  }
  else
  {
    BOOL v9 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v9;
}

- (void)_setPendingAddValueDateLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        id v18 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]";
        __int16 v19 = 2082;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v21 = 2048;
        uint64_t v22 = 3103;
        __int16 v23 = 2080;
        __int16 v24 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke;
  block[3] = &unk_2644D31B0;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(dbQueue, block);
}

void __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [a1[4] _loadInitialManifestLocked];
  if (![a1[4] database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        __int16 v21 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]_block_invoke";
        __int16 v22 = 2082;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v24 = 2048;
        uint64_t v25 = 3106;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v5 = (sqlite3_stmt *)[a1[4] updatePendingAddValueDateForPassStatement];
  id v6 = a1[5];
  if (v6)
  {
    [v6 timeIntervalSinceReferenceDate];
    sqlite3_bind_int(v5, 1, (int)v7);
  }
  else
  {
    sqlite3_bind_null(v5, 1);
  }
  sqlite3_bind_text(v5, 2, (const char *)[a1[6] UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) != 101)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = sqlite3_sql(v5);
        id v12 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        __int16 v21 = "-[NPKGizmoDatabase _setPendingAddValueDateLocked:forPassWithUniqueID:]_block_invoke";
        __int16 v22 = 2082;
        __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v24 = 2048;
        uint64_t v25 = 3120;
        __int16 v26 = 2080;
        __int16 v27 = v11;
        __int16 v28 = 2080;
        __int16 v29 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Setting pending add value date failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  id v13 = (void *)*((void *)a1[4] + 44);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke_459;
  uint64_t v17 = &unk_2644D5CE8;
  id v18 = a1[6];
  id v19 = a1[5];
  [v13 enumerateObjectsUsingBlock:&v14];
  objc_msgSend(a1[4], "_notifyDatabaseChangedExternally", v14, v15, v16, v17);
  [a1[4] _notifyDatabaseChangedWithNoop:0];
}

void __70__NPKGizmoDatabase__setPendingAddValueDateLocked_forPassWithUniqueID___block_invoke_459(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  double v7 = [v6 uniqueID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    BOOL v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      BOOL v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new pending add value date %@", (uint8_t *)&v13, 0x16u);
      }
    }
    [v6 setPendingAddValueDate:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (id)_paymentBalancesForPassWithUniqueIDLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectBalancesForPassStatement];
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    double v7 = sqlite3_column_blob(v5, 0);
    int v8 = sqlite3_column_bytes(v5, 0);
    BOOL v9 = (void *)MEMORY[0x223C37110]();
    BOOL v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v8];
    BOOL v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    int v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    id v14 = NPKSecureUnarchiveObjectOfClasses(v10, v13);
  }
  else
  {
    __int16 v15 = pk_General_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      uint64_t v17 = pk_General_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: selectBalancesForPassStatement does not equal row", buf, 2u);
      }
    }
    id v14 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v14;
}

- (void)_setPaymentBalancesLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136446978;
        __int16 v31 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        __int16 v32 = 2082;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v34 = 2048;
        uint64_t v35 = 3159;
        __int16 v36 = 2080;
        long long v37 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", (uint8_t *)&v30, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  [(NPKGizmoDatabase *)self _loadInitialManifestLocked];
  if (![(NPKGizmoDatabase *)self database])
  {
    BOOL v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      int v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v30 = 136446722;
        __int16 v31 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        __int16 v32 = 2082;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v34 = 2048;
        uint64_t v35 = 3161;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v30,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v14 = [(NPKGizmoDatabase *)self updateBalancesForPassStatement];
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    id v15 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v14, 1, (const void *)[v15 bytes], objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    BOOL v16 = pk_General_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      id v18 = pk_General_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: Passed empty balances, storing null", (uint8_t *)&v30, 2u);
      }
    }
    sqlite3_bind_null(v14, 1);
  }
  id v19 = v7;
  sqlite3_bind_text(v14, 2, (const char *)[v19 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  int v20 = sqlite3_step(v14);
  __int16 v21 = pk_General_log();
  __int16 v22 = v21;
  if (v20 != 101)
  {
    BOOL v26 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v26)
    {
      __int16 v27 = pk_General_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = sqlite3_sql(v14);
        __int16 v29 = sqlite3_errmsg(self->_database);
        int v30 = 136447234;
        __int16 v31 = "-[NPKGizmoDatabase _setPaymentBalancesLocked:forPassWithUniqueID:]";
        __int16 v32 = 2082;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v34 = 2048;
        uint64_t v35 = 3178;
        __int16 v36 = 2080;
        long long v37 = v28;
        __int16 v38 = 2080;
        id v39 = v29;
        _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Updating balances failed: %s; %s)",
          (uint8_t *)&v30,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    __int16 v24 = pk_General_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [(NPKGizmoDatabase *)self database];
      int v30 = 134218498;
      __int16 v31 = (const char *)v25;
      __int16 v32 = 2112;
      uint64_t v33 = (const char *)v6;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v19;
      _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Successfully wrote balances in database: %p, balance: %@, uniqueID: %@", (uint8_t *)&v30, 0x20u);
    }
  }
  sqlite3_clear_bindings(v14);
  sqlite3_reset(v14);
}

- (id)_subcredentialsForPassWithUniqueIDLocked:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKGizmoDatabase *)self selectSubcredentialsForPassStatement];
  id v6 = v4;
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    id v7 = sqlite3_column_blob(v5, 0);
    int v8 = sqlite3_column_bytes(v5, 0);
    BOOL v9 = (void *)MEMORY[0x223C37110]();
    BOOL v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v8];
    if ([v10 length])
    {
      BOOL v11 = (void *)MEMORY[0x263EFFA08];
      uint64_t v12 = objc_opt_class();
      int v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      id v14 = NPKSecureUnarchiveObjectOfClasses(v10, v13);
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);

  return v14;
}

- (void)_setSubcredentialsLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = pk_General_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v33 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        __int16 v34 = 2082;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v36 = 2048;
        uint64_t v37 = 3206;
        __int16 v38 = 2080;
        id v39 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil unique ID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  [(NPKGizmoDatabase *)self _loadInitialManifestLocked];
  if (![(NPKGizmoDatabase *)self database])
  {
    BOOL v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      int v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v33 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        __int16 v34 = 2082;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v36 = 2048;
        uint64_t v37 = 3208;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v14 = [(NPKGizmoDatabase *)self updateSubcredentialsForPassStatement];
  id v15 = v14;
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    id v16 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v15, 1, (const void *)[v16 bytes], objc_msgSend(v16, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v14, 1);
  }
  id v17 = v7;
  sqlite3_bind_text(v15, 2, (const char *)[v17 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v15) != 101)
  {
    id v18 = pk_General_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      int v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = sqlite3_sql(v15);
        __int16 v22 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 136447234;
        uint64_t v33 = "-[NPKGizmoDatabase _setSubcredentialsLocked:forPassWithUniqueID:]";
        __int16 v34 = 2082;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v36 = 2048;
        uint64_t v37 = 3223;
        __int16 v38 = 2080;
        id v39 = v21;
        __int16 v40 = 2080;
        id v41 = v22;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Updating subcredentials failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v15);
  sqlite3_reset(v15);
  passDescriptions = self->_passDescriptions;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  __int16 v28 = __65__NPKGizmoDatabase__setSubcredentialsLocked_forPassWithUniqueID___block_invoke;
  __int16 v29 = &unk_2644D5CE8;
  id v30 = v17;
  id v31 = v6;
  id v24 = v6;
  id v25 = v17;
  [(NSMutableArray *)passDescriptions enumerateObjectsUsingBlock:&v26];
  [(NPKGizmoDatabase *)self _notifyDatabaseChangedExternally];
  [(NPKGizmoDatabase *)self _notifyDatabaseChangedWithNoop:0];
}

void __65__NPKGizmoDatabase__setSubcredentialsLocked_forPassWithUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 uniqueID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    BOOL v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      BOOL v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new subcredentials %@", (uint8_t *)&v13, 0x16u);
      }
    }
    [v6 setSubcredentials:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (void)_enumerateAllPassesForMigration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__NPKGizmoDatabase__enumerateAllPassesForMigration___block_invoke;
  v6[3] = &unk_2644D5D10;
  id v7 = v4;
  id v5 = v4;
  [(NPKGizmoDatabase *)self _executeSQLQuery:@"SELECT encoded_pass, encoded_image_sets, preferred_aid FROM pass" processResultsBlock:v6];
}

uint64_t __52__NPKGizmoDatabase__enumerateAllPassesForMigration___block_invoke(uint64_t result, int a2, sqlite3_stmt *a3)
{
  uint64_t v26 = result;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a2)
    {
      uint64_t result = sqlite3_step(a3);
      if (result == 100)
      {
        *(void *)&long long v4 = 136315394;
        long long v25 = v4;
        do
        {
          id v5 = sqlite3_column_blob(a3, 0);
          int v6 = sqlite3_column_bytes(a3, 0);
          id v7 = sqlite3_column_blob(a3, 1);
          int v8 = sqlite3_column_bytes(a3, 1);
          BOOL v9 = sqlite3_column_text(a3, 2);
          BOOL v10 = (void *)MEMORY[0x223C37110]();
          if (v9)
          {
            BOOL v11 = [NSString stringWithCString:v9 encoding:4];
          }
          else
          {
            BOOL v11 = 0;
          }
          uint64_t v12 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v5, v6, v25);
          int v13 = objc_opt_class();
          id v14 = NPKSecureUnarchiveObject(v12, v13);
          if (v14)
          {
            __int16 v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:v8];
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = NPKSecureUnarchiveObject(v15, v16);
            if (v17) {
              [v14 setMissingImageSetsFromObject:v17];
            }
            if (os_variant_has_internal_ui())
            {
              id v18 = [v14 passTypeIdentifier];
              uint64_t v19 = [v18 length];

              if (!v19)
              {
                int v20 = pk_General_log();
                BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

                if (v21)
                {
                  __int16 v22 = pk_General_log();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    BOOL v23 = [v14 uniqueID];
                    *(_DWORD *)buf = v25;
                    __int16 v28 = "-[NPKGizmoDatabase _enumerateAllPassesForMigration:]_block_invoke";
                    __int16 v29 = 2112;
                    id v30 = v23;
                    _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass Unarchived pass with unique identifier %@ is missing the type identifier", buf, 0x16u);
                  }
                }
              }
            }
            uint64_t v24 = *(void *)(v26 + 32);
            if (v24) {
              (*(void (**)(uint64_t, void *, void *))(v24 + 16))(v24, v14, v11);
            }
          }
          uint64_t result = sqlite3_step(a3);
        }
        while (result == 100);
      }
    }
  }
  return result;
}

- (BOOL)_updateNFCPayloadDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET nfc_payload=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    BOOL v5 = 0;
    *((unsigned char *)v10 + 24) = 0;
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__NPKGizmoDatabase__updateNFCPayloadDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __53__NPKGizmoDatabase__updateNFCPayloadDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  int v6 = [v13 objectForKeyedSubscript:@"nfcPayload"];
  id v7 = v6;
  if (v6)
  {
    int v8 = NPKSecureArchiveObject(v6);
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    id v10 = v8;
    sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v11 = [v13 objectForKeyedSubscript:@"uniqueID"];
  char v12 = v11;
  if (!v11
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updatePrivateLabelAndCobrandDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"UPDATE pass SET private_label=?, cobranded=? WHERE unique_id=?", "UTF8String"), -1, &ppStmt, 0))
  {
    BOOL v5 = 0;
    *((unsigned char *)v10 + 24) = 0;
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__NPKGizmoDatabase__updatePrivateLabelAndCobrandDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __65__NPKGizmoDatabase__updatePrivateLabelAndCobrandDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"privateLabel"];
  int v8 = [v7 BOOLValue];

  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8);
  uint64_t v9 = [v6 objectForKeyedSubscript:@"cobranded"];
  int v10 = [v9 BOOLValue];

  sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 2, v10);
  id v11 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v11
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateDeviceAndPreferredPaymentApplicationsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"UPDATE pass SET device_primary_payment_application=?, preferred_payment_application=? WHERE unique_id=?", "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __80__NPKGizmoDatabase__updateDeviceAndPreferredPaymentApplicationsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __80__NPKGizmoDatabase__updateDeviceAndPreferredPaymentApplicationsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v6 = [v18 objectForKeyedSubscript:@"devicePrimaryPaymentApplication"];

  if (v6
    && ([v18 objectForKeyedSubscript:@"devicePrimaryPaymentApplication"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v7),
        int v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    id v10 = v8;
    sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  uint64_t v11 = [v18 objectForKeyedSubscript:@"preferredPaymentApplication"];

  if (v11
    && ([v18 objectForKeyedSubscript:@"preferredPaymentApplication"],
        char v12 = objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v12),
        id v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    id v14 = *(sqlite3_stmt **)(a1 + 40);
    id v15 = v13;
    sqlite3_bind_blob(v14, 2, (const void *)[v15 bytes], objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
  }
  uint64_t v16 = [v18 objectForKeyedSubscript:@"uniqueID"];
  uint64_t v17 = v16;
  if (!v16
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"UPDATE pass SET device_primary_contactless_payment_application=?, device_primary_in_app_payment_application=? WHERE unique_id=?", "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __88__NPKGizmoDatabase__updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __88__NPKGizmoDatabase__updatePrimaryContactlessAndInAppPaymentApplicationsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  id v6 = [v18 objectForKeyedSubscript:@"devicePrimaryContactlessPaymentApplication"];

  if (v6
    && ([v18 objectForKeyedSubscript:@"devicePrimaryContactlessPaymentApplication"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v7),
        int v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    id v10 = v8;
    sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  uint64_t v11 = [v18 objectForKeyedSubscript:@"devicePrimaryInAppPaymentApplication"];

  if (v11
    && ([v18 objectForKeyedSubscript:@"devicePrimaryInAppPaymentApplication"],
        char v12 = objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v12),
        id v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    id v14 = *(sqlite3_stmt **)(a1 + 40);
    id v15 = v13;
    sqlite3_bind_blob(v14, 2, (const void *)[v15 bytes], objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
  }
  uint64_t v16 = [v18 objectForKeyedSubscript:@"uniqueID"];
  uint64_t v17 = v16;
  if (!v16
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateEncodedImageSetsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"UPDATE pass SET encoded_pass=?, encoded_image_sets=? WHERE unique_id=?", "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__NPKGizmoDatabase__updateEncodedImageSetsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D60;
    v7[4] = self;
    v7[5] = &v9;
    void v7[6] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __59__NPKGizmoDatabase__updateEncodedImageSetsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v13 = [v6 objectForKeyedSubscript:@"encodedPassWithoutImageSets"];
  id v7 = [v6 objectForKeyedSubscript:@"encodedImageSets"];
  int v8 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v8) {
    goto LABEL_5;
  }
  if (!v13) {
    goto LABEL_5;
  }
  if (!v7) {
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) _verifyPassDataIsUnarchivedCorrectlyWithData:v13 forPassWithUniqueID:v8];
  uint64_t v9 = *(sqlite3_stmt **)(a1 + 48);
  id v10 = v13;
  sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  uint64_t v11 = *(sqlite3_stmt **)(a1 + 48);
  id v12 = v7;
  sqlite3_bind_blob(v11, 2, (const void *)[v12 bytes], objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 3, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 48)) != 101)
  {
LABEL_5:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));
}

- (BOOL)_repairEncodedImagesDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET logo_image=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0);
  uint64_t v9 = 0;
  if (!(v5 | sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET background_image=? WHERE unique_id=?" UTF8String], -1, &v9, 0)))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__NPKGizmoDatabase__repairEncodedImagesDuringMigration___block_invoke;
    v8[3] = &unk_2644D5D88;
    v8[4] = &v11;
    v8[5] = ppStmt;
    v8[6] = v9;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  char v6 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __56__NPKGizmoDatabase__repairEncodedImagesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v13 = [v6 objectForKeyedSubscript:@"encodedLogoImageData"];
  id v7 = [v6 objectForKeyedSubscript:@"encodedBackgroundImageData"];
  int v8 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (v8)
  {
    if (v13)
    {
      uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
      id v10 = v13;
      sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        *a4 = 1;
      }
      sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
    }
    if (v7)
    {
      uint64_t v11 = *(sqlite3_stmt **)(a1 + 48);
      id v12 = v7;
      sqlite3_bind_blob(v11, 1, (const void *)[v12 bytes], objc_msgSend(v12, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 2, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 48)) != 101)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        *a4 = 1;
      }
      sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)_updateIssuerCountryCodesDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET issuer_country_code=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__NPKGizmoDatabase__updateIssuerCountryCodesDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __61__NPKGizmoDatabase__updateIssuerCountryCodesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v9 = [v6 objectForKeyedSubscript:@"issuerCountryCode"];
  id v7 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v7) {
    goto LABEL_6;
  }
  int v8 = *(sqlite3_stmt **)(a1 + 40);
  if (v9) {
    sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(v8, 1);
  }
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateExpressPassTypesMaskDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET express_pass_types_mask=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__NPKGizmoDatabase__updateExpressPassTypesMaskDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __63__NPKGizmoDatabase__updateExpressPassTypesMaskDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 objectForKeyedSubscript:@"expressPassTypesMask"];
  id v7 = v6;
  if (v6) {
    sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 40), 1, [v6 integerValue]);
  }
  int v8 = [v10 objectForKeyedSubscript:@"uniqueID"];
  uint64_t v9 = v8;
  if (!v8
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateDevicePaymentApplicationsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET device_payment_applications=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__NPKGizmoDatabase__updateDevicePaymentApplicationsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __68__NPKGizmoDatabase__updateDevicePaymentApplicationsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 objectForKeyedSubscript:@"devicePaymentApplications"];

  if (v6
    && ([v13 objectForKeyedSubscript:@"devicePaymentApplications"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        NPKSecureArchiveObject(v7),
        int v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    id v10 = v8;
    sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  uint64_t v11 = [v13 objectForKeyedSubscript:@"uniqueID"];
  char v12 = v11;
  if (!v11
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateIngestedDatesDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET ingested_date=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__NPKGizmoDatabase__updateIngestedDatesDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __56__NPKGizmoDatabase__updateIngestedDatesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"ingestedDate"];
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF910] date];
  }
  int v8 = *(sqlite3_stmt **)(a1 + 40);
  id v11 = v7;
  [v7 timeIntervalSinceReferenceDate];
  sqlite3_bind_int(v8, 1, (int)v9);
  id v10 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v10
    || (sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateCompleteLocalHashesDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"UPDATE pass SET complete_hash=?, complete_hashes=? WHERE unique_id=?", "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__NPKGizmoDatabase__updateCompleteLocalHashesDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __62__NPKGizmoDatabase__updateCompleteLocalHashesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v14 = [v6 objectForKeyedSubscript:@"completeHash"];
  id v7 = [v6 objectForKeyedSubscript:@"completeLocalHashes"];
  int v8 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (v8)
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    if (v14)
    {
      id v10 = v14;
      sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      if (!v7) {
        goto LABEL_8;
      }
    }
    else
    {
      sqlite3_bind_null(v9, 1);
      if (!v7) {
        goto LABEL_8;
      }
    }
    uint64_t v11 = NPKSecureArchiveObject(v7);
    if (v11)
    {
      char v12 = *(sqlite3_stmt **)(a1 + 40);
      id v13 = v11;
      sqlite3_bind_blob(v12, 2, (const void *)[v13 bytes], objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      goto LABEL_9;
    }
LABEL_8:
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
LABEL_9:
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) == 101) {
      goto LABEL_11;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  *a4 = 1;
LABEL_11:
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateFrontAndBackFieldBucketsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"UPDATE pass SET front_field_buckets=?, back_field_buckets=? WHERE unique_id=?", "UTF8String"), -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__NPKGizmoDatabase__updateFrontAndBackFieldBucketsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __67__NPKGizmoDatabase__updateFrontAndBackFieldBucketsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v15 = [v6 objectForKeyedSubscript:@"frontFieldBuckets"];
  id v7 = [v6 objectForKeyedSubscript:@"backFieldBuckets"];
  int v8 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (v8)
  {
    if (v15 && (NPKSecureArchiveObject(v15), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = *(sqlite3_stmt **)(a1 + 40);
      id v11 = v9;
      sqlite3_bind_blob(v10, 1, (const void *)[v11 bytes], objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
      if (!v7) {
        goto LABEL_9;
      }
    }
    char v12 = NPKSecureArchiveObject(v7);
    if (v12)
    {
      id v13 = *(sqlite3_stmt **)(a1 + 40);
      id v14 = v12;
      sqlite3_bind_blob(v13, 2, (const void *)[v14 bytes], objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      goto LABEL_10;
    }
LABEL_9:
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 2);
LABEL_10:
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 3, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) == 101) {
      goto LABEL_12;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  *a4 = 1;
LABEL_12:
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateAvailableActionsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET available_actions=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __59__NPKGizmoDatabase__updateAvailableActionsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __59__NPKGizmoDatabase__updateAvailableActionsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v11 = [v6 objectForKeyedSubscript:@"availableActions"];
  id v7 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v7) {
    goto LABEL_7;
  }
  if (v11 && (NPKSecureArchiveObject(v11), (int v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    id v10 = v8;
    sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(*(sqlite3_stmt **)(a1 + 40), 1);
  }
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateOrganizationNamesDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET organization_name=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__NPKGizmoDatabase__updateOrganizationNamesDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __60__NPKGizmoDatabase__updateOrganizationNamesDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v9 = [v6 objectForKeyedSubscript:@"organizationName"];
  id v7 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v7) {
    goto LABEL_6;
  }
  int v8 = *(sqlite3_stmt **)(a1 + 40);
  if (v9) {
    sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(v8, 1);
  }
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateLocalizedDescriptionDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET localized_description=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__NPKGizmoDatabase__updateLocalizedDescriptionDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __63__NPKGizmoDatabase__updateLocalizedDescriptionDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v9 = [v6 objectForKeyedSubscript:@"localizedDescription"];
  id v7 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v7) {
    goto LABEL_6;
  }
  int v8 = *(sqlite3_stmt **)(a1 + 40);
  if (v9) {
    sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    sqlite3_bind_null(v8, 1);
  }
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101)
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateEffectivePaymentApplicationStateDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET effective_payment_application_state=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__NPKGizmoDatabase__updateEffectivePaymentApplicationStateDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __75__NPKGizmoDatabase__updateEffectivePaymentApplicationStateDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 objectForKeyedSubscript:@"effectivePaymentApplicationState"];
  id v7 = v6;
  if (v6) {
    int v8 = [v6 intValue];
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = [v10 objectForKeyedSubscript:@"uniqueID"];
  if (!v9
    || (sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateHasUserSelectableContactlessPaymentApplications:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET has_user_selectable_payment_applications=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__NPKGizmoDatabase__updateHasUserSelectableContactlessPaymentApplications___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __75__NPKGizmoDatabase__updateHasUserSelectableContactlessPaymentApplications___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 objectForKeyedSubscript:@"hasUserSelectableContactlessPaymentApplications"];
  id v7 = v6;
  if (v6) {
    int v8 = [v6 intValue];
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = [v10 objectForKeyedSubscript:@"uniqueID"];
  if (!v9
    || (sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateEncodedPaymentPassDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET encoded_pass=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __61__NPKGizmoDatabase__updateEncodedPaymentPassDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D60;
    v7[4] = self;
    v7[5] = &v9;
    void v7[6] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __61__NPKGizmoDatabase__updateEncodedPaymentPassDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v10 = [v6 objectForKeyedSubscript:@"encodedPass"];
  id v7 = [v6 objectForKeyedSubscript:@"uniqueID"];

  if (!v7
    || v10
    && ([*(id *)(a1 + 32) _verifyPassDataIsUnarchivedCorrectlyWithData:v10 forPassWithUniqueID:v7],
        int v8 = *(sqlite3_stmt **)(a1 + 48),
        id v9 = v10,
        sqlite3_bind_blob(v8, 1, (const void *)[v9 bytes], objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 2, (const char *)objc_msgSend(v7, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 48)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));
}

- (BOOL)_updateHasStoredValueDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET has_stored_value=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__NPKGizmoDatabase__updateHasStoredValueDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __57__NPKGizmoDatabase__updateHasStoredValueDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 objectForKeyedSubscript:@"hasStoredValue"];
  id v7 = v6;
  if (v6) {
    int v8 = [v6 intValue];
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = [v10 objectForKeyedSubscript:@"uniqueID"];
  if (!v9
    || (sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateSettingsDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  ppStmt = 0;
  if (!sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET settings=? WHERE unique_id=?" UTF8String], -1, &ppStmt, 0))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__NPKGizmoDatabase__updateSettingsDuringMigration___block_invoke;
    v7[3] = &unk_2644D5D38;
    v7[4] = &v9;
    v7[5] = ppStmt;
    [v4 enumerateObjectsUsingBlock:v7];
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __51__NPKGizmoDatabase__updateSettingsDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 objectForKeyedSubscript:@"settings"];
  id v7 = v6;
  if (v6) {
    sqlite3_int64 v8 = (int)[v6 intValue];
  }
  else {
    sqlite3_int64 v8 = 0;
  }
  uint64_t v9 = [v10 objectForKeyedSubscript:@"uniqueID"];
  if (!v9
    || (sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 40), 1, v8),
        sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 40), 2, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), sqlite3_step(*(sqlite3_stmt **)(a1 + 40)) != 101))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
}

- (BOOL)_updateCompleteRemoteHashesDuringMigration
{
  ppStmt = 0;
  return !sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE pass SET complete_remote_hashes=complete_hashes" UTF8String], -1, &ppStmt, 0)&& sqlite3_step(ppStmt) == 101;
}

- (BOOL)_updateTransactionSourceIdentifiersDuringMigration:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE transactions SET transaction_source_identifier=? WHERE pass_unique_id=?" UTF8String], -1, &ppStmt, 0);
  char v12 = 0;
  int v6 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)[@"UPDATE ephemeral_transactions SET transaction_source_identifier=? WHERE pass_unique_id=?" UTF8String], -1, &v12, 0);
  pStmt = 0;
  int v7 = sqlite3_prepare_v2(-[NPKGizmoDatabase database](self, "database"), (const char *)objc_msgSend(@"INSERT INTO transaction_source (transaction_source_identifier, type, pass_unique_id) VALUES (?, ?, ?)", "UTF8String"), -1, &pStmt, 0);
  if (!v5 && !v6 && !v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __71__NPKGizmoDatabase__updateTransactionSourceIdentifiersDuringMigration___block_invoke;
    v10[3] = &unk_2644D5DB0;
    v10[4] = &v14;
    void v10[5] = ppStmt;
    v10[6] = v12;
    v10[7] = pStmt;
    [v4 enumerateObjectsUsingBlock:v10];
  }
  sqlite3_finalize(ppStmt);
  sqlite3_finalize(pStmt);
  char v8 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __71__NPKGizmoDatabase__updateTransactionSourceIdentifiersDuringMigration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a2;
  int v7 = [v6 objectForKeyedSubscript:@"uniqueID"];
  char v8 = [v6 objectForKeyedSubscript:@"transactionSourceIdentifier"];

  if (v7 && v8)
  {
    uint64_t v9 = *(sqlite3_stmt **)(a1 + 40);
    id v10 = v8;
    sqlite3_bind_text(v9, 1, (const char *)[v10 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    uint64_t v11 = *(sqlite3_stmt **)(a1 + 40);
    id v12 = v7;
    sqlite3_bind_text(v11, 2, (const char *)[v12 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v13 = sqlite3_step(*(sqlite3_stmt **)(a1 + 40));
    if (v13 != 101)
    {
      int v14 = v13;
      id v15 = pk_General_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        char v17 = pk_General_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412802;
          id v37 = v12;
          __int16 v38 = 2112;
          id v39 = v10;
          __int16 v40 = 1024;
          int v41 = v14;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Update transactions table failed for unique ID %@ transaction source identifier %@ result %d", (uint8_t *)&v36, 0x1Cu);
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 40));
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 40));
    id v18 = *(sqlite3_stmt **)(a1 + 48);
    id v19 = v10;
    sqlite3_bind_text(v18, 1, (const char *)[v19 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v20 = *(sqlite3_stmt **)(a1 + 48);
    id v21 = v12;
    sqlite3_bind_text(v20, 2, (const char *)[v21 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v22 = sqlite3_step(*(sqlite3_stmt **)(a1 + 48));
    if (v22 != 101)
    {
      int v23 = v22;
      uint64_t v24 = pk_General_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        uint64_t v26 = pk_General_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412802;
          id v37 = v21;
          __int16 v38 = 2112;
          id v39 = v19;
          __int16 v40 = 1024;
          int v41 = v23;
          _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Update ephemeral transactions table failed for unique ID %@ transaction source identifier %@ result %d", (uint8_t *)&v36, 0x1Cu);
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 48));
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 48));
    uint64_t v27 = *(sqlite3_stmt **)(a1 + 56);
    id v28 = v19;
    sqlite3_bind_text(v27, 1, (const char *)[v28 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 56), 2, 0);
    __int16 v29 = *(sqlite3_stmt **)(a1 + 56);
    id v30 = v21;
    sqlite3_bind_text(v29, 3, (const char *)[v30 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v31 = sqlite3_step(*(sqlite3_stmt **)(a1 + 56));
    if (v31 != 101)
    {
      int v32 = v31;
      uint64_t v33 = pk_General_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        uint64_t v35 = pk_General_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412802;
          id v37 = v30;
          __int16 v38 = 2112;
          id v39 = v28;
          __int16 v40 = 1024;
          int v41 = v32;
          _os_log_impl(&dword_21E92F000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Insert into transaction source table failed for unique ID %@ transaction source identifier %@ result %d", (uint8_t *)&v36, 0x1Cu);
        }
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
    sqlite3_clear_bindings(*(sqlite3_stmt **)(a1 + 56));
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 56));
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_passForUniqueIDLocked:(id)a3 includeImageSets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4) {
    int v7 = [(NPKGizmoDatabase *)self selectPassAndImageSetsDataStatement];
  }
  else {
    int v7 = [(NPKGizmoDatabase *)self selectPassDataStatement];
  }
  char v8 = v7;
  id v9 = v6;
  sqlite3_bind_text(v8, 1, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v8) == 100)
  {
    id v10 = sqlite3_column_blob(v8, 0);
    int v11 = sqlite3_column_bytes(v8, 0);
    id v12 = (void *)MEMORY[0x223C37110]();
    int v13 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:v11];
    int v14 = objc_opt_class();
    id v15 = NPKSecureUnarchiveObject(v13, v14);

    if (v15)
    {
      if (os_variant_has_internal_ui())
      {
        BOOL v16 = [v15 passTypeIdentifier];
        uint64_t v17 = [v16 length];

        if (!v17)
        {
          id v18 = pk_General_log();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

          if (v19)
          {
            int v20 = pk_General_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = [v15 uniqueID];
              int v34 = 136315394;
              uint64_t v35 = "-[NPKGizmoDatabase _passForUniqueIDLocked:includeImageSets:]";
              __int16 v36 = 2112;
              id v37 = v21;
              _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Warning: %s encoded_pass Unarchived pass with unique identifier %@ is missing the type identifier", (uint8_t *)&v34, 0x16u);
            }
          }
        }
      }
      if (v4)
      {
        int v22 = sqlite3_column_blob(v8, 1);
        int v23 = sqlite3_column_bytes(v8, 1);
        uint64_t v24 = (void *)MEMORY[0x223C37110]();
        BOOL v25 = [MEMORY[0x263EFF8F8] dataWithBytes:v22 length:v23];
        uint64_t v26 = objc_opt_class();
        uint64_t v27 = NPKSecureUnarchiveObject(v25, v26);
        if (v27) {
          [v15 setMissingImageSetsFromObject:v27];
        }
      }
      id v28 = [v15 paymentPass];
      int v29 = [v28 hasCredentials];

      if (v29)
      {
        id v30 = [(NPKGizmoDatabase *)self _subcredentialsForPassWithUniqueIDLocked:v9];
        if (v30)
        {
          int v31 = [v15 paymentPass];
          int v32 = [v31 devicePrimaryPaymentApplication];
          [v32 setSubcredentials:v30];
        }
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  sqlite3_clear_bindings(v8);
  sqlite3_reset(v8);

  return v15;
}

- (id)_diffForUniqueIDLocked:(id)a3
{
  id v4 = a3;
  int v5 = [(NPKGizmoDatabase *)self selectPassDiffStatement];
  id v6 = v4;
  int v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v5) == 100)
  {
    char v8 = sqlite3_column_blob(v5, 0);
    id v9 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v8, sqlite3_column_bytes(v5, 0));
    id v10 = objc_opt_class();
    int v11 = NPKSecureUnarchiveObject(v9, v10);
  }
  else
  {
    int v11 = 0;
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v11;
}

- (void)_saveDiffLocked:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(NPKGizmoDatabase *)self insertDiffStatement];
  id v9 = v8;
  if (v6)
  {
    NPKSecureArchiveObject(v6);
    id v10 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v9, 1, (const void *)[v10 bytes], objc_msgSend(v10, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v8, 1);
  }
  id v11 = v7;
  id v12 = (const char *)[v11 UTF8String];

  sqlite3_bind_text(v9, 2, v12, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v9) != 101)
  {
    int v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      id v15 = pk_General_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = sqlite3_sql(v9);
        uint64_t v17 = sqlite3_errmsg(self->_database);
        int v18 = 136447234;
        BOOL v19 = "-[NPKGizmoDatabase _saveDiffLocked:forPassWithUniqueID:]";
        __int16 v20 = 2082;
        id v21 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v22 = 2048;
        uint64_t v23 = 4182;
        __int16 v24 = 2080;
        BOOL v25 = v16;
        __int16 v26 = 2080;
        uint64_t v27 = v17;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Save diff failed: %s; %s)",
          (uint8_t *)&v18,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v9);
  sqlite3_reset(v9);
}

- (id)passForUniqueID:(id)a3
{
  return [(NPKGizmoDatabase *)self passForUniqueID:a3 includeImageSets:1];
}

- (id)passForUniqueID:(id)a3 includeImageSets:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__14;
  BOOL v19 = __Block_byref_object_dispose__14;
  id v20 = 0;
  dbQueue = self->_dbQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__NPKGizmoDatabase_passForUniqueID_includeImageSets___block_invoke;
  void v11[3] = &unk_2644D5DD8;
  id v12 = v6;
  int v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v8 = v6;
  dispatch_sync(dbQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __53__NPKGizmoDatabase_passForUniqueID_includeImageSets___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _passForUniqueIDLocked:*(void *)(a1 + 40) includeImageSets:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (id)diffForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__14;
  BOOL v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NPKGizmoDatabase_diffForUniqueID___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __36__NPKGizmoDatabase_diffForUniqueID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if ([*(id *)(a1 + 32) database])
  {
    uint64_t v2 = [*(id *)(a1 + 32) _diffForUniqueIDLocked:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (void)setDeletePending:(BOOL)a3 forUniqueID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6)
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        BOOL v16 = "-[NPKGizmoDatabase setDeletePending:forUniqueID:]";
        __int16 v17 = 2082;
        int v18 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v19 = 2048;
        uint64_t v20 = 4221;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: setDeletePending:forUniqueID: can't accept nil uniqueID)", buf, 0x20u);
      }
    }
    _NPKAssertAbort();
  }
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NPKGizmoDatabase_setDeletePending_forUniqueID___block_invoke;
  block[3] = &unk_2644D3E10;
  block[4] = self;
  id v13 = v6;
  BOOL v14 = a3;
  id v11 = v6;
  dispatch_sync(dbQueue, block);
}

void __49__NPKGizmoDatabase_setDeletePending_forUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _passForUniqueIDLocked:*(void *)(a1 + 40) includeImageSets:0];
  if (![*(id *)(a1 + 32) database])
  {
    uint64_t v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      int v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v33 = "-[NPKGizmoDatabase setDeletePending:forUniqueID:]_block_invoke";
        __int16 v34 = 2082;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v36 = 2048;
        uint64_t v37 = 4227;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  id v6 = (sqlite3_stmt *)[*(id *)(a1 + 32) updateDeletePendingStatement];
  sqlite3_bind_int(v6, 1, *(unsigned __int8 *)(a1 + 48));
  sqlite3_bind_text(v6, 2, (const char *)[*(id *)(a1 + 40) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (sqlite3_step(v6) != 101)
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = sqlite3_sql(v6);
        id v11 = sqlite3_errmsg(*(sqlite3 **)(*(void *)(a1 + 32) + 8));
        *(_DWORD *)buf = 136447234;
        uint64_t v33 = "-[NPKGizmoDatabase setDeletePending:forUniqueID:]_block_invoke";
        __int16 v34 = 2082;
        uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v36 = 2048;
        uint64_t v37 = 4238;
        __int16 v38 = 2080;
        id v39 = v10;
        __int16 v40 = 2080;
        int v41 = v11;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Update delete pending failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v6);
  sqlite3_reset(v6);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = *(id *)(*(void *)(a1 + 32) + 352);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v18 = objc_msgSend(v17, "uniqueID", (void)v25);
        char v19 = [v18 isEqualToString:*(void *)(a1 + 40)];

        if (v19)
        {
          id v20 = v17;

          if (v20) {
            [v20 setDeletePending:*(unsigned __int8 *)(a1 + 48)];
          }
          goto LABEL_24;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v20 = 0;
LABEL_24:
  if (v2 && *(unsigned char *)(a1 + 48))
  {
    uint64_t v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = NPKGizmoDatabasePassRemovedNotificationName;
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v29 = NPKGizmoDatabasePassKeyName;
    id v30 = v2;
    __int16 v24 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    [v21 postNotificationName:v22 object:v23 userInfo:v24];
  }
  objc_msgSend(*(id *)(a1 + 32), "_notifyDatabaseChangedExternally", (void)v25);
  [*(id *)(a1 + 32) _notifyDatabaseChangedWithNoop:0];
}

- (BOOL)_getDeletePendingForUniqueID:(id)a3
{
  id v4 = a3;
  int v5 = [(NPKGizmoDatabase *)self selectDeletePendingStatement];
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];

  sqlite3_bind_text(v5, 1, v7, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  BOOL v8 = sqlite3_step(v5) == 100 && sqlite3_column_int(v5, 0) != 0;
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  return v8;
}

- (void)setPreferredPaymentApplication:(id)a3 forPaymentPass:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!v7)
  {
    id v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      id v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        long long v28 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]";
        __int16 v29 = 2082;
        id v30 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v31 = 2048;
        uint64_t v32 = 4280;
        __int16 v33 = 2080;
        __int16 v34 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]";
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil payment pass)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  if (v6)
  {
    id v12 = [v7 paymentApplications];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke;
    v25[3] = &unk_2644D5E00;
    id v13 = v6;
    id v26 = v13;
    uint64_t v14 = objc_msgSend(v12, "pk_anyObjectPassingTest:", v25);

    if (!v14)
    {
      uint64_t v15 = pk_General_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        __int16 v17 = pk_General_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = [v8 paymentApplications];
          *(_DWORD *)buf = 136447490;
          long long v28 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]";
          __int16 v29 = 2082;
          id v30 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
          __int16 v31 = 2048;
          uint64_t v32 = 4283;
          __int16 v33 = 2112;
          __int16 v34 = (const char *)v8;
          __int16 v35 = 2112;
          id v36 = v13;
          __int16 v37 = 2112;
          __int16 v38 = v18;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Payment pass %@ did not contain payment application %@ (has applications = %@))", buf, 0x3Eu);
        }
      }
      _NPKAssertAbort();
    }
  }
  dbQueue = self->_dbQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_543;
  v22[3] = &unk_2644D31B0;
  v22[4] = self;
  id v23 = v6;
  id v24 = v8;
  id v20 = v8;
  id v21 = v6;
  dispatch_async(dbQueue, v22);
}

uint64_t __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationIdentifier];
  int v5 = [v3 applicationIdentifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

void __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_543(id *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [a1[4] _loadInitialManifestLocked];
  if (![a1[4] database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        id v23 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]_block_invoke";
        __int16 v24 = 2082;
        long long v25 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v26 = 2048;
        uint64_t v27 = 4286;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          buf,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  int v5 = (sqlite3_stmt *)[a1[4] updatePreferredAIDStatement];
  id v6 = [a1[5] applicationIdentifier];
  sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  id v7 = a1[5];
  if (v7)
  {
    NPKSecureArchiveObject(v7);
    id v8 = objc_claimAutoreleasedReturnValue();
    sqlite3_bind_blob(v5, 2, (const void *)[v8 bytes], objc_msgSend(v8, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(v5, 2);
  }
  id v9 = [a1[6] uniqueID];
  sqlite3_bind_text(v5, 3, (const char *)[v9 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (sqlite3_step(v5) != 101)
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = sqlite3_sql(v5);
        uint64_t v14 = sqlite3_errmsg(*((sqlite3 **)a1[4] + 1));
        *(_DWORD *)buf = 136447234;
        id v23 = "-[NPKGizmoDatabase setPreferredPaymentApplication:forPaymentPass:]_block_invoke";
        __int16 v24 = 2082;
        long long v25 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v26 = 2048;
        uint64_t v27 = 4303;
        __int16 v28 = 2080;
        __int16 v29 = v13;
        __int16 v30 = 2080;
        __int16 v31 = v14;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Update preferred AID failed: %s; %s)",
          buf,
          0x34u);
      }
    }
    _NPKAssertAbort();
  }
  sqlite3_clear_bindings(v5);
  sqlite3_reset(v5);
  uint64_t v15 = (void *)*((void *)a1[4] + 44);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  int v18 = __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_544;
  char v19 = &unk_2644D5CE8;
  id v20 = a1[6];
  id v21 = a1[5];
  [v15 enumerateObjectsUsingBlock:&v16];
  objc_msgSend(a1[4], "_notifyDatabaseChangedExternally", v16, v17, v18, v19);
  [a1[4] _notifyDatabaseChangedWithNoop:0];
}

void __66__NPKGizmoDatabase_setPreferredPaymentApplication_forPaymentPass___block_invoke_544(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 uniqueID];
  id v8 = [*(id *)(a1 + 32) uniqueID];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    BOOL v10 = pk_General_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = pk_General_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Updating description %@ with new preferred payment application %@", (uint8_t *)&v14, 0x16u);
      }
    }
    [v6 setPreferredPaymentApplication:*(void *)(a1 + 40)];
    *a4 = 1;
  }
}

- (id)preferredPaymentApplicationForPaymentPass:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    int v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      id v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&uint8_t buf[4] = "-[NPKGizmoDatabase preferredPaymentApplicationForPaymentPass:]";
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        *(_WORD *)&buf[22] = 2048;
        uint64_t v16 = 4322;
        LOWORD(v17) = 2080;
        *(void *)((char *)&v17 + 2) = "-[NPKGizmoDatabase preferredPaymentApplicationForPaymentPass:]";
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil payment pass)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v16 = (uint64_t)__Block_byref_object_copy__14;
  *(void *)&long long v17 = __Block_byref_object_dispose__14;
  *((void *)&v17 + 1) = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_preferredPaymentApplicationForPaymentPass___block_invoke;
  block[3] = &unk_2644D5BD0;
  id v13 = v4;
  int v14 = buf;
  block[4] = self;
  id v9 = v4;
  dispatch_sync(dbQueue, block);
  id v10 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v10;
}

void __62__NPKGizmoDatabase_preferredPaymentApplicationForPaymentPass___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  if (![*(id *)(a1 + 32) database])
  {
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136446722;
        id v9 = "-[NPKGizmoDatabase preferredPaymentApplicationForPaymentPass:]_block_invoke";
        __int16 v10 = 2082;
        BOOL v11 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v12 = 2048;
        uint64_t v13 = 4326;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Nil database handle; did you check pass"
          "DBIsAvailable before calling?)",
          (uint8_t *)&v8,
          0x20u);
      }
    }
    _NPKAssertAbort();
  }
  uint64_t v5 = [*(id *)(a1 + 32) _getPreferredPaymentApplicationForPaymentPass:*(void *)(a1 + 40) aid:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_getPreferredPaymentApplicationForPaymentPass:(id)a3 aid:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__14;
  __int16 v26 = __Block_byref_object_dispose__14;
  id v27 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy__14;
  id v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  id v7 = [(NPKGizmoDatabase *)self selectPreferredAIDStatement];
  id v8 = [v6 uniqueID];
  sqlite3_bind_text(v7, 1, (const char *)[v8 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if (sqlite3_step(v7) == 100)
  {
    id v9 = sqlite3_column_text(v7, 0);
    if (v9)
    {
      uint64_t v10 = [NSString stringWithCString:v9 encoding:4];
      BOOL v11 = (void *)v17[5];
      v17[5] = v10;

      __int16 v12 = [v6 paymentApplications];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __70__NPKGizmoDatabase__getPreferredPaymentApplicationForPaymentPass_aid___block_invoke;
      v15[3] = &unk_2644D5E28;
      v15[4] = &v16;
      v15[5] = &v22;
      [v12 enumerateObjectsUsingBlock:v15];
    }
  }
  sqlite3_clear_bindings(v7);
  sqlite3_reset(v7);
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __70__NPKGizmoDatabase__getPreferredPaymentApplicationForPaymentPass_aid___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v6 = [v8 applicationIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)passDescriptions
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__14;
  uint64_t v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__NPKGizmoDatabase_passDescriptions__block_invoke;
  v5[3] = &unk_2644D5E50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __36__NPKGizmoDatabase_passDescriptions__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadInitialManifestLocked];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 352)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSData)libraryHash
{
  return (NSData *)[(NPKGizmoDatabase *)self libraryHashForWatchOSMajorVersion:2];
}

- (id)libraryHashForWatchOSMajorVersion:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__14;
  id v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NPKGizmoDatabase_libraryHashForWatchOSMajorVersion___block_invoke;
  block[3] = &unk_2644D52D0;
  block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dbQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__NPKGizmoDatabase_libraryHashForWatchOSMajorVersion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) database])
  {
    [*(id *)(a1 + 32) _loadInitialManifestLocked];
    uint64_t v2 = [*(id *)(a1 + 32) _libraryHashLockedForWatchOSMajorVersion:*(void *)(a1 + 48)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

+ (unint64_t)latestWatchOSMajorVersion
{
  return 2;
}

- (id)_libraryHashLockedForWatchOSMajorVersion:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!a3 || [(id)objc_opt_class() latestWatchOSMajorVersion] < a3)
  {
    uint64_t v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      uint64_t v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v29 = "-[NPKGizmoDatabase _libraryHashLockedForWatchOSMajorVersion:]";
        __int16 v30 = 2082;
        __int16 v31 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v32 = 2048;
        uint64_t v33 = 4390;
        __int16 v34 = 2048;
        unint64_t v35 = a3;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Received invalid watch OS version %lu)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  libraryHashes = self->_libraryHashes;
  if (libraryHashes)
  {
    uint64_t v9 = [(NSArray *)libraryHashes objectAtIndexedSubscript:a3 - 1];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x223C37110]();
    id v11 = [MEMORY[0x263EFF980] array];
    id v12 = [(NSMutableDictionary *)self->_manifest allKeys];
    id v13 = [v12 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke;
    v26[3] = &unk_2644D4BC8;
    v26[4] = self;
    id v14 = v11;
    id v27 = v14;
    [v13 enumerateObjectsUsingBlock:v26];

    if ([v14 count])
    {
      id v23 = v10;
      id v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_opt_class(), "latestWatchOSMajorVersion"));
      if ([(id)objc_opt_class() latestWatchOSMajorVersion])
      {
        unint64_t v16 = 0;
        uint64_t v17 = MEMORY[0x263EF8330];
        do
        {
          v25[0] = v17;
          v25[1] = 3221225472;
          v25[2] = __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke_547;
          v25[3] = &__block_descriptor_40_e17__16__0__NSArray_8l;
          void v25[4] = v16;
          uint64_t v18 = objc_msgSend(v14, "npkComprehension:", v25, v23);
          char v19 = NPKLibraryHashForPassHashes(v18);
          [v15 setObject:v19 atIndexedSubscript:v16];

          ++v16;
        }
        while (v16 < [(id)objc_opt_class() latestWatchOSMajorVersion]);
      }
      id v20 = (NSArray *)objc_msgSend(v15, "copy", v23);
      id v21 = self->_libraryHashes;
      self->_libraryHashes = v20;

      uint64_t v9 = [(NSArray *)self->_libraryHashes objectAtIndexedSubscript:a3 - 1];

      uint64_t v10 = v24;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

void __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 344) objectForKey:v3];
  uint64_t v5 = [v4 remoteManifestHashes];
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    BOOL v6 = pk_Payment_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      uint64_t v8 = pk_Payment_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Skipping pass with unique ID %@ because it has no remote manifest hashes", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

uint64_t __61__NPKGizmoDatabase__libraryHashLockedForWatchOSMajorVersion___block_invoke_547(uint64_t a1, void *a2)
{
  return [a2 objectAtIndexedSubscript:*(void *)(a1 + 32)];
}

- (NSDictionary)manifestHashes
{
  uint64_t v3 = [(id)objc_opt_class() latestWatchOSMajorVersion];
  return (NSDictionary *)[(NPKGizmoDatabase *)self manifestHashesForWatchOSMajorVersion:v3];
}

- (id)manifestHashesForWatchOSMajorVersion:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__14;
  uint64_t v11 = __Block_byref_object_dispose__14;
  id v12 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke;
  block[3] = &unk_2644D52D0;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) database])
  {
    [*(id *)(a1 + 32) _loadInitialManifestLocked];
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 344), "count"));
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 344);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke_2;
    id v12 = &unk_2644D5E98;
    uint64_t v4 = *(void *)(a1 + 48);
    id v13 = v2;
    uint64_t v14 = v4;
    id v5 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:&v9];
    uint64_t v6 = objc_msgSend(NSDictionary, "dictionaryWithDictionary:", v5, v9, v10, v11, v12);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void __57__NPKGizmoDatabase_manifestHashesForWatchOSMajorVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [a3 remoteManifestHashes];
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 count];
    unint64_t v9 = *(void *)(a1 + 40);
    if (v8 >= v9)
    {
      unint64_t v16 = [v7 objectAtIndexedSubscript:v9 - 1];
      [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v5];

      goto LABEL_12;
    }
    uint64_t v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      id v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v5;
        id v13 = "Warning: Skipping pass with unique ID %@ from manifest calculation because it is missing manifest hash for this version";
LABEL_9:
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v14 = pk_Payment_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      id v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v5;
        id v13 = "Notice: Skipping pass with unique ID %@ from manifest calculation because it has no remote manifest hash";
        goto LABEL_9;
      }
LABEL_10:
    }
  }
LABEL_12:
}

- (void)enumerateAllPassesWithBlock:(id)a3 includeImageSets:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__NPKGizmoDatabase_enumerateAllPassesWithBlock_includeImageSets___block_invoke;
  v8[3] = &unk_2644D5EC0;
  id v9 = v6;
  id v7 = v6;
  [(NPKGizmoDatabase *)self enumerateAllPassesAndDescriptionsWithBlock:v8 includeImageSets:v4];
}

uint64_t __65__NPKGizmoDatabase_enumerateAllPassesWithBlock_includeImageSets___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateAllPassesAndDescriptionsWithBlock:(id)a3 includeImageSets:(BOOL)a4
{
  id v6 = a3;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke;
  block[3] = &unk_2644D3680;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(dbQueue, block);
}

void __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) database])
  {
    [*(id *)(a1 + 32) _loadInitialManifestLocked];
    v10[0] = 0;
    v10[1] = v10;
    void v10[2] = 0x2020000000;
    v10[3] = 0;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 352) count];
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 352);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke_2;
    v5[3] = &unk_2644D5EE8;
    v5[4] = v3;
    char v9 = *(unsigned char *)(a1 + 48);
    id v6 = *(id *)(a1 + 40);
    id v7 = v10;
    uint64_t v8 = v2;
    [v4 enumerateObjectsUsingBlock:v5];

    _Block_object_dispose(v10, 8);
  }
}

void __80__NPKGizmoDatabase_enumerateAllPassesAndDescriptionsWithBlock_includeImageSets___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 uniqueID];
  id v7 = [v3 _passForUniqueIDLocked:v5 includeImageSets:*(unsigned __int8 *)(a1 + 64)];

  uint64_t v6 = *(void *)(a1 + 40);
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  (*(void (**)(void))(v6 + 16))();
}

- (BOOL)hasPassesMatchingPassDescriptionPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKGizmoDatabase_hasPassesMatchingPassDescriptionPredicate___block_invoke;
  block[3] = &unk_2644D5B30;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(dbQueue, block);
  LOBYTE(dbQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)dbQueue;
}

void __62__NPKGizmoDatabase_hasPassesMatchingPassDescriptionPredicate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) database])
  {
    [*(id *)(a1 + 32) _loadInitialManifestLocked];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 352);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          if (objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", *(void *)(*((void *)&v7 + 1) + 8 * i), (void)v7))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (id)filteredPassesUsingPassDescriptionPredicate:(id)a3 includeImageSets:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__14;
  uint64_t v19 = __Block_byref_object_dispose__14;
  id v20 = 0;
  dbQueue = self->_dbQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__NPKGizmoDatabase_filteredPassesUsingPassDescriptionPredicate_includeImageSets___block_invoke;
  void v11[3] = &unk_2644D5B08;
  v11[4] = self;
  id v12 = v6;
  BOOL v14 = a4;
  uint64_t v13 = &v15;
  id v8 = v6;
  dispatch_sync(dbQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __81__NPKGizmoDatabase_filteredPassesUsingPassDescriptionPredicate_includeImageSets___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) database])
  {
    [*(id *)(a1 + 32) _loadInitialManifestLocked];
    id v2 = [MEMORY[0x263EFF9C0] set];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 352);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:", v8, (void)v15))
          {
            id v9 = *(void **)(a1 + 32);
            long long v10 = [v8 uniqueID];
            uint64_t v11 = [v9 _passForUniqueIDLocked:v10 includeImageSets:*(unsigned __int8 *)(a1 + 56)];

            [v2 addObject:v11];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }

    uint64_t v12 = [v2 copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (void)_rebuildDatabaseWithPassesFromCompanionPasses
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = [(id)objc_opt_class() _migrationDataSource];
  uint64_t v4 = [v3 companionPaymentPassUniqueIDs];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v69 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v3 companionPaymentPassWithUniqueID:*(void *)(*((void *)&v68 + 1) + 8 * i)];
        [v5 npkSafelyAddObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v8);
  }

  uint64_t v12 = pk_General_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    BOOL v14 = pk_General_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v5 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v74 = v15;
      __int16 v75 = 2112;
      id v76 = v6;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding payment passes migration step. Re-saving %lu payment passes with unique IDs: %@", buf, 0x16u);
    }
  }
  id v56 = v6;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v5;
  uint64_t v16 = [obj countByEnumeratingWithState:&v64 objects:v79 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v64 + 1) + 8 * j);
        id v21 = pk_General_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

        if (v22)
        {
          id v23 = pk_General_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v20 uniqueID];
            long long v25 = [v20 localizedDescription];
            *(_DWORD *)buf = 138412546;
            uint64_t v74 = (uint64_t)v24;
            __int16 v75 = 2112;
            id v76 = v25;
            _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding - Will save payment pass with unique id: %@, localized description: %@", buf, 0x16u);
          }
        }
        char v63 = 0;
        [(NPKGizmoDatabase *)self _savePassLocked:v20 locallyAdded:0 wasUpdate:&v63];
        __int16 v26 = pk_General_log();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

        if (v27)
        {
          __int16 v28 = pk_General_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v29 = [v20 uniqueID];
            __int16 v30 = [v20 localizedDescription];
            __int16 v31 = NSStringFromBOOL();
            *(_DWORD *)buf = 138412802;
            uint64_t v74 = (uint64_t)v29;
            __int16 v75 = 2112;
            id v76 = v30;
            __int16 v77 = 2112;
            int v78 = v31;
            _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Re-encoding - Did save save payment pass with unique id: %@ localized description: %@, was update?: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v79 count:16];
    }
    while (v17);
  }

  __int16 v32 = v56;
  if (os_variant_has_internal_ui())
  {
    uint64_t v33 = pk_General_log();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    if (v34)
    {
      unint64_t v35 = pk_General_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v74 = (uint64_t)v56;
        _os_log_impl(&dword_21E92F000, v35, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: Verifying re-encoding payment passes after migration step. Passes to verify: %@", buf, 0xCu);
      }
    }
    id v57 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v36 = v56;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v60 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v59 + 1) + 8 * k);
          uint64_t v42 = [(NPKGizmoDatabase *)self _passForUniqueIDLocked:v41 includeImageSets:0];
          uint64_t v43 = [v42 passTypeIdentifier];
          uint64_t v44 = [v43 length];

          if (!v44)
          {
            uint64_t v45 = [v42 localizedDescription];
            [v57 setObject:v45 forKeyedSubscript:v41];
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v38);
    }

    uint64_t v46 = [v57 count];
    uint64_t v47 = pk_General_log();
    __int16 v48 = v47;
    if (v46)
    {
      BOOL v49 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);

      __int16 v32 = v56;
      if (v49)
      {
        id v50 = pk_General_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v74 = (uint64_t)v57;
          uint64_t v51 = "Error: NPKGizmoDatabase: Re-encoding payment passes migration step verification found encoding issues in"
                " passes with unique IDs: %@";
          id v52 = v50;
          os_log_type_t v53 = OS_LOG_TYPE_ERROR;
          uint32_t v54 = 12;
LABEL_48:
          _os_log_impl(&dword_21E92F000, v52, v53, v51, buf, v54);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

      __int16 v32 = v56;
      if (v55)
      {
        id v50 = pk_General_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v51 = "Notice: NPKGizmoDatabase: Re-encoding payment passes migration step verification did not find any encoding issues";
          id v52 = v50;
          os_log_type_t v53 = OS_LOG_TYPE_DEFAULT;
          uint32_t v54 = 2;
          goto LABEL_48;
        }
LABEL_49:
      }
    }
  }
}

- (void)_verifyPassDataIsUnarchivedCorrectlyWithData:(id)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_ui())
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NPKSecureUnarchiveObject(v5, v7);
    uint64_t v9 = v8;
    if (v8)
    {
      long long v10 = [v8 passTypeIdentifier];
      uint64_t v11 = [v10 length];

      if (v11) {
        goto LABEL_12;
      }
      uint64_t v12 = pk_General_log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

      if (!v13) {
        goto LABEL_12;
      }
      BOOL v14 = pk_General_log();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v18 = 136315394;
      uint64_t v19 = "-[NPKGizmoDatabase _verifyPassDataIsUnarchivedCorrectlyWithData:forPassWithUniqueID:]";
      __int16 v20 = 2112;
      id v21 = v6;
      uint64_t v15 = "Warning: %s encoded_pass Updating the pass with encoded data of pass with uniqueID %@ is missing the type identifier.";
    }
    else
    {
      uint64_t v16 = pk_General_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (!v17)
      {
LABEL_12:

        goto LABEL_13;
      }
      BOOL v14 = pk_General_log();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_12;
      }
      int v18 = 136315394;
      uint64_t v19 = "-[NPKGizmoDatabase _verifyPassDataIsUnarchivedCorrectlyWithData:forPassWithUniqueID:]";
      __int16 v20 = 2112;
      id v21 = v6;
      uint64_t v15 = "Warning: %s encoded_pass There was a problem unarchiving the pass archive for pass with uniqueID %@.";
    }
    _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, 0x16u);
    goto LABEL_11;
  }
LABEL_13:
}

- (BOOL)_migrateDatabase:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  __int16 v19 = 0;
  int64_t v5 = [(NPKGizmoDatabase *)self _databaseVersionExists:(char *)&v19 + 1 valid:&v19];
  uint64_t v6 = [(id)objc_opt_class() maxDatabaseVersion];
  if (v5 >= v6)
  {
    uint64_t v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v25 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: on-disk version %ld matches current version", buf, 0xCu);
    }
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__NPKGizmoDatabase__migrateDatabase___block_invoke;
    v13[3] = &unk_2644D5F10;
    int64_t v16 = v5;
    uint64_t v17 = v6;
    uint64_t v15 = &v20;
    uint64_t v7 = v4;
    char v18 = HIBYTE(v19);
    v13[4] = self;
    BOOL v14 = v7;
    [(NPKGizmoDatabase *)self _performTransactionWithBlock:v13];
    uint64_t v8 = v14;
  }

LABEL_7:
  BOOL v11 = *((unsigned char *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __37__NPKGizmoDatabase__migrateDatabase___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 64);
      int v14 = 134218240;
      uint64_t v15 = v5;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: on-disk version %ld out of date, migrating to current version %ld", (uint8_t *)&v14, 0x16u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      int v14 = 67109120;
      LODWORD(v15) = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase: migration success = %d", (uint8_t *)&v14, 8u);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 64);
    if (*(unsigned char *)(a1 + 72)) {
      [v11 _updateDatabaseVersionRow:v12];
    }
    else {
      [v11 _insertDatabaseVersionRow:v12];
    }
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (int64_t)_databaseVersionExists:(BOOL *)a3 valid:(BOOL *)a4
{
  [(NPKGizmoDatabase *)self _executeSQL:@"CREATE TABLE IF NOT EXISTS key_value_store (key TEXT NOT NULL, value TEXT);"];
  [(NPKGizmoDatabase *)self _executeSQL:@"CREATE UNIQUE INDEX IF NOT EXISTS key_value_store_idx1 ON key_value_store(key)"];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __49__NPKGizmoDatabase__databaseVersionExists_valid___block_invoke;
  v9[3] = &unk_2644D5F38;
  void v9[4] = &v10;
  v9[5] = a3;
  v9[6] = a4;
  [(NPKGizmoDatabase *)self _executeSQLQuery:@"SELECT value FROM key_value_store WHERE KEY=\"version\"" processResultsBlock:v9];
  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __49__NPKGizmoDatabase__databaseVersionExists_valid___block_invoke(void *a1, int a2, sqlite3_stmt *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    int v5 = sqlite3_step(a3);
    uint64_t v6 = (unsigned char *)a1[5];
    if (v5 == 100)
    {
      if (v6) {
        *uint64_t v6 = 1;
      }
      int64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(a3, 0));
      *(void *)(*(void *)(a1[4] + 8) + 24) = [v7 integerValue];
      if (*(uint64_t *)(*(void *)(a1[4] + 8) + 24) < 1)
      {
        uint64_t v10 = pk_General_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          uint64_t v12 = pk_General_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            int v13 = 136446978;
            int v14 = "-[NPKGizmoDatabase _databaseVersionExists:valid:]_block_invoke";
            __int16 v15 = 2082;
            __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
            __int16 v17 = 2048;
            uint64_t v18 = 4619;
            __int16 v19 = 2112;
            uint64_t v20 = v7;
            _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Invalid pass DB version string: %@)", (uint8_t *)&v13, 0x2Au);
          }
        }
        _NPKAssertAbort();
      }
      BOOL v8 = (unsigned char *)a1[6];
      if (v8) {
        *BOOL v8 = 1;
      }
    }
    else
    {
      if (v6) {
        *uint64_t v6 = 0;
      }
      uint64_t v9 = (unsigned char *)a1[6];
      if (v9) {
        *uint64_t v9 = 1;
      }
    }
  }
}

- (void)_insertDatabaseVersionRow:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v5 = [(id)objc_opt_class() maxDatabaseVersion];
  if (a3 < 1 || v5 < a3)
  {
    uint64_t v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      BOOL v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v15 = "-[NPKGizmoDatabase _insertDatabaseVersionRow:]";
        __int16 v16 = 2082;
        __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v18 = 2048;
        uint64_t v19 = 4633;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot save unsupported database version %ld)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  uint64_t v9 = [NSString stringWithFormat:@"INSERT INTO key_value_store (key, value) VALUES (\"version\", \"%ld\")", a3];
  BOOL v10 = [(NPKGizmoDatabase *)self _executeSQL:v9];

  if (!v10)
  {
    BOOL v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      int v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v15 = "-[NPKGizmoDatabase _insertDatabaseVersionRow:]";
        __int16 v16 = 2082;
        __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v18 = 2048;
        uint64_t v19 = 4635;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to save version number to DB: %ld)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
}

- (void)_updateDatabaseVersionRow:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int64_t v5 = [(id)objc_opt_class() maxDatabaseVersion];
  if (a3 < 1 || v5 < a3)
  {
    uint64_t v6 = pk_General_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      BOOL v8 = pk_General_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v15 = "-[NPKGizmoDatabase _updateDatabaseVersionRow:]";
        __int16 v16 = 2082;
        __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v18 = 2048;
        uint64_t v19 = 4639;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot save unsupported database version %ld)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"UPDATE key_value_store SET value=\"%ld\" WHERE key=\"version\"", a3);
  BOOL v10 = [(NPKGizmoDatabase *)self _executeSQL:v9];

  if (!v10)
  {
    BOOL v11 = pk_General_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      int v13 = pk_General_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v15 = "-[NPKGizmoDatabase _updateDatabaseVersionRow:]";
        __int16 v16 = 2082;
        __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v18 = 2048;
        uint64_t v19 = 4641;
        __int16 v20 = 2048;
        int64_t v21 = a3;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to save version number to DB: %ld)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
}

- (BOOL)_preconditionsMetForDatabaseOpen
{
  id v2 = [(id)objc_opt_class() _migrationDataSource];

  return v2 && MKBDeviceUnlockedSinceBoot() == 1;
}

- (void)_handleDatabaseChangedExternally
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__NPKGizmoDatabase__handleDatabaseChangedExternally__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(dbQueue, block);
}

void __52__NPKGizmoDatabase__handleDatabaseChangedExternally__block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 368);
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v2 < 1)
  {
    if (v4)
    {
      uint64_t v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v7 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKGizmoDatabase DB changed externally, reloading", v7, 2u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownDB");
  }
  else
  {
    if (v4)
    {
      int64_t v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: We were expecting a DB change, so suppressing DB reload", buf, 2u);
      }
    }
    --*(_DWORD *)(*(void *)(a1 + 32) + 368);
  }
}

- (void)teardownDB
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__NPKGizmoDatabase_teardownDB__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

uint64_t __30__NPKGizmoDatabase_teardownDB__block_invoke(uint64_t a1)
{
  int v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: requested to teardown NPKGizmoDatabase DB", v6, 2u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownDB");
}

- (void)_inQueue_teardownDB
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    int64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v49 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: tearing down NPKGizmoDatabase DB", v49, 2u);
    }
  }
  deleteStatement = self->_deleteStatement;
  if (deleteStatement) {
    sqlite3_finalize(deleteStatement);
  }
  self->_deleteStatement = 0;
  insertStatement = self->_insertStatement;
  if (insertStatement) {
    sqlite3_finalize(insertStatement);
  }
  self->_insertStatement = 0;
  insertDiffStatement = self->_insertDiffStatement;
  if (insertDiffStatement) {
    sqlite3_finalize(insertDiffStatement);
  }
  self->_insertDiffStatement = 0;
  selectPassDataStatement = self->_selectPassDataStatement;
  if (selectPassDataStatement) {
    sqlite3_finalize(selectPassDataStatement);
  }
  self->_selectPassDataStatement = 0;
  selectPassAndImageSetsDataStatement = self->_selectPassAndImageSetsDataStatement;
  if (selectPassAndImageSetsDataStatement) {
    sqlite3_finalize(selectPassAndImageSetsDataStatement);
  }
  self->_selectPassAndImageSetsDataStatement = 0;
  selectPassDiffStatement = self->_selectPassDiffStatement;
  if (selectPassDiffStatement) {
    sqlite3_finalize(selectPassDiffStatement);
  }
  self->_selectPassDiffStatement = 0;
  updateDeletePendingStatement = self->_updateDeletePendingStatement;
  if (updateDeletePendingStatement) {
    sqlite3_finalize(updateDeletePendingStatement);
  }
  self->_updateDeletePendingStatement = 0;
  selectDeletePendingStatement = self->_selectDeletePendingStatement;
  if (selectDeletePendingStatement) {
    sqlite3_finalize(selectDeletePendingStatement);
  }
  self->_selectDeletePendingStatement = 0;
  updatePreferredAIDStatement = self->_updatePreferredAIDStatement;
  if (updatePreferredAIDStatement) {
    sqlite3_finalize(updatePreferredAIDStatement);
  }
  self->_updatePreferredAIDStatement = 0;
  selectPreferredAIDStatement = self->_selectPreferredAIDStatement;
  if (selectPreferredAIDStatement) {
    sqlite3_finalize(selectPreferredAIDStatement);
  }
  self->_selectPreferredAIDStatement = 0;
  insertTransactionStatement = self->_insertTransactionStatement;
  if (insertTransactionStatement) {
    sqlite3_finalize(insertTransactionStatement);
  }
  self->_insertTransactionStatement = 0;
  removeTransactionStatement = self->_removeTransactionStatement;
  if (removeTransactionStatement) {
    sqlite3_finalize(removeTransactionStatement);
  }
  self->_removeTransactionStatement = 0;
  removeTransactionWithServiceIdentifier = self->_removeTransactionWithServiceIdentifier;
  if (removeTransactionWithServiceIdentifier) {
    sqlite3_finalize(removeTransactionWithServiceIdentifier);
  }
  self->_removeTransactionWithServiceIdentifier = 0;
  selectTransactionsStatement = self->_selectTransactionsStatement;
  if (selectTransactionsStatement) {
    sqlite3_finalize(selectTransactionsStatement);
  }
  self->_selectTransactionsStatement = 0;
  selectTransactionsStatementWithSource = self->_selectTransactionsStatementWithSource;
  if (selectTransactionsStatementWithSource) {
    sqlite3_finalize(selectTransactionsStatementWithSource);
  }
  self->_selectTransactionsStatementWithSource = 0;
  selectTransactionsStatementWithoutSource = self->_selectTransactionsStatementWithoutSource;
  if (selectTransactionsStatementWithoutSource) {
    sqlite3_finalize(selectTransactionsStatementWithoutSource);
  }
  self->_selectTransactionsStatementWithoutSource = 0;
  selectTransactionWithIdentifierStatement = self->_selectTransactionWithIdentifierStatement;
  if (selectTransactionWithIdentifierStatement) {
    sqlite3_finalize(selectTransactionWithIdentifierStatement);
  }
  self->_selectTransactionWithIdentifierStatement = 0;
  selectTransactionWithServiceIdentifierStatement = self->_selectTransactionWithServiceIdentifierStatement;
  if (selectTransactionWithServiceIdentifierStatement) {
    sqlite3_finalize(selectTransactionWithServiceIdentifierStatement);
  }
  self->_selectTransactionWithServiceIdentifierStatement = 0;
  insertTransactionSourceIdentifierForPassStatement = self->_insertTransactionSourceIdentifierForPassStatement;
  if (insertTransactionSourceIdentifierForPassStatement) {
    sqlite3_finalize(insertTransactionSourceIdentifierForPassStatement);
  }
  self->_insertTransactionSourceIdentifierForPassStatement = 0;
  selectTransactionSourceIdentifierForTransactionWithIdentifierStatement = self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement;
  if (selectTransactionSourceIdentifierForTransactionWithIdentifierStatement) {
    sqlite3_finalize(selectTransactionSourceIdentifierForTransactionWithIdentifierStatement);
  }
  self->_selectTransactionSourceIdentifierForTransactionWithIdentifierStatement = 0;
  selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement = self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement;
  if (selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement) {
    sqlite3_finalize(selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement);
  }
  self->_selectTransactionSourceIdentifierForTransactionWithServiceIdentifierStatement = 0;
  selectTransactionSourceIdentifierForPassUniqueIdentifierStatement = self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement;
  if (selectTransactionSourceIdentifierForPassUniqueIdentifierStatement) {
    sqlite3_finalize(selectTransactionSourceIdentifierForPassUniqueIdentifierStatement);
  }
  self->_selectTransactionSourceIdentifierForPassUniqueIdentifierStatement = 0;
  selectPassUniqueIdentifierForTransactionSourceIdentifierStatement = self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement;
  if (selectPassUniqueIdentifierForTransactionSourceIdentifierStatement) {
    sqlite3_finalize(selectPassUniqueIdentifierForTransactionSourceIdentifierStatement);
  }
  self->_selectPassUniqueIdentifierForTransactionSourceIdentifierStatement = 0;
  deleteTransactionSourceIdentifierForPassStatement = self->_deleteTransactionSourceIdentifierForPassStatement;
  if (deleteTransactionSourceIdentifierForPassStatement) {
    sqlite3_finalize(deleteTransactionSourceIdentifierForPassStatement);
  }
  self->_deleteTransactionSourceIdentifierForPassStatement = 0;
  deleteTransactionsForTransactionSourceStatement = self->_deleteTransactionsForTransactionSourceStatement;
  if (deleteTransactionsForTransactionSourceStatement) {
    sqlite3_finalize(deleteTransactionsForTransactionSourceStatement);
  }
  self->_deleteTransactionsForTransactionSourceStatement = 0;
  trimTransactionsForTransactionSourceStatement = self->_trimTransactionsForTransactionSourceStatement;
  if (trimTransactionsForTransactionSourceStatement) {
    sqlite3_finalize(trimTransactionsForTransactionSourceStatement);
  }
  self->_trimTransactionsForTransactionSourceStatement = 0;
  selectTransitAppletStateForPassStatement = self->_selectTransitAppletStateForPassStatement;
  if (selectTransitAppletStateForPassStatement) {
    sqlite3_finalize(selectTransitAppletStateForPassStatement);
  }
  self->_selectTransitAppletStateForPassStatement = 0;
  updateTransitAppletStateForPassStatement = self->_updateTransitAppletStateForPassStatement;
  if (updateTransitAppletStateForPassStatement) {
    sqlite3_finalize(updateTransitAppletStateForPassStatement);
  }
  self->_updateTransitAppletStateForPassStatement = 0;
  insertEphemeralTransactionStatement = self->_insertEphemeralTransactionStatement;
  if (insertEphemeralTransactionStatement) {
    sqlite3_finalize(insertEphemeralTransactionStatement);
  }
  self->_insertEphemeralTransactionStatement = 0;
  deleteEphemeralTransactionByTransactionSourceIdentifierStatement = self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement;
  if (deleteEphemeralTransactionByTransactionSourceIdentifierStatement) {
    sqlite3_finalize(deleteEphemeralTransactionByTransactionSourceIdentifierStatement);
  }
  self->_deleteEphemeralTransactionByTransactionSourceIdentifierStatement = 0;
  currentEphemeralTransactionIdentifierStatement = self->_currentEphemeralTransactionIdentifierStatement;
  if (currentEphemeralTransactionIdentifierStatement) {
    sqlite3_finalize(currentEphemeralTransactionIdentifierStatement);
  }
  self->_currentEphemeralTransactionIdentifierStatement = 0;
  selectLastAddValueAmountForPassStatement = self->_selectLastAddValueAmountForPassStatement;
  if (selectLastAddValueAmountForPassStatement) {
    sqlite3_finalize(selectLastAddValueAmountForPassStatement);
  }
  self->_selectLastAddValueAmountForPassStatement = 0;
  updateLastAddValueAmountForPassStatement = self->_updateLastAddValueAmountForPassStatement;
  if (updateLastAddValueAmountForPassStatement) {
    sqlite3_finalize(updateLastAddValueAmountForPassStatement);
  }
  self->_updateLastAddValueAmountForPassStatement = 0;
  selectPendingAddValueDateForPassStatement = self->_selectPendingAddValueDateForPassStatement;
  if (selectPendingAddValueDateForPassStatement) {
    sqlite3_finalize(selectPendingAddValueDateForPassStatement);
  }
  self->_selectPendingAddValueDateForPassStatement = 0;
  updatePendingAddValueDateForPassStatement = self->_updatePendingAddValueDateForPassStatement;
  if (updatePendingAddValueDateForPassStatement) {
    sqlite3_finalize(updatePendingAddValueDateForPassStatement);
  }
  self->_updatePendingAddValueDateForPassStatement = 0;
  selectBalancesForPassStatement = self->_selectBalancesForPassStatement;
  if (selectBalancesForPassStatement) {
    sqlite3_finalize(selectBalancesForPassStatement);
  }
  self->_selectBalancesForPassStatement = 0;
  updateBalancesForPassStatement = self->_updateBalancesForPassStatement;
  if (updateBalancesForPassStatement) {
    sqlite3_finalize(updateBalancesForPassStatement);
  }
  self->_updateBalancesForPassStatement = 0;
  selectSubcredentialsForPassStatement = self->_selectSubcredentialsForPassStatement;
  if (selectSubcredentialsForPassStatement) {
    sqlite3_finalize(selectSubcredentialsForPassStatement);
  }
  self->_selectSubcredentialsForPassStatement = 0;
  updateSubcredentialsForPassStatement = self->_updateSubcredentialsForPassStatement;
  if (updateSubcredentialsForPassStatement) {
    sqlite3_finalize(updateSubcredentialsForPassStatement);
  }
  self->_updateSubcredentialsForPassStatement = 0;
  database = self->_database;
  if (database) {
    sqlite3_close(database);
  }
  self->_database = 0;
  manifest = self->_manifest;
  self->_manifest = 0;

  passDescriptions = self->_passDescriptions;
  self->_passDescriptions = 0;

  libraryHashes = self->_libraryHashes;
  self->_libraryHashes = 0;

  self->_passDBIsAvailable = 0;
  [(NPKGizmoDatabase *)self _notifyDatabaseChangedWithNoop:0];
}

- (void)_handleFirstUnlock
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    int64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: First unlock detected", v6, 2u);
    }
  }
  if ([(NPKGizmoDatabase *)self _preconditionsMetForDatabaseOpen]) {
    [(NPKGizmoDatabase *)self _attemptDatabaseOpen];
  }
}

- (void)_handleHasMigrationDataSource
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    int64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Have migration data source", v6, 2u);
    }
  }
  if ([(NPKGizmoDatabase *)self _preconditionsMetForDatabaseOpen]) {
    [(NPKGizmoDatabase *)self _attemptDatabaseOpen];
  }
}

- (void)_attemptDatabaseOpen
{
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__NPKGizmoDatabase__attemptDatabaseOpen__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(dbQueue, block);
}

uint64_t __40__NPKGizmoDatabase__attemptDatabaseOpen__block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    int v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      BOOL v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v5 = 0;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Retrying opening database", v5, 2u);
      }
    }
    return [*(id *)(v1 + 32) database];
  }
  return result;
}

- (BOOL)_table:(id)a3 containsColumn:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)a3;
  BOOL v7 = (char *)a4;
  BOOL v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v30 = v7;
      __int16 v31 = 2112;
      __int16 v32 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Start search column:%@ in table:%@", buf, 0x16u);
    }
  }
  ppStmt = 0;
  BOOL v11 = [NSString stringWithFormat:@"PRAGMA table_info('%@')", v6];
  BOOL v12 = [(NPKGizmoDatabase *)self database];
  id v13 = v11;
  if (sqlite3_prepare_v2(v12, (const char *)[v13 UTF8String], -1, &ppStmt, 0))
  {
    int v14 = pk_General_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      __int16 v16 = pk_General_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136447234;
        __int16 v30 = "-[NPKGizmoDatabase _table:containsColumn:]";
        __int16 v31 = 2082;
        __int16 v32 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKGizmoDatabase.m";
        __int16 v33 = 2048;
        uint64_t v34 = 4814;
        __int16 v35 = 2112;
        id v36 = v7;
        __int16 v37 = 2112;
        uint64_t v38 = v6;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Unable to prepare statement to find column:%@ in table:%@)", buf, 0x34u);
      }
    }
    _NPKAssertAbort();
  }
  char v17 = 0;
  while (sqlite3_step(ppStmt) == 100)
  {
    __int16 v18 = sqlite3_column_text(ppStmt, 1);
    if (v18)
    {
      uint64_t v19 = [NSString stringWithCString:v18 encoding:4];
      char v17 = [v7 isEqualToString:v19];
    }
    if (v17)
    {
      __int16 v20 = pk_General_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        uint64_t v22 = pk_General_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v30 = v7;
          __int16 v31 = 2112;
          __int16 v32 = v6;
          _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: found column:%@ in table:%@", buf, 0x16u);
        }
      }
      BOOL v23 = 1;
      goto LABEL_25;
    }
  }
  uint64_t v24 = pk_General_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  BOOL v23 = 0;
  if (v25)
  {
    uint64_t v26 = pk_General_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v30 = v7;
      __int16 v31 = 2112;
      __int16 v32 = v6;
      _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Could not find column:%@ in table:%@", buf, 0x16u);
    }

    BOOL v23 = 0;
  }
LABEL_25:
  sqlite3_finalize(ppStmt);

  return v23;
}

- (void)setPassDBIsAvailable:(BOOL)a3
{
  self->_passDBIsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryHashes, 0);
  objc_storeStrong((id *)&self->_passDescriptions, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
}

@end