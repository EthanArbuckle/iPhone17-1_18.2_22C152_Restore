@interface NRRegistryClient
+ (Class)proxyClass;
+ (Class)xpcConnectionClass;
- (BOOL)daemonIdle;
- (NRNSXPCConnectionProtocol)rawConnection;
- (NRRegistryClient)initWithParameters:(id)a3;
- (id)addDiffIndexObserverWithWriteBlock:(id)a3;
- (uint64_t)_getDevicesUpdateCounterNotifyTokenValue;
- (unint64_t)devicesUpdateCounter;
- (void)_connectToDaemon;
- (void)_finishQueryWithStaringToken:(uint64_t)a3 replacementToken:;
- (void)_fireAllQueryCompletionBlocks;
- (void)_grabRegistryWithReadBlock:(id)a3;
- (void)_grabRegistryWithWriteBlockAsync:(id)a3;
- (void)_queryDaemonWithStartingTokenValue:(uint64_t)a3 currentTokenValue:(int)a4 syncXPC:(void *)a5 withBlock:;
- (void)_queryDataAsyncForce:(void *)a3 ifNeededWithBlock:;
- (void)_queryDataAsyncIfNeededWithBlock:(id)a3;
- (void)_warnAboutMissingEntitlement;
- (void)grabRegistryWithReadBlock:(id)a3;
- (void)grabRegistryWithReadBlockAsync:(id)a3;
- (void)grabRegistryWithWriteBlockAsync:(id)a3;
- (void)invalidate;
- (void)removeDiffIndexObserver:(id)a3;
- (void)setCollection:(id)a3;
- (void)syncGrabRegistryWithReadBlock:(id)a3;
@end

@implementation NRRegistryClient

void __44__NRRegistryClient__wipeRegistryWith_block___block_invoke(uint64_t a1)
{
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__NRRegistryClient__wipeRegistryWith_block___block_invoke_2;
  v17[3] = &unk_1E5B00AD8;
  uint64_t v2 = *(void *)(a1 + 48);
  v17[4] = *(void *)(a1 + 32);
  v17[5] = v2;
  v3 = (void (**)(void))MEMORY[0x1A624A7E0](v17);
  v4 = [*(id *)(a1 + 32) collection];

  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    if (v5) {
      v5[14] = *(void *)(a1 + 48);
    }
    v3[2](v3);
    v15 = objc_opt_new();
    [*(id *)(a1 + 32) setCollection:v15];

    goto LABEL_12;
  }
  v6 = [v5 collection];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      *(void *)(v16 + 112) = *(void *)(a1 + 48);
    }
    v3[2](v3);
LABEL_12:
    v8 = [*(id *)(a1 + 32) managementQueue];
    dispatch_async(v8, *(dispatch_block_t *)(a1 + 40));
    goto LABEL_13;
  }
  v8 = objc_opt_new();
  v9 = [*(id *)(a1 + 32) collection];
  v10 = +[NRMutableDeviceCollection diffFrom:v9 to:v8];

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    *(void *)(v11 + 112) = *(void *)(a1 + 48);
  }
  v3[2](v3);
  v12 = [*(id *)(a1 + 32) collection];
  id v13 = (id)[v12 applyDiff:v10];

  v14 = [*(id *)(a1 + 32) managementQueue];
  dispatch_async(v14, *(dispatch_block_t *)(a1 + 40));

LABEL_13:
}

void __44__NRRegistryClient__wipeRegistryWith_block___block_invoke_2(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 47) & 0x40) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) secureProperties];

    if (!v2)
    {
      id v3 = (id)objc_opt_new();
      [*(id *)(a1 + 32) setSecureProperties:v3];
    }
  }
}

- (void)setCollection:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      uint64_t v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "setCollection: nil collection", buf, 2u);
      }
    }
  }
  [(NRRegistryClient *)self devicesUpdateCounter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__NRRegistryClient_setCollection___block_invoke;
  v9[3] = &unk_1E5B002A8;
  id v10 = v4;
  uint64_t v11 = self;
  id v8 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v9];
}

- (unint64_t)devicesUpdateCounter
{
  if (self) {
    unint64_t v2 = self->_tokenValue & 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v2 = 0;
  }
  self;
  return v2;
}

void __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) collection];
  id v3 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

