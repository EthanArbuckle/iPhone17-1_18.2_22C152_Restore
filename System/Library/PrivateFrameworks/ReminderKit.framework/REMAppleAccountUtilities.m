@interface REMAppleAccountUtilities
+ (id)accountDescriptionWithACAccount:(id)a3;
+ (id)sharedInstance;
+ (void)sharedInstance;
- (ACAccount)_debug_fullICloudACAccount;
- (ACAccount)_debug_primaryICloudACAccount;
- (ACAccount)unsafeUntilSystemReady_primaryICloudACAccount;
- (ACAccountStore)accountStore;
- (BOOL)cachedICloudACAccountsAreValid;
- (BOOL)isCurrentPersonaDataSeparated;
- (NSArray)unsafeUntilSystemReady_allICloudACAccounts;
- (NSMutableDictionary)unsafeUntilSystemReady_parentICloudACAccountIdentifierMap;
- (REMAppleAccountUtilities)init;
- (id)_cachedDisplayICloudACAccountWithIdentifier:(id)a3;
- (id)accessQueue;
- (id)currentPersonaUserPersonaUniqueString;
- (id)initForObservingAccountStoreChanges:(BOOL)a3;
- (id)unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts;
- (id)unsafeUntilSystemReady_displayedHostnameOfICloudACAccountWithAccountIdentifier:(id)a3;
- (id)unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:(id)a3;
- (id)unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:(id)a3;
- (void)_invalidateCachedICloudACAccounts;
- (void)_updateCachedICloudACAccounts;
- (void)dealloc;
- (void)performBlockInPersonaContextForAccountIdentifier:(id)a3 block:(id)a4;
- (void)saveDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 toACAccount:(id)a5 inStore:(id)a6 completionHandler:(id)a7;
- (void)setAccountStore:(id)a3;
- (void)setCachedICloudACAccountsAreValid:(BOOL)a3;
- (void)setUnsafeUntilSystemReady_parentICloudACAccountIdentifierMap:(id)a3;
- (void)set_debug_fullICloudACAccount:(id)a3;
- (void)set_debug_primaryICloudACAccount:(id)a3;
@end

@implementation REMAppleAccountUtilities

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__REMAppleAccountUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  if (!sharedInstance_sharedInstance)
  {
    v4 = +[REMLog utility];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      +[REMAppleAccountUtilities sharedInstance](v4);
    }

    v2 = (void *)sharedInstance_sharedInstance;
  }

  return v2;
}

uint64_t __42__REMAppleAccountUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (REMAppleAccountUtilities)init
{
  return (REMAppleAccountUtilities *)[(REMAppleAccountUtilities *)self initForObservingAccountStoreChanges:1];
}

- (id)initForObservingAccountStoreChanges:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAppleAccountUtilities;
  v4 = [(REMAppleAccountUtilities *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F179C8] defaultStore];
    accountStore = v4->_accountStore;
    v4->_accountStore = (ACAccountStore *)v5;

    if (v3)
    {
      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:v4 selector:sel_accountStoreDidChange_ name:*MEMORY[0x1E4F17728] object:v4->_accountStore];
    }
  }
  return v4;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)REMAppleAccountUtilities;
  [(REMAppleAccountUtilities *)&v4 dealloc];
}

- (ACAccount)unsafeUntilSystemReady_primaryICloudACAccount
{
  [(REMAppleAccountUtilities *)self _updateCachedICloudACAccounts];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  id v12 = 0;
  BOOL v3 = [(REMAppleAccountUtilities *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__REMAppleAccountUtilities_unsafeUntilSystemReady_primaryICloudACAccount__block_invoke;
  v6[3] = &unk_1E61DCAF0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

void __73__REMAppleAccountUtilities_unsafeUntilSystemReady_primaryICloudACAccount__block_invoke(uint64_t a1)
{
}

- (NSArray)unsafeUntilSystemReady_allICloudACAccounts
{
  [(REMAppleAccountUtilities *)self _updateCachedICloudACAccounts];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(REMAppleAccountUtilities *)self accessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__REMAppleAccountUtilities_unsafeUntilSystemReady_allICloudACAccounts__block_invoke;
  v6[3] = &unk_1E61DC9E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

uint64_t __70__REMAppleAccountUtilities_unsafeUntilSystemReady_allICloudACAccounts__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 24)) {
    return objc_msgSend(*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40), "addObjectsFromArray:");
  }
  return result;
}

