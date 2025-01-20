@interface ICUserCredentialProvider
+ (ICUserCredentialProvider)sharedProvider;
- (ICUserCredentialProvider)init;
- (void)_handleCredentialRequestIdentityPropertiesForSession:(id)a3;
- (void)_handleDelegationAccountUUIDsForSession:(id)a3;
- (void)_handleIdentityProperties:(id)a3 forIdentity:(id)a4 loadingError:(id)a5 credentialRequest:(id)a6 session:(id)a7;
- (void)_handlePendingDelegationRequestsForSession:(id)a3;
- (void)_handleRequestIndependentPropertiesForSession:(id)a3;
- (void)performCredentialRequest:(id)a3 withResponseHandler:(id)a4;
- (void)performCredentialRequests:(id)a3 withResponseHandler:(id)a4;
@end

@implementation ICUserCredentialProvider

- (void)performCredentialRequests:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  if (![v8 count])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ICUserCredentialProvider.m", 272, @"Invalid parameter not satisfying: %@", @"[credentialRequests count] > 0" object file lineNumber description];
  }
  v9 = [[_ICUserCredentialProviderRequestSession alloc] initWithCredentialRequests:v8 responseHandler:v7];

  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Created new credentials provider session %{public}@", buf, 0x16u);
  }

  [(ICUserCredentialProvider *)self _handleRequestIndependentPropertiesForSession:v9];
}

+ (ICUserCredentialProvider)sharedProvider
{
  if (sharedProvider_sOnceToken_40178 != -1) {
    dispatch_once(&sharedProvider_sOnceToken_40178, &__block_literal_global_40179);
  }
  v2 = (void *)sharedProvider_sSharedProvider_40180;

  return (ICUserCredentialProvider *)v2;
}

void __74__ICUserCredentialProvider__handleRequestIndependentPropertiesForSession___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 getPropertiesForActiveICloudAccountReturningError:0];
  [*(id *)(a1 + 40) setActiveICloudAccountProperties:v5];
  [*(id *)(a1 + 48) _handleCredentialRequestIdentityPropertiesForSession:*(void *)(a1 + 40)];
  [v4 finish];
}

- (void)_handleCredentialRequestIdentityPropertiesForSession:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 credentialRequests];
  v6 = (void *)[v5 mutableCopy];
  [v4 setPendingPropertyLoadCredentialRequests:v6];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v22 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v22)
  {
    uint64_t v8 = *(void *)v25;
    *(void *)&long long v7 = 138543874;
    long long v20 = v7;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v11 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v29 = self;
          __int16 v30 = 2114;
          v31 = v10;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading identity properties for request %{public}@", buf, 0x16u);
        }

        v12 = [v10 identity];
        v13 = [v10 identityStore];
        id v23 = 0;
        __int16 v14 = [v13 getPropertiesForUserIdentity:v12 error:&v23];
        id v15 = v23;

        if (v15)
        {
          uint64_t v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "msv_description");
            uint64_t v17 = v8;
            v19 = id v18 = v4;
            *(_DWORD *)buf = v20;
            v29 = self;
            __int16 v30 = 2114;
            v31 = v10;
            __int16 v32 = 2114;
            v33 = v19;
            _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load identity properties for request: %{public}@ error=%{public}@", buf, 0x20u);

            id v4 = v18;
            uint64_t v8 = v17;
          }
        }
        -[ICUserCredentialProvider _handleIdentityProperties:forIdentity:loadingError:credentialRequest:session:](self, "_handleIdentityProperties:forIdentity:loadingError:credentialRequest:session:", v14, v12, v15, v10, v4, v20);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v22);
  }
}

- (void)_handleRequestIndependentPropertiesForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 maximumQualityOfService];
  v6 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", v5);
  long long v7 = [v4 identityStore];
  uint64_t v8 = [ICAsyncBlockOperation alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__ICUserCredentialProvider__handleRequestIndependentPropertiesForSession___block_invoke;
  v12[3] = &unk_1E5ACD5A0;
  id v13 = v7;
  id v14 = v4;
  id v15 = self;
  id v9 = v4;
  id v10 = v7;
  v11 = [(ICAsyncBlockOperation *)v8 initWithStartHandler:v12];
  [v6 addOperation:v11];
}

- (void)_handleIdentityProperties:(id)a3 forIdentity:(id)a4 loadingError:(id)a5 credentialRequest:(id)a6 session:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    id v17 = v12;
    id v18 = [v17 DSID];
    if (v18)
    {
      v19 = +[ICUserIdentity specificAccountWithDSID:v18];
    }
    else
    {
      v21 = [v17 carrierBundleDeviceIdentifier];
      if (v21)
      {
        v19 = +[ICUserIdentity carrierBundleWithDeviceIdentifier:v21];
      }
      else
      {
        v19 = 0;
      }
    }
    long long v20 = objc_msgSend(v19, "identityAllowingDelegation:", objc_msgSend(v13, "allowsDelegation"));
  }
  else
  {
    long long v20 = 0;
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke;
  block[3] = &unk_1E5ACD708;
  id v30 = v16;
  id v31 = v15;
  id v32 = v12;
  v33 = self;
  id v34 = v14;
  id v35 = v13;
  id v36 = v20;
  id v23 = v20;
  id v24 = v13;
  id v25 = v14;
  id v26 = v12;
  id v27 = v15;
  id v28 = v16;
  dispatch_barrier_async(accessQueue, block);
}

void __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) pendingPropertyLoadCredentialRequests];
  [v2 removeObject:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 32) delegationCredentialRequestToSpecificUserIdentity];
  if ([*(id *)(a1 + 48) isDelegated])
  {
    id v4 = [*(id *)(a1 + 48) delegateToken];
    id v5 = v4;
    if (v4 && ([v4 isExpired] & 1) == 0 && objc_msgSend(v5, "type") == 1)
    {
      v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 56);
        uint64_t v8 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v7;
        __int16 v39 = 2114;
        uint64_t v40 = v8;
        __int16 v41 = 2114;
        id v42 = v5;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Using existing delegation token for identity %{public}@: %{public}@", buf, 0x20u);
      }

      id v9 = objc_alloc_init(ICUserCredentialResponse);
      [(ICUserCredentialResponse *)v9 setIdentityProperties:*(void *)(a1 + 48)];
      id v10 = [*(id *)(a1 + 32) activeICloudAccountProperties];
      [(ICUserCredentialResponse *)v9 setICloudIdentityProperties:v10];

      v11 = [*(id *)(a1 + 32) pendingResponseCredentialRequests];
      [v11 removeObject:*(void *)(a1 + 40)];

      char v12 = [*(id *)(a1 + 32) hasPendingResponses] ^ 1;
      id v13 = [*(id *)(a1 + 32) responseHandler];
      id v14 = *(NSObject **)(*(void *)(a1 + 56) + 16);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_20;
      v25[3] = &unk_1E5ACD690;
      id v29 = v13;
      id v26 = *(id *)(a1 + 40);
      id v27 = v9;
      id v28 = *(id *)(a1 + 64);
      char v30 = v12;
      id v15 = v9;
      id v16 = v13;
      dispatch_async(v14, v25);
    }
    else
    {
      uint64_t v22 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 56);
        uint64_t v24 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v23;
        __int16 v39 = 2114;
        uint64_t v40 = v24;
        _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching new delegation token for identity %{public}@", buf, 0x16u);
      }

      if (!v3)
      {
        v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        [*(id *)(a1 + 32) setDelegationCredentialRequestToSpecificUserIdentity:v3];
      }
      [v3 setObject:*(void *)(a1 + 80) forKey:*(void *)(a1 + 40)];
      id v16 = [*(id *)(a1 + 32) delegationCredentialRequestToIdentityProperties];
      if (!v16)
      {
        id v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        [*(id *)(a1 + 32) setDelegationCredentialRequestToIdentityProperties:v16];
      }
      [(ICUserCredentialResponse *)v16 setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v17 = objc_alloc_init(ICUserCredentialResponse);
    [(ICUserCredentialResponse *)v17 setIdentityProperties:*(void *)(a1 + 48)];
    id v18 = [*(id *)(a1 + 32) activeICloudAccountProperties];
    [(ICUserCredentialResponse *)v17 setICloudIdentityProperties:v18];

    v19 = [*(id *)(a1 + 32) pendingResponseCredentialRequests];
    [v19 removeObject:*(void *)(a1 + 40)];

    LOBYTE(v19) = [*(id *)(a1 + 32) hasPendingResponses] ^ 1;
    long long v20 = [*(id *)(a1 + 32) responseHandler];
    v21 = *(NSObject **)(*(void *)(a1 + 56) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_2;
    block[3] = &unk_1E5ACD690;
    id v35 = v20;
    id v32 = *(id *)(a1 + 40);
    v33 = v17;
    id v34 = *(id *)(a1 + 64);
    char v36 = (char)v19;
    id v16 = v17;
    id v5 = v20;
    dispatch_async(v21, block);
  }
  if (![v2 count] && objc_msgSend(v3, "count")) {
    [*(id *)(a1 + 56) _handleDelegationAccountUUIDsForSession:*(void *)(a1 + 32)];
  }
}

