@interface ICDelegationConsumerServiceSession
- (BOOL)delegationServiceConnection:(id)a3 didReceiveRequest:(id)a4;
- (ICDelegationConsumerServiceRequest)request;
- (ICDelegationConsumerServiceSession)initWithRequest:(id)a3 responseHandler:(id)a4;
- (id)responseHandler;
- (void)_handleTimeout;
- (void)_stop;
- (void)dealloc;
- (void)delegationConsumerNetService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)delegationServiceConnection:(id)a3 didEncouterError:(id)a4;
- (void)delegationServiceConnectionDidClose:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDelegationConsumerServiceSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_timeoutDispatchSource, 0);
  objc_storeStrong((id *)&self->_sessionIDToRequestInfoMap, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_pendingUserIdentities, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_acceptedConnections, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (ICDelegationConsumerServiceRequest)request
{
  return self->_request;
}

- (void)_stop
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  timeoutDispatchSource = self->_timeoutDispatchSource;
  if (timeoutDispatchSource)
  {
    dispatch_source_cancel(timeoutDispatchSource);
    v4 = self->_timeoutDispatchSource;
    self->_timeoutDispatchSource = 0;
  }
  [(ICDelegationConsumerNetService *)self->_netService stop];
  v5 = (void *)[(NSMutableArray *)self->_acceptedConnections copy];
  acceptedConnections = self->_acceptedConnections;
  self->_acceptedConnections = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setDelegate:", 0, (void)v13);
        [v12 close];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_handleTimeout
{
  [(ICDelegationConsumerServiceSession *)self _stop];
  v3 = (void *)[(NSMutableArray *)self->_pendingUserIdentities copy];
  pendingUserIdentities = self->_pendingUserIdentities;
  self->_pendingUserIdentities = 0;

  v5 = (void *)MEMORY[0x1A6240BF0](self->_responseHandler);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke;
  v8[3] = &unk_1E5ACB730;
  id v9 = v3;
  uint64_t v10 = self;
  id v11 = v5;
  id v6 = v5;
  id v7 = v3;
  [v7 enumerateObjectsUsingBlock:v8];
}

void __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = [*(id *)(a1 + 32) count] - 1 == a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 40) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke_2;
  v10[3] = &unk_1E5ACCFB8;
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  v10[4] = *(void *)(a1 + 40);
  BOOL v13 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __52__ICDelegationConsumerServiceSession__handleTimeout__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7003 userInfo:0];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, id, void))(v2 + 16))(v2, v4, v3, 0, 0, v5, *(unsigned __int8 *)(a1 + 56));
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ICDelegationConsumerServiceSession_stop__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __42__ICDelegationConsumerServiceSession_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting session", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICDelegationConsumerServiceSession_start__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __43__ICDelegationConsumerServiceSession_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 64))
  {
    uint64_t v3 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;

    [*(id *)(*(void *)(a1 + 32) + 72) timeoutInterval];
    double v8 = v7;
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v8 * 0.01 * 1000000000.0));
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __43__ICDelegationConsumerServiceSession_start__block_invoke_2;
    v22 = &unk_1E5ACD778;
    objc_copyWeak(&v23, &location);
    dispatch_source_set_event_handler(v11, &v19);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 64));
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v12 = *(void **)(v2 + 32);
  if (!v12)
  {
    BOOL v13 = [ICDelegationConsumerNetService alloc];
    long long v14 = [*(id *)(*(void *)(a1 + 32) + 72) userIdentityDelegationAccountUUIDs];
    uint64_t v15 = [(ICDelegationConsumerNetService *)v13 initWithUserIdentityDelegationAccountUUIDs:v14];
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v15;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
    id v12 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  return objc_msgSend(v12, "publish", v19, v20, v21, v22);
}

void __43__ICDelegationConsumerServiceSession_start__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__ICDelegationConsumerServiceSession_start__block_invoke_3;
    block[3] = &unk_1E5ACD750;
    uint64_t v5 = WeakRetained;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __43__ICDelegationConsumerServiceSession_start__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTimeout];
}

