@interface ICDelegationProviderService
+ (ICDelegationProviderService)sharedService;
+ (id)systemServiceWithRequestContext:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICRequestContext)requestContext;
- (id)_init;
- (id)_xpcConnection;
- (void)_addConnection:(id)a3;
- (void)_netServiceDelegationAccountUUIDsDidChangeNotification:(id)a3;
- (void)_registerNotificationsForDelegationNetService:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_unregisterNotificationsForDelegationNetService:(id)a3;
- (void)_updateAssertionTimeouts;
- (void)_updateBrowsingStatus;
- (void)_updateDelegationForDiscoveredServices;
- (void)_updateSupportedDelegationAccountUUIDs;
- (void)addAssertion:(id)a3;
- (void)dealloc;
- (void)delegationProviderServiceAddAssertion:(id)a3;
- (void)delegationProviderServiceRemoveAssertion:(id)a3;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)removeAssertion:(id)a3;
- (void)startSystemXPCService;
@end

@implementation ICDelegationProviderService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_supportedDelegationAccountUUIDToUserIdentity, 0);
  objc_storeStrong((id *)&self->_identityStoreOperationQueue, 0);
  objc_storeStrong((id *)&self->_netServiceBrowserQueue, 0);
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_discoveredServices, 0);
  objc_storeStrong((id *)&self->_assertionTimeoutSource, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_connectionToAssertions, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activeServiceSessions, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (id)_xpcConnection
{
  if (self->_isSystemService)
  {
    v2 = 0;
  }
  else
  {
    xpcConnection = self->_xpcConnection;
    if (!xpcConnection)
    {
      v5 = (NSXPCConnection *)(id)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloud.delegation-provider" options:0];
      v6 = self->_xpcConnection;
      self->_xpcConnection = v5;

      v7 = self->_xpcConnection;
      v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF64EA40];
      [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

      [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
      v9 = self->_xpcConnection;
      v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B960];
      [(NSXPCConnection *)v9 setExportedInterface:v10];

      objc_initWeak(&location, self->_xpcConnection);
      objc_initWeak(&from, self);
      v11 = self->_xpcConnection;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __45__ICDelegationProviderService__xpcConnection__block_invoke;
      v20[3] = &unk_1E5ACA2F0;
      objc_copyWeak(&v21, &from);
      objc_copyWeak(&v22, &location);
      [(NSXPCConnection *)v11 setInterruptionHandler:v20];
      v12 = self->_xpcConnection;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __45__ICDelegationProviderService__xpcConnection__block_invoke_2;
      v17 = &unk_1E5ACA2F0;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      [(NSXPCConnection *)v12 setInvalidationHandler:&v14];
      [(NSXPCConnection *)self->_xpcConnection resume];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      xpcConnection = self->_xpcConnection;
    }
    v2 = xpcConnection;
  }

  return v2;
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection interrupted.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__ICDelegationProviderService__xpcConnection__block_invoke_43;
    v7[3] = &unk_1E5ACD4C8;
    v8 = WeakRetained;
    id v9 = v5;
    dispatch_barrier_async(v6, v7);
  }
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke_2(uint64_t a1)
{
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection invalidated.", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__ICDelegationProviderService__xpcConnection__block_invoke_44;
    v7[3] = &unk_1E5ACD4C8;
    v8 = WeakRetained;
    id v9 = v5;
    dispatch_barrier_async(v6, v7);
  }
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke_44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 120);
  if (v3 == v2)
  {
    *(void *)(v1 + 120) = 0;
  }
}

void __45__ICDelegationProviderService__xpcConnection__block_invoke_43(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v3 == v2)
  {
    [v3 invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = 0;
  }
}

