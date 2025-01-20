@interface MFAccountStore
+ (BOOL)_shouldUpdateAccountsInPlace;
+ (id)_accountWithAccountClass:(Class)a3 persistentAccount:(id)a4 useExisting:(BOOL)a5;
+ (id)sharedAccountStore;
- (ACAccountStore)persistentStore;
- (MFAccountStore)init;
- (id)_accountWithPersistentAccount:(id)a3 useExisting:(BOOL)a4;
- (id)accountsWithTypeIdentifiers:(id)a3 error:(id *)a4;
- (id)existingAccountWithPersistentAccount:(id)a3;
- (id)newPersistentAccountWithAccountTypeIdentifier:(id)a3;
- (id)supportedDataclassesWithAccountTypeIdentifier:(id)a3;
- (void)_accountsStoreChanged:(id)a3;
- (void)dealloc;
- (void)removePersistentAccountWithAccount:(id)a3;
- (void)savePersistentAccountWithAccount:(id)a3;
- (void)setPersistentStore:(id)a3;
@end

@implementation MFAccountStore

+ (id)sharedAccountStore
{
  if (sharedAccountStore_onceToken != -1) {
    dispatch_once(&sharedAccountStore_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedAccountStore_sAccountStore;
  return v2;
}

- (id)accountsWithTypeIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  accountStore = self->_accountStore;
  v50[1] = 0;
  v40 = v5;
  -[ACAccountStore accountsWithAccountTypeIdentifiers:error:](accountStore, "accountsWithAccountTypeIdentifiers:error:");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v41 = 0;
  v7 = [v41 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F178F0]])
  {
    BOOL v8 = [v41 code] == 10002;

    if (!v8) {
      goto LABEL_7;
    }
    v9 = MFAccountsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v40 componentsJoinedByString:@", "];
      v11 = objc_msgSend(v41, "ef_publicDescription");
      *(_DWORD *)buf = 138543618;
      v57 = v10;
      __int16 v58 = 2114;
      v59 = v11;
      _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_DEFAULT, "Transient account store error; re-attempting to fetch accounts for types [%{public}@]: %{public}@",
        buf,
        0x16u);
    }
    v12 = self->_accountStore;
    v50[0] = v41;
    uint64_t v13 = [(ACAccountStore *)v12 accountsWithAccountTypeIdentifiers:v40 error:v50];
    id v14 = v50[0];

    v7 = obj;
    id obj = (id)v13;
    id v41 = v14;
  }

LABEL_7:
  if (v41)
  {
    v15 = MFAccountsLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v40 componentsJoinedByString:@", "];
      v17 = objc_msgSend(v41, "ef_publicDescription");
      [(MFAccountStore *)v16 accountsWithTypeIdentifiers:buf error:v15];
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obja = obj;
  v18 = 0;
  uint64_t v19 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v19)
  {
    char v20 = 0;
    uint64_t v45 = *(void *)v47;
    uint64_t v44 = *MEMORY[0x1E4F4BF38];
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v47 != v45) {
          objc_enumerationMutation(obja);
        }
        v22 = *(void **)(*((void *)&v46 + 1) + 8 * v21);
        v23 = -[MFAccountStore _accountWithPersistentAccount:useExisting:](self, "_accountWithPersistentAccount:useExisting:", v22, [(id)objc_opt_class() _shouldUpdateAccountsInPlace]);
        if (v23)
        {
          if (!v18)
          {
            v18 = [MEMORY[0x1E4F1CA48] array];
          }
          v24 = [v22 parentAccount];
          int v25 = objc_msgSend(v24, "aa_isAccountClass:", v44);

          if (v25)
          {
            if (v20)
            {
              v26 = MFAccountsLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v35 = [v22 identifier];
                v36 = [v22 parentAccount];
                v37 = [v36 identifier];
                *(_DWORD *)v51 = 138543618;
                v52 = v35;
                __int16 v53 = 2114;
                v54 = v37;
                _os_log_error_impl(&dword_1A7EFF000, v26, OS_LOG_TYPE_ERROR, "Duplicate Primary iCloud IMAPMail account %{public}@ found for parent iCloud account %{public}@", v51, 0x16u);
              }
            }
            else
            {
              v31 = MFAccountsLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = [v22 identifier];
                v33 = [v22 parentAccount];
                v34 = [v33 identifier];
                *(_DWORD *)v51 = 138543618;
                v52 = v32;
                __int16 v53 = 2114;
                v54 = v34;
                _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "Primary iCloud IMAPMail account %{public}@ found for parent iCloud account %{public}@", v51, 0x16u);
              }
              [v18 addObject:v23];
            }
            char v20 = 1;
          }
          else
          {
            v27 = MFAccountsLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = [v22 identifier];
              v29 = [v22 parentAccount];
              v30 = [v29 identifier];
              *(_DWORD *)v51 = 138543618;
              v52 = v28;
              __int16 v53 = 2114;
              v54 = v30;
              _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_DEFAULT, "Mail account %{public}@ found for parent account %{public}@", v51, 0x16u);
            }
            [v18 addObject:v23];
          }
        }

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v19);
  }

  if (a4) {
    *a4 = v41;
  }

  return v18;
}

