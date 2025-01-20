@interface ULDiagnostics
- (NSHashTable)providers;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (ULDiagnostics)init;
- (ULDiagnostics)initWithLabel:(id)a3;
- (id)_diagnosticsInfo;
- (os_state_data_s)_stateDataForInfo:(id)a3;
- (os_unfair_lock_s)providersLock;
- (unint64_t)stateHandle;
- (void)_registerStateHandler;
- (void)_withLock:(id)a3;
- (void)addProvider:(id)a3;
- (void)dealloc;
- (void)removeProvider:(id)a3;
- (void)setLabel:(id)a3;
- (void)setProviders:(id)a3;
- (void)setProvidersLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
@end

@implementation ULDiagnostics

- (ULDiagnostics)init
{
  uint64_t v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithLabel_);
}

- (ULDiagnostics)initWithLabel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ULDiagnostics;
  v5 = [(ULDiagnostics *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(ULDiagnostics *)v5 setLabel:v4];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.milod.ULDiagnostics", v7);
    [(ULDiagnostics *)v6 setQueue:v8];

    v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(ULDiagnostics *)v6 setProviders:v9];

    [(ULDiagnostics *)v6 setProvidersLock:0];
    [(ULDiagnostics *)v6 _registerStateHandler];
  }

  return v6;
}

- (void)dealloc
{
  [(ULDiagnostics *)self stateHandle];
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)ULDiagnostics;
  [(ULDiagnostics *)&v3 dealloc];
}

- (void)addProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__ULDiagnostics_addProvider___block_invoke;
  v6[3] = &unk_2653F9228;
  id v7 = v4;
  dispatch_queue_t v8 = self;
  id v5 = v4;
  [(ULDiagnostics *)self _withLock:v6];
}

void __29__ULDiagnostics_addProvider___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  }
  uint64_t v2 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    dispatch_queue_t v8 = v5;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Adding provider: %@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [*(id *)(a1 + 40) providers];
  [v6 addObject:*(void *)(a1 + 32)];
}

- (void)removeProvider:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__ULDiagnostics_removeProvider___block_invoke;
  v6[3] = &unk_2653F9228;
  id v7 = v4;
  dispatch_queue_t v8 = self;
  id v5 = v4;
  [(ULDiagnostics *)self _withLock:v6];
}

void __32__ULDiagnostics_removeProvider___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
  }
  uint64_t v2 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    dispatch_queue_t v8 = v5;
    _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Removing provider: %@", (uint8_t *)&v7, 0xCu);
  }
  v6 = [*(id *)(a1 + 40) providers];
  [v6 removeObject:*(void *)(a1 + 32)];
}

- (void)_registerStateHandler
{
  objc_initWeak(&location, self);
  objc_super v3 = [(ULDiagnostics *)self queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  objc_copyWeak(&v5, &location);
  -[ULDiagnostics setStateHandle:](self, "setStateHandle:", os_state_add_handler(), v4, 3221225472, __38__ULDiagnostics__registerStateHandler__block_invoke, &unk_2653F9CA8);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __38__ULDiagnostics__registerStateHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained queue];
  dispatch_assert_queue_V2(v4);

  if (*(_DWORD *)(a2 + 16) == 3)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    }
    id v5 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      int v7 = [WeakRetained label];
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "Processing os_state handler for label: %@", (uint8_t *)&v13, 0xCu);
    }
    dispatch_queue_t v8 = [WeakRetained _diagnosticsInfo];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    }
    uint64_t v9 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_super v11 = [WeakRetained label];
      int v13 = 138412546;
      v14 = v11;
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_25631F000, v10, OS_LOG_TYPE_DEFAULT, "label: %@, os_state: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return 0;
}

- (id)_diagnosticsInfo
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __33__ULDiagnostics__diagnosticsInfo__block_invoke;
  v19[3] = &unk_2653F9310;
  v19[4] = self;
  v19[5] = &v20;
  [(ULDiagnostics *)self _withLock:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)v21[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = MEMORY[0x263EFFA78];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "diagnosticInfo", (void)v15);
        v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v7;
        }
        v12 = (objc_class *)objc_opt_class();
        int v13 = NSStringFromClass(v12);
        [v3 setObject:v11 forKeyedSubscript:v13];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v20, 8);
  return v3;
}

void __33__ULDiagnostics__diagnosticsInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) providers];
  uint64_t v2 = [v5 allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (os_state_data_s)_stateDataForInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v13 = 0;
  id v4 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v13];
  id v5 = v13;
  unsigned int v6 = [v4 length];
  if (v5)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_68);
    }
    uint64_t v7 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_ERROR, "Error in NSPropertyListSerialization: %@", buf, 0xCu);
    }
    dispatch_queue_t v8 = 0;
  }
  else
  {
    unsigned int v9 = v6;
    size_t v10 = v6;
    dispatch_queue_t v8 = (os_state_data_s *)malloc_type_calloc(1uLL, v6 + 200, 0xA516B772uLL);
    v8->var0 = 1;
    v8->var1.var1 = v9;
    id v11 = [(ULDiagnostics *)self label];
    [v11 UTF8String];
    __strlcpy_chk();

    memcpy(v8->var4, (const void *)[v4 bytes], v10);
  }

  return v8;
}

- (void)_withLock:(id)a3
{
  p_providersLock = &self->_providersLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_providersLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_providersLock);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)providersLock
{
  return self->_providersLock;
}

- (void)setProvidersLock:(os_unfair_lock_s)a3
{
  self->_providersLock = a3;
}

- (NSHashTable)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end