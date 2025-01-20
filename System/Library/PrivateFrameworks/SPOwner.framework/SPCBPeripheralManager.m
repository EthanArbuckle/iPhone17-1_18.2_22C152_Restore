@interface SPCBPeripheralManager
+ (id)remoteInterface;
- (BOOL)enableSystemWakes;
- (BOOL)forceUpdateCriteria;
- (CBCentralManager)centralManager;
- (FMQueueSynchronizer)queueSynchronizer;
- (FMTokenBucket)tokenBucket;
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (NSMutableDictionary)sessionMetadata;
- (NSMutableSet)pendingPairingIdentifiers;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)cbQueue;
- (OS_dispatch_queue)queue;
- (SPCBPeripheralManagementXPCProtocol)proxy;
- (SPCBPeripheralManager)init;
- (double)timeIntervalToNextFireDateFromDate:(id)a3;
- (id)_enforceRateLimit;
- (id)descriptionForVendorIdentifierList:(id)a3;
- (id)peripheralsUpdatedCallback;
- (void)enableSystemWakesForUpdate:(BOOL)a3 completion:(id)a4;
- (void)fetch;
- (void)handleDarwinNotificationNamed:(id)a3;
- (void)interruptionHandler:(id)a3;
- (void)invalidationHandler:(id)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setCbQueue:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setEnableSystemWakes:(BOOL)a3;
- (void)setForceUpdateCriteria:(BOOL)a3;
- (void)setPendingPairingIdentifiers:(id)a3;
- (void)setPeripheralsUpdatedCallback:(id)a3;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueSynchronizer:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setSessionMetadata:(id)a3;
- (void)setTokenBucket:(id)a3;
- (void)startSessionForUserIdentifier:(id)a3 bundleId:(id)a4 vendorIdentifierList:(id)a5 completion:(id)a6;
- (void)stopSessionForUserIdentifier:(id)a3 bundleId:(id)a4 completion:(id)a5;
- (void)successfulConnectionForPeripheral:(id)a3 leMAC:(id)a4 ltk:(id)a5 completion:(id)a6;
- (void)timerFiredForActivity:(id)a3;
@end

@implementation SPCBPeripheralManager

- (void)handleDarwinNotificationNamed:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: handleDarwinNotificationNamed %{public}@: ", (uint8_t *)&v6, 0xCu);
  }

  [(SPCBPeripheralManager *)self fetch];
}

- (SPCBPeripheralManager)init
{
  v38.receiver = self;
  v38.super_class = (Class)SPCBPeripheralManager;
  v2 = [(SPCBPeripheralManager *)&v38 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.searchparty.SPCBPeripheralManagement", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.searchparty.SPCBPeripheralManagement.callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F61558]) initWithQueue:v2->_queue];
    queueSynchronizer = v2->_queueSynchronizer;
    v2->_queueSynchronizer = (FMQueueSynchronizer *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F61570]) initWithFillRate:10.0 capacity:50.0];
    tokenBucket = v2->_tokenBucket;
    v2->_tokenBucket = (FMTokenBucket *)v11;

    uint64_t v13 = objc_opt_new();
    pendingPairingIdentifiers = v2->_pendingPairingIdentifiers;
    v2->_pendingPairingIdentifiers = (NSMutableSet *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, -1);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.searchparty.SPCBPeerDelegate", v16);
    cbQueue = v2->_cbQueue;
    v2->_cbQueue = (OS_dispatch_queue *)v17;

    v19 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__SPCBPeripheralManager_init__block_invoke;
    block[3] = &unk_1E601B790;
    v20 = v2;
    v37 = v20;
    dispatch_async(v19, block);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __29__SPCBPeripheralManager_init__block_invoke_2;
    aBlock[3] = &unk_1E601B8D0;
    v21 = v20;
    v35 = v21;
    v22 = _Block_copy(aBlock);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __29__SPCBPeripheralManager_init__block_invoke_3;
    v32[3] = &unk_1E601B8D0;
    v23 = v21;
    v33 = v23;
    v24 = _Block_copy(v32);
    id v25 = objc_alloc(MEMORY[0x1E4F61588]);
    v26 = +[SPCBPeripheralManager remoteInterface];
    uint64_t v27 = [v25 initWithMachServiceName:@"com.apple.searchparty.managedperipheral" options:0 remoteObjectInterface:v26 interruptionHandler:v22 invalidationHandler:v24];
    serviceDescription = v23->_serviceDescription;
    v23->_serviceDescription = (FMXPCServiceDescription *)v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionMetadata = v23->_sessionMetadata;
    v23->_sessionMetadata = v29;
  }
  return v2;
}

