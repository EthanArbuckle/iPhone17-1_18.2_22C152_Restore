@interface SKHelperClient
+ (id)sharedClient;
- (BOOL)_isRecachingDiskAbuse:(id)a3;
- (NSMutableDictionary)completionHandlers;
- (NSMutableDictionary)recacheAbuseLimiterInfo;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)xpcQueue;
- (SKHelperClient)init;
- (id)_parameters:(id)a3 valueAtIndex:(unint64_t)a4;
- (id)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 blocking:(BOOL)a5 withBlock:(id)a6;
- (id)_scheduleSyncCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5;
- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4;
- (id)queueWithBlocking:(BOOL)a3;
- (id)remoteObjectWithUUID:(id)a3 errorHandler:(id)a4;
- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5;
- (void)_abortAllCalls;
- (void)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5;
- (void)_scheduleCompletionUUID:(id)a3 progress:(id)a4 forFunction:(const char *)a5 withBlock:(id)a6;
- (void)childDisksForWholeDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5;
- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4;
- (void)createXPCConnection;
- (void)diskForPath:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5;
- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)ejectDisk:(id)a3 blocking:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)filesystemsWithBlocking:(BOOL)a3 callbackBlock:(id)a4;
- (void)filesystemsWithCallbackBlock:(id)a3;
- (void)initialPopulateComplete;
- (void)isBusy:(id)a3;
- (void)isBusyWithBlocking:(BOOL)a3 completionBlock:(id)a4;
- (void)managerResumed;
- (void)managerStalled;
- (void)mountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 completionBlock:(id)a6;
- (void)mountDisk:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (void)physicalStoresForAPFSVolume:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5;
- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 blocking:(BOOL)a5 callbackBlock:(id)a6;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5;
- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5;
- (void)requestWithUUID:(id)a3 didCompleteWithResult:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5;
- (void)setRecacheAbuseLimiterInfo:(id)a3;
- (void)syncAllDisksWithBlocking:(BOOL)a3 completionBlock:(id)a4;
- (void)syncAllDisksWithCompletionBlock:(id)a3;
- (void)unmountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 withCompletionBlock:(id)a6;
- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)updateUUID:(id)a3 progress:(float)a4 message:(id)a5;
- (void)volumesForAPFSPS:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5;
- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4;
- (void)wholeDiskForDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5;
- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4;
@end

@implementation SKHelperClient

+ (id)sharedClient
{
  if (sharedClient_once != -1) {
    dispatch_once(&sharedClient_once, &__block_literal_global_10);
  }
  v2 = (void *)sSharedClient;

  return v2;
}

uint64_t __30__SKHelperClient_sharedClient__block_invoke()
{
  sSharedClient = objc_alloc_init(SKHelperClient);

  return MEMORY[0x270F9A758]();
}

- (SKHelperClient)init
{
  v17.receiver = self;
  v17.super_class = (Class)SKHelperClient;
  v2 = [(SKHelperClient *)&v17 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(SKHelperClient *)v2 setRecacheAbuseLimiterInfo:v5];

    [(SKHelperClient *)v2 createXPCConnection];
    v6 = [(SKHelperClient *)v2 xpcConnection];
    uint64_t v7 = [v6 _queue];
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.StorageKit.Callbacks", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __22__SKHelperClient_init__block_invoke;
    v15 = &unk_26506C0B8;
    v16 = @"English";
    -[SKHelperClient setDaemonOptionsWithLanguage:authRef:withCompletionBlock:](v2, "setDaemonOptionsWithLanguage:authRef:withCompletionBlock:");
  }
  return v2;
}

void __22__SKHelperClient_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = SKGetOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v4;
      id v5 = "Connected to daemon. Language set to: %{public}@";
      v6 = v3;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_23F40C000, v6, v7, v5, (uint8_t *)&v10, v8);
    }
  }
  else
  {
    dispatch_queue_t v9 = +[SKBaseManager sharedManager];
    [v9 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_62];

    v3 = SKGetOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      id v5 = "Daemon failed to respond.";
      v6 = v3;
      os_log_type_t v7 = OS_LOG_TYPE_FAULT;
      uint32_t v8 = 2;
      goto LABEL_6;
    }
  }
}

id __22__SKHelperClient_init__block_invoke_59()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKHelperClient.m", 145);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (id)queueWithBlocking:(BOOL)a3
{
  if (a3) {
    [(SKHelperClient *)self xpcQueue];
  }
  else {
  v3 = [(SKHelperClient *)self callbackQueue];
  }

  return v3;
}