- (BOOL)delegationServiceConnection:(id)a3 didReceiveRequest:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping", (uint8_t *)&buf, 0xCu);
  }

  if (v7) {
    id v9 = (void *)*((void *)v7 + 2);
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  objc_initWeak(&location, v6);
  if (v10)
  {
    protocolHandler = self->_protocolHandler;
    id v12 = [(ICDelegationConsumerServiceRequest *)self->_request requestContext];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke;
    v23[3] = &unk_1E5ACB6B8;
    v23[4] = self;
    objc_copyWeak(&v25, &location);
    id v24 = v7;
    [(ICDelegationConsumerServiceProtocolHandler *)protocolHandler getResponseForStartDelegationRequest:v10 requestContext:v12 withCompletionHandler:v23];

    objc_destroyWeak(&v25);
    BOOL v13 = 1;
  }
  else
  {
    if (v7)
    {
      id v14 = *((id *)v7 + 1);
      if (v14)
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__32408;
        v30 = __Block_byref_object_dispose__32409;
        id v31 = 0;
        accessQueue = self->_accessQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_13;
        block[3] = &unk_1E5ACD880;
        void block[4] = self;
        void block[5] = &buf;
        dispatch_sync(accessQueue, block);
        uint64_t v16 = self->_protocolHandler;
        if (*(void *)(*((void *)&buf + 1) + 40)) {
          uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
        }
        else {
          uint64_t v17 = MEMORY[0x1E4F1CC08];
        }
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2_14;
        v19[3] = &unk_1E5ACB708;
        v19[4] = self;
        objc_copyWeak(&v21, &location);
        id v20 = v7;
        [(ICDelegationConsumerServiceProtocolHandler *)v16 getResponseForFinishDelegationRequest:v14 withSessionIDToRequestInfoMap:v17 completionHandler:v19];

        objc_destroyWeak(&v21);
        _Block_object_dispose(&buf, 8);

        BOOL v13 = 1;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
      id v14 = 0;
    }
  }
  objc_destroyWeak(&location);

  return v13;
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if ([v7 count])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 8);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2;
    uint64_t v16 = &unk_1E5ACD4C8;
    uint64_t v17 = v8;
    id v18 = v7;
    dispatch_barrier_async(v9, &v13);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v11 = objc_alloc_init(ICPBDGSResponse);
    id v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_startDelegationResponse, a2);
    }
    objc_msgSend(WeakRetained, "sendResponse:forRequest:withCompletionHandler:", v12, *(void *)(a1 + 40), 0, v13, v14, v15, v16, v17);
  }
}

uint64_t __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2_14(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if ([v7 count])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 8);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_3;
    uint64_t v16 = &unk_1E5ACD4C8;
    uint64_t v17 = v8;
    id v18 = v7;
    dispatch_barrier_async(v9, &v13);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v11 = objc_alloc_init(ICPBDGSResponse);
    id v12 = v11;
    if (v11) {
      objc_storeStrong((id *)&v11->_finishDelegationResponse, a2);
    }
    objc_msgSend(WeakRetained, "sendResponse:forRequest:withCompletionHandler:", v12, *(void *)(a1 + 40), 0, v13, v14, v15, v16, v17);
  }
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1A6240BF0](*(void *)(*(void *)(a1 + 32) + 80));
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_4;
  uint64_t v8 = &unk_1E5ACB6E0;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v4 = v2;
  id v10 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:&v5];
  if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "count", v5, v6, v7, v8, v9)) {
    [*(id *)(a1 + 32) _stop];
  }
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v20 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:v5];
  if (v6)
  {
    id v19 = v5;
    [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:v5];
    id v18 = v6;
    uint64_t v7 = [v6 accountID];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v14 = [v13 DSID];
          uint64_t v15 = [v14 unsignedLongLongValue];

          if (v15 == v7)
          {
            [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v13];
            BOOL v16 = [*(id *)(*(void *)(a1 + 32) + 40) count] == 0;
            uint64_t v17 = *(NSObject **)(*(void *)(a1 + 32) + 24);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_5;
            block[3] = &unk_1E5ACD690;
            id v23 = *(id *)(a1 + 40);
            void block[4] = *(void *)(a1 + 32);
            void block[5] = v13;
            id v22 = v20;
            BOOL v24 = v16;
            dispatch_async(v17, block);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }

    uint64_t v6 = v18;
    id v5 = v19;
  }
}