- (id)unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts
{
  v2 = [(REMAppleAccountUtilities *)self unsafeUntilSystemReady_allICloudACAccounts];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke;
  v5[3] = &unk_1E61DD9E8;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "rem_isEligibleForCloudKitReminders"))
  {
    id v4 = [v3 enabledDataclasses];
    int v5 = [v4 containsObject:*MEMORY[0x1E4F17B08]];

    if (v5)
    {
      uint64_t v6 = [v3 identifier];

      if (v6)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
      }
      else
      {
        uint64_t v7 = +[REMLog utility];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke_cold_1();
        }
      }
    }
  }
}

- (id)unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(REMAppleAccountUtilities *)self unsafeUntilSystemReady_allICloudACAccounts];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __92__REMAppleAccountUtilities_unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier___block_invoke;
  v14 = &unk_1E61DDA10;
  id v6 = v4;
  id v15 = v6;
  v16 = &v17;
  [v5 enumerateObjectsUsingBlock:&v11];
  uint64_t v7 = (void *)v18[5];
  if (!v7)
  {
    uint64_t v8 = +[REMLog utility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[REMAppleAccountUtilities unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:]();
    }

    uint64_t v7 = (void *)v18[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v17, 8);

  return v9;
}

void __92__REMAppleAccountUtilities_unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:(id)a3
{
  id v4 = a3;
  int v5 = [(REMAppleAccountUtilities *)self unsafeUntilSystemReady_allICloudACAccounts];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  id v30 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __91__REMAppleAccountUtilities_unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID___block_invoke;
  id v22 = &unk_1E61DDA10;
  id v6 = v4;
  id v23 = v6;
  v24 = &v25;
  [v5 enumerateObjectsUsingBlock:&v19];
  if (!v26[5])
  {
    uint64_t v7 = +[REMLog utility];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[REMAppleAccountUtilities unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:]();
    }
  }
  int v8 = objc_msgSend((id)v26[5], "dataclassProperties", v19, v20, v21, v22);
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(id)v26[5] dataclassProperties];
    uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F17A80]];
    v13 = REMDynamicCast(v10, (uint64_t)v12);

    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      id v15 = [v13 objectForKeyedSubscript:@"url"];
      v16 = REMDynamicCast(v14, (uint64_t)v15);

      if (v16) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = @"https://p01-caldav.icloud.com:443";
      }
    }
    else
    {
      uint64_t v17 = @"https://p01-caldav.icloud.com:443";
    }
  }
  else
  {
    uint64_t v17 = @"https://p01-caldav.icloud.com:443";
  }

  _Block_object_dispose(&v25, 8);

  return v17;
}

void __91__REMAppleAccountUtilities_unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = [v11 identifier];
  int v8 = [*(id *)(a1 + 32) uuid];
  uint64_t v9 = [v8 UUIDString];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)unsafeUntilSystemReady_displayedHostnameOfICloudACAccountWithAccountIdentifier:(id)a3
{
  id v3 = [(REMAppleAccountUtilities *)self unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:a3];
  id v4 = objc_msgSend(v3, "aa_regionInfo");
  int v5 = [v4 displayedHostname];
  id v6 = [v5 lowercaseString];

  return v6;
}

- (void)saveDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 toACAccount:(id)a5 inStore:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  BOOL v10 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = +[REMLog utility];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [v11 identifier];
    *(_DWORD *)buf = 67109634;
    BOOL v30 = v10;
    __int16 v31 = 1024;
    BOOL v32 = v9;
    __int16 v33 = 2112;
    v34 = v22;
    _os_log_debug_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_DEBUG, "Trying to set didChooseToMigrate=%d didFinishMigration=%d on ACAccount (%@)", buf, 0x18u);
  }
  id v15 = [v11 objectForKeyedSubscript:@"remindersIsUsingCloudKit"];
  v16 = [v11 objectForKeyedSubscript:@"remindersDidFinishMigrationToCloudKit"];
  int v17 = [v15 BOOLValue];
  int v18 = [v16 BOOLValue];
  if (!v15 || !v16 || v17 != v10 || v18 != v9)
  {
    uint64_t v19 = +[REMLog utility];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v23 = [v11 identifier];
      *(_DWORD *)buf = 67109634;
      BOOL v30 = v10;
      __int16 v31 = 1024;
      BOOL v32 = v9;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_debug_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_DEBUG, "Actually setting didChooseToMigrate=%d didFinishMigration=%d on ACAccount (%@)", buf, 0x18u);
    }
    uint64_t v20 = [NSNumber numberWithBool:v10];
    [v11 setObject:v20 forKeyedSubscript:@"remindersIsUsingCloudKit"];

    v21 = [NSNumber numberWithBool:v9];
    [v11 setObject:v21 forKeyedSubscript:@"remindersDidFinishMigrationToCloudKit"];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke;
    v24[3] = &unk_1E61DDA38;
    BOOL v27 = v10;
    BOOL v28 = v9;
    id v25 = v11;
    id v26 = v13;
    [v12 saveAccount:v25 withCompletionHandler:v24];
  }
  else if (v13)
  {
    (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 1, 0);
  }
}