uint64_t __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

uint64_t __42__ICUserCredentialProvider_sharedProvider__block_invoke()
{
  sharedProvider_sSharedProvider_40180 = objc_alloc_init(ICUserCredentialProvider);

  return MEMORY[0x1F41817F8]();
}

- (ICUserCredentialProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICUserCredentialProvider;
  v2 = [(ICUserCredentialProvider *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICUserCredentialProvider.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iTunesCloud.ICUserCredentialProvider.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationConsumerService, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __105__ICUserCredentialProvider__handleIdentityProperties_forIdentity_loadingError_credentialRequest_session___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

- (void)_handlePendingDelegationRequestsForSession:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = self;
    __int16 v43 = 2114;
    id v44 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling pending delegation requests for session %{public}@", buf, 0x16u);
  }

  char v30 = [v4 delegationCredentialRequestToIdentityProperties];
  id v31 = v4;
  v6 = [v4 delegationCredentialRequestToSpecificUserIdentity];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = 0;
    uint64_t v12 = *(void *)v37;
    double v13 = 30.0;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v16 = [v8 objectForKey:v15];
        if (v16) {
          [v7 addObject:v16];
        }
        if (!v11)
        {
          id v17 = [ICStoreRequestContext alloc];
          id v18 = [v15 clientInfo];
          v11 = [(ICRequestContext *)v17 initWithClientInfo:v18];
        }
        [v15 timeoutInterval];
        if (v13 >= v19) {
          double v13 = v19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    double v13 = 30.0;
  }

  long long v20 = [ICDelegationConsumerServiceRequest alloc];
  v21 = [v31 delegationUserIdentityToUUIDs];
  uint64_t v22 = (void *)[v21 copy];
  uint64_t v23 = [(ICDelegationConsumerServiceRequest *)v20 initWithUserIdentityDelegationAccountUUIDs:v22 requestContext:v11 timeoutInterval:v13];

  delegationConsumerService = self->_delegationConsumerService;
  if (!delegationConsumerService)
  {
    id v25 = objc_alloc_init(ICDelegationConsumerService);
    id v26 = self->_delegationConsumerService;
    self->_delegationConsumerService = v25;

    delegationConsumerService = self->_delegationConsumerService;
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke;
  v32[3] = &unk_1E5ACD6E0;
  v32[4] = self;
  id v33 = v31;
  id v34 = v8;
  id v35 = v30;
  id v27 = v30;
  id v28 = v8;
  id v29 = v31;
  [(ICDelegationConsumerService *)delegationConsumerService performRequest:v23 withResponseHandler:v32];
}

void __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = objc_msgSend(v14, "msv_description");
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v17;
      __int16 v47 = 2114;
      id v48 = v11;
      __int16 v49 = 1024;
      int v50 = a6;
      __int16 v51 = 2114;
      id v52 = v12;
      __int16 v53 = 2114;
      v54 = v18;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Finished delegation request for identity: %{public}@. isLastResponse=%{BOOL}u. delegateToken=%{public}@ error=%{public}@", buf, 0x30u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544130;
    uint64_t v46 = v19;
    __int16 v47 = 2114;
    id v48 = v11;
    __int16 v49 = 1024;
    int v50 = a6;
    __int16 v51 = 2114;
    id v52 = v12;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished delegation request for identity: %{public}@. isLastResponse=%{BOOL}u. delegateToken=%{public}@", buf, 0x26u);
  }

  if (v12 && [v12 type] == 1)
  {
    char v20 = 1;
LABEL_10:
    uint64_t v22 = [*(id *)(a1 + 40) identityStore];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_16;
    v41[3] = &unk_1E5ACD668;
    char v44 = v20;
    id v42 = v12;
    id v43 = v13;
    [v22 updatePropertiesForUserIdentity:v11 usingBlock:v41];

    char v21 = v20;
    goto LABEL_11;
  }
  char v20 = 0;
  char v21 = 0;
  if ([v13 length]) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v23 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_2;
  v30[3] = &unk_1E5ACD6B8;
  id v31 = *(id *)(a1 + 40);
  id v32 = *(id *)(a1 + 48);
  id v33 = v11;
  char v39 = a6;
  id v24 = *(id *)(a1 + 56);
  char v40 = v21;
  id v34 = v24;
  id v35 = v12;
  uint64_t v25 = *(void *)(a1 + 32);
  id v36 = v13;
  uint64_t v37 = v25;
  id v38 = v14;
  id v26 = v14;
  id v27 = v13;
  id v28 = v12;
  id v29 = v11;
  dispatch_barrier_async(v23, v30);
}

