@interface PSAccountEnumerator
- (ACMonitoredAccountStore)_monitoredAccountStore;
- (OS_dispatch_queue)_accountUpdateQueue;
- (PSAccountEnumerator)init;
- (int64_t)visibleAccountCount;
- (void)_handleAccountStoreDidUpdateIsInitialLoad:(BOOL)a3 completion:(id)a4;
- (void)_reloadAccountStoreStateIsInitialLoad:(BOOL)a3 completion:(id)a4;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)dealloc;
- (void)setVisibleAccountCount:(int64_t)a3;
- (void)set_accountUpdateQueue:(id)a3;
- (void)set_monitoredAccountStore:(id)a3;
@end

@implementation PSAccountEnumerator

- (PSAccountEnumerator)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = PKLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSAccountEnumerator init]";
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)PSAccountEnumerator;
  v4 = [(PSAccountEnumerator *)&v12 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.preferences-framework.PSAccountEnumerator", 0);
    accountUpdateQueue = v4->__accountUpdateQueue;
    v4->__accountUpdateQueue = (OS_dispatch_queue *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F179E8]);
    v8 = [(id)objc_opt_class() _visibleAccountTypeIDs];
    uint64_t v9 = [v7 initWithAccountTypes:v8 delegate:v4];
    monitoredAccountStore = v4->__monitoredAccountStore;
    v4->__monitoredAccountStore = (ACMonitoredAccountStore *)v9;

    [(PSAccountEnumerator *)v4 _reloadAccountStoreStateIsInitialLoad:1 completion:&__block_literal_global_4];
  }
  __27__PSAccountEnumerator_init__block_invoke();
  return v4;
}

void __27__PSAccountEnumerator_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[PSAccountEnumerator init]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

void __27__PSAccountEnumerator_init__block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[PSAccountEnumerator init]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: Initial account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[PSAccountEnumerator dealloc]";
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  v4 = [(PSAccountEnumerator *)self _monitoredAccountStore];
  [v4 removeDelegate:self];

  __30__PSAccountEnumerator_dealloc__block_invoke();
  v5.receiver = self;
  v5.super_class = (Class)PSAccountEnumerator;
  [(PSAccountEnumerator *)&v5 dealloc];
}

void __30__PSAccountEnumerator_dealloc__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[PSAccountEnumerator dealloc]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

id __39__PSAccountEnumerator_sharedEnumerator__block_invoke()
{
  if (_block_invoke_na_once_token_5 != -1) {
    dispatch_once(&_block_invoke_na_once_token_5, &__block_literal_global_13);
  }
  v0 = (void *)_block_invoke_na_once_object_5;
  return v0;
}

uint64_t __39__PSAccountEnumerator_sharedEnumerator__block_invoke_2()
{
  v0 = objc_alloc_init(PSAccountEnumerator);
  uint64_t v1 = _block_invoke_na_once_object_5;
  _block_invoke_na_once_object_5 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __45__PSAccountEnumerator__visibleAccountTypeIDs__block_invoke()
{
  if (_block_invoke_2_na_once_token_6 != -1) {
    dispatch_once(&_block_invoke_2_na_once_token_6, &__block_literal_global_18);
  }
  v0 = (void *)_block_invoke_2_na_once_object_6;
  return v0;
}

uint64_t __45__PSAccountEnumerator__visibleAccountTypeIDs__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F17858], *MEMORY[0x1E4F17770], *MEMORY[0x1E4F17778], *MEMORY[0x1E4F177E8], *MEMORY[0x1E4F17830], *MEMORY[0x1E4F17798], *MEMORY[0x1E4F177D0], *MEMORY[0x1E4F17818], *MEMORY[0x1E4F177C0], *MEMORY[0x1E4F17878], *MEMORY[0x1E4F17740], *MEMORY[0x1E4F17750], *MEMORY[0x1E4F17738], *MEMORY[0x1E4F17730], *MEMORY[0x1E4F17840], 0);
  uint64_t v1 = _block_invoke_2_na_once_object_6;
  _block_invoke_2_na_once_object_6 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_reloadAccountStoreStateIsInitialLoad:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = [(PSAccountEnumerator *)self _accountUpdateQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PSAccountEnumerator__reloadAccountStoreStateIsInitialLoad_completion___block_invoke;
  v9[3] = &unk_1E5C5DD38;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __72__PSAccountEnumerator__reloadAccountStoreStateIsInitialLoad_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAccountStoreDidUpdateIsInitialLoad:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 32)];
}

