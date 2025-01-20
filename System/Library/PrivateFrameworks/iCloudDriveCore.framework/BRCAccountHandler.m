@interface BRCAccountHandler
+ (id)currentiCloudAccount;
+ (id)currentiCloudAccountID;
+ (void)_migrateAccountIfNecessaryForAccountDSID:(id)a3;
+ (void)currentiCloudAccount;
- (BOOL)_cleanupAPFSSnapshotWhenNoSessionExists;
- (BOOL)_createCurrentAccountSessionWithID:(id)a3 error:(id *)a4;
- (BOOL)_loadOnDiskAccountSessionSecondTry:(id)a3 prevError:(id)a4;
- (BOOL)_loadOnDiskAccountSessionWithError:(id *)a3;
- (BOOL)_shouldResetLocalData:(id)a3;
- (BOOL)_shouldRetryOpenSession:(unsigned __int8)a3;
- (BOOL)_waitForSessionLoadingWhenNowStarting:(BOOL)a3;
- (BOOL)checkEnoughDiskSpaceToBeFunctional;
- (BOOL)createAccountSessionWithDSID:(id)a3 error:(id *)a4;
- (BOOL)destroyCurrentAccountSynchronously;
- (BOOL)destroySessionSynchronously;
- (BOOL)doesNotHaveEnoughDiskSpaceToBeFunctional;
- (BOOL)finishedLoading;
- (BOOL)setDBAccountDSID:(id)a3;
- (BOOL)waitForSessionLoading;
- (BRCAccountHandler)initWithACAccountID:(id)a3;
- (BRCAccountSessionFPFS)session;
- (NSError)loggedOutError;
- (NSString)acAccountID;
- (NSString)accountPath;
- (OS_dispatch_workloop)pushWorkloop;
- (id)ubiquityTokenSalt;
- (id)waitForSessionDBLoadingBarrier;
- (int64_t)syncPolicyforSyncedFolderType:(unint64_t)a3;
- (unsigned)_handleOpenError:(id)a3;
- (unsigned)_tryToOpenSession:(id)a3 error:(id *)a4;
- (void)__destroySession;
- (void)_cleanupPushAndActivitiesStatesWhenNoSessionExists;
- (void)_destroyCurrentSessionSynchronously;
- (void)_handleAccountDidChange;
- (void)_handleAccountWillChange;
- (void)_updateAccountToDSID:(id)a3;
- (void)checkEnoughDiskSpaceToBeFunctional;
- (void)dealloc;
- (void)jetsamCloudDocsApps;
- (void)markMigrationCompletedForDSID:(id)a3;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)reloadSyncedFolderPolicies;
- (void)reloadSyncedFolderPoliciesDisableiCloudDesktop:(BOOL)a3;
- (void)setDoesNotHaveEnoughDiskSpaceToBeFunctional:(BOOL)a3;
- (void)setLoggedOutError:(id)a3;
- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 completion:(id)a6;
- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 shouldPostAccountChangedNotification:(BOOL)a6 completion:(id)a7;
- (void)setSyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4;
- (void)startAndLoadAccountSynchronously:(id)a3;
- (void)ubiquityTokenSalt;
@end

@implementation BRCAccountHandler

+ (id)currentiCloudAccount
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = objc_msgSend(v3, "br_accountForCurrentPersona");
  v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountHandler currentiCloudAccount]();
  }

  if (v4)
  {
    if (([v4 isEnabledForDataclass:*MEMORY[0x263EFB4C0]] & 1) == 0)
    {
      v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountHandler currentiCloudAccount]();
      }
    }
    if ((objc_msgSend(v4, "br_isEnabledForCloudDocs") & 1) == 0)
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountHandler currentiCloudAccount]();
      }
    }
    v11 = objc_msgSend(v4, "br_dsid");
    [a1 _migrateAccountIfNecessaryForAccountDSID:v11];
  }
  return v4;
}

- (BRCAccountSessionFPFS)session
{
  return self->_session;
}

- (id)ubiquityTokenSalt
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  ubiquityTokenSalt = v2->_ubiquityTokenSalt;
  if (ubiquityTokenSalt)
  {
    v4 = ubiquityTokenSalt;
LABEL_5:
    int v14 = 0;
    goto LABEL_6;
  }
  v5 = NSURL;
  v6 = [(BRCAccountHandler *)v2 accountPath];
  v7 = [v5 fileURLWithPath:v6 isDirectory:1];

  v8 = [NSString ubiquityTokenSaltFilename];
  v9 = [v7 URLByAppendingPathComponent:v8];

  id v42 = 0;
  uint64_t v10 = [NSString stringWithContentsOfURL:v9 encoding:4 error:&v42];
  id v11 = v42;
  v12 = v2->_ubiquityTokenSalt;
  v2->_ubiquityTokenSalt = (NSString *)v10;

  v13 = v2->_ubiquityTokenSalt;
  if (v13)
  {
    v4 = v13;

    goto LABEL_5;
  }
  v16 = [v11 domain];
  if (![v16 isEqualToString:*MEMORY[0x263F07F70]])
  {

    goto LABEL_15;
  }
  BOOL v17 = [v11 code] == 260;

  if (!v17)
  {
LABEL_15:
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler ubiquityTokenSalt]();
    }

    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler ubiquityTokenSalt]();
    }
  }
  v22 = brc_bread_crumbs();
  v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v22;
    _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] generating new ubiquity token%@", buf, 0xCu);
  }

  v24 = [MEMORY[0x263F08C38] UUID];
  uint64_t v25 = [v24 UUIDString];
  v26 = v2->_ubiquityTokenSalt;
  v2->_ubiquityTokenSalt = (NSString *)v25;

  v27 = [MEMORY[0x263F08850] defaultManager];
  id v41 = v11;
  char v28 = [v27 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v41];
  v4 = v41;

  if (v28)
  {
    v29 = v2->_ubiquityTokenSalt;
    v40 = v4;
    BOOL v30 = [(NSString *)v29 writeToURL:v9 atomically:1 encoding:4 error:&v40];
    v31 = v40;

    if (v30)
    {
      v4 = dispatch_get_global_queue(0, 0);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __38__BRCAccountHandler_ubiquityTokenSalt__block_invoke;
      v38[3] = &unk_26507ED70;
      id v39 = v9;
      id v32 = v9;
      dispatch_async(v4, v38);
    }
    else
    {
      v4 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v37 = [v9 path];
        *(_DWORD *)buf = 138412802;
        v44 = v37;
        __int16 v45 = 2112;
        v46 = v31;
        __int16 v47 = 2112;
        v48 = v4;
        _os_log_error_impl(&dword_23FA42000, v35, (os_log_type_t)0x90u, "[ERROR] failed writing salt data to '%@': %@%@", buf, 0x20u);
      }
    }
  }
  else
  {
    v33 = brc_bread_crumbs();
    v34 = brc_default_log();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      v36 = [v7 path];
      *(_DWORD *)buf = 138412802;
      v44 = v36;
      __int16 v45 = 2112;
      v46 = v4;
      __int16 v47 = 2112;
      v48 = v33;
      _os_log_error_impl(&dword_23FA42000, v34, (os_log_type_t)0x90u, "[ERROR] failed creating salt directory '%@': %@%@", buf, 0x20u);
    }
  }
  int v14 = 1;