void __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[REMLog utility];
  uint64_t v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(unsigned __int8 *)(a1 + 48);
    int v9 = *(unsigned __int8 *)(a1 + 49);
    BOOL v10 = [*(id *)(a1 + 32) identifier];
    v12[0] = 67109634;
    v12[1] = v8;
    __int16 v13 = 1024;
    int v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "Saved didChooseToMigrate=%d didFinishMigration=%d on ACAccount (%{public}@)", (uint8_t *)v12, 0x18u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);
  }
}

+ (id)accountDescriptionWithACAccount:(id)a3
{
  return (id)[a3 accountDescription];
}

- (id)accessQueue
{
  if (accessQueue_onceToken != -1) {
    dispatch_once(&accessQueue_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)accessQueue_accessQueue;

  return v2;
}

void __39__REMAppleAccountUtilities_accessQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.reminders.apple-account-utilities", v2);
  v1 = (void *)accessQueue_accessQueue;
  accessQueue_accessQueue = (uint64_t)v0;
}

- (void)_updateCachedICloudACAccounts
{
  id v3 = [(REMAppleAccountUtilities *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke;
  block[3] = &unk_1E61DC740;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) cachedICloudACAccountsAreValid] & 1) == 0)
  {
    v34 = (void *)MEMORY[0x1BA9DB950]();
    v2 = [MEMORY[0x1E4F1CA48] array];
    id v3 = objc_msgSend(*(id *)(a1 + 32), "_debug_primaryICloudACAccount");
    id v4 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_storeStrong(v4 + 2, v3);
      [v2 addObject:v3];
    }
    else
    {
      id v5 = [v4 accountStore];
      uint64_t v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(void **)(v7 + 16);
      *(void *)(v7 + 16) = v6;
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_debug_fullICloudACAccount");
    if (v9) {
      [v2 addObject:v9];
    }
    if (![v2 count])
    {
      BOOL v10 = [*(id *)(a1 + 32) accountStore];
      uint64_t v11 = objc_msgSend(v10, "aa_appleAccounts");
      [v2 addObjectsFromArray:v11];
    }
    if ((unint64_t)[v2 count] >= 4
      && +[REMSystemUtilities isInternalInstall])
    {
      id v12 = +[REMLog utility];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke_cold_1(v2, v12);
      }
    }
    __int16 v31 = (void *)v9;
    BOOL v32 = v3;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v2);
    uint64_t v33 = a1;
    id v13 = *(id *)(*(void *)(a1 + 32) + 32);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v31, v3);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v2;
    uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v46;
      uint64_t v14 = *MEMORY[0x1E4F17B08];
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v46 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v15;
          v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
          context = (void *)MEMORY[0x1BA9DB950]();
          uint64_t v17 = [v16 displayAccount];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v38 = v17;
          int v18 = [v17 childAccounts];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v42 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                v24 = objc_msgSend(v23, "enabledDataclasses", v31);
                int v25 = [v24 containsObject:v14];

                if (v25)
                {
                  id v26 = [v16 identifier];
                  BOOL v27 = [v23 identifier];
                  [v13 setObject:v26 forKeyedSubscript:v27];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
            }
            while (v20);
          }

          uint64_t v15 = v40 + 1;
        }
        while (v40 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v37);
    }

    uint64_t v28 = *(void *)(v33 + 32);
    v29 = *(void **)(v28 + 32);
    *(void *)(v28 + 32) = v13;
    id v30 = v13;

    [*(id *)(v33 + 32) setCachedICloudACAccountsAreValid:1];
  }
}

