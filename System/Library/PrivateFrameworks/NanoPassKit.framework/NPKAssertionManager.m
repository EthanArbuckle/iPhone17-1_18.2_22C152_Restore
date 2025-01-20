@interface NPKAssertionManager
+ (id)sharedManager;
- (BOOL)containsAssertionWithType:(unint64_t)a3;
- (NPKAssertionManager)init;
- (NSHashTable)acquiredAssertions;
- (id)_errorWithUnderlyingError:(id)a3;
- (id)acquiredAssertionWithType:(unint64_t)a3;
- (void)_queue_acquireAssertionWithType:(unint64_t)a3 reason:(id)a4 completion:(id)a5;
- (void)_queue_invalidateAssertionWithType:(unint64_t)a3 completion:(id)a4;
- (void)acquireAssertionWithType:(unint64_t)a3 reason:(id)a4 completion:(id)a5;
- (void)addAssertion:(id)a3;
- (void)invalidateAssertionWithType:(unint64_t)a3 completion:(id)a4;
- (void)removeAssertion:(id)a3;
- (void)setAcquiredAssertions:(id)a3;
@end

@implementation NPKAssertionManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NPKAssertionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __36__NPKAssertionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;
}

- (NPKAssertionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPKAssertionManager;
  v2 = [(NPKAssertionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    acquiredAssertions = v2->_acquiredAssertions;
    v2->_acquiredAssertions = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoPassKit.NPKAssertion", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)addAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %@: Adding assertion:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  if ([v4 state] != 2)
  {
    objc_super v8 = [(NPKAssertionManager *)self acquiredAssertions];
    [v8 addObject:v4];
  }
}

- (void)removeAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %@: Removing assertion: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  objc_super v8 = [(NPKAssertionManager *)self acquiredAssertions];
  [v8 removeObject:v4];
}

- (BOOL)containsAssertionWithType:(unint64_t)a3
{
  uint64_t v3 = [(NPKAssertionManager *)self acquiredAssertionWithType:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)acquiredAssertionWithType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = [(NPKAssertionManager *)self acquiredAssertions];
  dispatch_queue_t v5 = [v4 allObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 type] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)acquireAssertionWithType:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = (void *)MEMORY[0x223C37380](v9);
      *(_DWORD *)buf = 138413058;
      v22 = self;
      __int16 v23 = 2048;
      unint64_t v24 = a3;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %@: Attempting to acquire assertion of type %lu for reason:%@ with completion:%@", buf, 0x2Au);
    }
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __66__NPKAssertionManager_acquireAssertionWithType_reason_completion___block_invoke;
  v17[3] = &unk_2644D3590;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a3;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

void __66__NPKAssertionManager_acquireAssertionWithType_reason_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_queue_acquireAssertionWithType:reason:completion:", *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)invalidateAssertionWithType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x223C37380](v6);
      *(_DWORD *)buf = 138412802;
      v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: Attempting to invalidate assertion of type %lu with completion:%@", buf, 0x20u);
    }
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKAssertionManager_invalidateAssertionWithType_completion___block_invoke;
  block[3] = &unk_2644D4E40;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = (id)a3;
  id v14 = v6;
  id v12 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void __62__NPKAssertionManager_invalidateAssertionWithType_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_invalidateAssertionWithType:completion:", *(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_queue_acquireAssertionWithType:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v10 = [(NPKAssertionManager *)self acquiredAssertions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v30 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
      if ([v15 type] == a3) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = v15;

    if (!v16) {
      goto LABEL_17;
    }
    v17 = [(NPKAssertionManager *)self _errorWithUnderlyingError:@"Assertion already taken"];
    if (v9) {
      v9[2](v9, v16, v17);
    }
    if (v17)
    {
      __int16 v18 = pk_General_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (!v19) {
        goto LABEL_24;
      }
      __int16 v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v17 description];
        *(_DWORD *)buf = 138412546;
        v34 = self;
        __int16 v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %@: Unable to acquire assertion due to error: %@", buf, 0x16u);
      }
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:

LABEL_17:
    uint64_t v22 = [[NPKAssertion alloc] initWithType:a3 reason:v8];
    [(NPKAssertionManager *)self addAssertion:v22];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __73__NPKAssertionManager__queue_acquireAssertionWithType_reason_completion___block_invoke;
    v25[3] = &unk_2644D4E68;
    v28 = v9;
    id v16 = v22;
    id v26 = v16;
    __int16 v27 = self;
    [(NPKAssertion *)v16 acquireWithCompletion:v25];
  }
  __int16 v23 = pk_General_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (!v24)
  {
    v17 = 0;
    goto LABEL_24;
  }
  __int16 v20 = pk_General_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = self;
    _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %@: Successfully acquired assertion", buf, 0xCu);
  }
  v17 = 0;
LABEL_22:

LABEL_24:
}

uint64_t __73__NPKAssertionManager__queue_acquireAssertionWithType_reason_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      goto LABEL_9;
    }
    uint64_t v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_8;
  }
  if (!v5)
  {
    [*(id *)(a1 + 40) _errorWithUnderlyingError:@"Assertion could not be created"];
    objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8)
  {
    uint64_t v7 = *(void (**)(void))(v8 + 16);
LABEL_8:
    v7();
  }
LABEL_9:
  return MEMORY[0x270F9A790]();
}

- (void)_queue_invalidateAssertionWithType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(NPKAssertionManager *)self acquiredAssertions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if ([v12 type] == a3) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_13;
    }
    if ([v13 isAcquired])
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      id v15[2] = __69__NPKAssertionManager__queue_invalidateAssertionWithType_completion___block_invoke;
      v15[3] = &unk_2644D4128;
      v15[4] = self;
      id v16 = v6;
      [v13 invalidateWithCompletion:v15];
    }
    else if (v6)
    {
      uint64_t v14 = [(NPKAssertionManager *)self _errorWithUnderlyingError:@"Cannot invalidate an invalid assertion."];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
    }
  }
  else
  {
LABEL_9:

LABEL_13:
    if (v6) {
      (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
    }
    id v13 = 0;
  }
}

void __69__NPKAssertionManager__queue_invalidateAssertionWithType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  uint64_t v7 = pk_General_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v8)
    {
      uint64_t v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = [v5 description];
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: Unable to invalidate assertion due to error: %@", (uint8_t *)&v13, 0x16u);
      }
LABEL_10:
    }
  }
  else if (v8)
  {
    uint64_t v9 = pk_General_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: %@: Successfully invalidated assertion", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_10;
  }
}

- (id)_errorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKAssertionManagerErrorDomain" code:0 userInfo:v5];

  return v6;
}

- (NSHashTable)acquiredAssertions
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAcquiredAssertions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acquiredAssertions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end