- (void)_updateSupportedDelegationAccountUUIDs
{
  if (self->_isSystemService)
  {
    v3 = [ICAsyncBlockOperation alloc];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke;
    v5[3] = &unk_1E5ACA1A0;
    v5[4] = self;
    uint64_t v4 = [(ICAsyncBlockOperation *)v3 initWithStartHandler:v5];
    [(NSOperationQueue *)self->_identityStoreOperationQueue addOperation:v4];
  }
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v5 = [v4 qualityOfService];

  v6 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)v5, 0);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderService.supportedDelegationAccountUUIDsAccessQueue", v6);

  v8 = dispatch_group_create();
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_group_enter(v8);
  v10 = *(void **)(*(void *)(a1 + 32) + 64);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_2;
  v35[3] = &unk_1E5AC7E40;
  v11 = v7;
  v36 = v11;
  id v12 = v9;
  id v37 = v12;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_4;
  v33[3] = &unk_1E5ACD750;
  v13 = v8;
  v34 = v13;
  [v10 enumerateDelegateTokensWithType:1 usingBlock:v35 completionHandler:v33];
  dispatch_group_enter(v13);
  uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v15 = +[ICUserIdentity activeAccount];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_5;
  v29[3] = &unk_1E5ACAE00;
  v16 = v11;
  v30 = v16;
  id v17 = v12;
  id v31 = v17;
  v32 = v13;
  id v18 = v13;
  [v14 getPropertiesForUserIdentity:v15 completionHandler:v29];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_7;
  block[3] = &unk_1E5AC7E68;
  id v27 = v3;
  uint64_t v28 = v5;
  uint64_t v19 = *(void *)(a1 + 32);
  id v24 = v17;
  uint64_t v25 = v19;
  v26 = v16;
  id v20 = v3;
  id v21 = v16;
  id v22 = v17;
  dispatch_group_notify(v18, v21, block);
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_3;
  v7[3] = &unk_1E5ACD4C8;
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_4(uint64_t a1)
{
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_5(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 DSID];
    if (v3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_6;
      block[3] = &unk_1E5ACD5C8;
      id v4 = *(NSObject **)(a1 + 32);
      id v7 = *(id *)(a1 + 40);
      id v8 = v3;
      id v9 = *(id *)(a1 + 48);
      dispatch_async(v4, block);
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }
  }
  else
  {
    uint64_t v5 = *(NSObject **)(a1 + 48);
    dispatch_group_leave(v5);
  }
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_7(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v3 setMaxConcurrentOperationCount:3];
  [v3 setQualityOfService:*(void *)(a1 + 64)];
  id v4 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        v10 = [ICAsyncBlockOperation alloc];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_8;
        v23[3] = &unk_1E5ACD618;
        v11 = *(void **)(a1 + 48);
        v23[4] = *(void *)(a1 + 40);
        v23[5] = v9;
        id v24 = v11;
        id v25 = v2;
        v26 = v4;
        id v12 = [(ICAsyncBlockOperation *)v10 initWithStartHandler:v23];
        [v3 addOperation:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_11;
  block[3] = &unk_1E5ACD640;
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(NSObject **)(a1 + 48);
  id v19 = v3;
  uint64_t v20 = v13;
  id v21 = v2;
  id v22 = *(id *)(a1 + 56);
  id v15 = v2;
  id v16 = v3;
  dispatch_group_notify(v4, v14, block);
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_9;
  v9[3] = &unk_1E5ACD5F0;
  id v10 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v3;
  id v14 = *(id *)(a1 + 64);
  id v8 = v3;
  [v5 getDelegationUUIDsForUserIdentity:v4 completionHandler:v9];
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_11(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(NSObject **)(v2 + 8);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_12;
  uint64_t v9 = &unk_1E5ACD4C8;
  uint64_t v10 = v2;
  id v11 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_barrier_async(v4, &v6);
  objc_msgSend(*(id *)(a1 + 56), "finish", v6, v7, v8, v9, v10);
}

uint64_t __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_12(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateDelegationForDiscoveredServices];
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_10;
  block[3] = &unk_1E5ACD5C8;
  id v12 = v5;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v5;
  id v10 = a3;
  dispatch_async(v6, block);
  [*(id *)(a1 + 56) finishWithError:v10];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_10(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", *(void *)(a1 + 48), *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_6(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = +[ICUserIdentity specificAccountWithDSID:a1[5]];
  [v2 addObject:v3];

  uint64_t v4 = a1[6];

  dispatch_group_leave(v4);
}

uint64_t __69__ICDelegationProviderService__updateSupportedDelegationAccountUUIDs__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (void)_updateDelegationForDiscoveredServices
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (self->_isSystemService)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      supportedDelegationAccountUUIDToUserIdentity = self->_supportedDelegationAccountUUIDToUserIdentity;
      discoveredServices = self->_discoveredServices;
      *(_DWORD *)buf = 138543874;
      v66 = self;
      __int16 v67 = 2114;
      uint64_t v68 = (uint64_t)supportedDelegationAccountUUIDToUserIdentity;
      __int16 v69 = 2114;
      v70 = discoveredServices;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating delegation UUIDs [discovered services] - currentUUIDs=%{public}@ - discoveredServices=%{public}@", buf, 0x20u);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = (id)[(NSMutableSet *)self->_discoveredServices copy];
    uint64_t v46 = [obj countByEnumeratingWithState:&v61 objects:v76 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v62;
      *(void *)&long long v6 = 138544130;
      long long v42 = v6;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(obj);
          }
          long long v8 = *(ICDelegationProviderService **)(*((void *)&v61 + 1) + 8 * i);
          long long v9 = [(ICDelegationProviderService *)v8 delegationAccountUUIDs];
          long long v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v66 = v8;
            __int16 v67 = 2114;
            uint64_t v68 = (uint64_t)v9;
            _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "   |_ Processing service %{public}@ - delegationAccountUUIDs=%{public}@", buf, 0x16u);
          }

          if ([(NSMutableSet *)v9 count])
          {
            uint64_t v47 = i;
            v48 = v8;
            id v11 = (void *)[(NSMutableSet *)v9 mutableCopy];
            uint64_t v12 = [(NSMutableDictionary *)self->_supportedDelegationAccountUUIDToUserIdentity allKeys];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v13 = (void *)[v11 copy];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v75 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v58;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v58 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v57 + 1) + 8 * j);
                  if (([v12 containsObject:v18] & 1) == 0) {
                    [v11 removeObject:v18];
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v57 objects:v75 count:16];
              }
              while (v15);
            }

            id v19 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v66 = v48;
              __int16 v67 = 2114;
              uint64_t v68 = (uint64_t)v11;
              _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "      Processing service %{public}@ - eligibleDelegationAccountUUIDs=%{public}@", buf, 0x16u);
            }

            if ([v11 count])
            {
              uint64_t v20 = [(NSMapTable *)self->_activeServiceSessions objectForKey:v48];
              id v21 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v66 = v48;
                __int16 v67 = 2114;
                uint64_t v68 = (uint64_t)v20;
                _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "      Processing service %{public}@ - activeSessions=%{public}@", buf, 0x16u);
              }

              long long v55 = 0u;
              long long v56 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              id v22 = v20;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v74 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v54;
