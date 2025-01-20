@interface BRCAccountsManager
+ (id)sharedManager;
- (BOOL)_isDeviceUnlocked;
- (BOOL)_maintainExistingFileProviderDomainsWithAccounts:(id)a3 withError:(id *)a4;
- (BOOL)_readkeepDataLocalOnSignOutForCurrentPersona;
- (BOOL)_waitUntilFileProviderIsReady:(id *)a3;
- (BOOL)cleanupAccountDataForLoggedOutAccountWithPersona:(id)a3;
- (BOOL)destroySessionWithACAccountID:(id)a3;
- (BOOL)isInSyncBubble;
- (BOOL)retrySyncBubbleLaterIfNeededWithError:(id)a3;
- (BOOL)waitForAccountLoadingSynchronouslyIfPossible:(id)a3;
- (BOOL)waitForInitialAccountLoadingSynchronouslyIfPossible;
- (BRCAccountsManager)init;
- (BRCBarrier)accountsLoadingBarrier;
- (id)_createAccountHandlerForAccountID:(id)a3;
- (id)_getEnterpriseProviderManager;
- (id)_getPrimaryProviderManager;
- (id)_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona;
- (id)accountForCurrentPersona;
- (id)accountForPersona:(id)a3;
- (id)accountHandlerForACAccountID:(id)a3;
- (id)accountHandlerForCurrentPersona;
- (id)getMaintainFPDomainsQueue;
- (id)getOrCreateAccountHandlerForACAccount:(id)a3;
- (id)getQueue;
- (id)personaIdentifierForACAccountID:(id)a3;
- (void)_createSyncBubbleTasksIfNecessary;
- (void)_isDeviceUnlocked;
- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:(id)a3;
- (void)_scheduleExistingFileProviderDomainsMaintenanceWithAccounts:(id)a3;
- (void)createAndLoadSessionWithACAccountID:(id)a3 createBlock:(id)a4;
- (void)createSessionWithACAccountID:(id)a3 dsid:(id)a4 completionHandler:(id)a5;
- (void)enumerateAccountHandlerIfFinishedLoading:(id)a3;
- (void)enumerateAccountHandlers:(id)a3;
- (void)keepDataLocalOnSignOutForCurrentPersona:(BOOL)a3;
- (void)loadAccounts;
- (void)updateAccountDisplayName:(id)a3 completionHandler:(id)a4;
- (void)uploadContent;
- (void)waitUntilDeviceIsUnlocked;
- (void)willSwitchUser;
@end

@implementation BRCAccountsManager

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_48);
  }
  v2 = (void *)sharedManager_instance;
  return v2;
}

- (id)accountHandlerForCurrentPersona
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F841B0] sharedManager];
  v4 = [v3 currentPersona];

  v5 = [(BRCAccountsManager *)self accountForPersona:v4];
  v22 = v5;
  if (v5)
  {
    v6 = [v5 identifier];
    id v7 = [(BRCAccountsManager *)self accountHandlerForACAccountID:v6];
  }
  else
  {
    v21 = self->_accountHandlersByACAccountID;
    objc_sync_enter(v21);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v8 = [(NSMutableDictionary *)self->_accountHandlersByACAccountID objectEnumerator];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    id obj = v8;
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v13 = [v12 session];
          if (([v13 isDataSeparated] & 1) == 0 && (objc_msgSend(v4, "isDataSeparatedPersona") & 1) == 0)
          {

LABEL_15:
            v18 = brc_bread_crumbs();
            v19 = brc_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v12;
              __int16 v30 = 2112;
              v31 = v18;
              _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Found account handler %@ by persona match%@", buf, 0x16u);
            }

            id v7 = v12;
            goto LABEL_18;
          }
          v14 = [v12 session];
          v15 = [v14 personaIdentifier];
          v16 = objc_msgSend(v4, "br_personaID");
          int v17 = [v15 isEqualToString:v16];

          if (v17) {
            goto LABEL_15;
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v7 = 0;
LABEL_18:

    objc_sync_exit(v21);
  }

  return v7;
}

- (id)accountForPersona:(id)a3
{
  v3 = (void *)MEMORY[0x263EFB210];
  id v4 = a3;
  v5 = [v3 defaultStore];
  v6 = objc_msgSend(v5, "br_accountForPersona:", v4);

  return v6;
}

- (BOOL)isInSyncBubble
{
  return objc_msgSend(MEMORY[0x263F841B0], "br_isInSyncBubble");
}

- (id)accountForCurrentPersona
{
  v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = objc_msgSend(v2, "br_accountForCurrentPersona");

  return v3;
}

- (BOOL)_isDeviceUnlocked
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 < 0)
  {
    v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(BRCAccountsManager *)(uint64_t)v6 _isDeviceUnlocked];
    }

    return 0;
  }
  else
  {
    v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountsManager _isDeviceUnlocked](v2);
    }

    return v2 == 1;
  }
}

- (BOOL)waitForInitialAccountLoadingSynchronouslyIfPossible
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_finishedLoadingAccounts)
  {
    if (self->_loadAccountsRequested)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke;
      block[3] = &unk_26507ED70;
      block[4] = self;
      dispatch_sync(queue, block);
    }
    else
    {
      id v4 = brc_bread_crumbs();
      v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v4;
        _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Not waiting for initial account loading synchronously since we did not yet kick loadAccounts request%@", buf, 0xCu);
      }

      v6 = +[BRCBuddyFlowObserver sharedBuddyFlowObserver];
      [v6 logStatus];
    }
  }
  return self->_finishedLoadingAccounts;
}

- (id)accountHandlerForACAccountID:(id)a3
{
  id v4 = a3;
  v5 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->_accountHandlersByACAccountID objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

void __35__BRCAccountsManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;
}

