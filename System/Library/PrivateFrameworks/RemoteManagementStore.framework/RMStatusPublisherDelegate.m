@interface RMStatusPublisherDelegate
+ (id)sharedDelegateWithPublisherClass:(Class)a3;
- (Class)publisherClass;
- (OS_dispatch_queue)publisherQueue;
- (RMStatusPublisherDelegate)initWithPublisherClass:(Class)a3;
- (id)_filterSupportedStatus:(id)a3 store:(id)a4 unsupported:(id)a5;
- (void)fetchStatusForStatusKeys:(id)a3 store:(id)a4 completionHandler:(id)a5;
- (void)setPublisherQueue:(id)a3;
@end

@implementation RMStatusPublisherDelegate

+ (id)sharedDelegateWithPublisherClass:(Class)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__RMStatusPublisherDelegate_sharedDelegateWithPublisherClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = a3;
  if (sharedDelegateWithPublisherClass__onceToken != -1) {
    dispatch_once(&sharedDelegateWithPublisherClass__onceToken, block);
  }
  v3 = (void *)sharedDelegateWithPublisherClass__delegate;
  return v3;
}

uint64_t __62__RMStatusPublisherDelegate_sharedDelegateWithPublisherClass___block_invoke(uint64_t a1)
{
  sharedDelegateWithPublisherClass__delegate = [[RMStatusPublisherDelegate alloc] initWithPublisherClass:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

- (RMStatusPublisherDelegate)initWithPublisherClass:(Class)a3
{
  v15.receiver = self;
  v15.super_class = (Class)RMStatusPublisherDelegate;
  v4 = [(RMStatusPublisherDelegate *)&v15 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_publisherClass, a3);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.rmstore.publisher", 0);
    publisherQueue = v5->_publisherQueue;
    v5->_publisherQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)MEMORY[0x263F635D0];
    v9 = NSString;
    v10 = NSStringFromClass([(RMStatusPublisherDelegate *)v5 publisherClass]);
    v11 = [v9 stringWithFormat:@"Shared lock for %@", v10];
    uint64_t v12 = [v8 newSharedLockWithDescription:v11];
    fetchLock = v5->_fetchLock;
    v5->_fetchLock = (RMSharedLock *)v12;
  }
  return v5;
}

- (void)fetchStatusForStatusKeys:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self->_fetchLock;
  [(RMSharedLock *)v11 lock];
  uint64_t v12 = NSStringFromClass([(RMStatusPublisherDelegate *)self publisherClass]);
  v13 = [MEMORY[0x263F635B0] statusPublisherDelegate];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = v12;
    __int16 v33 = 2114;
    id v34 = v8;
    _os_log_impl(&dword_25B003000, v13, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ starting processing status keys: %{public}@", buf, 0x16u);
  }

  v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  objc_super v15 = [(RMStatusPublisherDelegate *)self _filterSupportedStatus:v8 store:v9 unsupported:v14];
  if ([v14 count])
  {
    v16 = [MEMORY[0x263F635B0] statusPublisherDelegate];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v14 allKeys];
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      __int16 v33 = 2114;
      id v34 = v17;
      _os_log_impl(&dword_25B003000, v16, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ unsupported status keys: %{public}@", buf, 0x16u);
    }
  }
  if ([v15 count])
  {
    [(RMStatusPublisherDelegate *)self publisherClass];
    v18 = objc_opt_new();
    v19 = [(RMStatusPublisherDelegate *)self publisherQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke;
    v22[3] = &unk_26548FB78;
    id v23 = v18;
    id v24 = v15;
    id v25 = v9;
    id v26 = v12;
    id v27 = v8;
    id v28 = v14;
    id v30 = v10;
    v29 = v11;
    v20 = v18;
    dispatch_async(v19, v22);
  }
  else
  {
    v21 = [MEMORY[0x263F635B0] statusPublisherDelegate];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_impl(&dword_25B003000, v21, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ has no valid status keys to process", buf, 0xCu);
    }

    (*((void (**)(id, void *, void))v10 + 2))(v10, v14, 0);
    [(RMSharedLock *)v11 unlock];
    v20 = [MEMORY[0x263F635B0] statusPublisherDelegate];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25B003000, v20, OS_LOG_TYPE_DEFAULT, "Fetching complete.", buf, 2u);
    }
  }
}

void __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke_2;
  v5[3] = &unk_26548FB50;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 88);
  id v9 = *(id *)(a1 + 80);
  [v2 queryForStatusWithKeyPaths:v3 store:v4 completionHandler:v5];
}

void __78__RMStatusPublisherDelegate_fetchStatusForStatusKeys_store_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F635B0];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 statusPublisherDelegate];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    _os_log_impl(&dword_25B003000, v8, OS_LOG_TYPE_DEFAULT, "Publisher %{public}@ finished processing status keys: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  [*(id *)(a1 + 48) addEntriesFromDictionary:v7];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

  [*(id *)(a1 + 56) unlock];
  v11 = [MEMORY[0x263F635B0] statusPublisherDelegate];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_25B003000, v11, OS_LOG_TYPE_DEFAULT, "Fetching complete.", (uint8_t *)&v12, 2u);
  }
}

- (id)_filterSupportedStatus:(id)a3 store:(id)a4 unsupported:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = [MEMORY[0x263F63640] classForStatusItemType:v15];
        if (v16)
        {
          if ([v8 isValidStatusItem:v16])
          {
            [v20 addObject:v15];
            continue;
          }
          uint64_t v17 = [MEMORY[0x263F63598] createDisallowedStatusValueErrorWithKeyPath:v15];
        }
        else
        {
          uint64_t v17 = [MEMORY[0x263F63598] createUnsupportedStatusValueErrorWithKeyPath:v15];
        }
        v18 = (void *)v17;
        [v9 setObject:v17 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v20;
}

- (Class)publisherClass
{
  return self->_publisherClass;
}

- (OS_dispatch_queue)publisherQueue
{
  return self->_publisherQueue;
}

- (void)setPublisherQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherQueue, 0);
  objc_storeStrong((id *)&self->_publisherClass, 0);
  objc_storeStrong((id *)&self->_fetchLock, 0);
}

@end