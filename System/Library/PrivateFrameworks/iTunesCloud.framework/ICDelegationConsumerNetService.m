@interface ICDelegationConsumerNetService
- (ICDelegationConsumerNetService)initWithUserIdentityDelegationAccountUUIDs:(id)a3;
- (ICDelegationConsumerNetServiceDelegate)delegate;
- (ICDelegationServiceSecuritySettings)securitySettings;
- (NSDictionary)userIdentityDelegationAccountUUIDs;
- (void)_updateNetServiceStatus;
- (void)dealloc;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)publish;
- (void)setDelegate:(id)a3;
- (void)stop;
@end

@implementation ICDelegationConsumerNetService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityDelegationAccountUUIDs, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_securitySettings, 0);
  objc_storeStrong((id *)&self->_netServiceQueue, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (NSDictionary)userIdentityDelegationAccountUUIDs
{
  return self->_userIdentityDelegationAccountUUIDs;
}

- (void)setDelegate:(id)a3
{
}

- (ICDelegationConsumerNetServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDelegationConsumerNetServiceDelegate *)WeakRetained;
}

- (void)_updateNetServiceStatus
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (self->_isPublished)
  {
    if (self->_didPublish) {
      return;
    }
    if (!self->_netService)
    {
      v3 = [MEMORY[0x1E4F29128] UUID];
      v4 = [v3 UUIDString];

      if ((unint64_t)[v4 length] >= 0x40)
      {
        uint64_t v5 = [v4 substringToIndex:63];

        v4 = (void *)v5;
      }
      v6 = (NSNetService *)[objc_alloc(MEMORY[0x1E4F18D60]) initWithDomain:@"local." type:@"_itsdlgt._tcp." name:v4 port:0];
      netService = self->_netService;
      self->_netService = v6;

      [(NSNetService *)self->_netService setDelegate:self];
      v8 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_netService;
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2114;
        v38 = v9;
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Created net service %{public}@.", buf, 0x16u);
      }
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = [(NSDictionary *)self->_userIdentityDelegationAccountUUIDs objectEnumerator];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          [v10 addObjectsFromArray:*(void *)(*((void *)&v30 + 1) + 8 * v15++)];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }

    self->_didPublish = 1;
    v16 = self->_netService;
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v16;
      _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Published net service %{public}@.", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    netServiceQueue = self->_netServiceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke;
    block[3] = &unk_1E5AC7450;
    block[4] = self;
    id v27 = v10;
    v19 = (NSNetService *)v10;
    objc_copyWeak(&v29, (id *)buf);
    v28 = v16;
    v20 = v16;
    dispatch_async(netServiceQueue, block);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v21 = self->_netService;
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v21;
      _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped net service %{public}@.", buf, 0x16u);
    }

    self->_didPublish = 0;
    v23 = self->_netServiceQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_17;
    v24[3] = &unk_1E5ACD750;
    v25 = v21;
    v19 = v21;
    dispatch_async(v23, v24);
  }
}

void __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_2;
  v3[3] = &unk_1E5AC7428;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 48);
  +[ICDelegationServiceSecuritySettings getDeviceReceiverSettingsWithCompletion:v3];

  objc_destroyWeak(&v6);
}

uint64_t __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

void __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v8;
    __int16 v24 = 2114;
    v25 = v5;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrieved security settings: %{public}@ with error: %{public}@", buf, 0x20u);
  }

  v9 = objc_alloc_init(ICDelegationNetServiceTXTRecord);
  [(ICDelegationNetServiceTXTRecord *)v9 setDelegationAccountUUIDs:*(void *)(a1 + 40)];
  [(ICDelegationNetServiceTXTRecord *)v9 setServiceVersion:1];
  id v10 = +[ICDeviceInfo currentDeviceInfo];
  v11 = [v10 deviceName];
  [(ICDelegationNetServiceTXTRecord *)v9 setDeviceName:v11];

  if (v5)
  {
    [(ICDelegationNetServiceTXTRecord *)v9 setSecurityMode:[(ICDelegationNetServiceTXTRecord *)v5 securityMode]];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v13 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v14 = WeakRetained[1];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_15;
      v19[3] = &unk_1E5ACD4C8;
      v20 = WeakRetained;
      v21 = v5;
      dispatch_barrier_async(v14, v19);
    }
  }
  uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Published net service TXTRecord: %{public}@", buf, 0x16u);
  }

  v17 = *(void **)(a1 + 48);
  v18 = [(ICDelegationNetServiceTXTRecord *)v9 TXTRecordData];
  [v17 setTXTRecordData:v18];

  [*(id *)(a1 + 48) publishWithOptions:2051];
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
}

