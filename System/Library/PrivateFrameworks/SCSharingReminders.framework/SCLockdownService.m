@interface SCLockdownService
- (DSRemotePairingStore)remotePairingStore;
- (OS_dispatch_queue)workQueue;
- (SCLockdownService)init;
- (id)interestedNotifications;
- (void)fetchWifiSyncIdentifiersWithCompletion:(id)a3;
- (void)hostForIdentifier:(id)a3 completion:(id)a4;
- (void)setRemotePairingStore:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation SCLockdownService

- (id)interestedNotifications
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:&unk_270903188];
}

- (SCLockdownService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCLockdownService;
  v2 = [(SCLockdownService *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F38C50]);
    [(SCLockdownService *)v2 setRemotePairingStore:v3];

    dispatch_queue_t v4 = dispatch_queue_create("LockdownServiceQueue", 0);
    [(SCLockdownService *)v2 setWorkQueue:v4];
  }
  return v2;
}

- (void)fetchWifiSyncIdentifiersWithCompletion:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = [(SCLockdownService *)self remotePairingStore];
    objc_super v6 = [(SCLockdownService *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke;
    v7[3] = &unk_265497190;
    id v8 = v4;
    [v5 fetchPairedDevicesOnQueue:v6 completion:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x263EFFA68]);
  }
}

void __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = SCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "lockdownFrameworkKey", (void)v23);

        if (v21)
        {
          v22 = [v20 lockdownFrameworkKey];
          [v14 addObject:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hostForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(SCLockdownService *)self remotePairingStore];
  int v9 = [v8 isWifiSyncEnabled];
  if (!v6 || !v9)
  {

    goto LABEL_6;
  }
  char v10 = _os_feature_enabled_impl();

  if ((v10 & 1) == 0)
  {
LABEL_6:
    v7[2](v7, 0);
    goto LABEL_7;
  }
  uint64_t v11 = [(SCLockdownService *)self remotePairingStore];
  uint64_t v12 = [(SCLockdownService *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__SCLockdownService_hostForIdentifier_completion___block_invoke;
  v13[3] = &unk_2654971B8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  [v11 fetchPairedDevicesOnQueue:v12 completion:v13];

LABEL_7:
}

void __50__SCLockdownService_hostForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = SCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v14 = [*(id *)(a1 + 32) interestedNotifications];
  int v15 = [v14 containsObject:*(void *)(a1 + 40)];

  if (v15)
  {
    CFArrayRef v16 = (const __CFArray *)lockdown_copy_wireless_connections_list();
    if (v16)
    {
      CFArrayRef v17 = v16;
      uint64_t v18 = CFArrayGetValueAtIndex(v16, 0);
      CFRelease(v17);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v34 = v6;
      id v19 = v6;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v37;
        while (2)
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v24 = [*(id *)(*((void *)&v36 + 1) + 8 * v23) lockdownFrameworkKey];
            int v25 = [v18 isEqualToString:v24];

            if (v25)
            {
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

              goto LABEL_22;
            }
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      long long v26 = SCLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25B654000, v26, OS_LOG_TYPE_DEFAULT, "\"Found no wirelessly connected hosts\"", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_22:

      id v6 = v34;
    }
  }
  else
  {
    v27 = SCLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __50__SCLockdownService_hostForIdentifier_completion___block_invoke_cold_1(a1 + 40, v27, v28, v29, v30, v31, v32, v33);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (DSRemotePairingStore)remotePairingStore
{
  return self->_remotePairingStore;
}

- (void)setRemotePairingStore:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remotePairingStore, 0);
}

void __60__SCLockdownService_fetchWifiSyncIdentifiersWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__SCLockdownService_hostForIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end