LABEL_28:
                uint64_t v26 = 0;
                while (1)
                {
                  if (*(void *)v54 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  long long v27 = [*(id *)(*((void *)&v53 + 1) + 8 * v26) delegationAccountUUIDs];
                  [v11 removeObjectsInArray:v27];

                  if (![(NSMutableSet *)v9 count]) {
                    break;
                  }
                  if (v24 == ++v26)
                  {
                    uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v74 count:16];
                    if (v24) {
                      goto LABEL_28;
                    }
                    break;
                  }
                }
              }
              id v44 = v22;

              long long v28 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v29 = [(NSMutableSet *)v9 count];
                *(_DWORD *)buf = 138543874;
                v66 = v48;
                __int16 v67 = 2048;
                uint64_t v68 = v29;
                __int16 v69 = 2114;
                v70 = v9;
                _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_DEFAULT, "      Processing service %{public}@ - %lu new delegated accounts - delegationAccountUUIDs=%{public}@", buf, 0x20u);
              }

              if ([(NSMutableSet *)v9 count])
              {
                long long v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                id v31 = v11;
                uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v73 count:16];
                if (v32)
                {
                  uint64_t v33 = v32;
                  uint64_t v34 = *(void *)v50;
                  do
                  {
                    for (uint64_t k = 0; k != v33; ++k)
                    {
                      if (*(void *)v50 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      v36 = [(NSMutableDictionary *)self->_supportedDelegationAccountUUIDToUserIdentity objectForKey:*(void *)(*((void *)&v49 + 1) + 8 * k)];
                      [v30 addObject:v36];
                    }
                    uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v73 count:16];
                  }
                  while (v33);
                }

                id v37 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v42;
                  v66 = self;
                  __int16 v67 = 2114;
                  uint64_t v68 = (uint64_t)v30;
                  __int16 v69 = 2114;
                  v70 = v9;
                  __int16 v71 = 2114;
                  v72 = v48;
                  _os_log_impl(&dword_1A2D01000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating delegation provider session [new delegated account] - userIdentity=%{public}@ - delegationAccountUUIDs=%{public}@ -  netService=%{public}@", buf, 0x2Au);
                }

                v38 = [[ICDelegationProviderServiceSession alloc] initWithUserIdentities:v30 userIdentityStore:self->_identityStore requestContext:self->_requestContext netService:v48 delegationAccountUUIDs:v9];
                [(ICDelegationProviderServiceSession *)v38 setDelegate:self];
                id v22 = v44;
                if (!v44)
                {
                  id v22 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
                  activeServiceSessions = self->_activeServiceSessions;
                  if (!activeServiceSessions)
                  {
                    v40 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
                    v41 = self->_activeServiceSessions;
                    self->_activeServiceSessions = v40;

                    activeServiceSessions = self->_activeServiceSessions;
                  }
                  [(NSMapTable *)activeServiceSessions setObject:v22 forKey:v48];
                }
                [v22 addObject:v38];
                [(ICDelegationProviderServiceSession *)v38 start];
              }
            }

            uint64_t i = v47;
          }
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v61 objects:v76 count:16];
      }
      while (v46);
    }
  }
}

