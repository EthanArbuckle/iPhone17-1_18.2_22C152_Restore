@interface SSAccountStore
+ (BOOL)URLResponseAllowsSilentAuthentication:(id)a3;
+ (BOOL)_accountDictionaryRepresentsActiveAccount:(id)a3 inKeyValueStore:(id)a4;
+ (BOOL)_accountDictionaryRepresentsActiveLockerAccount:(id)a3 inKeyValueStore:(id)a4;
+ (BOOL)_allowSilentPasswordAuthForAccount:(id)a3 withOptions:(id)a4;
+ (BOOL)_copyKVSDatabaseWithError:(id *)a3;
+ (BOOL)_currentProcessLinksUIKit;
+ (BOOL)_isBuddyRunning;
+ (BOOL)_shouldRemoveAccountDictionaryWithoutMigration:(id)a3 reason:(id *)a4;
+ (BOOL)areAccountStoreChangedNotificationsDisabled;
+ (BOOL)isExpired;
+ (BOOL)isExpiredForTokenType:(int64_t)a3;
+ (BOOL)migrateToAccountsFramework;
+ (BOOL)unitTestModeEnabled;
+ (double)tokenExpirationInterval;
+ (id)_backingAccountForAccount:(id)a3;
+ (id)_copyKVSDatabasePath;
+ (id)_createAuthenticationContextForAccount:(id)a3 silentAuthentication:(BOOL)a4 options:(id)a5;
+ (id)_createAuthenticationController;
+ (id)_createUpdatedAccount:(id)a3 withAuthenticationResults:(id)a4 options:(id)a5;
+ (id)_hashedDescriptionFromAccountDictionary:(id)a3;
+ (id)_migrateAccountDictionary:(id)a3 fromKeyValueStore:(id)a4 originalActiveDSID:(id)a5 originalActiveLockerDSID:(id)a6 logKey:(id)a7 error:(id *)a8;
+ (id)_refreshAccount:(id)a3;
+ (id)_unitTestAccountsAccessQueue;
+ (id)defaultStore;
+ (id)existingDefaultStore;
+ (void)_addAccountToUnitTestStore:(id)a3;
+ (void)_cleanupActiveAccountsAfterMigrationWithActiveDSID:(id)a3 activeLockerDSID:(id)a4;
+ (void)_disableAccountStoreChangedNotifications;
+ (void)_enableAccountStoreChangedNotifications;
+ (void)_excludeCopyKVSDatabasePathFromBackups;
+ (void)_postAccountsChangedDarwinNotification;
+ (void)_postAccountsChangedInternalDarwinNotification;
+ (void)_removeAccountDictionary:(id)a3 fromKeyValueStore:(id)a4;
+ (void)_removeAccountFromUnitTestStore:(id)a3;
+ (void)_setActiveAccountIsManagedAppleIDPreference:(BOOL)a3;
+ (void)resetExpiration;
+ (void)resetExpirationForTokenType:(int64_t)a3;
+ (void)setAuthenticationStartedDate:(id)a3;
+ (void)setUnitTestModeEnabled:(BOOL)a3;
- (ACAccountStore)backingAccountStore;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (BOOL)isAuthenticationActive;
- (BOOL)isExpired;
- (BOOL)isExpiredForTokenType:(int64_t)a3;
- (BOOL)isInProcessCacheDisabled;
- (BOOL)removeAccount:(id)a3 error:(id *)a4;
- (BOOL)repairAccountWithBrokenDSID:(id)a3;
- (BOOL)saveAccount:(id)a3 error:(id *)a4;
- (BOOL)saveAccount:(id)a3 verifyCredentials:(BOOL)a4 error:(id *)a5;
- (NSArray)accounts;
- (NSArray)accountsCache;
- (OS_dispatch_queue)accountsCacheAccessQueue;
- (OS_dispatch_queue)fetchAccountsQueue;
- (OS_dispatch_queue)metricsQueue;
- (OS_dispatch_queue)notificationQueue;
- (SSAccount)activeAccount;
- (SSAccount)activeLockerAccount;
- (SSAccount)activeSandboxAccount;
- (SSAccount)demoAccount;
- (SSAccount)localiTunesAccount;
- (SSAccountStore)init;
- (SSKeyValueStore)keyValueStore;
- (SSPromise)accountsPromise;
- (SSPromise)localAccount;
- (id)_buyParamsForBuyParamsString:(id)a3;
- (id)_cachedAccounts;
- (id)_convertPasswordToPET:(id)a3 forAccount:(id)a4 options:(id)a5;
- (id)_optionsForProxiedAuthenticationWithVerifyCredentialsOptions:(id)a3;
- (id)_passwordEquivalentTokenFromAlternateAccountWithAltDSID:(id)a3 DSID:(id)a4 username:(id)a5;
- (id)_saveAccount:(id)a3 verifyCredentials:(BOOL)a4;
- (id)_saveAccountInUnitTestMode:(id)a3 ignoreValidationErrors:(BOOL)a4;
- (id)_shouldCreateNewAccountForAccount:(id)a3 options:(id)a4;
- (id)_updateAccountWithAuthKitViaPromptAuth:(id)a3 store:(id)a4 options:(id)a5;
- (id)_updateAccountWithAuthKitViaSilentAuth:(id)a3 options:(id)a4;
- (id)_updateAccountWithAuthKitViaSilentPETAuth:(id)a3 options:(id)a4;
- (id)_updateAccountWithAuthKitViaSilentPasswordAuth:(id)a3 options:(id)a4;
- (id)accountWithAccountName:(id)a3;
- (id)accountWithAccountName:(id)a3 scope:(int64_t)a4;
- (id)accountWithAltDSID:(id)a3;
- (id)accountWithAltDSID:(id)a3 scope:(int64_t)a4;
- (id)accountWithAltDSID:(id)a3 uniqueIdentifier:(id)a4 accountName:(id)a5;
- (id)accountWithAltDSID:(id)a3 uniqueIdentifier:(id)a4 accountName:(id)a5 scope:(int64_t)a6;
- (id)accountWithUniqueIdentifier:(id)a3;
- (id)accountWithUniqueIdentifier:(id)a3 reloadIfNecessary:(BOOL)a4;
- (id)accountWithUniqueIdentifier:(id)a3 scope:(int64_t)a4;
- (id)addAccount:(id)a3;
- (id)iTunesStoreAccountType;
- (id)iTunesStoreAccountTypePromise;
- (id)setActiveAccount:(id)a3;
- (id)setActiveLockerAccount:(id)a3;
- (id)updateAccountWithAuthKit:(id)a3 store:(id)a4 options:(id)a5;
- (void)_postAccountStoreChangeNotification;
- (void)_postActiveAccountChangedNotification;
- (void)_postAuthenticationActivityNotification;
- (void)_recordAnalyticsForMetricsDialogEvent:(id)a3 withTopic:(id)a4;
- (void)_setCachedAccounts:(id)a3;
- (void)clearCachedAccounts;
- (void)dealloc;
- (void)getDefaultAccountNameUsingBlock:(id)a3;
- (void)removeAccount:(id)a3 completion:(id)a4;
- (void)removeAllAccountsWithCompletion:(id)a3;
- (void)removeCookiesForAccount:(id)a3 logKey:(id)a4;
- (void)resetExpiration;
- (void)resetExpirationForTokenType:(int64_t)a3;
- (void)resetLocalAccount;
- (void)saveAccount:(id)a3 completion:(id)a4;
- (void)saveAccount:(id)a3 verifyCredentials:(BOOL)a4 completion:(id)a5;
- (void)setAccountCredits:(id)a3 forAccountWithUniqueIdentifier:(id)a4;
- (void)setAccountsCache:(id)a3;
- (void)setAccountsCacheAccessQueue:(id)a3;
- (void)setDefaultAccountName:(id)a3 completionBlock:(id)a4;
- (void)setFetchAccountsQueue:(id)a3;
- (void)setInProcessCacheDisabled:(BOOL)a3;
- (void)setKeyValueStore:(id)a3;
- (void)setMetricsQueue:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)signOutAccount:(id)a3;
- (void)signOutAccount:(id)a3 completion:(id)a4;
- (void)signOutAllAccounts;
- (void)signOutAllAccountsWithCompletionBlock:(id)a3;
@end

@implementation SSAccountStore

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = iTunesStoreAccountTypePromise_accountTypeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_4;
  block[3] = &unk_1E5BA7040;
  id v6 = v2;
  id v4 = v2;
  dispatch_sync(v3, block);
}

- (SSAccount)activeAccount
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [(SSAccountStore *)self accounts];
  v3 = objc_msgSend(v2, "_ss_firstObjectPassingTest:", &__block_literal_global_186);

  id v4 = +[SSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    id v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    v8 = objc_opt_class();
    id v9 = v8;
    [v3 hashedDescription];
    int v20 = 138543618;
    v21 = v8;
    __int16 v22 = 2114;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 22;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v20, v19);
    free(v10);
    SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }

LABEL_12:
  v17 = (void *)[v3 copy];

  return (SSAccount *)v17;
}

- (NSArray)accounts
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSAccountStore *)self _cachedAccounts];
  uint64_t v4 = +[SSLogConfig sharedAccountsConfig];
  int v5 = (void *)v4;
  if (!v3)
  {
    if (!v4)
    {
      int v5 = +[SSLogConfig sharedConfig];
    }
    int v18 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    int v20 = [v5 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      v19 &= 2u;
    }
    if (v19)
    {
      *(_DWORD *)v94 = 138543362;
      *(void *)&v94[4] = objc_opt_class();
      id v21 = *(id *)&v94[4];
      LODWORD(v85) = 12;
      v83 = v94;
      __int16 v22 = (void *)_os_log_send_and_compose_impl();

      if (v22)
      {
        id v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v94, v85);
        free(v22);
        SSFileLog(v5, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
      }
    }
    else
    {
    }
    if ([(id)objc_opt_class() unitTestModeEnabled])
    {
      v30 = +[SSLogConfig sharedAccountsConfig];
      if (!v30)
      {
        v30 = +[SSLogConfig sharedConfig];
      }
      int v31 = objc_msgSend(v30, "shouldLog", v83);
      if ([v30 shouldLogToDisk]) {
        int v32 = v31 | 2;
      }
      else {
        int v32 = v31;
      }
      v33 = [v30 OSLogObject];
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        v32 &= 2u;
      }
      if (v32)
      {
        v34 = objc_opt_class();
        *(_DWORD *)v94 = 138543362;
        *(void *)&v94[4] = v34;
        id v35 = v34;
        LODWORD(v85) = 12;
        v84 = v94;
        v36 = (void *)_os_log_send_and_compose_impl();

        if (!v36)
        {
LABEL_37:

          *(void *)v94 = 0;
          *(void *)&v94[8] = v94;
          *(void *)&v94[16] = 0x3032000000;
          v95 = __Block_byref_object_copy__19;
          v96 = __Block_byref_object_dispose__19;
          id v97 = 0;
          v43 = [(id)objc_opt_class() _unitTestAccountsAccessQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __26__SSAccountStore_accounts__block_invoke;
          block[3] = &unk_1E5BA7298;
          void block[4] = v94;
          dispatch_sync(v43, block);

          if (*(void *)(*(void *)&v94[8] + 40)) {
            uint64_t v44 = *(void *)(*(void *)&v94[8] + 40);
          }
          else {
            uint64_t v44 = MEMORY[0x1E4F1CBF0];
          }
          -[SSAccountStore _setCachedAccounts:](self, "_setCachedAccounts:", v44, v84);
          id v3 = *(id *)(*(void *)&v94[8] + 40);
          _Block_object_dispose(v94, 8);

          goto LABEL_77;
        }
        v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, v94, v85);
        free(v36);
        SSFileLog(v30, @"%@", v37, v38, v39, v40, v41, v42, (uint64_t)v33);
      }

      goto LABEL_37;
    }
    v45 = [(SSAccountStore *)self backingAccountStore];
    v46 = objc_msgSend(v45, "_ss_accountTypeWithIdentifier:error:", *MEMORY[0x1E4F17890], 0);

    v47 = [(SSAccountStore *)self backingAccountStore];
    id v91 = 0;
    v48 = [v47 accountsWithAccountType:v46 options:1 error:&v91];
    id v86 = v91;

    if (v48)
    {
LABEL_55:
      v63 = objc_msgSend(v48, "_ss_map:", &__block_literal_global_8, v83);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v93 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v64; ++i)
          {
            if (*(void *)v88 != v65) {
              objc_enumerationMutation(v63);
            }
            v67 = *(void **)(*((void *)&v87 + 1) + 8 * i);
            if ([v67 hasBrokenDSID]) {
              [(SSAccountStore *)self repairAccountWithBrokenDSID:v67];
            }
          }
          uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v93 count:16];
        }
        while (v64);
      }
      v68 = +[SSLogConfig sharedAccountsConfig];
      if (!v68)
      {
        v68 = +[SSLogConfig sharedConfig];
      }
      int v69 = [v68 shouldLog];
      if ([v68 shouldLogToDisk]) {
        int v70 = v69 | 2;
      }
      else {
        int v70 = v69;
      }
      v71 = [v68 OSLogObject];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO)) {
        int v72 = v70;
      }
      else {
        int v72 = v70 & 2;
      }
      if (v72)
      {
        v73 = objc_opt_class();
        *(_DWORD *)v94 = 138543362;
        *(void *)&v94[4] = v73;
        id v74 = v73;
        LODWORD(v85) = 12;
        v75 = (void *)_os_log_send_and_compose_impl();

        if (!v75)
        {
LABEL_76:

          [(SSAccountStore *)self _setCachedAccounts:v63];
          id v3 = v63;

          goto LABEL_77;
        }
        v71 = objc_msgSend(NSString, "stringWithCString:encoding:", v75, 4, v94, v85);
        free(v75);
        SSFileLog(v68, @"%@", v76, v77, v78, v79, v80, v81, (uint64_t)v71);
      }

      goto LABEL_76;
    }
    v49 = +[SSLogConfig sharedAccountsConfig];
    if (!v49)
    {
      v49 = +[SSLogConfig sharedConfig];
    }
    int v50 = objc_msgSend(v49, "shouldLog", v83);
    if ([v49 shouldLogToDisk]) {
      int v51 = v50 | 2;
    }
    else {
      int v51 = v50;
    }
    v52 = [v49 OSLogObject];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
      int v53 = v51;
    }
    else {
      int v53 = v51 & 2;
    }
    if (v53)
    {
      v54 = objc_opt_class();
      *(_DWORD *)v94 = 138543618;
      *(void *)&v94[4] = v54;
      *(_WORD *)&v94[12] = 2114;
      *(void *)&v94[14] = v86;
      id v55 = v54;
      LODWORD(v85) = 22;
      v83 = v94;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_54:

        goto LABEL_55;
      }
      v52 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, v94, v85);
      free(v56);
      SSFileLog(v49, @"%@", v57, v58, v59, v60, v61, v62, (uint64_t)v52);
    }

    goto LABEL_54;
  }
  if (!v4)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (v7)
  {
    *(_DWORD *)v94 = 138543362;
    *(void *)&v94[4] = objc_opt_class();
    id v9 = *(id *)&v94[4];
    LODWORD(v85) = 12;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v94, v85);
      free(v10);
      SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
  }
  else
  {
  }
LABEL_77:
  return (NSArray *)v3;
}

- (ACAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (id)_cachedAccounts
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  uint64_t v11 = __Block_byref_object_dispose__19;
  id v12 = 0;
  id v3 = [(SSAccountStore *)self accountsCacheAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SSAccountStore__cachedAccounts__block_invoke;
  v6[3] = &unk_1E5BA6FC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (OS_dispatch_queue)accountsCacheAccessQueue
{
  return self->_accountsCacheAccessQueue;
}

- (void)_setCachedAccounts:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(SSAccountStore *)self accountsCacheAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSAccountStore__setCachedAccounts___block_invoke;
  block[3] = &unk_1E5BA8860;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

SSAccount *__26__SSAccountStore_accounts__block_invoke_180(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SSAccount alloc] initWithBackingAccount:v2];

  return v3;
}

void __30__SSAccountStore_localAccount__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[SSAccount alloc] initWithBackingAccount:v3];

  [v2 finishWithResult:v4];
}

+ (BOOL)unitTestModeEnabled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [a1 _unitTestAccountsAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSAccountStore_unitTestModeEnabled__block_invoke;
  block[3] = &unk_1E5BA7298;
  void block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

+ (id)_unitTestAccountsAccessQueue
{
  if (_unitTestAccountsAccessQueue_onceToken != -1) {
    dispatch_once(&_unitTestAccountsAccessQueue_onceToken, &__block_literal_global_255);
  }
  id v2 = (void *)_unitTestAccountsAccessQueue_sUnitTestAccountsAccessQueue;
  return v2;
}

- (SSAccountStore)init
{
  v16.receiver = self;
  v16.super_class = (Class)SSAccountStore;
  id v2 = [(SSAccountStore *)&v16 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AccountsChanged, @"com.apple.itunesstored.accountschanged", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AccountsChangedInternal, @"com.apple.itunesstored.accountschanged.internal", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__ActiveAccountChanged, @"com.apple.StoreServices.SSAccountStore.activeaccountchanged", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, @"com.apple.StoreServices.authbegin", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, @"com.apple.StoreServices.authfail", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, @"com.apple.StoreServices.authfinish", 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, @"com.apple.StoreServices.authsubmit", 0, CFNotificationSuspensionBehaviorCoalesce);
    id v4 = MEMORY[0x1E4F14430];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.accountsCache", MEMORY[0x1E4F14430]);
    accountsCacheAccessQueue = v2->_accountsCacheAccessQueue;
    v2->_accountsCacheAccessQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F179C8] defaultStore];
    backingAccountStore = v2->_backingAccountStore;
    v2->_backingAccountStore = (ACAccountStore *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.fetchAccounts", v4);
    fetchAccountsQueue = v2->_fetchAccountsQueue;
    v2->_fetchAccountsQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.metricsQueue", 0);
    metricsQueue = v2->_metricsQueue;
    v2->_metricsQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v13;
  }
  return v2;
}

+ (id)defaultStore
{
  pthread_mutex_lock(&__DefaultStoreLock);
  if (!__DefaultStore)
  {
    id v2 = objc_alloc_init(SSAccountStore);
    id v3 = (void *)__DefaultStore;
    __DefaultStore = (uint64_t)v2;
  }
  pthread_mutex_unlock(&__DefaultStoreLock);
  id v4 = (void *)__DefaultStore;
  return v4;
}

- (SSPromise)localAccount
{
  id v3 = [(SSAccountStore *)self iTunesStoreAccountTypePromise];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SSAccountStore_localAccount__block_invoke;
  v6[3] = &unk_1E5BA98B0;
  v6[4] = self;
  id v4 = [v3 thenWithBlock:v6];

  return (SSPromise *)v4;
}

- (id)iTunesStoreAccountTypePromise
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__19;
  uint64_t v15 = __Block_byref_object_dispose__19;
  id v16 = 0;
  if (iTunesStoreAccountTypePromise_onceToken != -1) {
    dispatch_once(&iTunesStoreAccountTypePromise_onceToken, &__block_literal_global_195);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_2;
  block[3] = &unk_1E5BA7298;
  void block[4] = &v11;
  dispatch_sync((dispatch_queue_t)iTunesStoreAccountTypePromise_accountTypeQueue, block);
  id v3 = (void *)v12[5];
  if (!v3)
  {
    id v4 = objc_alloc_init(SSPromise);
    dispatch_queue_t v5 = (void *)v12[5];
    v12[5] = (uint64_t)v4;

    [(id)v12[5] addSuccessBlock:&__block_literal_global_199];
    id v6 = [(SSAccountStore *)self backingAccountStore];
    uint64_t v7 = [(id)v12[5] completionHandlerAdapter];
    [v6 accountTypeWithIdentifier:*MEMORY[0x1E4F17890] completion:v7];

    id v3 = (void *)v12[5];
  }
  id v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_4(uint64_t a1)
{
}

uint64_t __31__SSAccountStore_activeAccount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

uint64_t __37__SSAccountStore_unitTestModeEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = sUnitTestModeEnabled;
  return result;
}

void __37__SSAccountStore__setCachedAccounts___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = (void *)[*(id *)(a1 + 32) copy];
  [WeakRetained setAccountsCache:v2];
}

- (void)setAccountsCache:(id)a3
{
}

void __33__SSAccountStore__cachedAccounts__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInProcessCacheDisabled])
  {
    id v2 = +[SSLogConfig sharedAccountsConfig];
    if (!v2)
    {
      id v2 = +[SSLogConfig sharedConfig];
    }
    int v3 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v4 = v3 | 2;
    }
    else {
      int v4 = v3;
    }
    dispatch_queue_t v5 = [v2 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      v4 &= 2u;
    }
    if (v4)
    {
      int v19 = 138543362;
      id v20 = (id)objc_opt_class();
      id v6 = v20;
      LODWORD(v17) = 12;
      uint64_t v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_13:

        return;
      }
      dispatch_queue_t v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v19, v17);
      free(v7);
      SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    }

    goto LABEL_13;
  }
  id v18 = [*(id *)(a1 + 32) accountsCache];
  uint64_t v14 = [v18 copy];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (BOOL)isInProcessCacheDisabled
{
  return self->_inProcessCacheDisabled;
}

- (NSArray)accountsCache
{
  return self->_accountsCache;
}

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_2(uint64_t a1)
{
  if (iTunesStoreAccountTypePromise_sAccountType)
  {
    uint64_t v2 = +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:");
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    int v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.sAccountType", 0);
  v1 = (void *)iTunesStoreAccountTypePromise_accountTypeQueue;
  iTunesStoreAccountTypePromise_accountTypeQueue = (uint64_t)v0;
}

void __46__SSAccountStore__unitTestAccountsAccessQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.unitTestAccountsAccessQueue", MEMORY[0x1E4F14430]);
  v1 = (void *)_unitTestAccountsAccessQueue_sUnitTestAccountsAccessQueue;
  _unitTestAccountsAccessQueue_sUnitTestAccountsAccessQueue = (uint64_t)v0;
}

SSPromise *__30__SSAccountStore_localAccount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 backingAccountStore];
  dispatch_queue_t v5 = objc_msgSend(v4, "ams_localiTunesAccountForAccountType:", v3);

  id v6 = objc_alloc_init(SSPromise);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__SSAccountStore_localAccount__block_invoke_2;
  v14[3] = &unk_1E5BA9888;
  uint64_t v7 = v6;
  uint64_t v15 = v7;
  [v5 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__SSAccountStore_localAccount__block_invoke_3;
  v12[3] = &unk_1E5BA8720;
  uint64_t v8 = v7;
  uint64_t v13 = v8;
  [v5 addErrorBlock:v12];
  uint64_t v9 = v13;
  uint64_t v10 = v8;

  return v10;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.accountschanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunesstored.accountschanged.internal", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.SSAccountStore.activeaccountchanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.authbegin", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.authfail", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.authfinish", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.StoreServices.authsubmit", 0);
  v4.receiver = self;
  v4.super_class = (Class)SSAccountStore;
  [(SSAccountStore *)&v4 dealloc];
}

- (SSKeyValueStore)keyValueStore
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_keyValueStore)
  {
    id v3 = objc_alloc_init(SSKeyValueStore);
    keyValueStore = v2->_keyValueStore;
    v2->_keyValueStore = v3;
  }
  objc_sync_exit(v2);

  dispatch_queue_t v5 = v2->_keyValueStore;
  return v5;
}

+ (double)tokenExpirationInterval
{
  return 900.0;
}

void __26__SSAccountStore_accounts__block_invoke(uint64_t a1)
{
  id v5 = [(id)sUnitTestAccounts allValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SSPromise)accountsPromise
{
  uint64_t v3 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  objc_super v4 = [(SSAccountStore *)self fetchAccountsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SSAccountStore_accountsPromise__block_invoke;
  block[3] = &unk_1E5BA8860;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  uint64_t v8 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __33__SSAccountStore_accountsPromise__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained accounts];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 finishWithResult:v2 error:0];
  }
  else
  {
    objc_super v4 = SSError(@"SSErrorDomain", 100, 0, 0);
    [v3 finishWithResult:0 error:v4];
  }
}

- (id)accountWithAccountName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SSAccountStore *)self accounts];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = objc_msgSend(v11, "accountName", (void)v17);
      int v13 = [v12 isEqualToString:v4];

      if (v13)
      {
        id v14 = v11;

        uint64_t v8 = v14;
        if (![v14 accountScope]) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v14 = v8;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  uint64_t v15 = (void *)[v14 copy];
  return v15;
}

- (id)accountWithAccountName:(id)a3 scope:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]);
    uint64_t v8 = objc_msgSend(v7, "ams_iTunesAccountWithUsername:", v6);
    if (v8) {
      uint64_t v9 = [[SSAccount alloc] initWithBackingAccount:v8];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    [(SSAccountStore *)self accounts];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "accountName", (void)v18);
          if ([v15 isEqualToString:v6])
          {
            uint64_t v16 = [v14 accountScope];

            if (v16 == a4)
            {
              id v11 = v14;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
LABEL_15:

    uint64_t v9 = (SSAccount *)[v11 copy];
  }

  return v9;
}

- (id)accountWithAltDSID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SSAccountStore *)self accounts];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = objc_msgSend(v11, "altDSID", (void)v17);
      int v13 = [v12 isEqualToString:v4];

      if (v13)
      {
        id v14 = v11;

        uint64_t v8 = v14;
        if (![v14 accountScope]) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        id v14 = v8;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  uint64_t v15 = (void *)[v14 copy];
  return v15;
}