intptr_t __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (BOOL)daemonIdle
{
  if ([(NRRegistry *)self supportsWatch]) {
    return -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue]((uint64_t)self) >> 63;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return v3;
}

void __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)(v2 + 112);
  if ([*(id *)(a1 + 32) supportsWatch]) {
    uint64_t DevicesUpdateCounterNotifyToken = -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue](v2);
  }
  else {
    uint64_t DevicesUpdateCounterNotifyToken = [(id)v2 devicesUpdateCounter] | 0xC000000000000000;
  }
  if (*(unsigned char *)(v2 + 89)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = DevicesUpdateCounterNotifyToken == 0;
  }
  if (!v5 && v3 == DevicesUpdateCounterNotifyToken)
  {
    uint64_t v2 = *(void *)(a1 + 32);
LABEL_14:
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_2;
    v8[3] = &unk_1E5B00058;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(id)v2 enqueueUnlessSuspended:v8];
  }
}

- (uint64_t)_getDevicesUpdateCounterNotifyTokenValue
{
  if (result)
  {
    uint64_t v1 = result;
    int check = 1;
    notify_check(*(_DWORD *)(result + 96), &check);
    if (!check && *(unsigned char *)(v1 + 88)) {
      return *(void *)(v1 + 120);
    }
    uint64_t v2 = 0;
    if (notify_get_state(*(_DWORD *)(v1 + 96), &v2))
    {
      return *(void *)(v1 + 120);
    }
    else
    {
      *(unsigned char *)(v1 + 88) = 1;
      result = v2;
      *(void *)(v1 + 120) = v2;
    }
  }
  return result;
}

void __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) collection];
  uint64_t v3 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)syncGrabRegistryWithReadBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRRegistry *)self managementQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  BOOL v6 = [(NRRegistry *)self managementQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke;
  block[3] = &unk_1E5B00C18;
  block[4] = self;
  v15 = &v16;
  id v7 = v4;
  id v14 = v7;
  dispatch_sync(v6, block);

  if (!*((unsigned char *)v17 + 24))
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__NRRegistryClient_syncGrabRegistryWithReadBlock___block_invoke_3;
    v10[3] = &unk_1E5B00740;
    id v12 = v7;
    id v9 = v8;
    uint64_t v11 = v9;
    [(NRRegistryClient *)self grabRegistryWithReadBlockAsync:v10];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)grabRegistryWithReadBlockAsync:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRRegistry *)self managementQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__NRRegistryClient_grabRegistryWithReadBlockAsync___block_invoke;
  v7[3] = &unk_1E5B008A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__NRRegistryClient_addDiffIndexObserverWithWriteBlock___block_invoke(void *a1)
{
  uint64_t v2 = [(id)objc_opt_class() _nextToken];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(a1[4] + 80))
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = a1[4];
    id v7 = *(void **)(v6 + 80);
    *(void *)(v6 + 80) = v5;
  }
  id v8 = (id)MEMORY[0x1A624A7E0](a1[5]);
  [*(id *)(a1[4] + 80) setObject:v8 forKeyedSubscript:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

uint64_t __34__NRRegistryClient_setCollection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__NRRegistryClient_setCollection___block_invoke_2;
  v5[3] = &unk_1E5B00E48;
  v5[4] = *(void *)(a1 + 40);
  id v3 = (id)[v2 addObserverQueue:0 withBlock:v5];
  return [*(id *)(a1 + 40) setQueueCollection:*(void *)(a1 + 32)];
}

void __39__NRRegistryClient_initWithParameters___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  id v3 = [*(id *)(a1 + 32) managementQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__NRRegistryClient_initWithParameters___block_invoke_2;
  v4[3] = &unk_1E5B00B80;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  *(_DWORD *)(*(void *)(a1 + 32) + 92) = [v2 registerNotifyTokenWithName:@"com.apple.nanoregistry.NRDevicesUpdateCounterNotifyNotification" withQueue:v3 withBlock:v4];

  *(_DWORD *)(*(void *)(a1 + 32) + 96) = [(id)objc_opt_class() registerNotifyTokenWithName:@"com.apple.nanoregistry.NRDevicesUpdateCounterNotifyNotification" withQueue:0 withBlock:0];
  [*(id *)(a1 + 32) _queryDataAsyncIfNeededWithBlock:&__block_literal_global_32];
  objc_destroyWeak(&v5);
}

