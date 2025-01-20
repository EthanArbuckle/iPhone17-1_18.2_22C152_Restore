@interface ICHTTPCookieStore
+ (ICHTTPCookieStore)sharedCookieStore;
- (BOOL)_saveCookies:(id)a3 userIdentifier:(id)a4;
- (BOOL)removeCookiesWithProperties:(id)a3;
- (BOOL)saveCookies:(id)a3 forURL:(id)a4;
- (BOOL)saveCookies:(id)a3 forURL:(id)a4 userIdentifier:(id)a5;
- (BOOL)saveGlobalAccountCookies:(id)a3 forURL:(id)a4;
- (ICHTTPCookieStore)init;
- (id)_accountForUserIdentifier:(id)a3;
- (id)_cookieDictionaryForURL:(id)a3 userIdentifier:(id)a4;
- (id)getCookieWithName:(id)a3 userIdentifier:(id)a4;
- (id)getCookiesForURL:(id)a3;
- (id)getCookiesForURL:(id)a3 userIdentifier:(id)a4;
- (id)getCookiesForUserIdentifier:(id)a3;
- (id)getCookiesHeadersForURL:(id)a3 userIdentifier:(id)a4;
- (id)getGlobalAccountCookiesForURL:(id)a3;
- (void)dealloc;
- (void)removeAllCookies;
@end

@implementation ICHTTPCookieStore

uint64_t __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _cookieDictionaryForURL:*(void *)(a1 + 40) userIdentifier:&unk_1EF640B40];
  v3 = (void *)[v2 mutableCopy];

  if ([*(id *)(a1 + 48) longLongValue] >= 1)
  {
    v4 = [*(id *)(a1 + 32) _cookieDictionaryForURL:*(void *)(a1 + 40) userIdentifier:*(void *)(a1 + 48)];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke_6;
    v22[3] = &unk_1E5ACCC38;
    id v23 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v22];
  }
  v5 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  v6 = [v5 cookiesForURL:*(void *)(a1 + 40)];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "name", (void)v18);
        if (v13)
        {
          v14 = [v3 objectForKey:v13];

          if (!v14) {
            [v3 setObject:v12 forKey:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [v3 allValues];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (id)_cookieDictionaryForURL:(id)a3 userIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [(ICHTTPCookieStore *)self _accountForUserIdentifier:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    if (v6) {
      objc_msgSend(v9, "ams_cookiesForURL:", v6);
    }
    else {
      objc_msgSend(v9, "ams_cookies");
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "name", (void)v20);

          if (v17)
          {
            long long v18 = [v16 name];
            [v8 setObject:v16 forKey:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }

  return v8;
}

+ (ICHTTPCookieStore)sharedCookieStore
{
  if (sharedCookieStore_sOnceToken != -1) {
    dispatch_once(&sharedCookieStore_sOnceToken, &__block_literal_global_37619);
  }
  v2 = (void *)sharedCookieStore_sSharedCookieStore;

  return (ICHTTPCookieStore *)v2;
}

- (id)getCookiesHeadersForURL:(id)a3 userIdentifier:(id)a4
{
  v4 = [(ICHTTPCookieStore *)self getCookiesForURL:a3 userIdentifier:a4];
  v5 = [MEMORY[0x1E4F18D28] requestHeaderFieldsWithCookies:v4];

  return v5;
}

- (id)getCookiesForURL:(id)a3 userIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__37607;
  long long v21 = __Block_byref_object_dispose__37608;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ICHTTPCookieStore_getCookiesForURL_userIdentifier___block_invoke;
  v13[3] = &unk_1E5ACCC60;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)_accountForUserIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = +[ICMonitoredAccountStore sharedAccountStore];
    if ([v4 longLongValue] == -1)
    {
      uint64_t v14 = 0;
      id v6 = (id *)&v14;
      uint64_t v7 = [v5 localStoreAccountWithError:&v14];
    }
    else
    {
      uint64_t v13 = 0;
      id v6 = (id *)&v13;
      uint64_t v7 = [v5 storeAccountForDSID:v4 error:&v13];
    }
    uint64_t v8 = (void *)v7;
    id v9 = *v6;
    if (v9)
    {
      id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v16 = self;
        __int16 v17 = 2114;
        id v18 = v4;
        __int16 v19 = 2114;
        id v20 = v9;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load account for identifier %{public}@. err=%{public}@", buf, 0x20u);
      }
    }
    if (!v8)
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = self;
        __int16 v17 = 2114;
        id v18 = v4;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@: No account found for identifier %{public}@.", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __38__ICHTTPCookieStore_sharedCookieStore__block_invoke()
{
  sharedCookieStore_sSharedCookieStore = objc_alloc_init(ICHTTPCookieStore);

  return MEMORY[0x1F41817F8]();
}

- (ICHTTPCookieStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICHTTPCookieStore;
  v2 = [(ICHTTPCookieStore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloud.ICStoreHTTPCookieManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (BOOL)_saveCookies:(id)a3 userIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ICHTTPCookieStore *)self _accountForUserIdentifier:a4];
  uint64_t v8 = v7;
  if (v7 && objc_msgSend(v7, "ams_addCookies:", v6))
  {
    id v9 = +[ICMonitoredAccountStore sharedAccountStore];
    id v14 = 0;
    [v9 saveAccount:v8 error:&v14];
    id v10 = v14;

    BOOL v11 = v10 == 0;
    if (v10)
    {
      uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v16 = self;
        __int16 v17 = 2114;
        id v18 = v8;
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save cookies for account %{public}@. err=%{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)removeAllCookies
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICHTTPCookieStore_removeAllCookies__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__ICHTTPCookieStore_removeAllCookies__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v1 = +[ICMonitoredAccountStore sharedAccountStore];
  id v23 = 0;
  v2 = [v1 allStoreAccountsWithError:&v23];
  id v3 = v23;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v5;
      __int16 v26 = 2114;
      id v27 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load accounts to remove all cookies. err=%{public}@", buf, 0x16u);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138543874;
    long long v16 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v3;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        objc_msgSend(v13, "ams_removeAllCookies", v16);
        id v18 = v12;
        [v1 saveAccount:v13 error:&v18];
        id v3 = v18;

        if (v3)
        {
          id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = *(void *)(a1 + 32);
            *(_DWORD *)buf = v16;
            uint64_t v25 = v15;
            __int16 v26 = 2114;
            id v27 = v13;
            __int16 v28 = 2114;
            id v29 = v3;
            _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove cookies from account %{public}@. err=%{public}@", buf, 0x20u);
          }
        }
        ++v11;
        uint64_t v12 = v3;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v9);
  }
}

- (BOOL)removeCookiesWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICHTTPCookieStore_removeCookiesWithProperties___block_invoke;
  block[3] = &unk_1E5ACCC88;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __49__ICHTTPCookieStore_removeCookiesWithProperties___block_invoke(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = +[ICMonitoredAccountStore sharedAccountStore];
  id v23 = 0;
  id v3 = [v2 allStoreAccountsWithError:&v23];
  id v4 = v23;
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v6;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load accounts to remove cookies. err=%{public}@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v9 = 138543874;
    long long v17 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isActive", v17) & 1) != 0 || objc_msgSend(v13, "ams_isLocalAccount"))
        {
          objc_msgSend(v13, "ams_removeCookiesMatchingProperties:", a1[5]);
          id v18 = v4;
          [v2 saveAccount:v13 error:&v18];
          id v14 = v18;

          if (v14)
          {
            uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = a1[4];
              *(_DWORD *)buf = v17;
              uint64_t v25 = v16;
              __int16 v26 = 2114;
              id v27 = v13;
              __int16 v28 = 2114;
              id v29 = v14;
              _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove cookies from account %{public}@. err=%{public}@", buf, 0x20u);
            }

            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
            id v4 = v14;
          }
          else
          {
            id v4 = 0;
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v10);
  }
}