- (id)accountWithAltDSID:(id)a3 scope:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]);
    uint64_t v8 = objc_msgSend(v7, "ams_iTunesAccountWithAltDSID:", v6);
    if (v8) {
      uint64_t v9 = [[SSAccount alloc] initWithBackingAccount:v8];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    [(SSAccountStore *)self accounts];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "altDSID", (void)v18);
          if ([v15 isEqualToString:v6])
          {
            uint64_t v16 = [v14 accountScope];

            if (v16 == a4)
            {
              id v11 = v14;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
LABEL_15:

    uint64_t v9 = (SSAccount *)[v11 copy];
  }

  return v9;
}

- (id)accountWithAltDSID:(id)a3 uniqueIdentifier:(id)a4 accountName:(id)a5
{
  return [(SSAccountStore *)self accountWithAltDSID:a3 uniqueIdentifier:a4 accountName:a5 scope:0];
}

- (id)accountWithAltDSID:(id)a3 uniqueIdentifier:(id)a4 accountName:(id)a5 scope:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (a3 || v10 || v11)
  {
    int v13 = [(SSAccountStore *)self accountWithAltDSID:a3 scope:a6];
    if (!v13)
    {
      int v13 = [(SSAccountStore *)self accountWithUniqueIdentifier:v10 scope:a6];
      if (!v13)
      {
        int v13 = [(SSAccountStore *)self accountWithAccountName:v12 scope:a6];
      }
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (id)accountWithUniqueIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(SSAccountStore *)self accounts];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v18;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v11, "uniqueIdentifier", (void)v17);
        int v13 = [v12 isEqualToNumber:v4];

        if (v13)
        {
          id v14 = v11;

          uint64_t v8 = v14;
          if (![v14 accountScope]) {
            break;
          }
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          id v14 = v8;
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      id v14 = 0;
    }

    uint64_t v15 = (void *)[v14 copy];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)accountWithUniqueIdentifier:(id)a3 scope:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]);
    uint64_t v8 = objc_msgSend(v7, "ams_iTunesAccountWithDSID:", v6);
    if (v8) {
      uint64_t v9 = [[SSAccount alloc] initWithBackingAccount:v8];
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    [(SSAccountStore *)self accounts];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "uniqueIdentifier", (void)v18);
          if ([v15 isEqual:v6])
          {
            uint64_t v16 = [v14 accountScope];

            if (v16 == a4)
            {
              id v11 = v14;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
LABEL_15:

    uint64_t v9 = (SSAccount *)[v11 copy];
  }

  return v9;
}

- (SSAccount)localiTunesAccount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(SSAccountStore *)self accounts];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v6 backingAccount];
        char v8 = objc_msgSend(v7, "ams_isLocalAccount");

        if (v8)
        {
          uint64_t v3 = (void *)[v6 copy];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (SSAccount *)v3;
}

- (SSAccount)activeSandboxAccount
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]);
  uint64_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  if (v3) {
    uint64_t v4 = [[SSAccount alloc] initWithBackingAccount:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (SSAccount)activeLockerAccount
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SSAccountStore *)self activeAccount];
  if ([v2 isActiveLockerAccount]) {
    uint64_t v3 = (void *)[v2 copy];
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = +[SSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  uint64_t v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    v6 &= 2u;
  }
  if (v6)
  {
    char v8 = objc_opt_class();
    id v9 = v8;
    [v3 hashedDescription];
    int v19 = 138543618;
    long long v20 = v8;
    __int16 v21 = 2114;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = 22;
    long long v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_15;
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v19, v18);
    free(v10);
    SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }

LABEL_15:
  return (SSAccount *)v3;
}

- (BOOL)isExpired
{
  uint64_t v2 = objc_opt_class();
  return [v2 isExpired];
}

- (void)resetLocalAccount
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    uint64_t v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  int v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (v5)
  {
    int v35 = 138543362;
    id v36 = (id)objc_opt_class();
    id v7 = v36;
    LODWORD(v33) = 12;
    int v32 = &v35;
    char v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8) {
      goto LABEL_12;
    }
    int v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v35, v33);
    free(v8);
    SSFileLog(v3, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
  }

LABEL_12:
  uint64_t v15 = [(SSAccountStore *)self localAccount];
  uint64_t v16 = [v15 resultWithError:0];

  [v16 setStoreFrontIdentifier:0];
  id v34 = 0;
  BOOL v17 = [(SSAccountStore *)self saveAccount:v16 verifyCredentials:0 error:&v34];
  id v18 = v34;
  if (!v17)
  {
    int v19 = +[SSLogConfig sharedAccountsConfig];
    if (!v19)
    {
      int v19 = +[SSLogConfig sharedConfig];
    }
    int v20 = objc_msgSend(v19, "shouldLog", v32);
    if ([v19 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    id v22 = [v19 OSLogObject];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      v21 &= 2u;
    }
    if (v21)
    {
      uint64_t v23 = objc_opt_class();
      int v35 = 138543618;
      id v36 = v23;
      __int16 v37 = 2114;
      id v38 = v18;
      id v24 = v23;
      LODWORD(v33) = 22;
      uint64_t v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_24:

        goto LABEL_25;
      }
      id v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v35, v33);
      free(v25);
      SSFileLog(v19, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v22);
    }

    goto LABEL_24;
  }
LABEL_25:
}

+ (BOOL)URLResponseAllowsSilentAuthentication:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    int v6 = objc_msgSend(v3, "itunes_allHeaderFields");
    id v7 = [v6 objectForKeyedSubscript:@"X-Apple-Allow-Auth-Types"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v7 componentsSeparatedByString:@" "];
      char v5 = [v8 containsObject:@"silent"];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (id)iTunesStoreAccountType
{
  uint64_t v2 = [(SSAccountStore *)self iTunesStoreAccountTypePromise];
  id v3 = [v2 resultWithError:0];

  return v3;
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = [v8 clientInfo];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setClientInfo:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v9 objectForKey:@"metricsAuthenticationAttempts"];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v9 setObject:v10 forKey:@"metricsAuthenticationAttempts"];
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v7;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:@"authenticate" forKey:@"targetId"];
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  [v13 timeIntervalSince1970];
  double v15 = v14;

  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)(v15 * 1000.0));
  [v12 setObject:v16 forKey:@"responseTime"];
  if (v11)
  {
    [v12 setObject:@"failure" forKey:@"result"];
    uint64_t v17 = [v11 code];
    id v18 = @"unknown";
    if (v17 == -7006) {
      id v18 = @"invalidCredentials";
    }
    if (v17 == -7010) {
      id v18 = @"badServerResponse";
    }
    if (v17 == -7028) {
      int v19 = @"maxNumberOfAttemptsReached";
    }
    else {
      int v19 = v18;
    }
    int v20 = @"reason";
  }
  else
  {
    int v19 = @"success";
    int v20 = @"result";
  }
  [v12 setObject:v19 forKey:v20];

  if (v12) {
    [v10 addObject:v12];
  }

  return v11 == 0;
}

+ (BOOL)areAccountStoreChangedNotificationsDisabled
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"AccountsChangedNotificationsSuppressionStarted", @"com.apple.itunesstored");
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceReferenceDate];
    double v5 = v4;
    [v2 timeIntervalSinceReferenceDate];
    double v7 = v5 - v6;

    BOOL v8 = v7 <= 60.0 && v7 >= 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)clearCachedAccounts
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = +[SSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  double v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_opt_class();
    id v7 = *(id *)((char *)location + 4);
    LODWORD(v17) = 12;
    BOOL v8 = (void *)_os_log_send_and_compose_impl();

    if (v8)
    {
      id v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, location, v17);
      free(v8);
      SSFileLog(v3, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    }
  }
  else
  {
  }
  objc_initWeak(location, self);
  uint64_t v16 = [(SSAccountStore *)self accountsCacheAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSAccountStore_clearCachedAccounts__block_invoke;
  block[3] = &unk_1E5BA8810;
  objc_copyWeak(&v19, location);
  dispatch_barrier_async(v16, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

void __37__SSAccountStore_clearCachedAccounts__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAccountsCache:0];
}

+ (id)existingDefaultStore
{
  pthread_mutex_lock(&__DefaultStoreLock);
  id v2 = (id)__DefaultStore;
  pthread_mutex_unlock(&__DefaultStoreLock);
  return v2;
}

- (BOOL)repairAccountWithBrokenDSID:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v117 = [MEMORY[0x1E4F28B00] currentHandler];
    [v117 handleFailureInMethod:a2, self, @"SSAccountStore.m", 670, @"Invalid parameter not satisfying: %@", @"account" object file lineNumber description];
  }
  if (([v5 isLocalAccount] & 1) == 0 && objc_msgSend(v5, "hasBrokenDSID"))
  {
    double v6 = SSGenerateLogCorrelationString();
    id v7 = +[SSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      uint64_t v13 = [v5 hashedDescription];
      int v125 = 138543874;
      v126 = v11;
      __int16 v127 = 2114;
      v128 = v6;
      __int16 v129 = 2114;
      v130 = v13;
      LODWORD(v120) = 32;
      v118 = &v125;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14) {
        goto LABEL_16;
      }
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v125, v120);
      free(v14);
      SSFileLog(v7, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v10);
    }

LABEL_16:
    int v21 = +[SSLogConfig sharedAccountsConfig];
    if (!v21)
    {
      int v21 = +[SSLogConfig sharedConfig];
    }
    int v22 = objc_msgSend(v21, "shouldLog", v118);
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    id v24 = [v21 OSLogObject];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
      v23 &= 2u;
    }
    if (v23)
    {
      uint64_t v25 = objc_opt_class();
      int v125 = 138543618;
      v126 = v25;
      __int16 v127 = 2114;
      v128 = v6;
      id v26 = v25;
      LODWORD(v120) = 22;
      v119 = &v125;
      uint64_t v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27) {
        goto LABEL_27;
      }
      id v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v125, v120);
      free(v27);
      SSFileLog(v21, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v24);
    }

LABEL_27:
    id v34 = [(SSAccountStore *)self backingAccountStore];
    int v35 = [v5 backingAccount];
    id v36 = objc_msgSend(v34, "_ss_IDMSAccountForAccount:error:", v35, 0);

    uint64_t v37 = objc_msgSend(v36, "_ss_DSID");
    if (v37)
    {
LABEL_28:
      id v38 = (void *)v37;
      goto LABEL_44;
    }
    uint64_t v40 = +[SSLogConfig sharedAccountsConfig];
    if (!v40)
    {
      uint64_t v40 = +[SSLogConfig sharedConfig];
    }
    int v41 = objc_msgSend(v40, "shouldLog", v119);
    if ([v40 shouldLogToDisk]) {
      int v42 = v41 | 2;
    }
    else {
      int v42 = v41;
    }
    v43 = [v40 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
      int v44 = v42;
    }
    else {
      int v44 = v42 & 2;
    }
    if (v44)
    {
      v45 = objc_opt_class();
      int v125 = 138543618;
      v126 = v45;
      __int16 v127 = 2114;
      v128 = v6;
      id v46 = v45;
      LODWORD(v120) = 22;
      v119 = &v125;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47) {
        goto LABEL_42;
      }
      v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v47, 4, &v125, v120);
      free(v47);
      SSFileLog(v40, @"%@", v48, v49, v50, v51, v52, v53, (uint64_t)v43);
    }

LABEL_42:
    v54 = [(SSAccountStore *)self backingAccountStore];
    id v55 = [v5 backingAccount];
    v56 = objc_msgSend(v54, "_ss_iCloudAccountForAccount:error:", v55, 0);

    uint64_t v57 = objc_msgSend(v56, "_ss_DSID");
    if (v57)
    {
      id v38 = (void *)v57;
      id v36 = v56;
LABEL_44:
      objc_msgSend(v5, "setUniqueIdentifier:", v38, v119);
      id v124 = 0;
      int v39 = [(SSAccountStore *)self saveAccount:v5 verifyCredentials:0 error:&v124];
      uint64_t v58 = v124;
      uint64_t v59 = +[SSLogConfig sharedAccountsConfig];
      uint64_t v60 = (void *)v59;
      v123 = v36;
      if (v39)
      {
        uint64_t v61 = v6;
        if (!v59)
        {
          uint64_t v60 = +[SSLogConfig sharedConfig];
        }
        int v62 = [v60 shouldLog];
        if ([v60 shouldLogToDisk]) {
          int v63 = v62 | 2;
        }
        else {
          int v63 = v62;
        }
        uint64_t v64 = [v60 OSLogObject];
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT)) {
          int v65 = v63;
        }
        else {
          int v65 = v63 & 2;
        }
        if (v65)
        {
          v121 = v58;
          v66 = objc_opt_class();
          id v67 = v66;
          v68 = [v5 hashedDescription];
          int v125 = 138543874;
          v126 = v66;
          __int16 v127 = 2114;
          v128 = v61;
          __int16 v129 = 2114;
          v130 = v68;
          LODWORD(v120) = 32;
          int v69 = (void *)_os_log_send_and_compose_impl();

          if (!v69)
          {
            double v6 = v61;
            uint64_t v58 = v121;
            goto LABEL_69;
          }
          uint64_t v64 = objc_msgSend(NSString, "stringWithCString:encoding:", v69, 4, &v125, v120);
          free(v69);
          SSFileLog(v60, @"%@", v70, v71, v72, v73, v74, v75, (uint64_t)v64);
          double v6 = v61;
          uint64_t v58 = v121;
        }
        else
        {
          double v6 = v61;
        }
      }
      else
      {
        v122 = v6;
        if (!v59)
        {
          uint64_t v60 = +[SSLogConfig sharedConfig];
        }
        int v76 = [v60 shouldLog];
        if ([v60 shouldLogToDisk]) {
          v76 |= 2u;
        }
        uint64_t v64 = [v60 OSLogObject];
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          int v77 = v76;
        }
        else {
          int v77 = v76 & 2;
        }
        if (v77)
        {
          uint64_t v78 = objc_opt_class();
          uint64_t v79 = v58;
          id v80 = v78;
          uint64_t v81 = [v5 hashedDescription];
          int v125 = 138544130;
          v126 = v78;
          __int16 v127 = 2114;
          v128 = v122;
          __int16 v129 = 2114;
          v130 = v81;
          __int16 v131 = 2114;
          v82 = v79;
          v132 = v79;
          LODWORD(v120) = 42;
          v83 = (void *)_os_log_send_and_compose_impl();

          if (!v83)
          {
            double v6 = v122;
            uint64_t v58 = v82;
            goto LABEL_69;
          }
          uint64_t v64 = objc_msgSend(NSString, "stringWithCString:encoding:", v83, 4, &v125, v120);
          free(v83);
          SSFileLog(v60, @"%@", v84, v85, v86, v87, v88, v89, (uint64_t)v64);
          double v6 = v122;
          uint64_t v58 = v82;
        }
        else
        {
          double v6 = v122;
        }
      }

LABEL_69:
      id v36 = v123;
      goto LABEL_70;
    }
    id v91 = +[SSLogConfig sharedAccountsConfig];
    if (!v91)
    {
      id v91 = +[SSLogConfig sharedConfig];
    }
    int v92 = objc_msgSend(v91, "shouldLog", v119);
    if ([v91 shouldLogToDisk]) {
      int v93 = v92 | 2;
    }
    else {
      int v93 = v92;
    }
    v94 = [v91 OSLogObject];
    if (!os_log_type_enabled(v94, OS_LOG_TYPE_INFO)) {
      v93 &= 2u;
    }
    if (v93)
    {
      v95 = objc_opt_class();
      int v125 = 138543618;
      v126 = v95;
      __int16 v127 = 2114;
      v128 = v6;
      id v96 = v95;
      LODWORD(v120) = 22;
      v119 = &v125;
      id v97 = (void *)_os_log_send_and_compose_impl();

      if (!v97) {
        goto LABEL_84;
      }
      v94 = objc_msgSend(NSString, "stringWithCString:encoding:", v97, 4, &v125, v120);
      free(v97);
      SSFileLog(v91, @"%@", v98, v99, v100, v101, v102, v103, (uint64_t)v94);
    }

LABEL_84:
    v104 = [(SSAccountStore *)self backingAccountStore];
    v105 = [v5 backingAccount];
    id v36 = objc_msgSend(v104, "_ss_appleAuthenticationAccountForAccount:error:", v105, 0);

    uint64_t v37 = objc_msgSend(v36, "_ss_DSID");
    if (!v37)
    {
      id v38 = +[SSLogConfig sharedAccountsConfig];
      if (!v38)
      {
        id v38 = +[SSLogConfig sharedConfig];
      }
      int v106 = objc_msgSend(v38, "shouldLog", v119);
      if ([v38 shouldLogToDisk]) {
        int v107 = v106 | 2;
      }
      else {
        int v107 = v106;
      }
      uint64_t v58 = [v38 OSLogObject];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        int v39 = v107;
      }
      else {
        int v39 = v107 & 2;
      }
      if (v39)
      {
        v108 = objc_opt_class();
        int v125 = 138543618;
        v126 = v108;
        __int16 v127 = 2114;
        v128 = v6;
        id v109 = v108;
        LODWORD(v120) = 22;
        v110 = (void *)_os_log_send_and_compose_impl();

        if (!v110)
        {
          LOBYTE(v39) = 0;
          goto LABEL_71;
        }
        uint64_t v58 = objc_msgSend(NSString, "stringWithCString:encoding:", v110, 4, &v125, v120);
        free(v110);
        SSFileLog(v38, @"%@", v111, v112, v113, v114, v115, v116, (uint64_t)v58);
        LOBYTE(v39) = 0;
      }
LABEL_70:

LABEL_71:
      goto LABEL_72;
    }
    goto LABEL_28;
  }
  LOBYTE(v39) = 1;
LABEL_72:

  return v39;
}

+ (void)resetExpiration
{
}

+ (void)resetExpirationForTokenType:(int64_t)a3
{
  if (a3 == 1) {
    CFStringRef v3 = (const __CFString *)[@"LastAuthTime" stringByAppendingFormat:@"-%@", @"InAppPurchase"];
  }
  else {
    CFStringRef v3 = @"LastAuthTime";
  }
  CFPreferencesSetAppValue(v3, (CFPropertyListRef)[MEMORY[0x1E4F1C9C8] date], @"com.apple.itunesstored");
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
}

- (id)accountWithUniqueIdentifier:(id)a3 reloadIfNecessary:(BOOL)a4
{
  int v4 = -[SSAccountStore accountWithUniqueIdentifier:](self, "accountWithUniqueIdentifier:", a3, a4);
  id v5 = (void *)[v4 copy];

  return v5;
}

- (void)getDefaultAccountNameUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SSAccountStore *)self keyValueStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SSAccountStore_getDefaultAccountNameUsingBlock___block_invoke;
  v7[3] = &unk_1E5BA9860;
  id v8 = v4;
  id v6 = v4;
  [v5 getValueForDomain:@"com.apple.itunesstored" key:@"DefaultAccountName" usingBlock:v7];
}

uint64_t __50__SSAccountStore_getDefaultAccountNameUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isAuthenticationActive
{
  id v2 = (void *)CFPreferencesCopyAppValue(@"AuthenticationStarted", @"com.apple.itunesstored");
  if (v2)
  {
    CFStringRef v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceReferenceDate];
    double v5 = v4;
    [v2 timeIntervalSinceReferenceDate];
    double v7 = v5 - v6;

    BOOL v8 = v7 <= 600.0 && v7 >= 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)isExpired
{
  return [a1 isExpiredForTokenType:0];
}

+ (BOOL)isExpiredForTokenType:(int64_t)a3
{
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
  if (a3 == 1) {
    CFStringRef v5 = (const __CFString *)[@"LastAuthTime" stringByAppendingFormat:@"-%@", @"InAppPurchase"];
  }
  else {
    CFStringRef v5 = @"LastAuthTime";
  }
  double v6 = (void *)CFPreferencesCopyAppValue(v5, @"com.apple.itunesstored");
  if (v6)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [v6 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [a1 tokenExpirationInterval];
    BOOL v11 = Current > v9 + v10;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (SSAccount)demoAccount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(SSAccountStore *)self accounts];
  CFStringRef v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        double v7 = [v6 backingAccount];
        char v8 = objc_msgSend(v7, "ams_isDemoAccount");

        if (v8)
        {
          CFStringRef v3 = (void *)[v6 copy];
          goto LABEL_11;
        }
      }
      CFStringRef v3 = (void *)[v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (SSAccount *)v3;
}

uint64_t __30__SSAccountStore_localAccount__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

+ (BOOL)migrateToAccountsFramework
{
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = objc_alloc_init(SSKeyValueStore);
  v203 = [(SSKeyValueStore *)v3 accountDictionaries];
  if (![v203 count])
  {
    uint64_t v120 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v120)
    {
      uint64_t v120 = +[SSLogConfig sharedConfig];
    }
    int v121 = [v120 shouldLog];
    if ([v120 shouldLogToDisk]) {
      int v122 = v121 | 2;
    }
    else {
      int v122 = v121;
    }
    v123 = [v120 OSLogObject];
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT)) {
      int v124 = v122;
    }
    else {
      int v124 = v122 & 2;
    }
    if (v124)
    {
      int v226 = 138543362;
      id v227 = (id)objc_opt_class();
      id v125 = v227;
      LODWORD(v202) = 12;
      v126 = (void *)_os_log_send_and_compose_impl();

      if (!v126)
      {
LABEL_120:

        [a1 _excludeCopyKVSDatabasePathFromBackups];
        LOBYTE(v119) = 0;
        goto LABEL_184;
      }
      v123 = objc_msgSend(NSString, "stringWithCString:encoding:", v126, 4, &v226, v202);
      free(v126);
      SSFileLog(v120, @"%@", v127, v128, v129, v130, v131, v132, (uint64_t)v123);
    }

    goto LABEL_120;
  }
  if (+[SSDevice deviceIsInternalBuild]) {
    [a1 _copyKVSDatabaseWithError:0];
  }
  uint64_t v4 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v4)
  {
    uint64_t v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  double v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (v8)
  {
    int v226 = 138543362;
    id v227 = (id)objc_opt_class();
    id v9 = v227;
    LODWORD(v202) = 12;
    v196 = &v226;
    long long v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_16;
    }
    double v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v226, v202);
    free(v10);
    SSFileLog(v4, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }

LABEL_16:
  uint64_t v17 = +[SSAccountStore defaultStore];
  uint64_t v18 = [v17 accountsCacheAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SSAccountStore_migrateToAccountsFramework__block_invoke;
  block[3] = &unk_1E5BA7040;
  id v206 = v17;
  id v225 = v206;
  dispatch_sync(v18, block);

  uint64_t v19 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v19)
  {
    uint64_t v19 = +[SSLogConfig sharedConfig];
  }
  int v20 = objc_msgSend(v19, "shouldLog", v196);
  if ([v19 shouldLogToDisk]) {
    int v21 = v20 | 2;
  }
  else {
    int v21 = v20;
  }
  int v22 = [v19 OSLogObject];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
    int v23 = v21;
  }
  else {
    int v23 = v21 & 2;
  }
  if (!v23) {
    goto LABEL_27;
  }
  id v24 = objc_opt_class();
  id v25 = v24;
  uint64_t v26 = [v203 count];
  int v226 = 138543618;
  id v227 = v24;
  __int16 v228 = 2048;
  uint64_t v229 = v26;
  LODWORD(v202) = 22;
  v197 = &v226;
  uint64_t v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    int v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v226, v202);
    free(v27);
    SSFileLog(v19, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v22);
