@interface PKIDSManager
- (BOOL)_queue_deviceIsRegistered:(id)a3;
- (BOOL)_queue_hasRegisteredAccounts;
- (BOOL)_queue_hasRemoteDevices;
- (BOOL)hasRemoteDevices;
- (IDSService)service;
- (NSArray)delegates;
- (NSArray)paymentRequests;
- (NSArray)remoteDevices;
- (NSMutableArray)pendingCancellations;
- (NSMutableDictionary)pendingDiscoveries;
- (NSMutableDictionary)recentlySeenUUIDs;
- (OS_dispatch_queue)internalQueue;
- (PKIDSManager)init;
- (PKIDSManager)initWithIDSService:(id)a3;
- (PKIDSManager)initWithTargetQueue:(id)a3;
- (PKIDSManagerDataSource)dataSource;
- (id)_fetchPaymentInstrumentsForRequestingDevice:(id)a3;
- (id)_preparePaymentDeviceResponseForRequestingDevice:(id)a3 userDisabled:(BOOL)a4;
- (id)_queue_cancelRemotePaymentRequest:(id)a3 completion:(id)a4;
- (id)_queue_requestForIdentifier:(id)a3;
- (id)_remoteDevicesWithArchive;
- (id)cancelRemotePaymentRequest:(id)a3 completion:(id)a4;
- (id)requestForIdentifier:(id)a3;
- (id)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 completion:(id)a6;
- (id)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (id)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (id)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (id)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (id)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5;
- (id)sendRemotePaymentRequest:(id)a3 completion:(id)a4;
- (id)sendSetupRequest:(id)a3 appDisplayName:(id)a4 completion:(id)a5;
- (int64_t)_paymentAuthorizationStatusForPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)_createThumbnailCacheDirectory;
- (void)_paymentCancellationReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentClientUpdateReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentDiscoveryRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentDiscoveryResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentHostUpdateReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_paymentSetupRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_postCTLMThrottleUncapNotification;
- (void)_promptDetailsForVirtualCardRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_queue_addThumbnailCompletionHandler:(id)a3 forKey:(id)a4;
- (void)_queue_logCloudPairingState;
- (void)_queue_removeThumbnailCompletionHandlersForKeys:(id)a3;
- (void)_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:(BOOL)a3;
- (void)_queue_sendDeviceDiscoveryRequestWithProximity:(BOOL)a3 devices:(id)a4;
- (void)_queue_sendDiscoveryResponse:(id)a3 toDeviceWithFromID:(id)a4;
- (void)_registerCTLMThrottleUncapNotification;
- (void)_registerListeners;
- (void)_thumbnailRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_thumbnailResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_unregisterCTLMThrottleUncapNotification;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)deleteArchivedDevices;
- (void)discoverRemoteDevices;
- (void)discoverRemoteDevicesWithProximity:(BOOL)a3;
- (void)invalidateMessage:(id)a3;
- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setPendingCancellations:(id)a3;
- (void)setPendingDiscoveries:(id)a3;
- (void)setRecentlySeenUUIDs:(id)a3;
- (void)setService:(id)a3;
@end

@implementation PKIDSManager

- (PKIDSManager)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.applepay"];
  v4 = [(PKIDSManager *)self initWithIDSService:v3];
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Initializing IDS manager", v7, 2u);
    }
  }
  return v4;
}

- (PKIDSManager)initWithTargetQueue:(id)a3
{
  v4 = a3;
  v5 = [(PKIDSManager *)self init];
  v6 = v5;
  if (v5)
  {
    dispatch_set_target_queue((dispatch_object_t)v5->_internalQueue, v4);
    dispatch_set_target_queue((dispatch_object_t)v6->_callbackQueue, v4);
  }

  return v6;
}

- (PKIDSManager)initWithIDSService:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PKIDSManager;
  v6 = [(PKIDSManager *)&v33 init];
  v7 = v6;
  if (v6)
  {
    v6->_delegatesLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passd.idsmanager.internal", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.passd.idsmanager.callback", 0);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_service, a3);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    remoteDevices = v7->_remoteDevices;
    v7->_remoteDevices = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    paymentRequests = v7->_paymentRequests;
    v7->_paymentRequests = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingCancellations = v7->_pendingCancellations;
    v7->_pendingCancellations = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingDiscoveries = v7->_pendingDiscoveries;
    v7->_pendingDiscoveries = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    thumbnailCompletionHandlers = v7->_thumbnailCompletionHandlers;
    v7->_thumbnailCompletionHandlers = v22;

    v24 = objc_alloc_init(PKProximityAdvertiser);
    proximityAdvertiser = v7->_proximityAdvertiser;
    v7->_proximityAdvertiser = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recentlySeenUUIDs = v7->_recentlySeenUUIDs;
    v7->_recentlySeenUUIDs = v26;

    [(PKIDSManager *)v7 _registerCTLMThrottleUncapNotification];
    [(PKIDSManager *)v7 _registerListeners];
    [(PKIDSManager *)v7 _createThumbnailCacheDirectory];
    v28 = v7->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PKIDSManager_initWithIDSService___block_invoke;
    block[3] = &unk_1E56D8AE0;
    v29 = v7;
    v32 = v29;
    dispatch_async(v28, block);
    [(IDSService *)v7->_service addDelegate:v29 queue:v7->_internalQueue];
  }
  return v7;
}

uint64_t __35__PKIDSManager_initWithIDSService___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  v4 = [v2 _remoteDevicesWithArchive];
  [v3 addObjectsFromArray:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 _populateDevicesIfNeeded];
}

- (void)dealloc
{
  [(IDSService *)self->_service removeDelegate:self];
  [(PKIDSManager *)self _unregisterCTLMThrottleUncapNotification];
  v3.receiver = self;
  v3.super_class = (Class)PKIDSManager;
  [(PKIDSManager *)&v3 dealloc];
}

- (NSArray)delegates
{
  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  v4 = [(NSHashTable *)self->_delegates allObjects];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_delegatesLock);
  return (NSArray *)v5;
}

- (void)addDelegate:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_delegatesLock);
  delegates = self->_delegates;
  if (!delegates)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    id v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_delegates;
    self->_delegates = v5;

    delegates = self->_delegates;
  }
  [(NSHashTable *)delegates addObject:v7];
  os_unfair_lock_unlock(&self->_delegatesLock);
}

- (void)removeDelegate:(id)a3
{
  p_delegatesLock = &self->_delegatesLock;
  id v5 = a3;
  os_unfair_lock_lock(p_delegatesLock);
  [(NSHashTable *)self->_delegates removeObject:v5];

  os_unfair_lock_unlock(p_delegatesLock);
}

- (NSArray)remoteDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__76;
  dispatch_queue_t v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PKIDSManager_remoteDevices__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__PKIDSManager_remoteDevices__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)paymentRequests
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__76;
  dispatch_queue_t v10 = __Block_byref_object_dispose__76;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__PKIDSManager_paymentRequests__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__PKIDSManager_paymentRequests__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasRemoteDevices
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__PKIDSManager_hasRemoteDevices__block_invoke;
  v5[3] = &unk_1E56DC5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__PKIDSManager_hasRemoteDevices__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_hasRemoteDevices");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)discoverRemoteDevices
{
}

- (void)discoverRemoteDevicesWithProximity:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke;
  v4[3] = &unk_1E56D8B80;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(internalQueue, v4);
}

void __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_hasRegisteredAccounts");
  unsigned int v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_hasRemoteDevices");
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    unsigned int v5 = v3;
    uint64_t v6 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 134218496;
      uint64_t v21 = v7;
      __int16 v22 = 2048;
      uint64_t v23 = v2;
      __int16 v24 = 2048;
      uint64_t v25 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKIDSManager: skipped discovering remote devices, proximityEnabled: %ld, hasRegisteredAccounts: %ld, hasRemoteDevices: %ld", buf, 0x20u);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) setProximityState:2];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v10);
    }

    v13 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      v14 = (void *)v13[5];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_2;
      v15[3] = &unk_1E56DB8E8;
      v15[4] = v13;
      [v14 startAdvertisingForDuration:v15 completion:30.0];
    }
    else
    {
      objc_msgSend(v13, "_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "_queue_logCloudPairingState");
  }
}

void __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(NSObject **)(v4 + 120);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_3;
  v7[3] = &unk_1E56D8A90;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __51__PKIDSManager_discoverRemoteDevicesWithProximity___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:", *(void *)(a1 + 32) == 0);
}

- (id)sendSetupRequest:(id)a3 appDisplayName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke;
  v16[3] = &unk_1E56D8BA8;
  id v17 = v9;
  long long v18 = self;
  id v19 = v8;
  id v20 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(internalQueue, v16);

  return 0;
}

void __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke(uint64_t a1)
{
  unsigned int v2 = objc_alloc_init(PKProtobufPaymentSetupRequest);
  [(PKProtobufPaymentSetupRequest *)v2 setAppName:*(void *)(a1 + 32)];
  id v3 = objc_alloc(MEMORY[0x1E4F6B528]);
  uint64_t v4 = [(PKProtobufPaymentSetupRequest *)v2 data];
  unsigned int v5 = (void *)[v3 initWithProtobufData:v4 type:7 isResponse:0];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__76;
  v12[4] = __Block_byref_object_dispose__76;
  id v13 = 0;
  id v6 = *(void **)(*(void *)(a1 + 40) + 104);
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 48), "pk_idsDestination");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_2;
  v9[3] = &unk_1E56F3458;
  id v8 = *(id *)(a1 + 56);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v8;
  uint64_t v11 = v12;
  PKProtobufSend(v6, v5, (uint64_t)v7, 0, 0, v9);

  _Block_object_dispose(v12, 8);
}

void __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_3;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      uint64_t v11 = *(void **)(a1[4] + 24);
      id v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __59__PKIDSManager_sendSetupRequest_appDisplayName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)sendRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__76;
  uint64_t v21 = __Block_byref_object_dispose__76;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke;
  v13[3] = &unk_1E56F3480;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  long long v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) startAdvertisingForDuration:0 completion:30.0];
  unsigned int v2 = objc_alloc_init(PKProtobufRemotePaymentRequest);
  id v3 = [*(id *)(a1 + 40) paymentRequest];
  uint64_t v4 = [v3 protobuf];
  [(PKProtobufRemotePaymentRequest *)v2 setPaymentRequest:v4];

  unsigned int v5 = [*(id *)(a1 + 40) selectedApplicationIdentifier];
  [(PKProtobufRemotePaymentRequest *)v2 setPaymentApplicationIdentifier:v5];

  -[PKProtobufRemotePaymentRequest setPaymentType:](v2, "setPaymentType:", [*(id *)(a1 + 40) selectedPaymentMethodType]);
  id v6 = [*(id *)(a1 + 40) identifier];
  [(PKProtobufRemotePaymentRequest *)v2 setIdentifier:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F6B528]);
  id v8 = [(PKProtobufRemotePaymentRequest *)v2 data];
  id v9 = (void *)[v7 initWithProtobufData:v8 type:2 isResponse:0];

  id v10 = *(void **)(*(void *)(a1 + 32) + 104);
  id v11 = [*(id *)(a1 + 40) device];
  id v12 = objc_msgSend(v11, "pk_idsDestination");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_2;
  v14[3] = &unk_1E56F3458;
  id v13 = *(id *)(a1 + 48);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  uint64_t v16 = *(void *)(a1 + 56);
  PKProtobufSend(v10, v9, (uint64_t)v12, 0, 0, v14);

  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