void __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    [v3 setDelegateToken:*(void *)(a1 + 32)];
  }
  if ([*(id *)(a1 + 40) length]) {
    [v3 setStorefrontIdentifier:*(void *)(a1 + 40)];
  }
}

void __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) pendingResponseCredentialRequests];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  char v20 = v30 = 0u;
  id obj = (id)[v20 copy];
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v6 = [*(id *)(a1 + 40) objectForKey:v5];
        uint64_t v7 = *(void *)(a1 + 48);
        id v8 = [v5 identityStore];
        if ([v6 isEqualToIdentity:v7 inStore:v8])
        {
        }
        else
        {
          int v9 = *(unsigned __int8 *)(a1 + 96);

          if (!v9) {
            goto LABEL_14;
          }
        }
        uint64_t v10 = objc_alloc_init(ICUserCredentialResponse);
        id v11 = [*(id *)(a1 + 56) objectForKey:v5];
        id v12 = (void *)[v11 mutableCopy];

        if (*(unsigned char *)(a1 + 97)) {
          [v12 setDelegateToken:*(void *)(a1 + 64)];
        }
        if (*(void *)(a1 + 72)) {
          objc_msgSend(v12, "setStorefrontIdentifier:");
        }
        [(ICUserCredentialResponse *)v10 setIdentityProperties:v12];
        id v13 = [*(id *)(a1 + 32) activeICloudAccountProperties];
        [(ICUserCredentialResponse *)v10 setICloudIdentityProperties:v13];

        [v20 removeObject:v5];
        char v14 = [*(id *)(a1 + 32) hasPendingResponses] ^ 1;
        id v15 = [*(id *)(a1 + 32) responseHandler];
        id v16 = *(NSObject **)(*(void *)(a1 + 80) + 16);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_3;
        block[3] = &unk_1E5ACD690;
        id v25 = v15;
        void block[4] = v5;
        uint64_t v23 = v10;
        id v24 = *(id *)(a1 + 88);
        char v26 = v14;
        uint64_t v17 = v10;
        id v18 = v15;
        dispatch_async(v16, block);

