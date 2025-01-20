@interface NRRegistry
+ (id)_nextToken;
+ (id)getReferencedSecureProperties:(id)a3 fromDiff:(id)a4;
+ (id)getReferencedSecurePropertyIDsFromDiff:(id)a3;
+ (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5;
+ (unint64_t)readNotifyToken:(int)a3;
+ (void)fixSecurePropertiesWithCollection:(id)a3 secureProperties:(id)a4 insecurePropertyNames:(id)a5;
- (BOOL)enqueueUnlessSuspended:(id)a3;
- (BOOL)supportsWatch;
- (NRMutableDeviceCollection)collection;
- (NRMutableDeviceCollection)queueCollection;
- (NRRegistry)init;
- (NRRegistry)initWithParameters:(id)a3;
- (NRSecureDevicePropertyStore)secureProperties;
- (OS_dispatch_queue)managementQueue;
- (id)addDiffObserverWithWriteBlock:(id)a3;
- (id)addSecurePropertiesObserverWithReadBlock:(id)a3;
- (void)_notifyDiffObserversWithDiff:(id)a3 deviceCollection:(id)a4 secureProperties:(id)a5;
- (void)_notifyObserversSecurePropertiesAreAvailableWithCollection:(id)a3 secureProperties:(id)a4;
- (void)_startQueue;
- (void)deasyncGrabRegistryWithReadBlock:(id)a3;
- (void)deasyncGrabRegistryWithWriteBlock:(id)a3;
- (void)enqueue:(id)a3;
- (void)enqueueAsync:(id)a3;
- (void)enqueueBypass:(id)a3;
- (void)enqueueBypassAsync:(id)a3;
- (void)grabRegistryWithReadBlock:(id)a3;
- (void)grabRegistryWithReadBlockAsync:(id)a3;
- (void)grabRegistryWithWriteBlockAsync:(id)a3;
- (void)invalidate;
- (void)performUnderCollectionLock:(id)a3;
- (void)removeDiffObserver:(id)a3;
- (void)removeSecurePropertiesObserver:(id)a3;
- (void)setCollection:(id)a3;
- (void)setQueueCollection:(id)a3;
- (void)setSecureProperties:(id)a3;
@end

@implementation NRRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueCollection, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_secureProperties, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_registrySecurePropertyObservers, 0);

  objc_storeStrong((id *)&self->_registryDiffObservers, 0);
}

- (void)setSecureProperties:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__NRRegistry_setSecureProperties___block_invoke;
  v6[3] = &unk_1E5B002A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v6];
}

uint64_t __34__NRRegistry_setSecureProperties___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _notifyObserversSecurePropertiesAreAvailableWithCollection:a2 secureProperties:a3];
}

- (NRRegistry)initWithParameters:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NRRegistry;
  id v5 = [(NRRegistry *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"NRRegistryPlatformSupportsWatch"];
    id v7 = v6;
    if (v6)
    {
      char v8 = [v6 BOOLValue];
    }
    else
    {
      self;
      if (qword_1EB30BAE0 != -1) {
        dispatch_once(&qword_1EB30BAE0, &__block_literal_global_7);
      }
      char v8 = _MergedGlobals_10 != 0;
    }
    v5->_supportsWatch = v8;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanoregistry.registry.managementqueue", v9);
    managementQueue = v5->_managementQueue;
    v5->_managementQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(NRBypassQueue);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = v12;

    [(NRBypassQueue *)v5->_accessQueue suspend];
    v14 = [v4 objectForKeyedSubscript:@"NRRegistryShouldCreateCollection"];
    v15 = v14;
    if (!v14 || [v14 BOOLValue])
    {
      v16 = objc_opt_new();
      [(NRRegistry *)v5 setCollection:v16];
    }
  }

  return v5;
}

- (BOOL)supportsWatch
{
  return self->_supportsWatch;
}

- (BOOL)enqueueUnlessSuspended:(id)a3
{
  BOOL queueRunning = self->_queueRunning;
  if (self->_queueRunning) {
    [(NRBypassQueue *)self->_accessQueue enqueueBlock:a3];
  }
  return queueRunning;
}