- (void)_grabRegistryWithReadBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke;
  v6[3] = &unk_1E5B008A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistryClient *)self _queryDataAsyncIfNeededWithBlock:v6];
}

- (void)_queryDataAsyncIfNeededWithBlock:(id)a3
{
}

- (void)_queryDataAsyncForce:(void *)a3 ifNeededWithBlock:
{
  if (a1)
  {
    id v5 = a3;
    uint64_t v6 = [(id)a1 managementQueue];
    dispatch_assert_queue_V2(v6);

    uint64_t v7 = *(void *)(a1 + 112);
    if ([(id)a1 supportsWatch]) {
      uint64_t DevicesUpdateCounterNotifyToken = -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue](a1);
    }
    else {
      uint64_t DevicesUpdateCounterNotifyToken = [(id)a1 devicesUpdateCounter] | 0xC000000000000000;
    }
    id v9 = [NRRegistryQueryCompletionBlockEntry alloc];
    self;
    id v10 = v5;
    if (v9)
    {
      v29.receiver = v9;
      v29.super_class = (Class)NRRegistryQueryCompletionBlockEntry;
      uint64_t v11 = (NRRegistryQueryCompletionBlockEntry *)objc_msgSendSuper2(&v29, sel_init);
      id v9 = v11;
      if (v11)
      {
        v11->_updateCounter = DevicesUpdateCounterNotifyToken & 0x3FFFFFFFFFFFFFFFLL;
        uint64_t v12 = MEMORY[0x1A624A7E0](v10);
        id block = v9->_block;
        v9->_id block = (id)v12;
      }
    }

    id v14 = v9;
    v15 = v14;
    if (v14 && v14->_block)
    {
      uint64_t v16 = *(void **)(a1 + 136);
      if (!v16)
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v18 = *(void **)(a1 + 136);
        *(void *)(a1 + 136) = v17;

        uint64_t v16 = *(void **)(a1 + 136);
      }
      [v16 addObject:v15];
    }

    if (*(unsigned char *)(a1 + 89) && !a2) {
      goto LABEL_22;
    }
    *(unsigned char *)(a1 + 89) = 1;
    if (DevicesUpdateCounterNotifyToken)
    {
      if (v7 == DevicesUpdateCounterNotifyToken)
      {
        *(unsigned char *)(a1 + 89) = 0;
        -[NRRegistryClient _fireAllQueryCompletionBlocks](a1);
LABEL_22:

        return;
      }
      if ((DevicesUpdateCounterNotifyToken & 0x8000000000000000) != 0)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_2;
        v27[3] = &unk_1E5B00CB8;
        v27[4] = a1;
        v27[5] = v7;
        v27[6] = DevicesUpdateCounterNotifyToken;
        v24 = v27;
        v29.receiver = (id)MEMORY[0x1E4F143A8];
        v29.super_class = (Class)3221225472;
        v30 = __44__NRRegistryClient__wipeRegistryWith_block___block_invoke;
        v31 = &unk_1E5B00CE0;
        uint64_t v34 = DevicesUpdateCounterNotifyToken;
        uint64_t v32 = a1;
        v25 = v24;
        id v33 = v25;
        [(id)a1 enqueueBypassAsync:&v29];

        goto LABEL_22;
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_3;
      v26[3] = &unk_1E5B00C90;
      v26[4] = a1;
      v26[5] = v7;
      char v19 = v26;
      v20 = (void *)a1;
      uint64_t v21 = v7;
      uint64_t v22 = DevicesUpdateCounterNotifyToken;
      int v23 = 0;
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke;
      v28[3] = &unk_1E5B00C90;
      v28[4] = a1;
      v28[5] = v7;
      char v19 = v28;
      v20 = (void *)a1;
      uint64_t v21 = v7;
      uint64_t v22 = 0;
      int v23 = 1;
    }
    -[NRRegistryClient _queryDaemonWithStartingTokenValue:currentTokenValue:syncXPC:withBlock:](v20, v21, v22, v23, v19);
    goto LABEL_22;
  }
}