void __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      id v11 = *(void **)(a1[4] + 24);
      id v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __52__PKIDSManager_sendRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__76;
  uint64_t v27 = __Block_byref_object_dispose__76;
  id v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E56EA658;
  id v18 = v8;
  id v19 = v9;
  id v20 = self;
  id v21 = v10;
  id v22 = &v23;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(internalQueue, block);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) protobuf];
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 setRemotePaymentRequestIdentifier:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F6B528]);
  unsigned int v5 = [v2 data];
  id v6 = (void *)[v4 initWithProtobufData:v5 type:4 isResponse:0];

  id v7 = *(void **)(*(void *)(a1 + 48) + 104);
  id v8 = [*(id *)(a1 + 40) device];
  id v9 = objc_msgSend(v8, "pk_idsDestination");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  v11[3] = &unk_1E56F3458;
  id v10 = *(id *)(a1 + 56);
  v11[4] = *(void *)(a1 + 48);
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 64);
  PKProtobufSend(v7, v6, (uint64_t)v9, 0, 0, v11);
}

void __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      id v11 = *(void **)(a1[4] + 24);
      id v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __73__PKIDSManager_sendPaymentHostUpdate_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__76;
  uint64_t v27 = __Block_byref_object_dispose__76;
  id v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E56EA658;
  id v18 = v8;
  id v19 = v9;
  id v20 = self;
  id v21 = v10;
  id v22 = &v23;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(internalQueue, block);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) protobuf];
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 setRemotePaymentRequestIdentifier:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F6B528]);
  unsigned int v5 = [v2 data];
  id v6 = (void *)[v4 initWithProtobufData:v5 type:3 isResponse:0];

  id v7 = *(void **)(*(void *)(a1 + 48) + 104);
  id v8 = [*(id *)(a1 + 40) device];
  id v9 = objc_msgSend(v8, "pk_idsDestination");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2;
  v11[3] = &unk_1E56F3458;
  id v10 = *(id *)(a1 + 56);
  v11[4] = *(void *)(a1 + 48);
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 64);
  PKProtobufSend(v7, v6, (uint64_t)v9, 0, 0, v11);
}

void __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      id v11 = *(void **)(a1[4] + 24);
      id v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __75__PKIDSManager_sendPaymentClientUpdate_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__76;
  uint64_t v27 = __Block_byref_object_dispose__76;
  id v28 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E56EA658;
  id v18 = v9;
  id v19 = v8;
  id v20 = self;
  id v21 = v10;
  id v22 = &v23;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(internalQueue, block);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  AnalyticsSendEvent();
  unsigned int v2 = objc_alloc_init(PKProtobufRemotePaymentResponse);
  id v3 = [*(id *)(a1 + 32) identifier];
  [(PKProtobufRemotePaymentResponse *)v2 setRemotePaymentRequestIdentifier:v3];

  id v4 = [*(id *)(a1 + 40) protobuf];
  [(PKProtobufRemotePaymentResponse *)v2 setPayment:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F6B528]);
  id v6 = [(PKProtobufRemotePaymentResponse *)v2 data];
  id v7 = (void *)[v5 initWithProtobufData:v6 type:2 isResponse:1];

  id v8 = *(void **)(*(void *)(a1 + 48) + 104);
  id v9 = [*(id *)(a1 + 32) device];
  id v10 = objc_msgSend(v9, "pk_idsDestination");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56F3458;
  id v11 = *(id *)(a1 + 56);
  v12[4] = *(void *)(a1 + 48);
  id v13 = v11;
  uint64_t v14 = *(void *)(a1 + 64);
  PKProtobufSend(v8, v7, (uint64_t)v10, 0, 0, v12);
}

void __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      id v11 = *(void **)(a1[4] + 24);
      id v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __63__PKIDSManager_sendPayment_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__76;
  v26 = __Block_byref_object_dispose__76;
  id v27 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke;
  block[3] = &unk_1E56EA658;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v21 = &v22;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(internalQueue, block);
  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _paymentAuthorizationStatusForPaymentResult:*(void *)(a1 + 40) forRemotePaymentRequest:*(void *)(a1 + 48)];
  id v3 = objc_alloc_init(PKProtobufPaymentStatus);
  [(PKProtobufPaymentStatus *)v3 setStatus:v2];
  id v4 = [*(id *)(a1 + 48) identifier];
  [(PKProtobufPaymentStatus *)v3 setRemotePaymentRequestIdentifier:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F6B528]);
  id v6 = [(PKProtobufPaymentStatus *)v3 data];
  id v7 = (void *)[v5 initWithProtobufData:v6 type:5 isResponse:0];

  id v8 = *(void **)(*(void *)(a1 + 32) + 104);
  id v9 = [*(id *)(a1 + 48) device];
  id v10 = objc_msgSend(v9, "pk_idsDestination");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2;
  v12[3] = &unk_1E56F3458;
  id v11 = *(id *)(a1 + 56);
  v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  uint64_t v14 = *(void *)(a1 + 64);
  PKProtobufSend(v8, v7, (uint64_t)v10, 0, 0, v12);

  if (!v2) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 48)];
  }
}

void __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_3;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      id v11 = *(void **)(a1[4] + 24);
      id v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __69__PKIDSManager_sendPaymentResult_forRemotePaymentRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(PKPaymentAuthorizationResult);
  [(PKPaymentAuthorizationResult *)v10 setStatus:a3];
  id v11 = [(PKIDSManager *)self sendPaymentResult:v10 forRemotePaymentRequest:v9 completion:v8];

  return v11;
}

- (id)cancelRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__76;
  id v21 = __Block_byref_object_dispose__76;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__PKIDSManager_cancelRemotePaymentRequest_completion___block_invoke;
  v13[3] = &unk_1E56F3480;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(internalQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __54__PKIDSManager_cancelRemotePaymentRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_cancelRemotePaymentRequest:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a3;
  id v11 = a6;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__76;
  id v28 = __Block_byref_object_dispose__76;
  id v29 = 0;
  internalQueue = self->_internalQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke;
  v17[3] = &unk_1E56F3520;
  CGFloat v22 = width;
  CGFloat v23 = height;
  id v18 = v10;
  uint64_t v19 = self;
  id v20 = v11;
  id v21 = &v24;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(internalQueue, v17);
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) manifestHash];
  uint64_t v3 = [v2 hexEncoding];
  id v4 = +[PKRemotePaymentInstrument thumbnailCachePathForManifestHash:size:](PKRemotePaymentInstrument, "thumbnailCachePathForManifestHash:size:", v3, *(double *)(a1 + 64), *(double *)(a1 + 72));

  id v5 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) passIdentifier];
    id v7 = [*(id *)(a1 + 32) manifestHash];
    id v8 = [v7 hexEncoding];
    *(_DWORD *)buf = 138412802;
    v55 = v4;
    __int16 v56 = 2112;
    v57 = v6;
    __int16 v58 = 2112;
    v59 = v8;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Looking for card thumbnail: %@ for instrument: %@ with manifest: %@", buf, 0x20u);
  }
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v4 isDirectory:0];

  if (!v10
    || ([MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v16 = objc_alloc_init(PKProtobufPaymentInstrumentThumbnailRequest);
    uint64_t v17 = [*(id *)(a1 + 32) passIdentifier];
    [(PKProtobufPaymentInstrumentThumbnailRequest *)v16 setPassIdentifier:v17];

    id v18 = [*(id *)(a1 + 32) manifestHash];
    uint64_t v19 = [v18 hexEncoding];
    [(PKProtobufPaymentInstrumentThumbnailRequest *)v16 setManifestHash:v19];

    [(PKProtobufPaymentInstrumentThumbnailRequest *)v16 setWidth:*(double *)(a1 + 64)];
    [(PKProtobufPaymentInstrumentThumbnailRequest *)v16 setHeight:*(double *)(a1 + 72)];
    id v20 = *(void **)(*(void *)(a1 + 40) + 32);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_53;
    v52[3] = &unk_1E56F34A8;
    id v15 = v16;
    v53 = v15;
    id v21 = [v20 keysOfEntriesPassingTest:v52];
    if ([v21 count])
    {
      CGFloat v22 = [v21 anyObject];
      uint64_t v23 = [v22 requestIdentifier];
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      uint64_t v26 = *(void *)(a1 + 48);
      if (v26) {
        objc_msgSend(*(id *)(a1 + 40), "_queue_addThumbnailCompletionHandler:forKey:", v26, v22);
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v28 = *(void **)(*(void *)(a1 + 40) + 8);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2;
      v49[3] = &unk_1E56F34D0;
      id v50 = *(id *)(a1 + 32);
      id v29 = v27;
      id v51 = v29;
      [v28 enumerateObjectsUsingBlock:v49];
      if ([v29 count])
      {
        id v30 = objc_alloc(MEMORY[0x1E4F6B528]);
        v31 = [(PKProtobufPaymentInstrumentThumbnailRequest *)v15 data];
        v32 = (void *)[v30 initWithProtobufData:v31 type:8 isResponse:0];

        objc_super v33 = *(void **)(*(void *)(a1 + 40) + 104);
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2_59;
        v43[3] = &unk_1E56F34F8;
        id v34 = *(id *)(a1 + 48);
        uint64_t v35 = *(void *)(a1 + 40);
        id v45 = v34;
        v43[4] = v35;
        v36 = v15;
        uint64_t v37 = *(void *)(a1 + 56);
        v44 = v36;
        uint64_t v46 = v37;
        PKProtobufSendWithOptions(v33, v32, v29, 300, 0, 1, 0, v43, 0);
      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v38 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v55 = v38;
          _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't find remote device to send thumbnail request: %@", buf, 0xCu);
        }

        v39 = *(NSObject **)(*(void *)(a1 + 40) + 64);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_57;
        v47[3] = &unk_1E56D8360;
        id v48 = *(id *)(a1 + 48);
        dispatch_async(v39, v47);
        v32 = v48;
      }
    }
    id v12 = 0;
    goto LABEL_21;
  }
  id v12 = (id)v11;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Found cached image", buf, 2u);
  }

  id v13 = *(void **)(a1 + 48);
  if (v13)
  {
    id v14 = *(NSObject **)(*(void *)(a1 + 40) + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_61;
    block[3] = &unk_1E56D83D8;
    v42 = v13;
    id v12 = v12;
    id v41 = v12;
    dispatch_async(v14, block);

    id v15 = v42;
LABEL_21:
  }
}

uint64_t __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 requestDictionary];
  id v4 = [*(id *)(a1 + 32) dictionaryRepresentation];
  uint64_t v5 = [v3 isEqualToDictionary:v4];

  return v5;
}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(v3, "remotePaymentInstruments", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) passIdentifier];
        int v10 = [*(id *)(a1 + 32) passIdentifier];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          id v12 = *(void **)(a1 + 40);
          id v13 = objc_msgSend(v3, "pk_idsDestination");
          [v12 addObject:v13];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_57(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_2_59(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (id v8 = *(void **)(a1 + 48)) != 0)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_3;
    v12[3] = &unk_1E56D83D8;
    id v14 = v8;
    id v13 = v7;
    dispatch_async(v9, v12);
  }
  else if (v6 && *(void *)(a1 + 48))
  {
    int v10 = objc_alloc_init(PKRemoteThumbnailKey);
    [(PKRemoteThumbnailKey *)v10 setRequestIdentifier:v6];
    int v11 = [*(id *)(a1 + 40) dictionaryRepresentation];
    [(PKRemoteThumbnailKey *)v10 setRequestDictionary:v11];

    objc_msgSend(*(id *)(a1 + 32), "_queue_addThumbnailCompletionHandler:forKey:", *(void *)(a1 + 48), v10);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
}