- (void)_updateBrowsingStatus
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isSystemService)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = self;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating browsing status", buf, 0xCu);
    }

    [(ICDelegationProviderService *)self _updateAssertionTimeouts];
    if (![(NSMutableSet *)self->_assertions count])
    {
      self->_BOOL isNetServiceBrowserSearching = 0;
      long long v9 = self->_netServiceBrowser;
      netServiceBrowserQueue = self->_netServiceBrowserQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_31;
      v11[3] = &unk_1E5ACD4C8;
      uint64_t v12 = v9;
      id v13 = self;
      long long v7 = v9;
      dispatch_async(netServiceBrowserQueue, v11);
      long long v8 = v12;
      goto LABEL_10;
    }
    if (!self->_netServiceBrowser)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke;
      block[3] = &unk_1E5ACD750;
      void block[4] = self;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    BOOL isNetServiceBrowserSearching = self->_isNetServiceBrowserSearching;
    self->_BOOL isNetServiceBrowserSearching = 1;
    if (!isNetServiceBrowserSearching)
    {
      uint64_t v5 = self->_netServiceBrowser;
      long long v6 = self->_netServiceBrowserQueue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_2;
      v14[3] = &unk_1E5ACB070;
      char v16 = 0;
      v14[4] = self;
      uint64_t v15 = v5;
      long long v7 = v5;
      dispatch_async(v6, v14);
      long long v8 = v15;
LABEL_10:
    }
  }
}

uint64_t __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F18D68]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  [*(id *)(*(void *)(a1 + 32) + 88) setIncludesPeerToPeer:0];
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 88);

  return objc_msgSend(v5, "setDelegate:");
}

uint64_t __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_2(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    id v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      uint64_t v4 = *(void *)(v1 + 40);
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2114;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Searching for services with browser: %{public}@", (uint8_t *)&v5, 0x16u);
    }

    return [*(id *)(v1 + 40) searchForServicesOfType:@"_itsdlgt._tcp." inDomain:@"local"];
  }
  return result;
}

void __52__ICDelegationProviderService__updateBrowsingStatus__block_invoke_31(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) stop];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping service search with browser: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_updateAssertionTimeouts
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  assertionTimeoutSource = self->_assertionTimeoutSource;
  if (assertionTimeoutSource)
  {
    dispatch_source_cancel(assertionTimeoutSource);
    uint64_t v4 = self->_assertionTimeoutSource;
    self->_assertionTimeoutSource = 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v26 = self;
  int v5 = self->_assertions;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v13 = [v12 expirationDate];
        uint64_t v14 = v13;
        if (v13)
        {
          [v13 timeIntervalSinceNow];
          if (v15 <= 0.00000011920929)
          {
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v9 addObject:v12];
          }
          else if (!v8 {
                 || ([v8 earlierDate:v14],
          }
                     char v16 = objc_claimAutoreleasedReturnValue(),
                     v16,
                     v16 == v14))
          {
            id v17 = v14;

            uint64_t v8 = v17;
          }
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }

  if ([v9 count]) {
    [(NSMutableSet *)v26->_assertions minusSet:v9];
  }
  if (v8)
  {
    [v8 timeIntervalSinceNow];
    double v19 = v18;
    uint64_t v20 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v20);
    id v22 = v26->_assertionTimeoutSource;
    v26->_assertionTimeoutSource = (OS_dispatch_source *)v21;

    uint64_t v23 = v26->_assertionTimeoutSource;
    dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v19 * 0.01 * 1000000000.0));
    objc_initWeak(&location, v26);
    uint64_t v25 = v26->_assertionTimeoutSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke;
    handler[3] = &unk_1E5ACD778;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v25, handler);
    dispatch_resume((dispatch_object_t)v26->_assertionTimeoutSource);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke_2;
    block[3] = &unk_1E5ACD750;
    int v5 = WeakRetained;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __55__ICDelegationProviderService__updateAssertionTimeouts__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[73]) {
    return [v1 _updateBrowsingStatus];
  }
  else {
    return [v1 _updateAssertionTimeouts];
  }
}