- (BRCAccountsManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)BRCAccountsManager;
  int v2 = [(BRCAccountsManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("account-queue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("maintain-fp-domains", v8);

    maintainFPDomainsQueue = v2->_maintainFPDomainsQueue;
    v2->_maintainFPDomainsQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    accountHandlersByACAccountID = v2->_accountHandlersByACAccountID;
    v2->_accountHandlersByACAccountID = (NSMutableDictionary *)v11;

    v13 = objc_alloc_init(BRCBarrier);
    accountsLoadingBarrier = v2->_accountsLoadingBarrier;
    v2->_accountsLoadingBarrier = v13;
  }
  return v2;
}

- (id)getQueue
{
  return self->_queue;
}

- (id)getMaintainFPDomainsQueue
{
  return self->_maintainFPDomainsQueue;
}

- (id)_keepDataLocalOnSignOutDefaultsKeyForCurrentPersona
{
  int v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = objc_msgSend(v2, "br_accountForCurrentPersona");

  id v4 = objc_msgSend(v3, "br_dsid");
  dispatch_queue_t v5 = [@"com.apple.bird.keepDataLocalOnSignOutSetAtTime." stringByAppendingString:v4];

  return v5;
}

- (BOOL)_readkeepDataLocalOnSignOutForCurrentPersona
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = [(BRCAccountsManager *)self _keepDataLocalOnSignOutDefaultsKeyForCurrentPersona];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:v2];
  dispatch_queue_t v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    uint64_t v10 = v2;
    __int16 v11 = 2112;
    v12 = v4;
    __int16 v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Value of %@ user default is: %@%@", (uint8_t *)&v9, 0x20u);
  }

  time_t v7 = time(0);
  LOBYTE(v7) = [v4 longValue] > v7 - 60;

  return v7;
}

- (void)keepDataLocalOnSignOutForCurrentPersona:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(BRCAccountsManager *)self _keepDataLocalOnSignOutDefaultsKeyForCurrentPersona];
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  dispatch_queue_t v5 = v4;
  if (v3)
  {
    v6 = [NSNumber numberWithLong:time(0)];
    [v5 setObject:v6 forKey:v7];
  }
  else
  {
    [v4 removeObjectForKey:v7];
  }
}

- (BOOL)cleanupAccountDataForLoggedOutAccountWithPersona:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  BRPerformWithPersonaAndError();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_6();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    BRPostAccountTokenChangedNotification();
    goto LABEL_28;
  }
  uint64_t v6 = [MEMORY[0x263F841B8] currentPersona];
  uint64_t v7 = [v6 isDataSeparatedPersona];

  uint64_t v8 = [*(id *)(a1 + 32) accountHandlerForCurrentPersona];
  char v9 = [v8 session];
  uint64_t v10 = [v9 fpDomain];
  __int16 v11 = objc_msgSend(MEMORY[0x263F055B8], "br_getProviderManagerForDataSeparated:", v7);
  if (v10)
  {
    id v42 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
  }
  else
  {
    if (v9)
    {
      v40 = brc_bread_crumbs();
      v41 = brc_default_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
        __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_5();
      }
    }
    v12 = [MEMORY[0x263EFB210] defaultStore];
    __int16 v13 = objc_msgSend(v12, "br_accountForCurrentPersona");

    v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_4((uint64_t)v13);
    }

    id v50 = 0;
    uint64_t v10 = objc_msgSend(v11, "br_getFPDomainForAccount:withError:", v13, &v50);
    id v42 = v50;

    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    if (!v10)
    {
      if (v42)
      {
        uint64_t v33 = brc_bread_crumbs();
        v34 = brc_default_log();
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u)) {
          __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_3((uint64_t)v42);
        }

        id v18 = 0;
      }
      else
      {
        v35 = brc_bread_crumbs();
        v36 = brc_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v37 = [0 identifier];
          __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_2(v37, (uint64_t)v35, (uint64_t)v51);
        }

        id v42 = 0;
        id v18 = 0;
        *((unsigned char *)v47 + 24) = 1;
      }
      goto LABEL_14;
    }
  }
  objc_super v16 = brc_bread_crumbs();
  int v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v38 = [v10 identifier];
    v39 = [v10 displayName];
    *(_DWORD *)buf = 138412802;
    v53 = v38;
    __int16 v54 = 2112;
    v55 = v39;
    __int16 v56 = 2112;
    v57 = v16;
    _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing domain: %@, display name: %@%@", buf, 0x20u);
  }
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12;
  v43[3] = &unk_2650805A8;
  id v18 = v10;
  id v44 = v18;
  v45 = &v46;
  objc_msgSend(v11, "br_removeDomain:sync:completionHandler:", v18, 1, v43);