void __29__SPCBPeripheralManager_init__block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)observerTrampoline, @"SPManagedCBPeripheralChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __29__SPCBPeripheralManager_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) interruptionHandler:a2];
}

uint64_t __29__SPCBPeripheralManager_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invalidationHandler:a2];
}

- (void)startSessionForUserIdentifier:(id)a3 bundleId:(id)a4 vendorIdentifierList:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(SPCBPeripheralManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke;
  block[3] = &unk_1E601CC30;
  id v22 = v12;
  id v23 = v13;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

void __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  char v2 = _os_feature_enabled_impl();
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    dispatch_queue_t v4 = [v3 _enforceRateLimit];
    if (v4)
    {
      v5 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_14;
      block[3] = &unk_1E601C0C0;
      v28 = (SPCBPeripheralManagerSessionKey *)*(id *)(a1 + 64);
      id v27 = v4;
      dispatch_async(v5, block);

      int v6 = v28;
    }
    else
    {
      int v6 = [[SPCBPeripheralManagerSessionKey alloc] initWithUserIdentifier:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48)];
      uint64_t v8 = LogCategory_CBPeripheralManagement();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(SPCBPeripheralManagerSessionKey *)v6 userIdentifier];
        id v10 = [(SPCBPeripheralManagerSessionKey *)v6 bundleId];
        id v11 = [*(id *)(a1 + 32) descriptionForVendorIdentifierList:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 141558786;
        uint64_t v32 = 1752392040;
        __int16 v33 = 2112;
        v34 = v9;
        __int16 v35 = 2114;
        v36 = v10;
        __int16 v37 = 2114;
        objc_super v38 = v11;
        _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: Created session for <%{mask.hash}@:%{public}@>: %{public}@", buf, 0x2Au);
      }
      uint64_t v12 = *(void *)(a1 + 56);
      id v13 = [*(id *)(a1 + 32) sessionMetadata];
      [v13 setObject:v12 forKeyedSubscript:v6];

      v14 = [*(id *)(a1 + 32) callbackQueue];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      id v23 = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_16;
      v24 = &unk_1E601C288;
      id v25 = *(id *)(a1 + 64);
      dispatch_async(v14, &v21);

      objc_msgSend(*(id *)(a1 + 32), "fetch", v21, v22, v23, v24);
      if (*MEMORY[0x1E4F1BD70])
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1BD18]);
        id v16 = [*(id *)(a1 + 32) queue];
        id v17 = (void *)[v15 initWithDelegate:0 queue:v16];
        [*(id *)(a1 + 32) setCentralManager:v17];

        id v18 = *(void **)(a1 + 32);
        v19 = [v18 centralManager];
        id v20 = [v19 sharedPairingAgent];
        [v20 setDelegate:v18];
      }
    }
  }
  else
  {
    dispatch_queue_t v7 = [v3 callbackQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2;
    v29[3] = &unk_1E601C288;
    id v30 = *(id *)(a1 + 64);
    dispatch_async(v7, v29);

    dispatch_queue_t v4 = v30;
  }
}

