@interface NMBUIAccountUtil
+ (id)sharedInstance;
- (ACAccount)idmsAccount;
- (ACAccount)itunesAccount;
- (ACAccountStore)accountStore;
- (BOOL)_doesAccount:(id)a3 matchAccount:(id)a4;
- (BOOL)_doesAccount:(id)a3 matchAccountDict:(id)a4;
- (BOOL)_doesAccountWithAltDSID:(id)a3 DSID:(id)a4 username:(id)a5 matchAccountWithAltDSID:(id)a6 DSID:(id)a7 username:(id)a8;
- (BOOL)hasITunesAccount;
- (NMBUIAccountUtil)init;
- (NSSManager)nssManager;
- (OS_dispatch_queue)workQueue;
- (id)_idmsAccountForCurrentAccount;
- (id)_itunesAccountNoAuth;
- (id)_signInOptions;
- (void)_attemptSignIn;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)_sendITunesAccountToGizmoIfNecessary;
- (void)_signGizmoIntoITunesAccount;
- (void)dealloc;
- (void)sendITunesAccountToGizmoIfNecessary;
- (void)setAccountStore:(id)a3;
- (void)setIdmsAccount:(id)a3;
- (void)setItunesAccount:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation NMBUIAccountUtil

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __34__NMBUIAccountUtil_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (NMBUIAccountUtil)init
{
  v5.receiver = self;
  v5.super_class = (Class)NMBUIAccountUtil;
  v2 = [(NMBUIAccountUtil *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleAccountStoreDidChangeNotification_ name:*MEMORY[0x263EFB060] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NMBUIAccountUtil;
  [(NMBUIAccountUtil *)&v4 dealloc];
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  objc_super v4 = [(NMBUIAccountUtil *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke;
  block[3] = &unk_264DA3AD8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ic_sharedAccountStore");
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke_2;
  v3[3] = &unk_264DA3AB0;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(v2, "ic_activeStoreAccountWithCompletion:", v3);
}

void __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke_3;
  v6[3] = &unk_264DA3A88;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke_3(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "ic_DSID");
  uint64_t v3 = [v2 unsignedLongLongValue];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_super v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "ic_DSID");
  uint64_t v5 = [v4 unsignedLongLongValue];

  if (v5 != v3)
  {
    v6 = MEMORY[0x263EF83A0];
    dispatch_async(v6, &__block_literal_global_27);
  }
}

void __61__NMBUIAccountUtil__handleAccountStoreDidChangeNotification___block_invoke_4()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"NMBUIITunesAccountDidChangeNotification" object:0];
}

- (void)sendITunesAccountToGizmoIfNecessary
{
  uint64_t v3 = [(NMBUIAccountUtil *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NMBUIAccountUtil_sendITunesAccountToGizmoIfNecessary__block_invoke;
  block[3] = &unk_264DA3AD8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__NMBUIAccountUtil_sendITunesAccountToGizmoIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendITunesAccountToGizmoIfNecessary];
}

- (BOOL)hasITunesAccount
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(NMBUIAccountUtil *)self workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__NMBUIAccountUtil_hasITunesAccount__block_invoke;
  v5[3] = &unk_264DA3B00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __36__NMBUIAccountUtil_hasITunesAccount__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itunesAccount];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (OS_dispatch_queue)workQueue
{
  workQueue = self->_workQueue;
  if (!workQueue)
  {
    objc_super v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.NanoMusic.NMBUIAccountUtil", 0);
    uint64_t v5 = self->_workQueue;
    self->_workQueue = v4;

    workQueue = self->_workQueue;
  }
  return workQueue;
}

- (NSSManager)nssManager
{
  nssManager = self->_nssManager;
  if (!nssManager)
  {
    id v4 = objc_alloc(MEMORY[0x263F57790]);
    uint64_t v5 = [(NMBUIAccountUtil *)self workQueue];
    uint64_t v6 = (NSSManager *)[v4 initWithQueue:v5];
    id v7 = self->_nssManager;
    self->_nssManager = v6;

    nssManager = self->_nssManager;
  }
  return nssManager;
}

- (ACAccountStore)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x263EFB210], "ic_sharedAccountStore");
    id v4 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (ACAccount)itunesAccount
{
  itunesAccount = self->_itunesAccount;
  if (!itunesAccount)
  {
    id v4 = [(NMBUIAccountUtil *)self accountStore];
    objc_msgSend(v4, "ic_activeStoreAccount");
    uint64_t v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_itunesAccount;
    self->_itunesAccount = v5;

    itunesAccount = self->_itunesAccount;
  }
  return itunesAccount;
}