- (void)_removeConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_connections removeObject:v4];
  int v5 = [(NSMapTable *)self->_connectionToAssertions objectForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = [v11 expirationDate];

          if (!v12) {
            [(NSMutableSet *)self->_assertions removeObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    [(NSMapTable *)self->_connectionToAssertions removeObjectForKey:v4];
  }
  if (![(NSMutableSet *)self->_connections count])
  {
    connections = self->_connections;
    self->_connections = 0;
  }
  [(ICDelegationProviderService *)self _updateBrowsingStatus];
}

- (void)_unregisterNotificationsForDelegationNetService:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:@"ICDelegationProviderNetServiceDelegationAccountUUIDsDidChangeNotification" object:v5];
}

- (void)_registerNotificationsForDelegationNetService:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel__netServiceDelegationAccountUUIDsDidChangeNotification_ name:@"ICDelegationProviderNetServiceDelegationAccountUUIDsDidChangeNotification" object:v5];
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  connections = self->_connections;
  id v8 = v4;
  if (!connections)
  {
    id v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v7 = self->_connections;
    self->_connections = v6;

    id v4 = v8;
    connections = self->_connections;
  }
  [(NSMutableSet *)connections addObject:v4];
}

- (void)_netServiceDelegationAccountUUIDsDidChangeNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegation account UUIDs did change for with notification: %{public}@", buf, 0x16u);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__ICDelegationProviderService__netServiceDelegationAccountUUIDsDidChangeNotification___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __86__ICDelegationProviderService__netServiceDelegationAccountUUIDsDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDelegationForDiscoveredServices];
}

- (void)delegationProviderServiceRemoveAssertion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29268] currentConnection];
    if (v5)
    {
      id v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v12 = self;
        __int16 v13 = 2114;
        long long v14 = v5;
        __int16 v15 = 2114;
        id v16 = v4;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection %{public}@ did remove assertion: %{public}@", buf, 0x20u);
      }

      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__ICDelegationProviderService_delegationProviderServiceRemoveAssertion___block_invoke;
      block[3] = &unk_1E5ACD5C8;
      void block[4] = self;
      id v9 = v5;
      id v10 = v4;
      dispatch_barrier_async(accessQueue, block);
    }
  }
}

void __72__ICDelegationProviderService_delegationProviderServiceRemoveAssertion___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 48)];
    [v4 removeObject:*(void *)(a1 + 48)];
    if (![v4 count])
    {
      [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
      if (![*(id *)(*(void *)(a1 + 32) + 32) count])
      {
        uint64_t v2 = *(void *)(a1 + 32);
        uint64_t v3 = *(void **)(v2 + 32);
        *(void *)(v2 + 32) = 0;
      }
    }
    [*(id *)(a1 + 32) _updateBrowsingStatus];
  }
}

- (void)delegationProviderServiceAddAssertion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29268] currentConnection];
    if (v5)
    {
      id v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v12 = self;
        __int16 v13 = 2114;
        long long v14 = v5;
        __int16 v15 = 2114;
        id v16 = v4;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection %{public}@ did add assertion: %{public}@", buf, 0x20u);
      }

      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__ICDelegationProviderService_delegationProviderServiceAddAssertion___block_invoke;
      block[3] = &unk_1E5ACD5C8;
      void block[4] = self;
      id v9 = v5;
      id v10 = v4;
      dispatch_barrier_async(accessQueue, block);
    }
  }
}