- (void)_fireAllQueryCompletionBlocks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 136);
  id v3 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 8);
        }
        else {
          uint64_t v10 = 0;
        }
        (*(void (**)(uint64_t))(v10 + 16))(v10);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v11 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v11;
    }
    while (v11);
  }
}

void __33__NRRegistryClient_rawConnection__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _connectToDaemon];
  id v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

- (void)_connectToDaemon
{
  p_connection = &self->_connection;
  if (!self->_connection)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "proxyClass"), "machServiceName");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "xpcConnectionClass")), "initWithMachServiceName:options:", v7, 4096);
    uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "proxyClass"), "clientRemoteObjectInterface");
    [v4 setRemoteObjectInterface:v5];

    uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "proxyClass"), "clientExportedInterface");
    if (v6)
    {
      [v4 setExportedInterface:v6];
      [v4 setExportedObject:self];
    }
    objc_storeStrong((id *)p_connection, v4);
    [v4 resume];
  }
}

+ (Class)xpcConnectionClass
{
  return (Class)objc_opt_class();
}

uint64_t __51__NRRegistryClient_grabRegistryWithReadBlockAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _grabRegistryWithReadBlock:*(void *)(a1 + 40)];
}

- (NRRegistryClient)initWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 mutableCopy];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"NRRegistryShouldCreateCollection"];
  v13.receiver = self;
  v13.super_class = (Class)NRRegistryClient;
  uint64_t v6 = [(NRRegistry *)&v13 initWithParameters:v5];
  if (v6)
  {
    objc_initWeak(&location, v6);
    id v7 = [(NRRegistry *)v6 managementQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__NRRegistryClient_initWithParameters___block_invoke;
    block[3] = &unk_1E5B00BA8;
    uint64_t v10 = v6;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)addDiffIndexObserverWithWriteBlock:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__0;
  long long v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NRRegistryClient_addDiffIndexObserverWithWriteBlock___block_invoke;
  v8[3] = &unk_1E5B00C40;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(NRRegistry *)self performUnderCollectionLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (void)_finishQueryWithStaringToken:(uint64_t)a3 replacementToken:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  id v6 = [(id)a1 managementQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v26 = a2;
  if ([(id)a1 supportsWatch]) {
    uint64_t DevicesUpdateCounterNotifyToken = -[NRRegistryClient _getDevicesUpdateCounterNotifyTokenValue](a1);
  }
  else {
    uint64_t DevicesUpdateCounterNotifyToken = [(id)a1 devicesUpdateCounter] | 0xC000000000000000;
  }
  self;
  id v8 = *(id *)(a1 + 136);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  uint64_t v10 = *(void **)(a1 + 136);
  *(void *)(a1 + 136) = 0;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:buf count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * v15);
        if (v16)
        {
          if (*(void *)(v16 + 16) > (a3 & 0x3FFFFFFFFFFFFFFFuLL))
          {
            objc_msgSend(v9, "addObject:");
            goto LABEL_15;
          }
          uint64_t v17 = *(void *)(v16 + 8);
        }
        else
        {
          uint64_t v17 = 0;
        }
        (*(void (**)(void))(v17 + 16))();
LABEL_15:
        ++v15;
      }
      while (v13 != v15);
      uint64_t v18 = [v11 countByEnumeratingWithState:&v28 objects:buf count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }

  if ([v9 count]) {
    objc_storeStrong((id *)(a1 + 136), v9);
  }

  if (DevicesUpdateCounterNotifyToken == a3)
  {
    *(void *)(a1 + 128) = 0;
    *(unsigned char *)(a1 + 89) = 0;
    -[NRRegistryClient _fireAllQueryCompletionBlocks](a1);
    return;
  }
  if (v26 == a3)
  {
    unint64_t v19 = *(void *)(a1 + 128);
    if (v19)
    {
      if (v19 > 0xFF)
      {
LABEL_34:
        double v20 = (double)v19 * 0.1;
        uint64_t v21 = nr_framework_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        if (v22)
        {
          int v23 = nr_framework_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            double v33 = v20;
            _os_log_error_impl(&dword_1A356E000, v23, OS_LOG_TYPE_ERROR, "_queryDataAsyncIfNeededWithBlock/finishQueryWithTokenValues: Failure to query daemon, backing off interval = %0.1f", buf, 0xCu);
          }
        }
        *(unsigned char *)(a1 + 88) = 0;
        dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
        v25 = [(id)a1 managementQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__NRRegistryClient__finishQueryWithStaringToken_replacementToken___block_invoke;
        block[3] = &unk_1E5B00230;
        void block[4] = a1;
        dispatch_after(v24, v25, block);

        return;
      }
      v19 *= 2;
    }
    else
    {
      unint64_t v19 = 1;
    }
    *(void *)(a1 + 128) = v19;
    goto LABEL_34;
  }
  *(void *)(a1 + 128) = 0;

  -[NRRegistryClient _queryDataAsyncForce:ifNeededWithBlock:](a1, 1, 0);
}

