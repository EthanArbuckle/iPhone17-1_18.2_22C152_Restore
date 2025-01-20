@interface ICMonitoredAccountStore
+ (ICMonitoredAccountStore)sharedAccountStore;
- (BOOL)saveAccount:(id)a3 error:(id *)a4;
- (ICMonitoredAccountStore)init;
- (id)_registerAndLoadAccountsIfNecessary;
- (id)acAccountStore;
- (id)activeStoreAccountWithError:(id *)a3;
- (id)allStoreAccountsWithError:(id *)a3;
- (id)localStoreAccountWithError:(id *)a3;
- (id)primaryAppleAccountWithError:(id *)a3;
- (id)storeAccountForAltDSID:(id)a3 error:(id *)a4;
- (id)storeAccountForDSID:(id)a3 error:(id *)a4;
- (id)storeAccountForHomeUserIdentifier:(id)a3 error:(id *)a4;
- (id)storeAccountTypeWithError:(id *)a3;
- (id)storeAccountWithIdentifier:(id)a3 error:(id *)a4;
- (void)accountCredentialChanged:(id)a3;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)registerObserver:(id)a3;
@end

@implementation ICMonitoredAccountStore

uint64_t __55__ICMonitoredAccountStore_activeStoreAccountWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

id __31__ICMonitoredAccountStore_init__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) _registerAndLoadAccountsIfNecessary];
}

uint64_t __54__ICMonitoredAccountStore_localStoreAccountWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_isLocalAccount");
}

uint64_t __56__ICMonitoredAccountStore_primaryAppleAccountWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]);
}

- (id)allStoreAccountsWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [(ICMonitoredAccountStore *)self _registerAndLoadAccountsIfNecessary];
  if (v5)
  {
    v6 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v8 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v14, "ic_isITunesAccount", (void)v15)) {
          [v6 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  if (a3) {
LABEL_3:
  }
    *a3 = v5;
LABEL_4:

  return v6;
}

- (id)_registerAndLoadAccountsIfNecessary
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F179C8], "ic_canAccessAccountStore") & 1) == 0)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7013, @"Client is not entitled to access account store");
    goto LABEL_43;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accountStore = self->_accountStore;
  if (accountStore)
  {
    v5 = 0;
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA80] setWithObject:*MEMORY[0x1E4F17890]];
    if (objc_msgSend(MEMORY[0x1E4F179C8], "ic_canAccessAppleAccounts")) {
      [v6 addObject:*MEMORY[0x1E4F17750]];
    }
    v7 = (ACMonitoredAccountStore *)[objc_alloc(MEMORY[0x1E4F179E8]) initWithAccountTypes:v6 delegate:self];
    v8 = self->_accountStore;
    self->_accountStore = v7;

    if (self->_accountStore)
    {
      v5 = 0;
    }
    else
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = self;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create insance of account store", buf, 0xCu);
      }

      v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7407, @"Failed to create insance of account store");
    }

    accountStore = self->_accountStore;
    if (!accountStore) {
      goto LABEL_38;
    }
  }
  id obj = [(ACMonitoredAccountStore *)accountStore monitoredAccounts];
  if ([obj count]) {
    goto LABEL_37;
  }
  uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = self;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering for account monitoring", buf, 0xCu);
  }

  uint64_t v11 = self->_accountStore;
  id v37 = v5;
  [(ACMonitoredAccountStore *)v11 registerSynchronouslyWithError:&v37];
  id v12 = v37;

  if (v12)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7407, v12, @"Failed to register with account store");
    goto LABEL_36;
  }
  v29 = self;
  v30 = &self->_lock;
  v13 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (!v14)
  {
    v31 = 0;
    goto LABEL_33;
  }
  uint64_t v15 = v14;
  v31 = 0;
  uint64_t v16 = *(void *)v34;
  uint64_t v17 = *MEMORY[0x1E4F17750];
  uint64_t v18 = *MEMORY[0x1E4F4BF38];
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v34 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      if (objc_msgSend(v20, "ic_isITunesAccount"))
      {
        v21 = objc_msgSend(v20, "ic_description");
        [v12 addObject:v21];
LABEL_28:

        continue;
      }
      v22 = [v20 accountType];
      v23 = [v22 identifier];
      int v24 = [v23 isEqualToString:v17];

      if (v24 && objc_msgSend(v20, "aa_isAccountClass:", v18))
      {
        objc_msgSend(v20, "ic_description");
        v31 = v21 = v31;
        goto LABEL_28;
      }
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
  }
  while (v15);
