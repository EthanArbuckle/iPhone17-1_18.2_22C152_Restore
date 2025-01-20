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

- (id)accountsWithTypeIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  v7 = (void *)[(ACAccountStore *)self->_accountStore accountsWithAccountTypeIdentifiers:a3 error:&v21];
  if (v21)
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MFAccountStore accountsWithTypeIdentifiers:error:](a3, &v21, v8);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (!v9)
  {
    v11 = 0;
    if (!a4) {
      return v11;
    }
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  v11 = 0;
  uint64_t v12 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = -[MFAccountStore _accountWithPersistentAccount:useExisting:](self, "_accountWithPersistentAccount:useExisting:", *(void *)(*((void *)&v17 + 1) + 8 * i), [(id)objc_opt_class() _shouldUpdateAccountsInPlace]);
      if (v14)
      {
        id v15 = v14;
        if (!v11) {
          v11 = (void *)[MEMORY[0x1E4F1CA48] array];
        }
        [v11 addObject:v15];
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  }
  while (v10);
  if (a4) {
LABEL_16:
  }
    *a4 = v21;
  return v11;
}

- (id)_accountWithPersistentAccount:(id)a3 useExisting:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id v9 = 0;
  v6 = +[MFAccountLoader accountClassForPersistentAccount:a3 error:&v9];
  if (v6) {
    return (id)[(id)objc_opt_class() _accountWithAccountClass:v6 persistentAccount:a3 useExisting:v4];
  }
  v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MFAccountStore _accountWithPersistentAccount:useExisting:](a3, &v9);
  }
  return 0;
}

+ (id)_accountWithAccountClass:(Class)a3 persistentAccount:(id)a4 useExisting:(BOOL)a5
{
  if (a5
    && (uint64_t v7 = -[objc_class existingAccountForUniqueID:](a3, "existingAccountForUniqueID:", [a4 identifier])) != 0)
  {
    v8 = (void *)v7;
    if ((Class)objc_opt_class() == a3) {
      [v8 setPersistentAccount:a4];
    }
    return v8;
  }
  else
  {
    uint64_t v10 = (void *)[[a3 alloc] initWithPersistentAccount:a4];
    return v10;
  }
}

+ (BOOL)_shouldUpdateAccountsInPlace
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"MFUpdateAccountsInPlaceKey");
  if (v2)
  {
    v3 = (void *)v2;
    if (objc_opt_respondsToSelector())
    {
      return [v3 BOOLValue];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5 = (void *)MFUserAgent();
    return [v5 isMobileMail];
  }
}

- (id)supportedDataclassesWithAccountTypeIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (void *)-[ACAccountType supportedDataclasses](-[ACAccountStore accountTypeWithAccountTypeIdentifier:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:"), "supportedDataclasses");
  return (id)[v3 allObjects];
}

- (id)newPersistentAccountWithAccountTypeIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = -[ACAccountStore accountTypeWithAccountTypeIdentifier:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:");
  if (!v4)
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MFAccountStore newPersistentAccountWithAccountTypeIdentifier:]((uint64_t)a3, v8);
    }
    return 0;
  }
  v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F179B0]);
  return (id)[v6 initWithAccountType:v5];
}

+ (id)sharedAccountStore
{
  if (sharedAccountStore_onceToken != -1) {
    dispatch_once(&sharedAccountStore_onceToken, &__block_literal_global_9);
  }
  return (id)sharedAccountStore_sAccountStore;
}