- (void)_invalidateCachedICloudACAccounts
{
  id v3 = [(REMAppleAccountUtilities *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__REMAppleAccountUtilities__invalidateCachedICloudACAccounts__block_invoke;
  block[3] = &unk_1E61DC740;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __61__REMAppleAccountUtilities__invalidateCachedICloudACAccounts__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedICloudACAccountsAreValid:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = 0;
}

- (id)_cachedDisplayICloudACAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  if ([v4 length])
  {
    id v5 = [(REMAppleAccountUtilities *)self accessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke;
    block[3] = &unk_1E61DCE40;
    block[4] = self;
    id v9 = v4;
    BOOL v10 = &v11;
    dispatch_sync(v5, block);
    id v6 = [(id)v12[5] displayAccount];
  }
  else
  {
    id v6 = (id)v12[5];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) cachedICloudACAccountsAreValid])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
    id v3 = v2;
    id v4 = [v3 identifier];
    int v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

    if (v5) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v2);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v6 = *(id *)(*(void *)(a1 + 32) + 24);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v13 = [v12 identifier];
            int v14 = [v13 isEqualToString:*(void *)(a1 + 40)];

            if (v14)
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
              goto LABEL_17;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
        uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
        if (v15)
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id obj = v7;
          uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                uint64_t v21 = [v20 identifier];
                int v22 = [v21 isEqualToString:v15];

                if (v22)
                {
                  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v20);
                  goto LABEL_29;
                }
              }
              uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_29:
        }
      }
    }
  }
  else
  {
    id v3 = +[REMLog utility];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke_cold_1(a1, v3);
    }
  }
}

- (NSMutableDictionary)unsafeUntilSystemReady_parentICloudACAccountIdentifierMap
{
  return self->_unsafeUntilSystemReady_parentICloudACAccountIdentifierMap;
}

- (void)setUnsafeUntilSystemReady_parentICloudACAccountIdentifierMap:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (BOOL)cachedICloudACAccountsAreValid
{
  return self->_cachedICloudACAccountsAreValid;
}

- (void)setCachedICloudACAccountsAreValid:(BOOL)a3
{
  self->_cachedICloudACAccountsAreValid = a3;
}

- (ACAccount)_debug_primaryICloudACAccount
{
  return self->__debug_primaryICloudACAccount;
}

- (void)set_debug_primaryICloudACAccount:(id)a3
{
}

- (ACAccount)_debug_fullICloudACAccount
{
  return self->__debug_fullICloudACAccount;
}

- (void)set_debug_fullICloudACAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debug_fullICloudACAccount, 0);
  objc_storeStrong((id *)&self->__debug_primaryICloudACAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_parentICloudACAccountIdentifierMap, 0);
  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_allICloudACAccounts, 0);

  objc_storeStrong((id *)&self->_unsafeUntilSystemReady_primaryICloudACAccount, 0);
}