- (ACAccount)idmsAccount
{
  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    id v4 = [(NMBUIAccountUtil *)self _idmsAccountForCurrentAccount];
    uint64_t v5 = self->_idmsAccount;
    self->_idmsAccount = v4;

    idmsAccount = self->_idmsAccount;
  }
  return idmsAccount;
}

- (void)_sendITunesAccountToGizmoIfNecessary
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2397B1000, log, OS_LOG_TYPE_ERROR, "[Accounts Sync] There is no iTunes account available on companion", v1, 2u);
}

void __56__NMBUIAccountUtil__sendITunesAccountToGizmoIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__NMBUIAccountUtil__sendITunesAccountToGizmoIfNecessary__block_invoke_cold_1();
    }
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v8 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v8);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v8);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v5;
    v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F577B8]];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      uint64_t v14 = *MEMORY[0x263F577A8];
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [v7 itunesAccount];
          if ([v7 _doesAccount:v17 matchAccountDict:v16])
          {
            v18 = [v16 objectForKeyedSubscript:v14];
            char v19 = [v18 BOOLValue];

            if (v19)
            {

              v20 = NMLogForCategory(5);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2397B1000, v20, OS_LOG_TYPE_DEFAULT, "[Accounts Sync] Gizmo already has matching iTunes account", buf, 2u);
              }

              goto LABEL_20;
            }
          }
          else
          {
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    [v7 _signGizmoIntoITunesAccount];
LABEL_20:
    id v5 = v22;
    goto LABEL_21;
  }
LABEL_22:
}

- (id)_idmsAccountForCurrentAccount
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NMBUIAccountUtil *)self itunesAccount];

  if (v3)
  {
    id v4 = [(NMBUIAccountUtil *)self accountStore];
    id v5 = [v4 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAF00]];

    if (v5)
    {
      id v6 = [(NMBUIAccountUtil *)self accountStore];
      id v7 = [v6 accountsWithAccountType:v5];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v14 = [(NMBUIAccountUtil *)self itunesAccount];
            BOOL v15 = [(NMBUIAccountUtil *)self _doesAccount:v14 matchAccount:v13];

            if (v15)
            {
              id v16 = v13;
              goto LABEL_14;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      id v16 = 0;
LABEL_14:
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  return v16;
}

- (id)_signInOptions
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [MEMORY[0x263F291C0] currentDevice];
  id v4 = [v3 serverFriendlyDescription];

  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F25BB0]];
  }
  id v5 = [MEMORY[0x263F291C0] currentDevice];
  id v6 = [v5 uniqueDeviceIdentifier];

  if (v6) {
    [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x263F25BB8]];
  }

  return v2;
}

- (id)_itunesAccountNoAuth
{
  v2 = [(NMBUIAccountUtil *)self itunesAccount];
  uint64_t v3 = (void *)[v2 copy];

  [v3 setCredential:0];
  [v3 setAuthenticated:0];
  return v3;
}

- (void)_attemptSignIn
{
  id v5 = [(NMBUIAccountUtil *)self accountStore];
  uint64_t v3 = [(NMBUIAccountUtil *)self _itunesAccountNoAuth];
  id v4 = [(NMBUIAccountUtil *)self _signInOptions];
  [v5 saveAccount:v3 toPairedDeviceWithOptions:v4 completion:&__block_literal_global_36];
}

void __34__NMBUIAccountUtil__attemptSignIn__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = NMLogForCategory(5);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_2397B1000, v6, OS_LOG_TYPE_DEFAULT, "[Accounts Sync] Sign in SUCCEEDED", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __34__NMBUIAccountUtil__attemptSignIn__block_invoke_cold_1();
  }
}

- (void)_signGizmoIntoITunesAccount
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2397B1000, v0, v1, "[Accounts Sync] IDMS account has no credentials - %@", v2, v3, v4, v5, v6);
}

void __47__NMBUIAccountUtil__signGizmoIntoITunesAccount__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = NMLogForCategory(5);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        [WeakRetained _attemptSignIn];
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      id v8 = "[Accounts Sync] Pushing IDMS account SUCCEEDED. Attempting sign in.";
      uint64_t v9 = buf;
