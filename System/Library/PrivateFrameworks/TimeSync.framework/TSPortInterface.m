@interface TSPortInterface
- (TSPortInterface)initWithgPTPPort:(id)a3 onClockIdentifier:(unint64_t)a4;
- (TSgPTPPort)port;
- (void)didTimeoutOnMACLookupForPort:(id)a3;
- (void)setMACLookupTimeoutCallback:(void *)a3 refcon:(void *)a4;
- (void)setPort:(id)a3;
@end

@implementation TSPortInterface

- (TSPortInterface)initWithgPTPPort:(id)a3 onClockIdentifier:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSPortInterface;
  v8 = [(TSPortInterface *)&v13 init];
  if (v8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.timesync.TSPortInterface.0x%016llx.%hu.notifications", a4, objc_msgSend(v7, "portNumber"));
    id v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
    notificationsQueue = v8->_notificationsQueue;
    v8->_notificationsQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_port, a3);
  }

  return v8;
}

- (void)setMACLookupTimeoutCallback:(void *)a3 refcon:(void *)a4
{
  notificationsQueue = self->_notificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__TSPortInterface_setMACLookupTimeoutCallback_refcon___block_invoke;
  block[3] = &unk_1E622B2D0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(notificationsQueue, block);
}

void __54__TSPortInterface_setMACLookupTimeoutCallback_refcon___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) port];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v4 = [*(id *)(a1 + 32) port];
    v5 = v4;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    if (*(void *)(a1 + 40))
    {
      if (!v6)
      {
        objc_msgSend(v4, "addClient:");
        [v5 registerAsyncCallbackError:0];
      }
    }
    else if (v6)
    {
      [v4 deregisterAsyncCallbackError:0];
      [v5 removeClient:*(void *)(a1 + 32)];
    }
  }
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
}

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TSPortInterface *)self description];
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = [v5 UTF8String];
    __int16 v12 = 1024;
    int v13 = [v4 portNumber];
    __int16 v14 = 2048;
    uint64_t v15 = [v4 clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s didTimeoutOnMACLookupForPort:%hu (0x%016llx)\n", buf, 0x1Cu);
  }
  notificationsQueue = self->_notificationsQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__TSPortInterface_didTimeoutOnMACLookupForPort___block_invoke;
  v8[3] = &unk_1E622AAB0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(notificationsQueue, v8);
}

void __48__TSPortInterface_didTimeoutOnMACLookupForPort___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1BA9F1DF0]();
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(a1 + 32) description];
      uint64_t v4 = [v3 UTF8String];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v5 + 24);
      int v8 = [*(id *)(a1 + 40) portNumber];
      uint64_t v9 = [*(id *)(a1 + 40) clockIdentifier];
      int v17 = 136316162;
      uint64_t v18 = v4;
      __int16 v19 = 2048;
      uint64_t v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      __int16 v23 = 1024;
      int v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = v9;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s calling MAC lookup timeout callback function %p refcon %p port %hu (0x%016llx)\n", (uint8_t *)&v17, 0x30u);
    }
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 24));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 32) description];
      uint64_t v11 = [v10 UTF8String];
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(v12 + 16);
      uint64_t v14 = *(void *)(v12 + 24);
      int v15 = [*(id *)(a1 + 40) portNumber];
      uint64_t v16 = [*(id *)(a1 + 40) clockIdentifier];
      int v17 = 136316162;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 1024;
      int v24 = v15;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s finished MAC lookup timeout callback function %p refcon %p port %hu (0x%016llx)\n", (uint8_t *)&v17, 0x30u);
    }
  }
}

- (TSgPTPPort)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_notificationsQueue, 0);
}

@end