- (NRMutableDeviceCollection)collection
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__NRRegistry_collection__block_invoke;
  v4[3] = &unk_1E5B00C68;
  v4[4] = self;
  v4[5] = &v5;
  [(NRRegistry *)self performUnderCollectionLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRMutableDeviceCollection *)v2;
}

- (NRSecureDevicePropertyStore)secureProperties
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__NRRegistry_secureProperties__block_invoke;
  v4[3] = &unk_1E5B00C68;
  v4[4] = self;
  v4[5] = &v5;
  [(NRRegistry *)self performUnderCollectionLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRSecureDevicePropertyStore *)v2;
}

- (void)performUnderCollectionLock:(id)a3
{
  p_collectionLock = &self->_collectionLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_collectionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_collectionLock);
}

void __30__NRRegistry_secureProperties__block_invoke(uint64_t a1)
{
}

void __24__NRRegistry_collection__block_invoke(uint64_t a1)
{
}

- (OS_dispatch_queue)managementQueue
{
  return self->_managementQueue;
}

uint64_t __28__NRRegistry_setCollection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setQueueCollection:*(void *)(a1 + 40)];
}

- (void)setCollection:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__NRRegistry_setCollection___block_invoke;
  v6[3] = &unk_1E5B002A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v6];
}

void __90__NRRegistry__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

void __44__NRRegistry_addDiffObserverWithWriteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() _nextToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;
  }
  id v9 = (id)[*(id *)(a1 + 40) copy];
  char v8 = (void *)MEMORY[0x1A624A7E0]();
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() _nextToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;
  }
  id v9 = (id)[*(id *)(a1 + 40) copy];
  char v8 = (void *)MEMORY[0x1A624A7E0]();
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v8 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

+ (id)_nextToken
{
  return (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
}

- (void)setQueueCollection:(id)a3
{
  id v5 = a3;
  [v5 setParentDelegate:self];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __33__NRRegistry_setQueueCollection___block_invoke;
  id v10 = &unk_1E5B01AB8;
  objc_copyWeak(&v11, &location);
  id v6 = (id)[v5 addObserverQueue:0 withBlock:&v7];
  objc_storeStrong((id *)&self->_collection, a3);
  [(NRRegistry *)self _startQueue];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_startQueue
{
  if (!self->_queueRunning)
  {
    self->_BOOL queueRunning = 1;
    [(NRBypassQueue *)self->_accessQueue resume];
  }
}

+ (int)registerNotifyTokenWithName:(id)a3 withQueue:(id)a4 withBlock:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = a4;
  id v9 = a5;
  int out_token = -1;
  id v10 = v7;
  id v11 = (const char *)[v10 UTF8String];
  if (v9)
  {
    if (!notify_register_dispatch(v11, &out_token, v8, v9)) {
      goto LABEL_9;
    }
  }
  else if (!notify_register_check(v11, &out_token))
  {
    goto LABEL_9;
  }
  v12 = nr_framework_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

  if (v13)
  {
    v14 = nr_framework_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_error_impl(&dword_1A356E000, v14, OS_LOG_TYPE_ERROR, "Failed to register block and get notify token for %@", buf, 0xCu);
    }
  }
LABEL_9:
  int v15 = out_token;

  return v15;
}

uint64_t __34__NRRegistry_setSecureProperties___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__NRRegistry_setSecureProperties___block_invoke_2;
  v4[3] = &unk_1E5B013C0;
  v4[4] = v2;
  return [v2 grabRegistryWithReadBlockAsync:v4];
}

- (void)enqueueBypassAsync:(id)a3
{
}

void __28__NRRegistry__supportsWatch__block_invoke()
{
  if (MGGetBoolAnswer())
  {
    if (_NRIsDemoModeEnabled())
    {
      _MergedGlobals_10 = 1;
    }
    else
    {
      id v1 = (id)MGGetStringAnswer();
      if ([v1 isEqualToString:@"Watch"]) {
        char v0 = 1;
      }
      else {
        char v0 = MGGetBoolAnswer();
      }
      _MergedGlobals_10 = v0;
    }
  }
}