uint64_t __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __75__PKIDSManager_requestInstrumentThumbnail_forRemoteDevice_size_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)invalidateMessage:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PKIDSManager_invalidateMessage___block_invoke;
  v7[3] = &unk_1E56D8A90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __34__PKIDSManager_invalidateMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)requestForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__76;
  long long v16 = __Block_byref_object_dispose__76;
  id v17 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PKIDSManager_requestForIdentifier___block_invoke;
  block[3] = &unk_1E56F3548;
  id v10 = v4;
  int v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(internalQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __37__PKIDSManager_requestForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_requestForIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke;
  v13[3] = &unk_1E56D8BD0;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, v13);
}

void __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) startAdvertisingForDuration:0 completion:30.0];
  uint64_t v2 = objc_alloc_init(PKProtobufPromptDetailsForVirtualCard);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  [(PKProtobufPromptDetailsForVirtualCard *)v2 setIdentifier:v3];

  [(PKProtobufPromptDetailsForVirtualCard *)v2 setShowNotification:*(unsigned __int8 *)(a1 + 56)];
  id v4 = objc_alloc(MEMORY[0x1E4F6B528]);
  uint64_t v5 = [(PKProtobufPromptDetailsForVirtualCard *)v2 data];
  id v6 = (void *)[v4 initWithProtobufData:v5 type:9 isResponse:0];

  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = *(void **)(*(void *)(a1 + 32) + 8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2;
  v14[3] = &unk_1E56F3570;
  id v15 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v14];
  id v10 = *(void **)(*(void *)(a1 + 32) + 104);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_3;
  v12[3] = &unk_1E56D91C8;
  id v11 = *(id *)(a1 + 48);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v11;
  PKProtobufSendWithOptions(v10, v6, v9, 300, 0, 1, 0, v12, 0);
}

void __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 type] == 1 || objc_msgSend(v5, "type") == 2) && !objc_msgSend(v5, "proximityState"))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = objc_msgSend(v5, "pk_idsDestination");
    [v3 addObject:v4];
  }
}

void __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to send prompt details for virtual card request: %@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_63;
    v10[3] = &unk_1E56D83D8;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __72__PKIDSManager_promptDetailsForVirtualCard_showNotification_completion___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_paymentSetupRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(IDSService *)self->_service deviceForFromID:a6];

  if (v10)
  {
    id v11 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Received payment setup request", buf, 2u);
    }

    [(PKIDSManager *)self _postCTLMThrottleUncapNotification];
    id v12 = [PKProtobufPaymentSetupRequest alloc];
    id v22 = v9;
    id v13 = [v9 data];
    id v14 = [(PKProtobufPaymentSetupRequest *)v12 initWithData:v13];

    uint64_t v15 = [(PKIDSManager *)self delegates];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __76__PKIDSManager__paymentSetupRequestReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8A90;
          void block[4] = v20;
          uint64_t v24 = v14;
          dispatch_async(callbackQueue, block);

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    id v9 = v22;
  }
}

void __76__PKIDSManager__paymentSetupRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) appName];
    [v2 didReceiveSetupRequest:v3];
  }
}

- (void)_paymentDiscoveryRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v34 = a4;
  id v35 = a5;
  id v13 = a6;
  id v36 = a7;
  id v14 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Received discovery request", buf, 2u);
  }

  uint64_t v15 = [(IDSService *)self->_service deviceForFromID:v13];
  BOOL v16 = [(PKIDSManager *)self _queue_deviceIsRegistered:v15];

  if (v16)
  {
    uint64_t v17 = -[IDSService deviceForFromID:](self->_service, "deviceForFromID:", v13, v34, v35, v36);
    *(void *)buf = 0;
    id v41 = buf;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__76;
    v44 = __Block_byref_object_dispose__76;
    id v45 = 0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v17 name];
      uint64_t v19 = [v17 uniqueID];
      *(_DWORD *)uint64_t v46 = 138412546;
      id v47 = v18;
      __int16 v48 = 2112;
      v49 = v19;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Received payment discovery request from %@ - %@", v46, 0x16u);
    }
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    [v20 setObject:@"discovery-request" forKeyedSubscript:@"message"];
    uint64_t v21 = [(PKIDSManagerDataSource *)self->_dataSource continuityDisabledByUser:self];
    if (v21)
    {
      BOOL v22 = 0;
    }
    else
    {
      uint64_t v23 = [PKProtobufPaymentDeviceRequest alloc];
      uint64_t v24 = [v12 data];
      long long v25 = [(PKProtobufPaymentDeviceRequest *)v23 initWithData:v24];

      BOOL v26 = [(PKProtobufPaymentDeviceRequest *)v25 shouldAdvertise];
      BOOL v22 = v26;
      if (v26)
      {
        long long v27 = [PKProximityDetector alloc];
        long long v28 = [v17 nsuuid];
        id v29 = [(PKProximityDetector *)v27 initWithAdvertisingDeviceUUID:v28];

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke;
        aBlock[3] = &unk_1E56F35C0;
        aBlock[4] = self;
        v39 = buf;
        id v38 = v13;
        id v30 = _Block_copy(aBlock);
        [(PKProximityDetector *)v29 setHandler:v30];
        [(PKProximityDetector *)v29 startDetectingWithDuration:0 completion:30.0];
        [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"proximity"];
      }
      else
      {
        [v20 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"proximity"];
      }
    }
    uint64_t v31 = [(PKIDSManager *)self _preparePaymentDeviceResponseForRequestingDevice:v17 userDisabled:v21];
    v32 = (void *)*((void *)v41 + 5);
    *((void *)v41 + 5) = v31;

    if (!v22) {
      [(PKIDSManager *)self _queue_sendDiscoveryResponse:*((void *)v41 + 5) toDeviceWithFromID:v13];
    }
    objc_super v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*((id *)v41 + 5), "locked"));
    [v20 setObject:v33 forKeyedSubscript:@"locked"];

    AnalyticsSendEvent();
    [(PKIDSManager *)self _queue_logCloudPairingState];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Received payment discovery request, ignoring (device not recognized)", buf, 2u);
    }
    uint64_t v17 = v14;
  }
}

void __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 120);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke_2;
  block[3] = &unk_1E56F3598;
  char v15 = a4;
  void block[4] = v7;
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v9 = (id)v11;
  long long v14 = v11;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __80__PKIDSManager__paymentDiscoveryRequestReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [v3 setNearby:v4];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 112);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setObject:v7 forKey:*(void *)(a1 + 40)];
  }
  else
  {
    [*(id *)(v5 + 112) removeObjectForKey:*(void *)(a1 + 40)];
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  return objc_msgSend(v8, "_queue_sendDiscoveryResponse:toDeviceWithFromID:", v10, v9);
}

- (void)_paymentRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [(IDSService *)self->_service deviceForFromID:a6];
  long long v11 = [PKProtobufRemotePaymentRequest alloc];
  id v12 = [v9 data];
  id v13 = [(PKProtobufRemotePaymentRequest *)v11 initWithData:v12];

  pendingCancellations = self->_pendingCancellations;
  char v15 = [(PKProtobufRemotePaymentRequest *)v13 identifier];
  int v16 = [(NSMutableArray *)pendingCancellations containsObject:v15];

  if (([(PKIDSManagerDataSource *)self->_dataSource continuityDisabledByUser:self] & 1) != 0
    || ((![(PKIDSManager *)self _queue_deviceIsRegistered:v10] | v16) & 1) != 0)
  {
    uint64_t v17 = PKLogFacilityTypeGetObject(8uLL);
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        uint64_t v19 = "Received payment request but handoff is disabled or device unrecognized. Ignoring.";
LABEL_8:
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
      }
    }
    else if (v18)
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = "Received payment request but was previously cancelled. Ignoring.";
      goto LABEL_8;
    }
  }
  else
  {
    AnalyticsSendEvent();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke;
    aBlock[3] = &unk_1E56D8AB8;
    v40 = v9;
    id v20 = v10;
    id v41 = v20;
    uint64_t v42 = self;
    uint64_t v21 = _Block_copy(aBlock);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_3;
    v37[3] = &unk_1E56D8A18;
    v37[4] = self;
    id v22 = v21;
    id v38 = v22;
    uint64_t v23 = (void (**)(void))_Block_copy(v37);
    recentlySeenUUIDs = self->_recentlySeenUUIDs;
    long long v25 = [v20 nsuuid];
    BOOL v26 = [(NSMutableDictionary *)recentlySeenUUIDs objectForKey:v25];

    if (v26 && ([v26 timeIntervalSinceNow], v27 > -300.0))
    {
      long long v28 = PKLogFacilityTypeGetObject(8uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, "Found device in recently seen devices. Displaying payment request", buf, 2u);
      }

      v23[2](v23);
    }
    else
    {
      id v29 = PKLogFacilityTypeGetObject(8uLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Device not found in recently seen devices. Triggering proximity detection", buf, 2u);
      }

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [(NSMutableDictionary *)self->_recentlySeenUUIDs description];
        *(_DWORD *)buf = 138412290;
        v44 = v30;
        _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Recently seen devices: %@", buf, 0xCu);
      }
      uint64_t v31 = [PKProximityDetector alloc];
      v32 = [v20 nsuuid];
      objc_super v33 = [(PKProximityDetector *)v31 initWithAdvertisingDeviceUUID:v32];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_95;
      v35[3] = &unk_1E56F35E8;
      v35[4] = self;
      id v36 = v23;
      id v34 = _Block_copy(v35);
      [(PKProximityDetector *)v33 setHandler:v34];
      [(PKProximityDetector *)v33 startDetectingWithDuration:0 completion:30.0];
    }
    uint64_t v17 = v40;
  }
}