void __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2(uint64_t a1)
{
  char v2 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.spowner.SPCBPeripheralErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

uint64_t __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopSessionForUserIdentifier:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SPCBPeripheralManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke;
  v15[3] = &unk_1E601CC58;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v2 = _os_feature_enabled_impl();
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    dispatch_queue_t v4 = [v3 _enforceRateLimit];
    if (v4)
    {
      v5 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_18;
      block[3] = &unk_1E601C0C0;
      id v23 = (SPCBPeripheralManagerSessionKey *)*(id *)(a1 + 56);
      id v22 = v4;
      dispatch_async(v5, block);

      int v6 = v23;
    }
    else
    {
      int v6 = [[SPCBPeripheralManagerSessionKey alloc] initWithUserIdentifier:*(void *)(a1 + 40) bundleIdentifier:*(void *)(a1 + 48)];
      id v8 = LogCategory_CBPeripheralManagement();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(SPCBPeripheralManagerSessionKey *)v6 userIdentifier];
        id v10 = [(SPCBPeripheralManagerSessionKey *)v6 bundleId];
        *(_DWORD *)buf = 141558530;
        uint64_t v27 = 1752392040;
        __int16 v28 = 2112;
        v29 = v9;
        __int16 v30 = 2114;
        v31 = v10;
        _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: Deleted session for <%{mask.hash}@:%{public}@>", buf, 0x20u);
      }
      id v11 = [*(id *)(a1 + 32) sessionMetadata];
      [v11 setObject:0 forKeyedSubscript:v6];

      id v12 = [*(id *)(a1 + 32) sessionMetadata];
      uint64_t v13 = [v12 count];

      id v14 = *(void **)(a1 + 32);
      if (v13)
      {
        [v14 fetch];
      }
      else
      {
        id v15 = [v14 peripheralsUpdatedCallback];

        if (v15)
        {
          id v16 = [*(id *)(a1 + 32) callbackQueue];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_19;
          v20[3] = &unk_1E601B790;
          v20[4] = *(void *)(a1 + 32);
          dispatch_async(v16, v20);
        }
        else
        {
          id v16 = LogCategory_CBPeripheralManagement();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_cold_1();
          }
        }
      }
      id v17 = [*(id *)(a1 + 32) callbackQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_20;
      v18[3] = &unk_1E601C288;
      id v19 = *(id *)(a1 + 56);
      dispatch_async(v17, v18);
    }
  }
  else
  {
    dispatch_queue_t v7 = [v3 callbackQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_2;
    v24[3] = &unk_1E601C288;
    id v25 = *(id *)(a1 + 56);
    dispatch_async(v7, v24);

    dispatch_queue_t v4 = v25;
  }
}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_2(uint64_t a1)
{
  char v2 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.spowner.SPCBPeripheralErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

uint64_t __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_19(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) peripheralsUpdatedCallback];
  v1[2](v1, MEMORY[0x1E4F1CBF0]);
}

uint64_t __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableSystemWakesForUpdate:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_queue_t v7 = [(SPCBPeripheralManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke;
  block[3] = &unk_1E601BC78;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v2 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    int v8 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: enableSystemWakesForUpdate: %d", buf, 8u);
  }

  [*(id *)(a1 + 32) setEnableSystemWakes:*(unsigned __int8 *)(a1 + 48)];
  dispatch_queue_t v4 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke_21;
  block[3] = &unk_1E601C288;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);
}

uint64_t __63__SPCBPeripheralManager_enableSystemWakesForUpdate_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)successfulConnectionForPeripheral:(id)a3 leMAC:(id)a4 ltk:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SPCBPeripheralManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke;
  block[3] = &unk_1E601CC30;
  id v22 = v11;
  id v23 = v13;
  void block[4] = self;
  id v20 = v10;
  id v21 = v12;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

void __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke(uint64_t a1)
{
  char v2 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: successfulConnectionForPeripheral:leMAC:ltk:", buf, 2u);
  }

  char v3 = _os_feature_enabled_impl();
  dispatch_queue_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 _enforceRateLimit];
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_23;
      block[3] = &unk_1E601C0C0;
      id v22 = *(id *)(a1 + 64);
      id v5 = v5;
      id v21 = v5;
      dispatch_async(v6, block);

      dispatch_queue_t v7 = v22;
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 40) ltkIndexMap];
      id v10 = [v9 objectForKeyedSubscript:*(void *)(a1 + 48)];
      uint64_t v11 = [v10 unsignedLongLongValue];

      id v12 = [*(id *)(a1 + 32) proxy];
      id v13 = [*(id *)(a1 + 40) userIdentifier];
      id v14 = [*(id *)(a1 + 40) beaconIdentifier];
      uint64_t v15 = [*(id *)(a1 + 40) primaryIndex];
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_2;
      v18[3] = &unk_1E601CC80;
      void v18[4] = *(void *)(a1 + 32);
      id v19 = *(id *)(a1 + 64);
      [v12 successfulConnectionForUserIdentifier:v13 beaconIdentifier:v14 primaryIndex:v15 leMAC:v16 ltkIndex:v11 ltk:v17 completion:v18];

      dispatch_queue_t v7 = v19;
    }
  }
  else
  {
    int v8 = [v4 callbackQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_22;
    v23[3] = &unk_1E601C288;
    id v24 = *(id *)(a1 + 64);
    dispatch_async(v8, v23);

    id v5 = v24;
  }
}

