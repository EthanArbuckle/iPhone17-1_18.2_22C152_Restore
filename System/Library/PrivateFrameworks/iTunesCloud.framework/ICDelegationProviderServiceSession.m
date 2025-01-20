@interface ICDelegationProviderServiceSession
- (ICDelegationProviderNetService)netService;
- (ICDelegationProviderServiceSession)initWithUserIdentities:(id)a3 userIdentityStore:(id)a4 requestContext:(id)a5 netService:(id)a6 delegationAccountUUIDs:(id)a7;
- (ICDelegationProviderServiceSessionDelegate)delegate;
- (ICRequestContext)requestContext;
- (ICUserIdentityStore)userIdentityStore;
- (NSArray)delegationAccountUUIDs;
- (NSArray)userIdentities;
- (void)_finishWithError:(id)a3;
- (void)_handleStartDelegationResponse:(id)a3;
- (void)_startDelegation;
- (void)delegationServiceConnection:(id)a3 didEncouterError:(id)a4;
- (void)delegationServiceConnectionDidClose:(id)a3;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDelegationProviderServiceSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentities, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_delegationAccountUUIDs, 0);
  objc_storeStrong((id *)&self->_sessionIDToStreamContext, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (NSArray)userIdentities
{
  return self->_userIdentities;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (ICDelegationProviderNetService)netService
{
  return self->_netService;
}

- (NSArray)delegationAccountUUIDs
{
  return self->_delegationAccountUUIDs;
}

- (void)_startDelegation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_userIdentities;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) DSID];
        if (v9 && ([v3 containsObject:v9] & 1) == 0) {
          [v3 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  protocolHandler = self->_protocolHandler;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke;
  v11[3] = &unk_1E5ACAEC8;
  v11[4] = self;
  [(ICDelegationProviderServiceProtocolHandler *)protocolHandler getStartDelegationRequestForAccountIDs:v3 withCompletionHandler:v11];
}

void __54__ICDelegationProviderServiceSession__startDelegation__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_2;
  v15[3] = &unk_1E5ACD640;
  v15[4] = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_barrier_async(v11, v15);
}

void __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[7] == 3)
  {
    if (*(void *)(a1 + 40))
    {
      if ([*(id *)(a1 + 48) count])
      {
        id v3 = *(void **)(*(void *)(a1 + 32) + 48);
        if (!v3)
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v5 = *(void *)(a1 + 32);
          uint64_t v6 = *(void **)(v5 + 48);
          *(void *)(v5 + 48) = v4;

          id v3 = *(void **)(*(void *)(a1 + 32) + 48);
        }
        [v3 addEntriesFromDictionary:*(void *)(a1 + 48)];
      }
      id v7 = objc_alloc_init(ICPBDGSRequest);
      id v8 = v7;
      if (v7) {
        objc_storeStrong((id *)&v7->_startDelegationRequest, *(id *)(a1 + 40));
      }
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(v9 + 24);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_3;
      v13[3] = &unk_1E5ACAE78;
      v13[4] = v9;
      [v10 sendRequest:v8 withResponseHandler:v13];
    }
    else if (*(void *)(a1 + 56))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v11, "_finishWithError:");
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
      [v1 _finishWithError:v12];
    }
  }
}

void __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ICDelegationProviderServiceSession__startDelegation__block_invoke_4;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_barrier_async(v5, v7);
}

void *__54__ICDelegationProviderServiceSession__startDelegation__block_invoke_4(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[7] == 3) {
    return (void *)[result _handleStartDelegationResponse:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  [(ICDelegationServiceConnection *)self->_connection setDelegate:0];
  [(ICDelegationServiceConnection *)self->_connection close];
  self->_state = 4;
  uint64_t v5 = self->_delegate;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ICDelegationProviderServiceSession__finishWithError___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  uint64_t v10 = v5;
  v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(calloutQueue, block);
}

uint64_t __55__ICDelegationProviderServiceSession__finishWithError___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 delegationProviderServiceSession:v4 didFinishWithError:v5];
  }
  return result;
}