LABEL_14:
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v3);
  }
}

uint64_t __71__ICUserCredentialProvider__handlePendingDelegationRequestsForSession___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

- (void)_handleDelegationAccountUUIDsForSession:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v44 = self;
    __int16 v45 = 2114;
    id v46 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching delegation UUIDs for session %{public}@", buf, 0x16u);
  }

  uint64_t v5 = [v3 maximumQualityOfService];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  dispatch_qos_class_t qos_class = v5;
  [v6 setQualityOfService:v5];
  [v6 setMaxConcurrentOperationCount:3];
  [v6 setName:@"com.apple.iTunesCloud.ICUserCredentialProvider.delegationAccountUUIDOperationQueue"];
  uint64_t v7 = dispatch_group_create();
  id v25 = [v3 identityStore];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v24 = v3;
  int v9 = [v3 delegationCredentialRequestToSpecificUserIdentity];
  uint64_t v10 = [v9 objectEnumerator];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        dispatch_group_enter(v7);
        id v16 = [ICAsyncBlockOperation alloc];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke;
        v32[3] = &unk_1E5ACD618;
        id v33 = v25;
        uint64_t v34 = v15;
        id v35 = self;
        id v36 = v8;
        uint64_t v37 = v7;
        uint64_t v17 = [(ICAsyncBlockOperation *)v16 initWithStartHandler:v32];
        [v6 addOperation:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v12);
  }

  id v18 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
  uint64_t v19 = dispatch_queue_create("com.apple.iTunesCloud.ICUserCredentialProvider.delegationAccountUUIDSerialQueue", v18);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_4;
  block[3] = &unk_1E5ACD640;
  id v28 = v6;
  long long v29 = self;
  id v30 = v3;
  id v31 = v8;
  id v20 = v8;
  id v21 = v24;
  id v22 = v6;
  dispatch_group_notify(v7, v19, block);
}

void __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_2;
  v10[3] = &unk_1E5ACD5F0;
  id v6 = *(void **)(a1 + 56);
  v10[4] = *(void *)(a1 + 48);
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 64);
  id v14 = v3;
  id v9 = v3;
  [v4 getDelegationUUIDsForUserIdentity:v5 completionHandler:v10];
}

void __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_4(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_5;
  block[3] = &unk_1E5ACD5C8;
  void block[4] = v2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_barrier_async(v4, block);
}

uint64_t __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_5(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished loading delegation UUIDs for session %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(a1 + 40) setDelegationUserIdentityToUUIDs:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) _handlePendingDelegationRequestsForSession:*(void *)(a1 + 40)];
}

void __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    int v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_3;
    block[3] = &unk_1E5ACD5C8;
    id v11 = *(id *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = v8;
    uint64_t v13 = v9;
    dispatch_barrier_async(v7, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  [*(id *)(a1 + 64) finishWithError:v6];
}

uint64_t __68__ICUserCredentialProvider__handleDelegationAccountUUIDsForSession___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)performCredentialRequest:(id)a3 withResponseHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13[0] = a3;
  int v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  uint64_t v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__ICUserCredentialProvider_performCredentialRequest_withResponseHandler___block_invoke;
  v11[3] = &unk_1E5ACD578;
  id v12 = v6;
  id v10 = v6;
  [(ICUserCredentialProvider *)self performCredentialRequests:v9 withResponseHandler:v11];
}

uint64_t __73__ICUserCredentialProvider_performCredentialRequest_withResponseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

@end