LABEL_27:
  }
  id v34 = [(SSKeyValueStore *)v3 iTunesValueForKey:@"DSPersonID" usedDomain:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v34 = 0;
  }
  int v35 = [(SSKeyValueStore *)v3 iTunesValueForKey:@"ActiveLockerAccountID", 0, v197 usedDomain];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    int v35 = 0;
  }
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  id v36 = v203;
  v209 = v3;
  uint64_t v213 = [v36 countByEnumeratingWithState:&v220 objects:v234 count:16];
  v207 = v34;
  if (!v213)
  {

    BOOL v119 = 0;
    goto LABEL_123;
  }
  v205 = v35;
  char v204 = 0;
  uint64_t v212 = *(void *)v221;
  id v214 = a1;
  id obj = v36;
  do
  {
    for (uint64_t i = 0; i != v213; ++i)
    {
      if (*(void *)v221 != v212) {
        objc_enumerationMutation(obj);
      }
      uint64_t v38 = *(void *)(*((void *)&v220 + 1) + 8 * i);
      int v39 = SSGenerateLogCorrelationString();
      id v219 = 0;
      int v40 = [a1 _shouldRemoveAccountDictionaryWithoutMigration:v38 reason:&v219];
      id v41 = v219;
      if (v40)
      {
        uint64_t v210 = v38;
        int v42 = v3;
        id v43 = v41;
        int v44 = +[SSLogConfig sharedAccountsMigrationConfig];
        if (!v44)
        {
          int v44 = +[SSLogConfig sharedConfig];
        }
        int v45 = objc_msgSend(v44, "shouldLog", v198);
        if ([v44 shouldLogToDisk]) {
          int v46 = v45 | 2;
        }
        else {
          int v46 = v45;
        }
        v47 = [v44 OSLogObject];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
          int v48 = v46;
        }
        else {
          int v48 = v46 & 2;
        }
        if (v48)
        {
          uint64_t v49 = objc_opt_class();
          int v226 = 138543874;
          id v227 = v49;
          __int16 v228 = 2114;
          uint64_t v229 = (uint64_t)v39;
          __int16 v230 = 2112;
          uint64_t v50 = v43;
          id v231 = v43;
          id v51 = v49;
          LODWORD(v202) = 32;
          v198 = &v226;
          uint64_t v52 = (void *)_os_log_send_and_compose_impl();

          CFStringRef v3 = v42;
          uint64_t v53 = v210;
          if (v52)
          {
            v47 = objc_msgSend(NSString, "stringWithCString:encoding:", v52, 4, &v226, v202);
            free(v52);
            SSFileLog(v44, @"%@", v54, v55, v56, v57, v58, v59, (uint64_t)v47);
            goto LABEL_73;
          }
        }
        else
        {
          uint64_t v50 = v43;
          CFStringRef v3 = v42;
          uint64_t v53 = v210;
LABEL_73:
        }
        [a1 _removeAccountDictionary:v53 fromKeyValueStore:v3];
        goto LABEL_92;
      }
      id v211 = v41;
      uint64_t v60 = [v206 accounts];
      uint64_t v61 = objc_msgSend(v60, "_ss_map:", &__block_literal_global_222);

      int v62 = +[SSLogConfig sharedAccountsMigrationConfig];
      if (!v62)
      {
        int v62 = +[SSLogConfig sharedConfig];
      }
      int v63 = objc_msgSend(v62, "shouldLog", v198);
      if ([v62 shouldLogToDisk]) {
        int v64 = v63 | 2;
      }
      else {
        int v64 = v63;
      }
      int v65 = [v62 OSLogObject];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
        int v66 = v64;
      }
      else {
        int v66 = v64 & 2;
      }
      if (v66)
      {
        id v67 = objc_opt_class();
        id v68 = v67;
        int v69 = [v214 _hashedDescriptionFromAccountDictionary:v38];
        int v226 = 138544130;
        id v227 = v67;
        CFStringRef v3 = v209;
        __int16 v228 = 2114;
        uint64_t v229 = (uint64_t)v39;
        __int16 v230 = 2114;
        id v231 = v69;
        __int16 v232 = 2112;
        v233 = v61;
        LODWORD(v202) = 42;
        v199 = &v226;
        uint64_t v70 = (void *)_os_log_send_and_compose_impl();

        a1 = v214;
        if (!v70) {
          goto LABEL_61;
        }
        int v65 = objc_msgSend(NSString, "stringWithCString:encoding:", v70, 4, &v226, v202);
        free(v70);
        SSFileLog(v62, @"%@", v71, v72, v73, v74, v75, v76, (uint64_t)v65);
      }

LABEL_61:
      id v218 = 0;
      int v77 = [a1 _migrateAccountDictionary:v38 fromKeyValueStore:v3 originalActiveDSID:v207 originalActiveLockerDSID:v205 logKey:v39 error:&v218];
      id v78 = v218;
      uint64_t v79 = +[SSLogConfig sharedAccountsMigrationConfig];
      id v80 = (void *)v79;
      if (!v77)
      {
        if (!v79)
        {
          id v80 = +[SSLogConfig sharedConfig];
        }
        int v93 = objc_msgSend(v80, "shouldLog", v199);
        if ([v80 shouldLogToDisk]) {
          v93 |= 2u;
        }
        v94 = [v80 OSLogObject];
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
          int v95 = v93;
        }
        else {
          int v95 = v93 & 2;
        }
        if (v95)
        {
          id v96 = objc_opt_class();
          int v226 = 138543874;
          id v227 = v96;
          __int16 v228 = 2114;
          uint64_t v229 = (uint64_t)v39;
          __int16 v230 = 2112;
          id v231 = v78;
          id v97 = v96;
          LODWORD(v202) = 32;
          v198 = &v226;
          uint64_t v98 = (void *)_os_log_send_and_compose_impl();

          uint64_t v50 = v211;
          if (!v98)
          {
LABEL_90:

            a1 = v214;
            goto LABEL_91;
          }
          v94 = objc_msgSend(NSString, "stringWithCString:encoding:", v98, 4, &v226, v202);
          free(v98);
          SSFileLog(v80, @"%@", v99, v100, v101, v102, v103, v104, (uint64_t)v94);
        }
        else
        {
          uint64_t v50 = v211;
        }

        goto LABEL_90;
      }
      if (!v79)
      {
        id v80 = +[SSLogConfig sharedConfig];
      }
      int v81 = objc_msgSend(v80, "shouldLog", v199);
      if ([v80 shouldLogToDisk]) {
        v81 |= 2u;
      }
      v82 = [v80 OSLogObject];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
        int v83 = v81;
      }
      else {
        int v83 = v81 & 2;
      }
      if (!v83)
      {
        uint64_t v50 = v211;
        goto LABEL_86;
      }
      uint64_t v84 = objc_opt_class();
      int v226 = 138543618;
      id v227 = v84;
      __int16 v228 = 2114;
      uint64_t v229 = (uint64_t)v39;
      id v85 = v84;
      LODWORD(v202) = 22;
      v198 = &v226;
      uint64_t v86 = (void *)_os_log_send_and_compose_impl();

      uint64_t v50 = v211;
      if (v86)
      {
        v82 = objc_msgSend(NSString, "stringWithCString:encoding:", v86, 4, &v226, v202);
        free(v86);
        SSFileLog(v80, @"%@", v87, v88, v89, v90, v91, v92, (uint64_t)v82);
LABEL_86:
      }
      a1 = v214;
      CFStringRef v3 = v209;
      [v214 _removeAccountDictionary:v38 fromKeyValueStore:v209];
      char v204 = 1;
LABEL_91:

LABEL_92:
    }
    uint64_t v213 = [obj countByEnumeratingWithState:&v220 objects:v234 count:16];
  }
  while (v213);

  if (v204)
  {
    v105 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v105)
    {
      v105 = +[SSLogConfig sharedConfig];
    }
    int v106 = objc_msgSend(v105, "shouldLog", v198);
    if ([v105 shouldLogToDisk]) {
      int v107 = v106 | 2;
    }
    else {
      int v107 = v106;
    }
    v108 = [v105 OSLogObject];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO)) {
      int v109 = v107;
    }
    else {
      int v109 = v107 & 2;
    }
    if (v109)
    {
      v110 = objc_opt_class();
      int v226 = 138543362;
      id v227 = v110;
      id v111 = v110;
      LODWORD(v202) = 12;
      v198 = &v226;
      uint64_t v112 = (void *)_os_log_send_and_compose_impl();

      if (v112)
      {
        v108 = objc_msgSend(NSString, "stringWithCString:encoding:", v112, 4, &v226, v202);
        free(v112);
        SSFileLog(v105, @"%@", v113, v114, v115, v116, v117, v118, (uint64_t)v108);
        goto LABEL_106;
      }
    }
    else
    {
LABEL_106:
    }
    int v35 = v205;
    [a1 _cleanupActiveAccountsAfterMigrationWithActiveDSID:v207 activeLockerDSID:v205];
    BOOL v119 = 1;
  }
  else
  {
    BOOL v119 = 0;
    int v35 = v205;
  }
LABEL_123:
  uint64_t v133 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v133)
  {
    uint64_t v133 = +[SSLogConfig sharedConfig];
  }
  int v134 = [v133 shouldLog];
  if ([v133 shouldLogToDisk]) {
    int v135 = v134 | 2;
  }
  else {
    int v135 = v134;
  }
  v136 = [v133 OSLogObject];
  if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO)) {
    int v137 = v135;
  }
  else {
    int v137 = v135 & 2;
  }
  if (v137)
  {
    v138 = objc_opt_class();
    int v226 = 138543362;
    id v227 = v138;
    id v139 = v138;
    LODWORD(v202) = 12;
    v200 = &v226;
    v140 = (void *)_os_log_send_and_compose_impl();

    if (v140)
    {
      v136 = objc_msgSend(NSString, "stringWithCString:encoding:", v140, 4, &v226, v202);
      free(v140);
      SSFileLog(v133, @"%@", v141, v142, v143, v144, v145, v146, (uint64_t)v136);
      goto LABEL_134;
    }
  }
  else
  {
LABEL_134:
  }
  v147 = [v206 accountsCacheAccessQueue];
  v216[0] = MEMORY[0x1E4F143A8];
  v216[1] = 3221225472;
  v216[2] = __44__SSAccountStore_migrateToAccountsFramework__block_invoke_223;
  v216[3] = &unk_1E5BA7040;
  id v148 = v206;
  id v217 = v148;
  dispatch_sync(v147, v216);

  uint64_t v149 = +[SSLogConfig sharedAccountsMigrationConfig];
  v150 = (void *)v149;
  if (!v119)
  {
    if (!v149)
    {
      v150 = +[SSLogConfig sharedConfig];
    }
    int v163 = objc_msgSend(v150, "shouldLog", v200);
    if ([v150 shouldLogToDisk]) {
      v163 |= 2u;
    }
    v164 = [v150 OSLogObject];
    if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO)) {
      int v165 = v163;
    }
    else {
      int v165 = v163 & 2;
    }
    if (v165)
    {
      v166 = objc_opt_class();
      int v226 = 138543362;
      id v227 = v166;
      id v167 = v166;
      LODWORD(v202) = 12;
      v201 = &v226;
      v168 = (void *)_os_log_send_and_compose_impl();

      if (!v168)
      {
LABEL_159:

        goto LABEL_160;
      }
      v164 = objc_msgSend(NSString, "stringWithCString:encoding:", v168, 4, &v226, v202);
      free(v168);
      SSFileLog(v150, @"%@", v169, v170, v171, v172, v173, v174, (uint64_t)v164);
    }

    goto LABEL_159;
  }
  if (!v149)
  {
    v150 = +[SSLogConfig sharedConfig];
  }
  int v151 = objc_msgSend(v150, "shouldLog", v200);
  if ([v150 shouldLogToDisk]) {
    v151 |= 2u;
  }
  v152 = [v150 OSLogObject];
  if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO)) {
    int v153 = v151;
  }
  else {
    int v153 = v151 & 2;
  }
  if (v153)
  {
    v154 = objc_opt_class();
    int v226 = 138543362;
    id v227 = v154;
    id v155 = v154;
    LODWORD(v202) = 12;
    v201 = &v226;
    v156 = (void *)_os_log_send_and_compose_impl();

    if (v156)
    {
      v152 = objc_msgSend(NSString, "stringWithCString:encoding:", v156, 4, &v226, v202);
      free(v156);
      SSFileLog(v150, @"%@", v157, v158, v159, v160, v161, v162, (uint64_t)v152);
      goto LABEL_146;
    }
  }
  else
  {
LABEL_146:
  }
  [a1 _postAccountsChangedInternalDarwinNotification];
  [a1 _postAccountsChangedDarwinNotification];
LABEL_160:
  v175 = [(SSKeyValueStore *)v3 accountDictionaries];
  v215[0] = MEMORY[0x1E4F143A8];
  v215[1] = 3221225472;
  v215[2] = __44__SSAccountStore_migrateToAccountsFramework__block_invoke_224;
  v215[3] = &__block_descriptor_40_e32___NSString_16__0__NSDictionary_8l;
  v215[4] = a1;
  v176 = objc_msgSend(v175, "_ss_map:", v215);

  uint64_t v177 = [v176 count];
  uint64_t v178 = +[SSLogConfig sharedAccountsMigrationConfig];
  v179 = (void *)v178;
  if (v177)
  {
    if (!v178)
    {
      v179 = +[SSLogConfig sharedConfig];
    }
    int v180 = [v179 shouldLog];
    if ([v179 shouldLogToDisk]) {
      v180 |= 2u;
    }
    v181 = [v179 OSLogObject];
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR)) {
      int v182 = v180;
    }
    else {
      int v182 = v180 & 2;
    }
    if (v182)
    {
      v183 = objc_opt_class();
      int v226 = 138543618;
      id v227 = v183;
      __int16 v228 = 2112;
      uint64_t v229 = (uint64_t)v176;
      id v184 = v183;
      LODWORD(v202) = 22;
      goto LABEL_179;
    }
LABEL_181:
  }
  else
  {
    if (!v178)
    {
      v179 = +[SSLogConfig sharedConfig];
    }
    int v185 = [v179 shouldLog];
    if ([v179 shouldLogToDisk]) {
      v185 |= 2u;
    }
    v181 = [v179 OSLogObject];
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO)) {
      int v186 = v185;
    }
    else {
      int v186 = v185 & 2;
    }
    if (!v186) {
      goto LABEL_181;
    }
    v187 = objc_opt_class();
    int v226 = 138543362;
    id v227 = v187;
    id v184 = v187;
    LODWORD(v202) = 12;
LABEL_179:
    v188 = (void *)_os_log_send_and_compose_impl();

    if (v188)
    {
      v181 = objc_msgSend(NSString, "stringWithCString:encoding:", v188, 4, &v226, v202);
      free(v188);
      SSFileLog(v179, @"%@", v189, v190, v191, v192, v193, v194, (uint64_t)v181);
      CFStringRef v3 = v209;
      goto LABEL_181;
    }
    CFStringRef v3 = v209;
  }

LABEL_184:
  return v119;
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInProcessCacheDisabled:1];
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke_219(uint64_t a1, void *a2)
{
  return [a2 hashedDescription];
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke_223(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccountsCache:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setInProcessCacheDisabled:0];
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke_224(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _hashedDescriptionFromAccountDictionary:a2];
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = __Block_byref_object_copy__19;
  int v40 = __Block_byref_object_dispose__19;
  id v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __38__SSAccountStore_removeAccount_error___block_invoke;
  v28[3] = &unk_1E5BA9918;
  uint64_t v30 = &v36;
  uint64_t v31 = &v32;
  int v8 = v7;
  uint64_t v29 = v8;
  [(SSAccountStore *)self removeAccount:v6 completion:v28];
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    long long v10 = +[SSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      long long v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    int v12 = [v10 shouldLogToDisk];
    uint64_t v13 = [v10 OSLogObject];
    uint64_t v14 = v13;
    if (v12) {
      v11 |= 2u;
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      id v15 = (id)objc_opt_class();
      uint64_t v16 = [v6 accountName];
      uint64_t v17 = SSHashIfNeeded(v16);
      int v42 = 138543618;
      id v43 = v15;
      __int16 v44 = 2114;
      int v45 = v17;
      LODWORD(v27) = 22;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v42, v27);
      free(v18);
      SSFileLog(v10, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v14);
    }

    goto LABEL_12;
  }
LABEL_13:
  if (a4) {
    *a4 = (id) v37[5];
  }
  BOOL v25 = *((unsigned char *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v25;
}

void __38__SSAccountStore_removeAccount_error___block_invoke(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_semaphore_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = +[SSLogConfig sharedAccountsConfig];
  dispatch_time_t v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      dispatch_time_t v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [v6 accountName];
      SSHashIfNeeded(v15);
      int v45 = 138543618;
      id v46 = v13;
      __int16 v47 = 2114;
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = 22;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16) {
        goto LABEL_13;
      }
      int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v45, v40);
      free(v16);
      SSFileLog(v9, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v12);
    }

LABEL_13:
    int v23 = [(id)objc_opt_class() unitTestModeEnabled];
    uint64_t v24 = objc_opt_class();
    BOOL v25 = v24;
    if (v23)
    {
      [v24 _removeAccountFromUnitTestStore:v6];
      __AccountsChangedInternal();
      if (([(id)objc_opt_class() areAccountStoreChangedNotificationsDisabled] & 1) == 0) {
        __AccountsChanged();
      }
      if (v7) {
        v7[2](v7, 1, 0);
      }
    }
    else
    {
      uint64_t v37 = [(id)objc_opt_class() _backingAccountForAccount:v6];
      uint64_t v38 = [(SSAccountStore *)self backingAccountStore];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __43__SSAccountStore_removeAccount_completion___block_invoke;
      v41[3] = &unk_1E5BA9940;
      __int16 v44 = v25;
      id v42 = v37;
      id v43 = v7;
      id v39 = v37;
      [v38 removeAccount:v39 withCompletionHandler:v41];
    }
    goto LABEL_32;
  }
  if (!v8)
  {
    dispatch_time_t v9 = +[SSLogConfig sharedConfig];
  }
  int v26 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  uint64_t v28 = [v9 OSLogObject];
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    v27 &= 2u;
  }
  if (v27)
  {
    int v45 = 138543362;
    id v46 = (id)objc_opt_class();
    id v29 = v46;
    LODWORD(v40) = 12;
    uint64_t v30 = (void *)_os_log_send_and_compose_impl();

    if (!v30) {
      goto LABEL_29;
    }
    uint64_t v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v30, 4, &v45, v40);
    free(v30);
    SSFileLog(v9, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v28);
  }

LABEL_29:
  if (v7) {
    v7[2](v7, 0, 0);
  }
LABEL_32:
}

void __43__SSAccountStore_removeAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = +[SSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    dispatch_time_t v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      int v10 = v8;
    }
    else {
      int v10 = v8 & 2;
    }
    if (v10)
    {
      int v11 = objc_opt_class();
      int v12 = *(void **)(a1 + 32);
      id v13 = v11;
      id v14 = [v12 description];
      SSHashIfNeeded(v14);
      int v24 = 138543874;
      BOOL v25 = v11;
      __int16 v26 = 2114;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v28 = 2112;
      id v29 = v5;
      LODWORD(v23) = 32;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      dispatch_time_t v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v24, v23);
      free(v15);
      SSFileLog(v6, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v9);
    }

    goto LABEL_14;
  }
LABEL_15:
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, uint64_t, id))(v22 + 16))(v22, a2, v5);
  }
}

- (void)removeAllAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SSAccountStore *)self accounts];
  objc_initWeak(&location, self);
  id v6 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke;
  v9[3] = &unk_1E5BA9990;
  objc_copyWeak(&v12, &location);
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFStringRef v3 = dispatch_group_create();
  id v4 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.removeAccountsQueue", MEMORY[0x1E4F14430]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v29 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_2;
        block[3] = &unk_1E5BA7018;
        void block[4] = WeakRetained;
        void block[5] = v10;
        dispatch_group_async(v3, v4, block);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
  }

  dispatch_time_t v11 = dispatch_time(0, 300000000000);
  if (dispatch_group_wait(v3, v11))
  {
    id v12 = +[SSLogConfig sharedAccountsConfig];
    if (!v12)
    {
      id v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    id v15 = [v12 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      int v16 = v14;
    }
    else {
      int v16 = v14 & 2;
    }
    if (v16)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = *(void *)(v29 + 32);
      int v35 = 138543618;
      uint64_t v36 = v17;
      __int16 v37 = 2112;
      uint64_t v38 = v18;
      id v19 = v17;
      LODWORD(v28) = 22;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v35, v28);
      free(v20);
      SSFileLog(v12, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
    }

    goto LABEL_21;
  }
LABEL_22:
  uint64_t v27 = *(void *)(v29 + 40);
  if (v27) {
    (*(void (**)(void))(v27 + 16))();
  }
}

void __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  CFStringRef v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_3;
  v24[3] = &unk_1E5BA9968;
  id v5 = v2;
  uint64_t v25 = v5;
  [v3 removeAccount:v4 completion:v24];
  dispatch_time_t v6 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    uint64_t v7 = +[SSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      uint64_t v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      dispatch_time_t v11 = objc_opt_class();
      id v12 = *(void **)(a1 + 40);
      id v13 = v11;
      int v14 = [v12 description];
      id v15 = SSHashIfNeeded(v14);
      int v26 = 138543618;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      uint64_t v29 = v15;
      LODWORD(v23) = 22;
      int v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v26, v23);
      free(v16);
      SSFileLog(v7, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v10);
    }

    goto LABEL_13;
  }
LABEL_14:
}

intptr_t __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeCookiesForAccount:(id)a3 logKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SSLogConfig sharedAccountsCookiesConfig];
  if (!v7)
  {
    uint64_t v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  uint64_t v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  dispatch_time_t v11 = objc_opt_class();
  id v12 = v11;
  id v13 = [v5 accountName];
  SSHashIfNeeded(v13);
  int v23 = 138543874;
  uint64_t v24 = v11;
  __int16 v25 = 2114;
  id v26 = v6;
  __int16 v27 = 2114;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 32;
  int v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v23, v22);
    free(v14);
    SSFileLog(v7, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v10);
LABEL_11:
  }
  uint64_t v21 = +[SSVCookieStorage sharedStorage];
  [v21 removeCookiesWithAccount:v5];
}

- (void)resetExpiration
{
  dispatch_semaphore_t v2 = objc_opt_class();
  [v2 resetExpiration];
}

- (void)resetExpirationForTokenType:(int64_t)a3
{
  uint64_t v4 = objc_opt_class();
  [v4 resetExpirationForTokenType:a3];
}

- (void)saveAccount:(id)a3 completion:(id)a4
{
}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  return [(SSAccountStore *)self saveAccount:a3 verifyCredentials:1 error:a4];
}

- (void)saveAccount:(id)a3 verifyCredentials:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  int v9 = [(SSAccountStore *)self _saveAccount:a3 verifyCredentials:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SSAccountStore_saveAccount_verifyCredentials_completion___block_invoke;
  v11[3] = &unk_1E5BA99B8;
  id v12 = v8;
  id v10 = v8;
  [v9 addFinishBlock:v11];
}

void __59__SSAccountStore_saveAccount_verifyCredentials_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, [a2 BOOLValue], v5);
  }
}

- (BOOL)saveAccount:(id)a3 verifyCredentials:(BOOL)a4 error:(id *)a5
{
  id v6 = [(SSAccountStore *)self _saveAccount:a3 verifyCredentials:a4];
  uint64_t v7 = [v6 resultWithTimeout:a5 error:5.0];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setDefaultAccountName:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(SSAccountStore *)self keyValueStore];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SSAccountStore_setDefaultAccountName_completionBlock___block_invoke;
  v10[3] = &unk_1E5BA99E0;
  id v11 = v6;
  id v9 = v6;
  [v8 setValue:v7 forDomain:@"com.apple.itunesstored" key:@"DefaultAccountName" completionBlock:v10];
}

uint64_t __56__SSAccountStore_setDefaultAccountName_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)setAuthenticationStartedDate:(id)a3
{
  CFPreferencesSetAppValue(@"AuthenticationStarted", a3, @"com.apple.itunesstored");
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
}

- (void)signOutAccount:(id)a3
{
}

- (void)signOutAccount:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  id v7 = SSGenerateLogCorrelationString();
  char v8 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v8)
  {
    char v8 = +[SSLogConfig sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    v9 |= 2u;
  }
  id v10 = [v8 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    int v11 = v9;
  }
  else {
    int v11 = v9 & 2;
  }
  if (v11)
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    int v14 = [v6 accountName];
    SSHashIfNeeded(v14);
    *(_DWORD *)id location = 138543874;
    *(void *)&id location[4] = v12;
    __int16 v43 = 2114;
    __int16 v44 = v7;
    __int16 v45 = 2114;
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = 32;
    uint64_t v15 = (void *)_os_log_send_and_compose_impl();

    if (v15)
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, location, v31);
      free(v15);
      SSFileLog(v8, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }
  }
  else
  {
  }
  [v6 setActive:0];
  int v23 = objc_alloc_init(SSPromise);
  objc_initWeak((id *)location, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __44__SSAccountStore_signOutAccount_completion___block_invoke;
  v37[3] = &unk_1E5BA9A08;
  objc_copyWeak(&v41, (id *)location);
  id v24 = v7;
  id v38 = v24;
  id v25 = v6;
  id v39 = v25;
  id v26 = v32;
  id v40 = v26;
  [(SSPromise *)v23 addSuccessBlock:v37];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __44__SSAccountStore_signOutAccount_completion___block_invoke_233;
  v33[3] = &unk_1E5BA9A30;
  v33[4] = self;
  id v27 = v24;
  id v34 = v27;
  id v28 = v25;
  id v35 = v28;
  id v29 = v26;
  id v36 = v29;
  [(SSPromise *)v23 addErrorBlock:v33];
  uint64_t v30 = [(SSPromise *)v23 BOOLCompletionHandlerAdapter];
  [(SSAccountStore *)self saveAccount:v28 verifyCredentials:0 completion:v30];

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)location);
}

void __44__SSAccountStore_signOutAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v3)
  {
    uint64_t v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    int v7 = v5;
  }
  else {
    int v7 = v5 & 2;
  }
  if (v7)
  {
    char v8 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 32);
    int v9 = *(void **)(a1 + 40);
    id v11 = v8;
    id v12 = [v9 accountName];
    SSHashIfNeeded(v12);
    int v22 = 138543874;
    int v23 = v8;
    __int16 v24 = 2114;
    uint64_t v25 = v10;
    __int16 v26 = 2114;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 32;
    id v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_13;
    }
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
    free(v13);
    SSFileLog(v3, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v6);
  }

LABEL_13:
  [WeakRetained removeCookiesForAccount:*(void *)(a1 + 40) logKey:*(void *)(a1 + 32)];
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t, void))(v20 + 16))(v20, 1, 0);
  }
}

void __44__SSAccountStore_signOutAccount_completion___block_invoke_233(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v4)
  {
    int v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  int v7 = [v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    int v8 = v6;
  }
  else {
    int v8 = v6 & 2;
  }
  if (v8)
  {
    int v9 = objc_opt_class();
    uint64_t v11 = a1[5];
    uint64_t v10 = (void *)a1[6];
    id v12 = v9;
    id v13 = [v10 accountName];
    SSHashIfNeeded(v13);
    int v23 = 138544130;
    __int16 v24 = v9;
    __int16 v25 = 2114;
    uint64_t v26 = v11;
    __int16 v27 = 2114;
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v29 = 2112;
    id v30 = v3;
    LODWORD(v22) = 42;
    uint64_t v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_13;
    }
    int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v23, v22);
    free(v14);
    SSFileLog(v4, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v7);
  }