- (NRRegistry)init
{
  return [(NRRegistry *)self initWithParameters:0];
}

- (id)addSecurePropertiesObserverWithReadBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke;
  v9[3] = &unk_1E5B00C40;
  id v11 = &v12;
  v9[4] = self;
  id v5 = v4;
  id v10 = v5;
  [(NRRegistry *)self performUnderCollectionLock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke_2;
  v8[3] = &unk_1E5B013C0;
  v8[4] = self;
  [(NRRegistry *)self grabRegistryWithReadBlock:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

- (id)addDiffObserverWithWriteBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__5;
  int v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__NRRegistry_addDiffObserverWithWriteBlock___block_invoke;
  v8[3] = &unk_1E5B00C40;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(NRRegistry *)self performUnderCollectionLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)grabRegistryWithReadBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__NRRegistry_grabRegistryWithReadBlock___block_invoke;
  v6[3] = &unk_1E5B00058;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self enqueue:v6];
}

- (void)enqueue:(id)a3
{
}

void __40__NRRegistry_grabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) collection];
  uint64_t v3 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)_notifyObserversSecurePropertiesAreAvailableWithCollection:(id)a3 secureProperties:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NRRegistry *)self secureProperties];

  if (v8)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    id v25 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__NRRegistry__notifyObserversSecurePropertiesAreAvailableWithCollection_secureProperties___block_invoke;
    v19[3] = &unk_1E5B00C68;
    v19[4] = self;
    v19[5] = &v20;
    [(NRRegistry *)self performUnderCollectionLock:v19];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = (id)v21[5];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend((id)v21[5], "objectForKeyedSubscript:", v13, (void)v15);
          uint64_t v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, id, id, uint64_t))v14)[2](v14, v6, v7, v13);
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v26 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(&v20, 8);
  }
}

uint64_t __55__NRRegistry_addSecurePropertiesObserverWithReadBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _notifyObserversSecurePropertiesAreAvailableWithCollection:a2 secureProperties:a3];
}

- (void)deasyncGrabRegistryWithReadBlock:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NRRegistry_sync__deasyncGrabRegistryWithReadBlock___block_invoke;
  v8[3] = &unk_1E5B00740;
  dispatch_semaphore_t v9 = v5;
  id v10 = v4;
  id v6 = v5;
  id v7 = v4;
  [(NRRegistry *)self grabRegistryWithReadBlockAsync:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __53__NRRegistry_sync__deasyncGrabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)deasyncGrabRegistryWithWriteBlock:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__NRRegistry_sync__deasyncGrabRegistryWithWriteBlock___block_invoke;
  v8[3] = &unk_1E5B00768;
  dispatch_semaphore_t v9 = v5;
  id v10 = v4;
  id v6 = v5;
  id v7 = v4;
  [(NRRegistry *)self grabRegistryWithWriteBlockAsync:v8];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

id __54__NRRegistry_sync__deasyncGrabRegistryWithWriteBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = (id)[v3 applyDiff:v4];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

  return v4;
}

void __33__NRRegistry_setQueueCollection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained collection];
  id v5 = [WeakRetained secureProperties];
  [WeakRetained _notifyDiffObserversWithDiff:v3 deviceCollection:v4 secureProperties:v5];

  [WeakRetained _notifyObserversSecurePropertiesAreAvailableWithCollection:v4 secureProperties:v5];
}

- (void)enqueueAsync:(id)a3
{
}

- (void)enqueueBypass:(id)a3
{
}

- (void)grabRegistryWithReadBlockAsync:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NRRegistry_grabRegistryWithReadBlockAsync___block_invoke;
  v6[3] = &unk_1E5B00058;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self enqueueAsync:v6];
}

void __45__NRRegistry_grabRegistryWithReadBlockAsync___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) collection];
  id v3 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)grabRegistryWithWriteBlockAsync:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__5;
  v9[4] = __Block_byref_object_dispose__5;
  id v10 = (id)os_transaction_create();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NRRegistry_grabRegistryWithWriteBlockAsync___block_invoke;
  v6[3] = &unk_1E5B00BF0;
  id v5 = v4;
  v6[4] = self;
  id v7 = v5;
  uint64_t v8 = v9;
  [(NRRegistry *)self enqueueAsync:v6];

  _Block_object_dispose(v9, 8);
}