LABEL_6:
  objc_sync_exit(v2);

  if (v14) {
    v4 = v2->_ubiquityTokenSalt;
  }
  return v4;
}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (BRCAccountHandler)initWithACAccountID:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BRCAccountHandler;
  v6 = [(BRCAccountHandler *)&v36 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_acAccountID, a3);
    uint64_t v8 = objc_msgSend(NSString, "br_currentSupportDir");
    accountPath = v7->_accountPath;
    v7->_accountPath = (NSString *)v8;

    if (!v7->_accountPath)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Got a nil account path"];
      objc_claimAutoreleasedReturnValue();
      v33 = brc_bread_crumbs();
      v34 = brc_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      v35 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountHandler initWithACAccountID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 299, v35);
    }
    uint64_t v10 = [MEMORY[0x263F841B0] sharedManager];
    id v11 = objc_msgSend(v10, "br_currentPersonaID");

    BRPersonaSpecificName();
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    int v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

    BRPersonaSpecificName();
    id v18 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v19 = dispatch_workloop_create((const char *)[v18 UTF8String]);
    pushWorkloop = v7->_pushWorkloop;
    v7->_pushWorkloop = (OS_dispatch_workloop *)v19;

    BRPersonaSpecificName();
    id v21 = objc_claimAutoreleasedReturnValue();
    v22 = (const char *)[v21 UTF8String];
    v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(v23, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create(v22, v24);

    migrationStatusSetterQueue = v7->_migrationStatusSetterQueue;
    v7->_migrationStatusSetterQueue = (OS_dispatch_queue *)v25;

    v27 = objc_alloc_init(BRCBarrier);
    accountLoadingBarrier = v7->_accountLoadingBarrier;
    v7->_accountLoadingBarrier = v27;

    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
    syncPolicyByFolderType = v7->_syncPolicyByFolderType;
    v7->_syncPolicyByFolderType = (NSMutableDictionary *)v29;

    v31 = [MEMORY[0x263F53C50] sharedConnection];
    [v31 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BRCAccountHandler;
  [(BRCAccountHandler *)&v4 dealloc];
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a4;
  id v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler profileConnectionDidReceiveRestrictionChangedNotification:userInfo:]();
  }
  dispatch_workloop_t v19 = v4;

  v7 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
  uint64_t v8 = [v7 allApplicationIdentifiers];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v14 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
        {
          v15 = [MEMORY[0x263F53C50] sharedConnection];
          char v16 = [v15 isCloudSyncAllowed:v14];

          if ((v16 & 1) == 0)
          {
            BOOL v17 = brc_bread_crumbs();
            id v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              dispatch_queue_t v25 = v14;
              __int16 v26 = 2112;
              v27 = v17;
              _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] jetsaming %@%@", buf, 0x16u);
            }

            BKSTerminateApplicationForReasonAndReportWithDescription();
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }
}

- (BOOL)setDBAccountDSID:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = NSString;
  v7 = [(BRCAccountHandler *)self accountPath];
  uint64_t v8 = objc_msgSend(v6, "brc_accountIDPathForAccountPath:", v7);

  if (v4)
  {
    id v9 = [(BRCAccountHandler *)self accountPath];
    id v24 = 0;
    char v10 = [v5 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v11 = v24;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        -[BRCAccountHandler setDBAccountDSID:]();
      }
    }
    id v23 = v11;
    BOOL v14 = 1;
    char v15 = [v4 writeToFile:v8 atomically:1 encoding:4 error:&v23];
    id v16 = v23;

    if ((v15 & 1) == 0)
    {
      BOOL v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRCAccountHandler setDBAccountDSID:]();
      }

      BOOL v14 = 0;
    }
  }
  else if ((BRCRecursiveRemove(v8) & 0x80000000) != 0)
  {
    int v19 = *__error();
    long long v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler setDBAccountDSID:]();
    }

    id v16 = 0;
    BOOL v14 = 0;
    *__error() = v19;
  }
  else
  {
    id v16 = 0;
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)_cleanupAPFSSnapshotWhenNoSessionExists
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  memset(&v7.f_mntonname[392], 0, 32);
  objc_msgSend(MEMORY[0x263F325A0], "cloudDocsAppSupportURL", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  id v3 = objc_claimAutoreleasedReturnValue();
  int v4 = statfs((const char *)[v3 fileSystemRepresentation], &v7);

  if ((v4 & 0x80000000) == 0)
  {
    id v5 = [NSString stringWithUTF8String:v7.f_mntonname];
    +[BRCAnalyticsReporter cancelSyncConsistencyReportWithMountPath:v5 queue:self->_pushWorkloop];
  }
  return v4 >= 0;
}

- (void)_cleanupPushAndActivitiesStatesWhenNoSessionExists
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx disabling pushes, be sure to listen to activities and the like%@", (void)v3, DWORD2(v3));
}