- (void)syncAllDisksWithBlocking:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  os_log_type_t v7 = [MEMORY[0x263F08C38] UUID];
  uint32_t v8 = [v7 UUIDString];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke;
  v16[3] = &unk_26506C0E0;
  id v18 = v6;
  v16[4] = self;
  id v9 = v8;
  id v17 = v9;
  id v10 = v6;
  uint64_t v11 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v9, "-[SKHelperClient syncAllDisksWithBlocking:completionBlock:]", v4, v16);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke_2;
  v14[3] = &unk_26506C108;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  uint64_t v13 = [(SKHelperClient *)self remoteObjectWithUUID:v12 errorHandler:v14];
  [v13 syncAllDisksWithCompletionUUID:v12];

  if (v11) {
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) completionHandlers];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v5 semaphore];
  os_log_type_t v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

uint64_t __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_26F31DBD0];
}

- (void)syncAllDisksWithCompletionBlock:(id)a3
{
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  uint64_t v11 = [v9 UUID];
  id v12 = [v11 UUIDString];

  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke;
  v22[3] = &unk_26506C130;
  v22[4] = self;
  id v23 = v8;
  id v13 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:withBlock:](self, "_scheduleCompletionUUID:forFunction:withBlock:", v12, "-[SKHelperClient setDaemonOptionsWithLanguage:authRef:withCompletionBlock:]", v22);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke_2;
  v19 = &unk_26506C108;
  v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = [(SKHelperClient *)self remoteObjectWithUUID:v14 errorHandler:&v16];
  objc_msgSend(v15, "setDaemonOptionsWithLanguage:authRef:withCompletionUUID:", v10, v5, v14, v16, v17, v18, v19, v20);
}

uint64_t __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _parameters:a2 valueAtIndex:0];
  [v3 BOOLValue];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_26F31DBE8];
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 UUID];
  id v13 = [v12 UUIDString];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke;
  v24[3] = &unk_26506C158;
  v24[4] = self;
  id v25 = v8;
  id v14 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:withBlock:](self, "_scheduleCompletionUUID:forFunction:withBlock:", v13, "-[SKHelperClient renameDisk:to:withCompletionBlock:]", v24);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke_2;
  id v21 = &unk_26506C108;
  v22 = self;
  id v23 = v13;
  id v15 = v13;
  uint64_t v16 = [(SKHelperClient *)self remoteObjectWithUUID:v15 errorHandler:&v18];
  uint64_t v17 = objc_msgSend(v11, "minimalDictionaryRepresentation", v18, v19, v20, v21, v22);

  [v16 renameDisk:v17 to:v10 withCompletionUUID:v15];
}

void __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 32) _parameters:a2 valueAtIndex:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  os_log_type_t v7 = a2;
  BOOL v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 blocking:(BOOL)a5 callbackBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if ((a4 & 2) != 0 || v7 || ![(SKHelperClient *)self _isRecachingDiskAbuse:v10])
  {
    id v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v16 = [v15 UUIDString];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_76;
    v27[3] = &unk_26506C0E0;
    id v29 = v11;
    v27[4] = self;
    id v17 = v16;
    id v28 = v17;
    id v14 = v11;
    uint64_t v18 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v17, "-[SKHelperClient recacheDisk:options:blocking:callbackBlock:]", v7, v27);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_2;
    v24 = &unk_26506C108;
    id v25 = self;
    id v13 = v17;
    id v26 = v13;
    uint64_t v19 = [(SKHelperClient *)self remoteObjectWithUUID:v13 errorHandler:&v21];
    v20 = objc_msgSend(v10, "minimalDictionaryRepresentation", v21, v22, v23, v24, v25);
    [v19 recacheDisk:v20 options:a4 withCompletionUUID:v13];

    if (v18) {
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    id v12 = [(SKHelperClient *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke;
    block[3] = &unk_26506BCC0;
    id v31 = v11;
    id v13 = v11;
    dispatch_async(v12, block);

    id v14 = v31;
  }
}

uint64_t __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke(uint64_t a1)
{
  v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_ERROR, "Caller has hit recacheDisk: abuse limit. Disk data may be stale", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_76(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) completionHandlers];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v5 semaphore];
  BOOL v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

uint64_t __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:MEMORY[0x263EFFA68]];
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5
{
}

