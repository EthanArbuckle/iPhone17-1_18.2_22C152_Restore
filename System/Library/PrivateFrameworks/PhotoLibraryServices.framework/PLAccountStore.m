@interface PLAccountStore
+ (id)pl_sharedAccountStore;
- (ACAccount)cachedPrimaryAppleAccount;
- (PLAccountStore)init;
- (void)accountDidChange:(id)a3;
- (void)clearCachedProperties;
- (void)dealloc;
@end

@implementation PLAccountStore

+ (id)pl_sharedAccountStore
{
  pl_dispatch_once();
  v2 = (void *)pl_sharedAccountStore_accountStore;
  return v2;
}

- (ACAccount)cachedPrimaryAppleAccount
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__34758;
  v8 = __Block_byref_object_dispose__34759;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (ACAccount *)v2;
}

void __39__PLAccountStore_pl_sharedAccountStore__block_invoke()
{
  v0 = objc_alloc_init(PLAccountStore);
  v1 = (void *)pl_sharedAccountStore_accountStore;
  pl_sharedAccountStore_accountStore = (uint64_t)v0;
}

- (PLAccountStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLAccountStore;
  id v2 = [(PLAccountStore *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("placcount-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_accountDidChange_ name:*MEMORY[0x1E4F17728] object:v2];
  }
  return v2;
}

void __43__PLAccountStore_cachedPrimaryAppleAccount__block_invoke(uint64_t a1)
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  dispatch_queue_t v3 = (void *)v2[15];
  unint64_t v4 = 0x1E4F1C000uLL;
  if (!v3)
  {
    uint64_t v5 = objc_msgSend(v2, "aa_primaryAppleAccount");
    uint64_t v6 = *(void *)(a1 + 32);
    objc_super v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = v5;

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 120);
    id v9 = PLBackendGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = *(__CFString **)(*(void *)(a1 + 32) + 120);
        *(_DWORD *)buf = 138412290;
        v33 = v11;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Caching primaryAppleAccount: %@", buf, 0xCu);
      }

      uint64_t v12 = *MEMORY[0x1E4F17AE0];
      v37[0] = *MEMORY[0x1E4F17A88];
      v37[1] = v12;
      v37[2] = *MEMORY[0x1E4F17B18];
      v37[3] = @"com.apple.Dataclass.ImagePlayground";
      [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v14)
      {
        uint64_t v16 = v14;
        uint64_t v17 = *(void *)v29;
        *(void *)&long long v15 = 138412546;
        long long v27 = v15;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            int v20 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "isEnabledForDataclass:", v19, v27, (void)v28);
            v21 = PLBackendGetLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v27;
              v22 = @" NOT ";
              if (v20) {
                v22 = @" ";
              }
              v33 = v22;
              __int16 v34 = 2112;
              uint64_t v35 = v19;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "primaryAppleAccount is%@enabled for dataclass %@", buf, 0x16u);
            }
          }
          uint64_t v16 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v16);
      }

      unint64_t v4 = 0x1E4F1C000;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "No primaryAppleAccount", buf, 2u);
      }

      uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
      uint64_t v24 = *(void *)(a1 + 32);
      id v13 = *(id *)(v24 + 120);
      *(void *)(v24 + 120) = v23;
    }

    dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  v25 = [*(id *)(v4 + 2712) null];
  char v26 = [v3 isEqual:v25];

  if ((v26 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 120));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrimaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)clearCachedProperties
{
}

void __39__PLAccountStore_clearCachedProperties__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = 0;
}

- (void)accountDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "ACAccountStore accountDidChange, clearing cached properties in PLAccountStore.", buf, 2u);
  }

  [(PLAccountStore *)self clearCachedProperties];
  uint64_t v6 = [v4 userInfo];

  objc_super v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "ACAccountStore accountDidChange. Posting PLAccountStoreDidChange notification.", v9, 2u);
  }

  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"PLAccountStoreDidChangeNotification" object:self userInfo:v6];
}

- (void)dealloc
{
  dispatch_queue_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PLAccountStore;
  [(PLAccountStore *)&v4 dealloc];
}

@end