void __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v2 = [PKProtobufRemotePaymentRequest alloc];
  id v3 = [*(id *)(a1 + 32) data];
  uint64_t v4 = [(PKProtobufRemotePaymentRequest *)v2 initWithData:v3];

  uint64_t v5 = [[PKRemoteDevice alloc] initWithIDSDevice:*(void *)(a1 + 40)];
  id v6 = [PKRemotePaymentRequest alloc];
  uint64_t v7 = [(PKProtobufRemotePaymentRequest *)v4 identifier];
  id v8 = [(PKRemotePaymentRequest *)v6 initWithDevice:v5 identifier:v7];

  id v9 = [(PKProtobufRemotePaymentRequest *)v4 paymentRequest];
  uint64_t v10 = +[PKPaymentRequest requestWithProtobuf:v9];

  long long v11 = [MEMORY[0x1E4F1CAD0] set];
  [v10 setRequiredBillingContactFields:v11];

  id v12 = [MEMORY[0x1E4F1CAD0] set];
  [v10 setRequiredShippingContactFields:v12];

  [(PKRemotePaymentRequest *)v8 setPaymentRequest:v10];
  id v13 = [(PKProtobufRemotePaymentRequest *)v4 paymentApplicationIdentifier];
  [(PKRemotePaymentRequest *)v8 setSelectedApplicationIdentifier:v13];

  uint64_t v21 = v4;
  [(PKRemotePaymentRequest *)v8 setSelectedPaymentMethodType:[(PKProtobufRemotePaymentRequest *)v4 paymentType]];
  if (([*(id *)(*(void *)(a1 + 48) + 16) containsObject:v8] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 48) + 16) addObject:v8];
  }
  [*(id *)(a1 + 48) _postCTLMThrottleUncapNotification];
  long long v14 = [*(id *)(a1 + 48) delegates];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v20 = *(NSObject **)(*(void *)(a1 + 48) + 64);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_2;
        block[3] = &unk_1E56D8A90;
        void block[4] = v19;
        uint64_t v23 = v8;
        dispatch_async(v20, block);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }
}

uint64_t __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 didReceiveRemotePaymentRequest:v4];
  }
  return result;
}

uint64_t __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_3(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    int v2 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Requested a payment request to be presented, but we're already displaying one. Cancelling existing requests...", buf, 2u);
    }

    id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v3;
    uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v21)
    {
      uint64_t v19 = *(void *)v28;
      *(void *)&long long v4 = 138412290;
      long long v17 = v4;
      id v20 = v2;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_queue_cancelRemotePaymentRequest:completion:", v6, 0, v17);
          if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
          {
            id v8 = [v6 identifier];
            *(_DWORD *)buf = v17;
            objc_super v33 = v8;
            _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled request: %@", buf, 0xCu);
          }
          id v9 = [*(id *)(a1 + 32) delegates];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * j);
                uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 64);
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_92;
                block[3] = &unk_1E56D8A90;
                void block[4] = v14;
                void block[5] = v6;
                dispatch_async(v15, block);
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v11);
          }

          int v2 = v20;
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v21);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_92(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 didReceiveCancellationForRemotePaymentRequest:v4];
  }
  return result;
}

void __71__PKIDSManager__paymentRequestReceived_service_account_fromID_context___block_invoke_95(uint64_t a1, void *a2, void *a3, char a4)
{
  id v12 = a2;
  id v7 = *(void **)(*(void *)(a1 + 32) + 112);
  if (a4)
  {
    id v8 = a3;
    [v7 removeObjectForKey:v8];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v12 endDetecting];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1C9C8];
    id v10 = a3;
    uint64_t v11 = [v9 date];
    [v7 setObject:v11 forKey:v10];
  }
}

- (void)_paymentResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(IDSService *)self->_service deviceForFromID:a6];

  if (v10)
  {
    uint64_t v11 = [PKProtobufRemotePaymentResponse alloc];
    id v24 = v9;
    id v12 = [v9 data];
    id v13 = [(PKProtobufRemotePaymentResponse *)v11 initWithData:v12];

    uint64_t v14 = [(PKProtobufRemotePaymentResponse *)v13 remotePaymentRequestIdentifier];
    uint64_t v15 = [(PKIDSManager *)self _queue_requestForIdentifier:v14];

    uint64_t v16 = [(PKProtobufRemotePaymentResponse *)v13 payment];
    long long v17 = +[PKPayment paymentWithProtobuf:v16];

    [(PKIDSManager *)self delegates];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __72__PKIDSManager__paymentResponseReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8AB8;
          void block[4] = v22;
          id v27 = v17;
          id v28 = v15;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v19);
    }

    id v9 = v24;
  }
}

uint64_t __72__PKIDSManager__paymentResponseReceived_service_account_fromID_context___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didReceivePayment:v4 forRemotePaymentRequest:v5];
  }
  return result;
}

- (void)_paymentResultReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(IDSService *)self->_service deviceForFromID:a6];

  if (v10)
  {
    uint64_t v11 = [PKProtobufPaymentStatus alloc];
    id v27 = v9;
    id v12 = [v9 data];
    id v13 = [(PKProtobufPaymentStatus *)v11 initWithData:v12];

    uint64_t v14 = [(PKProtobufPaymentStatus *)v13 remotePaymentRequestIdentifier];
    id v28 = [(PKIDSManager *)self _queue_requestForIdentifier:v14];

    uint64_t v15 = objc_alloc_init(PKPaymentAuthorizationResult);
    [(PKPaymentAuthorizationResult *)v15 setStatus:[(PKProtobufPaymentStatus *)v13 status]];
    [(PKPaymentAuthorizationResult *)v15 setResultSource:1];
    if (![(PKProtobufPaymentStatus *)v13 status]) {
      [(NSMutableArray *)self->_paymentRequests removeObject:v28];
    }
    v37[0] = @"message";
    v37[1] = @"complete";
    v38[0] = @"payment";
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[PKProtobufPaymentStatus status](v13, "status", v13) == 0);
    v38[1] = v16;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    AnalyticsSendEvent();

    uint64_t v18 = self;
    [(PKIDSManager *)self delegates];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v19 = v35 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * v23);
          callbackQueue = v18->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__PKIDSManager__paymentResultReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8AB8;
          void block[4] = v24;
          long long v30 = v15;
          id v31 = v28;
          dispatch_async(callbackQueue, block);

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v21);
    }

    id v9 = v27;
  }
}

uint64_t __70__PKIDSManager__paymentResultReceived_service_account_fromID_context___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didReceivePaymentResult:v4 forRemotePaymentRequest:v5];
  }
  return result;
}

- (void)_paymentCancellationReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(IDSService *)self->_service deviceForFromID:a6];

  if (v10)
  {
    AnalyticsSendEvent();
    uint64_t v11 = [PKProtobufPaymentCancellation alloc];
    id v28 = v9;
    id v12 = [v9 data];
    id v13 = [(PKProtobufPaymentCancellation *)v11 initWithData:v12];

    uint64_t v14 = [(PKProtobufPaymentCancellation *)v13 remotePaymentRequestIdentifier];
    uint64_t v15 = [(PKIDSManager *)self _queue_requestForIdentifier:v14];

    uint64_t v16 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [(PKProtobufPaymentCancellation *)v13 remotePaymentRequestIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Received cancellation for payment request with identifier: %@", buf, 0xCu);
    }
    uint64_t v18 = [(PKIDSManager *)self delegates];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __76__PKIDSManager__paymentCancellationReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8A90;
          void block[4] = v23;
          id v30 = v15;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v20);
    }
    if (v15)
    {
      [(NSMutableArray *)self->_paymentRequests removeObject:v15];
      long long v25 = v13;
      id v9 = v28;
    }
    else
    {
      pendingCancellations = self->_pendingCancellations;
      long long v25 = v13;
      id v27 = [(PKProtobufPaymentCancellation *)v13 remotePaymentRequestIdentifier];
      [(NSMutableArray *)pendingCancellations safelyAddObject:v27];

      id v9 = v28;
    }
  }
}

uint64_t __76__PKIDSManager__paymentCancellationReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 didReceiveCancellationForRemotePaymentRequest:v4];
  }
  return result;
}

- (void)_paymentHostUpdateReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(IDSService *)self->_service deviceForFromID:a6];

  if (v10)
  {
    uint64_t v11 = [PKProtobufPaymentHostUpdate alloc];
    id v25 = v9;
    id v12 = [v9 data];
    id v13 = [(PKProtobufPaymentHostUpdate *)v11 initWithData:v12];

    uint64_t v14 = [(PKProtobufPaymentHostUpdate *)v13 remotePaymentRequestIdentifier];
    uint64_t v15 = [(PKIDSManager *)self _queue_requestForIdentifier:v14];

    uint64_t v16 = +[PKPaymentHostUpdate paymentUpdateWithProtobuf:v13];
    long long v17 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v16 description];
      *(_DWORD *)buf = 138412290;
      id v36 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Received payment host update: %@", buf, 0xCu);
    }
    [(PKIDSManager *)self delegates];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __74__PKIDSManager__paymentHostUpdateReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8AB8;
          void block[4] = v23;
          id v28 = v16;
          id v29 = v15;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v9 = v25;
  }
}

uint64_t __74__PKIDSManager__paymentHostUpdateReceived_service_account_fromID_context___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didReceivePaymentHostUpdate:v4 forRemotePaymentRequest:v5];
  }
  return result;
}