void __69__ICDelegationProviderService_delegationProviderServiceAddAssertion___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v4 = *(void **)(*(void *)(a1 + 32) + 32);
      id v12 = v3;
      if (!v4)
      {
        uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void **)(v6 + 32);
        *(void *)(v6 + 32) = v5;

        id v4 = *(void **)(*(void *)(a1 + 32) + 32);
      }
      [v4 setObject:v12 forKey:*(void *)(a1 + 40)];
      uint64_t v2 = (uint64_t)v12;
    }
    id v13 = (id)v2;
    id v8 = *(void **)(*(void *)(a1 + 32) + 40);
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v8 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    [v8 addObject:*(void *)(a1 + 48)];
    [v13 addObject:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _updateBrowsingStatus];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 valueForEntitlement:@"com.apple.itunescloud.delegation-provider"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    accessQueue = self->_accessQueue;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke;
    long long v14 = &unk_1E5ACD4C8;
    __int16 v15 = self;
    id v9 = v5;
    id v16 = v9;
    dispatch_barrier_sync(accessQueue, &v11);
    objc_msgSend(v9, "resume", v11, v12, v13, v14, v15);
  }
  return v7;
}

void __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF67B960];
  [v2 setRemoteObjectInterface:v3];

  [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);
  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF64EA40];
  [v4 setExportedInterface:v5];

  uint64_t v6 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_2;
  v14[3] = &unk_1E5ACA2F0;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  [v6 setInterruptionHandler:v14];
  int v7 = *(void **)(a1 + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_22;
  uint64_t v11 = &unk_1E5ACA2F0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v7 setInvalidationHandler:&v8];
  objc_msgSend(*(id *)(a1 + 32), "_addConnection:", *(void *)(a1 + 40), v8, v9, v10, v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection interrupted.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4) {
      [WeakRetained _removeConnection:v4];
    }
  }
}

void __66__ICDelegationProviderService_listener_shouldAcceptNewConnection___block_invoke_22(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "[ICDelegationProviderService] Connection invalidated.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4) {
      [WeakRetained _removeConnection:v4];
    }
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    int v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing service %{public}@", buf, 0x16u);
    }

    accessQueue = self->_accessQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__ICDelegationProviderService_netServiceBrowser_didRemoveService_moreComing___block_invoke;
    v9[3] = &unk_1E5ACD4C8;
    void v9[4] = self;
    id v10 = v6;
    dispatch_barrier_async(accessQueue, v9);
  }
}

void __77__ICDelegationProviderService_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v25 != v5) {
        objc_enumerationMutation(v2);
      }
      int v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
      uint64_t v8 = [v7 netService];
      uint64_t v9 = *(void **)(a1 + 40);

      if (v8 == v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v7;

    if (!v10) {
      return;
    }
    [*(id *)(a1 + 32) _unregisterNotificationsForDelegationNetService:v10];
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v10];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) stop];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v13);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v10];
    if (![*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(v16 + 16);
      *(void *)(v16 + 16) = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v10];
    if (![*(id *)(*(void *)(a1 + 32) + 56) count])
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void **)(v18 + 56);
      *(void *)(v18 + 56) = 0;
    }
  }
  else
  {
LABEL_9:
    id v10 = v2;
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    int v7 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found service %{public}@", buf, 0x16u);
    }

    uint64_t v8 = [[ICDelegationProviderNetService alloc] initWithNetService:v6];
    accessQueue = self->_accessQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__ICDelegationProviderService_netServiceBrowser_didFindService_moreComing___block_invoke;
    v11[3] = &unk_1E5ACD4C8;
    void v11[4] = self;
    uint64_t v12 = v8;
    id v10 = v8;
    dispatch_barrier_async(accessQueue, v11);
  }
}

uint64_t __75__ICDelegationProviderService_netServiceBrowser_didFindService_moreComing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _registerNotificationsForDelegationNetService:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 32);

  return [v6 _updateDelegationForDiscoveredServices];
}

