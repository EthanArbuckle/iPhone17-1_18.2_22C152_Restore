@interface WBSRecentlyBreachedPasswordProvider
+ (WBSRecentlyBreachedPasswordProvider)sharedProvider;
- (NSArray)recentlyBreachedSavedAccountsIfAvailable;
- (WBSRecentlyBreachedPasswordProvider)init;
- (void)_accountStoreDidChange:(id)a3;
- (void)_getRecentlyBreachedSavedAccountsWithCompletionHandler:(id)a3;
- (void)clearRecentlyBreachedSavedAccounts;
- (void)dealloc;
@end

@implementation WBSRecentlyBreachedPasswordProvider

- (WBSRecentlyBreachedPasswordProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSRecentlyBreachedPasswordProvider;
  v2 = [(WBSRecentlyBreachedPasswordProvider *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (WBSPasswordBreachHelperProxy *)objc_alloc_init(MEMORY[0x1E4F97F10]);
    helperProxy = v3->_helperProxy;
    v3->_helperProxy = v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F981D0] object:0];

    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(WBSPasswordBreachHelperProxy *)self->_helperProxy invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSRecentlyBreachedPasswordProvider;
  [(WBSRecentlyBreachedPasswordProvider *)&v3 dealloc];
}

+ (WBSRecentlyBreachedPasswordProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_97);
  }
  v2 = (void *)sharedProvider_sharedProvider;
  return (WBSRecentlyBreachedPasswordProvider *)v2;
}

void __53__WBSRecentlyBreachedPasswordProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(WBSRecentlyBreachedPasswordProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;
}

- (void)clearRecentlyBreachedSavedAccounts
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WBSPasswordBreachHelperProxy *)self->_helperProxy clearRecentlyBreachedResultRecordsWithCompletionHandler:&__block_literal_global_9_4];
  recentlyBreachedSavedAccounts = self->_recentlyBreachedSavedAccounts;
  self->_recentlyBreachedSavedAccounts = 0;

  os_unfair_lock_unlock(p_lock);
}

void __73__WBSRecentlyBreachedPasswordProvider_clearRecentlyBreachedSavedAccounts__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __73__WBSRecentlyBreachedPasswordProvider_clearRecentlyBreachedSavedAccounts__block_invoke_cold_1(v2);
    }
  }
}

- (NSArray)recentlyBreachedSavedAccountsIfAvailable
{
  os_unfair_lock_lock(&self->_lock);
  id v3 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke;
  v7[3] = &unk_1E5C8C880;
  v7[4] = self;
  [v3 setHandler:v7];
  if (self->_recentlyBreachedSavedAccountsLookupStarted)
  {
    v4 = self->_recentlyBreachedSavedAccounts;
  }
  else
  {
    self->_recentlyBreachedSavedAccountsLookupStarted = 1;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_2;
    v6[3] = &unk_1E5C9F218;
    v6[4] = self;
    [(WBSRecentlyBreachedPasswordProvider *)self _getRecentlyBreachedSavedAccountsWithCompletionHandler:v6];
    v4 = 0;
  }

  return v4;
}

void __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke(uint64_t a1)
{
}

void __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(21, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_3;
  v6[3] = &unk_1E5C8C920;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __79__WBSRecentlyBreachedPasswordProvider_recentlyBreachedSavedAccountsIfAvailable__block_invoke_3(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

- (void)_getRecentlyBreachedSavedAccountsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  helperProxy = self->_helperProxy;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__WBSRecentlyBreachedPasswordProvider__getRecentlyBreachedSavedAccountsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CCC0;
  id v8 = v4;
  id v6 = v4;
  [(WBSPasswordBreachHelperProxy *)helperProxy recentlyBreachedResultRecordDictionariesWithCompletionHandler:v7];
}

void __94__WBSRecentlyBreachedPasswordProvider__getRecentlyBreachedSavedAccountsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 count])
  {
    id v3 = [MEMORY[0x1E4F97F28] resultRecordsFromDictionaryRepresentations:v7];
    id v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_15);
    id v5 = [MEMORY[0x1E4F97FD0] sharedStore];
    id v6 = [v5 savedAccountsForPersistentIdentifiers:v4];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __94__WBSRecentlyBreachedPasswordProvider__getRecentlyBreachedSavedAccountsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 persistentIdentifier];
}

- (void)_accountStoreDidChange:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_recentlyBreachedSavedAccountsLookupStarted = 0;
  recentlyBreachedSavedAccounts = self->_recentlyBreachedSavedAccounts;
  self->_recentlyBreachedSavedAccounts = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyBreachedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_helperProxy, 0);
}

void __73__WBSRecentlyBreachedPasswordProvider_clearRecentlyBreachedSavedAccounts__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Failed to clear recently breached result records.", v1, 2u);
}

@end