void __57__ICDelegationConsumerNetService__updateNetServiceStatus__block_invoke_15(uint64_t a1)
{
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ICDelegationConsumerNetService_stop__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __38__ICDelegationConsumerNetService_stop__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 25))
  {
    *(unsigned char *)(v1 + 25) = 0;
    return [*(id *)(result + 32) _updateNetServiceStatus];
  }
  return result;
}

- (void)publish
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICDelegationConsumerNetService_publish__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __41__ICDelegationConsumerNetService_publish__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 25))
  {
    *(unsigned char *)(v1 + 25) = 1;
    return [*(id *)(result + 32) _updateNetServiceStatus];
  }
  return result;
}

- (ICDelegationServiceSecuritySettings)securitySettings
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3453;
  id v10 = __Block_byref_object_dispose__3454;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ICDelegationConsumerNetService_securitySettings__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ICDelegationServiceSecuritySettings *)v3;
}

void __50__ICDelegationConsumerNetService_securitySettings__block_invoke(uint64_t a1)
{
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F18C70];
  uint64_t v9 = *MEMORY[0x1E4F18C68];
  id v10 = a4;
  id v11 = [v10 objectForKeyedSubscript:v9];
  uint64_t v12 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v11, "integerValue"), v10);

  if ([v12 code] == -72001) {
    double v13 = 0.0;
  }
  else {
    double v13 = 5.0;
  }
  uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    v25 = v12;
    __int16 v26 = 2048;
    double v27 = v13;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote server advertisement failed with service: %{public}@, error: %{public}@, retrying in %f seconds...", buf, 0x2Au);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke;
  block[3] = &unk_1E5ACCD30;
  block[4] = self;
  *(double *)&void block[5] = v13;
  dispatch_barrier_async(accessQueue, block);
  if (v13 > 0.00000011920929)
  {
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    v17 = dispatch_get_global_queue(0, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_2;
    v18[3] = &unk_1E5ACD750;
    v18[4] = self;
    dispatch_after(v16, v17, v18);
  }
}

void __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) stop];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  if (*(double *)(a1 + 40) <= 0.00000011920929)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _updateNetServiceStatus];
  }
}

void __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_3;
  block[3] = &unk_1E5ACD750;
  block[4] = v1;
  dispatch_barrier_async(v2, block);
}

uint64_t __59__ICDelegationConsumerNetService_netService_didNotPublish___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNetServiceStatus];
}

- (void)netServiceDidPublish:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Remote server advertisement success with service: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v19 = self;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Did accept connection with service: %{public}@ input: %{public}@ output: %{public}@", buf, 0x2Au);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(accessQueue, block);
}

void __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  if (objc_opt_respondsToSelector())
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2;
    v7[3] = &unk_1E5ACD640;
    id v4 = WeakRetained;
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v3, v7);
  }
}

uint64_t __93__ICDelegationConsumerNetService_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegationConsumerNetService:*(void *)(a1 + 40) didAcceptConnectionWithInputStream:*(void *)(a1 + 48) outputStream:*(void *)(a1 + 56)];
}

- (void)dealloc
{
  [(NSNetService *)self->_netService setDelegate:0];
  if (self->_isPublished)
  {
    id v3 = self->_netService;
    netServiceQueue = self->_netServiceQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__ICDelegationConsumerNetService_dealloc__block_invoke;
    block[3] = &unk_1E5ACD750;
    id v8 = v3;
    uint64_t v5 = v3;
    dispatch_async(netServiceQueue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)ICDelegationConsumerNetService;
  [(ICDelegationConsumerNetService *)&v6 dealloc];
}

uint64_t __41__ICDelegationConsumerNetService_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (ICDelegationConsumerNetService)initWithUserIdentityDelegationAccountUUIDs:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICDelegationConsumerNetService;
  uint64_t v5 = [(ICDelegationConsumerNetService *)&v15 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerNetService.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerNetService.netServiceQueue", 0);
    netServiceQueue = v5->_netServiceQueue;
    v5->_netServiceQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerNetService.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v4 copy];
    userIdentityDelegationAccountUUIDs = v5->_userIdentityDelegationAccountUUIDs;
    v5->_userIdentityDelegationAccountUUIDs = (NSDictionary *)v12;
  }
  return v5;
}

@end