LABEL_13:
  uint64_t v21 = a1[7];
  if (v21) {
    (*(void (**)(uint64_t, void, id))(v21 + 16))(v21, 0, v3);
  }
}

- (id)updateAccountWithAuthKit:(id)a3 store:(id)a4 options:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"SSAccountStoreAuthKitSkipAuthKitKey"];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    id v13 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v13)
    {
      id v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    uint64_t v16 = [v13 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      int v17 = v15;
    }
    else {
      int v17 = v15 & 2;
    }
    if (v17)
    {
      [v10 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      *(_DWORD *)id location = 138543618;
      *(void *)&id location[4] = self;
      __int16 v45 = 2114;
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 22;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (v18)
      {
        uint64_t v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, location, v35);
        free(v18);
        SSFileLog(v13, @"%@", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      }
    }
    else
    {
    }
    id v32 = [SSUpdateAccountResponse alloc];
    long long v33 = [v10 objectForKeyedSubscript:@"SSAccountStoreAuthKitCredentialSource"];
    uint64_t v26 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:](v32, "initWithUpdatedAccount:credentialSource:", v8, [v33 unsignedIntegerValue]);

    uint64_t v31 = +[SSPromise promiseWithResult:v26];
  }
  else
  {
    uint64_t v26 = [v10 objectForKeyedSubscript:@"SSAccountStoresProxiedDeviceFlagKey"];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(SSUpdateAccountResponse *)v26 BOOLValue])
    {
      __int16 v27 = (void *)[v10 mutableCopy];
      [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SSAccountStoreAuthKitAllowSilentAuth"];

      id v10 = v27;
    }
    id v28 = [(SSAccountStore *)self _shouldCreateNewAccountForAccount:v8 options:v10];
    objc_initWeak((id *)location, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke;
    v39[3] = &unk_1E5BA9A58;
    objc_copyWeak(&v43, (id *)location);
    id v29 = v10;
    id v40 = v29;
    id v41 = v8;
    id v42 = v9;
    id v30 = [v28 thenWithBlock:v39];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke_251;
    v36[3] = &unk_1E5BA9A80;
    objc_copyWeak(&v38, (id *)location);
    id v10 = v29;
    id v37 = v10;
    uint64_t v31 = [v30 thenWithBlock:v36];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)location);
  }
  return v31;
}

id __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [v4 integerValue];

  if (v6 == 3)
  {
    uint64_t v20 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v20)
    {
      uint64_t v20 = +[SSLogConfig sharedConfig];
    }
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    uint64_t v23 = [v20 OSLogObject];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (v22)
    {
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v45 = 138543618;
      id v46 = WeakRetained;
      __int16 v47 = 2114;
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v43) = 22;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_26:

        uint64_t v31 = SSViTunesStoreFramework();
        id v32 = objc_alloc((Class)SSVWeakLinkedClassForString(&cfstr_Iscreateaccoun.isa, v31));
        long long v33 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountDSIDKey"];
        id v34 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"];
        uint64_t v35 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountTargetIdentifierKey"];
        uint64_t v18 = (void *)[v32 initWithDSID:v33 additionalQueryParams:v34 targetIdentifier:v35];

        uint64_t v36 = SSViTunesStoreFramework();
        id v37 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Isoperationque.isa, v36), "mainQueue");
        [v37 addOperation:v18];

        id v38 = SSError(@"SSErrorDomain", 140, 0, @"The user opted to create a new account.");
        uint64_t v19 = +[SSPromise promiseWithError:v38];
        goto LABEL_28;
      }
      uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v45, v43);
      free(v24);
      SSFileLog(v20, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v23);
    }

    goto LABEL_26;
  }
  if (v6 == 2)
  {
    int v7 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v7)
    {
      int v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v45 = 138543618;
      id v46 = WeakRetained;
      __int16 v47 = 2114;
      id v48 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v43) = 22;
      uint64_t v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_14:

        uint64_t v18 = SSError(@"SSErrorDomain", 140, 0, @"The user cancelled the create account dialog.");
        uint64_t v19 = +[SSPromise promiseWithError:v18];
        goto LABEL_29;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v45, v43);
      free(v11);
      SSFileLog(v7, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v10);
    }

    goto LABEL_14;
  }
  uint64_t v18 = [WeakRetained _updateAccountWithAuthKitViaSilentPETAuth:*(void *)(a1 + 40) options:*(void *)(a1 + 32)];
  v44[0] = v18;
  id v38 = [WeakRetained _updateAccountWithAuthKitViaSilentPasswordAuth:*(void *)(a1 + 40) options:*(void *)(a1 + 32)];
  v44[1] = v38;
  id v39 = [WeakRetained _updateAccountWithAuthKitViaSilentAuth:*(void *)(a1 + 40) options:*(void *)(a1 + 32)];
  v44[2] = v39;
  id v40 = [WeakRetained _updateAccountWithAuthKitViaPromptAuth:*(void *)(a1 + 40) store:*(void *)(a1 + 48) options:*(void *)(a1 + 32)];
  v44[3] = v40;
  id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  uint64_t v19 = +[SSPromise promiseWithAny:v41];

LABEL_28:
LABEL_29:

  return v19;
}

id __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke_251(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = [v3 updatedAccount];
  if ([v5 isActive])
  {
    BOOL v6 = 0;
  }
  else
  {
    if ([v5 accountScope] == 1)
    {
      int v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E4F4D9F0]);
      int v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
    }
    else
    {
      int v7 = [WeakRetained activeAccount];
      int v8 = v7;
    }
    BOOL v6 = v8 == 0;
  }
  int v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitCanSetActiveAccountKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  int v11 = [v10 BOOLValue];
  if ((v11 & v6) == 1)
  {
    uint64_t v12 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v12)
    {
      uint64_t v12 = +[SSLogConfig sharedConfig];
    }
    int v13 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v14 = v13 | 2;
    }
    else {
      int v14 = v13;
    }
    uint64_t v15 = [v12 OSLogObject];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      v14 &= 2u;
    }
    if (v14)
    {
      uint64_t v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      uint64_t v17 = [v5 accountName];
      SSHashIfNeeded(v17);
      int v29 = 138543874;
      id v30 = WeakRetained;
      __int16 v31 = 2114;
      id v32 = v16;
      __int16 v33 = 2114;
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = 32;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_22:

        [v5 setActive:1];
        uint64_t v25 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:]([SSUpdateAccountResponse alloc], "initWithUpdatedAccount:credentialSource:", v5, [v3 credentialSource]);
        uint64_t v26 = +[SSPromise promiseWithResult:v25];

        goto LABEL_24;
      }
      uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v29, v28);
      free(v18);
      SSFileLog(v12, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
    }

    goto LABEL_22;
  }
  uint64_t v26 = +[SSPromise promiseWithResult:v3];
LABEL_24:

  return v26;
}

+ (void)setUnitTestModeEnabled:(BOOL)a3
{
  id v4 = [a1 _unitTestAccountsAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSAccountStore_setUnitTestModeEnabled___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  dispatch_barrier_async(v4, block);
}

void __41__SSAccountStore_setUnitTestModeEnabled___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  if (sUnitTestModeEnabled != v1)
  {
    sUnitTestModeEnabled = *(unsigned char *)(a1 + 32);
    if (v1)
    {
      if (!sUnitTestAccounts)
      {
        id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v3 = (void *)sUnitTestAccounts;
        sUnitTestAccounts = (uint64_t)v2;
      }
    }
    else
    {
      [(id)sUnitTestAccounts removeAllObjects];
    }
    id v4 = +[SSAccountStore defaultStore];
    [v4 clearCachedAccounts];
  }
}

+ (void)_addAccountToUnitTestStore:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _unitTestAccountsAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SSAccountStore__addAccountToUnitTestStore___block_invoke;
  block[3] = &unk_1E5BA7040;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);
}

void __45__SSAccountStore__addAccountToUnitTestStore___block_invoke(uint64_t a1)
{
  id v2 = (void *)sUnitTestAccounts;
  if (!sUnitTestAccounts)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)sUnitTestAccounts;
    sUnitTestAccounts = (uint64_t)v3;

    id v2 = (void *)sUnitTestAccounts;
  }
  int v5 = *(void **)(a1 + 32);
  id v7 = [v5 backingAccount];
  id v6 = [v7 identifier];
  [v2 setObject:v5 forKeyedSubscript:v6];
}

+ (void)_removeAccountFromUnitTestStore:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _unitTestAccountsAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SSAccountStore__removeAccountFromUnitTestStore___block_invoke;
  block[3] = &unk_1E5BA7040;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);
}

void __50__SSAccountStore__removeAccountFromUnitTestStore___block_invoke(uint64_t a1)
{
  id v2 = (void *)sUnitTestAccounts;
  if (!sUnitTestAccounts)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)sUnitTestAccounts;
    sUnitTestAccounts = (uint64_t)v3;

    id v2 = (void *)sUnitTestAccounts;
  }
  id v6 = [*(id *)(a1 + 32) backingAccount];
  int v5 = [v6 identifier];
  [v2 removeObjectForKey:v5];
}

+ (id)_backingAccountForAccount:(id)a3
{
  id v3 = [a3 backingAccount];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)_buyParamsForBuyParamsString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v5 = [v3 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v10 count] == 2)
        {
          int v11 = [v10 objectAtIndexedSubscript:0];
          uint64_t v12 = [v10 objectAtIndexedSubscript:1];
          int v13 = (void *)v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];

  return v15;
}

+ (id)_copyKVSDatabasePath
{
  id v2 = +[SSKeyValueStoreSchema databasePath];
  id v3 = [v2 stringByDeletingPathExtension];
  id v4 = [NSString stringWithFormat:@"%@-copy", v3];

  int v5 = [v4 stringByAppendingPathExtension:@"sqlitedb"];

  return v5;
}

+ (BOOL)_copyKVSDatabaseWithError:(id *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  int v5 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    int v73 = 138543362;
    id v74 = (id)objc_opt_class();
    id v9 = v74;
    LODWORD(v69) = 12;
    id v68 = &v73;
    id v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_12;
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v73, v69);
    free(v10);
    SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
  }

LABEL_12:
  long long v17 = +[SSKeyValueStoreSchema databasePath];
  long long v18 = (void *)[a1 _copyKVSDatabasePath];
  long long v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v19 fileExistsAtPath:v18]) {
    goto LABEL_38;
  }
  long long v20 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v20)
  {
    long long v20 = +[SSLogConfig sharedConfig];
  }
  int v21 = objc_msgSend(v20, "shouldLog", v68);
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  uint64_t v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    v22 &= 2u;
  }
  if (v22)
  {
    uint64_t v24 = objc_opt_class();
    int v73 = 138543362;
    id v74 = v24;
    id v25 = v24;
    LODWORD(v69) = 12;
    id v68 = &v73;
    uint64_t v26 = (void *)_os_log_send_and_compose_impl();

    if (!v26) {
      goto LABEL_24;
    }
    uint64_t v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v26, 4, &v73, v69);
    free(v26);
    SSFileLog(v20, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v23);
  }

LABEL_24:
  id v72 = 0;
  char v33 = [v19 removeItemAtPath:v18 error:&v72];
  id v34 = v72;
  if ((v33 & 1) == 0)
  {
    uint64_t v35 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v35)
    {
      uint64_t v35 = +[SSLogConfig sharedConfig];
    }
    int v36 = objc_msgSend(v35, "shouldLog", v68);
    if ([v35 shouldLogToDisk]) {
      int v37 = v36 | 2;
    }
    else {
      int v37 = v36;
    }
    id v38 = [v35 OSLogObject];
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      v37 &= 2u;
    }
    if (v37)
    {
      id v39 = objc_opt_class();
      int v73 = 138543618;
      id v74 = v39;
      __int16 v75 = 2112;
      id v76 = v34;
      id v40 = v17;
      id v41 = a3;
      id v42 = v39;
      LODWORD(v69) = 22;
      id v68 = &v73;
      uint64_t v43 = (void *)_os_log_send_and_compose_impl();

      a3 = v41;
      long long v17 = v40;

      if (!v43)
      {
LABEL_36:

        goto LABEL_37;
      }
      id v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v73, v69);
      free(v43);
      SSFileLog(v35, @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v38);
    }

    goto LABEL_36;
  }
LABEL_37:

LABEL_38:
  id v71 = 0;
  int v50 = objc_msgSend(v19, "copyItemAtPath:toPath:error:", v17, v18, &v71, v68);
  id v51 = v71;
  if (v50)
  {
    [a1 _excludeCopyKVSDatabasePathFromBackups];
    if (!a3) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  uint64_t v70 = v17;
  uint64_t v52 = a3;
  uint64_t v53 = +[SSLogConfig sharedAccountsMigrationConfig];
  if (!v53)
  {
    uint64_t v53 = +[SSLogConfig sharedConfig];
  }
  int v54 = [v53 shouldLog];
  if ([v53 shouldLogToDisk]) {
    int v55 = v54 | 2;
  }
  else {
    int v55 = v54;
  }
  uint64_t v56 = [v53 OSLogObject];
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    int v57 = v55;
  }
  else {
    int v57 = v55 & 2;
  }
  if (v57)
  {
    uint64_t v58 = objc_opt_class();
    int v73 = 138543618;
    id v74 = v58;
    __int16 v75 = 2112;
    id v76 = v51;
    id v59 = v58;
    LODWORD(v69) = 22;
    uint64_t v60 = (void *)_os_log_send_and_compose_impl();

    a3 = v52;
    long long v17 = v70;
    if (!v60) {
      goto LABEL_54;
    }
    uint64_t v56 = objc_msgSend(NSString, "stringWithCString:encoding:", v60, 4, &v73, v69);
    free(v60);
    SSFileLog(v53, @"%@", v61, v62, v63, v64, v65, v66, (uint64_t)v56);
  }
  else
  {
    a3 = v52;
    long long v17 = v70;
  }

LABEL_54:
  if (a3) {
LABEL_55:
  }
    *a3 = v51;
LABEL_56:

  return v50;
}

+ (BOOL)_currentProcessLinksUIKit
{
  return NSClassFromString(&cfstr_Uiapplication.isa) != 0;
}

+ (void)_disableAccountStoreChangedNotifications
{
  CFPreferencesSetAppValue(@"AccountsChangedNotificationsSuppressionStarted", (CFPropertyListRef)[MEMORY[0x1E4F1C9C8] date], @"com.apple.itunesstored");
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
}

+ (void)_enableAccountStoreChangedNotifications
{
  CFPreferencesSetAppValue(@"AccountsChangedNotificationsSuppressionStarted", 0, @"com.apple.itunesstored");
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
}

+ (void)_excludeCopyKVSDatabasePathFromBackups
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[a1 _copyKVSDatabasePath];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    int v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
    int v6 = v5;
    if (!v5)
    {
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v7 = *MEMORY[0x1E4F1C630];
    id v24 = 0;
    char v8 = [v5 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v7 error:&v24];
    id v9 = v24;
    if (v8)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v10 = +[SSLogConfig sharedAccountsMigrationConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      uint64_t v14 = objc_opt_class();
      int v25 = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      id v28 = v9;
      id v15 = v14;
      LODWORD(v23) = 22;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v25, v23);
      free(v16);
      SSFileLog(v10, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_18:
}

+ (id)_hashedDescriptionFromAccountDictionary:(id)a3
{
  id v3 = a3;
  int v4 = [v3 objectForKeyedSubscript:@"AltDSID"];
  int v5 = SSHashIfNeeded(v4);

  int v6 = [v3 objectForKeyedSubscript:@"DSPersonID"];
  uint64_t v7 = [v6 stringValue];
  char v8 = SSHashIfNeeded(v7);

  id v9 = [v3 objectForKeyedSubscript:@"FirstName"];
  id v10 = SSHashIfNeeded(v9);

  int v11 = [v3 objectForKeyedSubscript:@"LastName"];
  int v12 = SSHashIfNeeded(v11);

  uint64_t v13 = [v3 objectForKeyedSubscript:@"AccountURLBagType"];
  uint64_t v14 = [v3 objectForKeyedSubscript:@"AccountStoreFront"];
  id v15 = SSHashIfNeeded(v14);

  uint64_t v16 = [v3 objectForKeyedSubscript:@"AppleID"];

  uint64_t v17 = SSHashIfNeeded(v16);

  uint64_t v18 = [NSString stringWithFormat:@"<altDSID = %@ | DSID = %@ | username = %@ | firstName = %@ | lastName = %@ | storefront = %@ | scope = %@>", v5, v8, v17, v10, v12, v15, v13];

  return v18;
}

+ (BOOL)_isBuddyRunning
{
  return softLinkBYSetupAssistantNeedsToRun();
}

+ (void)_postAccountsChangedInternalDarwinNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = +[SSLogConfig sharedAccountsConfig];
  if (!v2)
  {
    id v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v16) = 138543362;
  *(void *)((char *)&v16 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v16 + 4);
  LODWORD(v15) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15, v16);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.accountschanged.internal", 0, 0, 1u);
}

+ (void)_postAccountsChangedDarwinNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = +[SSLogConfig sharedAccountsConfig];
  if (!v2)
  {
    id v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  LODWORD(v16) = 138543362;
  *(void *)((char *)&v16 + 4) = objc_opt_class();
  id v6 = *(id *)((char *)&v16 + 4);
  LODWORD(v15) = 12;
  uint64_t v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v16, v15, v16);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.itunesstored.accountschanged", 0, 0, 1u);
}

- (void)_postAccountStoreChangeNotification
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(SSAccountStore *)self notificationQueue];

  if (!v3)
  {
    int v4 = +[SSLogConfig sharedAccountsConfig];
    if (!v4)
    {
      int v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    uint64_t v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      uint64_t v21 = @"SSAccountStoreChangedNotification";
      id v8 = v19;
      LODWORD(v16) = 22;
      uint64_t v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_14;
      }
      uint64_t v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v16);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  int v4 = [(SSAccountStore *)self notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SSAccountStore__postAccountStoreChangeNotification__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(v4, block);
LABEL_14:
}

void __53__SSAccountStore__postAccountStoreChangeNotification__block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v2 = CFPreferencesGetAppBooleanValue(@"ActiveAccountIsManagedAppleID", @"com.apple.itunesstored", 0) != 0;
  int v3 = [*(id *)(a1 + 32) activeAccount];
  uint64_t v4 = [v3 isManagedAppleID];

  if (v2 != v4)
  {
    [(id)objc_opt_class() _setActiveAccountIsManagedAppleIDPreference:v4];
    int v5 = +[SSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      int v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      *(_DWORD *)char v33 = 138543362;
      *(void *)&v33[4] = objc_opt_class();
      id v9 = *(id *)&v33[4];
      LODWORD(v32) = 12;
      uint64_t v31 = v33;
      uint64_t v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v33, v32, *(_OWORD *)v33);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_13;
  }
LABEL_14:
  uint64_t v17 = +[SSLogConfig sharedAccountsConfig];
  if (!v17)
  {
    uint64_t v17 = +[SSLogConfig sharedConfig];
  }
  int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  __int16 v20 = [v17 OSLogObject];
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_24;
  }
  uint64_t v21 = objc_opt_class();
  *(_DWORD *)char v33 = 138543618;
  *(void *)&v33[4] = v21;
  *(_WORD *)&v33[12] = 2114;
  *(void *)&v33[14] = @"SSAccountStoreChangedNotification";
  id v22 = v21;
  LODWORD(v32) = 22;
  uint64_t v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    __int16 v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, v33, v32);
    free(v23);
    SSFileLog(v17, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
LABEL_24:
  }
  uint64_t v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 postNotificationName:@"_SSAccountStoreDidChangeNotification" object:*(void *)(a1 + 32)];
  [v30 postNotificationName:@"SSAccountStoreChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_postActiveAccountChangedNotification
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(SSAccountStore *)self notificationQueue];

  if (!v3)
  {
    uint64_t v4 = +[SSLogConfig sharedAccountsConfig];
    if (!v4)
    {
      uint64_t v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    int v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      uint64_t v21 = @"SSAccountStoreActiveAccountChangedNotification";
      id v8 = v19;
      LODWORD(v16) = 22;
      id v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_14;
      }
      int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v16);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  uint64_t v4 = [(SSAccountStore *)self notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__SSAccountStore__postActiveAccountChangedNotification__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(v4, block);
LABEL_14:
}

void __55__SSAccountStore__postActiveAccountChangedNotification__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = +[SSLogConfig sharedAccountsConfig];
  if (!v2)
  {
    int v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  *(_DWORD *)uint64_t v16 = 138543618;
  *(void *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2114;
  *(void *)&v16[14] = @"SSAccountStoreActiveAccountChangedNotification";
  id v6 = *(id *)&v16[4];
  LODWORD(v15) = 22;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16]);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:
  }
  uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"SSAccountStoreActiveAccountChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)_postAuthenticationActivityNotification
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = [(SSAccountStore *)self notificationQueue];

  if (!v3)
  {
    int v4 = +[SSLogConfig sharedAccountsConfig];
    if (!v4)
    {
      int v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    int v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v18 = 138543618;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      uint64_t v21 = @"SSAccountStoreChangedNotification";
      id v8 = v19;
      LODWORD(v16) = 22;
      uint64_t v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9) {
        goto LABEL_14;
      }
      int v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v16);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  int v4 = [(SSAccountStore *)self notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SSAccountStore__postAuthenticationActivityNotification__block_invoke;
  block[3] = &unk_1E5BA7040;
  void block[4] = self;
  dispatch_async(v4, block);
LABEL_14:
}

void __57__SSAccountStore__postAuthenticationActivityNotification__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = +[SSLogConfig sharedAccountsConfig];
  if (!v2)
  {
    int v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  int v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  *(_DWORD *)uint64_t v16 = 138543618;
  *(void *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2114;
  *(void *)&v16[14] = @"SSAccountStoreAuthenticationActivityNotification";
  id v6 = *(id *)&v16[4];
  LODWORD(v15) = 22;
  int v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    int v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, v16, v15, *(_OWORD *)v16, *(void *)&v16[16]);
    free(v7);
    SSFileLog(v2, @"%@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:
  }
  uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 postNotificationName:@"SSAccountStoreAuthenticationActivityNotification" object:*(void *)(a1 + 32)];
}

- (void)_recordAnalyticsForMetricsDialogEvent:(id)a3 withTopic:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SSAccountStore *)self metricsQueue];

  if (!v8)
  {
    uint64_t v10 = +[SSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      uint64_t v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v26 = 138543362;
      id v27 = (id)objc_opt_class();
      id v14 = v27;
      LODWORD(v22) = 12;
      uint64_t v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_14;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v26, v22);
      free(v15);
      SSFileLog(v10, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_14;
  }
  uint64_t v9 = [(SSAccountStore *)self metricsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SSAccountStore__recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke;
  block[3] = &unk_1E5BA7018;
  id v24 = v6;
  id v25 = v7;
  dispatch_async(v9, block);

  uint64_t v10 = v24;
LABEL_14:
}

void __66__SSAccountStore__recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke(uint64_t a1)
{
  int v2 = objc_alloc_init(SSMetricsController);
  [(SSMetricsController *)v2 recordAnalyticsForMetricsDialogEvent:*(void *)(a1 + 32) withTopic:*(void *)(a1 + 40)];
}

+ (id)_refreshAccount:(id)a3
{
  id v3 = a3;
  int v4 = [(id)objc_opt_class() _backingAccountForAccount:v3];

  [v4 refresh];
  int v5 = [[SSAccount alloc] initWithBackingAccount:v4];

  return v5;
}

- (id)_saveAccountInUnitTestMode:(id)a3 ignoreValidationErrors:(BOOL)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Accounts/Notification/iTunesAccountsNotificationPlugin.bundle"];
  id v8 = objc_alloc_init((Class)[v7 principalClass]);
  if (v8)
  {
    SEL v9 = NSSelectorFromString(&cfstr_Cansaveaccount.isa);
    uint64_t v10 = [(id)objc_opt_class() instanceMethodSignatureForSelector:v9];
    int v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setTarget:v8];
    [v11 setSelector:v9];
    id v19 = [v6 backingAccount];
    [v11 setArgument:&v19 atIndex:2];
    int v12 = [(SSAccountStore *)self accounts];
    objc_msgSend(v12, "_ss_map:", &__block_literal_global_294);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    [v11 setArgument:&v18 atIndex:3];
    [v11 invoke];
    char v17 = 0;
    [v11 getReturnValue:&v17];
    if (a4 || v17)
    {
      [(id)objc_opt_class() _addAccountToUnitTestStore:v6];
      __AccountsChangedInternal();
      if (([(id)objc_opt_class() areAccountStoreChangedNotificationsDisabled] & 1) == 0) {
        __AccountsChanged();
      }
      id v14 = +[SSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F178F0] code:5 userInfo:0];
      id v14 = +[SSPromise promiseWithError:v13];
    }
  }
  else
  {
    uint64_t v15 = SSError(@"SSErrorDomain", 100, 0, @"We failed to load the notification plugin.");
    id v14 = +[SSPromise promiseWithError:v15];
  }
  return v14;
}

uint64_t __68__SSAccountStore__saveAccountInUnitTestMode_ignoreValidationErrors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 backingAccount];
}