LABEL_14:
  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 destroySessionSynchronously];
    if (!*((unsigned char *)v47 + 24))
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Domain removal failed and we have an account session. Crashing to prevent inconsistent state"];
      objc_claimAutoreleasedReturnValue();
      v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        v21 = brc_append_system_info_to_message();
        __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_1(v21, (uint64_t)v19, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v22 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountsManager cleanupAccountDataForLoggedOutAccountWithPersona:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountsManager.m", 307, v22);
    }
  }
  else
  {
    v23 = objc_msgSend(NSString, "br_currentSupportDir");
    long long v24 = [v23 stringByAppendingPathComponent:*MEMORY[0x263F32468]];

    long long v25 = [v24 stringByAppendingPathComponent:@"db"];
    long long v26 = [MEMORY[0x263F08850] defaultManager];
    int v27 = [v26 fileExistsAtPath:v25];

    if (v27)
    {
      v28 = brc_bread_crumbs();
      v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v30 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v53 = v30;
        __int16 v54 = 2112;
        v55 = v24;
        __int16 v56 = 2112;
        v57 = v28;
        _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Found existing session directory on startup for account with no account handler (persona %@). Removing it %@%@", buf, 0x20u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[BRCFileSystemWrapper recursiveRemove:v24] == 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 8);
  char v32 = *(unsigned char *)(v31 + 24);
  if (v32) {
    char v32 = *((unsigned char *)v47 + 24) != 0;
  }
  *(unsigned char *)(v31 + 24) = v32;
  _Block_object_dispose(&v46, 8);

LABEL_28:
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      v14 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Failed to remove domain %@ - %@%@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12_cold_1(a1, (uint64_t)v6, v7);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)loadAccounts
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Creating sync task%@", v2, v3, v4, v5, v6);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) waitUntilDeviceIsUnlocked];
  uint64_t v2 = (id (**)(void *))MEMORY[0x263F32760];
  *MEMORY[0x263F32768] = _BRBlockRememberPersona;
  void *v2 = _BRActivityBlockRememberPersona;
  v34 = +[BRCUserDefaults defaultsForMangledID:0];
  v36 = [MEMORY[0x263EFB210] defaultStore];
  id v56 = 0;
  v37 = objc_msgSend(v36, "br_allEnabledAppleAccountsIncludingDataSeparated:withError:", 1, &v56);
  id v35 = v56;
  memset(v55, 0, sizeof(v55));
  __brc_create_section(0, (uint64_t)"-[BRCAccountsManager loadAccounts]_block_invoke", 368, v55);
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v30 = v55[0];
    uint64_t v31 = [v37 count];
    *(_DWORD *)buf = 134218754;
    uint64_t v60 = v30;
    __int16 v61 = 2048;
    uint64_t v62 = v31;
    __int16 v63 = 2112;
    id v64 = v35;
    __int16 v65 = 2112;
    v66 = v3;
    _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Loaded %lu system icloud accounts with error: %@%@", buf, 0x2Au);
  }

  if (!v37 || v35)
  {
    int v27 = brc_bread_crumbs();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
      __34__BRCAccountsManager_loadAccounts__block_invoke_cold_1();
    }

    [MEMORY[0x263F32600] exitProcess:0];
  }
  else
  {
    +[BRCUserDefaults loadCachedServerConfiguration];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v5 = v37;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v52 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "br_personaIdentifier");
          uint64_t v44 = MEMORY[0x263EF8330];
          uint64_t v45 = 3221225472;
          uint64_t v46 = __34__BRCAccountsManager_loadAccounts__block_invoke_36;
          v47 = &unk_265081AA8;
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v48 = v9;
          uint64_t v49 = v11;
          id v12 = v5;
          id v50 = v12;
          BRPerformWithPersonaAndError();
        }
        uint64_t v6 = [v12 countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v6);
    }

    [*(id *)(*(void *)(a1 + 32) + 48) signalBarrier];
    long long v43 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v57 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v13);
          }
          int v17 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          id v18 = [v17 identifier];
          v19 = *(void **)(a1 + 32);
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __34__BRCAccountsManager_loadAccounts__block_invoke_37;
          v39[3] = &unk_265084888;
          v39[4] = v19;
          v39[5] = v17;
          [v19 createAndLoadSessionWithACAccountID:v18 createBlock:v39];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v57 count:16];
      }
      while (v14);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    if ([*(id *)(a1 + 32) isInSyncBubble])
    {
      v20 = *(void **)(a1 + 32);
      if (!v20[5])
      {
        char v32 = brc_bread_crumbs();
        uint64_t v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2();
        }

        v20 = *(void **)(a1 + 32);
      }
      [v20 _createSyncBubbleTasksIfNecessary];
      [*(id *)(*(void *)(a1 + 32) + 40) end];
      uint64_t v21 = *(void *)(a1 + 32);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;
    }
    v23 = [v34 serverConfigurationURL];
    long long v24 = [NSURL URLWithString:v23];
    long long v25 = v24;
    if (v24)
    {
      id v26 = v24;
    }
    else
    {
      id v26 = [NSURL fileURLWithPath:v23];
    }
    v29 = v26;

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __34__BRCAccountsManager_loadAccounts__block_invoke_41;
    v38[3] = &unk_26507ED70;
    v38[4] = *(void *)(a1 + 32);
    +[BRCUserDefaults setServerConfigurationURL:v29 whenLoaded:v38];
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    [*(id *)(a1 + 32) _scheduleExistingFileProviderDomainsMaintenanceWithAccounts:v13];
  }
  __brc_leave_section(v55);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_36(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __34__BRCAccountsManager_loadAccounts__block_invoke_36_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 40) _maintainExistingFileProviderDomainsIfNeededWithAccounts:*(void *)(a1 + 48)];
    id v5 = (id)[*(id *)(a1 + 40) getOrCreateAccountHandlerForACAccount:*(void *)(a1 + 32)];
  }
}

id __34__BRCAccountsManager_loadAccounts__block_invoke_37(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getOrCreateAccountHandlerForACAccount:*(void *)(a1 + 40)];
  [v2 startAndLoadAccountSynchronously:*(void *)(a1 + 40)];
  return v2;
}

uint64_t __34__BRCAccountsManager_loadAccounts__block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateAccountHandlers:&__block_literal_global_44];
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 session];
  [v2 userDefaultsChanged];
}

- (id)_getEnterpriseProviderManager
{
  return (id)objc_msgSend(MEMORY[0x263F055B8], "br_getEnterpriseProviderManager");
}

- (id)_getPrimaryProviderManager
{
  return (id)objc_msgSend(MEMORY[0x263F055B8], "br_getPrimaryProviderManager");
}

- (BOOL)_maintainExistingFileProviderDomainsWithAccounts:(id)a3 withError:(id *)a4
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v95 = a3;
  v90 = self;
  if ([(BRCAccountsManager *)self isInSyncBubble])
  {
    BOOL v5 = 1;
    goto LABEL_117;
  }
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]((uint64_t)v95);
  }

  v92 = [(BRCAccountsManager *)self _getEnterpriseProviderManager];
  uint64_t v114 = 0;
  v115[0] = &v114;
  v115[1] = 0x3032000000;
  v115[2] = __Block_byref_object_copy__38;
  v115[3] = __Block_byref_object_dispose__38;
  id v116 = 0;
  id obj = 0;
  uint64_t v8 = objc_msgSend(v92, "br_getFPDomainsWithError:", &obj);
  objc_storeStrong(&v116, obj);
  if (*(void *)(v115[0] + 40))
  {
    int v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]((uint64_t)v115);
    }

    id v11 = *(id *)(v115[0] + 40);
    BOOL v5 = v11 == 0;
    id v12 = v11;
    if (v11)
    {
      id v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v84 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v121 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
        __int16 v122 = 2080;
        if (!a4) {
          v84 = "(ignored by caller)";
        }
        v123 = v84;
        __int16 v124 = 2112;
        id v125 = v12;
        __int16 v126 = 2112;
        v127 = v13;
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (!a4) {
      goto LABEL_108;
    }
    id v15 = v12;
    *a4 = v15;
    goto LABEL_116;
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v93 = v8;
  uint64_t v16 = [v93 countByEnumeratingWithState:&v109 objects:v119 count:16];
  if (!v16) {
    goto LABEL_81;
  }
  uint64_t v18 = *(void *)v110;
  v19 = "(ignored by caller)";
  if (a4) {
    v19 = "(passed to caller)";
  }
  v88 = v19;
  uint64_t v89 = *MEMORY[0x263F08438];
  *(void *)&long long v17 = 138412802;
  long long v87 = v17;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v110 != v18) {
        objc_enumerationMutation(v93);
      }
      uint64_t v21 = *(void **)(*((void *)&v109 + 1) + 8 * v20);
      if (BRIsDefaultDomain()) {
        goto LABEL_69;
      }
      char v108 = 0;
      v22 = [MEMORY[0x263F32570] matchDomainWithAccountAndStampDomainIfNeeded:v21 withAccounts:v95 persistDomain:&v108];
      BOOL v23 = v22 == 0;

      if (!v23)
      {
        if (v108)
        {
          long long v24 = [v21 personaIdentifier];
          v103[1] = (id)MEMORY[0x263EF8330];
          v103[2] = (id)3221225472;
          v103[3] = __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_56;
          v103[4] = &unk_26507F7B0;
          v103[5] = v21;
          id v104 = v92;
          BRPerformWithPersonaAndError();
        }
        goto LABEL_69;
      }
      long long v25 = [v21 personaIdentifier];
      if ([v25 isEqualToString:@"__defaultPersonaID__"])
      {
      }
      else
      {
        id v96 = [v21 personaIdentifier];

        if (v96)
        {
          int v26 = 0;
          goto LABEL_31;
        }
      }
      if (_maintainExistingFileProviderDomainsWithAccounts_withError____personaOnceToken != -1) {
        dispatch_once(&_maintainExistingFileProviderDomainsWithAccounts_withError____personaOnceToken, &__block_literal_global_52);
      }
      id v96 = (id)_maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona;
      int v26 = 1;