void __46__NRRegistry_grabRegistryWithWriteBlockAsync___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) collection];
  id v4 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    id v5 = [*(id *)(a1 + 32) collection];
    id v6 = (id)[v5 applyDiff:v9];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (void)removeDiffObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__NRRegistry_removeDiffObserver___block_invoke;
  v6[3] = &unk_1E5B002A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v6];
}

uint64_t __33__NRRegistry_removeDiffObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)_notifyDiffObserversWithDiff:(id)a3 deviceCollection:(id)a4 secureProperties:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__NRRegistry__notifyDiffObserversWithDiff_deviceCollection_secureProperties___block_invoke;
  v21[3] = &unk_1E5B00C68;
  v21[4] = self;
  v21[5] = &v22;
  [(NRRegistry *)self performUnderCollectionLock:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = (id)v23[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend((id)v23[5], "objectForKeyedSubscript:", v15, (void)v17);
        long long v16 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id, id, id, uint64_t))v16)[2](v16, v8, v9, v10, v15);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __77__NRRegistry__notifyDiffObserversWithDiff_deviceCollection_secureProperties___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)removeSecurePropertiesObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__NRRegistry_removeSecurePropertiesObserver___block_invoke;
  v6[3] = &unk_1E5B002A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v6];
}

uint64_t __45__NRRegistry_removeSecurePropertiesObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  uint64_t v3 = [(NRRegistry *)self managementQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__NRRegistry_invalidate__block_invoke;
  block[3] = &unk_1E5B00230;
  block[4] = self;
  dispatch_sync(v3, block);

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__NRRegistry_invalidate__block_invoke_2;
  v5[3] = &unk_1E5B00230;
  v5[4] = self;
  [(NRRegistry *)self enqueueAsync:v5];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__NRRegistry_invalidate__block_invoke_3;
  v4[3] = &unk_1E5B00230;
  v4[4] = self;
  [(NRRegistry *)self performUnderCollectionLock:v4];
  [(NRBypassQueue *)self->_accessQueue invalidate];
}

uint64_t __24__NRRegistry_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startQueue];
}

void __24__NRRegistry_invalidate__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collection];
  [v1 invalidate];
}

uint64_t __24__NRRegistry_invalidate__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v2 removeAllObjects];
}