- (void)_handleStartDelegationResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received response: %{public}@", buf, 0x16u);
  }

  if (v4 && (id v6 = v4[3]) != 0)
  {
    id v7 = v6;
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    protocolHandler = self->_protocolHandler;
    uint64_t v10 = (void *)[(NSMutableDictionary *)self->_sessionIDToStreamContext copy];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke;
    v14[3] = &unk_1E5ACAEA0;
    long long v15 = v8;
    id v16 = self;
    v11 = v8;
    [(ICDelegationProviderServiceProtocolHandler *)protocolHandler getFinishDelegationRequestsWithStartDelegationResponse:v7 streamContexts:v10 replyHandler:v14];

    id v12 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_3;
    block[3] = &unk_1E5ACD750;
    void block[4] = self;
    dispatch_group_notify(v11, v12, block);
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    [(ICDelegationProviderServiceSession *)self _finishWithError:v11];
    id v7 = 0;
  }
}

void __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v8 = a2;
  id v9 = a3;
  if (v8)
  {
    uint64_t v10 = objc_alloc_init(ICPBDGSRequest);
    v11 = v10;
    if (v10) {
      objc_storeStrong((id *)&v10->_finishDelegationRequest, a2);
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v12 = *(void **)(*(void *)(a1 + 40) + 24);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_2;
    v13[3] = &unk_1E5ACAE78;
    id v14 = *(id *)(a1 + 32);
    [v12 sendRequest:v11 withResponseHandler:v13];
  }
  if (a4) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_4;
  block[3] = &unk_1E5ACD750;
  void block[4] = v1;
  dispatch_barrier_async(v2, block);
}

uint64_t __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithError:0];
}

void __69__ICDelegationProviderServiceSession__handleStartDelegationResponse___block_invoke_2(uint64_t a1)
{
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ICDelegationProviderServiceSession_stop__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __42__ICDelegationProviderServiceSession_stop__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = 4;
  return result;
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting session...", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICDelegationProviderServiceSession_start__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __43__ICDelegationProviderServiceSession_start__block_invoke(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 56))
  {
    uint64_t v2 = result;
    *(void *)(v1 + 56) = 1;
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolving streams...", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(v2 + 32);
    id v6 = *(void **)(v5 + 72);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_3;
    v7[3] = &unk_1E5ACAE50;
    v7[4] = v5;
    return [v6 getResolvedStreamsWithCompletionHandler:v7];
  }
  return result;
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_2;
  v15[3] = &unk_1E5ACD640;
  v15[4] = v10;
  id v16 = v9;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  dispatch_barrier_async(v11, v15);
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 56) == 1)
  {
    uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v3;
      __int16 v16 = 2114;
      uint64_t v17 = v4;
      _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished resolving streams with error: %{public}@", buf, 0x16u);
    }

    if (*(void *)(a1 + 48) && *(void *)(a1 + 56))
    {
      *(void *)(*(void *)(a1 + 32) + 56) = 2;
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 72) securityMode];
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 72) deviceName];
      id v7 = (void *)v6;
      if (v6) {
        id v8 = (__CFString *)v6;
      }
      else {
        id v8 = &stru_1EF5F5C40;
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_6;
      v11[3] = &unk_1E5ACB690;
      v11[4] = *(void *)(a1 + 32);
      id v12 = *(id *)(a1 + 48);
      id v13 = *(id *)(a1 + 56);
      +[ICDelegationServiceSecuritySettings getDeviceSenderSettingsForReceiverName:v8 securityMode:v5 completion:v11];
    }
    else
    {
      id v9 = *(void **)(a1 + 32);
      if (*(void *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "_finishWithError:");
      }
      else
      {
        uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7801 userInfo:0];
        [v9 _finishWithError:v10];
      }
    }
  }
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_6(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[ICDelegationServiceConnection alloc] initWithConnectionRole:1 inputStream:a1[5] outputStream:a1[6] securitySettings:v5];
    uint64_t v8 = a1[4];
    id v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;

    objc_msgSend(*(id *)(a1[4] + 24), "setDelegate:");
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Opening connection...", buf, 0xCu);
    }

    uint64_t v12 = a1[4];
    id v13 = *(void **)(v12 + 24);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_8;
    v18[3] = &unk_1E5ACAE28;
    v18[4] = v12;
    [v13 openWithCompletionHandler:v18];
  }
  else
  {
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = a1[4];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to get device sender security settings with error: %{public}@", buf, 0x16u);
    }

    __int16 v16 = (void *)a1[4];
    if (v6)
    {
      [v16 _finishWithError:v6];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7807 userInfo:0];
      [v16 _finishWithError:v17];
    }
  }
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_8(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = @"NO";
    *(_DWORD *)buf = 138543874;
    if (a2) {
      uint64_t v8 = @"YES";
    }
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v8;
    __int16 v19 = 2114;
    id v20 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished opening connection with success: %{public}@ error: %{public}@", buf, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(NSObject **)(v9 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICDelegationProviderServiceSession_start__block_invoke_15;
  block[3] = &unk_1E5ACB070;
  char v14 = a2;
  void block[4] = v9;
  id v13 = v5;
  id v11 = v5;
  dispatch_barrier_async(v10, block);
}