- (void)diskForPath:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  id v11 = [v9 UUID];
  id v12 = [v11 UUIDString];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke;
  v24[3] = &unk_26506C1A8;
  v24[4] = self;
  id v13 = v12;
  id v25 = v13;
  id v26 = v8;
  BOOL v27 = v5;
  id v14 = v8;
  id v15 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v13, "-[SKHelperClient diskForPath:blocking:withCallbackBlock:]", v5, v24);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_3;
  uint64_t v21 = &unk_26506C108;
  uint64_t v22 = self;
  id v16 = v13;
  id v23 = v16;
  id v17 = [(SKHelperClient *)self remoteObjectWithUUID:v16 errorHandler:&v18];
  objc_msgSend(v17, "diskForPath:withCompletionUUID:", v10, v16, v18, v19, v20, v21, v22);

  if (v15) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) completionHandlers];
  BOOL v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v5 semaphore];

  if (*(void *)(a1 + 48))
  {
    BOOL v7 = [*(id *)(a1 + 32) _parameters:v3 valueAtIndex:0];
    id v8 = +[SKManager sharedManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2;
    v10[3] = &unk_26506C180;
    id v12 = *(id *)(a1 + 48);
    id v11 = v6;
    id v9 = objc_msgSend(*(id *)(a1 + 32), "queueWithBlocking:", *(unsigned __int8 *)(a1 + 56), v10[0], 3221225472, __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2, &unk_26506C180);
    [v8 knownDiskForDictionary:v7 notify:v10 onQueue:v9];
  }
  else if (v6)
  {
    dispatch_semaphore_signal(v6);
  }
}

NSObject *__57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(NSObject **)(a1 + 32);
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient diskForPath:blocking:withCallbackBlock:]_block_invoke_3";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = [MEMORY[0x263EFF9D0] null];
  id v9 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4
{
}

- (void)wholeDiskForDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  id v11 = [v9 UUID];
  __int16 v12 = [v11 UUIDString];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke;
  v25[3] = &unk_26506C1A8;
  v25[4] = self;
  id v13 = v12;
  id v26 = v13;
  id v27 = v8;
  BOOL v28 = v5;
  id v14 = v8;
  id v15 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v13, "-[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:]", v5, v25);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_3;
  uint64_t v22 = &unk_26506C108;
  id v23 = self;
  id v16 = v13;
  id v24 = v16;
  id v17 = [(SKHelperClient *)self remoteObjectWithUUID:v16 errorHandler:&v19];
  uint64_t v18 = objc_msgSend(v10, "minimalDictionaryRepresentation", v19, v20, v21, v22, v23);

  [v17 wholeDiskForDiskDictionary:v18 withCompletionUUID:v16];
  if (v15) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) completionHandlers];
  BOOL v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v5 semaphore];

  if (*(void *)(a1 + 48))
  {
    BOOL v7 = [*(id *)(a1 + 32) _parameters:v3 valueAtIndex:0];
    id v8 = +[SKManager sharedManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2;
    v10[3] = &unk_26506C180;
    id v12 = *(id *)(a1 + 48);
    id v11 = v6;
    id v9 = objc_msgSend(*(id *)(a1 + 32), "queueWithBlocking:", *(unsigned __int8 *)(a1 + 56), v10[0], 3221225472, __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2, &unk_26506C180);
    [v8 knownDiskForDictionary:v7 notify:v10 onQueue:v9];
  }
  else if (v6)
  {
    dispatch_semaphore_signal(v6);
  }
}

NSObject *__62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(NSObject **)(a1 + 32);
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:]_block_invoke_3";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = [MEMORY[0x263EFF9D0] null];
  id v9 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4
{
}

- (void)childDisksForWholeDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  id v11 = [v9 UUID];
  __int16 v12 = [v11 UUIDString];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke;
  v21[3] = &unk_26506C0E0;
  id v23 = v8;
  v21[4] = self;
  id v13 = v12;
  id v22 = v13;
  id v14 = v8;
  id v15 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v13, "-[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:]", v5, v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke_2;
  v19[3] = &unk_26506C108;
  v19[4] = self;
  id v16 = v13;
  id v20 = v16;
  id v17 = [(SKHelperClient *)self remoteObjectWithUUID:v16 errorHandler:v19];
  uint64_t v18 = [v10 minimalDictionaryRepresentation];

  [v17 childDisksForWholeDisk:v18 withCompletionUUID:v16];
  if (v15) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (*(void *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) _parameters:v11 valueAtIndex:0];
    uint64_t v4 = *(void *)(a1 + 48);
    BOOL v5 = +[SKManager sharedManager];
    id v6 = [v5 knownDisksForDictionaries:v3];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
  BOOL v7 = [*(id *)(a1 + 32) completionHandlers];
  id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v9 = [v8 semaphore];
  id v10 = v9;
  if (v9) {
    dispatch_semaphore_signal(v9);
  }
}

