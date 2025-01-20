@interface ICDelegationProviderNetService
- (ICDelegationProviderNetService)initWithNetService:(id)a3;
- (NSArray)delegationAccountUUIDs;
- (NSNetService)netService;
- (NSString)deviceName;
- (int64_t)securityMode;
- (void)_resolveWithCompletionHandler:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)_updateTXTRecordProperties;
- (void)dealloc;
- (void)getResolvedStreamsWithCompletionHandler:(id)a3;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4;
- (void)netServiceDidResolveAddress:(id)a3;
@end

@implementation ICDelegationProviderNetService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_resolutionCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_netServiceStreamResolutionQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (NSNetService)netService
{
  return self->_netService;
}

- (void)_updateTXTRecordProperties
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(NSNetService *)self->_netService TXTRecordData];
  if (v3) {
    v4 = [[ICDelegationNetServiceTXTRecord alloc] initWithTXTRecordData:v3];
  }
  else {
    v4 = 0;
  }
  txtRecord = self->_txtRecord;
  if (txtRecord != v4 && ![(ICDelegationNetServiceTXTRecord *)txtRecord isEqual:v4])
  {
    objc_storeStrong((id *)&self->_txtRecord, v4);
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      __int16 v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated net service TXTRecord: %{public}@", buf, 0x16u);
    }

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ICDelegationProviderNetService__updateTXTRecordProperties__block_invoke;
    block[3] = &unk_1E5ACD750;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __60__ICDelegationProviderNetService__updateTXTRecordProperties__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICDelegationProviderNetServiceDelegationAccountUUIDsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_setState:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_state = a3;
  if (a3 != 1)
  {
    v4 = (void *)[(NSMutableArray *)self->_resolutionCompletionHandlers copy];
    resolutionCompletionHandlers = self->_resolutionCompletionHandlers;
    self->_resolutionCompletionHandlers = 0;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_resolveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_state == 1)
  {
    resolutionCompletionHandlers = self->_resolutionCompletionHandlers;
    if (!resolutionCompletionHandlers)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = self->_resolutionCompletionHandlers;
      self->_resolutionCompletionHandlers = v7;

      resolutionCompletionHandlers = self->_resolutionCompletionHandlers;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__ICDelegationProviderNetService__resolveWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E5ACD170;
    id v11 = v5;
    uint64_t v9 = (void *)MEMORY[0x1A6240BF0](v10);
    [(NSMutableArray *)resolutionCompletionHandlers addObject:v9];
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

uint64_t __64__ICDelegationProviderNetService__resolveWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)securityMode
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__38458;
  uint64_t v10 = __Block_byref_object_dispose__38459;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ICDelegationProviderNetService_securityMode__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = [(id)v7[5] securityMode];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__ICDelegationProviderNetService_securityMode__block_invoke(uint64_t a1)
{
}

- (NSString)deviceName
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__38458;
  uint64_t v10 = __Block_byref_object_dispose__38459;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__ICDelegationProviderNetService_deviceName__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = [(id)v7[5] deviceName];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __44__ICDelegationProviderNetService_deviceName__block_invoke(uint64_t a1)
{
}

- (NSArray)delegationAccountUUIDs
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__38458;
  uint64_t v10 = __Block_byref_object_dispose__38459;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ICDelegationProviderNetService_delegationAccountUUIDs__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = [(id)v7[5] delegationAccountUUIDs];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __56__ICDelegationProviderNetService_delegationAccountUUIDs__block_invoke(uint64_t a1)
{
}

- (void)getResolvedStreamsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E5ACD2F0;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _resolveWithCompletionHandler:v2];
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40) == 2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved net service.", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 24);
    if (!v6)
    {
      dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderNetService.netServiceStreamResolutionQueue", 0);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 24);
      *(void *)(v8 + 24) = v7;

      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(NSObject **)(v5 + 24);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_7;
    block[3] = &unk_1E5ACD2F0;
    block[4] = v5;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
    uint64_t v10 = v15;
  }
  else
  {
    id v11 = *(NSObject **)(v2 + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2_11;
    v12[3] = &unk_1E5ACD170;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v11, v12);
    uint64_t v10 = v13;
  }
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  id v22 = 0;
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Getting streams...", buf, 0xCu);
  }

  int v4 = [*(id *)(*(void *)(a1 + 32) + 56) getInputStream:&v23 outputStream:&v22];
  id v5 = v23;
  id v6 = v22;
  dispatch_queue_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v6 == 0)
  {
    if (v8)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v11;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to create streams.", buf, 0xCu);
    }

    long long v12 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_9;
    v16[3] = &unk_1E5ACD170;
    id v13 = &v17;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(v12, v16);
  }
  else
  {
    if (v8)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully created streams.", buf, 0xCu);
    }

    id v15 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_8;
    block[3] = &unk_1E5ACD250;
    id v13 = &v21;
    id v21 = *(id *)(a1 + 40);
    id v19 = v23;
    id v20 = v22;
    dispatch_async(v15, block);
  }
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_2_11(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

uint64_t __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_8(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __74__ICDelegationProviderNetService_getResolvedStreamsWithCompletionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did not resolve address with error dictionary: %{public}@.", buf, 0x16u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationProviderNetService_netService_didNotResolve___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __59__ICDelegationProviderNetService_netService_didNotResolve___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setState:3];
}

- (void)netServiceDidResolveAddress:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v8 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Net service did resolve address.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICDelegationProviderNetService_netServiceDidResolveAddress___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __62__ICDelegationProviderNetService_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40) != 3)
  {
    [(id)v2 _setState:2];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 56) startMonitoring];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _updateTXTRecordProperties];
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: TXT record data updated.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ICDelegationProviderNetService_netService_didUpdateTXTRecordData___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __68__ICDelegationProviderNetService_netService_didUpdateTXTRecordData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTXTRecordProperties];
}

- (void)dealloc
{
  [(NSNetService *)self->_netService setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationProviderNetService;
  [(ICDelegationProviderNetService *)&v3 dealloc];
}

- (ICDelegationProviderNetService)initWithNetService:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICDelegationProviderNetService;
  id v6 = [(ICDelegationProviderNetService *)&v14 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderNetService.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderNetService.serialQueue", 0);
    calloutQueue = v6->_calloutQueue;
    v6->_calloutQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_netService, a3);
    [(NSNetService *)v6->_netService setDelegate:v6];
    v6->_state = 1;
    netService = v6->_netService;
    id v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(NSNetService *)netService scheduleInRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];

    [(NSNetService *)v6->_netService resolveWithTimeout:10.0];
  }

  return v6;
}

@end