void __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__NRRegistryClient__grabRegistryWithReadBlock___block_invoke_2;
  v4[3] = &unk_1E5B00058;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 enqueue:v4];
}

void __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_2(uint64_t a1)
{
}

- (NRNSXPCConnectionProtocol)rawConnection
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__NRRegistryClient_rawConnection__block_invoke;
  v4[3] = &unk_1E5B00198;
  void v4[4] = self;
  void v4[5] = &v5;
  [(NRRegistry *)self performUnderCollectionLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NRNSXPCConnectionProtocol *)v2;
}

void __39__NRRegistryClient_initWithParameters___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _queryDataAsyncIfNeededWithBlock:0];
}

+ (Class)proxyClass
{
  return (Class)objc_opt_class();
}

- (void)grabRegistryWithReadBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRRegistry *)self managementQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NRRegistryClient_grabRegistryWithReadBlock___block_invoke;
  v7[3] = &unk_1E5B008A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__NRRegistryClient_grabRegistryWithReadBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _grabRegistryWithReadBlock:*(void *)(a1 + 40)];
}

- (void)grabRegistryWithWriteBlockAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRRegistry *)self managementQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(NRRegistry *)self managementQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NRRegistryClient_grabRegistryWithWriteBlockAsync___block_invoke;
  v8[3] = &unk_1E5B008A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __52__NRRegistryClient_grabRegistryWithWriteBlockAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _grabRegistryWithWriteBlockAsync:*(void *)(a1 + 40)];
}

- (void)_grabRegistryWithWriteBlockAsync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NRRegistry *)self managementQueue];
  dispatch_assert_queue_V2(v5);

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  void v10[4] = __Block_byref_object_dispose__0;
  id v11 = (id)os_transaction_create();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke;
  v7[3] = &unk_1E5B00C18;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  id v9 = v10;
  [(NRRegistryClient *)self _queryDataAsyncIfNeededWithBlock:v7];

  _Block_object_dispose(v10, 8);
}

void __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke_2;
  v4[3] = &unk_1E5B00BF0;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  [v2 enqueueAsync:v4];
}

void __53__NRRegistryClient__grabRegistryWithWriteBlockAsync___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) collection];
  id v4 = [*(id *)(a1 + 32) secureProperties];
  (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v3, v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = objc_opt_class();
  uint64_t v6 = [*(id *)(a1 + 32) secureProperties];
  id v7 = [v5 getReferencedSecureProperties:v6 fromDiff:v15];

  int v8 = [*(id *)(a1 + 32) supportsWatch];
  id v9 = *(void **)(a1 + 32);
  if (v8)
  {
    id v10 = [v9 rawConnection];
    id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_40];
    [v11 xpcApplyDiff:v15 withSecureProperties:v7 block:&__block_literal_global_42];
  }
  else
  {
    id v10 = [v9 collection];
    id v12 = (id)[v10 applyDiff:v15];
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

- (void)removeDiffIndexObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__NRRegistryClient_removeDiffIndexObserver___block_invoke;
  v6[3] = &unk_1E5B002A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NRRegistry *)self performUnderCollectionLock:v6];
}

uint64_t __44__NRRegistryClient_removeDiffIndexObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __94__NRRegistryClient__notifyDiffIndexObserversWithDiff_deviceCollection_secureProperties_index___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 80) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __66__NRRegistryClient__finishQueryWithStaringToken_replacementToken___block_invoke(uint64_t a1)
{
  return -[NRRegistryClient _queryDataAsyncForce:ifNeededWithBlock:](*(void *)(a1 + 32), 1, 0);
}

