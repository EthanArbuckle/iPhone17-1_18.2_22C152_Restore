@interface ISKVOProxyManager
+ (ISKVOProxyManager)sharedManager;
- (ISKVOProxyManager)init;
- (id)addProxyWithTarget:(id)a3 queue:(id)a4 keyPaths:(id)a5 delegate:(id)a6;
- (void)removeProxyWithIdentifier:(id)a3;
@end

@implementation ISKVOProxyManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsQueue, 0);

  objc_storeStrong((id *)&self->_recordsByIdentifier, 0);
}

- (void)removeProxyWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    recordsQueue = self->_recordsQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke;
    v7[3] = &unk_1E6BECF48;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(recordsQueue, v7);
  }
}

void __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = [v2 queue];
    id v4 = [v2 proxy];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke_2;
    block[3] = &unk_1E6BECD80;
    id v7 = v4;
    id v5 = v4;
    dispatch_async(v3, block);
  }
}

uint64_t __47__ISKVOProxyManager_removeProxyWithIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObservingTarget];
}

- (id)addProxyWithTarget:(id)a3 queue:(id)a4 keyPaths:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v11 = (void *)MEMORY[0x1E4F29128];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = [v11 UUID];
  v16 = [v15 UUIDString];

  v17 = [[ISKVOProxy alloc] initWithTarget:v14 keyPaths:v13 identifier:v16 delegate:v12];
  v18 = [[ISKVOProxyRecord alloc] initWithProxy:v17 queue:v10];
  recordsQueue = self->_recordsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke;
  block[3] = &unk_1E6BEC5F8;
  void block[4] = self;
  id v20 = v16;
  id v28 = v20;
  v29 = v18;
  id v30 = v10;
  v31 = v17;
  v21 = v17;
  id v22 = v10;
  v23 = v18;
  dispatch_async(recordsQueue, block);
  v24 = v31;
  id v25 = v20;

  return v25;
}

void __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke_2;
  block[3] = &unk_1E6BECD80;
  v2 = *(NSObject **)(a1 + 56);
  id v4 = *(id *)(a1 + 64);
  dispatch_async(v2, block);
}

uint64_t __64__ISKVOProxyManager_addProxyWithTarget_queue_keyPaths_delegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObservingTarget];
}

- (ISKVOProxyManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ISKVOProxyManager;
  v2 = [(ISKVOProxyManager *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recordsByIdentifier = v2->_recordsByIdentifier;
    v2->_recordsByIdentifier = v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.photosplayer.kvoproxyrecords", v5);
    recordsQueue = v2->_recordsQueue;
    v2->_recordsQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (ISKVOProxyManager)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_562);
  }
  v2 = (void *)sharedManager_sharedInstance;

  return (ISKVOProxyManager *)v2;
}

uint64_t __34__ISKVOProxyManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(ISKVOProxyManager);
  uint64_t v1 = sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end