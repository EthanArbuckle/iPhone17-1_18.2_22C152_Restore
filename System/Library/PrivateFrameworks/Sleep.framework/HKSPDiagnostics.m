@interface HKSPDiagnostics
- (HKSPDiagnostics)initWithLabel:(id)a3;
- (HKSPObserverSet)providers;
- (NSString)label;
- (void)_registerStateHandler;
- (void)addProvider:(id)a3;
- (void)removeProvider:(id)a3;
@end

@implementation HKSPDiagnostics

- (HKSPDiagnostics)initWithLabel:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPDiagnostics;
  v5 = [(HKSPDiagnostics *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    v8 = [HKSPObserverSet alloc];
    v9 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
    uint64_t v10 = [(HKSPObserverSet *)v8 initWithCallbackScheduler:v9];
    providers = v5->_providers;
    v5->_providers = (HKSPObserverSet *)v10;

    [(HKSPDiagnostics *)v5 _registerStateHandler];
    v12 = v5;
  }

  return v5;
}

- (void)addProvider:(id)a3
{
  if (a3) {
    -[HKSPObserverSet addObserver:](self->_providers, "addObserver:");
  }
}

- (void)removeProvider:(id)a3
{
  if (a3) {
    -[HKSPObserverSet removeObserver:](self->_providers, "removeObserver:");
  }
}

- (void)_registerStateHandler
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(0, 0);
  objc_copyWeak(&v3, &location);
  os_state_add_handler();

  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

_DWORD *__40__HKSPDiagnostics__registerStateHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    v5 = (void *)MEMORY[0x1AD0DD020]();
    uint64_t v6 = HKSPLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = (id)objc_opt_class();
      id v7 = v25;
      _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing os_state handler", buf, 0xCu);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = (void *)WeakRetained[2];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __40__HKSPDiagnostics__registerStateHandler__block_invoke_279;
    v22[3] = &unk_1E5D31CC0;
    id v10 = v8;
    id v23 = v10;
    [v9 enumerateObserversWithBlock:v22];
    id v21 = 0;
    v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:&v21];
    id v12 = v21;
    unsigned int v13 = [v11 length];
    if (v12)
    {
      objc_super v14 = HKSPLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v25 = v19;
        __int16 v26 = 2114;
        id v27 = v12;
        id v20 = v19;
        _os_log_error_impl(&dword_1A7E74000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] error serializing state data: %{public}@", buf, 0x16u);
      }
      v15 = 0;
    }
    else
    {
      unsigned int v16 = v13;
      size_t v17 = v13;
      v15 = malloc_type_calloc(1uLL, v13 + 200, 0x9D6632C7uLL);
      _DWORD *v15 = 1;
      v15[1] = v16;
      [*(id *)(*(void *)(a1 + 32) + 8) UTF8String];
      __strlcpy_chk();
      memcpy(v15 + 50, (const void *)[v11 bytes], v17);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __40__HKSPDiagnostics__registerStateHandler__block_invoke_279(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v9 diagnosticInfo];
    id v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F1CC08];
    }
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v6 setObject:v5 forKeyedSubscript:v8];
  }
}

- (NSString)label
{
  return self->_label;
}

- (HKSPObserverSet)providers
{
  return self->_providers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end