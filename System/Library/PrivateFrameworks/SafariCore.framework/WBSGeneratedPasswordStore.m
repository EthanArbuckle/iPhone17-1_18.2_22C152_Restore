@interface WBSGeneratedPasswordStore
+ (WBSGeneratedPasswordStore)sharedStore;
- (NSArray)allUnexpiredGeneratedPasswords;
- (NSDate)currentExpirationDate;
- (WBSGeneratedPasswordStore)init;
- (id)_generatedPasswordsFilteringExpiredPasswords:(id)a3 olderThanDate:(id)a4;
- (id)generatedPasswordsForProtectionSpace:(id)a3 options:(unint64_t)a4;
- (void)_loadIfNeeded;
- (void)_purgeExpiredPasswordsOnInternalQueue:(id)a3;
- (void)_removeAllGeneratedPasswordsOnInternalQueue;
- (void)_reset;
- (void)addGeneratedPassword:(id)a3 forProtectionSpace:(id)a4 inPrivateBrowsingSession:(BOOL)a5 completionHandler:(id)a6;
- (void)debug_removeAll;
- (void)preWarm;
- (void)removeGeneratedPassword:(id)a3 completionHandler:(id)a4;
- (void)synchronouslyRemoveGeneratedPasswordsNewerThanDate:(id)a3;
- (void)updateGeneratedPassword:(id)a3 withPassword:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSGeneratedPasswordStore

+ (WBSGeneratedPasswordStore)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedStore_sharedStore;
  return (WBSGeneratedPasswordStore *)v2;
}

void __40__WBSGeneratedPasswordStore_sharedStore__block_invoke()
{
  v0 = objc_alloc_init(WBSGeneratedPasswordStore);
  v1 = (void *)sharedStore_sharedStore;
  sharedStore_sharedStore = (uint64_t)v0;
}

- (WBSGeneratedPasswordStore)init
{
  v21.receiver = self;
  v21.super_class = (Class)WBSGeneratedPasswordStore;
  v2 = [(WBSGeneratedPasswordStore *)&v21 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.SafariCore.%@.%p", v5, v2];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = [[WBSKeychainCredentialNotificationMonitor alloc] initWithCoalescingInterval:0.0];
    keychainMonitor = v2->_keychainMonitor;
    v2->_keychainMonitor = v9;

    objc_initWeak(&location, v2);
    v11 = v2->_queue;
    v12 = v2->_keychainMonitor;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __33__WBSGeneratedPasswordStore_init__block_invoke;
    v17[3] = &unk_1E615AE50;
    v13 = v11;
    v18 = v13;
    objc_copyWeak(&v19, &location);
    id v14 = [(WBSKeychainCredentialNotificationMonitor *)v12 addObserverWithBlock:v17];
    [(WBSGeneratedPasswordStore *)v2 preWarm];
    v15 = v2;
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v2;
}

void __33__WBSGeneratedPasswordStore_init__block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__WBSGeneratedPasswordStore_init__block_invoke_2;
  block[3] = &unk_1E615A5D8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __33__WBSGeneratedPasswordStore_init__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEFAULT, "Generated passwords store received Keychain update notification", buf, 2u);
    }
    if (WeakRetained[32])
    {
      v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEFAULT, "Generated passwords store is ignoring Keychain update notifications", buf, 2u);
      }
    }
    else
    {
      [WeakRetained _reset];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__WBSGeneratedPasswordStore_init__block_invoke_10;
      block[3] = &unk_1E615A5D8;
      objc_copyWeak(&v6, v1);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v6);
    }
  }
}

void __33__WBSGeneratedPasswordStore_init__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"WBSGeneratedPasswordStoreDidChangeNotification" object:WeakRetained];
  }
}

- (NSArray)allUnexpiredGeneratedPasswords
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__WBSGeneratedPasswordStore_allUnexpiredGeneratedPasswords__block_invoke;
  v5[3] = &unk_1E615AE78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __59__WBSGeneratedPasswordStore_allUnexpiredGeneratedPasswords__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNeeded];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDate)currentExpirationDate
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v4 = [v3 dateByAddingUnit:16 value:-30 toDate:v2 options:0];

  v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v6 = [v5 valueForKey:@"DebugGeneratedPasswordsExpirationTimeInMinutes"];

  if (v6)
  {
    dispatch_queue_t v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v8 = [v7 integerForKey:@"DebugGeneratedPasswordsExpirationTimeInMinutes"];

    v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [v9 dateByAddingUnit:64 value:-v8 toDate:v2 options:0];

    v4 = (void *)v10;
  }

  return (NSDate *)v4;
}

- (void)preWarm
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WBSGeneratedPasswordStore_preWarm__block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__WBSGeneratedPasswordStore_preWarm__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadIfNeeded];
}

