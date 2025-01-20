@interface MTIDCloudKitPromiseManager
- (MTIDCloudKitPromiseManager)initWithCallbackQueue:(id)a3;
- (NSMutableDictionary)dict;
- (OS_dispatch_queue)callbackQueue;
- (id)waitForRecordToSync:(id)a3 timeout:(double)a4;
- (void)finishPromisesOfRecord:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDict:(id)a3;
@end

@implementation MTIDCloudKitPromiseManager

- (MTIDCloudKitPromiseManager)initWithCallbackQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTIDCloudKitPromiseManager;
  v5 = [(MTIDCloudKitPromiseManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(MTIDCloudKitPromiseManager *)v5 setCallbackQueue:v4];
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTIDCloudKitPromiseManager *)v6 setDict:v7];
  }
  return v6;
}

- (id)waitForRecordToSync:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  if (objc_msgSend(v6, "mt_isSynchronized"))
  {
    v7 = +[MTPromise promiseWithResult:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = [v6 recordID];
    objc_super v9 = [v8 recordName];

    v10 = [MTPromiseWithTimeout alloc];
    v11 = [(MTIDCloudKitPromiseManager *)self callbackQueue];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __58__MTIDCloudKitPromiseManager_waitForRecordToSync_timeout___block_invoke;
    v22 = &unk_264310910;
    id v23 = v6;
    objc_copyWeak(&v25, &location);
    id v12 = v9;
    id v24 = v12;
    v13 = [(MTPromiseWithTimeout *)v10 initWithTimeout:v11 queue:&v19 timeoutBlock:a4];

    v14 = self;
    objc_sync_enter(v14);
    v15 = [(MTIDCloudKitPromiseManager *)v14 dict];
    v16 = [v15 objectForKeyedSubscript:v12];

    if (!v16)
    {
      v16 = [MEMORY[0x263EFF980] array];
      v17 = [(MTIDCloudKitPromiseManager *)v14 dict];
      [v17 setObject:v16 forKeyedSubscript:v12];
    }
    [v16 addObject:v13];

    objc_sync_exit(v14);
    v7 = [(MTPromiseWithTimeout *)v13 promise];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __58__MTIDCloudKitPromiseManager_waitForRecordToSync_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 finishWithResult:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    id v6 = [v5 dict];
    v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];

    [v7 removeObject:v8];
    objc_sync_exit(v5);
  }
}

- (void)finishPromisesOfRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  id v6 = [v5 recordName];

  v7 = self;
  objc_sync_enter(v7);
  id v8 = [(MTIDCloudKitPromiseManager *)v7 dict];
  objc_super v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    v10 = [(MTIDCloudKitPromiseManager *)v7 dict];
    [v10 setObject:0 forKeyedSubscript:v6];

    objc_sync_exit(v7);
    v11 = [(MTIDCloudKitPromiseManager *)v7 callbackQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__MTIDCloudKitPromiseManager_finishPromisesOfRecord___block_invoke;
    v12[3] = &unk_264310378;
    id v13 = v9;
    id v14 = v4;
    dispatch_async(v11, v12);
  }
  else
  {
    objc_sync_exit(v7);
  }
}

void __53__MTIDCloudKitPromiseManager_finishPromisesOfRecord___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "finishWithResult:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_dict, 0);
}

@end