- (void)_paymentClientUpdateReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [(IDSService *)self->_service deviceForFromID:a6];

  if (v10)
  {
    AnalyticsSendEvent();
    uint64_t v11 = [PKProtobufPaymentClientUpdate alloc];
    id v25 = v9;
    id v12 = [v9 data];
    id v13 = [(PKProtobufPaymentClientUpdate *)v11 initWithData:v12];

    uint64_t v14 = [(PKProtobufPaymentClientUpdate *)v13 remotePaymentRequestIdentifier];
    uint64_t v15 = [(PKIDSManager *)self _queue_requestForIdentifier:v14];

    uint64_t v16 = +[PKPaymentClientUpdate paymentUpdateResponseWithProtobuf:v13];
    long long v17 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v16 description];
      *(_DWORD *)buf = 138412290;
      id v36 = v18;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Received payment client update: %@", buf, 0xCu);
    }
    [(PKIDSManager *)self delegates];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __76__PKIDSManager__paymentClientUpdateReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8AB8;
          void block[4] = v23;
          id v28 = v16;
          id v29 = v15;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v9 = v25;
  }
}

uint64_t __76__PKIDSManager__paymentClientUpdateReceived_service_account_fromID_context___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 didReceivePaymentClientUpdate:v4 forRemotePaymentRequest:v5];
  }
  return result;
}

- (void)_thumbnailRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = [(IDSService *)self->_service deviceForFromID:v15];

  if (v17)
  {
    uint64_t v18 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Received thumbnail request", buf, 2u);
    }
    id v42 = v13;

    uint64_t v19 = (void *)MEMORY[0x192FDC630]();
    uint64_t v20 = [PKProtobufPaymentInstrumentThumbnailRequest alloc];
    uint64_t v21 = [v12 data];
    uint64_t v22 = [(PKProtobufPaymentInstrumentThumbnailRequest *)v20 initWithData:v21];

    id v41 = v14;
    if (objc_opt_respondsToSelector())
    {
      [(PKProtobufPaymentInstrumentThumbnailRequest *)v22 width];
      double v24 = v23;
      [(PKProtobufPaymentInstrumentThumbnailRequest *)v22 height];
      double v26 = v25;
      dataSource = self->_dataSource;
      id v28 = [(PKProtobufPaymentInstrumentThumbnailRequest *)v22 passIdentifier];
      uint64_t v29 = -[PKIDSManagerDataSource thumbnailImageForPassIdentifier:size:manager:](dataSource, "thumbnailImageForPassIdentifier:size:manager:", v28, self, v24, v26);

      long long v30 = objc_alloc_init(PKProtobufPaymentInstrumentThumbnailResponse);
      long long v31 = v30;
      if (v29)
      {
        [(PKProtobufPaymentInstrumentThumbnailResponse *)v30 setStatus:0];
        long long v32 = [MEMORY[0x1E4F1C9B8] dataWithCGImage:v29];
        [(PKProtobufPaymentInstrumentThumbnailResponse *)v31 setThumbnailImage:v32];

        long long v33 = [(PKProtobufPaymentInstrumentThumbnailRequest *)v22 manifestHash];
        [(PKProtobufPaymentInstrumentThumbnailResponse *)v31 setManifestHash:v33];

LABEL_9:
        id v34 = objc_alloc(MEMORY[0x1E4F6B528]);
        long long v35 = [(PKProtobufPaymentInstrumentThumbnailResponse *)v31 data];
        id v36 = (void *)[v34 initWithProtobufData:v35 type:8 isResponse:1];

        service = self->_service;
        uint64_t v38 = [(IDSService *)service deviceForFromID:v15];
        v39 = objc_msgSend(v38, "pk_idsDestination");
        v40 = [v16 outgoingResponseIdentifier];
        PKProtobufSend(service, v36, (uint64_t)v39, v40, 0, &__block_literal_global_202);

        id v14 = v41;
        id v13 = v42;
        goto LABEL_10;
      }
    }
    else
    {
      long long v31 = objc_alloc_init(PKProtobufPaymentInstrumentThumbnailResponse);
    }
    -[PKProtobufPaymentInstrumentThumbnailResponse setStatus:](v31, "setStatus:", 1, v14);
    goto LABEL_9;
  }
LABEL_10:
}

void __73__PKIDSManager__thumbnailRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 localizedDescription];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_promptDetailsForVirtualCardRequestReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Received virtual card details request", buf, 2u);
  }

  uint64_t v18 = [(IDSService *)self->_service deviceForFromID:v15];
  if (v18)
  {
    uint64_t v29 = v18;
    id v30 = v14;
    id v31 = v13;
    uint64_t v19 = [PKProtobufPromptDetailsForVirtualCard alloc];
    uint64_t v20 = [v12 data];
    uint64_t v21 = [(PKProtobufPromptDetailsForVirtualCard *)v19 initWithData:v20];

    uint64_t v22 = [(PKIDSManager *)self delegates];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __91__PKIDSManager__promptDetailsForVirtualCardRequestReceived_service_account_fromID_context___block_invoke;
          block[3] = &unk_1E56D8A90;
          void block[4] = v27;
          long long v33 = v21;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v24);
    }

    id v13 = v31;
    id v14 = v30;
    uint64_t v18 = v29;
  }
}

void __91__PKIDSManager__promptDetailsForVirtualCardRequestReceived_service_account_fromID_context___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    int v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) identifier];
    objc_msgSend(v2, "didReceivePromptForVirtualCard:showNotification:", v3, objc_msgSend(*(id *)(a1 + 40), "showNotification"));
  }
}

- (void)_paymentDiscoveryResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [(IDSService *)self->_service deviceForFromID:a6];
  uint64_t v11 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 name];
    id v13 = [v10 uniqueID];
    *(_DWORD *)buf = 138412546;
    v90 = v12;
    __int16 v91 = 2112;
    v92 = v13;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Received discovery response from device name:%@; identifier:%@",
      buf,
      0x16u);
  }
  if (v10)
  {
    id v14 = [v10 uniqueID];

    if (v14)
    {
      oslog = v11;
      uint64_t v60 = self;
      pendingDiscoveries = self->_pendingDiscoveries;
      id v16 = [v10 uniqueID];
      [(NSMutableDictionary *)pendingDiscoveries removeObjectForKey:v16];

      v61 = v10;
      v59 = [[PKRemoteDevice alloc] initWithIDSDevice:v10];
      long long v17 = [PKProtobufPaymentDeviceResponse alloc];
      id v62 = v9;
      uint64_t v18 = [v9 data];
      uint64_t v19 = [(PKProtobufPaymentDeviceResponse *)v17 initWithData:v18];

      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v63 = v19;
      obuint64_t j = [(PKProtobufPaymentDeviceResponse *)v19 paymentInstruments];
      uint64_t v21 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
      v65 = v20;
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v82 != v23) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = +[PKRemotePaymentInstrument remotePaymentInstrumentWithProtobuf:*(void *)(*((void *)&v81 + 1) + 8 * i)];
            id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            uint64_t v27 = [v25 paymentApplications];
            uint64_t v28 = [v27 countByEnumeratingWithState:&v77 objects:v87 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v78;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v78 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  long long v32 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                  if ([v32 supportsInAppPayment]
                    && [v32 supportsComboCard])
                  {
                    long long v33 = [v32 paymentApplicationsIncludingAuxiliaryPaymentTypes];
                    [v26 addObjectsFromArray:v33];
                  }
                  else
                  {
                    [v26 addObject:v32];
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v77 objects:v87 count:16];
              }
              while (v29);
            }

            long long v34 = objc_msgSend(v26, "pk_arrayCopy");
            [v25 setPaymentApplications:v34];

            uint64_t v20 = v65;
            [v65 addObject:v25];
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
        }
        while (v22);
      }

      if ([(PKProtobufPaymentDeviceResponse *)v63 hasDefaultPaymentInstrumentIndex])
      {
        long long v35 = objc_msgSend(v20, "objectAtIndex:", -[PKProtobufPaymentDeviceResponse defaultPaymentInstrumentIndex](v63, "defaultPaymentInstrumentIndex"));
        long long v36 = v59;
        [(PKRemoteDevice *)v59 setDefaultRemotePaymentInstrument:v35];
        long long v37 = v60;
      }
      else
      {
        long long v35 = oslog;
        long long v36 = v59;
        long long v37 = v60;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "No default card was found when parsing discovery response", buf, 2u);
        }
      }

      [(PKRemoteDevice *)v36 setRemotePaymentInstruments:v20];
      [(PKRemoteDevice *)v36 setIsLocked:[(PKProtobufPaymentDeviceResponse *)v63 locked]];
      [(PKRemoteDevice *)v36 setUserDisabled:[(PKProtobufPaymentDeviceResponse *)v63 userDisabled]];
      uint64_t v38 = [MEMORY[0x1E4F1C9C8] date];
      [(PKRemoteDevice *)v36 setLastSeen:v38];

      [(PKRemoteDevice *)v36 setDeviceDisabled:[(PKProtobufPaymentDeviceResponse *)v63 deviceDisabled]];
      [(PKRemoteDevice *)v36 setSupportsFaceID:[(PKProtobufPaymentDeviceResponse *)v63 supportsFaceID]];
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      uint64_t v40 = [(PKProtobufPaymentDeviceResponse *)v63 supportedSetupFeatures];
      uint64_t v41 = [v40 countByEnumeratingWithState:&v73 objects:v86 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v74;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v74 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = +[PKPaymentSetupFeature paymentSetupFeatureWithProtobuf:*(void *)(*((void *)&v73 + 1) + 8 * k)];
            [v39 addObject:v45];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v73 objects:v86 count:16];
        }
        while (v42);
      }

      uint64_t v46 = (void *)[v39 copy];
      [(PKRemoteDevice *)v36 setSupportedSetupFeatures:v46];

      unsigned int v47 = [(PKProtobufPaymentDeviceResponse *)v63 nearby];
      if (v47 <= 2) {
        [(PKRemoteDevice *)v36 setProximityState:qword_1916756A0[v47]];
      }
      remoteDevices = v37->_remoteDevices;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke;
      v71[3] = &unk_1E56DFCD8;
      v49 = v36;
      v72 = v49;
      uint64_t v50 = [(NSMutableArray *)remoteDevices indexOfObjectPassingTest:v71];
      if (v50 != 0x7FFFFFFFFFFFFFFFLL) {
        [(NSMutableArray *)v37->_remoteDevices removeObjectAtIndex:v50];
      }
      [(NSMutableArray *)v37->_remoteDevices addObject:v49];
      id v51 = [(PKIDSManager *)v37 delegates];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v67 objects:v85 count:16];
      if (v52)
      {
        uint64_t v53 = v52;
        uint64_t v54 = *(void *)v68;
        do
        {
          for (uint64_t m = 0; m != v53; ++m)
          {
            if (*(void *)v68 != v54) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = *(void *)(*((void *)&v67 + 1) + 8 * m);
            callbackQueue = v37->_callbackQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke_2;
            block[3] = &unk_1E56D8A90;
            void block[4] = v56;
            void block[5] = v37;
            dispatch_async(callbackQueue, block);
          }
          uint64_t v53 = [v51 countByEnumeratingWithState:&v67 objects:v85 count:16];
        }
        while (v53);
      }
      [(PKIDSManager *)v37 _archiveDevicesToDisk];

      uint64_t v10 = v61;
      id v9 = v62;
    }
  }
}