- (id)_accountWithPersistentAccount:(id)a3 useExisting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v16 = 0;
    v6 = +[MFAccountLoader accountClassForPersistentAccount:v5 error:&v16];
    id v7 = v16;
    if (v6)
    {
      BOOL v8 = [(id)objc_opt_class() _accountWithAccountClass:v6 persistentAccount:v5 useExisting:v4];
    }
    else
    {
      v9 = MFAccountsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = [v5 identifier];
        uint64_t v12 = objc_msgSend(v7, "ef_publicDescription");
        uint64_t v13 = (void *)v12;
        id v14 = ": ";
        if (!v7) {
          id v14 = "";
        }
        v15 = &stru_1EFF11268;
        *(_DWORD *)buf = 138543874;
        v18 = v11;
        if (v12) {
          v15 = (__CFString *)v12;
        }
        __int16 v19 = 2080;
        char v20 = v14;
        __int16 v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_ERROR, "Failed to load account for persistent account \"%{public}@\"%s%{public}@", buf, 0x20u);
      }
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_accountWithAccountClass:(Class)a3 persistentAccount:(id)a4 useExisting:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  BOOL v8 = v7;
  if (v5
    && ([v7 identifier],
        v9 = objc_claimAutoreleasedReturnValue(),
        [(objc_class *)a3 existingAccountForUniqueID:v9],
        v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    if ((Class)objc_opt_class() == a3) {
      [v10 setPersistentAccount:v8];
    }
  }
  else
  {
    v10 = (void *)[[a3 alloc] initWithPersistentAccount:v8];
  }

  return v10;
}

+ (BOOL)_shouldUpdateAccountsInPlace
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"MFUpdateAccountsInPlaceKey"];

  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = [v3 BOOLValue];
    }
    else {
      char v4 = 0;
    }
  }
  else
  {
    BOOL v5 = MFUserAgent();
    char v4 = [v5 isMobileMail];
  }
  return v4;
}

void __36__MFAccountStore_sharedAccountStore__block_invoke()
{
  v0 = objc_alloc_init(MFAccountStore);
  v1 = (void *)sharedAccountStore_sAccountStore;
  sharedAccountStore_sAccountStore = (uint64_t)v0;
}

- (MFAccountStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFAccountStore;
  v2 = [(MFAccountStore *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accountStoreLock._os_unfair_lock_opaque = 0;
    char v4 = [MEMORY[0x1E4F179C8] defaultStore];
    [(MFAccountStore *)v3 setPersistentStore:v4];

    BOOL v5 = v3;
  }

  return v3;
}

- (void)setPersistentStore:(id)a3
{
  v9 = (ACAccountStore *)a3;
  os_unfair_lock_lock(&self->_accountStoreLock);
  accountStore = self->_accountStore;
  if (accountStore != v9)
  {
    v6 = (void *)MEMORY[0x1E4F17728];
    if (accountStore)
    {
      objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:self name:*v6 object:self->_accountStore];
    }
    objc_storeStrong((id *)&self->_accountStore, a3);
    if (v9)
    {
      BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__accountsStoreChanged_ name:*v6 object:v9];
    }
  }
  os_unfair_lock_unlock(&self->_accountStoreLock);
}

- (id)supportedDataclassesWithAccountTypeIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    char v4 = [MEMORY[0x1E4F179C8] defaultStore];
    BOOL v5 = [v4 accountTypeWithAccountTypeIdentifier:v3];

    v6 = [v5 supportedDataclasses];
    objc_super v7 = [v6 allObjects];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)newPersistentAccountWithAccountTypeIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(ACAccountStore *)self->_accountStore accountTypeWithAccountTypeIdentifier:v4];
    if (v5)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v5];
    }
    else
    {
      objc_super v7 = MFAccountsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[MFAccountStore newPersistentAccountWithAccountTypeIdentifier:]((uint64_t)v4, v7);
      }

      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  [(MFAccountStore *)self setPersistentStore:0];
  v3.receiver = self;
  v3.super_class = (Class)MFAccountStore;
  [(MFAccountStore *)&v3 dealloc];
}

- (ACAccountStore)persistentStore
{
  p_accountStoreLock = &self->_accountStoreLock;
  os_unfair_lock_lock(&self->_accountStoreLock);
  id v4 = self->_accountStore;
  os_unfair_lock_unlock(p_accountStoreLock);
  return v4;
}

- (id)existingAccountWithPersistentAccount:(id)a3
{
  objc_super v3 = [(MFAccountStore *)self _accountWithPersistentAccount:a3 useExisting:1];
  return v3;
}

- (void)savePersistentAccountWithAccount:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 persistentAccount];
  v6 = v5;
  if (v5)
  {
    objc_super v7 = [v5 accountDescription];
    BOOL v8 = [v6 identifier];
    v9 = [v6 accountType];
    v10 = [v9 identifier];
    if ([v10 isEqualToString:*MEMORY[0x1E4F177E8]])
    {
      v11 = [v6 username];
      uint64_t v12 = [v11 dataUsingEncoding:1];

      if (!v12)
      {
        uint64_t v13 = MFAccountsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v7;
          __int16 v24 = 2114;
          int v25 = v8;
          _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "\"%@\" has Non-ASCII username - Disabling Notes for account (%{public}@)", buf, 0x16u);
        }

        uint64_t v14 = *MEMORY[0x1E4F17B00];
        [v6 setProvisioned:0 forDataclass:*MEMORY[0x1E4F17B00]];
        [v6 setEnabled:0 forDataclass:v14];
      }
    }
    else
    {
    }
    if ([v6 isDirty])
    {
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      accountStore = self->_accountStore;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke;
      v18[3] = &unk_1E5D3DA78;
      id v19 = v7;
      id v20 = v8;
      dispatch_semaphore_t v21 = v15;
      v17 = v15;
      [(ACAccountStore *)accountStore saveVerifiedAccount:v6 withCompletionHandler:v18];
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      v17 = MFAccountsLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v7;
        __int16 v24 = 2114;
        int v25 = v8;
        _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "Nothing to save for account \"%@\" (%{public}@)", buf, 0x16u);
      }
    }
  }
}

void __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = MFAccountsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Saved account \"%@\" (%{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v6 = MFAccountsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      v11 = objc_msgSend(v5, "ef_publicDescription");
      int v12 = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_ERROR, "Failed to save account \"%@\" (%@) error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removePersistentAccountWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 persistentAccount];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 accountDescription];
    uint64_t v8 = [v6 identifier];
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    accountStore = self->_accountStore;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke;
    v14[3] = &unk_1E5D3DA78;
    id v11 = v7;
    id v15 = v11;
    id v16 = v8;
    dispatch_semaphore_t v17 = v9;
    int v12 = v9;
    id v13 = v8;
    [(ACAccountStore *)accountStore removeAccount:v6 withCompletionHandler:v14];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = MFAccountsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_DEFAULT, "Removed account \"%@\" (%{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v6 = MFAccountsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v11 = objc_msgSend(v5, "ef_publicDescription");
      int v12 = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      dispatch_semaphore_t v17 = v11;
      _os_log_error_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_ERROR, "Failed to remove account \"%@\" (%{public}@) error: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_accountsStoreChanged:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MFAccountsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 name];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_INFO, "Received %@ notification", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
}

- (void)newPersistentAccountWithAccountTypeIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Missing account type for identifier %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)accountsWithTypeIdentifiers:(uint8_t *)buf error:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to fetch accounts for types [%{public}@]: %{public}@", buf, 0x16u);
}

@end