- (void)performBlockInPersonaContextForAccountIdentifier:(id)a3 block:(id)a4
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = [(REMAppleAccountUtilities *)self _cachedDisplayICloudACAccountWithIdentifier:v6];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v8 accountPropertyForKey:*MEMORY[0x1E4F176E8]];
  uint64_t v11 = REMDynamicCast(v9, (uint64_t)v10);

  id v12 = [getUMUserManagerClass() sharedManager];
  uint64_t v13 = [v12 currentPersona];
  int v14 = +[REMLog utility];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v8 identifier];
    uint64_t v16 = [v8 description];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    long long v42 = v15;
    LOWORD(v43[0]) = 2112;
    *(void *)((char *)v43 + 2) = v16;
    _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Looked up account persona {personaIdentifier: %{public}@, accountIdentifier: %{public}@, displayAccountIdentifier: %{public}@, desc: %@}", buf, 0x2Au);
  }
  if ([v11 length] || !v11)
  {
    id v23 = +[REMLog utility];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Adopting persona {personaIdentifier: %{public}@, accountIdentifier: %{public}@}", buf, 0x16u);
    }

    id v36 = 0;
    long long v24 = (void *)[v13 copyCurrentPersonaContextWithError:&v36];
    id v25 = v36;
    if (v25)
    {
      long long v26 = +[REMLog utility];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[REMAppleAccountUtilities(DataSeparation) performBlockInPersonaContextForAccountIdentifier:block:]();
      }

      v7[2](v7, v11, v25);
    }
    else
    {
      id v27 = (id)[v13 generateAndRestorePersonaContextWithPersonaUniqueString:v11];
      v7[2](v7, v11, 0);
      id v28 = (id)[v13 restorePersonaWithSavedPersonaContext:v24];
    }
  }
  else
  {
    int v17 = [v13 isProxy];
    uint64_t v18 = +[REMLog utility];
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Adopting personal persona (isProxy) {accountIdentifier: %{public}@}", buf, 0xCu);
      }

      id v35 = 0;
      uint64_t v20 = (void *)[v13 copyCurrentPersonaContextWithError:&v35];
      id v21 = v35;
      if (v21)
      {
        int v22 = +[REMLog utility];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[REMAppleAccountUtilities(DataSeparation) performBlockInPersonaContextForAccountIdentifier:block:]();
        }

        v7[2](v7, v11, v21);
      }
      else
      {
        uint64_t v37 = 0;
        v38 = &v37;
        uint64_t v39 = 0x2050000000;
        long long v29 = (void *)getUMUserPersonaAttributesClass_softClass;
        uint64_t v40 = getUMUserPersonaAttributesClass_softClass;
        if (!getUMUserPersonaAttributesClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getUMUserPersonaAttributesClass_block_invoke;
          long long v42 = &unk_1E61DDA60;
          v43[0] = &v37;
          __getUMUserPersonaAttributesClass_block_invoke((uint64_t)buf);
          long long v29 = (void *)v38[3];
        }
        id v30 = v29;
        _Block_object_dispose(&v37, 8);
        long long v31 = [v30 personaAttributesForPersonaType:0];
        BOOL v32 = [v31 userPersonaUniqueString];
        id v33 = (id)[v13 generateAndRestorePersonaContextWithPersonaUniqueString:v32];

        v7[2](v7, v11, 0);
        id v34 = (id)[v13 restorePersonaWithSavedPersonaContext:v20];
      }
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_INFO, "performBlockInPersonaContext: Using default persona {accountIdentifier: %{public}@}", buf, 0xCu);
      }

      v7[2](v7, 0, 0);
    }
  }
}

- (BOOL)isCurrentPersonaDataSeparated
{
  uint64_t v2 = [getUMUserManagerClass() sharedManager];
  id v3 = [v2 currentPersona];
  char v4 = [v3 isDataSeparatedPersona];

  return v4;
}

- (id)currentPersonaUserPersonaUniqueString
{
  uint64_t v2 = [getUMUserManagerClass() sharedManager];
  id v3 = [v2 currentPersona];
  char v4 = [v3 userPersonaUniqueString];

  return v4;
}

+ (void)sharedInstance
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!sharedInstance) -- Failed to create REMAppleAccountUtilities shared instance", v1, 2u);
}

void __94__REMAppleAccountUtilities_unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "unsafeUntilSystemReady_allCloudKitRemindersEnabledICloudACAccounts encounters an iCloud ACAccount with nil identifier, skipped {account: %@}", v2, v3, v4, v5, v6);
}

- (void)unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier can't find a matching ACAccount with {accountIdentifier: %{public}@}", v2, v3, v4, v5, v6);
}

- (void)unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "unsafeUntilSystemReady_iCloudAccountCalDavServiceWithAccountID failed to match ACAccount with {accountID: %{public}@}", v2, v3, v4, v5, v6);
}

void __108__REMAppleAccountUtilities_saveDidChooseToMigrate_didFinishMigration_toACAccount_inStore_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Error saving migration state to ACAccount: %@", v2, v3, v4, v5, v6);
}

void __57__REMAppleAccountUtilities__updateCachedICloudACAccounts__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "REMAppleAccountUtilities found more than 3 AAAccount, revisit this for performance {count: %ld}", v3, 0xCu);
}

void __72__REMAppleAccountUtilities__cachedDisplayICloudACAccountWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Querying -_cachedDisplayICloudACAccountWithIdentifier: when the internal cache is invalid {identifier: %{public}@, callstack: %{public}@}", (uint8_t *)&v5, 0x16u);
}

@end