LABEL_33:

  v25 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  self = v29;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [v12 count];
    *(_DWORD *)buf = 138544130;
    v39 = v29;
    __int16 v40 = 2048;
    uint64_t v41 = v26;
    __int16 v42 = 2114;
    id v43 = v12;
    __int16 v44 = 2114;
    v45 = v31;
    _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Initially loaded %lu iTunes accounts %{public}@. primaryICloudAccount = %{public}@", buf, 0x2Au);
  }

  v5 = 0;
  p_lock = v30;
LABEL_36:

LABEL_37:
LABEL_38:
  if (v5)
  {
    v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      __int16 v40 = 2114;
      uint64_t v41 = (uint64_t)v5;
      _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Failed to register for account monitoring. err=%{public}@", buf, 0x16u);
    }
  }
  os_unfair_lock_unlock(p_lock);
LABEL_43:

  return v5;
}

uint64_t __44__ICMonitoredAccountStore_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (id)primaryAppleAccountWithError:(id *)a3
{
  v5 = [(ICMonitoredAccountStore *)self _registerAndLoadAccountsIfNecessary];
  if (v5)
  {
    v6 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v8 = [(ACMonitoredAccountStore *)self->_accountStore monitoredAccounts];
  v6 = objc_msgSend(v8, "msv_firstWhere:", &__block_literal_global_10);

  if (a3) {
LABEL_3:
  }
    *a3 = v5;
LABEL_4:

  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICMonitoredAccountStore_registerObserver___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)storeAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  v7 = [(ICMonitoredAccountStore *)self allStoreAccountsWithError:&v13];
  id v8 = v13;
  id v9 = 0;
  if (v8)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__ICMonitoredAccountStore_storeAccountWithIdentifier_error___block_invoke;
  v11[3] = &unk_1E5AC6EE0;
  id v12 = v6;
  id v9 = objc_msgSend(v7, "msv_firstWhere:", v11);

  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v9;
}

+ (ICMonitoredAccountStore)sharedAccountStore
{
  if (sharedAccountStore_sOnceToken != -1) {
    dispatch_once(&sharedAccountStore_sOnceToken, &__block_literal_global_2372);
  }
  v2 = (void *)sharedAccountStore_sSharedAccountStore;

  return (ICMonitoredAccountStore *)v2;
}

- (id)localStoreAccountWithError:(id *)a3
{
  id v8 = 0;
  id v4 = [(ICMonitoredAccountStore *)self allStoreAccountsWithError:&v8];
  id v5 = v8;
  id v6 = 0;
  if (v5)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v6 = objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_8_2363);
  if (a3) {
LABEL_3:
  }
    *a3 = v5;
LABEL_4:

  return v6;
}

uint64_t __53__ICMonitoredAccountStore_storeAccountForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "ic_DSID");
  id v4 = v3;
  if (v3 == *(void **)(a1 + 32)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = objc_msgSend(v3, "isEqual:");
  }

  return v5;
}

- (id)storeAccountForDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  v7 = [(ICMonitoredAccountStore *)self allStoreAccountsWithError:&v13];
  id v8 = v13;
  id v9 = 0;
  if (v8)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__ICMonitoredAccountStore_storeAccountForDSID_error___block_invoke;
  v11[3] = &unk_1E5AC6EE0;
  id v12 = v6;
  id v9 = objc_msgSend(v7, "msv_firstWhere:", v11);

  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v9;
}

- (id)activeStoreAccountWithError:(id *)a3
{
  id v8 = 0;
  id v4 = [(ICMonitoredAccountStore *)self allStoreAccountsWithError:&v8];
  id v5 = v8;
  id v6 = 0;
  if (v5)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v6 = objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_6);
  if (a3) {
LABEL_3:
  }
    *a3 = v5;
LABEL_4:

  return v6;
}

uint64_t __45__ICMonitoredAccountStore_sharedAccountStore__block_invoke()
{
  sharedAccountStore_sSharedAccountStore = objc_alloc_init(ICMonitoredAccountStore);

  return MEMORY[0x1F41817F8]();
}