LABEL_31:
      int v27 = objc_msgSend(MEMORY[0x263F841B0], "sharedManager", v87);
      v94 = [v27 currentPersona];

      id v107 = 0;
      id v28 = [v94 userPersonaUniqueString];
      v29 = v28;
      if (v28 == v96 || (objc_msgSend(v28, "isEqualToString:") & 1) != 0)
      {
        uint64_t v30 = 0;
        goto LABEL_34;
      }
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v106 = 0;
        uint64_t v46 = (void *)[v94 copyCurrentPersonaContextWithError:&v106];
        v47 = (char *)v106;
        id v48 = v107;
        id v107 = v46;

        if (v47)
        {
          brc_bread_crumbs();
          uint64_t v49 = (char *)objc_claimAutoreleasedReturnValue();
          id v50 = brc_default_log();
          if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412546;
            v121 = v47;
            __int16 v122 = 2112;
            v123 = v49;
            _os_log_error_impl(&dword_23FA42000, v50, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", buf, 0x16u);
          }
        }
        uint64_t v30 = [v94 generateAndRestorePersonaContextWithPersonaUniqueString:v96];

        if (v30)
        {
          long long v51 = brc_bread_crumbs();
          long long v52 = brc_default_log();
          if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
          {
            long long v53 = [v21 personaIdentifier];
            *(_DWORD *)buf = v87;
            v121 = v53;
            __int16 v122 = 2112;
            v123 = v30;
            __int16 v124 = 2112;
            id v125 = v51;
            _os_log_error_impl(&dword_23FA42000, v52, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
          }
LABEL_79:
        }
      }
      else
      {
        if (v26 && ([v94 isDataSeparatedPersona] & 1) == 0)
        {
          long long v51 = brc_bread_crumbs();
          long long v52 = brc_default_log();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v121 = (const char *)v51;
            _os_log_debug_impl(&dword_23FA42000, v52, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", buf, 0xCu);
          }
          uint64_t v30 = 0;
          goto LABEL_79;
        }
        brc_bread_crumbs();
        v59 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v60 = brc_default_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v121 = v59;
          _os_log_debug_impl(&dword_23FA42000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", buf, 0xCu);
        }

        uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:v89 code:22 userInfo:0];
      }
LABEL_34:
      brc_bread_crumbs();
      uint64_t v31 = (char *)objc_claimAutoreleasedReturnValue();
      char v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v121 = (const char *)v21;
        __int16 v122 = 2112;
        v123 = v31;
        _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_INFO, "[INFO] Removing domain %@ since it doesn't have a backing AC account%@", buf, 0x16u);
      }

      v118[1] = 0;
      v118[0] = 0;
      uint64_t v33 = [v21 identifier];
      char v34 = _br_parseUUIDString();

      if ((v34 & 1) == 0)
      {
        if (objc_msgSend(v21, "br_isCiconiaDomain"))
        {
          brc_bread_crumbs();
          long long v41 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v21 identifier];
            *(_DWORD *)buf = 138412546;
            v121 = v45;
            __int16 v122 = 2112;
            v123 = v41;
            _os_log_impl(&dword_23FA42000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] We are removing the ciconia domain %@, not removing account data%@", buf, 0x16u);
          }
        }
        else
        {
          brc_bread_crumbs();
          long long v41 = (char *)objc_claimAutoreleasedReturnValue();
          uint64_t v44 = brc_default_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            __int16 v61 = [v21 identifier];
            *(_DWORD *)buf = 138412546;
            v121 = v61;
            __int16 v122 = 2112;
            v123 = v41;
            _os_log_fault_impl(&dword_23FA42000, v44, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: domain identifier %@ isn't a UUID so not removing account data%@", buf, 0x16u);
          }
        }

        goto LABEL_57;
      }
      id v35 = [MEMORY[0x263F841B0] sharedManager];
      v36 = objc_msgSend(v35, "br_currentPersonaID");
      v37 = [v21 personaIdentifier];
      int v38 = [v36 isEqualToString:v37];

      if (v38)
      {
        brc_bread_crumbs();
        v39 = (char *)objc_claimAutoreleasedReturnValue();
        long long v40 = brc_default_log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v121 = v39;
          _os_log_debug_impl(&dword_23FA42000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] domain's persona still exists, removing account path%@", buf, 0xCu);
        }

        objc_msgSend(NSString, "br_currentSupportDir");
        long long v41 = (char *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          long long v42 = [MEMORY[0x263F08850] defaultManager];
          int v43 = [v42 fileExistsAtPath:v41];

          if (v43) {
            BRCRecursiveRemove(v41);
          }
        }