- (void)_loadIfNeeded
{
  if (!self->_cachedGeneratedPasswords)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_DEFAULT, "Reloading generated passwords store", buf, 2u);
    }
    v4 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    v5 = objc_msgSend(v4, "safari_allGeneratedPasswordItems");

    uint64_t v6 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_18_0);
    dispatch_queue_t v7 = [(WBSGeneratedPasswordStore *)self currentExpirationDate];
    uint64_t v8 = [(WBSGeneratedPasswordStore *)self _generatedPasswordsFilteringExpiredPasswords:v6 olderThanDate:v7];

    v9 = [v8 first];
    uint64_t v10 = (NSMutableArray *)[v9 mutableCopy];
    cachedGeneratedPasswords = self->_cachedGeneratedPasswords;
    self->_cachedGeneratedPasswords = v10;

    v12 = [v8 second];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      queue = self->_queue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __42__WBSGeneratedPasswordStore__loadIfNeeded__block_invoke_2;
      v16[3] = &unk_1E615A6C8;
      v16[4] = self;
      id v17 = v8;
      dispatch_async(queue, v16);
    }
    v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v15, OS_LOG_TYPE_DEFAULT, "Finished reloading generated passwords store", buf, 2u);
    }
  }
}

WBSGeneratedPassword *__42__WBSGeneratedPasswordStore__loadIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[WBSGeneratedPassword alloc] initWithKeychainItemDictionary:v2];

  return v3;
}

void __42__WBSGeneratedPasswordStore__loadIfNeeded__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) second];
  [v1 _purgeExpiredPasswordsOnInternalQueue:v2];
}

- (void)_reset
{
  cachedGeneratedPasswords = self->_cachedGeneratedPasswords;
  self->_cachedGeneratedPasswords = 0;
}

- (void)_purgeExpiredPasswordsOnInternalQueue:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Purging expired generated passwords", buf, 2u);
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v7 = [v6 valueForKey:@"DebugGeneratedPasswordsExpirationTimeInMinutes"];

    if (v7)
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v7;
        _os_log_impl(&dword_1B728F000, v8, OS_LOG_TYPE_DEFAULT, "Removing debug generated passwords limit of %@ minutes", buf, 0xCu);
      }
      v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v9 removeObjectForKey:@"DebugGeneratedPasswordsExpirationTimeInMinutes"];
    }
    v23 = (void *)v7;
    v24 = self;
    self->_shouldIgnoreKeychainUpdates = 1;
    uint64_t v10 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v4;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            id v19 = [v16 generationDate];
            v20 = [v16 protectionSpace];
            objc_super v21 = [v20 host];
            *(_DWORD *)buf = 138412546;
            uint64_t v31 = (uint64_t)v19;
            __int16 v32 = 2112;
            v33 = v21;
            _os_log_impl(&dword_1B728F000, v18, OS_LOG_TYPE_DEFAULT, "Removing password generated on %@ for host %@", buf, 0x16u);
          }
          objc_msgSend(v10, "safari_deleteGeneratedPassword:", v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v13);
    }

    v24->_shouldIgnoreKeychainUpdates = 0;
    v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v22, OS_LOG_TYPE_DEFAULT, "Finished purging expired generated passwords", buf, 2u);
    }

    id v4 = v25;
  }
}

- (id)_generatedPasswordsFilteringExpiredPasswords:(id)a3 olderThanDate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  uint64_t v8 = [v6 array];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __88__WBSGeneratedPasswordStore__generatedPasswordsFilteringExpiredPasswords_olderThanDate___block_invoke;
  v18 = &unk_1E615AEC0;
  id v19 = v5;
  id v20 = v8;
  id v9 = v8;
  id v10 = v5;
  id v11 = objc_msgSend(v7, "safari_filterObjectsUsingBlock:", &v15);

  uint64_t v12 = [WBSPair alloc];
  uint64_t v13 = -[WBSPair initWithFirst:second:](v12, "initWithFirst:second:", v11, v9, v15, v16, v17, v18);

  return v13;
}

uint64_t __88__WBSGeneratedPasswordStore__generatedPasswordsFilteringExpiredPasswords_olderThanDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 generationDate];
  id v5 = v4;
  if (v4
    && ([v4 earlierDate:*(void *)(a1 + 32)],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)addGeneratedPassword:(id)a3 forProtectionSpace:(id)a4 inPrivateBrowsingSession:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  if (!v10 || !v11)
  {
    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[WBSGeneratedPasswordStore addGeneratedPassword:forProtectionSpace:inPrivateBrowsingSession:completionHandler:]();
      if (!v12) {
        goto LABEL_7;
      }
    }
    else if (!v12)
    {
      goto LABEL_7;
    }
    v12[2](v12, 0);
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__WBSGeneratedPasswordStore_addGeneratedPassword_forProtectionSpace_inPrivateBrowsingSession_completionHandler___block_invoke;
  v15[3] = &unk_1E615AEE8;
  objc_copyWeak(&v19, &location);
  v18 = v12;
  id v16 = v10;
  id v17 = v11;
  BOOL v20 = a5;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_7:
}