- (ICMonitoredAccountStore)init
{
  v12.receiver = self;
  v12.super_class = (Class)ICMonitoredAccountStore;
  v2 = [(ICMonitoredAccountStore *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.iTunesCloud.ICMonitoredAccountStore.observerCallbackQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v8 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__ICMonitoredAccountStore_init__block_invoke;
    block[3] = &unk_1E5ACD750;
    uint64_t v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

uint64_t __60__ICMonitoredAccountStore_storeAccountWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  if (v2 == v3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v2 isEqual:v3];
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStoreAccountType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)accountCredentialChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__ICMonitoredAccountStore_accountCredentialChanged___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__ICMonitoredAccountStore_accountCredentialChanged___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_description");
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for credentials update for account: %{public}@", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "monitoredAccountStore:didChangeCredentialsForAccount:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)accountWasRemoved:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ICMonitoredAccountStore_accountWasRemoved___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__ICMonitoredAccountStore_accountWasRemoved___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_description");
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for removed account: %{public}@", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "monitoredAccountStore:didRemoveAccount:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)accountWasModified:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ICMonitoredAccountStore_accountWasModified___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__ICMonitoredAccountStore_accountWasModified___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_description");
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for updated account: %{public}@", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "monitoredAccountStore:didUpdateAccount:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)accountWasAdded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__ICMonitoredAccountStore_accountWasAdded___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __43__ICMonitoredAccountStore_accountWasAdded___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_msgSend(*(id *)(a1 + 40), "ic_description");
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for added account: %{public}@", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "monitoredAccountStore:didAddAccount:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ICMonitoredAccountStore *)self _registerAndLoadAccountsIfNecessary];
  if (!v7)
  {
    accountStore = self->_accountStore;
    id v10 = 0;
    [(ACMonitoredAccountStore *)accountStore saveVerifiedAccount:v6 error:&v10];
    id v7 = v10;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    *a4 = v7;
LABEL_4:

  return v7 == 0;
}

- (id)storeAccountTypeWithError:(id *)a3
{
  if (!self->_cachedStoreAccountType)
  {
    accountStore = self->_accountStore;
    id v11 = 0;
    uint64_t v9 = [(ACMonitoredAccountStore *)accountStore ic_storeAccountTypeWithError:&v11];
    id v5 = v11;
    cachedStoreAccountType = self->_cachedStoreAccountType;
    self->_cachedStoreAccountType = v9;

    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v5 = 0;
  if (a3) {
LABEL_3:
  }
    *a3 = v5;
LABEL_4:
  id v6 = self->_cachedStoreAccountType;

  return v6;
}

- (id)storeAccountForHomeUserIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  id v7 = [(ICMonitoredAccountStore *)self allStoreAccountsWithError:&v13];
  id v8 = v13;
  uint64_t v9 = 0;
  if (v8)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__ICMonitoredAccountStore_storeAccountForHomeUserIdentifier_error___block_invoke;
  v11[3] = &unk_1E5AC6EE0;
  id v12 = v6;
  uint64_t v9 = objc_msgSend(v7, "msv_firstWhere:", v11);

  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v9;
}

uint64_t __67__ICMonitoredAccountStore_storeAccountForHomeUserIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "ic_homeUserIdentifiers");
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 containsObject:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)storeAccountForAltDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  id v7 = [(ICMonitoredAccountStore *)self allStoreAccountsWithError:&v13];
  id v8 = v13;
  uint64_t v9 = 0;
  if (v8)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__ICMonitoredAccountStore_storeAccountForAltDSID_error___block_invoke;
  v11[3] = &unk_1E5AC6EE0;
  id v12 = v6;
  uint64_t v9 = objc_msgSend(v7, "msv_firstWhere:", v11);

  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v9;
}

uint64_t __56__ICMonitoredAccountStore_storeAccountForAltDSID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "ic_altDSID");
  id v4 = v3;
  if (v3 == *(void **)(a1 + 32)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = objc_msgSend(v3, "isEqual:");
  }

  return v5;
}

- (id)acAccountStore
{
  id v3 = [(ICMonitoredAccountStore *)self _registerAndLoadAccountsIfNecessary];
  accountStore = self->_accountStore;

  return accountStore;
}

@end