LABEL_57:
      }
      if ([v21 isDataSeparatedDomain] & 1) != 0 || (objc_msgSend(v21, "isEnterpriseDomain")) {
        int v54 = 1;
      }
      else {
        int v54 = objc_msgSend(v21, "br_isCiconiaDomain");
      }
      v105[0] = MEMORY[0x263EF8330];
      v105[1] = 3221225472;
      v105[2] = __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_55;
      v105[3] = &unk_2650805A8;
      v105[4] = v21;
      v105[5] = &v114;
      objc_msgSend(v92, "br_removeDomain:sync:completionHandler:", v21, v54 ^ 1u, v105);
      v55 = *(void **)(v115[0] + 40);
      if (v55)
      {
        id v56 = v55;
        v57 = brc_bread_crumbs();
        uint64_t v58 = brc_default_log();
        if (os_log_type_enabled(v58, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 136315906;
          v121 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
          __int16 v122 = 2080;
          v123 = v88;
          __int16 v124 = 2112;
          id v125 = v56;
          __int16 v126 = 2112;
          v127 = v57;
          _os_log_error_impl(&dword_23FA42000, v58, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        if (a4) {
          *a4 = v56;
        }
      }
      _BRRestorePersona();

      if (v55)
      {
        BOOL v5 = 0;
        id v15 = v93;
        uint64_t v8 = v93;
        goto LABEL_116;
      }
LABEL_69:
      ++v20;
    }
    while (v16 != v20);
    uint64_t v62 = [v93 countByEnumeratingWithState:&v109 objects:v119 count:16];
    uint64_t v16 = v62;
  }
  while (v62);
LABEL_81:

  __int16 v63 = [(BRCAccountsManager *)v90 _getPrimaryProviderManager];

  id v64 = (id *)(v115[0] + 40);
  v103[0] = *(id *)(v115[0] + 40);
  uint64_t v8 = objc_msgSend(v63, "br_getFPDomainsWithError:", v103);
  objc_storeStrong(v64, v103[0]);

  if (*(void *)(v115[0] + 40))
  {
    __int16 v65 = brc_bread_crumbs();
    v66 = brc_default_log();
    if (os_log_type_enabled(v66, (os_log_type_t)0x90u)) {
      -[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]((uint64_t)v115);
    }

    id v67 = *(id *)(v115[0] + 40);
    BOOL v5 = v67 == 0;
    id v12 = v67;
    if (v67)
    {
      v68 = brc_bread_crumbs();
      v69 = brc_default_log();
      if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
      {
        v85 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v121 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
        __int16 v122 = 2080;
        if (!a4) {
          v85 = "(ignored by caller)";
        }
        v123 = v85;
        __int16 v124 = 2112;
        id v125 = v12;
        __int16 v126 = 2112;
        v127 = v68;
        _os_log_error_impl(&dword_23FA42000, v69, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4)
    {
      id v15 = v12;
      *a4 = v15;
      goto LABEL_115;
    }
    v92 = v63;
LABEL_108:
    id v15 = v12;
  }
  else
  {
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v70 = v8;
    uint64_t v71 = [v70 countByEnumeratingWithState:&v99 objects:v117 count:16];
    if (v71)
    {
      uint64_t v72 = *(void *)v100;
      while (2)
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v100 != v72) {
            objc_enumerationMutation(v70);
          }
          v74 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          if (objc_msgSend(v74, "isReplicated", v87))
          {
            LOBYTE(v118[0]) = 0;
            v75 = [MEMORY[0x263F32570] matchDomainWithAccountAndStampDomainIfNeeded:v74 withAccounts:v95 persistDomain:v118];
            BOOL v76 = v75 == 0;

            if (v76)
            {
              if (([v74 isDataSeparatedDomain] & 1) != 0
                || ([v74 isEnterpriseDomain] & 1) != 0)
              {
                int v78 = 1;
              }
              else
              {
                int v78 = objc_msgSend(v74, "br_isCiconiaDomain");
              }
              v98[0] = MEMORY[0x263EF8330];
              v98[1] = 3221225472;
              v98[2] = __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_58;
              v98[3] = &unk_2650805A8;
              v98[4] = v74;
              v98[5] = &v114;
              objc_msgSend(v63, "br_removeDomain:sync:completionHandler:", v74, v78 ^ 1u, v98);
              v79 = *(void **)(v115[0] + 40);
              if (v79)
              {
                id v80 = v79;
                v81 = brc_bread_crumbs();
                v82 = brc_default_log();
                if (os_log_type_enabled(v82, (os_log_type_t)0x90u))
                {
                  v86 = "(passed to caller)";
                  *(_DWORD *)buf = 136315906;
                  v121 = "-[BRCAccountsManager _maintainExistingFileProviderDomainsWithAccounts:withError:]";
                  __int16 v122 = 2080;
                  if (!a4) {
                    v86 = "(ignored by caller)";
                  }
                  v123 = v86;
                  __int16 v124 = 2112;
                  id v125 = v80;
                  __int16 v126 = 2112;
                  v127 = v81;
                  _os_log_error_impl(&dword_23FA42000, v82, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
                }

                if (a4) {
                  *a4 = v80;
                }

                BOOL v5 = 0;
                goto LABEL_114;
              }
            }
            else if (LOBYTE(v118[0]))
            {
              v77 = [v74 personaIdentifier];
              id v97 = v63;
              BRPerformWithPersonaAndError();
            }
          }
        }
        uint64_t v71 = [v70 countByEnumeratingWithState:&v99 objects:v117 count:16];
        BOOL v5 = 1;
        if (v71) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
LABEL_114:
    id v15 = v70;
    uint64_t v8 = v70;
LABEL_115:
    v92 = v63;
  }
LABEL_116:

  _Block_object_dispose(&v114, 8);
LABEL_117:

  return v5;
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke()
{
  id v2 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona;
  _maintainExistingFileProviderDomainsWithAccounts_withError____personalPersona = v0;
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  BOOL v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Garbage Collected domain %@ with error - %@%@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_56_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 40), "br_addDomain:completionHandler:");
  }
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_57(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_58(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  BOOL v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Garbage Collected domain %@ with error - %@%@", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_56_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 40), "br_addDomain:completionHandler:");
  }
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] Failed persisting the domain %@: %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL maintainedExistingFPDomains = v5->_maintainedExistingFPDomains;
  v5->_BOOL maintainedExistingFPDomains = 1;
  objc_sync_exit(v5);

  if (!maintainedExistingFPDomains)
  {
    id v11 = 0;
    int v7 = [(BRCAccountsManager *)v5 _maintainExistingFileProviderDomainsWithAccounts:v4 withError:&v11];
    id v8 = v11;
    if ((v7 & 1) == 0)
    {
      __int16 v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountsManager _maintainExistingFileProviderDomainsIfNeededWithAccounts:]((uint64_t)v8);
      }
    }
  }
}