- (id)_saveAccount:(id)a3 verifyCredentials:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = SSGenerateLogCorrelationString();
  if (v6)
  {
    if ([v6 isDirty])
    {
      uint64_t v88 = [(id)objc_opt_class() _backingAccountForAccount:v6];
      if (!v88)
      {
        int v37 = +[SSLogConfig sharedAccountsConfig];
        if (!v37)
        {
          int v37 = +[SSLogConfig sharedConfig];
        }
        int v38 = [v37 shouldLog];
        if ([v37 shouldLogToDisk]) {
          v38 |= 2u;
        }
        id v39 = [v37 OSLogObject];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          int v40 = v38;
        }
        else {
          int v40 = v38 & 2;
        }
        if (v40)
        {
          id v41 = objc_opt_class();
          id v42 = v41;
          [v6 hashedDescription];
          *(_DWORD *)id location = 138543874;
          *(void *)&id location[4] = v41;
          __int16 v96 = 2114;
          id v97 = v7;
          __int16 v98 = 2114;
          id v99 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v87) = 32;
          uint64_t v43 = (void *)_os_log_send_and_compose_impl();

          if (v43)
          {
            uint64_t v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, location, v87);
            free(v43);
            SSFileLog(v37, @"%@", v45, v46, v47, v48, v49, v50, (uint64_t)v44);
          }
        }
        else
        {
        }
        id v68 = SSError(@"SSErrorDomain", 100, 0, @"The backing account is nil.");
        id v8 = +[SSPromise promiseWithError:v68];

        goto LABEL_67;
      }
      if ([(id)objc_opt_class() unitTestModeEnabled])
      {
        id v8 = [(SSAccountStore *)self _saveAccountInUnitTestMode:v6 ignoreValidationErrors:0];
LABEL_67:

        goto LABEL_68;
      }
      id v51 = +[SSLogConfig sharedAccountsConfig];
      if (!v51)
      {
        id v51 = +[SSLogConfig sharedConfig];
      }
      int v52 = [v51 shouldLog];
      if ([v51 shouldLogToDisk]) {
        v52 |= 2u;
      }
      uint64_t v53 = [v51 OSLogObject];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        int v54 = v52;
      }
      else {
        int v54 = v52 & 2;
      }
      if (v54)
      {
        int v55 = objc_opt_class();
        id v56 = v55;
        int v57 = [v6 hashedDescription];
        uint64_t v58 = v57;
        id v59 = @"NO";
        *(_DWORD *)id location = 138544130;
        *(void *)&id location[4] = v55;
        __int16 v96 = 2114;
        if (v4) {
          id v59 = @"YES";
        }
        id v97 = v7;
        __int16 v98 = 2114;
        id v99 = v57;
        __int16 v100 = 2114;
        uint64_t v101 = v59;
        LODWORD(v87) = 42;
        uint64_t v86 = location;
        uint64_t v60 = (void *)_os_log_send_and_compose_impl();

        if (v60)
        {
          uint64_t v61 = objc_msgSend(NSString, "stringWithCString:encoding:", v60, 4, location, v87);
          free(v60);
          SSFileLog(v51, @"%@", v62, v63, v64, v65, v66, v67, (uint64_t)v61);
        }
      }
      else
      {
      }
      uint64_t v69 = +[SSLogConfig sharedAccountsConfig];
      if (!v69)
      {
        uint64_t v69 = +[SSLogConfig sharedConfig];
      }
      int v70 = objc_msgSend(v69, "shouldLog", v86);
      if ([v69 shouldLogToDisk]) {
        v70 |= 2u;
      }
      id v71 = [v69 OSLogObject];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO)) {
        int v72 = v70;
      }
      else {
        int v72 = v70 & 2;
      }
      if (v72)
      {
        int v73 = objc_opt_class();
        *(_DWORD *)id location = 138543618;
        *(void *)&id location[4] = v73;
        __int16 v96 = 2114;
        id v97 = v7;
        id v74 = v73;
        LODWORD(v87) = 22;
        __int16 v75 = (void *)_os_log_send_and_compose_impl();

        if (!v75)
        {
LABEL_66:

          [(SSAccountStore *)self clearCachedAccounts];
          id v8 = objc_alloc_init(SSPromise);
          objc_initWeak((id *)location, self);
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke;
          v92[3] = &unk_1E5BA9AE8;
          objc_copyWeak(&v94, (id *)location);
          id v82 = v7;
          id v93 = v82;
          [(SSPromise *)v8 addSuccessBlock:v92];
          v89[0] = MEMORY[0x1E4F143A8];
          v89[1] = 3221225472;
          v89[2] = __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke_308;
          v89[3] = &unk_1E5BA9B10;
          objc_copyWeak(&v91, (id *)location);
          id v90 = v82;
          [(SSPromise *)v8 addErrorBlock:v89];
          int v83 = [(SSAccountStore *)self backingAccountStore];
          uint64_t v84 = [(SSPromise *)v8 BOOLCompletionHandlerAdapter];
          [v83 saveAccount:v88 withDataclassActions:0 doVerify:v4 completion:v84];

          objc_destroyWeak(&v91);
          objc_destroyWeak(&v94);
          objc_destroyWeak((id *)location);
          goto LABEL_67;
        }
        id v71 = objc_msgSend(NSString, "stringWithCString:encoding:", v75, 4, location, v87);
        free(v75);
        SSFileLog(v69, @"%@", v76, v77, v78, v79, v80, v81, (uint64_t)v71);
      }

      goto LABEL_66;
    }
    uint64_t v22 = +[SSLogConfig sharedAccountsConfig];
    if (!v22)
    {
      uint64_t v22 = +[SSLogConfig sharedConfig];
    }
    int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    id v25 = [v22 OSLogObject];
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      v24 &= 2u;
    }
    if (v24)
    {
      int v26 = objc_opt_class();
      id v27 = v26;
      [v6 hashedDescription];
      *(_DWORD *)id location = 138543874;
      *(void *)&id location[4] = v26;
      __int16 v96 = 2114;
      id v97 = v7;
      __int16 v98 = 2114;
      id v99 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v87) = 32;
      uint64_t v28 = (void *)_os_log_send_and_compose_impl();

      if (v28)
      {
        uint64_t v29 = objc_msgSend(NSString, "stringWithCString:encoding:", v28, 4, location, v87);
        free(v28);
        SSFileLog(v22, @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
      }
    }
    else
    {
    }
    id v8 = +[SSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    SEL v9 = +[SSLogConfig sharedAccountsConfig];
    if (!v9)
    {
      SEL v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      *(_DWORD *)id location = 138543618;
      *(void *)&id location[4] = objc_opt_class();
      __int16 v96 = 2114;
      id v97 = v7;
      id v13 = *(id *)&location[4];
      LODWORD(v87) = 22;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v87);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      }
    }
    else
    {
    }
    int v36 = SSError(@"SSErrorDomain", 137, 0, @"The account must be non-nil.");
    id v8 = +[SSPromise promiseWithError:v36];
  }
LABEL_68:

  return v8;
}

void __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[SSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    id v3 = +[SSLogConfig sharedConfig];
  }
  int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  id v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  id v7 = objc_opt_class();
  uint64_t v8 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v18 = 138543618;
  *(void *)&v18[4] = v7;
  *(_WORD *)&v18[12] = 2114;
  *(void *)&v18[14] = v8;
  id v9 = v7;
  LODWORD(v17) = 22;
  int v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v6 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16], v19);
    free(v10);
    SSFileLog(v3, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v6);
LABEL_11:
  }
}

void __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke_308(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = +[SSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    int v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  id v9 = objc_opt_class();
  uint64_t v10 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v20 = 138543874;
  *(void *)&v20[4] = v9;
  *(_WORD *)&v20[12] = 2114;
  *(void *)&v20[14] = v10;
  *(_WORD *)&v20[22] = 2112;
  id v21 = v3;
  id v11 = v9;
  LODWORD(v19) = 32;
  uint64_t v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, v20, v19, *(_OWORD *)v20, *(void *)&v20[16], v21);
    free(v12);
    SSFileLog(v5, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v8);
LABEL_11:
  }
}

+ (void)_setActiveAccountIsManagedAppleIDPreference:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"ActiveAccountIsManagedAppleID", *v3, @"com.apple.itunesstored");
  CFPreferencesAppSynchronize(@"com.apple.itunesstored");
}

+ (BOOL)_accountDictionaryRepresentsActiveAccount:(id)a3 inKeyValueStore:(id)a4
{
  id v5 = a3;
  int v6 = [a4 iTunesValueForKey:@"DSPersonID" usedDomain:0];
  int v7 = [v5 objectForKeyedSubscript:@"DSPersonID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v8 = [v6 isEqualToNumber:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_accountDictionaryRepresentsActiveLockerAccount:(id)a3 inKeyValueStore:(id)a4
{
  id v5 = a3;
  int v6 = [a4 iTunesValueForKey:@"ActiveLockerAccountID" usedDomain:0];
  int v7 = [v5 objectForKeyedSubscript:@"DSPersonID"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
    char v8 = [v6 isEqualToNumber:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

+ (void)_cleanupActiveAccountsAfterMigrationWithActiveDSID:(id)a3 activeLockerDSID:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    +[SSAccountStore defaultStore];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v68 = long long v75 = 0u;
    id obj = [v68 accounts];
    uint64_t v70 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
    if (!v70) {
      goto LABEL_55;
    }
    uint64_t v69 = *(void *)v73;
    unint64_t v65 = v5;
    unint64_t v66 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v73 != v69) {
          objc_enumerationMutation(obj);
        }
        char v8 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (v5)
        {
          if ([*(id *)(*((void *)&v72 + 1) + 8 * i) isActive])
          {
            id v9 = [v8 uniqueIdentifier];
            char v10 = [v9 isEqualToNumber:v5];

            if ((v10 & 1) == 0)
            {
              uint64_t v30 = +[SSLogConfig sharedAccountsMigrationConfig];
              if (!v30)
              {
                uint64_t v30 = +[SSLogConfig sharedConfig];
              }
              int v31 = objc_msgSend(v30, "shouldLog", v63);
              if ([v30 shouldLogToDisk]) {
                int v32 = v31 | 2;
              }
              else {
                int v32 = v31;
              }
              uint64_t v33 = [v30 OSLogObject];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                int v34 = v32;
              }
              else {
                int v34 = v32 & 2;
              }
              if (v34)
              {
                uint64_t v35 = objc_opt_class();
                id v36 = v35;
                int v37 = [v8 hashedDescription];
                int v38 = [(id)v5 stringValue];
                id v39 = SSHashIfNeeded(v38);
                int v76 = 138543874;
                uint64_t v77 = v35;
                unint64_t v6 = v66;
                __int16 v78 = 2114;
                uint64_t v79 = v37;
                __int16 v80 = 2114;
                id v81 = v39;
                LODWORD(v64) = 32;
                uint64_t v63 = &v76;
                int v40 = (void *)_os_log_send_and_compose_impl();

                if (v40)
                {
                  uint64_t v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v76, v64);
                  free(v40);
                  SSFileLog(v30, @"%@", v41, v42, v43, v44, v45, v46, (uint64_t)v33);
                  goto LABEL_36;
                }
              }
              else
              {
LABEL_36:
              }
              [v8 setActive:0];
              int v11 = 1;
              unint64_t v5 = v65;
              if (!v6) {
                goto LABEL_38;
              }
              goto LABEL_11;
            }
          }
        }
        int v11 = 0;
        if (!v6) {
          goto LABEL_38;
        }
LABEL_11:
        if (objc_msgSend(v8, "isActiveLockerAccount", v63))
        {
          uint64_t v12 = [v8 uniqueIdentifier];
          char v13 = [v12 isEqualToNumber:v6];

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = +[SSLogConfig sharedAccountsMigrationConfig];
            if (!v14)
            {
              uint64_t v14 = +[SSLogConfig sharedConfig];
            }
            int v15 = [v14 shouldLog];
            if ([v14 shouldLogToDisk]) {
              v15 |= 2u;
            }
            uint64_t v16 = [v14 OSLogObject];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              int v17 = v15;
            }
            else {
              int v17 = v15 & 2;
            }
            if (v17)
            {
              uint64_t v18 = objc_opt_class();
              id v19 = v18;
              uint64_t v20 = [v8 hashedDescription];
              id v21 = [(id)v6 stringValue];
              uint64_t v22 = SSHashIfNeeded(v21);
              int v76 = 138543874;
              uint64_t v77 = v18;
              __int16 v78 = 2114;
              uint64_t v79 = v20;
              __int16 v80 = 2114;
              id v81 = v22;
              LODWORD(v64) = 32;
              uint64_t v63 = &v76;
              int v23 = (void *)_os_log_send_and_compose_impl();

              unint64_t v5 = v65;
              if (v23)
              {
                uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v76, v64);
                free(v23);
                SSFileLog(v14, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v16);
                goto LABEL_23;
              }
            }
            else
            {
LABEL_23:
            }
            [v8 setActiveLockerAccount:0];
            unint64_t v6 = v66;
            goto LABEL_39;
          }
        }
LABEL_38:
        if (!v11) {
          continue;
        }
LABEL_39:
        id v71 = 0;
        char v47 = objc_msgSend(v68, "saveAccount:verifyCredentials:error:", v8, 0, &v71, v63, v64);
        id v48 = v71;
        if ((v47 & 1) == 0)
        {
          uint64_t v49 = +[SSLogConfig sharedAccountsMigrationConfig];
          if (!v49)
          {
            uint64_t v49 = +[SSLogConfig sharedConfig];
          }
          int v50 = [v49 shouldLog];
          if ([v49 shouldLogToDisk]) {
            v50 |= 2u;
          }
          id v51 = [v49 OSLogObject];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            int v52 = v50;
          }
          else {
            int v52 = v50 & 2;
          }
          if (v52)
          {
            uint64_t v53 = objc_opt_class();
            id v54 = v53;
            int v55 = [v8 hashedDescription];
            int v76 = 138543874;
            uint64_t v77 = v53;
            __int16 v78 = 2114;
            uint64_t v79 = v55;
            __int16 v80 = 2112;
            id v81 = v48;
            LODWORD(v64) = 32;
            uint64_t v63 = &v76;
            id v56 = (void *)_os_log_send_and_compose_impl();

            unint64_t v6 = v66;
            if (v56)
            {
              id v51 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, &v76, v64);
              free(v56);
              SSFileLog(v49, @"%@", v57, v58, v59, v60, v61, v62, (uint64_t)v51);
              goto LABEL_50;
            }
          }
          else
          {
LABEL_50:
          }
        }
      }
      uint64_t v70 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
      if (!v70)
      {
LABEL_55:

        break;
      }
    }
  }
}

+ (id)_migrateAccountDictionary:(id)a3 fromKeyValueStore:(id)a4 originalActiveDSID:(id)a5 originalActiveLockerDSID:(id)a6 logKey:(id)a7 error:(id *)a8
{
  uint64_t v223 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v205 = a4;
  id v208 = a5;
  id v207 = a6;
  id v215 = a7;
  uint64_t v213 = +[SSAccountStore defaultStore];
  id v214 = a1;
  [a1 _disableAccountStoreChangedNotifications];
  id v14 = 0;
  char v209 = 1;
  int v15 = &off_1E5BA6000;
  uint64_t v206 = *MEMORY[0x1E4F178F0];
  for (uint64_t i = 1; ; uint64_t i = 2)
  {
    id v211 = v14;
    int v17 = objc_msgSend(v15[244], "sharedAccountsMigrationConfig", v197);
    if (!v17)
    {
      int v17 = [v15[244] sharedConfig];
    }
    int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    uint64_t v20 = [v17 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (!v19) {
      goto LABEL_12;
    }
    id v21 = objc_opt_class();
    int v217 = 138543874;
    id v218 = v21;
    __int16 v219 = 2114;
    id v220 = v215;
    __int16 v221 = 2048;
    uint64_t v222 = i;
    id v22 = v21;
    LODWORD(v203) = 32;
    v198 = &v217;
    int v23 = (void *)_os_log_send_and_compose_impl();

    if (v23)
    {
      uint64_t v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v217, v203);
      free(v23);
      SSFileLog(v17, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
LABEL_12:
    }
    uint64_t v30 = [v13 objectForKeyedSubscript:@"AltDSID"];
    int v31 = [v13 objectForKeyedSubscript:@"DSPersonID"];
    int v32 = [v13 objectForKeyedSubscript:@"AppleID"];
    uint64_t v33 = [v13 objectForKeyedSubscript:@"AccountURLBagType"];
    uint64_t v34 = SSAccountScopeForString(v33);

    uint64_t v35 = [v213 accountWithAltDSID:v30 scope:v34];
    uint64_t v212 = v32;
    uint64_t v210 = v31;
    if (v35) {
      goto LABEL_32;
    }
    uint64_t v35 = [v213 accountWithUniqueIdentifier:v31 scope:v34];
    if (v35) {
      goto LABEL_32;
    }
    uint64_t v35 = [v213 accountWithAccountName:v32 scope:v34];
    id v36 = [(SSAccount *)v35 altDSID];
    if ([v36 isEqualToString:&stru_1EF96DA90])
    {

LABEL_18:
      id v39 = objc_msgSend(v15[244], "sharedAccountsMigrationConfig", v198);
      if (!v39)
      {
        id v39 = [v15[244] sharedConfig];
      }
      int v40 = [v39 shouldLog];
      if ([v39 shouldLogToDisk]) {
        v40 |= 2u;
      }
      uint64_t v41 = [v39 OSLogObject];
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
        v40 &= 2u;
      }
      if (v40)
      {
        uint64_t v42 = objc_opt_class();
        int v217 = 138543618;
        id v218 = v42;
        __int16 v219 = 2114;
        id v220 = v215;
        id v43 = v42;
        LODWORD(v203) = 22;
        v198 = &v217;
        uint64_t v44 = (void *)_os_log_send_and_compose_impl();

        int v32 = v212;
        if (!v44)
        {
LABEL_28:

          goto LABEL_31;
        }
        uint64_t v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, &v217, v203);
        free(v44);
        SSFileLog(v39, @"%@", v45, v46, v47, v48, v49, v50, (uint64_t)v41);
      }

      goto LABEL_28;
    }
    int v37 = [(SSAccount *)v35 uniqueIdentifier];
    int v38 = [v37 isEqualToNumber:&unk_1EF9A9810];

    if (v38) {
      goto LABEL_18;
    }
    id v51 = [(SSAccount *)v35 altDSID];
    if (v51)
    {

LABEL_175:
      int v185 = objc_msgSend(v15[244], "sharedAccountsMigrationConfig", v198);
      if (!v185)
      {
        int v185 = [v15[244] sharedConfig];
      }
      int v186 = [v185 shouldLog];
      if ([v185 shouldLogToDisk]) {
        v186 |= 2u;
      }
      v187 = [v185 OSLogObject];
      if (!os_log_type_enabled(v187, OS_LOG_TYPE_ERROR)) {
        v186 &= 2u;
      }
      if (v186)
      {
        v188 = objc_opt_class();
        int v217 = 138543618;
        id v218 = v188;
        __int16 v219 = 2114;
        id v220 = v215;
        id v189 = v188;
        LODWORD(v203) = 22;
        uint64_t v190 = (void *)_os_log_send_and_compose_impl();

        if (v190)
        {
          v187 = objc_msgSend(NSString, "stringWithCString:encoding:", v190, 4, &v217, v203);
          free(v190);
          SSFileLog(v185, @"%@", v191, v192, v193, v194, v195, v196, (uint64_t)v187);
          goto LABEL_184;
        }
      }
      else
      {
LABEL_184:
      }
      v183 = 0;
      v181 = v205;
      id v14 = v211;
      goto LABEL_171;
    }
    int v52 = [(SSAccount *)v35 uniqueIdentifier];

    if (v52) {
      goto LABEL_175;
    }
LABEL_31:
    if (!v35)
    {
      uint64_t v127 = [v15[244] sharedAccountsMigrationConfig];
      if (!v127)
      {
        uint64_t v127 = [v15[244] sharedConfig];
      }
      int v128 = objc_msgSend(v127, "shouldLog", v198);
      if ([v127 shouldLogToDisk]) {
        v128 |= 2u;
      }
      uint64_t v129 = [v127 OSLogObject];
      if (!os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT)) {
        v128 &= 2u;
      }
      if (v128)
      {
        uint64_t v130 = objc_opt_class();
        int v217 = 138543618;
        id v218 = v130;
        __int16 v219 = 2114;
        id v220 = v215;
        id v131 = v130;
        LODWORD(v203) = 22;
        uint64_t v202 = &v217;
        uint64_t v132 = (void *)_os_log_send_and_compose_impl();

        if (!v132) {
          goto LABEL_120;
        }
        uint64_t v129 = objc_msgSend(NSString, "stringWithCString:encoding:", v132, 4, &v217, v203);
        free(v132);
        SSFileLog(v127, @"%@", v133, v134, v135, v136, v137, v138, (uint64_t)v129);
      }

LABEL_120:
      uint64_t v35 = objc_alloc_init(SSAccount);
      uint64_t v53 = +[SSAccount secureTokenForIdentifier:v32];
      uint64_t v139 = [v53 length];
      uint64_t v140 = [v15[244] sharedAccountsMigrationConfig];
      id v56 = v140;
      if (!v139)
      {
        if (!v140)
        {
          id v56 = [v15[244] sharedConfig];
        }
        int v152 = [v56 shouldLog];
        if ([v56 shouldLogToDisk]) {
          v152 |= 2u;
        }
        int v153 = [v56 OSLogObject];
        if (!os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT)) {
          v152 &= 2u;
        }
        if (v152)
        {
          v154 = objc_opt_class();
          int v217 = 138543618;
          id v218 = v154;
          __int16 v219 = 2114;
          id v220 = v215;
          id v155 = v154;
          LODWORD(v203) = 22;
          v199 = &v217;
          v156 = (void *)_os_log_send_and_compose_impl();

          if (!v156) {
            goto LABEL_42;
          }
          int v153 = objc_msgSend(NSString, "stringWithCString:encoding:", v156, 4, &v217, v203);
          free(v156);
          SSFileLog(v56, @"%@", v157, v158, v159, v160, v161, v162, (uint64_t)v153);
        }

        goto LABEL_42;
      }
      if (!v140)
      {
        id v56 = [v15[244] sharedConfig];
      }
      int v141 = [v56 shouldLog];
      if ([v56 shouldLogToDisk]) {
        v141 |= 2u;
      }
      uint64_t v142 = [v56 OSLogObject];
      if (!os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT)) {
        v141 &= 2u;
      }
      if (v141)
      {
        uint64_t v143 = objc_opt_class();
        int v217 = 138543618;
        id v218 = v143;
        __int16 v219 = 2114;
        id v220 = v215;
        id v144 = v143;
        LODWORD(v203) = 22;
        v199 = &v217;
        uint64_t v145 = (void *)_os_log_send_and_compose_impl();

        if (!v145)
        {
LABEL_131:

          [(SSAccount *)v35 setAuthenticated:1];
          [(SSAccount *)v35 setSecureToken:v53];
          goto LABEL_44;
        }
        uint64_t v142 = objc_msgSend(NSString, "stringWithCString:encoding:", v145, 4, &v217, v203);
        free(v145);
        SSFileLog(v56, @"%@", v146, v147, v148, v149, v150, v151, (uint64_t)v142);
      }

      goto LABEL_131;
    }
LABEL_32:
    uint64_t v53 = objc_msgSend(v15[244], "sharedAccountsMigrationConfig", v198);
    if (!v53)
    {
      uint64_t v53 = [v15[244] sharedConfig];
    }
    int v54 = [v53 shouldLog];
    if ([v53 shouldLogToDisk]) {
      int v55 = v54 | 2;
    }
    else {
      int v55 = v54;
    }
    id v56 = [v53 OSLogObject];
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
      v55 &= 2u;
    }
    if (!v55) {
      goto LABEL_42;
    }
    uint64_t v57 = objc_opt_class();
    id v58 = v57;
    uint64_t v59 = [(SSAccount *)v35 hashedDescription];
    int v217 = 138543874;
    id v218 = v57;
    __int16 v219 = 2114;
    id v220 = v215;
    __int16 v221 = 2114;
    uint64_t v222 = (uint64_t)v59;
    LODWORD(v203) = 32;
    v199 = &v217;
    uint64_t v60 = (void *)_os_log_send_and_compose_impl();

    if (v60)
    {
      id v56 = objc_msgSend(NSString, "stringWithCString:encoding:", v60, 4, &v217, v203);
      free(v60);
      SSFileLog(v53, @"%@", v61, v62, v63, v64, v65, v66, (uint64_t)v56);
      int v15 = &off_1E5BA6000;
LABEL_42:

      goto LABEL_44;
    }
    int v15 = &off_1E5BA6000;
