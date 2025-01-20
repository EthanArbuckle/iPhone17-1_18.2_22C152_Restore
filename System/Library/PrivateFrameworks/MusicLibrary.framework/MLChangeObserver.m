@interface MLChangeObserver
@end

@implementation MLChangeObserver

void __38___MLChangeObserver_setupTimeoutTimer__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(_DWORD *)(a1 + 56);
      int v9 = 134218498;
      id v10 = WeakRetained;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 1024;
      int v14 = v6;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "_MLChangeObserver %p - Terminating hanging client %{public}@[%d]", (uint8_t *)&v9, 0x1Cu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
    [WeakRetained tearDownTaskAssertion];
    [WeakRetained terminateForFailureToPerformDatabasePathChange];
    [WeakRetained tearDownTimeoutTimer];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
  }
  else
  {
    if (v4)
    {
      v7 = *(void **)(a1 + 32);
      int v8 = *(_DWORD *)(a1 + 56);
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 1024;
      LODWORD(v12) = v8;
      _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "_MLChangeObserver - Terminating hanging client %{public}@[%d] [aborted: dead connection]", (uint8_t *)&v9, 0x12u);
    }
  }
}

void __67___MLChangeObserver_terminateForFailureToPerformDatabasePathChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - terminateForFailureToPerformDatabasePathChange - Unable to retrieve remote object proxy - error=%{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 12);
  id v5 = a3;
  os_unfair_lock_lock(v4);
  [*(id *)(a1 + 32) tearDownTaskAssertion];
  [*(id *)(a1 + 32) tearDownTimeoutTimer];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - performDatabasePathChange: - Unable to retrieve remote object proxy - error=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58___MLChangeObserver_performDatabasePathChange_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - performDatabasePathChange: [done]", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end