- (void)_scheduleExistingFileProviderDomainsMaintenanceWithAccounts:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL maintainedExistingFPDomains = v5->_maintainedExistingFPDomains;
  objc_sync_exit(v5);

  if (!maintainedExistingFPDomains)
  {
    maintainFPDomainsQueue = v5->_maintainFPDomainsQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke;
    v8[3] = &unk_26507ED98;
    v8[4] = v5;
    id v9 = v4;
    dispatch_async(maintainFPDomainsQueue, v8);
  }
}

void __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v11 = 0;
  char v3 = [v2 _waitUntilFileProviderIsReady:&v11];
  id v4 = v11;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_61;
    block[3] = &unk_26507ED98;
    block[4] = v5;
    id v10 = *(id *)(a1 + 40);
    dispatch_sync(v6, block);
  }
  else
  {
    int v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1((uint64_t)v4);
    }
  }
}

uint64_t __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_61(uint64_t a1)
{
  return [*(id *)(a1 + 32) _maintainExistingFileProviderDomainsIfNeededWithAccounts:*(void *)(a1 + 40)];
}

- (void)enumerateAccountHandlers:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  BOOL v23 = __Block_byref_object_copy__38;
  long long v24 = __Block_byref_object_dispose__38;
  id v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke;
  block[3] = &unk_2650816E8;
  block[4] = self;
  void block[5] = &v20;
  dispatch_sync(queue, block);
  uint64_t v6 = [MEMORY[0x263EFB210] defaultStore];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = (id)v21[5];
  uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) acAccountID];
        id v11 = [v6 accountWithIdentifier:v10];

        id v12 = objc_msgSend(v11, "br_personaIdentifier");
        id v14 = v4;
        BRPerformWithPersonaAndError();
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v20, 8);
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke(uint64_t a1)
{
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_enter(obj);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_sync_exit(obj);
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = brc_bread_crumbs();
    uint64_t v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2_cold_1();
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 40) + 16);
    uint64_t v6 = *(void *)(a1 + 40);
    v5(v6, v4);
  }
}

- (void)enumerateAccountHandlerIfFinishedLoading:(id)a3
{
  if (self->_finishedLoadingAccounts) {
    [(BRCAccountsManager *)self enumerateAccountHandlers:a3];
  }
}

- (BOOL)_waitUntilFileProviderIsReady:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[BRCFileProviderDaemonUtils sharedInstance];
  id v13 = 0;
  [v4 waitForFPToBeReadyToAcceptXPCWithError:&v13];
  id v5 = v13;
  char v6 = objc_msgSend(v5, "br_isCloudDocsErrorCode:", 114);
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    if (!v5)
    {
      id v7 = 0;
      char v6 = 1;
      if (!a3) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if ((objc_msgSend(v5, "br_isPOSIXErrorCode:", 4) & 1) == 0)
    {
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
        -[BRCAccountsManager _waitUntilFileProviderIsReady:]((uint64_t)v5);
      }

      exit(1);
    }
    id v7 = v5;
    brc_bread_crumbs();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      id v10 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      long long v15 = "-[BRCAccountsManager _waitUntilFileProviderIsReady:]";
      __int16 v16 = 2080;
      if (!a3) {
        id v10 = "(ignored by caller)";
      }
      long long v17 = v10;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a3) {
LABEL_8:
  }
    *a3 = v7;
LABEL_9:

  return v6;
}

- (void)createAndLoadSessionWithACAccountID:(id)a3 createBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    long long v17 = brc_bread_crumbs();
    __int16 v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:]();
    }
  }
  uint64_t v8 = +[BRCFileProviderDaemonUtils sharedInstance];
  [v8 enableFileProviderBoosting];

  id v26 = 0;
  BOOL v9 = [(BRCAccountsManager *)self _waitUntilFileProviderIsReady:&v26];
  id v10 = v26;
  if (v9)
  {
    uint64_t v20 = 0;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000;
    BOOL v23 = __Block_byref_object_copy__38;
    long long v24 = __Block_byref_object_dispose__38;
    id v25 = 0;
    id v11 = [MEMORY[0x263EFB210] defaultStore];
    id v12 = [v11 accountWithIdentifier:v6];

    id v13 = objc_msgSend(v12, "br_personaIdentifier");
    id v19 = v7;
    BRPerformWithPersonaAndError();

    id v14 = self->_accountHandlersByACAccountID;
    objc_sync_enter(v14);
    [(NSMutableDictionary *)self->_accountHandlersByACAccountID setObject:v21[5] forKeyedSubscript:v6];
    objc_sync_exit(v14);

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    long long v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1((uint64_t)v10);
    }
  }
}

void __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = brc_bread_crumbs();
    uint64_t v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 33))
  {
    uint64_t v1 = brc_bread_crumbs();
    uint64_t v2 = brc_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke_cold_1();
    }
  }
}

- (BOOL)waitForAccountLoadingSynchronouslyIfPossible:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (*(_WORD *)&self->_loadAccountsRequested) {
    goto LABEL_2;
  }
  id v10 = +[BRCFileProviderDaemonUtils sharedInstance];
  char v11 = [v10 boostFileProvider];

  if ((v11 & 1) == 0)
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      id v14 = "[WARNING] We were unsuccessful in boosting FP during the startup flow%@";
      goto LABEL_13;
    }
LABEL_14:

    BOOL v7 = 0;
    goto LABEL_5;
  }
  if (!self->_finishedLoadingAccounts && !self->_loadAccountsRequested)
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      id v14 = "[WARNING] We still aren't in a state where load accounts was requested%@";
LABEL_13:
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
LABEL_2:
  uint64_t v5 = [(BRCAccountsManager *)self accountHandlerForACAccountID:v4];
  char v6 = [v5 finishedLoading];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke;
    block[3] = &unk_265080510;
    p_long long buf = &buf;
    block[4] = self;
    id v16 = v4;
    dispatch_sync(queue, block);
    BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
LABEL_5:

  return v7;
}

void __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) accountHandlerForACAccountID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(v1[1] + 8) + 24) = [v2 finishedLoading];

  if (!*(unsigned char *)(*(void *)(v1[1] + 8) + 24))
  {
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke_cold_1(v1);
    }
  }
}