void __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)_queryDaemonWithStartingTokenValue:(uint64_t)a3 currentTokenValue:(int)a4 syncXPC:(void *)a5 withBlock:
{
  id v9 = a5;
  id v10 = [a1 rawConnection];

  if (v10)
  {
    id v11 = [a1 collection];

    if (v11)
    {
      id v12 = [a1 secureProperties];

      uint64_t v13 = [a1 rawConnection];
      if ((a2 | 0x4000000000000000) != a3 || v12)
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_58;
        v34[3] = &unk_1E5B00DA8;
        v34[4] = a1;
        id v24 = v9;
        id v35 = v24;
        uint64_t v36 = a2;
        v25 = [v13 remoteObjectProxyWithErrorHandler:v34];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_60;
        v32[3] = &unk_1E5B00E20;
        v32[4] = a1;
        id v33 = v24;
        [v25 xpcGetDiffSinceTokenValue:a2 getSecureProperties:1 withBlock:v32];

        uint64_t v16 = v35;
      }
      else
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_52;
        v40[3] = &unk_1E5B00DA8;
        v40[4] = a1;
        id v14 = v9;
        id v41 = v14;
        uint64_t v42 = a2;
        id v15 = [v13 remoteObjectProxyWithErrorHandler:v40];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_54;
        v37[3] = &unk_1E5B00DF8;
        v37[4] = a1;
        uint64_t v39 = a2;
        id v38 = v14;
        [v15 xpcRetrieveSecureProperties:0 block:v37];

        uint64_t v16 = v41;
      }
    }
    else if (a4)
    {
      uint64_t v18 = nr_framework_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        double v20 = nr_framework_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A356E000, v20, OS_LOG_TYPE_DEFAULT, "Using synchronous remote object for xpcGetDeviceCollectionWithBlock", buf, 2u);
        }
      }
      uint64_t v21 = [a1 rawConnection];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke;
      v50[3] = &unk_1E5B00D08;
      id v22 = v9;
      id v51 = v22;
      uint64_t v52 = a2;
      int v23 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v50];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_47;
      v48[3] = &unk_1E5B00D80;
      v48[4] = a1;
      id v49 = v22;
      [v23 xpcGetDeviceCollectionWithBlock:v48];

      uint64_t v16 = v51;
    }
    else
    {
      uint64_t v26 = [a1 rawConnection];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4;
      v45[3] = &unk_1E5B00DA8;
      v45[4] = a1;
      id v27 = v9;
      id v46 = v27;
      uint64_t v47 = a2;
      long long v28 = [v26 remoteObjectProxyWithErrorHandler:v45];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_49;
      v43[3] = &unk_1E5B00D80;
      v43[4] = a1;
      id v44 = v27;
      [v28 xpcGetDeviceCollectionWithBlock:v43];

      uint64_t v16 = v46;
    }
  }
  else
  {
    uint64_t v17 = [a1 managementQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_64;
    v29[3] = &unk_1E5B00D30;
    id v30 = v9;
    uint64_t v31 = a2;
    dispatch_async(v17, v29);

    uint64_t v16 = v30;
  }
}