void __112__WBSGeneratedPasswordStore_addGeneratedPassword_forProtectionSpace_inPrivateBrowsingSession_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    id v3 = objc_msgSend(v2, "safari_addGeneratedPassword:forProtectionSpace:wasGeneratedInPrivateBrowsingSession:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));

    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
    [WeakRetained _reset];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

- (void)updateGeneratedPassword:(id)a3 withPassword:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (!v8 || !v9)
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[WBSGeneratedPasswordStore updateGeneratedPassword:withPassword:completionHandler:]();
      if (!v10) {
        goto LABEL_7;
      }
    }
    else if (!v10)
    {
      goto LABEL_7;
    }
    v10[2](v10, 0);
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSGeneratedPasswordStore_updateGeneratedPassword_withPassword_completionHandler___block_invoke;
  block[3] = &unk_1E615AF10;
  objc_copyWeak(&v17, &location);
  id v16 = v10;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(queue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
LABEL_7:
}

void __84__WBSGeneratedPasswordStore_updateGeneratedPassword_withPassword_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    id v3 = objc_msgSend(v2, "safari_updateGeneratedPassword:withPassword:", *(void *)(a1 + 32), *(void *)(a1 + 40));

    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
    [WeakRetained _reset];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

- (void)removeGeneratedPassword:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (!v6)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSGeneratedPasswordStore removeGeneratedPassword:completionHandler:](v9);
      if (!v7) {
        goto LABEL_6;
      }
    }
    else if (!v7)
    {
      goto LABEL_6;
    }
    v7[2](v7);
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__WBSGeneratedPasswordStore_removeGeneratedPassword_completionHandler___block_invoke;
  v10[3] = &unk_1E615AF38;
  objc_copyWeak(&v13, &location);
  uint64_t v12 = v7;
  id v11 = v6;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_6:
}

void __71__WBSGeneratedPasswordStore_removeGeneratedPassword_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    objc_msgSend(v2, "safari_deleteGeneratedPassword:", *(void *)(a1 + 32));

    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    [WeakRetained _reset];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
}

- (void)synchronouslyRemoveGeneratedPasswordsNewerThanDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__WBSGeneratedPasswordStore_synchronouslyRemoveGeneratedPasswordsNewerThanDate___block_invoke;
  v7[3] = &unk_1E615A6C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __80__WBSGeneratedPasswordStore_synchronouslyRemoveGeneratedPasswordsNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  LODWORD(v2) = [v2 isEqualToDate:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 _removeAllGeneratedPasswordsOnInternalQueue];
  }
  else
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v6;
      _os_log_impl(&dword_1B728F000, v5, OS_LOG_TYPE_DEFAULT, "Removing generated passwords newer than %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
    uint64_t v7 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
    id v8 = objc_msgSend(v7, "safari_allGeneratedPasswordItems");
    id v9 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_25_0);

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "generationDate", (void)v20);
          id v17 = [v16 laterDate:*(void *)(a1 + 32)];
          v18 = *(void **)(a1 + 32);

          if (v17 != v18) {
            objc_msgSend(v7, "safari_deleteGeneratedPassword:", v15);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 0;
    id v19 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B728F000, v19, OS_LOG_TYPE_DEFAULT, "Finished removing generated passwords", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "_reset", (void)v20);
  }
}

WBSGeneratedPassword *__80__WBSGeneratedPasswordStore_synchronouslyRemoveGeneratedPasswordsNewerThanDate___block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[WBSGeneratedPassword alloc] initWithKeychainItemDictionary:v2];

  return v3;
}

- (void)_removeAllGeneratedPasswordsOnInternalQueue
{
  uint64_t v3 = [MEMORY[0x1E4F18D90] sharedCredentialStorage];
  objc_msgSend(v3, "safari_deleteAllGeneratedPasswords");

  [(WBSGeneratedPasswordStore *)self _reset];
}

- (id)generatedPasswordsForProtectionSpace:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = (id)MEMORY[0x1E4F1CBF0];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke;
  v11[3] = &unk_1E615AF88;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadIfNeeded];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke_2;
  v8[3] = &unk_1E615AF60;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v5 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

BOOL __74__WBSGeneratedPasswordStore_generatedPasswordsForProtectionSpace_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 protectionSpace];
  BOOL v7 = 1;
  if (([v3 isEqualToProtectionSpaceForPasswordManager:*(void *)(a1 + 32)] & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 40) & 1) == 0
      || (objc_msgSend(*(id *)(a1 + 32), "safari_protectionSpaceByReplacingHostWithHighlevelDomain"),
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "safari_protectionSpaceByReplacingHostWithHighlevelDomain"),
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v4 isEqualToProtectionSpaceForPasswordManager:v5],
          v5,
          v4,
          (v6 & 1) == 0))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)debug_removeAll
{
  id v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(WBSGeneratedPasswordStore *)self synchronouslyRemoveGeneratedPasswordsNewerThanDate:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedGeneratedPasswords, 0);
}

- (void)addGeneratedPassword:forProtectionSpace:inPrivateBrowsingSession:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Attempted to add a generated password record with a nil password or protectionSpace: password=%p protectionSpace=%p", v2, v3);
}

- (void)updateGeneratedPassword:withPassword:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1B728F000, v0, v1, "Attempted to update a generated password record with a nil generated password or new password: generatedPassword=%p password=%p", v2, v3);
}

- (void)removeGeneratedPassword:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Refusing to delete a nil generated password record", v1, 2u);
}

@end