uint64_t __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  id v4 = [*(id *)(a1 + 32) uniqueID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __81__PKIDSManager__paymentDiscoveryResponseReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 managerDevicesDidChange:v4];
  }
  return result;
}

- (void)_thumbnailResponseReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a7;
  uint64_t v54 = self;
  id v12 = [(IDSService *)self->_service deviceForFromID:a6];

  if (!v12) {
    goto LABEL_31;
  }
  id v13 = [v11 incomingResponseIdentifier];
  id v14 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v74 = v13;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Received thumbnail response: %@", buf, 0xCu);
  }

  id v15 = [PKProtobufPaymentInstrumentThumbnailResponse alloc];
  id v16 = [v10 data];
  long long v17 = [(PKProtobufPaymentInstrumentThumbnailResponse *)v15 initWithData:v16];

  if (![(PKProtobufPaymentInstrumentThumbnailResponse *)v17 status])
  {
    if (![(PKProtobufPaymentInstrumentThumbnailResponse *)v17 hasThumbnailImage]
      || ([(PKProtobufPaymentInstrumentThumbnailResponse *)v17 thumbnailImage],
          uint64_t v22 = (NSData *)objc_claimAutoreleasedReturnValue(),
          uint64_t v23 = PKCreateCGImage(v22),
          v22,
          !v23))
    {
      uint64_t v21 = 0;
      goto LABEL_14;
    }
    size_t Width = CGImageGetWidth(v23);
    size_t Height = CGImageGetHeight(v23);
    uint64_t v19 = [(PKProtobufPaymentInstrumentThumbnailResponse *)v17 manifestHash];
    uint64_t v25 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
    uint64_t v20 = [v25 invertedSet];

    if ([v19 rangeOfCharacterFromSet:v20] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Manifest hash for thumbnail was not a valid SHA1 hash. Ignoring.", buf, 2u);
      }
      id v26 = v14;
      goto LABEL_41;
    }
    id v26 = +[PKRemotePaymentInstrument thumbnailCachePathForManifestHash:size:](PKRemotePaymentInstrument, "thumbnailCachePathForManifestHash:size:", v19, (double)Width, (double)Height);
    CFURLRef v27 = (const __CFURL *)[MEMORY[0x1E4F1CB10] fileURLWithPath:v26];
    uint64_t v28 = CGImageDestinationCreateWithURL(v27, (CFStringRef)[(id)*MEMORY[0x1E4F44460] identifier], 1uLL, 0);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v52 = v26;
      CGImageDestinationAddImage(v28, v23, 0);
      BOOL v30 = CGImageDestinationFinalize(v29);
      CFRelease(v29);
      if (v30)
      {
        id v26 = v52;
LABEL_41:

        CGImageRelease(v23);
        uint64_t v21 = 0;
        goto LABEL_6;
      }
      id v26 = v52;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v43 = "Error saving thumbnail to disk";
        goto LABEL_39;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v43 = "Thumbnail destination is nil - this is not expected behavior";
LABEL_39:
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, v43, buf, 2u);
    }

    goto LABEL_41;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  uint64_t v19 = [(PKProtobufPaymentInstrumentThumbnailResponse *)v17 statusAsString:[(PKProtobufPaymentInstrumentThumbnailResponse *)v17 status]];
  v72 = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  uint64_t v21 = [v18 errorWithDomain:@"PKPassKitErrorDomain" code:1 userInfo:v20];
LABEL_6:

LABEL_14:
  thumbnailCompletionHandlers = v54->_thumbnailCompletionHandlers;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke;
  v67[3] = &unk_1E56F34A8;
  id v32 = v13;
  id v68 = v32;
  long long v33 = [(NSMutableDictionary *)thumbnailCompletionHandlers keysOfEntriesPassingTest:v67];
  if ([v33 count])
  {
    id v45 = v32;
    id v46 = v11;
    id v47 = v10;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    v44 = v33;
    obuint64_t j = v33;
    uint64_t v49 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v49)
    {
      uint64_t v48 = *(void *)v64;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v64 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = v34;
          long long v35 = -[NSMutableDictionary objectForKey:](v54->_thumbnailCompletionHandlers, "objectForKey:", *(void *)(*((void *)&v63 + 1) + 8 * v34), v44, v45, v46, v47);
          [(PKIDSManager *)v54 _queue_removeThumbnailCompletionHandlersForKeys:obj];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v36 = v35;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v60 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v59 + 1) + 8 * i);
                callbackQueue = v54->_callbackQueue;
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke_2;
                block[3] = &unk_1E56D8428;
                uint64_t v58 = v41;
                uint64_t v56 = v17;
                id v57 = v21;
                dispatch_async(callbackQueue, block);
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v69 count:16];
            }
            while (v38);
          }

          uint64_t v34 = v53 + 1;
        }
        while (v53 + 1 != v49);
        uint64_t v49 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v49);
    }

    id v11 = v46;
    id v10 = v47;
    long long v33 = v44;
    id v32 = v45;
  }

LABEL_31:
}

uint64_t __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 requestIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __74__PKIDSManager__thumbnailResponseReceived_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) thumbnailImage];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (int64_t)_paymentAuthorizationStatusForPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int64_t v7 = [v6 status];
  int v8 = [v6 errors];

  uint64_t v9 = [v8 count];
  id v10 = [v5 paymentRequest];

  if (![v10 requestType] && !objc_msgSend(v10, "APIType"))
  {
    id v11 = objc_alloc_init(PKPaymentSheetExperiment);
    if ([(PKPaymentSheetExperiment *)v11 isTaggedForAllowInAppPaymentFailureRetry])
    {
      [(PKExperiment *)v11 trackExperimentExposure];
      if ([(PKPaymentSheetExperiment *)v11 shouldAllowInAppPaymentFailureRetry])
      {
        if (v7 == 1) {
          int64_t v7 = 1000;
        }

        goto LABEL_11;
      }
    }
  }
  if (v9) {
    int64_t v7 = 1000;
  }
LABEL_11:

  return v7;
}

- (BOOL)_queue_hasRemoteDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  [(IDSService *)self->_service devices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "pk_isApplePayCapable"))
        {
          if (![(NSMutableArray *)self->_remoteDevices count])
          {
            uint64_t v9 = PKLogFacilityTypeGetObject(8uLL);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v11 = 0;
              _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "IDS service has devices but cache is empty.", v11, 2u);
            }

            [(PKIDSManager *)self _queue_sendDeviceDiscoveryRequestWithProximity:0 devices:v3];
          }
          BOOL v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (id)_queue_requestForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_paymentRequests;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "identifier", (void)v13);
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_queue_addThumbnailCompletionHandler:(id)a3 forKey:(id)a4
{
  id v13 = a4;
  internalQueue = self->_internalQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(internalQueue);
  BOOL v8 = [(NSMutableDictionary *)self->_thumbnailCompletionHandlers objectForKey:v13];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  int v11 = v10;

  long long v12 = (void *)[v7 copy];
  [v11 addObject:v12];

  [(NSMutableDictionary *)self->_thumbnailCompletionHandlers setObject:v11 forKey:v13];
}

- (void)_queue_removeThumbnailCompletionHandlersForKeys:(id)a3
{
  internalQueue = self->_internalQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(internalQueue);
  thumbnailCompletionHandlers = self->_thumbnailCompletionHandlers;
  id v7 = [v5 allObjects];

  [(NSMutableDictionary *)thumbnailCompletionHandlers removeObjectsForKeys:v7];
}

- (void)_queue_sendDeviceDiscoveryRequestToAllDevicesWithProximity:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IDSService *)self->_service devices];
  [(PKIDSManager *)self _queue_sendDeviceDiscoveryRequestWithProximity:v3 devices:v5];
}

- (void)_queue_sendDeviceDiscoveryRequestWithProximity:(BOOL)a3 devices:(id)a4
{
  BOOL v4 = a3;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v7 = [(IDSService *)self->_service devices];
  remoteDevices = self->_remoteDevices;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke;
  v56[3] = &unk_1E56DFCD8;
  id v45 = v7;
  id v57 = v45;
  uint64_t v9 = [(NSMutableArray *)remoteDevices indexesOfObjectsPassingTest:v56];
  if ([v9 count])
  {
    [(NSMutableArray *)self->_remoteDevices removeObjectsAtIndexes:v9];
    [(PKIDSManager *)self _archiveDevicesToDisk];
    id v10 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 count];
      uint64_t v12 = [(NSMutableArray *)self->_remoteDevices count];
      uint64_t v13 = [v6 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v60 = v11;
      __int16 v61 = 2048;
      uint64_t v62 = v12;
      __int16 v63 = 2048;
      uint64_t v64 = v13;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKIDSManager: %lu remote devices disappeared, %lu remote devices remains, %lu IDS devices in total", buf, 0x20u);
    }
  }
  v44 = v9;
  long long v14 = objc_alloc_init(PKProtobufPaymentDeviceRequest);
  [(PKProtobufPaymentDeviceRequest *)v14 setProtocolVersion:1];
  [(PKProtobufPaymentDeviceRequest *)v14 setShouldAdvertise:v4];
  id v15 = objc_alloc(MEMORY[0x1E4F6B528]);
  uint64_t v43 = v14;
  long long v16 = [(PKProtobufPaymentDeviceRequest *)v14 data];
  uint64_t v42 = (void *)[v15 initWithProtobufData:v16 type:1 isResponse:0];

  uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v19 = v6;
  uint64_t v20 = (void *)v17;
  id v21 = v19;
  uint64_t v22 = [v19 countByEnumeratingWithState:&v52 objects:v58 count:16];
  id v46 = (void *)v17;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v53;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v52 + 1) + 8 * v25);
        CFURLRef v27 = [v26 uniqueID];
        if (v27 && objc_msgSend(v26, "pk_isValidHandoffDevice"))
        {
          uint64_t v28 = [(NSMutableDictionary *)self->_pendingDiscoveries objectForKey:v27];
          if (!v28 || PKForceLocalIDS()) {
            goto LABEL_20;
          }
          uint64_t v29 = PKLogFacilityTypeGetObject(8uLL);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v60 = (uint64_t)v27;
            __int16 v61 = 2112;
            uint64_t v62 = (uint64_t)v28;
            _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Discovery attempt already in-flight for device %@ sent at %@", buf, 0x16u);
          }

          [v28 timeIntervalSinceNow];
          double v31 = v30;
          BOOL v32 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
          if (v31 >= -60.0)
          {
            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Previous discovery attempt is less than one minute ago, ignoring", buf, 2u);
            }

            uint64_t v20 = v46;
          }
          else
          {
            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Previous discovery attempt older than one minute, re-trying", buf, 2u);
            }

            uint64_t v20 = v46;