LABEL_44:

    [(SSAccount *)v35 setLockdownDictionary:v13];
    uint64_t v67 = [(SSAccount *)v35 uniqueIdentifier];
    uint64_t v68 = [v208 isEqualToNumber:v67];

    uint64_t v69 = [v15[244] sharedAccountsMigrationConfig];
    uint64_t v70 = (void *)v69;
    if (v68)
    {
      if (!v69)
      {
        uint64_t v70 = [v15[244] sharedConfig];
      }
      int v71 = objc_msgSend(v70, "shouldLog", v199);
      if ([v70 shouldLogToDisk]) {
        v71 |= 2u;
      }
      long long v72 = [v70 OSLogObject];
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
        v71 &= 2u;
      }
      if (!v71) {
        goto LABEL_67;
      }
      long long v73 = objc_opt_class();
      id v74 = v73;
      BOOL v75 = [(SSAccount *)v35 isActive];
      int v217 = 138543874;
      int v76 = @"NO";
      if (v75) {
        int v76 = @"YES";
      }
      id v218 = v73;
      __int16 v219 = 2114;
      id v220 = v215;
      __int16 v221 = 2114;
      uint64_t v222 = (uint64_t)v76;
      LODWORD(v203) = 32;
      v200 = &v217;
      uint64_t v77 = (void *)_os_log_send_and_compose_impl();

      if (v77) {
        goto LABEL_66;
      }
      uint64_t v68 = 1;
    }
    else
    {
      if (!v69)
      {
        uint64_t v70 = [v15[244] sharedConfig];
      }
      int v78 = objc_msgSend(v70, "shouldLog", v199);
      if ([v70 shouldLogToDisk]) {
        v78 |= 2u;
      }
      long long v72 = [v70 OSLogObject];
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT)) {
        v78 &= 2u;
      }
      if (!v78) {
        goto LABEL_67;
      }
      uint64_t v79 = objc_opt_class();
      id v80 = v79;
      BOOL v81 = [(SSAccount *)v35 isActive];
      int v217 = 138543874;
      id v82 = @"NO";
      if (v81) {
        id v82 = @"YES";
      }
      id v218 = v79;
      __int16 v219 = 2114;
      id v220 = v215;
      __int16 v221 = 2114;
      uint64_t v222 = (uint64_t)v82;
      LODWORD(v203) = 32;
      v200 = &v217;
      uint64_t v77 = (void *)_os_log_send_and_compose_impl();

      if (v77)
      {
LABEL_66:
        long long v72 = objc_msgSend(NSString, "stringWithCString:encoding:", v77, 4, &v217, v203);
        free(v77);
        SSFileLog(v70, @"%@", v83, v84, v85, v86, v87, v88, (uint64_t)v72);
        int v15 = &off_1E5BA6000;
LABEL_67:

        goto LABEL_70;
      }
      uint64_t v68 = 0;
    }
    int v15 = &off_1E5BA6000;
LABEL_70:

    [(SSAccount *)v35 setActive:v68];
    uint64_t v89 = [(SSAccount *)v35 uniqueIdentifier];
    uint64_t v90 = [v207 isEqualToNumber:v89];

    uint64_t v91 = [v15[244] sharedAccountsMigrationConfig];
    uint64_t v92 = (void *)v91;
    if (v90)
    {
      if (!v91)
      {
        uint64_t v92 = [v15[244] sharedConfig];
      }
      int v93 = objc_msgSend(v92, "shouldLog", v200);
      if ([v92 shouldLogToDisk]) {
        v93 |= 2u;
      }
      id v94 = [v92 OSLogObject];
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
        v93 &= 2u;
      }
      if (!v93) {
        goto LABEL_93;
      }
      int v95 = objc_opt_class();
      id v96 = v95;
      BOOL v97 = [(SSAccount *)v35 isActiveLockerAccount];
      int v217 = 138543874;
      __int16 v98 = @"NO";
      if (v97) {
        __int16 v98 = @"YES";
      }
      id v218 = v95;
      __int16 v219 = 2114;
      id v220 = v215;
      __int16 v221 = 2114;
      uint64_t v222 = (uint64_t)v98;
      LODWORD(v203) = 32;
      v201 = &v217;
      id v99 = (void *)_os_log_send_and_compose_impl();

      if (v99) {
        goto LABEL_92;
      }
      uint64_t v90 = 1;
    }
    else
    {
      if (!v91)
      {
        uint64_t v92 = [v15[244] sharedConfig];
      }
      int v100 = objc_msgSend(v92, "shouldLog", v200);
      if ([v92 shouldLogToDisk]) {
        v100 |= 2u;
      }
      id v94 = [v92 OSLogObject];
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
        v100 &= 2u;
      }
      if (!v100) {
        goto LABEL_93;
      }
      uint64_t v101 = objc_opt_class();
      id v102 = v101;
      BOOL v103 = [(SSAccount *)v35 isActiveLockerAccount];
      int v217 = 138543874;
      uint64_t v104 = @"NO";
      if (v103) {
        uint64_t v104 = @"YES";
      }
      id v218 = v101;
      __int16 v219 = 2114;
      id v220 = v215;
      __int16 v221 = 2114;
      uint64_t v222 = (uint64_t)v104;
      LODWORD(v203) = 32;
      v201 = &v217;
      id v99 = (void *)_os_log_send_and_compose_impl();

      if (v99)
      {
LABEL_92:
        id v94 = objc_msgSend(NSString, "stringWithCString:encoding:", v99, 4, &v217, v203);
        free(v99);
        SSFileLog(v92, @"%@", v105, v106, v107, v108, v109, v110, (uint64_t)v94);
        int v15 = &off_1E5BA6000;
LABEL_93:

        id v111 = v211;
        goto LABEL_96;
      }
      uint64_t v90 = 0;
    }
    id v111 = v211;
    int v15 = &off_1E5BA6000;
LABEL_96:

    [(SSAccount *)v35 setActiveLockerAccount:v90];
    id v216 = v111;
    int v112 = [v213 saveAccount:v35 verifyCredentials:0 error:&v216];
    id v14 = v216;

    if (v112)
    {
      int v163 = v35;
      goto LABEL_145;
    }
    uint64_t v113 = [v14 domain];
    if (([v113 isEqualToString:v206] & 1) == 0) {
      break;
    }
    BOOL v114 = [v14 code] != 5;

    if (v114 || (v209 & 1) == 0) {
      goto LABEL_144;
    }
    uint64_t v115 = [v15[244] sharedAccountsMigrationConfig];
    if (!v115)
    {
      uint64_t v115 = [v15[244] sharedConfig];
    }
    int v116 = objc_msgSend(v115, "shouldLog", v201);
    if ([v115 shouldLogToDisk]) {
      v116 |= 2u;
    }
    uint64_t v117 = [v115 OSLogObject];
    if (!os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT)) {
      v116 &= 2u;
    }
    if (v116)
    {
      uint64_t v118 = objc_opt_class();
      int v217 = 138543618;
      id v218 = v118;
      __int16 v219 = 2114;
      id v220 = v215;
      id v119 = v118;
      LODWORD(v203) = 22;
      v197 = &v217;
      uint64_t v120 = (void *)_os_log_send_and_compose_impl();

      if (!v120) {
        goto LABEL_109;
      }
      uint64_t v117 = objc_msgSend(NSString, "stringWithCString:encoding:", v120, 4, &v217, v203);
      free(v120);
      SSFileLog(v115, @"%@", v121, v122, v123, v124, v125, v126, (uint64_t)v117);
    }

LABEL_109:
    char v209 = 0;
  }

LABEL_144:
  int v163 = 0;
LABEL_145:

  [v214 _enableAccountStoreChangedNotifications];
  uint64_t v164 = +[SSLogConfig sharedAccountsMigrationConfig];
  int v165 = (void *)v164;
  if (v112)
  {
    if (!v164)
    {
      int v165 = +[SSLogConfig sharedConfig];
    }
    int v166 = objc_msgSend(v165, "shouldLog", v201);
    if ([v165 shouldLogToDisk]) {
      int v167 = v166 | 2;
    }
    else {
      int v167 = v166;
    }
    v168 = [v165 OSLogObject];
    if (!os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT)) {
      v167 &= 2u;
    }
    if (v167)
    {
      uint64_t v169 = objc_opt_class();
      int v217 = 138543618;
      id v218 = v169;
      __int16 v219 = 2114;
      id v220 = v215;
      id v170 = v169;
      LODWORD(v203) = 22;
      goto LABEL_164;
    }
LABEL_166:
    int v182 = a8;
    v181 = v205;
  }
  else
  {
    if (!v164)
    {
      int v165 = +[SSLogConfig sharedConfig];
    }
    int v171 = objc_msgSend(v165, "shouldLog", v201);
    if ([v165 shouldLogToDisk]) {
      int v172 = v171 | 2;
    }
    else {
      int v172 = v171;
    }
    v168 = [v165 OSLogObject];
    if (!os_log_type_enabled(v168, OS_LOG_TYPE_ERROR)) {
      v172 &= 2u;
    }
    if (!v172) {
      goto LABEL_166;
    }
    uint64_t v173 = objc_opt_class();
    int v217 = 138543874;
    id v218 = v173;
    __int16 v219 = 2114;
    id v220 = v215;
    __int16 v221 = 2112;
    uint64_t v222 = (uint64_t)v14;
    id v170 = v173;
    LODWORD(v203) = 32;
LABEL_164:
    uint64_t v174 = (void *)_os_log_send_and_compose_impl();

    if (v174)
    {
      v168 = objc_msgSend(NSString, "stringWithCString:encoding:", v174, 4, &v217, v203);
      free(v174);
      SSFileLog(v165, @"%@", v175, v176, v177, v178, v179, v180, (uint64_t)v168);
      goto LABEL_166;
    }
    int v182 = a8;
    v181 = v205;
  }

  if (v182) {
    *int v182 = v14;
  }
  v183 = v163;
LABEL_171:

  return v183;
}

+ (void)_removeAccountDictionary:(id)a3 fromKeyValueStore:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([a1 _accountDictionaryRepresentsActiveAccount:v9 inKeyValueStore:v6])
  {
    [v6 removeAccountFromDomain:@"com.apple.mobile.iTunes.store"];
    [v6 removeAccountFromDomain:@"com.apple.itunesstored"];
  }
  if ([a1 _accountDictionaryRepresentsActiveLockerAccount:v9 inKeyValueStore:v6])
  {
    [v6 setValue:0 forDomain:@"com.apple.mobile.iTunes.store" key:@"ActiveLockerAccountID"];
    [v6 setValue:0 forDomain:@"com.apple.itunesstored" key:@"ActiveLockerAccountID"];
  }
  int v7 = [v6 accountDictionaries];
  char v8 = (void *)[v7 mutableCopy];

  [v8 removeObject:v9];
  if (![v8 count])
  {

    char v8 = 0;
  }
  [v6 setValue:v8 forDomain:@"com.apple.mobile.iTunes.store" key:@"KnownAccounts"];
}

+ (BOOL)_shouldRemoveAccountDictionaryWithoutMigration:(id)a3 reason:(id *)a4
{
  id v5 = a3;
  if (![v5 count])
  {
    int v7 = @"it's empty";
    goto LABEL_9;
  }
  if ([v5 count] == 1)
  {
    id v6 = [v5 objectForKeyedSubscript:@"AccountSource"];

    if (v6)
    {
      int v7 = @"it only has an account source";
LABEL_9:
      *a4 = v7;
      BOOL v9 = 1;
      goto LABEL_10;
    }
  }
  char v8 = [v5 objectForKeyedSubscript:@"AppleID"];

  if (!v8)
  {
    int v7 = @"it has no username";
    goto LABEL_9;
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (id)_convertPasswordToPET:(id)a3 forAccount:(id)a4 options:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  if (SSIsInternalBuild() && (NSStringIsNotPET(v7) & 1) == 0)
  {
    char v10 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v10)
    {
      char v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    id v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v34 = 138543362;
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 12;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v34, v30);
      free(v14);
      SSFileLog(v10, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    }

    goto LABEL_14;
  }
LABEL_15:
  id v21 = objc_alloc_init(SSPromise);
  id v22 = [(id)objc_opt_class() _createAuthenticationController];
  int v23 = [(id)objc_opt_class() _createAuthenticationContextForAccount:v9 silentAuthentication:1 options:v8];

  [v23 _setPassword:v7];
  uint64_t v24 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventPrompt"];
  objc_msgSend(v23, "setShouldPreventInteractiveAuth:", objc_msgSend(v24, "BOOLValue"));

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59__SSAccountStore__convertPasswordToPET_forAccount_options___block_invoke;
  v31[3] = &unk_1E5BA9B38;
  id v32 = v8;
  uint64_t v25 = v21;
  uint64_t v33 = v25;
  id v26 = v8;
  [v22 authenticateWithContext:v23 completion:v31];
  uint64_t v27 = v33;
  uint64_t v28 = v25;

  return v28;
}

void __59__SSAccountStore__convertPasswordToPET_forAccount_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  uint64_t v8 = [v7 length];
  uint64_t v9 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  char v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
    {
      char v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    id v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v34 = 138543362;
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 12;
      id v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        [*(id *)(a1 + 40) finishWithResult:v5];
        goto LABEL_28;
      }
      id v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v34, v33);
      free(v14);
      SSFileLog(v10, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    }

    goto LABEL_13;
  }
  if (!v9)
  {
    char v10 = +[SSLogConfig sharedConfig];
  }
  int v21 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  int v23 = [v10 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    v22 &= 2u;
  }
  if (v22)
  {
    [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    int v34 = 138543618;
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v36 = 2114;
    id v37 = v6;
    LODWORD(v33) = 22;
    uint64_t v24 = (void *)_os_log_send_and_compose_impl();

    if (!v24) {
      goto LABEL_25;
    }
    int v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v34, v33);
    free(v24);
    SSFileLog(v10, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v23);
  }

LABEL_25:
  int v31 = *(void **)(a1 + 40);
  if (v6)
  {
    [v31 finishWithError:v6];
  }
  else
  {
    id v32 = SSError(@"SSErrorDomain", 100, 0, 0);
    [v31 finishWithError:v32];
  }
LABEL_28:
}

+ (id)_createAuthenticationContextForAccount:(id)a3 silentAuthentication:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ([(id)objc_opt_class() _currentProcessLinksUIKit])
  {
    uint64_t v9 = [v8 objectForKey:@"SSAccountStoreAuthKitPresentingViewController"];
    char v10 = [v9 pointerValue];

    if (!v10)
    {
      uint64_t v11 = SSVUIKitFramework();
      int v12 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Uiapplication.isa, v11), "sharedApplication");
      id v13 = [v12 keyWindow];
      id v14 = [v13 rootViewController];

      uint64_t v15 = [v14 presentedViewController];

      if (v15)
      {
        do
        {
          char v10 = [v14 presentedViewController];

          uint64_t v16 = [v10 presentedViewController];

          id v14 = v10;
        }
        while (v16);
        if (!v10) {
          goto LABEL_13;
        }
      }
      else
      {
        char v10 = v14;
        if (!v14) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v17 = SSVAuthKitUIFramework();
    id v18 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Akappleidauthe.isa, v17));
    uint64_t v19 = SSVUIKitFramework();
    SSVWeakLinkedClassForString(&cfstr_Uinavigationco.isa, v19);
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [v10 topViewController];
      [v18 setPresentingViewController:v20];

      if (v18) {
        goto LABEL_14;
      }
    }
    else
    {
      [v18 setPresentingViewController:v10];
      if (v18) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    char v10 = 0;
  }
LABEL_13:
  id v18 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  [v18 _setProxyingForApp:1];
LABEL_14:
  uint64_t v21 = [v7 accountName];
  int v22 = [v7 altDSID];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    uint64_t v24 = [v7 altDSID];
    [v18 setAltDSID:v24];
  }
  uint64_t v25 = [v7 uniqueIdentifier];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [v7 uniqueIdentifier];
    char v28 = [v27 isEqualToNumber:&unk_1EF9A9810];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = [v7 uniqueIdentifier];
      uint64_t v30 = [v29 stringValue];
      [v18 setDSID:v30];
    }
  }
  int v31 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitOKButtonLabel"];
  [v18 setDefaultButtonString:v31];

  [v18 setIsUsernameEditable:v21 == 0];
  id v32 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitPromptTitle"];
  objc_msgSend(v18, "set_passwordPromptTitle:", v32);

  uint64_t v33 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitReasonKey"];
  [v18 setReason:v33];

  [v18 setServiceType:2];
  [v18 setShouldAllowAppleIDCreation:0];
  [v18 setShouldForceInteractiveAuth:1];
  [v18 setShouldUpdatePersistentServiceTokens:1];
  [v18 setUsername:v21];
  id v34 = [v18 clientInfo];
  if (v34 || (id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60])) != 0)
  {
    id v35 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"];
    if (v35) {
      [v34 setObject:v35 forKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"];
    }
    __int16 v36 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitUserAgentKey"];
    if (v36) {
      [v34 setObject:v36 forKeyedSubscript:@"SSAccountStoreAuthKitUserAgentKey"];
    }
  }
  [v18 setClientInfo:v34];
  int v52 = (void *)v21;
  if (v6)
  {
    uint64_t v37 = 1;
  }
  else
  {
    uint64_t v38 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventPrompt"];
    uint64_t v37 = [v38 BOOLValue];
  }
  [v18 setShouldPreventInteractiveAuth:v37];
  id v39 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitProxiedAppBundleIDKey"];
  if ([v39 length])
  {
    [v18 _setProxyingForApp:1];
    [v18 _setProxiedAppBundleID:v39];
  }
  int v40 = [v8 objectForKeyedSubscript:@"SSAccountStoreAuthKitProxiedAppNameKey"];
  if ([v40 length])
  {
    [v18 _setProxyingForApp:1];
    [v18 _setProxiedAppName:v40];
  }
  if (v6)
  {
    id v51 = v7;
    uint64_t v41 = (void *)SSVAppleAccountFramework();
    uint64_t v42 = SSVWeakLinkedStringConstantForString("kAASaveOptionCompanionDeviceClientInfoKey", v41);
    id v43 = (void *)SSVAppleAccountFramework();
    uint64_t v44 = SSVWeakLinkedStringConstantForString("kAASaveOptionCompanionDeviceUDIDKey", v43);
    uint64_t v50 = (void *)v42;
    uint64_t v45 = [v8 objectForKeyedSubscript:v42];
    uint64_t v46 = [v8 objectForKeyedSubscript:v44];
    if ([v45 length] || objc_msgSend(v46, "length"))
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4F4F010]);
      [v47 setLinkType:2];
      [v47 setServerFriendlyDescription:v45];
      [v47 setUniqueDeviceIdentifier:v46];
      if (v47)
      {
        [v18 setCompanionDevice:v47];
      }
    }
    [v18 setIsUsernameEditable:0];
    [v18 setShouldForceInteractiveAuth:0];
    uint64_t v48 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F17A20]];
    [v18 setServiceIdentifiers:v48];

    id v7 = v51;
  }

  return v18;
}

+ (id)_createAuthenticationController
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  return v2;
}

+ (id)_createUpdatedAccount:(id)a3 withAuthenticationResults:(id)a4 options:(id)a5
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  id v7 = (SSAccount *)a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDA8]];
  int v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EE10]];
  uint64_t v203 = v9;
  id v13 = [v9 objectForKeyedSubscript:SSVerifyCredentialsAccountScope];
  uint64_t v199 = [v13 integerValue];

  v200 = v10;
  v201 = v11;
  uint64_t v202 = v12;
  id v198 = v8;
  if (!v7)
  {
    id v14 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    uint64_t v17 = [v14 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      int v18 = v16;
    }
    else {
      int v18 = v16 & 2;
    }
    if (v18)
    {
      uint64_t v19 = [v9 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      uint64_t v20 = SSHashIfNeeded(v10);
      uint64_t v21 = [v11 stringValue];
      int v22 = SSHashIfNeeded(v21);
      uint64_t v23 = SSHashIfNeeded(v202);
      int v204 = 138544386;
      id v205 = v19;
      __int16 v206 = 2114;
      id v207 = v20;
      __int16 v208 = 2114;
      char v209 = v22;
      __int16 v210 = 2114;
      id v211 = v23;
      __int16 v212 = 2048;
      uint64_t v213 = v199;
      LODWORD(v197) = 52;
      uint64_t v194 = &v204;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl();

      char v10 = v200;
      uint64_t v11 = v201;

      int v12 = v202;
      if (v24)
      {
        uint64_t v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v204, v197);
        free(v24);
        SSFileLog(v14, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
      }
    }
    else
    {
    }
    id v32 = +[SSAccountStore defaultStore];
    id v7 = [v32 accountWithAltDSID:v10 uniqueIdentifier:v11 accountName:v12 scope:v199];

    uint64_t v33 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    id v34 = (void *)v33;
    if (v7)
    {
      id v8 = v198;
      if (!v33)
      {
        id v34 = +[SSLogConfig sharedConfig];
      }
      int v35 = objc_msgSend(v34, "shouldLog", v194);
      if ([v34 shouldLogToDisk]) {
        int v36 = v35 | 2;
      }
      else {
        int v36 = v35;
      }
      uint64_t v37 = [v34 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
        int v38 = v36;
      }
      else {
        int v38 = v36 & 2;
      }
      if (v38)
      {
        id v39 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
        int v204 = 138543362;
        id v205 = v39;
        LODWORD(v197) = 12;
        uint64_t v194 = &v204;
        int v40 = (void *)_os_log_send_and_compose_impl();

        if (!v40)
        {
LABEL_27:

LABEL_65:
          int v12 = v202;
          goto LABEL_66;
        }
        uint64_t v37 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v204, v197);
        free(v40);
        SSFileLog(v34, @"%@", v41, v42, v43, v44, v45, v46, (uint64_t)v37);
      }

      goto LABEL_27;
    }
    if (!v33)
    {
      id v34 = +[SSLogConfig sharedConfig];
    }
    int v47 = objc_msgSend(v34, "shouldLog", v194);
    if ([v34 shouldLogToDisk]) {
      int v48 = v47 | 2;
    }
    else {
      int v48 = v47;
    }
    uint64_t v49 = [v34 OSLogObject];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
      int v50 = v48;
    }
    else {
      int v50 = v48 & 2;
    }
    if (v50)
    {
      id v51 = [v9 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v204 = 138543362;
      id v205 = v51;
      LODWORD(v197) = 12;
      uint64_t v195 = &v204;
      int v52 = (void *)_os_log_send_and_compose_impl();

      if (!v52) {
        goto LABEL_40;
      }
      uint64_t v49 = objc_msgSend(NSString, "stringWithCString:encoding:", v52, 4, &v204, v197);
      free(v52);
      SSFileLog(v34, @"%@", v53, v54, v55, v56, v57, v58, (uint64_t)v49);
    }

LABEL_40:
    id v7 = objc_alloc_init(SSAccount);
    uint64_t v59 = [v9 objectForKeyedSubscript:@"SSAccountStoreAuthKitCanSetActiveAccountKey"];
    uint64_t v60 = [v59 BOOLValue];

    uint64_t v61 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    uint64_t v62 = (void *)v61;
    if (v60)
    {
      if (!v61)
      {
        uint64_t v62 = +[SSLogConfig sharedConfig];
      }
      int v63 = objc_msgSend(v62, "shouldLog", v195);
      if ([v62 shouldLogToDisk]) {
        int v64 = v63 | 2;
      }
      else {
        int v64 = v63;
      }
      uint64_t v65 = [v62 OSLogObject];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
        int v66 = v64;
      }
      else {
        int v66 = v64 & 2;
      }
      if (!v66) {
        goto LABEL_63;
      }
      uint64_t v67 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v204 = 138543362;
      id v205 = v67;
      LODWORD(v197) = 12;
      uint64_t v194 = &v204;
      uint64_t v68 = (void *)_os_log_send_and_compose_impl();

      if (!v68)
      {
        uint64_t v60 = 1;
LABEL_64:

        [(SSAccount *)v7 setActive:v60];
        [(SSAccount *)v7 setAccountScope:v199];
        id v8 = v198;
        goto LABEL_65;
      }
    }
    else
    {
      if (!v61)
      {
        uint64_t v62 = +[SSLogConfig sharedConfig];
      }
      int v69 = objc_msgSend(v62, "shouldLog", v195);
      if ([v62 shouldLogToDisk]) {
        int v70 = v69 | 2;
      }
      else {
        int v70 = v69;
      }
      uint64_t v65 = [v62 OSLogObject];
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT)) {
        int v71 = v70;
      }
      else {
        int v71 = v70 & 2;
      }
      if (!v71) {
        goto LABEL_63;
      }
      long long v72 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v204 = 138543362;
      id v205 = v72;
      LODWORD(v197) = 12;
      uint64_t v194 = &v204;
      uint64_t v68 = (void *)_os_log_send_and_compose_impl();

      if (!v68)
      {
        uint64_t v60 = 0;
        goto LABEL_64;
      }
    }
    uint64_t v65 = objc_msgSend(NSString, "stringWithCString:encoding:", v68, 4, &v204, v197);
    free(v68);
    SSFileLog(v62, @"%@", v73, v74, v75, v76, v77, v78, (uint64_t)v65);
LABEL_63:

    goto LABEL_64;
  }
LABEL_66:
  if (!v10) {
    goto LABEL_69;
  }
  uint64_t v79 = [(SSAccount *)v7 altDSID];
  char v80 = [v79 isEqualToString:v10];

  if ((v80 & 1) == 0)
  {
    BOOL v81 = [(SSAccount *)v7 altDSID];

    if (!v81) {
      goto LABEL_85;
    }
    id v82 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v82)
    {
      id v82 = +[SSLogConfig sharedConfig];
    }
    int v83 = objc_msgSend(v82, "shouldLog", v194);
    if ([v82 shouldLogToDisk]) {
      int v84 = v83 | 2;
    }
    else {
      int v84 = v83;
    }
    uint64_t v85 = [v82 OSLogObject];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT)) {
      int v86 = v84;
    }
    else {
      int v86 = v84 & 2;
    }
    if (v86)
    {
      uint64_t v87 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      uint64_t v88 = [(SSAccount *)v7 altDSID];
      uint64_t v89 = SSHashIfNeeded(v88);
      SSHashIfNeeded(v200);
      v91 = id v90 = v8;
      int v204 = 138543874;
      id v205 = v87;
      __int16 v206 = 2114;
      id v207 = v89;
      __int16 v208 = 2114;
      char v209 = v91;
      LODWORD(v197) = 32;
      uint64_t v194 = &v204;
      uint64_t v92 = (void *)_os_log_send_and_compose_impl();

      id v8 = v90;
      char v10 = v200;
      uint64_t v11 = v201;

      if (!v92)
      {
LABEL_84:

        int v12 = v202;
LABEL_85:
        -[SSAccount setAltDSID:](v7, "setAltDSID:", v10, v194);
        LODWORD(v10) = 1;
        if (!v11) {
          goto LABEL_102;
        }
        goto LABEL_86;
      }
      uint64_t v85 = objc_msgSend(NSString, "stringWithCString:encoding:", v92, 4, &v204, v197);
      free(v92);
      SSFileLog(v82, @"%@", v93, v94, v95, v96, v97, v98, (uint64_t)v85);
    }

    goto LABEL_84;
  }
  LODWORD(v10) = 0;