- (void)startSystemXPCService
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_isSystemService)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICDelegationProviderService.m" lineNumber:140 description:@"Cannot start XPC service for non-system service."];
  }
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting XPC service.", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ICDelegationProviderService_startSystemXPCService__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __52__ICDelegationProviderService_startSystemXPCService__block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 80))
  {
    uint64_t v1 = result;
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.itunescloud.delegation-provider"];
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = v2;

    objc_msgSend(*(id *)(*(void *)(v1 + 32) + 80), "setDelegate:");
    uint64_t v5 = *(void **)(*(void *)(v1 + 32) + 80);
    return [v5 resume];
  }
  return result;
}

- (void)removeAssertion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ICDelegationProviderService_removeAssertion___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __47__ICDelegationProviderService_removeAssertion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[73])
  {
    return [v2 _updateBrowsingStatus];
  }
  else
  {
    id v4 = [v2 _xpcConnection];
    uint64_t v5 = [v4 remoteObjectProxy];
    [v5 delegationProviderServiceRemoveAssertion:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    return [v6 _updateAssertionTimeouts];
  }
}

- (void)addAssertion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ICDelegationProviderService_addAssertion___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __44__ICDelegationProviderService_addAssertion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  id v6 = *(unsigned char **)(a1 + 32);
  if (v6[73])
  {
    return [v6 _updateBrowsingStatus];
  }
  else
  {
    id v8 = [v6 _xpcConnection];
    uint64_t v9 = [v8 remoteObjectProxy];
    [v9 delegationProviderServiceAddAssertion:*(void *)(a1 + 40)];

    uint64_t v10 = *(void **)(a1 + 32);
    return [v10 _updateAssertionTimeouts];
  }
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_discoveredServices;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        [(ICDelegationProviderService *)self _unregisterNotificationsForDelegationNetService:*(void *)(*((void *)&v11 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"ICUserIdentityStoreDidChangeNotification" object:self->_identityStore];
  [(NSXPCListener *)self->_listener setDelegate:0];
  assertionTimeoutSource = self->_assertionTimeoutSource;
  if (assertionTimeoutSource) {
    dispatch_source_cancel(assertionTimeoutSource);
  }

  v10.receiver = self;
  v10.super_class = (Class)ICDelegationProviderService;
  [(ICDelegationProviderService *)&v10 dealloc];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ICDelegationProviderService;
  uint64_t v2 = [(ICDelegationProviderService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderService.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)systemServiceWithRequestContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)a1) _init];
  objc_super v6 = (void *)v5;
  if (v5)
  {
    *(unsigned char *)(v5 + 73) = 1;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderService.netServiceBrowserQueue", 0);
    id v8 = (void *)v6[12];
    v6[12] = v7;

    uint64_t v9 = [v4 copy];
    objc_super v10 = (void *)v6[16];
    v6[16] = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v11 setName:@"com.apple.iTunesCloud.ICDelegationProviderService.identityStoreOperationQueue"];
    [v11 setMaxConcurrentOperationCount:1];
    [v11 setQualityOfService:17];
    long long v12 = (void *)v6[13];
    v6[13] = v11;
    id v13 = v11;

    long long v14 = +[ICUserIdentityStore defaultIdentityStore];
    __int16 v15 = (void *)v6[8];
    v6[8] = v14;
    id v16 = v14;

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v6 selector:sel__userIdentityStoreDidChangeNotification_ name:@"ICUserIdentityStoreDidChangeNotification" object:v16];
    uint64_t v18 = +[ICSecurityInfo sharedSecurityInfo];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__ICDelegationProviderService_systemServiceWithRequestContext___block_invoke;
    v20[3] = &unk_1E5ACD750;
    long long v21 = v6;
    [v18 performBlockAfterFirstUnlock:v20];
  }

  return v6;
}

uint64_t __63__ICDelegationProviderService_systemServiceWithRequestContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSupportedDelegationAccountUUIDs];
}

+ (ICDelegationProviderService)sharedService
{
  if (sharedService_sOnceToken != -1) {
    dispatch_once(&sharedService_sOnceToken, &__block_literal_global_7606);
  }
  uint64_t v2 = (void *)sharedService_sSharedService;

  return (ICDelegationProviderService *)v2;
}

uint64_t __44__ICDelegationProviderService_sharedService__block_invoke()
{
  id v0 = [[ICDelegationProviderService alloc] _init];
  uint64_t v1 = sharedService_sSharedService;
  sharedService_sSharedService = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end