void __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = [MEMORY[0x263EFF9D0] null];
  id v9 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4
{
}

- (void)isBusyWithBlocking:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263F08C38] UUID];
  id v8 = [v7 UUIDString];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke;
  v16[3] = &unk_26506C0E0;
  id v18 = v6;
  v16[4] = self;
  id v9 = v8;
  id v17 = v9;
  id v10 = v6;
  id v11 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v9, "-[SKHelperClient isBusyWithBlocking:completionBlock:]", v4, v16);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke_2;
  v14[3] = &unk_26506C108;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  id v13 = [(SKHelperClient *)self remoteObjectWithUUID:v12 errorHandler:v14];
  [v13 isBusyWithCompletionUUID:v12];

  if (v11) {
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    [v3 BOOLValue];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) completionHandlers];
  uint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = [v5 semaphore];
  BOOL v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

uint64_t __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_26F31DC00];
}

- (void)isBusy:(id)a3
{
}

- (void)filesystemsWithBlocking:(BOOL)a3 callbackBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x263F08C38] UUID];
  id v8 = [v7 UUIDString];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke;
  v16[3] = &unk_26506C1D0;
  v16[4] = self;
  id v18 = v6;
  id v9 = v8;
  id v17 = v9;
  id v10 = v6;
  id v11 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v9, "-[SKHelperClient filesystemsWithBlocking:callbackBlock:]", v4, v16);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke_2;
  v14[3] = &unk_26506C108;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  id v13 = [(SKHelperClient *)self remoteObjectWithUUID:v12 errorHandler:v14];
  [v13 filesystemsWithCompletionUUID:v12];

  if (v11) {
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _parameters:a2 valueAtIndex:0];
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = (id)v3;
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
  uint64_t v5 = [*(id *)(a1 + 32) completionHandlers];
  id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v7 = [v6 semaphore];
  id v8 = v7;
  if (v7) {
    dispatch_semaphore_signal(v7);
  }
}

void __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient filesystemsWithBlocking:callbackBlock:]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v7 = [MEMORY[0x263EFF9D0] null];
  id v9 = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)filesystemsWithCallbackBlock:(id)a3
{
}