void __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = [*(id *)(a1 + 48) delegateToken];
  id v5 = [*(id *)(a1 + 48) storefrontIdentifier];
  uint64_t v6 = [*(id *)(a1 + 48) resultError];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, void *, void *, void))(v4 + 16))(v4, v2, v3, v7, v5, v6, *(unsigned __int8 *)(a1 + 64));
}

uint64_t __84__ICDelegationConsumerServiceSession_delegationServiceConnection_didReceiveRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addEntriesFromDictionary:v6];
}

- (void)delegationServiceConnection:(id)a3 didEncouterError:(id)a4
{
  id v5 = a3;
  accessQueue = self->_accessQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICDelegationConsumerServiceSession_delegationServiceConnection_didEncouterError___block_invoke;
  v8[3] = &unk_1E5ACD4C8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(accessQueue, v8);
}

uint64_t __83__ICDelegationConsumerServiceSession_delegationServiceConnection_didEncouterError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)delegationServiceConnectionDidClose:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ICDelegationConsumerServiceSession_delegationServiceConnectionDidClose___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __74__ICDelegationConsumerServiceSession_delegationServiceConnectionDidClose___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)delegationConsumerNetService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  v11[3] = &unk_1E5ACB690;
  id v12 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  id v9 = v8;
  id v10 = v7;
  +[ICDelegationServiceSecuritySettings getDeviceReceiverSettingsWithCompletion:v11];
}

void __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [[ICDelegationServiceConnection alloc] initWithConnectionRole:2 inputStream:a1[4] outputStream:a1[5] securitySettings:v5];
    [(ICDelegationServiceConnection *)v7 setDelegate:a1[6]];
    uint64_t v8 = a1[6];
    id v9 = *(NSObject **)(v8 + 8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2;
    v12[3] = &unk_1E5ACD4C8;
    v12[4] = v8;
    id v13 = v7;
    id v10 = v7;
    dispatch_barrier_async(v9, v12);
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[6];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to get device receiver security settings with error: %{public}@", buf, 0x16u);
    }
  }
}

void __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_3;
  v7[3] = &unk_1E5ACB668;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v8 openWithCompletionHandler:v7];
}

void __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(NSObject **)(v2 + 8);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_4;
    v4[3] = &unk_1E5ACD4C8;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    dispatch_barrier_async(v3, v4);
  }
}

uint64_t __115__ICDelegationConsumerServiceSession_delegationConsumerNetService_didAcceptConnectionWithInputStream_outputStream___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(ICDelegationConsumerServiceSession *)self _stop];
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationConsumerServiceSession;
  [(ICDelegationConsumerServiceSession *)&v3 dealloc];
}

- (ICDelegationConsumerServiceSession)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ICDelegationConsumerServiceSession;
  id v9 = [(ICDelegationConsumerServiceSession *)&v23 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerServiceSession.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v9->_accessQueue;
    v9->_accessQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationConsumerServiceSession.calloutQueue", 0);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v14 = [(ICDelegationConsumerServiceRequest *)v9->_request userIdentityDelegationAccountUUIDs];
    uint64_t v15 = [v14 allKeys];
    uint64_t v16 = [v15 mutableCopy];
    pendingUserIdentities = v9->_pendingUserIdentities;
    v9->_pendingUserIdentities = (NSMutableArray *)v16;

    uint64_t v18 = MEMORY[0x1A6240BF0](v8);
    id responseHandler = v9->_responseHandler;
    v9->_id responseHandler = (id)v18;

    id v20 = objc_alloc_init(ICDelegationConsumerServiceProtocolHandler);
    protocolHandler = v9->_protocolHandler;
    v9->_protocolHandler = v20;
  }
  return v9;
}

@end