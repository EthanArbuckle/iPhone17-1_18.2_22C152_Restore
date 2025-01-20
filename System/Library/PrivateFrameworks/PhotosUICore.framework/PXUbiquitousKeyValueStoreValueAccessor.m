@interface PXUbiquitousKeyValueStoreValueAccessor
+ (id)_defaultQueue;
- (NSString)key;
- (NSUbiquitousKeyValueStore)ubiquitousKeyValueStore;
- (OS_dispatch_queue)storeQueue;
- (PXUbiquitousKeyValueStoreValueAccessor)init;
- (PXUbiquitousKeyValueStoreValueAccessor)initWithUbiquitousKeyValueStore:(id)a3 key:(id)a4 defaultValueFuture:(id)a5 valueFilter:(id)a6 changeHandler:(id)a7;
- (id)_currentValueLoadIfNeeded:(BOOL)a3;
- (id)cachedValue;
- (id)currentValue;
- (id)currentValueIfLoaded;
- (id)description;
- (void)_keyValueStoreDidChangeExternally:(id)a3;
- (void)_setCurrentValue:(id)a3 updateUbiquitousKeyValueStore:(BOOL)a4 notifyChange:(BOOL)a5;
- (void)_storeQueue_handleLoadValueAsync;
- (void)loadValueAsyncIfNeeded;
- (void)setCachedValue:(id)a3;
- (void)setCurrentValue:(id)a3;
@end

@implementation PXUbiquitousKeyValueStoreValueAccessor

uint64_t __64__PXUbiquitousKeyValueStoreValueAccessor_loadValueAsyncIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeQueue_handleLoadValueAsync");
}

- (void)_storeQueue_handleLoadValueAsync
{
  id v3 = [(PXUbiquitousKeyValueStoreValueAccessor *)self _currentValueLoadIfNeeded:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PXUbiquitousKeyValueStoreValueAccessor__storeQueue_handleLoadValueAsync__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)loadValueAsyncIfNeeded
{
  id v3 = [(PXUbiquitousKeyValueStoreValueAccessor *)self currentValueIfLoaded];

  if (!v3)
  {
    v4 = self;
    v5 = [(PXUbiquitousKeyValueStoreValueAccessor *)v4 storeQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PXUbiquitousKeyValueStoreValueAccessor_loadValueAsyncIfNeeded__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __74__PXUbiquitousKeyValueStoreValueAccessor__storeQueue_handleLoadValueAsync__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[3];
  id v3 = [v1 currentValue];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_currentValueLoadIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v6 = [(PXUbiquitousKeyValueStoreValueAccessor *)self cachedValue];
  if (!v6 && v3)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = [(PXUbiquitousKeyValueStoreValueAccessor *)v7 cachedValue];

    if (!v8)
    {
      v9 = [(PXUbiquitousKeyValueStoreValueAccessor *)v7 ubiquitousKeyValueStore];
      v10 = [(PXUbiquitousKeyValueStoreValueAccessor *)v7 key];
      v11 = [v9 objectForKey:v10];
      [(PXUbiquitousKeyValueStoreValueAccessor *)v7 setCachedValue:v11];

      v12 = [(PXUbiquitousKeyValueStoreValueAccessor *)v7 cachedValue];

      if (!v12)
      {
        v13 = (*((void (**)(void))v7->_defaultValueFuture + 2))();
        [(PXUbiquitousKeyValueStoreValueAccessor *)v7 _setCurrentValue:v13 updateUbiquitousKeyValueStore:1 notifyChange:0];
        id defaultValueFuture = v7->_defaultValueFuture;
        v7->_id defaultValueFuture = 0;
      }
      v15 = [(PXUbiquitousKeyValueStoreValueAccessor *)v7 cachedValue];

      if (!v15)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2, v7, @"PXUbiquitousKeyValueStoreValueAccessor.m", 97, @"Invalid parameter not satisfying: %@", @"self.cachedValue != nil" object file lineNumber description];
      }
    }
    v6 = [(PXUbiquitousKeyValueStoreValueAccessor *)v7 cachedValue];
    objc_sync_exit(v7);
  }
  return v6;
}

- (id)cachedValue
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)currentValue
{
  return [(PXUbiquitousKeyValueStoreValueAccessor *)self _currentValueLoadIfNeeded:1];
}

- (NSUbiquitousKeyValueStore)ubiquitousKeyValueStore
{
  return self->_ubiquitousKeyValueStore;
}

- (void)setCachedValue:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

- (id)currentValueIfLoaded
{
  return [(PXUbiquitousKeyValueStoreValueAccessor *)self _currentValueLoadIfNeeded:0];
}