- (void)physicalStoresForAPFSVolume:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  id v11 = [v9 UUID];
  __int16 v12 = [v11 UUIDString];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke;
  v25[3] = &unk_26506C1A8;
  v25[4] = self;
  id v13 = v12;
  BOOL v28 = v5;
  id v26 = v13;
  id v27 = v8;
  id v14 = v8;
  id v15 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v13, "-[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:]", v5, v25);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_5;
  id v22 = &unk_26506C108;
  id v23 = self;
  id v16 = v13;
  id v24 = v16;
  id v17 = [(SKHelperClient *)self remoteObjectWithUUID:v16 errorHandler:&v19];
  id v18 = objc_msgSend(v10, "minimalDictionaryRepresentation", v19, v20, v21, v22, v23);

  [v17 physicalStoresForAPFSVolume:v18 withCompletionUUID:v16];
  if (v15) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v16 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v15 = [v4 semaphore];

  BOOL v5 = [*(id *)(a1 + 32) _parameters:v16 valueAtIndex:0];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3;
  v32[4] = __Block_byref_object_dispose__3;
  id v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = dispatch_queue_create("com.apple.storagekitd.diskeval", 0);
  BOOL v7 = dispatch_group_create();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        dispatch_group_enter(v7);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_85;
        block[3] = &unk_26506C1F8;
        void block[4] = v11;
        id v27 = v32;
        id v26 = v7;
        dispatch_async(v6, block);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_3;
  v18[3] = &unk_26506C248;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v19 = v7;
  uint64_t v20 = v12;
  char v24 = *(unsigned char *)(a1 + 56);
  id v22 = *(id *)(a1 + 48);
  id v23 = v32;
  id v21 = v15;
  id v13 = v15;
  id v14 = v7;
  dispatch_sync(v6, v18);

  _Block_object_dispose(v32, 8);
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_85(uint64_t a1)
{
  v2 = +[SKManager sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_2;
  v7[3] = &unk_26506BD38;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v8 = v6;
  BOOL v5 = dispatch_get_global_queue(0, 0);
  [v2 knownDiskForDictionary:v3 notify:v7 onQueue:v5];
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_sync_enter(v3);
  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
  objc_sync_exit(v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_3(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = [*(id *)(a1 + 40) queueWithBlocking:*(unsigned __int8 *)(a1 + 72)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_4;
  block[3] = &unk_26506C220;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

NSObject *__71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  uint64_t result = a1[4];
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:]_block_invoke_5";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_26F31DC18];
}

- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4
{
}

- (void)volumesForAPFSPS:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  uint64_t v11 = [v9 UUID];
  uint64_t v12 = [v11 UUIDString];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke;
  v25[3] = &unk_26506C1A8;
  v25[4] = self;
  id v13 = v12;
  BOOL v28 = v5;
  id v26 = v13;
  id v27 = v8;
  id v14 = v8;
  id v15 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v13, "-[SKHelperClient volumesForAPFSPS:blocking:completionBlock:]", v5, v25);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  id v21 = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_6;
  id v22 = &unk_26506C108;
  id v23 = self;
  id v16 = v13;
  id v24 = v16;
  id v17 = [(SKHelperClient *)self remoteObjectWithUUID:v16 errorHandler:&v19];
  id v18 = objc_msgSend(v10, "minimalDictionaryRepresentation", v19, v20, v21, v22, v23);

  [v17 volumesForAPFSPS:v18 withCompletionUUID:v16];
  if (v15) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v13 = [v4 semaphore];

  BOOL v5 = [*(id *)(a1 + 32) _parameters:v14 valueAtIndex:0];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__3;
  v28[4] = __Block_byref_object_dispose__3;
  id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = dispatch_queue_create("com.apple.storagekitd.diskeval", 0);
  __int16 v7 = dispatch_group_create();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        dispatch_group_enter(v7);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_2;
        block[3] = &unk_26506C1F8;
        void block[4] = v11;
        id v23 = v28;
        id v22 = v7;
        dispatch_async(v6, block);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_4;
  v16[3] = &unk_26506C270;
  v16[4] = *(void *)(a1 + 32);
  char v20 = *(unsigned char *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = v28;
  id v17 = v13;
  id v12 = v13;
  dispatch_sync(v6, v16);

  _Block_object_dispose(v28, 8);
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[SKManager sharedManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_3;
  v7[3] = &unk_26506BD38;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v8 = v6;
  BOOL v5 = dispatch_get_global_queue(0, 0);
  [v2 knownDiskForDictionary:v3 notify:v7 onQueue:v5];
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_sync_enter(v3);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queueWithBlocking:*(unsigned __int8 *)(a1 + 64)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_5;
  block[3] = &unk_26506C220;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

NSObject *__60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_5(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  uint64_t result = a1[4];
  if (result)
  {
    return dispatch_semaphore_signal(result);
  }
  return result;
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SKHelperClient volumesForAPFSPS:blocking:completionBlock:]_block_invoke_6";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_26F31DC30];
}

- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4
{
}

- (void)updateUUID:(id)a3 progress:(float)a4 message:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SKHelperClient *)self completionHandlers];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    id v12 = [v11 progressBlock];

    if (v12)
    {
      id v13 = [v11 progressBlock];
      id v14 = [(SKHelperClient *)self callbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__SKHelperClient_updateUUID_progress_message___block_invoke;
      block[3] = &unk_26506C298;
      id v18 = v13;
      float v19 = a4;
      id v17 = v8;
      id v15 = v13;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __46__SKHelperClient_updateUUID_progress_message___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(float *)(a1 + 48));
}

- (void)requestWithUUID:(id)a3 didCompleteWithResult:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SKHelperClient *)self completionHandlers];
  id v9 = [v8 objectForKeyedSubscript:v6];

  id v10 = SKGetOSLog();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2082;
      uint64_t v23 = [v9 functionName];
      _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "Reached XPC reply for %{public}@ %{public}s", buf, 0x16u);
    }

    [v9 setProgressBlock:0];
    id v12 = [v9 semaphore];

    if (v12)
    {
      id v13 = [v9 completionBlock];
      ((void (**)(void, id))v13)[2](v13, v7);

      id v14 = SKGetOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v6;
        _os_log_impl(&dword_23F40C000, v14, OS_LOG_TYPE_DEFAULT, "Completion block directly executed for: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v15 = [(SKHelperClient *)self callbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__SKHelperClient_requestWithUUID_didCompleteWithResult___block_invoke;
      block[3] = &unk_26506C2C0;
      id v17 = v6;
      id v18 = v9;
      id v19 = v7;
      dispatch_async(v15, block);

      id v14 = v17;
    }

    uint64_t v11 = [(SKHelperClient *)self completionHandlers];
    [v11 setObject:0 forKeyedSubscript:v6];
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_ERROR, "Error: no completion handler for %{public}@", buf, 0xCu);
  }
}