LABEL_20:
            [v20 addObject:v26];
          }

          goto LABEL_23;
        }
        [v18 addObject:v26];
LABEL_23:

        ++v25;
      }
      while (v23 != v25);
      uint64_t v33 = [v21 countByEnumeratingWithState:&v52 objects:v58 count:16];
      uint64_t v23 = v33;
    }
    while (v33);
  }

  if ([v20 count])
  {
    uint64_t v34 = objc_msgSend(v20, "pk_setByApplyingBlock:", &__block_literal_global_147);
    long long v35 = [MEMORY[0x1E4F1C9C8] date];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_2;
    v50[3] = &unk_1E56F3650;
    v50[4] = self;
    id v51 = v35;
    id v36 = v35;
    [v34 enumerateObjectsUsingBlock:v50];
    service = self->_service;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_3;
    v47[3] = &unk_1E56F3678;
    id v48 = v34;
    uint64_t v49 = self;
    id v38 = v34;
    uint64_t v39 = v42;
    PKProtobufSendWithOptions(service, v42, v38, 300, 0, 1, 0, v47, 0);

    uint64_t v20 = v46;
    uint64_t v40 = v44;
LABEL_31:

    goto LABEL_32;
  }
  id v36 = PKLogFacilityTypeGetObject(8uLL);
  uint64_t v39 = v42;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "No devices to send discovery requests", buf, 2u);
  }

  uint64_t v40 = v44;
  if (![v21 count])
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "IDS device list is empty.", buf, 2u);
    }
    goto LABEL_31;
  }
  if ([v18 count])
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v60 = (uint64_t)v18;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Some IDS devices are invalid handoff devices: %@", buf, 0xCu);
    }
  }
  if ([(NSMutableDictionary *)self->_pendingDiscoveries count])
  {
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = [(NSMutableDictionary *)self->_pendingDiscoveries description];
      *(_DWORD *)buf = 138412290;
      uint64_t v60 = (uint64_t)v41;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Discovery requests pending: %@", buf, 0xCu);

      uint64_t v20 = v46;
    }
    goto LABEL_31;
  }
LABEL_32:
}

uint64_t __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)IDSCopyIDForDevice();
        id v10 = objc_msgSend(v3, "uniqueID", v14);
        char v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          uint64_t v12 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

uint64_t __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_144(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_idsDestination");
}

void __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 96);
  id v4 = [a2 deviceIdentifier];
  [v3 setObject:v2 forKey:v4];
}

void __71__PKIDSManager__queue_sendDeviceDiscoveryRequestWithProximity_devices___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v8;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", buf, 0xCu);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*(void *)(a1 + 40) + 96);
          long long v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "deviceIdentifier", (void)v16);
          [v14 removeObjectForKey:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)_queue_sendDiscoveryResponse:(id)a3 toDeviceWithFromID:(id)a4
{
  id v14 = a3;
  internalQueue = self->_internalQueue;
  id v7 = a4;
  dispatch_assert_queue_V2(internalQueue);
  uint64_t v8 = [(IDSService *)self->_service deviceForFromID:v7];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F6B528]);
    uint64_t v10 = [v14 data];
    uint64_t v11 = (void *)[v9 initWithProtobufData:v10 type:1 isResponse:1];

    service = self->_service;
    uint64_t v13 = objc_msgSend(v8, "pk_idsDestination");
    PKProtobufSend(service, v11, (uint64_t)v13, 0, 0, &__block_literal_global_150);
  }
}

void __64__PKIDSManager__queue_sendDiscoveryResponse_toDeviceWithFromID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 localizedDescription];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Failed to send message: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (id)_queue_cancelRemotePaymentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__76;
  id v26 = __Block_byref_object_dispose__76;
  id v27 = 0;
  AnalyticsSendEvent();
  int v8 = objc_alloc_init(PKProtobufPaymentCancellation);
  id v9 = [v6 identifier];
  [(PKProtobufPaymentCancellation *)v8 setRemotePaymentRequestIdentifier:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F6B528]);
  uint64_t v11 = [(PKProtobufPaymentCancellation *)v8 data];
  uint64_t v12 = (void *)[v10 initWithProtobufData:v11 type:6 isResponse:0];

  service = self->_service;
  id v14 = [v6 device];
  long long v15 = objc_msgSend(v14, "pk_idsDestination");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke;
  v19[3] = &unk_1E56F3458;
  id v16 = v7;
  v19[4] = self;
  id v20 = v16;
  id v21 = &v22;
  PKProtobufSend(service, v12, (uint64_t)v15, 0, 0, v19);

  [(NSMutableArray *)self->_paymentRequests removeObject:v6];
  id v17 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v17;
}

void __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7 && (int v8 = (void *)a1[5]) != 0)
  {
    id v9 = *(NSObject **)(a1[4] + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke_2;
    v13[3] = &unk_1E56D83D8;
    id v15 = v8;
    id v14 = v7;
    dispatch_async(v9, v13);
  }
  else if (v6)
  {
    id v10 = (void *)a1[5];
    if (v10)
    {
      uint64_t v11 = *(void **)(a1[4] + 24);
      uint64_t v12 = (void *)[v10 copy];
      [v11 setObject:v12 forKey:v6];

      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

uint64_t __61__PKIDSManager__queue_cancelRemotePaymentRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_queue_hasRegisteredAccounts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(IDSService *)self->_service accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isActive])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_queue_deviceIsRegistered:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(IDSService *)self->_service devices];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) uniqueID];
          long long v10 = [v4 uniqueID];
          id v11 = v9;
          id v12 = v10;
          if (v11 == v12)
          {

LABEL_20:
            LOBYTE(v6) = 1;
            goto LABEL_21;
          }
          uint64_t v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
          }
          else
          {
            char v15 = [v11 isEqualToString:v12];

            if (v15) {
              goto LABEL_20;
            }
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_21:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_queue_logCloudPairingState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id v3 = [(IDSService *)self->_service devices];
  id v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_157);

  if ([v4 count])
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Missing cloud pairing state: %@", buf, 0xCu);
    }
  }
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "count", @"present") == 0);
  long long v9 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  AnalyticsSendEvent();
}

uint64_t __43__PKIDSManager__queue_logCloudPairingState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 nsuuid];
  if (v3 || ![v2 supportsHandoff]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v2 supportsApplePay];
  }

  return v4;
}

- (void)_registerCTLMThrottleUncapNotification
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint32_t v2 = notify_register_check((const char *)[@"com.apple.request.hipuncap" UTF8String], &self->_requestCLTMThrottleUncapToken);
  if (v2)
  {
    uint32_t v3 = v2;
    uint64_t v4 = PKLogFacilityTypeGetObject(8uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "notify_register_check failed: %u", (uint8_t *)v5, 8u);
    }
  }
}

- (void)_unregisterCTLMThrottleUncapNotification
{
}

- (void)_postCTLMThrottleUncapNotification
{
  uint32_t v3 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Posting CLTMThrottleUncapNotification", v4, 2u);
  }

  notify_set_state(self->_requestCLTMThrottleUncapToken, 3uLL);
  notify_post((const char *)[@"com.apple.request.hipuncap" UTF8String]);
}

- (void)_registerListeners
{
  [(IDSService *)self->_service setProtobufAction:sel__paymentDiscoveryRequestReceived_service_account_fromID_context_ forIncomingRequestsOfType:1];
  [(IDSService *)self->_service setProtobufAction:sel__paymentRequestReceived_service_account_fromID_context_ forIncomingRequestsOfType:2];
  [(IDSService *)self->_service setProtobufAction:sel__paymentResultReceived_service_account_fromID_context_ forIncomingRequestsOfType:5];
  [(IDSService *)self->_service setProtobufAction:sel__paymentCancellationReceived_service_account_fromID_context_ forIncomingRequestsOfType:6];
  [(IDSService *)self->_service setProtobufAction:sel__paymentClientUpdateReceived_service_account_fromID_context_ forIncomingRequestsOfType:3];
  [(IDSService *)self->_service setProtobufAction:sel__paymentSetupRequestReceived_service_account_fromID_context_ forIncomingRequestsOfType:7];
  [(IDSService *)self->_service setProtobufAction:sel__thumbnailRequestReceived_service_account_fromID_context_ forIncomingRequestsOfType:8];
  [(IDSService *)self->_service setProtobufAction:sel__promptDetailsForVirtualCardRequestReceived_service_account_fromID_context_ forIncomingRequestsOfType:9];
  service = self->_service;
  [(IDSService *)service setProtobufAction:sel__paymentCancellationReceived_service_account_fromID_context_ forIncomingRequestsOfType:6];
}

- (id)_preparePaymentDeviceResponseForRequestingDevice:(id)a3 userDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(PKProtobufPaymentDeviceResponse);
  [(PKProtobufPaymentDeviceResponse *)v7 setProtocolVersion:1];
  [(PKProtobufPaymentDeviceResponse *)v7 setUserDisabled:v4];
  [(PKProtobufPaymentDeviceResponse *)v7 setSupportsFaceID:PKPearlIsAvailable()];
  if (![(PKProtobufPaymentDeviceResponse *)v7 userDisabled])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      dataSource = self->_dataSource;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke;
      v25[3] = &unk_1E56DFFD8;
      id v26 = v7;
      id v27 = v8;
      long long v10 = v8;
      [(PKIDSManagerDataSource *)dataSource supportedPaymentSetupFeatures:self completion:v25];
      dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (objc_opt_respondsToSelector()) {
      [(PKProtobufPaymentDeviceResponse *)v7 setDeviceDisabled:[(PKIDSManagerDataSource *)self->_dataSource deviceAvailableForContinuityPayments:self] ^ 1];
    }
    id v11 = [(PKIDSManager *)self _fetchPaymentInstrumentsForRequestingDevice:v6];
    [(PKProtobufPaymentDeviceResponse *)v7 setPaymentInstruments:v11];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = [(PKIDSManagerDataSource *)self->_dataSource defaultPaymentPassForContinuityDiscovery:self];
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [(PKIDSManagerDataSource *)self->_dataSource webServiceConfigurationForContinuityPayments:self];
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v14 = [v13 unsupportedWebPaymentConfigurations];
    if (v12)
    {
      char v15 = [v6 productVersion];
      int v16 = [v12 supportsWebPaymentMode:2 withExclusionList:v14 clientOSVersion:v15];

      if (v16)
      {
        long long v17 = PKLogFacilityTypeGetObject(8uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v12;
          _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Default pass: %@", buf, 0xCu);
        }

        long long v18 = [[PKRemotePaymentInstrument alloc] initWithPaymentPass:v12];
        long long v19 = [(PKProtobufPaymentDeviceResponse *)v7 paymentInstruments];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke_194;
        v23[3] = &unk_1E56F36C0;
        uint64_t v24 = v18;
        long long v20 = v18;
        uint64_t v21 = [v19 indexOfObjectPassingTest:v23];

        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Unable to match the default card to provided passes", buf, 2u);
          }
        }
        else
        {
          [(PKProtobufPaymentDeviceResponse *)v7 setDefaultPaymentInstrumentIndex:v21];
        }
      }
    }
    [(PKProtobufPaymentDeviceResponse *)v7 setLocked:MKBGetDeviceLockState() != 0];
  }
  return v7;
}