void __71__BRCAccountHandler__cleanupPushAndActivitiesStatesWhenNoSessionExists__block_invoke()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.bird.disabled-events", v1);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *MEMORY[0x263F280C8];
  v16[0] = *MEMORY[0x263F280D0];
  v16[1] = v3;
  int v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 2, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    statfs v7 = 0;
    uint64_t v8 = *(void *)v13;
    uint64_t v9 = MEMORY[0x263EFFA68];
    do
    {
      uint64_t v10 = 0;
      id v11 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        statfs v7 = (void *)[objc_alloc(MEMORY[0x263F280F0]) initWithEnvironmentName:*(void *)(*((void *)&v12 + 1) + 8 * v10) namedDelegatePort:@"com.apple.bird.push" queue:v2];

        [v7 setEnabledTopics:v9 ignoredTopics:v9 opportunisticTopics:v9];
        [v7 shutdown];
        ++v10;
        id v11 = v7;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)startAndLoadAccountSynchronously:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke;
  id v11 = &unk_26507ED98;
  long long v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, &v8);
  dispatch_async(queue, v7);

  -[BRCAccountHandler _waitForSessionLoadingWhenNowStarting:](self, "_waitForSessionLoadingWhenNowStarting:", 1, v8, v9, v10, v11, v12);
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  dispatch_queue_t v2 = (id *)(a1 + 32);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  if (!+[BRCSystemSupportAnalyzer isCloudDocsSupportedWithError:0])
  {
    *((unsigned char *)*v2 + 9) = 1;
    return;
  }
  uint64_t v3 = (void *)MEMORY[0x263F32598];
  id v4 = [*(id *)(a1 + 32) accountPath];
  uint64_t v5 = objc_msgSend(v3, "brc_dbAccountDSIDForPath:", v4);

  if ([*(id *)(a1 + 40) isEnabledForDataclass:*MEMORY[0x263EFB4C0]])
  {
    objc_msgSend(*(id *)(a1 + 40), "br_dsid");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "br_isEnabledForCloudDocs"))
      {
        dispatch_block_t v7 = *((void *)*v2 + 8);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_2;
        block[3] = &unk_26507ED70;
        id v6 = v6;
        id v49 = v6;
        dispatch_async(v7, block);
      }
      else
      {
        if ((int)BRGetMigrationStatusForDSID() < 2)
        {
          v33 = brc_bread_crumbs();
          v34 = brc_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v6;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v33;
            _os_log_impl(&dword_23FA42000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] migration is not accepted, not loading the account for %@%@", buf, 0x16u);
          }

          [*v2 _cleanupPushAndActivitiesStatesWhenNoSessionExists];
          goto LABEL_55;
        }
        uint64_t v9 = brc_bread_crumbs();
        uint64_t v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] setting the migration on the account because account is migrated - and waiting for ACAccountNotification plugin%@", buf, 0xCu);
        }

        [*v2 setMigrationStatus:2 forDSID:v6 shouldUpdateAccount:1 shouldPostAccountChangedNotification:0 completion:0];
      }
      char v8 = 1;
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
    id v6 = 0;
  }
  char v47 = 0;
  id v11 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", &v47);
  memset(v46, 0, sizeof(v46));
  __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 525, v46);
  long long v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = v46[0];
    v43 = [*v2 accountPath];
    if (v47) {
      v38 = @"DS";
    }
    else {
      v38 = @"not DS";
    }
    id v42 = v38;
    id v39 = objc_msgSend(*(id *)(a1 + 40), "br_personaIdentifier");
    int v40 = [*(id *)(a1 + 40) isDataSeparatedAccount];
    id v41 = @"DS";
    if (!v40) {
      id v41 = @"not DS";
    }
    *(_DWORD *)buf = 134220290;
    *(void *)&uint8_t buf[4] = v37;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v51 = v5;
    __int16 v52 = 2112;
    uint64_t v53 = 0;
    __int16 v54 = 2112;
    v55 = v43;
    __int16 v56 = 2112;
    v57 = v11;
    __int16 v58 = 2112;
    v59 = v42;
    __int16 v60 = 2112;
    v61 = v39;
    __int16 v62 = 2112;
    v63 = v41;
    __int16 v64 = 2112;
    v65 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx loaded system account ID: %@ (db ID: %@, disk ID: %@, path: %@, current persona: %@ (%@), account's persona: %@ (%@))%@", buf, 0x66u);
  }
  if (v5) {
    char v14 = v8;
  }
  else {
    char v14 = 1;
  }
  if (v14)
  {
    if (v5) {
      char v15 = 0;
    }
    else {
      char v15 = v8;
    }
    if (v15)
    {
      id v16 = v6;
      goto LABEL_28;
    }
    if (!v5) {
      goto LABEL_34;
    }
    if ([v5 isEqualToString:v6])
    {
      int v21 = 0;
LABEL_38:
      memset(v45, 0, sizeof(v45));
      __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 573, v45);
      id v24 = brc_bread_crumbs();
      dispatch_queue_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v45[0];
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2112;
        v51 = v24;
        _os_log_debug_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Loading current on-disk account: %@%@", buf, 0x20u);
      }

      __int16 v26 = brc_bread_crumbs();
      v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_impl(&dword_23FA42000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] using account %@%@", buf, 0x16u);
      }

      id v28 = *v2;
      if (*((void *)*v2 + 6))
      {
        if ([*((id *)*v2 + 6) isEqualToString:v5]) {
          goto LABEL_47;
        }
        id v28 = *v2;
      }
      if ([v28 _loadOnDiskAccountSessionWithError:0])
      {
        objc_storeStrong((id *)*v2 + 6, v5);
        goto LABEL_48;
      }
LABEL_47:
      if (!v21)
      {
LABEL_49:
        __brc_leave_section(v45);
        goto LABEL_50;
      }
LABEL_48:
      BRPostAccountTokenChangedNotification();
      goto LABEL_49;
    }
    v35 = brc_bread_crumbs();
    objc_super v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v51 = v35;
      _os_log_fault_impl(&dword_23FA42000, v36, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: disk account ID (%@) doesn't match system account ID (%@)%@", buf, 0x20u);
    }
  }
  else
  {
    memset(buf, 0, sizeof(buf));
    __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 528, buf);
    BOOL v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_3();
    }

    __brc_leave_section((uint64_t *)buf);
  }
  [*v2 reloadSyncedFolderPoliciesDisableiCloudDesktop:1];
  int v19 = [[BRCAccountSessionFPFS alloc] initWithACAccountID:*((void *)*v2 + 13) dbAccountDSID:v5 salt:0 accountHandler:0];
  [(BRCAccountSessionFPFS *)v19 destroyLocalData];
  id v20 = v6;

LABEL_28:
  if ([*v2 setDBAccountDSID:v6])
  {
    if (v6)
    {
      int v21 = 1;
      uint64_t v5 = v6;
      goto LABEL_38;
    }
  }
  else
  {
    long long v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_2();
    }
  }
LABEL_34:
  [*v2 _cleanupPushAndActivitiesStatesWhenNoSessionExists];
  uint64_t v5 = 0;
LABEL_50:
  [*((id *)*v2 + 4) resumeIfNecessary];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  if ((objc_msgSend(*(id *)(a1 + 40), "br_needsToVerifyTerms") & 1) == 0)
  {
    uint64_t v29 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F05370] code:-1000 userInfo:0];
    BOOL v30 = brc_bread_crumbs();
    v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_1();
    }

    id v32 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_177;
    v44[3] = &unk_26507EBD8;
    v44[4] = *v2;
    [v32 signalErrorResolved:v29 completionHandler:v44];
  }
  __brc_leave_section(v46);

LABEL_55:
}

uint64_t __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = BRGetMigrationStatusForDSID();
  if ((int)result <= 1)
  {
    uint64_t v1 = brc_bread_crumbs();
    dispatch_queue_t v2 = brc_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = v1;
      _os_log_impl(&dword_23FA42000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] setting the migration prefs because account is migrated%@", (uint8_t *)&v3, 0xCu);
    }

    return BRSetMigrationStatusForDSIDInPref();
  }
  return result;
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_177(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 104);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    long long v12 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] signalErrorResolved for %@ finished - %@%@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)jetsamCloudDocsApps
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx jetsaming clients%@", (void)v3, DWORD2(v3));
}

- (void)__destroySession
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: session%@", v2, v3, v4, v5, v6);
}

uint64_t __37__BRCAccountHandler___destroySession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 containerMetadata];
  if ([v3 isInInitialState])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 identifier];
    [v4 addObject:v5];
  }
  return 1;
}

intptr_t __37__BRCAccountHandler___destroySession__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) close];
  uint64_t v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (void)_destroyCurrentSessionSynchronously
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx destroying current session%@", (void)v3, DWORD2(v3));
}

void __38__BRCAccountHandler_ubiquityTokenSalt__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_log_t v2 = (void *)MEMORY[0x2455D97F0]();
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263EFF6B0];
  id v10 = 0;
  char v5 = [v3 setResourceValue:MEMORY[0x263EFFA88] forKey:v4 error:&v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      __int16 v9 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      long long v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] failed excluding salt data at '%@' from backups: %@%@", buf, 0x20u);
    }
  }
}