- (PXUbiquitousKeyValueStoreValueAccessor)initWithUbiquitousKeyValueStore:(id)a3 key:(id)a4 defaultValueFuture:(id)a5 valueFilter:(id)a6 changeHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXUbiquitousKeyValueStoreValueAccessor;
  v18 = [(PXUbiquitousKeyValueStoreValueAccessor *)&v32 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_ubiquitousKeyValueStore, a3);
    uint64_t v20 = [v14 copy];
    key = v19->_key;
    v19->_key = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    id defaultValueFuture = v19->_defaultValueFuture;
    v19->_id defaultValueFuture = (id)v22;

    uint64_t v24 = [v16 copy];
    id valueFilter = v19->_valueFilter;
    v19->_id valueFilter = (id)v24;

    uint64_t v26 = [v17 copy];
    id changeHandler = v19->_changeHandler;
    v19->_id changeHandler = (id)v26;

    uint64_t v28 = [(id)objc_opt_class() _defaultQueue];
    storeQueue = v19->_storeQueue;
    v19->_storeQueue = (OS_dispatch_queue *)v28;

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v19 selector:sel__keyValueStoreDidChangeExternally_ name:*MEMORY[0x1E4F28A30] object:v19->_ubiquitousKeyValueStore];
  }
  return v19;
}

+ (id)_defaultQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PXUbiquitousKeyValueStoreValueAccessor__defaultQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_defaultQueue_onceToken != -1) {
    dispatch_once(&_defaultQueue_onceToken, block);
  }
  uint64_t v2 = (void *)_defaultQueue_defaultQueue;
  return v2;
}

void __55__PXUbiquitousKeyValueStoreValueAccessor__defaultQueue__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v6 = objc_claimAutoreleasedReturnValue();
  v1 = (const char *)[v6 UTF8String];
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  BOOL v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v4 = dispatch_queue_create(v1, v3);
  v5 = (void *)_defaultQueue_defaultQueue;
  _defaultQueue_defaultQueue = (uint64_t)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_ubiquitousKeyValueStore, 0);
  objc_storeStrong(&self->_cachedValue, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_valueFilter, 0);
  objc_storeStrong(&self->_defaultValueFuture, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  dispatch_queue_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(PXUbiquitousKeyValueStoreValueAccessor *)self key];
  v7 = (void *)[v3 initWithFormat:@"<%@: %p, key: %@>", v5, self, v6];

  return v7;
}

- (void)_keyValueStoreDidChangeExternally:(id)a3
{
  dispatch_queue_t v4 = [a3 userInfo];
  id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A28]];

  v5 = [(PXUbiquitousKeyValueStoreValueAccessor *)self key];
  if ([v8 containsObject:v5])
  {
    id v6 = [(PXUbiquitousKeyValueStoreValueAccessor *)self ubiquitousKeyValueStore];
    v7 = [v6 objectForKey:v5];
    if (v7) {
      [(PXUbiquitousKeyValueStoreValueAccessor *)self _setCurrentValue:v7 updateUbiquitousKeyValueStore:0 notifyChange:1];
    }
    else {
      NSLog(&cfstr_UnexpectedlyRe_0.isa, v6, v5);
    }
  }
}

- (void)_setCurrentValue:(id)a3 updateUbiquitousKeyValueStore:(BOOL)a4 notifyChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXUbiquitousKeyValueStoreValueAccessor.m", 111, @"Invalid parameter not satisfying: %@", @"currentValue != nil" object file lineNumber description];
  }
  v10 = self;
  objc_sync_enter(v10);
  v11 = [(PXUbiquitousKeyValueStoreValueAccessor *)v10 cachedValue];
  if (v11 && !(*((unsigned int (**)(void))v10->_valueFilter + 2))())
  {

    objc_sync_exit(v10);
  }
  else
  {
    [(PXUbiquitousKeyValueStoreValueAccessor *)v10 setCachedValue:v9];
    if (v6)
    {
      v12 = [(PXUbiquitousKeyValueStoreValueAccessor *)v10 storeQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__PXUbiquitousKeyValueStoreValueAccessor__setCurrentValue_updateUbiquitousKeyValueStore_notifyChange___block_invoke;
      block[3] = &unk_1E5DD32A8;
      block[4] = v10;
      id v15 = v9;
      dispatch_async(v12, block);
    }
    objc_sync_exit(v10);

    if (v5)
    {
      v9;
      px_dispatch_on_main_queue();
    }
  }
}

void __102__PXUbiquitousKeyValueStoreValueAccessor__setCurrentValue_updateUbiquitousKeyValueStore_notifyChange___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) ubiquitousKeyValueStore];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) key];
  [v4 setObject:v2 forKey:v3];
}

uint64_t __102__PXUbiquitousKeyValueStoreValueAccessor__setCurrentValue_updateUbiquitousKeyValueStore_notifyChange___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

- (void)setCurrentValue:(id)a3
{
}

- (PXUbiquitousKeyValueStoreValueAccessor)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXUbiquitousKeyValueStoreValueAccessor.m", 26, @"%s is not available as initializer", "-[PXUbiquitousKeyValueStoreValueAccessor init]");

  abort();
}

@end