LABEL_69:
  if (!v11) {
    goto LABEL_102;
  }
LABEL_86:
  id v99 = [(SSAccount *)v7 uniqueIdentifier];
  char v100 = [v99 isEqualToNumber:v11];

  if ((v100 & 1) == 0)
  {
    uint64_t v101 = [(SSAccount *)v7 uniqueIdentifier];

    if (!v101)
    {
LABEL_101:
      -[SSAccount setUniqueIdentifier:](v7, "setUniqueIdentifier:", v11, v194);
      LODWORD(v10) = 1;
      goto LABEL_102;
    }
    id v102 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v102)
    {
      id v102 = +[SSLogConfig sharedConfig];
    }
    int v103 = [v102 shouldLog];
    if ([v102 shouldLogToDisk]) {
      int v104 = v103 | 2;
    }
    else {
      int v104 = v103;
    }
    uint64_t v105 = [v102 OSLogObject];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
      int v106 = v104;
    }
    else {
      int v106 = v104 & 2;
    }
    if (v106)
    {
      uint64_t v107 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      uint64_t v108 = [(SSAccount *)v7 uniqueIdentifier];
      uint64_t v109 = [v108 stringValue];
      uint64_t v110 = SSHashIfNeeded(v109);
      id v111 = [v201 stringValue];
      int v112 = SSHashIfNeeded(v111);
      int v204 = 138543874;
      id v205 = v107;
      __int16 v206 = 2114;
      id v207 = v110;
      __int16 v208 = 2114;
      char v209 = v112;
      LODWORD(v197) = 32;
      uint64_t v194 = &v204;
      uint64_t v113 = (void *)_os_log_send_and_compose_impl();

      id v8 = v198;
      uint64_t v11 = v201;

      if (!v113)
      {
LABEL_100:

        int v12 = v202;
        goto LABEL_101;
      }
      uint64_t v105 = objc_msgSend(NSString, "stringWithCString:encoding:", v113, 4, &v204, v197);
      free(v113);
      SSFileLog(v102, @"%@", v114, v115, v116, v117, v118, v119, (uint64_t)v105);
    }

    goto LABEL_100;
  }
LABEL_102:
  if (v12)
  {
    uint64_t v120 = [(SSAccount *)v7 accountName];
    char v121 = [v120 isEqualToString:v12];

    if ((v121 & 1) == 0)
    {
      uint64_t v122 = [(SSAccount *)v7 accountName];

      if (!v122)
      {
LABEL_119:
        -[SSAccount setAccountName:](v7, "setAccountName:", v12, v194);
        goto LABEL_120;
      }
      uint64_t v123 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v123)
      {
        uint64_t v123 = +[SSLogConfig sharedConfig];
      }
      int v124 = objc_msgSend(v123, "shouldLog", v194);
      if ([v123 shouldLogToDisk]) {
        v124 |= 2u;
      }
      uint64_t v125 = [v123 OSLogObject];
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT)) {
        int v126 = v124;
      }
      else {
        int v126 = v124 & 2;
      }
      if (v126)
      {
        uint64_t v127 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
        int v128 = [(SSAccount *)v7 accountName];
        uint64_t v129 = SSHashIfNeeded(v128);
        uint64_t v130 = SSHashIfNeeded(v202);
        int v204 = 138543874;
        id v205 = v127;
        __int16 v206 = 2114;
        id v207 = v129;
        __int16 v208 = 2114;
        char v209 = v130;
        LODWORD(v197) = 32;
        uint64_t v194 = &v204;
        id v131 = (void *)_os_log_send_and_compose_impl();

        if (!v131)
        {
LABEL_118:

          int v12 = v202;
          goto LABEL_119;
        }
        uint64_t v125 = objc_msgSend(NSString, "stringWithCString:encoding:", v131, 4, &v204, v197);
        free(v131);
        SSFileLog(v123, @"%@", v132, v133, v134, v135, v136, v137, (uint64_t)v125);
      }

      goto LABEL_118;
    }
  }
  if (!v10) {
    goto LABEL_168;
  }
LABEL_120:
  uint64_t v138 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v138)
  {
    uint64_t v138 = +[SSLogConfig sharedConfig];
  }
  int v139 = [v138 shouldLog];
  if ([v138 shouldLogToDisk]) {
    v139 |= 2u;
  }
  uint64_t v140 = [v138 OSLogObject];
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT)) {
    int v141 = v139;
  }
  else {
    int v141 = v139 & 2;
  }
  if (v141)
  {
    uint64_t v142 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    int v204 = 138543362;
    id v205 = v142;
    LODWORD(v197) = 12;
    uint64_t v196 = &v204;
    uint64_t v143 = (void *)_os_log_send_and_compose_impl();

    if (!v143) {
      goto LABEL_131;
    }
    uint64_t v140 = objc_msgSend(NSString, "stringWithCString:encoding:", v143, 4, &v204, v197);
    free(v143);
    SSFileLog(v138, @"%@", v144, v145, v146, v147, v148, v149, (uint64_t)v140);
  }

LABEL_131:
  uint64_t v150 = +[SSAccountStore defaultStore];
  uint64_t v151 = [(SSAccount *)v7 altDSID];
  int v152 = [(SSAccount *)v7 uniqueIdentifier];
  int v153 = [(SSAccount *)v7 accountName];
  v154 = [v150 accountWithAltDSID:v151 uniqueIdentifier:v152 accountName:v153 scope:v199];

  if (v154)
  {
    id v155 = [v154 backingAccount];
    v156 = [v155 identifier];
    uint64_t v157 = [(SSAccount *)v7 backingAccount];
    uint64_t v158 = [v157 identifier];
    int v159 = [v156 isEqualToString:v158];

    uint64_t v160 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    uint64_t v161 = (void *)v160;
    if (v159)
    {
      if (!v160)
      {
        uint64_t v161 = +[SSLogConfig sharedConfig];
      }
      int v162 = objc_msgSend(v161, "shouldLog", v196);
      if ([v161 shouldLogToDisk]) {
        v162 |= 2u;
      }
      int v163 = [v161 OSLogObject];
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT)) {
        int v164 = v162;
      }
      else {
        int v164 = v162 & 2;
      }
      if (v164) {
        goto LABEL_150;
      }
LABEL_162:
      id v8 = v198;
      goto LABEL_163;
    }
    if (!v160)
    {
      uint64_t v161 = +[SSLogConfig sharedConfig];
    }
    int v175 = objc_msgSend(v161, "shouldLog", v196);
    if ([v161 shouldLogToDisk]) {
      v175 |= 2u;
    }
    uint64_t v176 = [v161 OSLogObject];
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT)) {
      int v177 = v175;
    }
    else {
      int v177 = v175 & 2;
    }
    if (v177)
    {
      uint64_t v178 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      uint64_t v179 = [v154 hashedDescription];
      int v204 = 138543618;
      id v205 = v178;
      __int16 v206 = 2114;
      id v207 = v179;
      LODWORD(v197) = 22;
      uint64_t v194 = &v204;
      uint64_t v180 = (void *)_os_log_send_and_compose_impl();

      id v8 = v198;
      if (!v180)
      {
LABEL_166:

        uint64_t v161 = v7;
        id v7 = v154;
        goto LABEL_167;
      }
      uint64_t v176 = objc_msgSend(NSString, "stringWithCString:encoding:", v180, 4, &v204, v197);
      free(v180);
      SSFileLog(v161, @"%@", v181, v182, v183, v184, v185, v186, (uint64_t)v176);
    }
    else
    {
      id v8 = v198;
    }

    goto LABEL_166;
  }
  uint64_t v161 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v161)
  {
    uint64_t v161 = +[SSLogConfig sharedConfig];
  }
  int v165 = objc_msgSend(v161, "shouldLog", v196);
  if ([v161 shouldLogToDisk]) {
    v165 |= 2u;
  }
  int v163 = [v161 OSLogObject];
  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT)) {
    int v166 = v165;
  }
  else {
    int v166 = v165 & 2;
  }
  if (!v166) {
    goto LABEL_162;
  }
LABEL_150:
  int v167 = [v203 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  int v204 = 138543362;
  id v205 = v167;
  LODWORD(v197) = 12;
  uint64_t v194 = &v204;
  v168 = (void *)_os_log_send_and_compose_impl();

  id v8 = v198;
  if (v168)
  {
    int v163 = objc_msgSend(NSString, "stringWithCString:encoding:", v168, 4, &v204, v197);
    free(v168);
    SSFileLog(v161, @"%@", v169, v170, v171, v172, v173, v174, (uint64_t)v163);
LABEL_163:
  }
LABEL_167:

  int v12 = v202;
LABEL_168:
  v187 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F4EDE8], v194);
  if (v187)
  {
    v188 = [(SSAccount *)v7 passwordEquivalentToken];
    char v189 = [v188 isEqualToString:v187];

    if ((v189 & 1) == 0) {
      [(SSAccount *)v7 setPasswordEquivalentToken:v187];
    }
  }
  uint64_t v190 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDF0]];
  if (v190)
  {
    uint64_t v191 = [(SSAccount *)v7 rawPassword];
    char v192 = [v191 isEqualToString:v190];

    if ((v192 & 1) == 0) {
      [(SSAccount *)v7 setRawPassword:v190];
    }
  }

  return v7;
}

- (id)_optionsForProxiedAuthenticationWithVerifyCredentialsOptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SSAccountStoresProxiedDeviceFlagKey"];
  id v5 = [MEMORY[0x1E4F4F010] currentDevice];
  [v5 setLinkType:2];
  BOOL v6 = [v5 serializedData];
  if (v6)
  {
    id v7 = (void *)SSVAppleAccountFramework();
    id v8 = SSVWeakLinkedStringConstantForString("kAAErrorDetailsProxiedDeviceDataKey", v7);
    [v4 setObject:v6 forKeyedSubscript:v8];

    goto LABEL_15;
  }
  id v9 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v9)
  {
    id v9 = +[SSLogConfig sharedConfig];
  }
  int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  int v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    v11 &= 2u;
  }
  if (!v11) {
    goto LABEL_13;
  }
  [v3 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  int v22 = 138543362;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = 12;
  id v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
    free(v13);
    SSFileLog(v9, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v12);
LABEL_13:
  }
  id v4 = 0;
LABEL_15:

  return v4;
}

- (id)_passwordEquivalentTokenFromAlternateAccountWithAltDSID:(id)a3 DSID:(id)a4 username:(id)a5
{
  return 0;
}

- (id)_shouldCreateNewAccountForAccount:(id)a3 options:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountName];
  if (v8 || ([v6 altDSID], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v9 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v9)
    {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      *(_DWORD *)id location = 138543618;
      *(void *)&id location[4] = self;
      __int16 v77 = 2114;
      id v78 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v72) = 22;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v72);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      }
    }
    else
    {
    }
    uint64_t v22 = +[SSPromise promiseWithResult:&unk_1EF9A9828];
    goto LABEL_17;
  }
  uint64_t v25 = [v6 uniqueIdentifier];

  if (v25) {
    goto LABEL_4;
  }
  uint64_t v26 = [v7 objectForKeyedSubscript:SSVerifyCredentialsAccountScope];
  uint64_t v27 = [v26 integerValue];

  if (v27 == 1)
  {
    uint64_t v28 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v28)
    {
      uint64_t v28 = +[SSLogConfig sharedConfig];
    }
    int v29 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      int v30 = v29 | 2;
    }
    else {
      int v30 = v29;
    }
    uint64_t v31 = [v28 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      int v32 = v30;
    }
    else {
      int v32 = v30 & 2;
    }
    if (!v32)
    {

      goto LABEL_75;
    }
    [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    *(_DWORD *)id location = 138543618;
    *(void *)&id location[4] = self;
    __int16 v77 = 2114;
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    uint64_t v33 = (void *)_os_log_send_and_compose_impl();

    if (v33) {
      goto LABEL_47;
    }
    goto LABEL_75;
  }
  id v34 = [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitCanCreateNewAccountKey"];
  int v35 = [v34 BOOLValue];

  int v36 = [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventPrompt"];
  int v37 = [v36 BOOLValue];

  if (!v35 || v37)
  {
    uint64_t v28 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v28)
    {
      uint64_t v28 = +[SSLogConfig sharedConfig];
    }
    int v51 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      int v52 = v51 | 2;
    }
    else {
      int v52 = v51;
    }
    uint64_t v53 = [v28 OSLogObject];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
      int v54 = v52;
    }
    else {
      int v54 = v52 & 2;
    }
    if (!v54)
    {

      goto LABEL_75;
    }
    [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    *(_DWORD *)id location = 138543618;
    *(void *)&id location[4] = self;
    __int16 v77 = 2114;
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    uint64_t v33 = (void *)_os_log_send_and_compose_impl();

    if (v33)
    {
LABEL_47:
      uint64_t v44 = objc_msgSend(NSString, "stringWithCString:encoding:", v33, 4, location, v72);
      free(v33);
      SSFileLog(v28, @"%@", v45, v46, v47, v48, v49, v50, (uint64_t)v44);
    }
LABEL_75:

    uint64_t v22 = +[SSPromise promiseWithResult:&unk_1EF9A9840];
LABEL_17:
    id v23 = (SSPromise *)v22;
    goto LABEL_18;
  }
  int v38 = [(id)objc_opt_class() _isBuddyRunning];
  uint64_t v39 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  uint64_t v28 = (void *)v39;
  if (v38)
  {
    if (!v39)
    {
      uint64_t v28 = +[SSLogConfig sharedConfig];
    }
    int v40 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      int v41 = v40 | 2;
    }
    else {
      int v41 = v40;
    }
    uint64_t v42 = [v28 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      int v43 = v41;
    }
    else {
      int v43 = v41 & 2;
    }
    if (!v43)
    {

      goto LABEL_75;
    }
    [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    *(_DWORD *)id location = 138543618;
    *(void *)&id location[4] = self;
    __int16 v77 = 2114;
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    uint64_t v33 = (void *)_os_log_send_and_compose_impl();

    if (v33) {
      goto LABEL_47;
    }
    goto LABEL_75;
  }
  if (!v39)
  {
    uint64_t v28 = +[SSLogConfig sharedConfig];
  }
  int v55 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    int v56 = v55 | 2;
  }
  else {
    int v56 = v55;
  }
  uint64_t v57 = [v28 OSLogObject];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
    int v58 = v56;
  }
  else {
    int v58 = v56 & 2;
  }
  if (v58)
  {
    [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    *(_DWORD *)id location = 138543618;
    *(void *)&id location[4] = self;
    __int16 v77 = 2114;
    id v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    uint64_t v59 = (void *)_os_log_send_and_compose_impl();

    if (v59)
    {
      uint64_t v60 = objc_msgSend(NSString, "stringWithCString:encoding:", v59, 4, location, v72);
      free(v59);
      SSFileLog(v28, @"%@", v61, v62, v63, v64, v65, v66, (uint64_t)v60);
    }
  }
  else
  {
  }
  uint64_t v67 = objc_alloc_init(SSPromise);
  uint64_t v68 = SSViTunesStoreFramework();
  id v69 = objc_alloc_init((Class)SSVWeakLinkedClassForString(&cfstr_Iscreateaccoun_0.isa, v68));
  objc_initWeak((id *)location, v69);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __60__SSAccountStore__shouldCreateNewAccountForAccount_options___block_invoke;
  v73[3] = &unk_1E5BA8860;
  objc_copyWeak(&v75, (id *)location);
  id v23 = v67;
  uint64_t v74 = v23;
  [v69 setCompletionBlock:v73];
  uint64_t v70 = SSViTunesStoreFramework();
  int v71 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Isoperationque.isa, v70), "mainQueue");
  [v71 addOperation:v69];

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)location);

LABEL_18:
  return v23;
}

void __60__SSAccountStore__shouldCreateNewAccountForAccount_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(WeakRetained, "responseType"));
  [v2 finishWithResult:v3];
}

+ (BOOL)_allowSilentPasswordAuthForAccount:(id)a3 withOptions:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isBuddyRunning]) {
    goto LABEL_15;
  }
  if ([v6 isDemoAccount])
  {
    id v8 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    int v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v12 = objc_opt_class();
      id v13 = v12;
      [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v27 = 138543618;
      uint64_t v28 = v12;
      __int16 v29 = 2114;
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = 22;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

LABEL_15:
        char v21 = 1;
        goto LABEL_16;
      }
      int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v27, v26);
      free(v14);
      SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_14;
  }
  id v23 = [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitAllowPasswordReuse"];
  char v21 = [v23 BOOLValue];

  if (+[SSDevice deviceIsAppleWatch])
  {
    uint64_t v24 = [v7 objectForKeyedSubscript:@"SSAccountStoreAuthKitAllowPasswordReuse"];
    uint64_t v25 = v24;
    if (v24) {
      char v21 = [v24 BOOLValue];
    }
    else {
      char v21 = 1;
    }
  }
LABEL_16:

  return v21;
}

- (id)_updateAccountWithAuthKitViaPromptAuth:(id)a3 store:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  int v11 = [SSLazyPromise alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke;
  v16[3] = &unk_1E5BA9B88;
  objc_copyWeak(&v19, &location);
  v16[4] = self;
  id v12 = v10;
  id v17 = v12;
  id v13 = v8;
  id v18 = v13;
  uint64_t v14 = [(SSLazyPromise *)v11 initWithBlock:v16];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

void __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke(id *a1, void *a2)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if ([(id)objc_opt_class() _isBuddyRunning])
  {
    id v5 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (!v9)
    {

      goto LABEL_49;
    }
    [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 12;
    id v10 = (void *)_os_log_send_and_compose_impl();

    if (v10) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
  id v18 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventPrompt"];
  int v19 = [v18 BOOLValue];

  if (v19)
  {
    id v5 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v5)
    {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v20 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v21 = v20 | 2;
    }
    else {
      int v21 = v20;
    }
    uint64_t v22 = [v5 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      int v23 = v21;
    }
    else {
      int v23 = v21 & 2;
    }
    if (!v23)
    {

      goto LABEL_49;
    }
    [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 12;
    id v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
    {
LABEL_12:
      int v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, location, v57);
      free(v10);
      SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    }
LABEL_49:

    uint64_t v49 = SSError(@"SSErrorDomain", 132, 0, 0);
    [v3 finishWithError:v49];
    goto LABEL_54;
  }
  if (a1[6] || !SSRestrictionsShouldRestrictAccountModification())
  {
    int v37 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v37)
    {
      int v37 = +[SSLogConfig sharedConfig];
    }
    int v38 = [v37 shouldLog];
    if ([v37 shouldLogToDisk]) {
      int v39 = v38 | 2;
    }
    else {
      int v39 = v38;
    }
    int v40 = [v37 OSLogObject];
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
      v39 &= 2u;
    }
    if (v39)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v57) = 12;
      int v41 = (void *)_os_log_send_and_compose_impl();

      if (v41)
      {
        uint64_t v42 = objc_msgSend(NSString, "stringWithCString:encoding:", v41, 4, location, v57);
        free(v41);
        SSFileLog(v37, @"%@", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
      }
    }
    else
    {
    }
    uint64_t v49 = [(id)objc_opt_class() _createAuthenticationController];
    uint64_t v50 = a1 + 6;
    int v51 = a1 + 5;
    int v52 = [(id)objc_opt_class() _createAuthenticationContextForAccount:a1[6] silentAuthentication:0 options:a1[5]];
    id v54 = a1[4];
    uint64_t v53 = a1 + 4;
    [v49 setDelegate:v54];
    objc_initWeak(location, *v53);
    objc_initWeak(&from, v49);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke_344;
    v58[3] = &unk_1E5BA9B60;
    objc_copyWeak(&v64, location);
    objc_copyWeak(&v65, &from);
    id v55 = v52;
    id v56 = *v53;
    id v59 = v55;
    id v60 = v56;
    id v61 = *v50;
    id v62 = *v51;
    id v63 = v3;
    [v49 authenticateWithContext:v55 completion:v58];

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v24 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v24)
    {
      uint64_t v24 = +[SSLogConfig sharedConfig];
    }
    int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    int v27 = [v24 OSLogObject];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      int v28 = v26;
    }
    else {
      int v28 = v26 & 2;
    }
    if (v28)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v57) = 12;
      __int16 v29 = (void *)_os_log_send_and_compose_impl();

      if (v29)
      {
        id v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, location, v57);
        free(v29);
        SSFileLog(v24, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
      }
    }
    else
    {
    }
    uint64_t v49 = SSError(@"SSErrorDomain", 107, 0, 0);
    [v3 finishWithError:v49];
  }
LABEL_54:
}

void __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke_344(uint64_t a1, void *a2, void *a3)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v44 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = objc_loadWeakRetained((id *)(a1 + 80));
  [v7 setDelegate:0];

  id v8 = objc_alloc_init(SSMetricsDialogEvent);
  [(SSMetricsDialogEvent *)v8 setDialogType:@"SignIn"];
  [(SSMetricsMutableEvent *)v8 setEventType:@"dialog"];
  uint64_t v42 = [*(id *)(a1 + 32) username];
  uint64_t v9 = [v42 length];
  id v10 = SSMetricsDialogEventIdPassword;
  if (!v9) {
    id v10 = SSMetricsDialogEventIdUserNamePassword;
  }
  int v41 = *v10;
  -[SSMetricsDialogEvent setDialogId:](v8, "setDialogId:");
  if (v5)
  {
    if ([v5 code] == -7003)
    {
      [(SSMetricsDialogEvent *)v8 setActionType:@"cancel"];
      [(SSMetricsDialogEvent *)v8 setTargetId:@"Cancel"];
    }
    else
    {
      [(SSMetricsDialogEvent *)v8 setTargetId:@"Ok"];
      [(SSMetricsDialogEvent *)v8 setActionType:@"enterPassword"];
    }
    int v11 = SSMetricsDialogEventResultFailure;
  }
  else
  {
    [(SSMetricsDialogEvent *)v8 setTargetId:@"Ok"];
    [(SSMetricsDialogEvent *)v8 setActionType:@"ok"];
    int v11 = SSMetricsDialogEventResultSuccess;
  }
  [(SSMetricsDialogEvent *)v8 setResult:*v11];
  uint64_t v12 = [*(id *)(a1 + 32) clientInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v12 objectForKey:@"metricsAuthenticationAttempts"];
    [(SSMetricsDialogEvent *)v8 setUserActions:v13];
  }
  id v43 = WeakRetained;
  uint64_t v14 = [v12 objectForKeyedSubscript:@"SSAccountStoreAuthKitCreateAccountQueryParamsKey"];
  int v40 = v14;
  if (v14)
  {
    uint64_t v15 = [v14 objectForKeyedSubscript:@"product"];
    uint64_t v16 = (void *)v15;
    if (v15)
    {
      uint64_t v53 = @"buyParams";
      v54[0] = v15;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
      [(SSMetricsDialogEvent *)v8 setDetails:v17];

      id v18 = [*(id *)(a1 + 40) _buyParamsForBuyParamsString:v16];
      int v19 = [v18 objectForKeyedSubscript:@"mtTopic"];
      if (v19) {
        [(SSMetricsMutableEvent *)v8 setTopic:v19];
      }
    }
    else
    {
      int v51 = @"buyParams";
      uint64_t v52 = MEMORY[0x1E4F1CC08];
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      [(SSMetricsDialogEvent *)v8 setDetails:v18];
      int v19 = 0;
    }
  }
  else
  {
    uint64_t v49 = @"buyParams";
    uint64_t v50 = MEMORY[0x1E4F1CC08];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    [(SSMetricsDialogEvent *)v8 setDetails:v16];
    int v19 = 0;
  }

  int v20 = [v12 objectForKeyedSubscript:@"SSAccountStoreAuthKitUserAgentKey"];
  if (v20) {
    [(SSMetricsMutableEvent *)v8 setProperty:v20 forBodyKey:@"userAgent"];
  }
  if (v8) {
    [*(id *)(a1 + 40) _recordAnalyticsForMetricsDialogEvent:v8 withTopic:v19];
  }
  int v21 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  if ([v21 length])
  {
    uint64_t v22 = v43;
    int v23 = [(id)objc_opt_class() _createUpdatedAccount:*(void *)(a1 + 48) withAuthenticationResults:v44 options:*(void *)(a1 + 56)];
    uint64_t v24 = [[SSUpdateAccountResponse alloc] initWithUpdatedAccount:v23 credentialSource:1];
    [*(id *)(a1 + 64) finishWithResult:v24];

    goto LABEL_39;
  }
  id v39 = v5;
  int v25 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v25)
  {
    int v25 = +[SSLogConfig sharedConfig];
  }
  int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  int v28 = [v25 OSLogObject];
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    v27 &= 2u;
  }
  if (!v27) {
    goto LABEL_34;
  }
  [*(id *)(a1 + 56) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  int v45 = 138543618;
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v47 = 2112;
  id v48 = v39;
  LODWORD(v38) = 22;
  __int16 v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    int v28 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v45, v38);
    free(v29);
    SSFileLog(v25, @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v28);