void __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        long long v9 = [*(id *)(a1 + 32) supportedSetupFeatures];
        long long v10 = [v8 protobuf];
        [v9 addObject:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __78__PKIDSManager__preparePaymentDeviceResponseForRequestingDevice_userDisabled___block_invoke_194(uint64_t a1, void *a2)
{
  uint32_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 passIdentifier];
  uint64_t v5 = [v3 passID];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (id)_fetchPaymentInstrumentsForRequestingDevice:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v30 = [MEMORY[0x1E4F1CA48] array];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(PKIDSManagerDataSource *)self->_dataSource paymentPassesForContinuityDiscovery:self];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([(PKIDSManagerDataSource *)self->_dataSource webServiceConfigurationForContinuityPayments:self], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v27 = v6;
      uint64_t v7 = [v6 unsupportedWebPaymentConfigurations];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke;
      v39[3] = &unk_1E56F36E8;
      id v40 = v7;
      id v41 = v4;
      id v8 = v7;
      uint64_t v9 = objc_msgSend(v5, "pk_objectsPassingTest:", v39);

      uint64_t v5 = (void *)v9;
    }
    else
    {
      id v27 = 0;
    }
    group = dispatch_group_create();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v36;
      uint64_t v28 = self;
      long long v14 = off_1E56D6000;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v17 = (void *)[objc_alloc(v14[322]) initWithPaymentPass:v16];
          if ([v16 hasAssociatedPeerPaymentAccount])
          {
            id v18 = v17;
            long long v19 = v12;
            id v20 = v18;

            dispatch_group_enter(group);
            uint64_t v21 = v14;
            dataSource = v28->_dataSource;
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke_2;
            v32[3] = &unk_1E56F3710;
            id v12 = v20;
            id v33 = v12;
            uint64_t v34 = group;
            uint64_t v23 = dataSource;
            long long v14 = v21;
            [(PKIDSManagerDataSource *)v23 accountForPaymentPass:v16 manager:v28 completion:v32];

            uint64_t v24 = v33;
          }
          else
          {
            uint64_t v24 = [v17 protobuf];
            [v30 addObject:v24];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v11);
    }
    else
    {
      id v12 = 0;
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    if (v12)
    {
      uint64_t v25 = [v12 protobuf];
      [v30 addObject:v25];
    }
  }

  return v30;
}

uint64_t __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 deviceInAppPaymentApplications];
  if (![v4 count])
  {

    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) productVersion];
  LODWORD(v5) = [v3 supportsWebPaymentMode:2 withExclusionList:v5 clientOSVersion:v6];

  if (v5)
  {
LABEL_5:
    id v8 = [v3 devicePrimaryPaymentApplication];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) productVersion];
    uint64_t v7 = [v8 supportsWebPaymentMode:2 withExclusionList:v9 clientOSVersion:v10];

    goto LABEL_6;
  }
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

void __60__PKIDSManager__fetchPaymentInstrumentsForRequestingDevice___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    uint64_t v5 = [v4 currentBalance];
    [v3 setPeerPaymentAccountBalance:v5];

    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v4 state];

    [v6 setPeerPaymentAccountState:v7];
  }
  id v8 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v8);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[PKIDSManager service:activeAccountsChanged:]";
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  uint64_t v9 = [(PKIDSManager *)self delegates];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        callbackQueue = self->_callbackQueue;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __46__PKIDSManager_service_activeAccountsChanged___block_invoke;
        v16[3] = &unk_1E56D8A90;
        void v16[4] = v14;
        v16[5] = self;
        dispatch_async(callbackQueue, v16);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

uint64_t __46__PKIDSManager_service_activeAccountsChanged___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 managerAccountsDidChange:v4];
  }
  return result;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[PKIDSManager service:devicesChanged:]";
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  uint64_t v9 = [(PKIDSManager *)self delegates];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        callbackQueue = self->_callbackQueue;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __39__PKIDSManager_service_devicesChanged___block_invoke_205;
        v16[3] = &unk_1E56D8A90;
        void v16[4] = v14;
        v16[5] = self;
        dispatch_async(callbackQueue, v16);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

uint64_t __39__PKIDSManager_service_devicesChanged___block_invoke_205(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 managerDevicesDidChange:v4];
  }
  return result;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "IDS Service has delivered message: %@, context: %@", buf, 0x16u);
  }

  char v15 = [(NSMutableDictionary *)self->_completionHandlers objectForKey:v12];
  if (v15)
  {
    [(NSMutableDictionary *)self->_completionHandlers removeObjectForKey:v12];
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKIDSManager_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
    block[3] = &unk_1E56D8360;
    id v18 = v15;
    dispatch_async(callbackQueue, block);
  }
}

uint64_t __71__PKIDSManager_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136316418;
    uint64_t v14 = "-[PKIDSManager service:account:incomingUnhandledProtobuf:fromID:context:]";
    __int16 v15 = 2112;
    id v16 = a3;
    __int16 v17 = 2112;
    id v18 = a4;
    __int16 v19 = 2112;
    id v20 = a5;
    __int16 v21 = 2112;
    id v22 = a6;
    __int16 v23 = 2112;
    id v24 = a7;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %@ %@", (uint8_t *)&v13, 0x3Eu);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (char *)a5;
  id v15 = a7;
  id v16 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    long long v55 = "-[PKIDSManager service:account:identifier:didSendWithSuccess:error:]";
    __int16 v56 = 2112;
    id v57 = v12;
    __int16 v58 = 2112;
    id v59 = v13;
    __int16 v60 = 2112;
    __int16 v61 = v14;
    __int16 v62 = 1024;
    BOOL v63 = v8;
    __int16 v64 = 2112;
    id v65 = v15;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "%s %@ %@ %@ %d %@", buf, 0x3Au);
  }

  if (!v8)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v55 = v14;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Failed to send with success: %@", buf, 0xCu);
    }

    __int16 v17 = [(NSMutableDictionary *)self->_completionHandlers objectForKey:v14];
    if (v17)
    {
      [(NSMutableDictionary *)self->_completionHandlers removeObjectForKey:v14];
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke;
      block[3] = &unk_1E56D83D8;
      __int16 v19 = &v51;
      id v51 = v17;
      id v50 = v15;
      dispatch_async(callbackQueue, block);
      id v20 = v50;
    }
    else
    {
      thumbnailCompletionHandlers = self->_thumbnailCompletionHandlers;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_2;
      v47[3] = &unk_1E56F34A8;
      __int16 v19 = (id *)&v48;
      id v48 = v14;
      id v20 = [(NSMutableDictionary *)thumbnailCompletionHandlers keysOfEntriesPassingTest:v47];
      if ([v20 count])
      {
        id v31 = v12;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v20 = v20;
        uint64_t v34 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v34)
        {
          uint64_t v32 = *(void *)v44;
          id v33 = v20;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v44 != v32) {
                objc_enumerationMutation(v20);
              }
              uint64_t v35 = v22;
              __int16 v23 = [(NSMutableDictionary *)self->_thumbnailCompletionHandlers objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * v22)];
              [(PKIDSManager *)self _queue_removeThumbnailCompletionHandlersForKeys:v20];
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              id v24 = v23;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v52 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v40;
                do
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v40 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    uint64_t v29 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                    id v30 = self->_callbackQueue;
                    v36[0] = MEMORY[0x1E4F143A8];
                    v36[1] = 3221225472;
                    v36[2] = __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_3;
                    v36[3] = &unk_1E56D83D8;
                    uint64_t v38 = v29;
                    id v37 = v15;
                    dispatch_async(v30, v36);
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v52 count:16];
                }
                while (v26);
              }

              uint64_t v22 = v35 + 1;
              id v20 = v33;
            }
            while (v35 + 1 != v34);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v53 count:16];
          }
          while (v34);
        }

        id v12 = v31;
        __int16 v17 = 0;
        __int16 v19 = (id *)&v48;
      }
    }
  }
}

uint64_t __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 requestIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __68__PKIDSManager_service_account_identifier_didSendWithSuccess_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)deleteArchivedDevices
{
  id v3 = PKLogFacilityTypeGetObject(8uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Deleting IDS device archive", v9, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = PKHomeDirectoryPath();
  id v6 = [v5 stringByAppendingPathComponent:@"RemoteDevices.archive"];

  [v4 removeItemAtPath:v6 error:0];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v8 = PKRemoteInstrumentThumbnailsCachePath();
  [v7 removeItemAtPath:v8 error:0];

  [(PKIDSManager *)self _createThumbnailCacheDirectory];
}

- (id)_remoteDevicesWithArchive
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return v2;
}

- (void)_createThumbnailCacheDirectory
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  id v2 = PKRemoteInstrumentThumbnailsCachePath();
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2 isDirectory:&v10];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = 0;
    char v6 = [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0)
    {
      BOOL v8 = PKLogFacilityTypeGetObject(8uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create thumbnail cache: %@", buf, 0xCu);
      }
    }
  }
}

- (PKIDSManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (PKIDSManagerDataSource *)a3;
}

- (NSMutableArray)pendingCancellations
{
  return self->_pendingCancellations;
}

- (void)setPendingCancellations:(id)a3
{
}

- (NSMutableDictionary)pendingDiscoveries
{
  return self->_pendingDiscoveries;
}

- (void)setPendingDiscoveries:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)recentlySeenUUIDs
{
  return self->_recentlySeenUUIDs;
}

- (void)setRecentlySeenUUIDs:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_recentlySeenUUIDs, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingDiscoveries, 0);
  objc_storeStrong((id *)&self->_pendingCancellations, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_proximityAdvertiser, 0);
  objc_storeStrong((id *)&self->_thumbnailCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_paymentRequests, 0);
  objc_storeStrong((id *)&self->_remoteDevices, 0);
}

@end