- (BOOL)checkEnoughDiskSpaceToBeFunctional
{
  os_log_t v2 = [MEMORY[0x263F08850] defaultManager];
  long long v3 = objc_msgSend(NSString, "br_currentSupportDir");
  uint64_t v4 = [v2 attributesOfFileSystemForPath:v3 error:0];

  char v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
  id v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler checkEnoughDiskSpaceToBeFunctional]();
  }

  BOOL v10 = 1;
  if (v5)
  {
    uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
    unint64_t v9 = [v8 minimumDiskSpaceRequiredToBeFunctional];

    if ([v5 unsignedLongLongValue] < v9) {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unsigned)_handleOpenError:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((objc_msgSend(v4, "brc_isOutOfSpaceError") & 1) != 0
    || (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 85) & 1) != 0
    || ![(BRCAccountHandler *)self checkEnoughDiskSpaceToBeFunctional])
  {
    uint64_t v8 = brc_bread_crumbs();
    unsigned __int8 v7 = 1;
    unint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _handleOpenError:]();
    }

    self->_doesNotHaveEnoughDiskSpaceToBeFunctional = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 121))
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _handleOpenError:]();
    }

    unsigned __int8 v7 = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 99))
  {
    __int16 v11 = brc_bread_crumbs();
    long long v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _handleOpenError:]();
    }

    unsigned __int8 v7 = 5;
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "br_isCloudDocsErrorCode:", 81) & 1) == 0
    && !objc_msgSend(v4, "br_isCloudDocsErrorCode:", 92))
  {
    goto LABEL_29;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  __int16 v13 = [v4 underlyingErrors];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (!v14) {
    goto LABEL_28;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v50 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (objc_msgSend(v18, "br_isPOSIXErrorCode:", 13))
      {
        __int16 v26 = brc_bread_crumbs();
        v27 = brc_default_log();
        unsigned __int8 v7 = 2;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.6();
        }
LABEL_50:

LABEL_51:
        goto LABEL_11;
      }
      if (objc_msgSend(v18, "br_isNSXPCConnectionError"))
      {
        __int16 v26 = brc_bread_crumbs();
        v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.7();
        }
        goto LABEL_49;
      }
      if (objc_msgSend(v18, "fp_isFileProviderError:", -2001))
      {
        __int16 v26 = brc_bread_crumbs();
        v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.8();
        }
LABEL_49:
        unsigned __int8 v7 = 5;
        goto LABEL_50;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
  }
  while (v15);
LABEL_28:

LABEL_29:
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 116))
  {
    int v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v4;
      __int16 v57 = 2112;
      __int16 v58 = v19;
      _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got %@ while opening account. Exiting without an error%@", buf, 0x16u);
    }

    unsigned __int8 v7 = 2;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "br_isCloudDocsErrorCode:", 100)) {
    goto LABEL_64;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  __int16 v13 = [v4 underlyingErrors];
  uint64_t v21 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (!v21) {
    goto LABEL_63;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v46;
LABEL_36:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v46 != v23) {
      objc_enumerationMutation(v13);
    }
    dispatch_queue_t v25 = *(void **)(*((void *)&v45 + 1) + 8 * v24);
    if (objc_msgSend(v25, "br_isCocoaErrorCode:", 4101)) {
      break;
    }
    if (v22 == ++v24)
    {
      uint64_t v22 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (!v22) {
        goto LABEL_63;
      }
      goto LABEL_36;
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [v25 underlyingErrors];
  uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (!v28) {
    goto LABEL_62;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v42;
  uint64_t v31 = *MEMORY[0x263F8C730];
  while (2)
  {
    uint64_t v32 = 0;
    while (2)
    {
      if (*(void *)v42 != v30) {
        objc_enumerationMutation(obj);
      }
      v33 = *(void **)(*((void *)&v41 + 1) + 8 * v32);
      if ((objc_msgSend(v33, "fp_isFileProviderInternalError:", 12) & 1) != 0
        || ([v33 domain],
            v34 = objc_claimAutoreleasedReturnValue(),
            int v35 = [v34 isEqualToString:v31],
            v34,
            v35))
      {
        objc_super v36 = brc_bread_crumbs();
        uint64_t v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.4();
        }

        unsigned __int8 v7 = 5;
        goto LABEL_71;
      }
      if (objc_msgSend(v33, "br_isPOSIXErrorCode:", 28))
      {
        v38 = brc_bread_crumbs();
        unsigned __int8 v7 = 1;
        id v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.5();
        }

        self->_doesNotHaveEnoughDiskSpaceToBeFunctional = 1;
LABEL_71:

        goto LABEL_51;
      }
      if (v29 != ++v32) {
        continue;
      }
      break;
    }
    uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v29) {
      continue;
    }
    break;
  }
LABEL_62:

LABEL_63:
LABEL_64:
  unsigned __int8 v7 = 6;
LABEL_11:

  return v7;
}

- (id)waitForSessionDBLoadingBarrier
{
  id location = 0;
  [(BRCBarrier *)self->_accountLoadingBarrier waitForBarrier];
  long long v3 = self->_accountLoadingBarrier;
  objc_sync_enter(v3);
  WeakRetained = (BRCAccountSessionFPFS *)objc_loadWeakRetained((id *)&self->_loadingSession);
  session = WeakRetained;
  if (!WeakRetained) {
    session = self->_session;
  }
  objc_storeWeak(&location, session);

  objc_sync_exit(v3);
  id v6 = objc_loadWeakRetained(&location);
  unsigned __int8 v7 = [v6 dbLoadingBarrier];
  [v7 waitForBarrier];

  id v8 = objc_loadWeakRetained(&location);
  objc_destroyWeak(&location);
  return v8;
}

- (unsigned)_tryToOpenSession:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned __int8 v7 = self->_accountLoadingBarrier;
  objc_sync_enter(v7);
  objc_storeWeak((id *)&self->_loadingSession, v6);
  objc_sync_exit(v7);

  [(BRCBarrier *)self->_accountLoadingBarrier signalBarrier];
  v17[0] = 0;
  char v8 = [v6 openWithError:v17 pushWorkloop:self->_pushWorkloop];
  id v9 = v17[0];
  if (v8)
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    __int16 v11 = brc_bread_crumbs();
    long long v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler _tryToOpenSession:error:].cold.4();
    }

    unsigned __int8 v10 = [(BRCAccountHandler *)self _handleOpenError:v9];
    id v9 = v9;
    if (v9)
    {
      __int16 v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        uint64_t v16 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v19 = "-[BRCAccountHandler _tryToOpenSession:error:]";
        __int16 v20 = 2080;
        if (!a4) {
          uint64_t v16 = "(ignored by caller)";
        }
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        id v23 = v9;
        __int16 v24 = 2112;
        dispatch_queue_t v25 = v13;
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }
  return v10;
}

- (BOOL)_shouldRetryOpenSession:(unsigned __int8)a3
{
  return a3 == 6 || (a3 & 0xFE) == 4;
}

- (BOOL)_shouldResetLocalData:(id)a3
{
  return objc_msgSend(a3, "br_isCloudDocsErrorCode:", 100);
}

- (BOOL)_loadOnDiskAccountSessionWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = [BRCAccountSessionFPFS alloc];
  acAccountID = self->_acAccountID;
  id v6 = (void *)MEMORY[0x263F32598];
  unsigned __int8 v7 = [(BRCAccountHandler *)self accountPath];
  char v8 = objc_msgSend(v6, "brc_dbAccountDSIDForPath:", v7);
  id v9 = [(BRCAccountHandler *)self ubiquityTokenSalt];
  unsigned __int8 v10 = [(BRCAccountSessionFPFS *)v4 initWithACAccountID:acAccountID dbAccountDSID:v8 salt:v9 accountHandler:self];

  id v32 = 0;
  uint64_t v11 = [(BRCAccountHandler *)self _tryToOpenSession:v10 error:&v32];
  id v12 = v32;
  if (!v11) {
    goto LABEL_4;
  }
  if (![(BRCAccountHandler *)self _shouldRetryOpenSession:v11])
  {
    if ([(BRCAccountHandler *)self _shouldResetLocalData:v12])
    {
      [(BRCAccountSessionFPFS *)v10 closeAndResetLocalStateWithDescription:@"Reset Local State" error:v12];
    }
    else
    {
      [(BRCAccountSessionFPFS *)v10 close];
      uint64_t v18 = brc_bread_crumbs();
      int v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v12;
        __int16 v35 = 2112;
        objc_super v36 = v18;
        _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Capturing account session open error of the first try: %@%@", buf, 0x16u);
      }

      [(BRCAccountSessionFPFS *)v10 captureSessionOpenFailedInfoWithError:v12];
    }
    if (v11 == 2)
    {
      v27 = brc_bread_crumbs();
      uint64_t v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
      }

      exit(0);
    }
    if (v11 == 3)
    {
      __int16 v20 = [v12 userInfo];
      uint64_t v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      __int16 v22 = [v12 userInfo];
      uint64_t v23 = [v22 objectForKeyedSubscript:@"SqliteSQL"];

      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Unable to open account: %@ (underlying: %@, sql: %@)\n", v12, v21, v23];
      objc_claimAutoreleasedReturnValue();
      __int16 v24 = brc_bread_crumbs();
      dispatch_queue_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      uint64_t v26 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountHandler _loadOnDiskAccountSessionWithError:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 1133, v26);
    }
    if (v11 != 1)
    {
      uint64_t v30 = brc_bread_crumbs();
      uint64_t v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
      }
    }
    goto LABEL_21;
  }
  if (![(BRCAccountHandler *)self _loadOnDiskAccountSessionSecondTry:v10 prevError:v12])
  {
LABEL_21:
    uint64_t v15 = self->_accountLoadingBarrier;
    objc_sync_enter(v15);
    objc_storeWeak((id *)&self->_loadingSession, 0);
    objc_sync_exit(v15);
    BOOL v17 = 0;
    goto LABEL_22;
  }
LABEL_4:
  __int16 v13 = self->_accountLoadingBarrier;
  objc_sync_enter(v13);
  objc_storeStrong((id *)&self->_session, v10);
  objc_storeWeak((id *)&self->_loadingSession, 0);
  objc_sync_exit(v13);

  id v14 = [(BRCAccountHandler *)self ubiquityTokenSalt];
  [(BRCAccountHandler *)self reloadSyncedFolderPolicies];
  brc_bread_crumbs();
  uint64_t v15 = (BRCBarrier *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
  }

  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)_loadOnDiskAccountSessionSecondTry:(id)a3 prevError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v38 = brc_bread_crumbs();
    id v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]0();
    }
  }
  if (objc_msgSend(v7, "br_isCloudDocsErrorCode:", 81))
  {
    char v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.7();
    }
    char v10 = 0;
    uint64_t v11 = @"CreateFPFSDomain";
  }
  else if (objc_msgSend(v7, "br_isCloudDocsErrorCode:", 92))
  {
    char v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.8();
    }
    char v10 = 0;
    uint64_t v11 = @"ImportFPFSDomain";
  }
  else
  {
    [v6 closeAndResetLocalStateWithDescription:@"Cannot open account session" error:v7];
    char v8 = brc_bread_crumbs();
    char v10 = 1;
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.9();
    }
    uint64_t v11 = 0;
  }

  id v50 = 0;
  unsigned int v12 = [(BRCAccountHandler *)self _tryToOpenSession:v6 error:&v50];
  id v13 = v50;
  if (v12)
  {
    char v46 = v10;
    long long v47 = v11;
    long long v48 = v6;
    id v45 = v7;
    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.6();
    }

    uint64_t v16 = [MEMORY[0x263EFF980] array];
    long long v49 = self;
    BOOL v17 = [(BRCAccountHandler *)self accountPath];
    uint64_t v18 = [v17 stringByAppendingPathComponent:*MEMORY[0x263F32468]];

    for (uint64_t i = 0; i != 5; ++i)
    {
      id v20 = v18;
      uint64_t v21 = open((const char *)[v20 fileSystemRepresentation], 4);
      __int16 v22 = NSString;
      if ((v21 & 0x80000000) != 0)
      {
        uint64_t v23 = __error();
        objc_msgSend(v22, "stringWithFormat:", @"#%lu FAIL %s", i, strerror(*v23));
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"#%lu fd = %d", i, v21);
      __int16 v24 = };
      [v16 addObject:v24];
    }
    dispatch_queue_t v25 = v47;
    id v6 = v48;
    if (v46)
    {
      if (objc_msgSend(v13, "br_isCloudDocsErrorCode:", 81))
      {
        dispatch_queue_t v25 = @"CreateFPFSDomain";
      }
      else
      {
        if (!objc_msgSend(v13, "br_isCloudDocsErrorCode:", 92)) {
          goto LABEL_27;
        }
        dispatch_queue_t v25 = @"ImportFPFSDomain";
      }
    }
    uint64_t v26 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v26 captureLogsForOperationType:@"OpenAccountSession" ofSubtype:v25 forError:v13 underlyingError:0 waitForCompletion:1];

LABEL_27:
    v27 = [v13 userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    uint64_t v29 = [v13 userInfo];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"SqliteSQL"];

    if ([(BRCAccountHandler *)v49 _shouldResetLocalData:v13])
    {
      [v48 closeAndResetLocalStateWithDescription:@"Reset Local State" error:v13];
    }
    else
    {
      [v48 close];
      uint64_t v31 = brc_bread_crumbs();
      id v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
        -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.5();
      }

      [v48 captureSessionOpenFailedInfoWithError:v13];
    }
    if (v12 <= 6)
    {
      if (((1 << v12) & 0x12) != 0)
      {
LABEL_39:
        if (v49->_doesNotHaveEnoughDiskSpaceToBeFunctional)
        {
          __int16 v35 = brc_bread_crumbs();
          objc_super v36 = brc_default_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]();
          }
        }
        id v7 = v45;
        goto LABEL_44;
      }
      if (((1 << v12) & 0x24) != 0)
      {
        int v40 = brc_bread_crumbs();
        long long v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
        }

        exit(0);
      }
      if (((1 << v12) & 0x48) != 0)
      {
        abc_report_panic_with_signature();
        [NSString stringWithFormat:@"Still unable to open account after attempted reset: %@ (underlying: %@, sql: %@)\nopen result: %@", v13, v28, v30, v16];
        objc_claimAutoreleasedReturnValue();
        long long v42 = brc_bread_crumbs();
        long long v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSessionFPFS(BRCDatabaseManager) _startWatcher]();
        }

        brc_append_system_info_to_message();
        long long v44 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
        __assert_rtn("-[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 1231, v44);
      }
    }
    v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]();
    }

    goto LABEL_39;
  }