- (id)personaIdentifierForACAccountID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFB210];
  id v4 = a3;
  uint64_t v5 = [v3 defaultStore];
  char v6 = [v5 accountWithIdentifier:v4];

  BOOL v7 = objc_msgSend(v6, "br_personaIdentifier");

  return v7;
}

- (id)_createAccountHandlerForAccountID:(id)a3
{
  id v3 = a3;
  id v4 = [[BRCAccountHandler alloc] initWithACAccountID:v3];

  return v4;
}

- (id)getOrCreateAccountHandlerForACAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if (v5)
  {
    char v6 = objc_msgSend(v4, "br_personaIdentifier");
    char v7 = BRCurrentPersonaMatchesID();

    if (v7)
    {
      uint64_t v8 = self->_accountHandlersByACAccountID;
      objc_sync_enter(v8);
      BOOL v9 = [(NSMutableDictionary *)self->_accountHandlersByACAccountID objectForKeyedSubscript:v5];

      if (v9)
      {
        id v10 = [(NSMutableDictionary *)self->_accountHandlersByACAccountID objectForKeyedSubscript:v5];
      }
      else
      {
        id v10 = [(BRCAccountsManager *)self _createAccountHandlerForAccountID:v5];
        [(NSMutableDictionary *)self->_accountHandlersByACAccountID setObject:v10 forKeyedSubscript:v5];
      }
      objc_sync_exit(v8);

      goto LABEL_11;
    }
    char v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountsManager getOrCreateAccountHandlerForACAccount:]();
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)createSessionWithACAccountID:(id)a3 dsid:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [MEMORY[0x263EFB210] defaultStore];
  id v12 = [v11 accountWithIdentifier:v8];

  maintainFPDomainsQueue = self->_maintainFPDomainsQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke;
  block[3] = &unk_2650822C0;
  block[4] = self;
  id v20 = v8;
  id v21 = v12;
  id v22 = v9;
  id v23 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v12;
  id v17 = v8;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(maintainFPDomainsQueue, v18);
}

void __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_2;
  block[3] = &unk_2650822C0;
  block[4] = v2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v3, v4);
}

void __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_2(uint64_t a1)
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__38;
  v11[4] = __Block_byref_object_dispose__38;
  id v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_3;
  v4[3] = &unk_265084900;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v7 = v9;
  id v6 = *(id *)(a1 + 56);
  id v8 = v11;
  [v2 createAndLoadSessionWithACAccountID:v3 createBlock:v4];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);
}

id __74__BRCAccountsManager_createSessionWithACAccountID_dsid_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getOrCreateAccountHandlerForACAccount:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 createAccountSessionWithDSID:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    [v2 startAndLoadAccountSynchronously:*(void *)(a1 + 40)];
  }
  return v2;
}

- (void)updateAccountDisplayName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:]();
    }
  }
  id v8 = [MEMORY[0x263EFB210] defaultStore];
  [v8 invalidateAccountForPersonaCache];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke;
  block[3] = &unk_26507F918;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);
}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] Updating account %@%@", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v17 = __Block_byref_object_copy__38;
  dispatch_block_t v18 = __Block_byref_object_dispose__38;
  id v19 = 0;
  id v5 = *(id *)(a1[5] + 8);
  objc_sync_enter(v5);
  id v6 = [*(id *)(a1[5] + 8) objectForKeyedSubscript:a1[4]];
  objc_sync_exit(v5);

  id v7 = [v6 session];
  int v8 = [v7 isDataSeparated];

  if (v8)
  {
    id v9 = [v6 session];
    id v10 = [v9 personaIdentifier];
    id v15 = v6;
    BRPerformWithPersonaAndError();

    id v11 = v15;
  }
  else
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], *(void *)(*(void *)&buf[8] + 40), v13, v14);
  _Block_object_dispose(buf, 8);
}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) session];
    [v4 fixFileProviderDomainDecorations];

    BRPostAccountTokenChangedNotification();
  }
}

- (BOOL)destroySessionWithACAccountID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountsManager createAndLoadSessionWithACAccountID:createBlock:]();
    }
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v5 = dispatch_group_create();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke;
  block[3] = &unk_265081E88;
  id v13 = v4;
  uint64_t v14 = self;
  id v15 = &v16;
  id v7 = v4;
  dispatch_sync(queue, block);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  char v8 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    id v17 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] Logging out account %@%@", (uint8_t *)&v14, 0x16u);
  }

  id v5 = *(id *)(*(void *)(a1 + 40) + 8);
  objc_sync_enter(v5);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:*(void *)(a1 + 32)];
  objc_sync_exit(v5);

  id v7 = [v6 session];

  if (v7)
  {
    char v8 = [v6 session];
    id v9 = [v8 personaIdentifier];
  }
  else
  {
    char v8 = [MEMORY[0x263EFB210] defaultStore];
    id v10 = [v8 accountWithIdentifier:*(void *)(a1 + 32)];
    id v9 = objc_msgSend(v10, "br_personaIdentifier");
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) cleanupAccountDataForLoggedOutAccountWithPersona:v9];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v11 = *(id *)(*(void *)(a1 + 40) + 8);
    objc_sync_enter(v11);
    [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:*(void *)(a1 + 32)];
    objc_sync_exit(v11);

    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_2();
    }
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_1();
    }
  }
}

- (void)waitUntilDeviceIsUnlocked
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't register notifications%@", v2, v3, v4, v5, v6);
}

void __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if ([*(id *)(a1 + 40) _isDeviceUnlocked])
  {
    uint64_t v2 = *(NSObject **)(a1 + 48);
    dispatch_semaphore_signal(v2);
  }
  else
  {
    syslog(5, "Device is locked - waiting\n");
  }
}

uint64_t __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke_2(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __47__BRCAccountsManager_waitUntilDeviceIsUnlocked__block_invoke_72(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

- (void)_createSyncBubbleTasksIfNecessary
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_accountHandlersByACAccountID;
  objc_sync_enter(v3);
  uint64_t v4 = [(NSMutableDictionary *)self->_accountHandlersByACAccountID allValues];
  objc_sync_exit(v3);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) session];
        id v10 = [v9 clientTruthWorkloop];
        if (v10)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke;
          block[3] = &unk_26507ED70;
          id v12 = v9;
          dispatch_async_and_wait(v10, block);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) enumeratePrivateClientZones:&__block_literal_global_75];
  [*(id *)(a1 + 32) enumerateSharedClientZones:&__block_literal_global_78_0];
  id v2 = [*(id *)(a1 + 32) clientDB];
  [v2 flush];
}