void __59__NRRegistryClient__queryDataAsyncForce_ifNeededWithBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x1E4F281F8];
  id v5 = [v3 domain];
  if ([v4 isEqual:v5])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 4097) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    id v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(v3, "nr_safeDescription");
      int v11 = 138543362;
      id v12 = v10;
      _os_log_error_impl(&dword_1A356E000, v9, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValueSync/xpcGetDeviceCollectionWithBlock: XPC error %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_47(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  if ((a5 & 1) == 0) {
    [*(id *)(a1 + 32) _warnAboutMissingEntitlement];
  }
  int v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2;
  v14[3] = &unk_1E5B00D58;
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = v9;
  uint64_t v19 = a4;
  id v18 = *(id *)(a1 + 40);
  id v12 = v9;
  id v13 = v10;
  [v11 enqueueBypassAsync:v14];
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setSecureProperties:");
  }
  [*(id *)(a1 + 48) setParentDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    *(void *)(v2 + 112) = *(void *)(a1 + 64);
    id v3 = *(void **)(a1 + 40);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setCollection:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 40) managementQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3;
  v7[3] = &unk_1E5B00D30;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) managementQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5;
  block[3] = &unk_1E5B00CE0;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*MEMORY[0x1E4F281F8];
  id v3 = [*(id *)(a1 + 32) domain];
  if ([v2 isEqual:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) code];

    if (v4 == 4097) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
  }
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_msgSend(*(id *)(a1 + 32), "nr_safeDescription");
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValue/xpcGetDeviceCollectionWithBlock: XPC error %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_49(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  if ((a5 & 1) == 0) {
    [*(id *)(a1 + 32) _warnAboutMissingEntitlement];
  }
  uint64_t v11 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_50;
  v14[3] = &unk_1E5B00D58;
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = v9;
  uint64_t v19 = a4;
  id v18 = *(id *)(a1 + 40);
  id v12 = v9;
  id v13 = v10;
  [v11 enqueueBypassAsync:v14];
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_50(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setSecureProperties:");
  }
  [*(id *)(a1 + 48) setParentDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    *(void *)(v2 + 112) = *(void *)(a1 + 64);
    id v3 = *(void **)(a1 + 40);
  }
  else
  {
    id v3 = 0;
  }
  [v3 setCollection:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 40) managementQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_51;
  v7[3] = &unk_1E5B00D30;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, v7);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_52(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)*MEMORY[0x1E4F281F8];
  id v5 = [v3 domain];
  if ([v4 isEqual:v5])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 4097) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

  if (v8)
  {
    uint64_t v9 = nr_daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(v3, "nr_safeDescription");
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_error_impl(&dword_1A356E000, v9, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValue/xpcRetrieveSecureProperties: XPC error %{public}@", buf, 0xCu);
    }
  }
LABEL_9:
  id v10 = [*(id *)(a1 + 32) managementQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_53;
  v14[3] = &unk_1E5B00D30;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v15 = v11;
  uint64_t v16 = v12;
  dispatch_async(v10, v14);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_54(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_55;
  v7[3] = &unk_1E5B00DD0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v5 = (void *)a1[5];
  uint64_t v11 = a1[6];
  id v10 = v5;
  id v6 = v3;
  [v4 enqueueBypassAsync:v7];
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_55(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) secureProperties];
    if (!v2) {
      uint64_t v2 = objc_opt_new();
    }
    [v2 forceImportSecureProperties:*(void *)(a1 + 32)];
    id v3 = [*(id *)(a1 + 40) secureProperties];

    if (!v3) {
      [*(id *)(a1 + 40) setSecureProperties:v2];
    }
  }
  uint64_t v4 = *(void *)(a1 + 56) | 0x4000000000000000;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    *(void *)(v5 + 112) = v4;
    id v6 = *(void **)(a1 + 40);
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v6 managementQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_56;
  v8[3] = &unk_1E5B00D30;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = v4;
  dispatch_async(v7, v8);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_56(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) managementQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_6;
  v10[3] = &unk_1E5B00DD0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v11 = v3;
  uint64_t v12 = v5;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 48);
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v3;
  dispatch_async(v4, v10);
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_6(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*MEMORY[0x1E4F281F8];
  id v3 = [*(id *)(a1 + 32) domain];
  if ([v2 isEqual:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) code];

    if (v4 == 4097) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_msgSend(*(id *)(a1 + 32), "nr_safeDescription");
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v11;
      _os_log_error_impl(&dword_1A356E000, v7, OS_LOG_TYPE_ERROR, "_queryDaemonWithStartingTokenValue/xpcGetDiffSinceIndex: XPC error %{public}@", buf, 0xCu);
    }
  }