LABEL_44:

  return v12 == 0;
}

- (BOOL)_createCurrentAccountSessionWithID:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCAccountHandler _createCurrentAccountSessionWithID:error:]", 1248, v23);
  id v7 = brc_bread_crumbs();
  char v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = v23[0];
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating account session for %@%@", buf, 0x20u);
  }

  if (self->_session)
  {
    uint64_t v18 = brc_bread_crumbs();
    int v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _createCurrentAccountSessionWithID:error:]();
    }

    if (self->_session)
    {
      id v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = (uint64_t)session;
        __int16 v26 = 2112;
        id v27 = v20;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] we are already logged in %@%@", buf, 0x16u);
      }

      [(BRCAccountHandler *)self _destroyCurrentSessionSynchronously];
    }
  }
  id v9 = (void *)MEMORY[0x263F32598];
  char v10 = [(BRCAccountHandler *)self accountPath];
  uint64_t v11 = objc_msgSend(v9, "brc_dbAccountDSIDForPath:", v10);
  if (v11)
  {
    unsigned int v12 = (void *)MEMORY[0x263F32598];
    id v13 = [(BRCAccountHandler *)self accountPath];
    id v14 = objc_msgSend(v12, "brc_dbAccountDSIDForPath:", v13);
    LOBYTE(v12) = [v14 isEqualToString:v6];

    if (v12) {
      goto LABEL_10;
    }
    char v10 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _createCurrentAccountSessionWithID:error:]();
    }
  }
LABEL_10:
  if ([(BRCAccountHandler *)self setDBAccountDSID:v6]) {
    BOOL v16 = [(BRCAccountHandler *)self _loadOnDiskAccountSessionWithError:a4];
  }
  else {
    BOOL v16 = 0;
  }
  __brc_leave_section(v23);

  return v16;
}

- (void)_handleAccountWillChange
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [_dbAccountDSID isEqualToString:_session.accountDSID]%@", v2, v3, v4, v5, v6);
}

- (void)_handleAccountDidChange
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] can't create account session: %@%@");
}

+ (void)_migrateAccountIfNecessaryForAccountDSID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((int)BRGetMigrationStatusForDSID() <= 1)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Asking account status for %@%@", (uint8_t *)&v10, 0x16u);
    }

    uint8_t v6 = [(BRCAccountOnlinePerformer *)[BRCAccountMigrationChecker alloc] initWithDSID:v3];
    [(BRCAccountOnlinePerformer *)v6 resumeAndAutoClose];
  }
  if (BRGetMigrationStatusForDSID() == 2)
  {
    id v7 = brc_bread_crumbs();
    char v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Triggering migration for %@%@", (uint8_t *)&v10, 0x16u);
    }

    id v9 = [(BRCAccountOnlinePerformer *)[BRCAccountMigrator alloc] initWithDSID:v3];
    [(BRCAccountOnlinePerformer *)v9 resumeAndAutoClose];
  }
}

+ (id)currentiCloudAccountID
{
  uint64_t v2 = [a1 currentiCloudAccount];
  id v3 = objc_msgSend(v2, "br_dsid");

  return v3;
}

- (BOOL)waitForSessionLoading
{
  return [(BRCAccountHandler *)self _waitForSessionLoadingWhenNowStarting:0];
}

- (BOOL)_waitForSessionLoadingWhenNowStarting:(BOOL)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (self->_finishedLoading) {
    return 1;
  }
  if (!a3 && !self->_startedLoading) {
    return 0;
  }
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_231);
  if (self->_finishedLoading) {
    return 1;
  }
  uint8_t v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountHandler _waitForSessionLoadingWhenNowStarting:]();
  }

  return self->_finishedLoading;
}

- (BOOL)destroyCurrentAccountSynchronously
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263F32598], "brc_dbAccountDSIDForPath:", self->_accountPath);
  if (v3)
  {
    uint64_t v4 = [[BRCAccountSessionFPFS alloc] initWithACAccountID:self->_acAccountID dbAccountDSID:v3 salt:0 accountHandler:0];
    [(BRCAccountSessionFPFS *)v4 preventDatabaseFromBeingReused];
    uint64_t v5 = NSString;
    uint8_t v6 = [(BRCAccountHandler *)self accountPath];
    id v7 = objc_msgSend(v5, "brc_accountIDPathForAccountPath:", v6);

    if ([v7 length] && (BRCRecursiveRemove(v7) & 0x80000000) != 0)
    {
      int v9 = *__error();
      int v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        int v13 = 138413058;
        uint64_t v14 = v3;
        __int16 v15 = 2112;
        BOOL v16 = v7;
        __int16 v17 = 1024;
        int v18 = v9;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] can't remove account belonging to account %@ at %@ %{errno}d%@", (uint8_t *)&v13, 0x26u);
      }

      BOOL v8 = 0;
      *__error() = v9;
    }
    else
    {
      [(BRCAccountSessionFPFS *)v4 destroyLocalData];
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updateAccountToDSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = (BRDSIDString *)a3;
  dbAccountDSID = self->_dbAccountDSID;
  if (dbAccountDSID == v5 || [(BRDSIDString *)dbAccountDSID isEqualToString:v5])
  {
    id v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _updateAccountToDSID:]();
    }
  }
  else
  {
    [(BRCAccountHandler *)self _handleAccountWillChange];
    int v9 = (void *)MEMORY[0x263F32598];
    int v10 = [(BRCAccountHandler *)self accountPath];
    id v7 = objc_msgSend(v9, "brc_dbAccountDSIDForPath:", v10);

    if (!v7 || ([v7 isEqualToString:v5] & 1) != 0) {
      goto LABEL_14;
    }
    if (v5)
    {
      id v11 = brc_bread_crumbs();
      __int16 v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 138412802;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        __int16 v17 = 2112;
        int v18 = v11;
        _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning up previous session belonging to account %@, to make room for new account %@%@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      id v11 = brc_bread_crumbs();
      __int16 v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountHandler _updateAccountToDSID:]();
      }
    }

    [(BRCAccountHandler *)self reloadSyncedFolderPoliciesDisableiCloudDesktop:1];
    if ([(BRCAccountHandler *)self destroyCurrentAccountSynchronously])
    {
LABEL_14:
      objc_storeStrong((id *)&self->_dbAccountDSID, a3);
      self->_hasSetMigrationComplete = 0;
      [(BRCAccountHandler *)self _handleAccountDidChange];
    }
  }
}