void __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_22(uint64_t a1)
{
  char v2 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  dispatch_queue_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.spowner.SPCBPeripheralErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

uint64_t __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = [*(id *)(a1 + 32) callbackQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_3;
  v7[3] = &unk_1E601C0C0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __80__SPCBPeripheralManager_successfulConnectionForPeripheral_leMAC_ltk_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairingAgent:peerDidCompletePairing %{public}@", buf, 0xCu);
  }

  dispatch_queue_t v7 = [(SPCBPeripheralManager *)self cbQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke;
  v9[3] = &unk_1E601B920;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) pendingPairingIdentifiers];
  id v3 = [*(id *)(a1 + 40) identifier];
  char v4 = [v2 containsObject:v3];

  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) pendingPairingIdentifiers];
    id v6 = [*(id *)(a1 + 40) identifier];
    [v5 addObject:v6];

    dispatch_queue_t v7 = [*(id *)(a1 + 32) proxy];
    id v8 = [*(id *)(a1 + 40) identifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke_2;
    v10[3] = &unk_1E601CCA8;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v7 pairLowEnergyAccessoryWithIdentifier:v8 completion:v10];
  }
}

void __61__SPCBPeripheralManager_pairingAgent_peerDidCompletePairing___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = LogCategory_CBPeripheralManagement();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v7 = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairLowEnergyAccessory did complete with error %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairLowEnergyAccessory completed successfully!", (uint8_t *)&v7, 2u);
    }

    char v4 = [*(id *)(a1 + 32) pendingPairingIdentifiers];
    id v6 = [*(id *)(a1 + 40) identifier];
    [v4 removeObject:v6];
  }
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: pairingAgent:peerDidUnpair %{public}@", buf, 0xCu);
  }

  int v7 = [(SPCBPeripheralManager *)self cbQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SPCBPeripheralManager_pairingAgent_peerDidUnpair___block_invoke;
  v9[3] = &unk_1E601B920;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

void __52__SPCBPeripheralManager_pairingAgent_peerDidUnpair___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) proxy];
  char v2 = [*(id *)(a1 + 40) identifier];
  [v3 unpairLowEnergyAccessoryWithIdentifier:v2 completion:&__block_literal_global_14];
}

void __52__SPCBPeripheralManager_pairingAgent_peerDidUnpair___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = LogCategory_CBPeripheralManagement();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138543362;
      id v9 = v2;
      id v5 = "SPCBPeripheralManager: unpairLowEnergyAccessory did complete with error %{public}@";
      id v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "SPCBPeripheralManager: unpairLowEnergyAccessory completed successfully!";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (void)interruptionHandler:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: interruptionHandler %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)invalidationHandler:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: invalidationHandler %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SPCBPeripheralManager *)self setSession:0];
}

- (SPCBPeripheralManagementXPCProtocol)proxy
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  id v3 = [(SPCBPeripheralManager *)self queueSynchronizer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__SPCBPeripheralManager_proxy__block_invoke;
  v6[3] = &unk_1E601C1E0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 conditionalSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SPCBPeripheralManagementXPCProtocol *)v4;
}

void __30__SPCBPeripheralManager_proxy__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) session];

  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F61590]);
    id v4 = [*(id *)(a1 + 32) serviceDescription];
    int v5 = (void *)[v3 initWithServiceDescription:v4];
    [*(id *)(a1 + 32) setSession:v5];

    int v6 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) serviceDescription];
      uint64_t v8 = [v7 machService];
      int v14 = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1B2FD8000, v6, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: Establishing XPC connection to %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = [*(id *)(a1 + 32) session];
    [v9 resume];
  }
  uint64_t v10 = [*(id *)(a1 + 32) session];
  uint64_t v11 = [v10 proxy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_8 != -1) {
    dispatch_once(&remoteInterface_onceToken_8, &__block_literal_global_27);
  }
  id v2 = (void *)remoteInterface_interface_7;

  return v2;
}

uint64_t __40__SPCBPeripheralManager_remoteInterface__block_invoke()
{
  remoteInterface_interface_7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44110];

  return MEMORY[0x1F41817F8]();
}