LABEL_34:
  }
  uint64_t v36 = *(void **)(a1 + 64);
  id v5 = v39;
  if (v39)
  {
    [*(id *)(a1 + 64) finishWithError:v39];
  }
  else
  {
    int v37 = SSError(@"SSErrorDomain", 100, 0, 0);
    [v36 finishWithError:v37];
  }
  uint64_t v22 = v43;
LABEL_39:
}

- (id)_updateAccountWithAuthKitViaSilentAuth:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [SSLazyPromise alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke;
  v13[3] = &unk_1E5BA9BD8;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  int v11 = [(SSLazyPromise *)v8 initWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke(id *a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a1[4])
  {
    id v6 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitAllowSilentAuth"];
    char v7 = [v6 BOOLValue];

    if (+[SSDevice deviceIsAppleWatch])
    {
      id v8 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitAllowSilentAuth"];
      id v9 = v8;
      if (v8) {
        char v7 = [v8 BOOLValue];
      }
      else {
        char v7 = 1;
      }
    }
    if ([(id)objc_opt_class() _isBuddyRunning])
    {
      uint64_t v24 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v24)
      {
        uint64_t v24 = +[SSLogConfig sharedConfig];
      }
      int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      int v27 = [v24 OSLogObject];
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        v26 &= 2u;
      }
      if (v26)
      {
        int v28 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
        int v73 = 138543362;
        id v74 = v28;
        LODWORD(v67) = 12;
        uint64_t v66 = &v73;
        __int16 v29 = (void *)_os_log_send_and_compose_impl();

        if (v29)
        {
          uint64_t v30 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v73, v67);
          free(v29);
          SSFileLog(v24, @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
        }
      }
      else
      {
      }
LABEL_45:
      uint64_t v50 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v50)
      {
        uint64_t v50 = +[SSLogConfig sharedConfig];
      }
      int v51 = [v50 shouldLog];
      if ([v50 shouldLogToDisk]) {
        int v52 = v51 | 2;
      }
      else {
        int v52 = v51;
      }
      uint64_t v53 = [v50 OSLogObject];
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT)) {
        v52 &= 2u;
      }
      if (v52)
      {
        id v54 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
        int v73 = 138543362;
        id v74 = v54;
        LODWORD(v67) = 12;
        id v55 = (void *)_os_log_send_and_compose_impl();

        if (!v55)
        {
LABEL_56:

          int v23 = [(id)objc_opt_class() _createAuthenticationController];
          id v62 = objc_opt_class();
          id v64 = a1[4];
          id v63 = a1 + 4;
          id v65 = [v62 _createAuthenticationContextForAccount:v64 silentAuthentication:1 options:v63[1]];
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke_350;
          v68[3] = &unk_1E5BA9BB0;
          objc_copyWeak(&v72, v4);
          id v69 = v63[1];
          id v70 = *v63;
          id v71 = v3;
          [v23 authenticateWithContext:v65 completion:v68];

          objc_destroyWeak(&v72);
          goto LABEL_59;
        }
        uint64_t v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v55, 4, &v73, v67);
        free(v55);
        SSFileLog(v50, @"%@", v56, v57, v58, v59, v60, v61, (uint64_t)v53);
      }

      goto LABEL_56;
    }
    if (v7) {
      goto LABEL_45;
    }
    int v37 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v37)
    {
      int v37 = +[SSLogConfig sharedConfig];
    }
    int v38 = [v37 shouldLog];
    if ([v37 shouldLogToDisk]) {
      int v39 = v38 | 2;
    }
    else {
      int v39 = v38;
    }
    int v40 = [v37 OSLogObject];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
      int v41 = v39;
    }
    else {
      int v41 = v39 & 2;
    }
    if (v41)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v73 = 138543362;
      id v74 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = 12;
      uint64_t v42 = (void *)_os_log_send_and_compose_impl();

      if (v42)
      {
        id v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v42, 4, &v73, v67);
        free(v42);
        SSFileLog(v37, @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v43);
      }
    }
    else
    {
    }
    int v23 = SSError(@"SSErrorDomain", 106, 0, @"Silent authentication isn't allowed.");
    [v3 finishWithError:v23];
  }
  else
  {
    id v10 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v10)
    {
      id v10 = +[SSLogConfig sharedConfig];
    }
    int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    uint64_t v13 = [v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      int v14 = v12;
    }
    else {
      int v14 = v12 & 2;
    }
    if (v14)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v73 = 138543362;
      id v74 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = 12;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (v15)
      {
        id v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v73, v67);
        free(v15);
        SSFileLog(v10, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      }
    }
    else
    {
    }
    int v23 = SSError(@"SSErrorDomain", 100, 0, 0);
    [v3 finishWithError:v23];
  }
LABEL_59:
}

void __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke_350(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  uint64_t v9 = [v8 length];
  uint64_t v10 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  int v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      int v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    int v14 = [v11 OSLogObject];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v36 = 138543362;
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 12;
      id v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        uint64_t v22 = [(id)objc_opt_class() _createUpdatedAccount:*(void *)(a1 + 40) withAuthenticationResults:v5 options:*(void *)(a1 + 32)];
        int v23 = [[SSUpdateAccountResponse alloc] initWithUpdatedAccount:v22 credentialSource:3];
        [*(id *)(a1 + 48) finishWithResult:v23];

        goto LABEL_14;
      }
      int v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v36, v35);
      free(v15);
      SSFileLog(v11, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v14);
    }

    goto LABEL_13;
  }
  if (!v10)
  {
    int v11 = +[SSLogConfig sharedConfig];
  }
  int v24 = [v11 shouldLog];
  if ([v11 shouldLogToDisk]) {
    int v25 = v24 | 2;
  }
  else {
    int v25 = v24;
  }
  int v26 = [v11 OSLogObject];
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    v25 &= 2u;
  }
  if (!v25) {
    goto LABEL_25;
  }
  [*(id *)(a1 + 32) objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  int v36 = 138543618;
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v38 = 2112;
  id v39 = v6;
  LODWORD(v35) = 22;
  int v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    int v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v36, v35);
    free(v27);
    SSFileLog(v11, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v26);
LABEL_25:
  }
  uint64_t v34 = *(void **)(a1 + 48);
  if (v6)
  {
    [v34 finishWithError:v6];
    goto LABEL_28;
  }
  uint64_t v22 = SSError(@"SSErrorDomain", 100, 0, 0);
  [v34 finishWithError:v22];
LABEL_14:

LABEL_28:
}

- (id)_updateAccountWithAuthKitViaSilentPasswordAuth:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [SSLazyPromise alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke;
  v13[3] = &unk_1E5BA9B88;
  objc_copyWeak(&v17, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v16 = self;
  int v11 = [(SSLazyPromise *)v8 initWithBlock:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke(id *a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (a1[4])
  {
    if ([(id)objc_opt_class() _allowSilentPasswordAuthForAccount:a1[4] withOptions:a1[5]])
    {
      id v6 = [a1[4] rawPassword];
      uint64_t v7 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      id v8 = (void *)v7;
      if (v6)
      {
        if (!v7)
        {
          id v8 = +[SSLogConfig sharedConfig];
        }
        int v9 = [v8 shouldLog];
        if ([v8 shouldLogToDisk]) {
          int v10 = v9 | 2;
        }
        else {
          int v10 = v9;
        }
        int v11 = [v8 OSLogObject];
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          v10 &= 2u;
        }
        if (v10)
        {
          [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
          int v70 = 138543362;
          id v71 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v62) = 12;
          int v12 = (void *)_os_log_send_and_compose_impl();

          if (v12)
          {
            int v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v70, v62);
            free(v12);
            SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
          }
        }
        else
        {
        }
        id v59 = a1[4];
        uint64_t v58 = a1 + 4;
        uint64_t v60 = [v58[2] _convertPasswordToPET:v6 forAccount:v59 options:v58[1]];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_354;
        v65[3] = &unk_1E5BA9C00;
        objc_copyWeak(&v69, v4);
        id v66 = *v58;
        id v67 = v58[1];
        id v61 = v3;
        id v68 = v61;
        [v60 addSuccessBlock:v65];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_2;
        v63[3] = &unk_1E5BA8720;
        id v64 = v61;
        [v60 addErrorBlock:v63];

        objc_destroyWeak(&v69);
      }
      else
      {
        if (!v7)
        {
          id v8 = +[SSLogConfig sharedConfig];
        }
        int v46 = [v8 shouldLog];
        if ([v8 shouldLogToDisk]) {
          int v47 = v46 | 2;
        }
        else {
          int v47 = v46;
        }
        uint64_t v48 = [v8 OSLogObject];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          int v49 = v47;
        }
        else {
          int v49 = v47 & 2;
        }
        if (v49)
        {
          [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
          int v70 = 138543362;
          id v71 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v62) = 12;
          uint64_t v50 = (void *)_os_log_send_and_compose_impl();

          if (v50)
          {
            int v51 = objc_msgSend(NSString, "stringWithCString:encoding:", v50, 4, &v70, v62);
            free(v50);
            SSFileLog(v8, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v51);
          }
        }
        else
        {
        }
        uint64_t v60 = SSError(@"SSErrorDomain", 139, 0, 0);
        [v3 finishWithError:v60];
      }
    }
    else
    {
      uint64_t v33 = +[SSLogConfig sharedAccountsAuthenticationConfig];
      if (!v33)
      {
        uint64_t v33 = +[SSLogConfig sharedConfig];
      }
      int v34 = [v33 shouldLog];
      if ([v33 shouldLogToDisk]) {
        int v35 = v34 | 2;
      }
      else {
        int v35 = v34;
      }
      int v36 = [v33 OSLogObject];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
        int v37 = v35;
      }
      else {
        int v37 = v35 & 2;
      }
      if (v37)
      {
        [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
        int v70 = 138543362;
        id v71 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(v62) = 12;
        __int16 v38 = (void *)_os_log_send_and_compose_impl();

        if (v38)
        {
          id v39 = objc_msgSend(NSString, "stringWithCString:encoding:", v38, 4, &v70, v62);
          free(v38);
          SSFileLog(v33, @"%@", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
        }
      }
      else
      {
      }
      id v6 = SSError(@"SSErrorDomain", 106, 0, @"Silent password authentication isn't allowed.");
      [v3 finishWithError:v6];
    }
  }
  else
  {
    uint64_t v20 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v20)
    {
      uint64_t v20 = +[SSLogConfig sharedConfig];
    }
    int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    int v23 = [v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      int v24 = v22;
    }
    else {
      int v24 = v22 & 2;
    }
    if (v24)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      int v70 = 138543362;
      id v71 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v62) = 12;
      int v25 = (void *)_os_log_send_and_compose_impl();

      if (v25)
      {
        int v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v70, v62);
        free(v25);
        SSFileLog(v20, @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
      }
    }
    else
    {
    }
    id v6 = SSError(@"SSErrorDomain", 100, 0, 0);
    [v3 finishWithError:v6];
  }
}

void __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_354(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [(id)objc_opt_class() _createUpdatedAccount:*(void *)(a1 + 32) withAuthenticationResults:v4 options:*(void *)(a1 + 40)];

  id v6 = [[SSUpdateAccountResponse alloc] initWithUpdatedAccount:v5 credentialSource:5];
  [*(id *)(a1 + 48) finishWithResult:v6];
}

void __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    SSError(@"SSErrorDomain", 100, 0, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithError:v4];
  }
}

- (id)_updateAccountWithAuthKitViaSilentPETAuth:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [SSLazyPromise alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__SSAccountStore__updateAccountWithAuthKitViaSilentPETAuth_options___block_invoke;
  v13[3] = &unk_1E5BA9BD8;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  int v11 = [(SSLazyPromise *)v8 initWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __68__SSAccountStore__updateAccountWithAuthKitViaSilentPETAuth_options___block_invoke(id *a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!a1[4])
  {
    uint64_t v33 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v33)
    {
      uint64_t v33 = +[SSLogConfig sharedConfig];
    }
    int v34 = [v33 shouldLog];
    if ([v33 shouldLogToDisk]) {
      int v35 = v34 | 2;
    }
    else {
      int v35 = v34;
    }
    int v36 = [v33 OSLogObject];
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO)) {
      v35 &= 2u;
    }
    if (v35)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      *(void *)((char *)&v102 + 4) = LODWORD(v102) = 138543362;
      LODWORD(v101) = 12;
      int v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_42:

        uint64_t v44 = 100;
LABEL_43:
        uint64_t v45 = 0;
LABEL_56:
        id v6 = SSError(@"SSErrorDomain", v44, 0, (uint64_t)v45);
        [v3 finishWithError:v6];
        goto LABEL_57;
      }
      int v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v102, v101);
      free(v37);
      SSFileLog(v33, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v36);
    }

    goto LABEL_42;
  }
  if (([(id)objc_opt_class() _allowSilentPasswordAuthForAccount:a1[4] withOptions:a1[5]] & 1) == 0)
  {
    int v46 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    if (!v46)
    {
      int v46 = +[SSLogConfig sharedConfig];
    }
    int v47 = [v46 shouldLog];
    if ([v46 shouldLogToDisk]) {
      int v48 = v47 | 2;
    }
    else {
      int v48 = v47;
    }
    int v49 = [v46 OSLogObject];
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      v48 &= 2u;
    }
    if (v48)
    {
      [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      *(void *)((char *)&v102 + 4) = LODWORD(v102) = 138543362;
      LODWORD(v101) = 12;
      uint64_t v50 = (void *)_os_log_send_and_compose_impl();

      if (!v50)
      {
LABEL_55:

        uint64_t v45 = @"Silent password authentication isn't allowed.";
        uint64_t v44 = 106;
        goto LABEL_56;
      }
      int v49 = objc_msgSend(NSString, "stringWithCString:encoding:", v50, 4, &v102, v101);
      free(v50);
      SSFileLog(v46, @"%@", v51, v52, v53, v54, v55, v56, (uint64_t)v49);
    }

    goto LABEL_55;
  }
  uint64_t v5 = [a1[4] passwordEquivalentToken];
  if (!v5)
  {
    uint64_t v57 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitPreventSecondaryAccountPETLookup"];
    int v58 = [v57 BOOLValue];

    uint64_t v59 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    uint64_t v60 = (void *)v59;
    if (v58)
    {
      if (!v59)
      {
        uint64_t v60 = +[SSLogConfig sharedConfig];
      }
      int v61 = [v60 shouldLog];
      if ([v60 shouldLogToDisk]) {
        int v62 = v61 | 2;
      }
      else {
        int v62 = v61;
      }
      id v63 = [v60 OSLogObject];
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
        v62 &= 2u;
      }
      if (!v62) {
        goto LABEL_103;
      }
      id v64 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      LODWORD(v102) = 138543362;
      *(void *)((char *)&v102 + 4) = v64;
      LODWORD(v101) = 12;
LABEL_101:
      uint64_t v93 = (void *)_os_log_send_and_compose_impl();

      if (!v93)
      {
LABEL_104:

        uint64_t v44 = 139;
        goto LABEL_43;
      }
      id v63 = objc_msgSend(NSString, "stringWithCString:encoding:", v93, 4, &v102, v101, v102);
      free(v93);
      SSFileLog(v60, @"%@", v94, v95, v96, v97, v98, v99, (uint64_t)v63);
LABEL_103:

      goto LABEL_104;
    }
    if (!v59)
    {
      uint64_t v60 = +[SSLogConfig sharedConfig];
    }
    int v65 = [v60 shouldLog];
    if ([v60 shouldLogToDisk]) {
      int v66 = v65 | 2;
    }
    else {
      int v66 = v65;
    }
    id v67 = [v60 OSLogObject];
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT)) {
      v66 &= 2u;
    }
    if (v66)
    {
      id v68 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      LODWORD(v102) = 138543362;
      *(void *)((char *)&v102 + 4) = v68;
      LODWORD(v101) = 12;
      char v100 = &v102;
      id v69 = (void *)_os_log_send_and_compose_impl();

      if (!v69) {
        goto LABEL_79;
      }
      id v67 = objc_msgSend(NSString, "stringWithCString:encoding:", v69, 4, &v102, v101);
      free(v69);
      SSFileLog(v60, @"%@", v70, v71, v72, v73, v74, v75, (uint64_t)v67);
    }

LABEL_79:
    uint64_t v76 = [a1[4] altDSID];
    __int16 v77 = [a1[4] uniqueIdentifier];
    id v78 = [a1[4] accountName];
    id v6 = [WeakRetained _passwordEquivalentTokenFromAlternateAccountWithAltDSID:v76 DSID:v77 username:v78];

    uint64_t v79 = +[SSLogConfig sharedAccountsAuthenticationConfig];
    uint64_t v60 = (void *)v79;
    if (!v6)
    {
      if (!v79)
      {
        uint64_t v60 = +[SSLogConfig sharedConfig];
      }
      int v91 = objc_msgSend(v60, "shouldLog", v100);
      if ([v60 shouldLogToDisk]) {
        int v92 = v91 | 2;
      }
      else {
        int v92 = v91;
      }
      id v63 = [v60 OSLogObject];
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
        v92 &= 2u;
      }
      if (!v92) {
        goto LABEL_103;
      }
      id v64 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      LODWORD(v102) = 138543362;
      *(void *)((char *)&v102 + 4) = v64;
      LODWORD(v101) = 12;
      goto LABEL_101;
    }
    if (!v79)
    {
      uint64_t v60 = +[SSLogConfig sharedConfig];
    }
    int v80 = objc_msgSend(v60, "shouldLog", v100);
    if ([v60 shouldLogToDisk]) {
      int v81 = v80 | 2;
    }
    else {
      int v81 = v80;
    }
    id v82 = [v60 OSLogObject];
    if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
      v81 &= 2u;
    }
    if (v81)
    {
      int v83 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
      LODWORD(v102) = 138543362;
      *(void *)((char *)&v102 + 4) = v83;
      LODWORD(v101) = 12;
      char v100 = &v102;
      int v84 = (void *)_os_log_send_and_compose_impl();

      if (!v84)
      {
LABEL_91:

        [a1[4] setPasswordEquivalentToken:v6];
        uint64_t v19 = 2;
        goto LABEL_16;
      }
      id v82 = objc_msgSend(NSString, "stringWithCString:encoding:", v84, 4, &v102, v101);
      free(v84);
      SSFileLog(v60, @"%@", v85, v86, v87, v88, v89, v90, (uint64_t)v82);
    }

    goto LABEL_91;
  }
  id v6 = (void *)v5;
  id v7 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v7)
  {
    id v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_14;
  }
  int v11 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  LODWORD(v102) = 138543362;
  *(void *)((char *)&v102 + 4) = v11;
  LODWORD(v101) = 12;
  char v100 = &v102;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v102, v101);
    free(v12);
    SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
LABEL_14:
  }
  uint64_t v19 = 4;
LABEL_16:
  if (!SSIsInternalBuild() || !NSStringIsNotPET(v6)) {
    goto LABEL_30;
  }
  uint64_t v20 = +[SSLogConfig sharedAccountsAuthenticationConfig];
  if (!v20)
  {
    uint64_t v20 = +[SSLogConfig sharedConfig];
  }
  int v21 = objc_msgSend(v20, "shouldLog", v100);
  if ([v20 shouldLogToDisk]) {
    int v22 = v21 | 2;
  }
  else {
    int v22 = v21;
  }
  int v23 = [v20 OSLogObject];
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    v22 &= 2u;
  }
  if (!v22) {
    goto LABEL_28;
  }
  int v24 = [a1[5] objectForKeyedSubscript:@"SSAccountStoreAuthKitLogUUIDKey"];
  LODWORD(v102) = 138543362;
  *(void *)((char *)&v102 + 4) = v24;
  LODWORD(v101) = 12;
  int v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    int v23 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v102, v101);
    free(v25);
    SSFileLog(v20, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_28:
  }
LABEL_30:
  uint64_t v32 = [[SSUpdateAccountResponse alloc] initWithUpdatedAccount:a1[4] credentialSource:v19];
  [v3 finishWithResult:v32];

LABEL_57:
}

- (id)addAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  if ([(SSAccountStore *)self saveAccount:v4 error:0])
  {
    uint64_t v5 = [(id)objc_opt_class() _refreshAccount:v4];
  }

  return v5;
}

- (BOOL)isExpiredForTokenType:(int64_t)a3
{
  id v4 = objc_opt_class();
  return [v4 isExpiredForTokenType:a3];
}

- (void)setAccountCredits:(id)a3 forAccountWithUniqueIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = [(SSAccountStore *)self accountWithUniqueIdentifier:a4];
  id v7 = v6;
  if (v6) {
    [v6 setCreditsString:v8];
  }
}

- (id)setActiveAccount:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    id v7 = +[SSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v42 = 138543362;
      id v43 = (id)objc_opt_class();
      id v11 = v43;
      LODWORD(v40) = 12;
      uint64_t v39 = &v42;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12) {
        goto LABEL_15;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v42, v40);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

LABEL_15:
    uint64_t v19 = [(SSAccountStore *)self activeAccount];
    uint64_t v20 = v19;
    if (!v19)
    {
LABEL_30:

      id v6 = 0;
      goto LABEL_31;
    }
    [v19 setActive:0];
    id v41 = 0;
    BOOL v21 = [(SSAccountStore *)self saveAccount:v20 verifyCredentials:0 error:&v41];
    id v22 = v41;
    if (v21)
    {
LABEL_29:

      goto LABEL_30;
    }
    int v23 = +[SSLogConfig sharedAccountsConfig];
    if (!v23)
    {
      int v23 = +[SSLogConfig sharedConfig];
    }
    int v24 = objc_msgSend(v23, "shouldLog", v39);
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    uint64_t v26 = [v23 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      v25 &= 2u;
    }
    if (v25)
    {
      uint64_t v27 = objc_opt_class();
      id v28 = v27;
      uint64_t v29 = [v20 accountName];
      uint64_t v30 = SSHashIfNeeded(v29);
      int v42 = 138543874;
      id v43 = v27;
      __int16 v44 = 2114;
      uint64_t v45 = v30;
      __int16 v46 = 2112;
      id v47 = v22;
      LODWORD(v40) = 32;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v42, v40);
      free(v31);
      SSFileLog(v23, @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v26);
    }

    goto LABEL_28;
  }
  [v4 setActive:1];
  id v6 = 0;
  if ([(SSAccountStore *)self saveAccount:v5 error:0])
  {
    id v6 = [(id)objc_opt_class() _refreshAccount:v5];
  }
LABEL_31:

  return v6;
}

- (id)setActiveLockerAccount:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    id v7 = +[SSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    id v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v42 = 138543362;
      id v43 = (id)objc_opt_class();
      id v11 = v43;
      LODWORD(v40) = 12;
      uint64_t v39 = &v42;
      int v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12) {
        goto LABEL_15;
      }
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v42, v40);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

LABEL_15:
    uint64_t v19 = [(SSAccountStore *)self activeLockerAccount];
    uint64_t v20 = v19;
    if (!v19)
    {
LABEL_30:

      id v6 = 0;
      goto LABEL_31;
    }
    [v19 setActiveLockerAccount:0];
    id v41 = 0;
    BOOL v21 = [(SSAccountStore *)self saveAccount:v20 verifyCredentials:0 error:&v41];
    id v22 = v41;
    if (v21)
    {
LABEL_29:

      goto LABEL_30;
    }
    int v23 = +[SSLogConfig sharedAccountsConfig];
    if (!v23)
    {
      int v23 = +[SSLogConfig sharedConfig];
    }
    int v24 = objc_msgSend(v23, "shouldLog", v39);
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    uint64_t v26 = [v23 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      v25 &= 2u;
    }
    if (v25)
    {
      uint64_t v27 = objc_opt_class();
      id v28 = v27;
      uint64_t v29 = [v20 accountName];
      uint64_t v30 = SSHashIfNeeded(v29);
      int v42 = 138543874;
      id v43 = v27;
      __int16 v44 = 2114;
      uint64_t v45 = v30;
      __int16 v46 = 2112;
      id v47 = v22;
      LODWORD(v40) = 32;
      uint64_t v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v42, v40);
      free(v31);
      SSFileLog(v23, @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v26);
    }

    goto LABEL_28;
  }
  [v4 setActiveLockerAccount:1];
  id v6 = 0;
  if ([(SSAccountStore *)self saveAccount:v5 error:0])
  {
    id v6 = [(id)objc_opt_class() _refreshAccount:v5];
  }
LABEL_31:

  return v6;
}

- (void)signOutAllAccounts
{
}

- (void)signOutAllAccountsWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(SSAccountStore *)self activeAccount];
  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__SSAccountStore_signOutAllAccountsWithCompletionBlock___block_invoke;
    v6[3] = &unk_1E5BA9C28;
    id v7 = v4;
    [(SSAccountStore *)self signOutAccount:v5 completion:v6];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __56__SSAccountStore_signOutAllAccountsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setAccountsCacheAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)fetchAccountsQueue
{
  return self->_fetchAccountsQueue;
}

- (void)setFetchAccountsQueue:(id)a3
{
}

- (void)setInProcessCacheDisabled:(BOOL)a3
{
  self->_inProcessCacheDisabled = a3;
}

- (void)setKeyValueStore:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_fetchAccountsQueue, 0);
  objc_storeStrong((id *)&self->_accountsCacheAccessQueue, 0);
  objc_storeStrong((id *)&self->_accountsCache, 0);
}

@end