+ (id)getReferencedSecurePropertyIDsFromDiff:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v30;
    uint64_t v21 = *(void *)v30;
    id v22 = v3;
    do
    {
      uint64_t v8 = 0;
      uint64_t v23 = v5;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * v8), v21, v22);
        if ([v9 changeType] != 2)
        {
          uint64_t v24 = v8;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v10 = [v9 diff];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v26 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
                long long v16 = [v9 diff];
                long long v17 = [v16 objectForKeyedSubscript:v15];

                if ([v17 changeType] != 2)
                {
                  long long v18 = [v17 diff];
                  long long v19 = [v18 value];

                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    if (!v6)
                    {
                      id v6 = [MEMORY[0x1E4F1CA48] array];
                    }
                    [v6 addObject:v19];
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v12);
          }

          uint64_t v7 = v21;
          id v3 = v22;
          uint64_t v5 = v23;
          uint64_t v8 = v24;
        }

        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)getReferencedSecureProperties:(id)a3 fromDiff:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 getReferencedSecurePropertyIDsFromDiff:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = [v6 objectForKeyedSubscript:v14];
        if (v15)
        {
          if (!v11)
          {
            uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
          }
          [v11 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (void)fixSecurePropertiesWithCollection:(id)a3 secureProperties:(id)a4 insecurePropertyNames:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v54 = a4;
  id v8 = a5;
  uint64_t v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    uint64_t v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[NRRegistry fixSecurePropertiesWithCollection:secureProperties:insecurePropertyNames:]";
      _os_log_impl(&dword_1A356E000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  v47 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v7;
  uint64_t v49 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v60;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v60 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = *(void *)(*((void *)&v59 + 1) + 8 * v12);
        uint64_t v52 = v12;
        uint64_t v13 = [obj objectForKeyedSubscript:v47];
        v53 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v63 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v56 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(const char **)(*((void *)&v55 + 1) + 8 * i);
              if (![v8 containsObject:v19]) {
                goto LABEL_51;
              }
              long long v20 = [v14 objectForKeyedSubscript:v19];
              uint64_t v21 = [v20 value];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                uint64_t v23 = nr_daemon_log();
                BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

                if (v24)
                {
                  long long v25 = nr_daemon_log();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v66 = v19;
                    _os_log_impl(&dword_1A356E000, v25, OS_LOG_TYPE_DEFAULT, "Property %@ was marked as secure but is now in allowlist, converting to insecure property", buf, 0xCu);
                  }
                }
                long long v26 = [v14 objectForKeyedSubscript:v19];
                long long v27 = [v26 value];

                uint64_t v28 = [v54 securePropertyForID:v27];
              }
              else
              {
LABEL_51:
                if ([v8 containsObject:v19]) {
                  continue;
                }
                long long v29 = [v14 objectForKeyedSubscript:v19];
                long long v30 = [v29 value];
                objc_opt_class();
                char v31 = objc_opt_isKindOfClass();

                if (v31) {
                  continue;
                }
                long long v32 = nr_daemon_log();
                BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

                if (v33)
                {
                  v34 = nr_daemon_log();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v66 = v19;
                    _os_log_impl(&dword_1A356E000, v34, OS_LOG_TYPE_DEFAULT, "Property %@ is not in allowlist and is stored as insecure, converting to secure property", buf, 0xCu);
                  }
                }
                uint64_t v35 = [v14 objectForKeyedSubscript:v19];
                long long v27 = [v35 value];

                uint64_t v28 = [v54 storeSecureProperty:v27];
              }
              v36 = (void *)v28;
              if (v28)
              {
                v37 = [[NRDevicePropertyDiff alloc] initWithValue:v28];
                v38 = [[NRDevicePropertyDiffType alloc] initWithDiff:v37 andChangeType:1];
                [v53 setObject:v38 forKeyedSubscript:v19];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v55 objects:v63 count:16];
          }
          while (v16);
        }

        if ([v53 count])
        {
          v39 = [[NRDeviceDiff alloc] initWithDiffPropertyDiffs:v53];
          v40 = [[NRDeviceDiffType alloc] initWithDiff:v39 andChangeType:1];
          [v47 setObject:v40 forKeyedSubscript:v51];
        }
        uint64_t v12 = v52 + 1;
      }
      while (v52 + 1 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v49);
  }

  uint64_t v41 = [v47 count];
  v42 = nr_daemon_log();
  BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

  if (v41)
  {
    if (v43)
    {
      v44 = nr_daemon_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "+[NRRegistry fixSecurePropertiesWithCollection:secureProperties:insecurePropertyNames:]";
        _os_log_impl(&dword_1A356E000, v44, OS_LOG_TYPE_DEFAULT, "%s: Updating some allowlisted properties", buf, 0xCu);
      }
    }
    v45 = [[NRDeviceCollectionDiff alloc] initWithDeviceCollectionDiffDeviceDiffs:v47];
    id v46 = (id)[obj applyDiff:v45];
  }
  else
  {
    if (!v43) {
      goto LABEL_45;
    }
    nr_daemon_log();
    v45 = (NRDeviceCollectionDiff *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v45->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[NRRegistry fixSecurePropertiesWithCollection:secureProperties:insecurePropertyNames:]";
      _os_log_impl(&dword_1A356E000, &v45->super.super, OS_LOG_TYPE_DEFAULT, "%s: Not updating any properties", buf, 0xCu);
    }
  }

LABEL_45:
}

+ (unint64_t)readNotifyToken:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (NRMutableDeviceCollection)queueCollection
{
  return self->_queueCollection;
}

@end