- (id)descriptionForVendorIdentifierList:(id)a3
{
  id v3 = objc_msgSend(a3, "fm_map:", &__block_literal_global_84);
  id v4 = NSString;
  int v5 = [v3 componentsJoinedByString:@", "];
  int v6 = [v4 stringWithFormat:@"[%@]", v5];

  return v6;
}

uint64_t __60__SPCBPeripheralManager_descriptionForVendorIdentifierList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%08x", objc_msgSend(a2, "unsignedIntValue"));
}

- (double)timeIntervalToNextFireDateFromDate:(id)a3
{
  id v3 = a3;
  [v3 timeIntervalSinceReferenceDate];
  double v5 = ceil(v4 / 900.0);
  [v3 timeIntervalSinceReferenceDate];
  double v7 = v6;

  return -(v7 - v5 * 900.0);
}

- (void)timerFiredForActivity:(id)a3
{
  id v4 = a3;
  double v5 = [(SPCBPeripheralManager *)self queueSynchronizer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SPCBPeripheralManager_timerFiredForActivity___block_invoke;
  v7[3] = &unk_1E601B920;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v5 conditionalSync:v7];
}

uint64_t __47__SPCBPeripheralManager_timerFiredForActivity___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B2FD8000, v2, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: timerFired: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 40) fetch];
  [*(id *)(a1 + 40) setForceUpdateCriteria:1];
  return [*(id *)(a1 + 32) updateCriteria];
}

- (void)fetch
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B2FD8000, v4, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: fetch (fetchBase: %@)", buf, 0xCu);
  }

  int v5 = [(SPCBPeripheralManager *)self queueSynchronizer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__SPCBPeripheralManager_fetch__block_invoke;
  v7[3] = &unk_1E601B920;
  void v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [v5 conditionalSync:v7];
}

void __30__SPCBPeripheralManager_fetch__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionMetadata];
  id v3 = [v2 allKeys];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__SPCBPeripheralManager_fetch__block_invoke_2;
  v11[3] = &unk_1E601CCF0;
  v11[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "fm_map:", v11);

  int v5 = [[SPCBPeripheralKeyRequest alloc] initWithDate:*(void *)(a1 + 40) requestParameters:v4];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__SPCBPeripheralManager_fetch__block_invoke_3;
  v8[3] = &unk_1E601CD40;
  v8[4] = *(void *)(a1 + 32);
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  uint64_t v7 = v5;
  _os_activity_initiate(&dword_1B2FD8000, "fetch", OS_ACTIVITY_FLAG_DEFAULT, v8);
}

SPCBPeripheralKeyRequestParameters *__30__SPCBPeripheralManager_fetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [SPCBPeripheralKeyRequestParameters alloc];
  int v5 = [*(id *)(a1 + 32) sessionMetadata];
  uint64_t v6 = [v5 objectForKeyedSubscript:v3];
  uint64_t v7 = [(SPCBPeripheralKeyRequestParameters *)v4 initWithSessionKey:v3 vendorIdentifierList:v6];

  return v7;
}

void __30__SPCBPeripheralManager_fetch__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SPCBPeripheralManager_fetch__block_invoke_4;
  v4[3] = &unk_1E601CD18;
  v4[5] = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 bluetoothConnectionKeysFor:v3 completion:v4];
}

void __30__SPCBPeripheralManager_fetch__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  double v9 = *(double *)(a1 + 40);
  uint64_t v10 = LogCategory_CBPeripheralManagement();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v35 = (v8 - v9) * 1000.0;
    _os_log_impl(&dword_1B2FD8000, v10, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: fetch duration: %.02f ms", buf, 0xCu);
  }

  if (v6)
  {
    uint64_t v11 = LogCategory_CBPeripheralManagement();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __30__SPCBPeripheralManager_fetch__block_invoke_4_cold_2((uint64_t)v6, v11);
    }
  }
  else if (v5)
  {
    uint64_t v12 = [*(id *)(a1 + 32) peripheralsUpdatedCallback];

    uint64_t v13 = LogCategory_CBPeripheralManagement();
    int v14 = v13;
    if (v12)
    {
      uint64_t v25 = a1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v5 peripherals];
        double v16 = COERCE_DOUBLE([v15 count]);
        *(_DWORD *)buf = 134217984;
        double v35 = v16;
        _os_log_impl(&dword_1B2FD8000, v14, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: peripheral count: %lu", buf, 0xCu);
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v26 = v5;
      uint64_t v17 = [v5 peripherals];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            double v22 = *(double *)(*((void *)&v29 + 1) + 8 * i);
            id v23 = LogCategory_CBPeripheralManagement();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              double v35 = v22;
              _os_log_impl(&dword_1B2FD8000, v23, OS_LOG_TYPE_DEFAULT, "SPCBPeripheralManager: peripheral: %@", buf, 0xCu);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v19);
      }

      id v24 = [*(id *)(v25 + 32) callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__SPCBPeripheralManager_fetch__block_invoke_99;
      block[3] = &unk_1E601B920;
      void block[4] = *(void *)(v25 + 32);
      id v5 = v26;
      id v28 = v26;
      dispatch_async(v24, block);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_cold_1();
      }
    }
  }
}