void __56__SKHelperClient_requestWithUUID_didCompleteWithResult___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_DEFAULT, "Completion callback for: %{public}@ - start", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) completionBlock];
  v4[2](v4, *(void *)(a1 + 48));

  int v5 = SKGetOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_23F40C000, v5, OS_LOG_TYPE_DEFAULT, "Completion callback for: %{public}@ - end", (uint8_t *)&v7, 0xCu);
  }
}

- (void)initialPopulateComplete
{
  id v2 = +[SKManager sharedManager];
  [v2 initialPopulateComplete];
}

- (void)disksAppeared:(id)a3
{
  id v3 = a3;
  id v4 = +[SKManager sharedManager];
  [v4 disksAppeared:v3];
}

- (void)disksChanged:(id)a3
{
  id v3 = a3;
  id v4 = +[SKManager sharedManager];
  [v4 disksChanged:v3];
}

- (void)disksDisappeared:(id)a3
{
  id v3 = a3;
  id v4 = +[SKManager sharedManager];
  [v4 disksDisappeared:v3];
}

- (void)managerStalled
{
  id v2 = +[SKManager sharedManager];
  [v2 managerStalled];
}

- (void)managerResumed
{
  id v2 = +[SKManager sharedManager];
  [v2 managerResumed];
}

- (id)remoteObjectWithUUID:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKHelperClient *)self xpcQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SKHelperClient_remoteObjectWithUUID_errorHandler___block_invoke;
  block[3] = &unk_26506C2E8;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  uint64_t v11 = [(SKHelperClient *)self xpcConnection];
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v9];

  return v12;
}

void __52__SKHelperClient_remoteObjectWithUUID_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) completionHandlers];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 setErrorBlock:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = SKGetOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315394;
      id v7 = "-[SKHelperClient remoteObjectWithUUID:errorHandler:]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_ERROR, "%s: No completion handler set for %{public}@, cannot set error block", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)createXPCConnection
{
  id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.storagekitd" options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  uint64_t v5 = SKHelperConnectionInterface();
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];

  [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
  int v6 = SKHelperClientInterface();
  [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v6];

  objc_initWeak(&location, self);
  id v7 = self->_xpcConnection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__SKHelperClient_createXPCConnection__block_invoke;
  v11[3] = &unk_26506C310;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v7 setInterruptionHandler:v11];
  __int16 v8 = self->_xpcConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__SKHelperClient_createXPCConnection__block_invoke_96;
  v9[3] = &unk_26506C310;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)v8 setInvalidationHandler:v9];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __37__SKHelperClient_createXPCConnection__block_invoke(uint64_t a1)
{
  id v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _abortAllCalls];
}

void __37__SKHelperClient_createXPCConnection__block_invoke_96(uint64_t a1)
{
  id v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _abortAllCalls];
}

- (void)_abortAllCalls
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:35 userInfo:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(SKHelperClient *)self completionHandlers];
  uint64_t v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = SKGetOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v10;
          _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "Calling completion handler to abort UUID: %{public}@", buf, 0xCu);
        }

        id v12 = [(SKHelperClient *)self completionHandlers];
        id v13 = [v12 objectForKeyedSubscript:v10];

        id v14 = [v13 errorBlock];

        if (v14)
        {
          id v15 = [v13 errorBlock];
          ((void (**)(void, void *))v15)[2](v15, v3);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  id v16 = [(SKHelperClient *)self completionHandlers];
  [v16 removeAllObjects];
}