- (BOOL)destroySessionSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BRCAccountHandler_destroySessionSynchronously__block_invoke;
  block[3] = &unk_26507ED70;
  void block[4] = self;
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(queue, v4);

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_233);
  return 1;
}

uint64_t __48__BRCAccountHandler_destroySessionSynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountToDSID:0];
}

- (BOOL)createAccountSessionWithDSID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__BRCAccountHandler_createAccountSessionWithDSID_error___block_invoke;
  v10[3] = &unk_26507ED98;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v10);
  dispatch_async(queue, v8);

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_235);
  return 1;
}

uint64_t __56__BRCAccountHandler_createAccountSessionWithDSID_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(a1 + 32) _updateAccountToDSID:*(void *)(a1 + 40)];
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 completion:(id)a6
{
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 shouldPostAccountChangedNotification:(BOOL)a6 completion:(id)a7
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a7;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  dispatch_group_t v13 = dispatch_group_create();
  uint64_t v14 = [MEMORY[0x263EFB210] defaultStore];
  [v14 invalidateAccountForPersonaCache];
  migrationStatusSetterQueue = self->_migrationStatusSetterQueue;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke;
  v35[3] = &unk_26507F608;
  id v39 = v42;
  id v29 = v11;
  id v36 = v29;
  char v40 = a3;
  BOOL v41 = a5;
  id v16 = v14;
  id v37 = v16;
  v38 = v13;
  __int16 v17 = v38;
  int v18 = migrationStatusSetterQueue;
  uint64_t v19 = v35;
  id v20 = (void *)MEMORY[0x2455D97F0]();
  long long v44 = 0uLL;
  uint64_t v45 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_group_async_with_logs", 293, &v44);
  uint64_t v21 = brc_bread_crumbs();
  __int16 v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v44;
    label = dispatch_queue_get_label(v18);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v28;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    long long v47 = v21;
    _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v50 = v44;
  uint64_t v51 = v45;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_group_async_with_logs_block_invoke;
  long long v47 = &unk_26507EE60;
  uint64_t v23 = v18;
  long long v48 = v23;
  __int16 v24 = v19;
  id v49 = v24;
  dispatch_group_async(v17, v23, block);

  uint64_t v25 = dispatch_get_global_queue(0, 0);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_238;
  v31[3] = &unk_26507F630;
  id v32 = v12;
  v33 = v42;
  BOOL v34 = a6;
  v31[4] = self;
  id v26 = v12;
  dispatch_group_notify(v17, v25, v31);

  _Block_object_dispose(v42, 8);
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = BRSetMigrationStatusForDSIDInPref() != 0;
  if (*(unsigned char *)(a1 + 65) && *(char *)(a1 + 64) >= 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "br_accountForCurrentPersona");
    id v3 = objc_msgSend(v2, "br_dsid");
    if ([v3 isEqualToString:*(void *)(a1 + 32)])
    {
      if (objc_msgSend(v2, "br_isCloudDocsMigrated"))
      {
        dispatch_block_t v4 = brc_bread_crumbs();
        id v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_cold_1();
        }
      }
      else
      {
        objc_msgSend(v2, "br_setCloudDocsMigrated:", 1);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        int v9 = *(void **)(a1 + 40);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_236;
        v11[3] = &unk_26507F5E0;
        id v12 = v2;
        id v13 = *(id *)(a1 + 48);
        [v9 saveVerifiedAccount:v12 withCompletionHandler:v11];

        dispatch_block_t v4 = v12;
      }
    }
    else
    {
      if (v2)
      {
        dispatch_block_t v4 = brc_bread_crumbs();
        uint8_t v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          uint64_t v7 = [v3 UTF8String];
          uint64_t v8 = [*(id *)(a1 + 32) UTF8String];
          *(_DWORD *)buf = 136315650;
          uint64_t v15 = v7;
          __int16 v16 = 2080;
          uint64_t v17 = v8;
          __int16 v18 = 2112;
          uint64_t v19 = v4;
          _os_log_fault_impl(&dword_23FA42000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: the main account (%s) doesn't match the one we have (%s)%@", buf, 0x20u);
        }
      }
      else
      {
        dispatch_block_t v4 = brc_bread_crumbs();
        uint8_t v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [*(id *)(a1 + 32) UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v15 = v10;
          __int16 v16 = 2112;
          uint64_t v17 = (uint64_t)v4;
          _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] we seem to have logged out while migrating account (%s)%@", buf, 0x16u);
        }
      }
    }
  }
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_236(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_236_cold_1();
    }
  }
  else
  {
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_error_impl(&dword_23FA42000, v7, (os_log_type_t)0x90u, "[ERROR] can't set the migrated bit on %@: %@%@", (uint8_t *)&v9, 0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_238(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(unsigned char *)(a1 + 56)
    && *(void *)(*(void *)(a1 + 32) + 32))
  {
    BRPostAccountTokenChangedNotification();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)markMigrationCompletedForDSID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke;
  v16[3] = &unk_26507ED98;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = v5;
  uint64_t v8 = v16;
  int v9 = (void *)MEMORY[0x2455D97F0]();
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v18);
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v18;
    label = dispatch_queue_get_label(v7);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v14;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    uint64_t v21 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v24 = v18;
  uint64_t v25 = v19;
  *(void *)block = MEMORY[0x263EF8330];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke;
  uint64_t v21 = &unk_26507EE60;
  id v12 = v7;
  __int16 v22 = v12;
  __int16 v13 = v8;
  id v23 = v13;
  dispatch_async(v12, block);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFB210] defaultStore];
  id v3 = v2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    objc_msgSend(v2, "br_accountForCurrentPersona");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = objc_msgSend(v4, "br_dsid");
    if ([v5 isEqualToString:*(void *)(a1 + 40)])
    {
      if (objc_msgSend(v4, "br_isCloudDocsMigrationComplete")
        && objc_msgSend(v4, "br_isCloudDocsMigrated"))
      {
        id v6 = brc_bread_crumbs();
        uint64_t v7 = brc_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_cold_1();
        }

        *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
        BRPostAccountTokenChangedNotification();
      }
      else
      {
        uint64_t v10 = brc_bread_crumbs();
        __int16 v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = (uint64_t)v5;
          __int16 v23 = 2112;
          uint64_t v24 = (uint64_t)v10;
          _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] setting migration complete on %@%@", buf, 0x16u);
        }

        objc_msgSend(v4, "br_setCloudDocsMigrationComplete:", 1);
        objc_msgSend(v4, "br_setCloudDocsMigrated:", 1);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_239;
        v18[3] = &unk_26507F5E0;
        uint64_t v12 = *(void *)(a1 + 32);
        id v19 = v4;
        uint64_t v20 = v12;
        id v4 = v4;
        [v3 saveVerifiedAccount:v4 withCompletionHandler:v18];
      }
    }
    else
    {
      if (!v4)
      {
        __int16 v13 = brc_bread_crumbs();
        uint64_t v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [*(id *)(a1 + 40) UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v22 = v15;
          __int16 v23 = 2112;
          uint64_t v24 = (uint64_t)v13;
          _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] we seem to have logged out while migrating account (%s)%@", buf, 0x16u);
        }

        goto LABEL_16;
      }
      uint64_t v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v16 = [v5 UTF8String];
        uint64_t v17 = [*(id *)(a1 + 40) UTF8String];
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        uint64_t v26 = v8;
        _os_log_fault_impl(&dword_23FA42000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: the main account (%s) doesn't match the one we have (%s)%@", buf, 0x20u);
      }
    }
    __int16 v13 = v5;
    id v5 = v4;