void __43__ICDelegationProviderServiceSession_start__block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[7] == 2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v1[7] = 3;
      uint64_t v2 = *(void **)(a1 + 32);
      [v2 _startDelegation];
    }
    else if (*(void *)(a1 + 40))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      objc_msgSend(v3, "_finishWithError:");
    }
    else
    {
      id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7802 userInfo:0];
      [v1 _finishWithError:v4];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ICDelegationProviderServiceSession_setDelegate___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __50__ICDelegationProviderServiceSession_setDelegate___block_invoke(uint64_t a1)
{
}

- (ICDelegationProviderServiceSessionDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__29888;
  uint64_t v10 = __Block_byref_object_dispose__29889;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__ICDelegationProviderServiceSession_delegate__block_invoke;
  v5[3] = &unk_1E5ACD880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ICDelegationProviderServiceSessionDelegate *)v3;
}

void __46__ICDelegationProviderServiceSession_delegate__block_invoke(uint64_t a1)
{
}

- (void)delegationServiceConnection:(id)a3 didEncouterError:(id)a4
{
  id v5 = a4;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICDelegationProviderServiceSession_delegationServiceConnection_didEncouterError___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(accessQueue, v8);
}

void *__83__ICDelegationProviderServiceSession_delegationServiceConnection_didEncouterError___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[7] == 3) {
    return (void *)[result _finishWithError:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)delegationServiceConnectionDidClose:(id)a3
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ICDelegationProviderServiceSession_delegationServiceConnectionDidClose___block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

void *__74__ICDelegationProviderServiceSession_delegationServiceConnectionDidClose___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[7] == 3) {
    return (void *)[result _finishWithError:0];
  }
  return result;
}

- (ICDelegationProviderServiceSession)initWithUserIdentities:(id)a3 userIdentityStore:(id)a4 requestContext:(id)a5 netService:(id)a6 delegationAccountUUIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ICDelegationProviderServiceSession;
  __int16 v17 = [(ICDelegationProviderServiceSession *)&v29 init];
  if (v17)
  {
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderServiceSession.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationProviderServiceSession.calloutQueue", 0);
    calloutQueue = v17->_calloutQueue;
    v17->_calloutQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [v12 copy];
    userIdentities = v17->_userIdentities;
    v17->_userIdentities = (NSArray *)v22;

    objc_storeStrong((id *)&v17->_userIdentityStore, a4);
    objc_storeStrong((id *)&v17->_netService, a6);
    uint64_t v24 = [v16 copy];
    delegationAccountUUIDs = v17->_delegationAccountUUIDs;
    v17->_delegationAccountUUIDs = (NSArray *)v24;

    objc_storeStrong((id *)&v17->_requestContext, a5);
    v26 = [[ICDelegationProviderServiceProtocolHandler alloc] initWithUserIdentityStore:v13 requestContext:v14];
    protocolHandler = v17->_protocolHandler;
    v17->_protocolHandler = v26;
  }
  return v17;
}

@end