void __30__SPCBPeripheralManager_fetch__block_invoke_99(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) peripheralsUpdatedCallback];
  id v2 = [*(id *)(a1 + 40) peripherals];
  v3[2](v3, v2);
}

- (id)_enforceRateLimit
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  uint64_t v3 = [(SPCBPeripheralManager *)self queueSynchronizer];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SPCBPeripheralManager__enforceRateLimit__block_invoke;
  v6[3] = &unk_1E601C1E0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 conditionalSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__SPCBPeripheralManager__enforceRateLimit__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tokenBucket];
  char v3 = [v2 operationAllowed];

  if ((v3 & 1) == 0)
  {
    v13[0] = @"delay";
    id v4 = NSNumber;
    id v5 = [*(id *)(a1 + 32) tokenBucket];
    [v5 timeIntervalUntilOperationAllowed];
    id v6 = objc_msgSend(v4, "numberWithDouble:");
    v13[1] = @"stats";
    v14[0] = v6;
    uint64_t v7 = [*(id *)(a1 + 32) tokenBucket];
    double v8 = [v7 dumpStatistics];
    v14[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.spowner.SPCBPeripheralErrorDomain" code:2 userInfo:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)peripheralsUpdatedCallback
{
  return self->_peripheralsUpdatedCallback;
}

- (void)setPeripheralsUpdatedCallback:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (FMQueueSynchronizer)queueSynchronizer
{
  return self->_queueSynchronizer;
}

- (void)setQueueSynchronizer:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (FMTokenBucket)tokenBucket
{
  return self->_tokenBucket;
}

- (void)setTokenBucket:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (NSMutableDictionary)sessionMetadata
{
  return self->_sessionMetadata;
}

- (void)setSessionMetadata:(id)a3
{
}

- (BOOL)enableSystemWakes
{
  return self->_enableSystemWakes;
}

- (void)setEnableSystemWakes:(BOOL)a3
{
  self->_enableSystemWakes = a3;
}

- (BOOL)forceUpdateCriteria
{
  return self->_forceUpdateCriteria;
}

- (void)setForceUpdateCriteria:(BOOL)a3
{
  self->_forceUpdateCriteria = a3;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableSet)pendingPairingIdentifiers
{
  return self->_pendingPairingIdentifiers;
}

- (void)setPendingPairingIdentifiers:(id)a3
{
}

- (OS_dispatch_queue)cbQueue
{
  return self->_cbQueue;
}

- (void)setCbQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbQueue, 0);
  objc_storeStrong((id *)&self->_pendingPairingIdentifiers, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_sessionMetadata, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_tokenBucket, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queueSynchronizer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_peripheralsUpdatedCallback, 0);
}

void __96__SPCBPeripheralManager_startSessionForUserIdentifier_bundleId_vendorIdentifierList_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2FD8000, v0, v1, "FindMy/ManagedCBPeripheral feature flag is not enabled!", v2, v3, v4, v5, v6);
}

void __74__SPCBPeripheralManager_stopSessionForUserIdentifier_bundleId_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1B2FD8000, v0, v1, "SPCBPeripheralManager: fetch response with no callback registered!", v2, v3, v4, v5, v6);
}

void __30__SPCBPeripheralManager_fetch__block_invoke_4_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_ERROR, "SPCBPeripheralManager: fetch error: %@", (uint8_t *)&v2, 0xCu);
}

@end