LABEL_5:
      _os_log_impl(&dword_2397B1000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_6;
    }
    if (v5)
    {
      uint64_t v10 = [v5 domain];
      if ([v10 isEqualToString:*MEMORY[0x263EFB070]])
      {
        uint64_t v11 = [v5 code];

        if (v11 == 5)
        {
          id v7 = NMLogForCategory(5);
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_6;
          }
          __int16 v13 = 0;
          id v8 = "[Accounts Sync] IDMS account already present on gizmo. Attempting sign in.";
          uint64_t v9 = (uint8_t *)&v13;
          goto LABEL_5;
        }
      }
      else
      {
      }
    }
    uint64_t v12 = NMLogForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __47__NMBUIAccountUtil__signGizmoIntoITunesAccount__block_invoke_cold_1();
    }
  }
LABEL_16:
}

- (BOOL)_doesAccountWithAltDSID:(id)a3 DSID:(id)a4 username:(id)a5 matchAccountWithAltDSID:(id)a6 DSID:(id)a7 username:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  long long v19 = v18;
  if (v13 && v16)
  {
    long long v20 = v13;
    id v21 = v16;
LABEL_10:
    char v22 = [v20 isEqualToString:v21];
    goto LABEL_11;
  }
  if (v14 && v17)
  {
    char v22 = [v14 isEqualToNumber:v17];
LABEL_11:
    BOOL v23 = v22;
    goto LABEL_12;
  }
  BOOL v23 = 0;
  if (v15 && v18)
  {
    long long v20 = v15;
    id v21 = v19;
    goto LABEL_10;
  }
LABEL_12:

  return v23;
}

- (BOOL)_doesAccount:(id)a3 matchAccountDict:(id)a4
{
  uint8_t v6 = (void *)MEMORY[0x263F290F0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 sharedInstance];
  uint64_t v10 = [v9 altDSIDForAccount:v8];

  uint64_t v11 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v12 = [v11 DSIDForAccount:v8];

  id v13 = [v8 username];

  id v14 = [v7 objectForKeyedSubscript:*MEMORY[0x263F57798]];
  id v15 = [v7 objectForKeyedSubscript:*MEMORY[0x263F577A0]];
  id v16 = [v7 objectForKeyedSubscript:*MEMORY[0x263F577B0]];

  LOBYTE(self) = [(NMBUIAccountUtil *)self _doesAccountWithAltDSID:v10 DSID:v12 username:v13 matchAccountWithAltDSID:v14 DSID:v15 username:v16];
  return (char)self;
}

- (BOOL)_doesAccount:(id)a3 matchAccount:(id)a4
{
  uint8_t v6 = (void *)MEMORY[0x263F290F0];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 sharedInstance];
  uint64_t v10 = [v9 altDSIDForAccount:v8];

  uint64_t v11 = [MEMORY[0x263F290F0] sharedInstance];
  uint64_t v12 = [v11 DSIDForAccount:v8];

  id v13 = [v8 username];

  id v14 = [MEMORY[0x263F290F0] sharedInstance];
  id v15 = [v14 altDSIDForAccount:v7];

  id v16 = [MEMORY[0x263F290F0] sharedInstance];
  id v17 = [v16 DSIDForAccount:v7];

  id v18 = [v7 username];

  LOBYTE(self) = [(NMBUIAccountUtil *)self _doesAccountWithAltDSID:v10 DSID:v12 username:v13 matchAccountWithAltDSID:v15 DSID:v17 username:v18];
  return (char)self;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setNssManager:(id)a3
{
}

- (void)setAccountStore:(id)a3
{
}

- (void)setItunesAccount:(id)a3
{
}

- (void)setIdmsAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_itunesAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __56__NMBUIAccountUtil__sendITunesAccountToGizmoIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2397B1000, v0, v1, "[Accounts Sync] Error fetching gizmo accounts info <%@>", v2, v3, v4, v5, v6);
}

void __34__NMBUIAccountUtil__attemptSignIn__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2397B1000, v0, v1, "[Accounts Sync] Sign in FAILED with error %@", v2, v3, v4, v5, v6);
}

void __47__NMBUIAccountUtil__signGizmoIntoITunesAccount__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2397B1000, v0, v1, "[Accounts Sync] Pushing IDMS account FAILED with error %@", v2, v3, v4, v5, v6);
}

@end