LABEL_9:
  uint64_t v8 = [*(id *)(a1 + 40) managementQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_59;
  v12[3] = &unk_1E5B00D30;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v13 = v9;
  uint64_t v14 = v10;
  dispatch_async(v8, v12);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_2_60(uint64_t a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = v9;
  uint64_t v12 = v11;
  if (a4)
  {
    id v13 = (void *)MEMORY[0x1A624A5B0]();
    uint64_t v14 = objc_alloc_init(NRMutableDeviceCollection);
    id v15 = [(NRMutableStateBase *)v14 applyDiff:v11];
    uint64_t v16 = [*(id *)(a1 + 32) collection];
    uint64_t v12 = +[NRMutableDeviceCollection diffFrom:v16 to:v14];
  }
  uint64_t v17 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_61;
  v20[3] = &unk_1E5B00D58;
  v20[4] = v17;
  id v21 = v10;
  uint64_t v24 = a5;
  id v22 = v12;
  id v23 = *(id *)(a1 + 40);
  id v18 = v12;
  id v19 = v10;
  [v17 enqueueBypassAsync:v20];
}

void __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_3_61(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) secureProperties];
  if (!v2) {
    uint64_t v2 = objc_opt_new();
  }
  [v2 forceImportSecureProperties:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) secureProperties];

  if (!v3) {
    [*(id *)(a1 + 32) setSecureProperties:v2];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    *(void *)(v4 + 112) = *(void *)(a1 + 64);
    uint64_t v5 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  BOOL v6 = [v5 collection];
  id v7 = (id)[v6 applyDiff:*(void *)(a1 + 48)];

  uint64_t v8 = [*(id *)(a1 + 32) managementQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_62;
  v11[3] = &unk_1E5B00D30;
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  id v12 = v9;
  uint64_t v13 = v10;
  dispatch_async(v8, v11);
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_4_62(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __91__NRRegistryClient__queryDaemonWithStartingTokenValue_currentTokenValue_syncXPC_withBlock___block_invoke_5_64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_warnAboutMissingEntitlement
{
  if (_NRIsInternalInstall___onceToken != -1) {
    dispatch_once(&_NRIsInternalInstall___onceToken, &__block_literal_global_18);
  }
  if (_NRIsInternalInstall___internalInstall && _warnAboutMissingEntitlement_onceToken != -1)
  {
    dispatch_once(&_warnAboutMissingEntitlement_onceToken, &__block_literal_global_66);
  }
}

void __48__NRRegistryClient__warnAboutMissingEntitlement__block_invoke()
{
  v0 = nr_framework_log();
  BOOL v1 = os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);

  if (v1)
  {
    uint64_t v2 = nr_framework_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A356E000, v2, OS_LOG_TYPE_ERROR, "** WARNING ** - Process does not have any entitlements to access NanoRegistry, you will receive a nil collection", buf, 2u);
    }
  }
  id v3 = nr_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_fault_impl(&dword_1A356E000, v3, OS_LOG_TYPE_FAULT, "Process is not entitled to access NanoRegistry - All NanoRegistry access is gated by entitlement, you have received a nil collection", v4, 2u);
  }
}

void __34__NRRegistryClient_setCollection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v2 devicesUpdateCounter];
  id v6 = *v3;
  id v7 = [*v3 collection];
  uint64_t v8 = [*v3 secureProperties];
  id v9 = v4;
  id v17 = v7;
  id v10 = v8;
  if (v6)
  {
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__0;
    id v27 = __Block_byref_object_dispose__0;
    id v28 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__NRRegistryClient__notifyDiffIndexObserversWithDiff_deviceCollection_secureProperties_index___block_invoke;
    v22[3] = &unk_1E5B00C68;
    v22[4] = v6;
    v22[5] = &v23;
    [v6 performUnderCollectionLock:v22];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = (id)v24[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v16 = [(id)v24[5] objectForKeyedSubscript:v15];
          ((void (**)(void, id, id, id, uint64_t, uint64_t))v16)[2](v16, v9, v17, v10, v15, v5);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
      }
      while (v12);
    }

    _Block_object_dispose(&v23, 8);
  }
}

- (void)invalidate
{
  id v3 = [(NRRegistry *)self managementQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__NRRegistryClient_invalidate__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)NRRegistryClient;
  [(NRRegistry *)&v4 invalidate];
}

uint64_t __30__NRRegistryClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) rawConnection];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_super v4 = [(id)v3 rawConnection];
    [v4 invalidate];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 92) != -1)
  {
    notify_cancel(*(_DWORD *)(v3 + 92));
    *(_DWORD *)(*(void *)(a1 + 32) + 92) = -1;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t result = *(unsigned int *)(v3 + 96);
  if (result != -1)
  {
    uint64_t result = notify_cancel(result);
    *(_DWORD *)(*(void *)(a1 + 32) + 96) = -1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryQueryCompletionBlockEntries, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_diffIndexObservers, 0);
}

@end