uint64_t __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __55__BRCAccountsManager__createSyncBubbleTasksIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  return 1;
}

- (void)uploadContent
{
  uint64_t v1 = "yes";
  if (!*(unsigned char *)(a1 + 33)) {
    uint64_t v1 = "no";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v2, v3, "[DEBUG] Notified to upload content. resumed:%s%@", (void)v4, DWORD2(v4));
}

- (void)willSwitchUser
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Notified of a user switch%@", v2, v3, v4, v5, v6);
}

void __36__BRCAccountsManager_willSwitchUser__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 33))
  {
    if (!*(void *)(v2 + 40))
    {
      uint64_t v5 = brc_bread_crumbs();
      uint8_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2();
      }

      uint64_t v2 = *(void *)(a1 + 32);
    }
    [(id)v2 _createSyncBubbleTasksIfNecessary];
    [*(id *)(*(void *)(a1 + 32) + 40) end];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (BOOL)retrySyncBubbleLaterIfNeededWithError:(id)a3
{
  id v4 = a3;
  if ([(BRCAccountsManager *)self isInSyncBubble]
    && objc_msgSend(v4, "brc_shouldRetryLater"))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke;
    v7[3] = &unk_26507ED98;
    id v8 = v4;
    id v9 = self;
    if (retrySyncBubbleLaterIfNeededWithError__onceToken != -1) {
      dispatch_once(&retrySyncBubbleLaterIfNeededWithError__onceToken, v7);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke_cold_1();
  }

  id v4 = [MEMORY[0x263F841B0] sharedManager];
  BOOL v5 = NSString;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) domain];
  id v8 = [v5 stringWithFormat:@"encountered error domain %@ code %ld", v7, objc_msgSend(*(id *)(a1 + 32), "code")];
  [v4 unregisterStakeHolder:v6 status:1 reason:v8];
}

- (BRCBarrier)accountsLoadingBarrier
{
  return self->_accountsLoadingBarrier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_checkNeedsBubbleTask, 0);
  objc_storeStrong((id *)&self->_maintainFPDomainsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountHandlersByACAccountID, 0);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_fault_impl(&dword_23FA42000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", v4, 0x16u);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] No domain to remove found for %@%@", v4, 0x16u);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Got an error when trying to find a domain to remove: %@%@", (void)v3, DWORD2(v3));
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] We don't have a domain in the account session, let's try to find a domain for account: %@%@", (void)v3, DWORD2(v3));
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !session%@", v2, v3, v4, v5, v6);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Can't adopt session's persona, it must have already been deleted.%@", v2, v3, v4, v5, v6);
}

void __71__BRCAccountsManager_cleanupAccountDataForLoggedOutAccountWithPersona___block_invoke_12_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Removed domain %@%@", (uint8_t *)&v6, 0x16u);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] We got an error from account store, we can't continue our loading sequence%@", v1, 0xCu);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self->_checkNeedsBubbleTask%@", v2, v3, v4, v5, v6);
}

void __34__BRCAccountsManager_loadAccounts__block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: Can't perform with account persona of %@%@", (void)v3, DWORD2(v3));
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 40);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Failed getting the list of FP domains: %@%@", (void)v3, DWORD2(v3));
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)a1 + 40);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Failed getting the list of enterprise FP domains: %@%@", (void)v3, DWORD2(v3));
}

- (void)_maintainExistingFileProviderDomainsWithAccounts:(uint64_t)a1 withError:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Finding old domains. Current accounts: %@%@", (void)v3, DWORD2(v3));
}

void __81__BRCAccountsManager__maintainExistingFileProviderDomainsWithAccounts_withError___block_invoke_56_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Persisting domain %@%@", (void)v3, DWORD2(v3));
}

- (void)_maintainExistingFileProviderDomainsIfNeededWithAccounts:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v1, v2, "[CRIT] UNREACHABLE: Failed maintaining existing file provider domains: %@%@", (void)v3, DWORD2(v3));
}

void __82__BRCAccountsManager__scheduleExistingFileProviderDomainsMaintenanceWithAccounts___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Failed waiting for File Provider to be ready: %@%@", (void)v3, DWORD2(v3));
}

void __47__BRCAccountsManager_enumerateAccountHandlers___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't adopt persona for the account handler. Skipping it%@", v2, v3, v4, v5, v6);
}

- (void)_waitUntilFileProviderIsReady:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v1, v2, "[ERROR] Waiting without success for FP to accept XPCs: %@%@", (void)v3, DWORD2(v3));
}

- (void)createAndLoadSessionWithACAccountID:createBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: acAccountID%@", v2, v3, v4, v5, v6);
}

void __70__BRCAccountsManager_createAndLoadSessionWithACAccountID_createBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't create and load the session because we can't adopt the persona%@", v2, v3, v4, v5, v6);
}

void __73__BRCAccountsManager_waitForInitialAccountLoadingSynchronouslyIfPossible__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self->_finishedLoadingAccounts%@", v2, v3, v4, v5, v6);
}

void __67__BRCAccountsManager_waitForAccountLoadingSynchronouslyIfPossible___block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Waited without success for %@%@", (void)v3, DWORD2(v3));
}

- (void)getOrCreateAccountHandlerForACAccount:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't create an account handler with the wrong persona%@", v2, v3, v4, v5, v6);
}

void __65__BRCAccountsManager_updateAccountDisplayName_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Updating display name is not supported on non EDS account%@", v2, v3, v4, v5, v6);
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to destroy session during logout%@", v1, 0xCu);
}

void __52__BRCAccountsManager_destroySessionWithACAccountID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Destroyed session during logout successfully%@", v2, v3, v4, v5, v6);
}

- (void)_isDeviceUnlocked
{
  uint64_t v1 = "unlocked";
  if (a1 != 1) {
    uint64_t v1 = "locked";
  }
  LODWORD(v4) = 136315394;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v2, v3, "[DEBUG] device is %s%@", (void)v4, DWORD2(v4));
}

void __60__BRCAccountsManager_retrySyncBubbleLaterIfNeededWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] Encountered an error forcing us to try to retry the sync bubble later - %@%@", (void)v3, DWORD2(v3));
}

@end