- (void)_scheduleCompletionUUID:(id)a3 progress:(id)a4 forFunction:(const char *)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(SKHelperClient *)self xpcQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SKHelperClient__scheduleCompletionUUID_progress_forFunction_withBlock___block_invoke;
  block[3] = &unk_26506C338;
  id v21 = v11;
  uint64_t v22 = a5;
  id v18 = v10;
  long long v19 = self;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __73__SKHelperClient__scheduleCompletionUUID_progress_forFunction_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315394;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_DEFAULT, "Setting completion callback for (%s) to: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = [[SKCompletionHandler alloc] initWithCompletionBlock:*(void *)(a1 + 48) progressBlock:*(void *)(a1 + 56) function:*(void *)(a1 + 64)];
  uint64_t v6 = [*(id *)(a1 + 40) completionHandlers];
  [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5
{
}

- (id)_scheduleSyncCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v11 = [(SKHelperClient *)self xpcQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SKHelperClient__scheduleSyncCompletionUUID_forFunction_withBlock___block_invoke;
  block[3] = &unk_26506C360;
  id v21 = v9;
  uint64_t v22 = a4;
  id v18 = v8;
  id v12 = v10;
  long long v19 = v12;
  id v20 = self;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  id v15 = v12;
  return v15;
}

void __68__SKHelperClient__scheduleSyncCompletionUUID_forFunction_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = SKGetOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315394;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_23F40C000, v2, OS_LOG_TYPE_DEFAULT, "Setting sync completion callback for (%s) to: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = [[SKCompletionHandler alloc] initWithCompletionBlock:*(void *)(a1 + 56) progressBlock:0 function:*(void *)(a1 + 64)];
  [(SKCompletionHandler *)v5 setSemaphore:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 48) completionHandlers];
  [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (id)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 blocking:(BOOL)a5 withBlock:(id)a6
{
  if (a5)
  {
    uint64_t v6 = [(SKHelperClient *)self _scheduleSyncCompletionUUID:a3 forFunction:a4 withBlock:a6];
  }
  else
  {
    [(SKHelperClient *)self _scheduleCompletionUUID:a3 progress:0 forFunction:a4 withBlock:a6];
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_parameters:(id)a3 valueAtIndex:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] > a4)
  {
    uint64_t v6 = [v5 objectAtIndex:a4];
    int v7 = [MEMORY[0x263EFF9D0] null];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_5;
    }
  }
  uint64_t v6 = 0;
LABEL_5:

  return v6;
}

- (BOOL)_isRecachingDiskAbuse:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 minimalDictionaryRepresentation];
  id v5 = [(SKHelperClient *)self recacheAbuseLimiterInfo];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    int v7 = [v6 objectForKey:@"FirstCallTime"];
    int v8 = [v6 objectForKey:@"CallCount"];
    __int16 v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceDate:v7];
    double v11 = v10;

    if (v11 >= 60.0)
    {
      v23[0] = @"FirstCallTime";
      id v13 = [MEMORY[0x263EFF910] date];
      v23[1] = @"CallCount";
      v24[0] = v13;
      v24[1] = &unk_26F31DBB8;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

      BOOL v12 = 0;
      uint64_t v6 = (void *)v14;
    }
    else
    {
      BOOL v12 = [v8 integerValue] > 3;
    }
  }
  else
  {
    v21[0] = @"FirstCallTime";
    int v7 = [MEMORY[0x263EFF910] date];
    v21[1] = @"CallCount";
    v22[0] = v7;
    v22[1] = &unk_26F31DBB8;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    BOOL v12 = 0;
  }

  id v15 = [v6 objectForKey:@"CallCount"];
  uint64_t v16 = [v15 integerValue] + 1;
  long long v17 = (void *)[v6 mutableCopy];
  id v18 = [NSNumber numberWithInteger:v16];
  [v17 setObject:v18 forKey:@"CallCount"];

  long long v19 = [(SKHelperClient *)self recacheAbuseLimiterInfo];
  [v19 setObject:v17 forKey:v4];

  return v12;
}

- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4
{
}

- (void)unmountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 withCompletionBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  double v11 = (void *)MEMORY[0x263F08C38];
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v11 UUID];
  id v15 = [v14 UUIDString];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke;
  void v24[3] = &unk_26506C0E0;
  id v26 = v10;
  v24[4] = self;
  id v16 = v15;
  id v25 = v16;
  id v17 = v10;
  id v18 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v16, "-[SKHelperClient unmountDisk:options:blocking:withCompletionBlock:]", v6, v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  void v22[2] = __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke_2;
  v22[3] = &unk_26506C108;
  v22[4] = self;
  id v19 = v16;
  id v23 = v19;
  id v20 = [(SKHelperClient *)self remoteObjectWithUUID:v19 errorHandler:v22];
  id v21 = [v13 minimalDictionaryRepresentation];

  [v20 unmountDisk:v21 options:v12 withCompletionUUID:v19];
  if (v18) {
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v4 = [*(id *)(a1 + 32) completionHandlers];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v6 = [v5 semaphore];
  int v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

void __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  BOOL v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
}