- (void)_handleAccountStoreDidUpdateIsInitialLoad:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = PKLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]";
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  uint64_t v9 = [v8 flatMap:&__block_literal_global_26];
  id v10 = [(PSAccountEnumerator *)self _monitoredAccountStore];
  if (v4)
  {
    id v11 = [v8 completionHandlerAdapter];
    [v10 registerWithCompletion:v11];
  }
  else
  {
    id v11 = [v10 monitoredAccounts];
    [v8 finishWithResult:v11];
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2;
  v14[3] = &unk_1E5C5DD80;
  objc_copyWeak(&v16, (id *)buf);
  id v12 = v6;
  id v15 = v12;
  id v13 = (id)[v9 addCompletionBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
  __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke();
}

void __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

id __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v8 isVisible])
        {
          uint64_t v9 = [v8 parentAccount];

          if (!v9) {
            ++v5;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v10 = (void *)MEMORY[0x1E4F7A0D8];
  id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];
  id v12 = [v10 futureWithResult:v11];

  return v12;
}

void __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = PKLogForCategory(0);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2_cold_1((uint64_t)v6, v9);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "%s: New visible account count %{public}@.", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(WeakRetained, "setVisibleAccountCount:", objc_msgSend(v5, "integerValue"));
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)accountWasAdded:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PSAccountEnumerator accountWasAdded:]";
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "%s: start.", (uint8_t *)&v6, 0xCu);
  }

  [(PSAccountEnumerator *)self _reloadAccountStoreStateIsInitialLoad:0 completion:&__block_literal_global_33];
  __39__PSAccountEnumerator_accountWasAdded___block_invoke();
}

void __39__PSAccountEnumerator_accountWasAdded___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[PSAccountEnumerator accountWasAdded:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

void __39__PSAccountEnumerator_accountWasAdded___block_invoke_31()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[PSAccountEnumerator accountWasAdded:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: Account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)accountWasRemoved:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PSAccountEnumerator accountWasRemoved:]";
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "%s: start.", (uint8_t *)&v6, 0xCu);
  }

  [(PSAccountEnumerator *)self _reloadAccountStoreStateIsInitialLoad:0 completion:&__block_literal_global_38_0];
  __41__PSAccountEnumerator_accountWasRemoved___block_invoke();
}

void __41__PSAccountEnumerator_accountWasRemoved___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[PSAccountEnumerator accountWasRemoved:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

void __41__PSAccountEnumerator_accountWasRemoved___block_invoke_36()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[PSAccountEnumerator accountWasRemoved:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: Account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)accountWasModified:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PSAccountEnumerator accountWasModified:]";
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "%s: start.", (uint8_t *)&v6, 0xCu);
  }

  [(PSAccountEnumerator *)self _reloadAccountStoreStateIsInitialLoad:0 completion:&__block_literal_global_43_0];
  __42__PSAccountEnumerator_accountWasModified___block_invoke();
}

void __42__PSAccountEnumerator_accountWasModified___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[PSAccountEnumerator accountWasModified:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

void __42__PSAccountEnumerator_accountWasModified___block_invoke_41()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = PKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    id v2 = "-[PSAccountEnumerator accountWasModified:]_block_invoke";
    _os_log_impl(&dword_1A6597000, v0, OS_LOG_TYPE_DEFAULT, "%s: Account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }
}

- (int64_t)visibleAccountCount
{
  return self->_visibleAccountCount;
}

- (void)setVisibleAccountCount:(int64_t)a3
{
  self->_visibleAccountCount = a3;
}

- (OS_dispatch_queue)_accountUpdateQueue
{
  return self->__accountUpdateQueue;
}

- (void)set_accountUpdateQueue:(id)a3
{
}

- (ACMonitoredAccountStore)_monitoredAccountStore
{
  return self->__monitoredAccountStore;
}

- (void)set_monitoredAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__monitoredAccountStore, 0);
  objc_storeStrong((id *)&self->__accountUpdateQueue, 0);
}

void __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]_block_invoke_2";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "%s: Error occurred while reloading account store state %{public}@.", (uint8_t *)&v2, 0x16u);
}

@end