LABEL_16:
  }
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_239(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 72) = 1;
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_239_cold_1();
    }

    BRPostAccountTokenChangedNotification();
  }
  else
  {
    uint64_t v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] can't set the migrated bit on %@: %@%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)reloadSyncedFolderPolicies
{
}

- (void)reloadSyncedFolderPoliciesDisableiCloudDesktop:(BOOL)a3
{
  [(BRCAccountHandler *)self setSyncPolicy:-1 forSyncedFolderType:1];
  BRPostAccountTokenChangedNotification();
}

- (int64_t)syncPolicyforSyncedFolderType:(unint64_t)a3
{
  if (a3 != 1)
  {
    uint64_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  syncPolicyByFolderType = self->_syncPolicyByFolderType;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)syncPolicyByFolderType objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  int64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (void)setSyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4
{
  if (a3 != -1 && a3 != 1)
  {
    uint64_t v7 = brc_bread_crumbs();
    int64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler setSyncPolicy:forSyncedFolderType:]();
    }
  }
  if (a4 != 1)
  {
    uint64_t v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  int v9 = [NSNumber numberWithInteger:a3];
  syncPolicyByFolderType = self->_syncPolicyByFolderType;
  int v11 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)syncPolicyByFolderType setObject:v9 forKeyedSubscript:v11];
}

- (BOOL)doesNotHaveEnoughDiskSpaceToBeFunctional
{
  return self->_doesNotHaveEnoughDiskSpaceToBeFunctional;
}

- (void)setDoesNotHaveEnoughDiskSpaceToBeFunctional:(BOOL)a3
{
  self->_doesNotHaveEnoughDiskSpaceToBeFunctional = a3;
}

- (NSString)acAccountID
{
  return self->_acAccountID;
}

- (NSString)accountPath
{
  return self->_accountPath;
}

- (OS_dispatch_workloop)pushWorkloop
{
  return self->_pushWorkloop;
}

- (NSError)loggedOutError
{
  return self->_loggedOutError;
}

- (void)setLoggedOutError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedOutError, 0);
  objc_storeStrong((id *)&self->_pushWorkloop, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_accountLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_syncPolicyByFolderType, 0);
  objc_storeStrong((id *)&self->_migrationStatusSetterQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dbAccountDSID, 0);
  objc_destroyWeak((id *)&self->_loadingSession);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_accountPath, 0);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] received a managed restriction changed notification - %@%@");
}

- (void)setDBAccountDSID:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_13_0(&dword_23FA42000, v0, v1, "[ERROR] can't delete account file %{errno}d%@");
}

- (void)setDBAccountDSID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] can't write account ID: %@%@");
}

- (void)setDBAccountDSID:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] failed to create account path: %@%@");
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(v0 + 104);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Signaling FP to resolve authentication errors for account %@%@", (void)v3, DWORD2(v3));
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: not loading account %@ because we cannot create set account id on disk%@", v1, 0x16u);
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx deleting account on disk%@", (void)v3, DWORD2(v3));
}

- (void)ubiquityTokenSalt
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] failed loading salt: %@%@");
}

- (void)checkEnoughDiskSpaceToBeFunctional
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Disk space available %@%@");
}

- (void)_handleOpenError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] No space on disk%@", v2, v3, v4, v5, v6);
}

- (void)_handleOpenError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Volume not supported by FPFS%@", v2, v3, v4, v5, v6);
}

- (void)_handleOpenError:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Got %@ --> exit without failure.%@");
}

- (void)_handleOpenError:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Got %@ while trying to reimport items under the root container%@");
}

- (void)_handleOpenError:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] No space on disk to reimport items under the root container: %@%@");
}

- (void)_handleOpenError:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> exit without failure%@");
}

- (void)_handleOpenError:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> FP probably crashing -> exit without failure%@");
}

- (void)_handleOpenError:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> something wrong on FP -> exit without failure%@");
}

- (void)_tryToOpenSession:(uint64_t)a3 error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Your database is from the future, disabling iCloud Drive (%@)%@", v4, 0x16u);
}

- (void)_tryToOpenSession:(uint64_t)a3 error:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] %@%@", v4, 0x16u);
}

- (void)_tryToOpenSession:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed to open account session: Exception [%@]%@");
}

- (void)_tryToOpenSession:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed to open account session: %@%@");
}

- (void)_loadOnDiskAccountSessionWithError:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*v1 sessionDirPath];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Starting up at %@%@", v3, 0x16u);
}

- (void)_loadOnDiskAccountSessionWithError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: errorHandlingOnFailure == BRCFail%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionWithError:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Exit bird without panic%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Looks like we hit disk space issue on second try --> don't panic or exit%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: errorHandlingOnFailure == BRCRetryOrFail || errorHandlingOnFailure == BRCFail%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Capturing account session second open error: %@%@");
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.6()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to open account session second time%@", v1, 0xCu);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed adding FPFS domain. Skipping database reset and trying to open again%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Failed import FPFS domain. Skipping database reset and trying to open again%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Local session state has been resetted, try opening the session for the second time%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: prevError%@", v2, v3, v4, v5, v6);
}

- (void)_createCurrentAccountSessionWithID:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [BRDSIDString brc_dbAccountDSIDForPath:self.accountPath] == nil || [[BRDSIDString brc_dbAccountDSIDForPath:self.accountPath] isEqualToString:accountID]%@", v2, v3, v4, v5, v6);
}

- (void)_createCurrentAccountSessionWithID:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _session == nil%@", v2, v3, v4, v5, v6);
}

+ (void)currentiCloudAccount
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] current account is: %@%@");
}

- (void)_waitForSessionLoadingWhenNowStarting:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _finishedLoading%@", v2, v3, v4, v5, v6);
}

- (void)_updateAccountToDSID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Account hasn't really changed, do nothing%@", v2, v3, v4, v5, v6);
}

- (void)_updateAccountToDSID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Cleaning up session on disk belonging to account %@%@");
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] account property is already set%@", v2, v3, v4, v5, v6);
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_236_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] saved the migration bit%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] migration already completed%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_239_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] saved the bit%@", v2, v3, v4, v5, v6);
}

- (void)syncPolicyforSyncedFolderType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: syncPolicy%@", v2, v3, v4, v5, v6);
}

- (void)syncPolicyforSyncedFolderType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: folderType >= BRCSyncedFolderTypeMin && folderType <= BRCSyncedFolderTypeMax%@", v2, v3, v4, v5, v6);
}

- (void)setSyncPolicy:forSyncedFolderType:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: syncPolicy == BRCSyncedFolderPolicyEnabled || syncPolicy == BRCSyncedFolderPolicyDisabled%@", v2, v3, v4, v5, v6);
}

@end