- (void)mountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  double v11 = (void *)MEMORY[0x263F08C38];
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v11 UUID];
  id v15 = [v14 UUIDString];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke;
  void v24[3] = &unk_26506C0E0;
  id v26 = v10;
  v24[4] = self;
  id v16 = v15;
  id v25 = v16;
  id v17 = v10;
  id v18 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v16, "-[SKHelperClient mountDisk:options:blocking:completionBlock:]", v6, v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  void v22[2] = __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke_2;
  v22[3] = &unk_26506C108;
  v22[4] = self;
  id v19 = v16;
  id v23 = v19;
  id v20 = [(SKHelperClient *)self remoteObjectWithUUID:v19 errorHandler:v22];
  id v21 = [v13 minimalDictionaryRepresentation];

  [v20 mountDisk:v21 options:v12 withCompletionUUID:v19];
  if (v18) {
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v4 = [*(id *)(a1 + 32) completionHandlers];
  id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v6 = [v5 semaphore];
  int v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

void __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  BOOL v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)mountDisk:(id)a3 options:(id)a4 completionBlock:(id)a5
{
}

- (void)ejectDisk:(id)a3 blocking:(BOOL)a4 withCompletionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  __int16 v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a3;
  double v11 = [v9 UUID];
  id v12 = [v11 UUIDString];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke;
  v21[3] = &unk_26506C0E0;
  id v23 = v8;
  v21[4] = self;
  id v13 = v12;
  id v22 = v13;
  id v14 = v8;
  id v15 = -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:](self, "_scheduleCompletionUUID:forFunction:blocking:withBlock:", v13, "-[SKHelperClient ejectDisk:blocking:withCompletionBlock:]", v5, v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke_2;
  v19[3] = &unk_26506C108;
  v19[4] = self;
  id v16 = v13;
  id v20 = v16;
  id v17 = [(SKHelperClient *)self remoteObjectWithUUID:v16 errorHandler:v19];
  id v18 = [v10 minimalDictionaryRepresentation];

  [v17 ejectDisk:v18 withCompletionUUID:v16];
  if (v15) {
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v4 = [*(id *)(a1 + 32) completionHandlers];
  BOOL v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v6 = [v5 semaphore];
  int v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

void __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  BOOL v6 = [v4 arrayWithObjects:&v7 count:1];
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4
{
}

- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SKHelperClient *)self xpcConnection];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke;
  v16[3] = &unk_26506C388;
  v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_3;
  v14[3] = &unk_26506C130;
  v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  id v12 = [v10 eraseWithEraser:v7 reply:v14];

  return v12;
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_2;
  v7[3] = &unk_26506BCE8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _parameters:v4 valueAtIndex:0];
  id v6 = [*(id *)(a1 + 32) _parameters:v4 valueAtIndex:1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = +[SKManager sharedManager];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4;
    v9[3] = &unk_26506C180;
    id v11 = *(id *)(a1 + 40);
    id v10 = v6;
    id v8 = objc_msgSend(*(id *)(a1 + 32), "callbackQueue", v9[0], 3221225472, __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4, &unk_26506C180);
    [v7 knownDiskForDictionary:v5 notify:v9 onQueue:v8];
  }
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SKGetOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[SKHelperClient eraseWithEraser:completionBlock:]_block_invoke_4";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_23F40C000, v4, OS_LOG_TYPE_DEFAULT, "%s: Erase completed successfully: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SKHelperClient *)self xpcConnection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke;
  v19[3] = &unk_26506C388;
  v19[4] = self;
  id v11 = v8;
  id v20 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v19];
  id v13 = [v9 minimalDictionaryRepresentation];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_3;
  v17[3] = &unk_26506C388;
  v17[4] = self;
  id v18 = v11;
  id v14 = v11;
  id v15 = [v12 resizeDisk:v13 size:a4 reply:v17];

  return v15;
}

void __48__SKHelperClient_resize_toSize_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_2;
  v7[3] = &unk_26506BCE8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_4;
  v7[3] = &unk_26506BCE8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

- (NSMutableDictionary)recacheAbuseLimiterInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecacheAbuseLimiterInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recacheAbuseLimiterInfo, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end