- (MFAccountStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFAccountStore;
  uint64_t v2 = [(MFAccountStore *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_accountStoreLock._os_unfair_lock_opaque = 0;
    [(MFAccountStore *)v2 setPersistentStore:objc_alloc_init(MEMORY[0x1E4F179C8])];
  }
  return v3;
}

- (void)dealloc
{
  [(MFAccountStore *)self setPersistentStore:0];
  v3.receiver = self;
  v3.super_class = (Class)MFAccountStore;
  [(MFAccountStore *)&v3 dealloc];
}

MFAccountStore *__36__MFAccountStore_sharedAccountStore__block_invoke()
{
  result = objc_alloc_init(MFAccountStore);
  sharedAccountStore_sAccountStore = (uint64_t)result;
  return result;
}

- (ACAccountStore)persistentStore
{
  p_accountStoreLock = &self->_accountStoreLock;
  os_unfair_lock_lock(&self->_accountStoreLock);
  BOOL v4 = self->_accountStore;
  os_unfair_lock_unlock(p_accountStoreLock);
  return v4;
}

- (void)setPersistentStore:(id)a3
{
  p_accountStoreLock = &self->_accountStoreLock;
  os_unfair_lock_lock(&self->_accountStoreLock);
  accountStore = self->_accountStore;
  if (accountStore != a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F17728];
    if (accountStore)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, *MEMORY[0x1E4F17728], self->_accountStore);
      accountStore = self->_accountStore;
    }

    self->_accountStore = (ACAccountStore *)a3;
    if (a3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel__accountsStoreChanged_, *v7, a3);
    }
  }
  os_unfair_lock_unlock(p_accountStoreLock);
}

- (id)existingAccountWithPersistentAccount:(id)a3
{
  return [(MFAccountStore *)self _accountWithPersistentAccount:a3 useExisting:1];
}

- (void)savePersistentAccountWithAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)[a3 persistentAccount];
  if (v4)
  {
    objc_super v5 = v4;
    uint64_t v6 = [v4 accountDescription];
    uint64_t v7 = [v5 identifier];
    if ([v5 isDirty])
    {
      v8 = dispatch_semaphore_create(0);
      accountStore = self->_accountStore;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke;
      v11[3] = &unk_1E6866D60;
      v11[4] = v6;
      v11[5] = v7;
      v11[6] = v8;
      [(ACAccountStore *)accountStore saveVerifiedAccount:v5 withCompletionHandler:v11];
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v8);
    }
    else
    {
      uint64_t v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1CFCFE000, v10, OS_LOG_TYPE_INFO, "Nothing to save for account \"%@\" (%@)", buf, 0x16u);
      }
    }
  }
}

intptr_t __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MFLogGeneral();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_INFO, "Saved account \"%@\" (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke_cold_1(a1, a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)removePersistentAccountWithAccount:(id)a3
{
  BOOL v4 = (void *)[a3 persistentAccount];
  if (v4)
  {
    objc_super v5 = v4;
    uint64_t v6 = [v4 accountDescription];
    uint64_t v7 = [v5 identifier];
    uint64_t v8 = dispatch_semaphore_create(0);
    accountStore = self->_accountStore;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke;
    v10[3] = &unk_1E6866D60;
    v10[4] = v6;
    v10[5] = v7;
    v10[6] = v8;
    [(ACAccountStore *)accountStore removeAccount:v5 withCompletionHandler:v10];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
  }
}

intptr_t __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MFLogGeneral();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_INFO, "Removed account \"%@\" (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke_cold_1(a1, a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_accountsStoreChanged:(id)a3
{
  BOOL v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[MFAccountStore _accountsStoreChanged:](a3, v4);
  }
}

- (void)newPersistentAccountWithAccountTypeIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "Missing account type for identifier %@", (uint8_t *)&v2, 0xCu);
}

- (void)accountsWithTypeIdentifiers:(NSObject *)a3 error:.cold.1(void *a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 componentsJoinedByString:@", "];
  uint64_t v6 = objc_msgSend(*a2, "ef_publicDescription");
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1CFCFE000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch accounts for types [%@]: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)_accountWithPersistentAccount:(void *)a1 useExisting:(id *)a2 .cold.1(void *a1, id *a2)
{
  [a1 identifier];
  objc_msgSend(*a2, "ef_publicDescription");
  OUTLINED_FUNCTION_1_0(&dword_1CFCFE000, v3, v4, "Failed to load account for persistent account \"%@\"%s%{public}@", v5, v6, v7, v8, 2u);
}

void __51__MFAccountStore_savePersistentAccountWithAccount___block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CFCFE000, v2, v3, "Failed to save account \"%@\" (%@) error: %{public}@", v4, v5, v6, v7, v8);
}

void __53__MFAccountStore_removePersistentAccountWithAccount___block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "ef_publicDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1CFCFE000, v2, v3, "Failed to remove account \"%@\" (%@) error: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_accountsStoreChanged:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = [a1 name];
  _os_log_debug_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_DEBUG, "Received %@ notification", (uint8_t *)&v3, 0xCu);
}

@end