- (BOOL)saveGlobalAccountCookies:(id)a3 forURL:(id)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICHTTPCookieStore_saveGlobalAccountCookies_forURL___block_invoke;
  block[3] = &unk_1E5ACCC88;
  id v10 = v5;
  uint64_t v11 = &v12;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

uint64_t __53__ICHTTPCookieStore_saveGlobalAccountCookies_forURL___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveCookies:*(void *)(a1 + 40) userIdentifier:&unk_1EF640B40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)saveCookies:(id)a3 forURL:(id)a4 userIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__ICHTTPCookieStore_saveCookies_forURL_userIdentifier___block_invoke;
  v13[3] = &unk_1E5ACCC60;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = &v17;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(queue, v13);
  LOBYTE(queue) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)queue;
}

uint64_t __55__ICHTTPCookieStore_saveCookies_forURL_userIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveCookies:*(void *)(a1 + 40) userIdentifier:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)saveCookies:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__ICHTTPCookieStore_saveCookies_forURL___block_invoke;
  v12[3] = &unk_1E5ACD4C8;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v12);

  return 1;
}

void __40__ICHTTPCookieStore_saveCookies_forURL___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  [v2 setCookies:*(void *)(a1 + 32) forURL:*(void *)(a1 + 40) mainDocumentURL:*(void *)(a1 + 40)];
}

- (id)getGlobalAccountCookiesForURL:(id)a3
{
  return [(ICHTTPCookieStore *)self getCookiesForURL:a3 userIdentifier:&unk_1EF640B40];
}

- (id)getCookieWithName:(id)a3 userIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(ICHTTPCookieStore *)self getCookiesForUserIdentifier:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "name", (void)v15);
        int v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)getCookiesForUserIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__37607;
  long long v16 = __Block_byref_object_dispose__37608;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke;
  block[3] = &unk_1E5ACCC88;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _cookieDictionaryForURL:0 userIdentifier:&unk_1EF640B40];
  id v3 = (void *)[v2 mutableCopy];

  if ([*(id *)(a1 + 40) longLongValue] >= 1)
  {
    id v4 = [*(id *)(a1 + 32) _cookieDictionaryForURL:0 userIdentifier:*(void *)(a1 + 40)];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke_2;
    v8[3] = &unk_1E5ACCC38;
    id v9 = v3;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  uint64_t v5 = [v3 allValues];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __49__ICHTTPCookieStore_getCookiesForUserIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (id)getCookiesForURL:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__37607;
  long long v16 = __Block_byref_object_dispose__37608;
  id v17 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__ICHTTPCookieStore_getCookiesForURL___block_invoke;
  v9[3] = &unk_1E5ACD880;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __38__ICHTTPCookieStore_getCookiesForURL___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  uint64_t v2 = [v5 cookiesForURL:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ICHTTPCookieStore;
  [(ICHTTPCookieStore *)&v2 dealloc];
}

@end