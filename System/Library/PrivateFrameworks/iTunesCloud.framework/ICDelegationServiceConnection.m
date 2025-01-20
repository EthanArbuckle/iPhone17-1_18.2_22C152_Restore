@interface ICDelegationServiceConnection
- (ICDelegationServiceConnection)initWithConnectionRole:(int64_t)a3 inputStream:(id)a4 outputStream:(id)a5 securitySettings:(id)a6;
- (ICDelegationServiceConnectionDelegate)delegate;
- (ICDelegationServiceSecuritySettings)securitySettings;
- (int64_t)connectionRole;
- (unsigned)_nextRequestUniqueID;
- (void)_finishPendingRequestsWithError:(id)a3;
- (void)_sendMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_sendResponse:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)_streamDidClose;
- (void)_streamDidParseMessage:(id)a3;
- (void)_streamEncounteredError:(id)a3;
- (void)close;
- (void)dealloc;
- (void)delegationServicePairingSession:(id)a3 sendData:(id)a4 withCompletionHandler:(id)a5;
- (void)openWithCompletionHandler:(id)a3;
- (void)parser:(id)a3 didParseMessage:(id)a4;
- (void)sendRequest:(id)a3 withResponseHandler:(id)a4;
- (void)sendResponse:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ICDelegationServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securitySettings, 0);
  objc_storeStrong((id *)&self->_streamWriterQueue, 0);
  objc_storeStrong((id *)&self->_streamWriter, 0);
  objc_storeStrong((id *)&self->_streamReaderQueue, 0);
  objc_storeStrong((id *)&self->_streamReader, 0);
  objc_storeStrong((id *)&self->_pendingRequestIDToRequestContext, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_messageParser, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (ICDelegationServiceSecuritySettings)securitySettings
{
  return self->_securitySettings;
}

- (int64_t)connectionRole
{
  return self->_connectionRole;
}

- (void)_streamEncounteredError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Stream encountered error %{public}@", buf, 0x16u);
  }

  if (self->_isStarted)
  {
    self->_isStarted = 0;
    [(MSVStreamWriter *)self->_streamWriter stop];
    [(MSVStreamReader *)self->_streamReader stop];
    if (v4)
    {
      [(ICDelegationServiceConnection *)self _finishPendingRequestsWithError:v4];
    }
    else
    {
      v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7803 userInfo:0];
      [(ICDelegationServiceConnection *)self _finishPendingRequestsWithError:v6];
    }
    v7 = self->_delegate;
    if (objc_opt_respondsToSelector())
    {
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__ICDelegationServiceConnection__streamEncounteredError___block_invoke;
      block[3] = &unk_1E5ACD5C8;
      v10 = v7;
      v11 = self;
      id v12 = v4;
      dispatch_async(calloutQueue, block);
    }
  }
}

uint64_t __57__ICDelegationServiceConnection__streamEncounteredError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegationServiceConnection:*(void *)(a1 + 40) didEncouterError:*(void *)(a1 + 48)];
}

- (void)_finishPendingRequestsWithError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(v4, "msv_description");
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Finished pending requests error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished pending requests", buf, 0xCu);
  }

  v8 = [(NSMutableDictionary *)self->_pendingRequestIDToRequestContext objectEnumerator];
  v9 = [v8 allObjects];

  pendingRequestIDToRequestContext = self->_pendingRequestIDToRequestContext;
  self->_pendingRequestIDToRequestContext = 0;

  calloutQueue = self->_calloutQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ICDelegationServiceConnection__finishPendingRequestsWithError___block_invoke;
  v14[3] = &unk_1E5ACD4C8;
  id v15 = v9;
  id v16 = v4;
  id v12 = v4;
  id v13 = v9;
  dispatch_async(calloutQueue, v14);
}

void __65__ICDelegationServiceConnection__finishPendingRequestsWithError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "responseHandler", (void)v9);
        v8 = (void *)v7;
        if (v7) {
          (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, *(void *)(a1 + 40));
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_streamDidParseMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received message: %@", buf, 0x16u);
  }

  if (v4)
  {
    uint64_t v6 = (void *)v4[1];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = self->_delegate;
      if (objc_opt_respondsToSelector())
      {
        calloutQueue = self->_calloutQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke;
        block[3] = &unk_1E5ACD5C8;
        v8 = v8;
        id v16 = v8;
        uint64_t v17 = self;
        uint64_t v7 = v7;
        v18 = v7;
        dispatch_async(calloutQueue, block);

        long long v10 = (ICPBDGSResponse *)v16;
      }
      else
      {
        long long v10 = objc_alloc_init(ICPBDGSResponse);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_32;
        v14[3] = &unk_1E5ACAE28;
        void v14[4] = self;
        [(ICDelegationServiceConnection *)self _sendResponse:v10 forRequest:v7 withCompletionHandler:v14];
      }
LABEL_13:

      goto LABEL_14;
    }
    long long v11 = (void *)v4[2];
    if (v11)
    {
      uint64_t v7 = v11;
      v8 = [NSNumber numberWithUnsignedInt:v7[4]];
      long long v10 = [(NSMutableDictionary *)self->_pendingRequestIDToRequestContext objectForKey:v8];
      if (v10)
      {
        [(NSMutableDictionary *)self->_pendingRequestIDToRequestContext removeObjectForKey:v8];
        uint64_t v12 = [(ICPBDGSResponse *)v10 responseHandler];
        id v13 = (void *)v12;
        if (v12) {
          (*(void (**)(uint64_t, unsigned int *, void))(v12 + 16))(v12, v7, 0);
        }
      }
      goto LABEL_13;
    }
  }
LABEL_14:
}

void __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) delegationServiceConnection:*(void *)(a1 + 40) didReceiveRequest:*(void *)(a1 + 48)] & 1) == 0)
  {
    id v2 = objc_alloc_init(ICPBDGSResponse);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_2;
    v5[3] = &unk_1E5ACAE28;
    v5[4] = v3;
    [v3 _sendResponse:v2 forRequest:v4 withCompletionHandler:v5];
  }
}

void __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_32(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send response message. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __56__ICDelegationServiceConnection__streamDidParseMessage___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to send response message. err=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_streamDidClose
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v21 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Stream did close.", buf, 0xCu);
  }

  if (self->_isStarted)
  {
    self->_isStarted = 0;
    uint64_t v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    streamReaderQueue = self->_streamReaderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke;
    block[3] = &unk_1E5ACD4C8;
    void block[4] = self;
    uint64_t v6 = v4;
    __int16 v19 = v6;
    dispatch_async(streamReaderQueue, block);
    dispatch_group_enter(v6);
    streamWriterQueue = self->_streamWriterQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke_2;
    v16[3] = &unk_1E5ACD4C8;
    v16[4] = self;
    uint64_t v17 = v6;
    int v8 = v6;
    dispatch_async(streamWriterQueue, v16);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7803 userInfo:0];
    [(ICDelegationServiceConnection *)self _finishPendingRequestsWithError:v9];

    __int16 v10 = self->_delegate;
    calloutQueue = self->_calloutQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke_3;
    v13[3] = &unk_1E5ACD4C8;
    uint64_t v14 = v10;
    id v15 = self;
    uint64_t v12 = v10;
    dispatch_group_notify(v8, calloutQueue, v13);
  }
}

void __48__ICDelegationServiceConnection__streamDidClose__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) stop];
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __48__ICDelegationServiceConnection__streamDidClose__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) stop];
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __48__ICDelegationServiceConnection__streamDidClose__block_invoke_3(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__ICDelegationServiceConnection__streamDidClose__block_invoke_4;
    v5[3] = &unk_1E5ACD4C8;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = v3;
    uint64_t v7 = v4;
    dispatch_async(v2, v5);
  }
}

uint64_t __48__ICDelegationServiceConnection__streamDidClose__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) delegationServiceConnectionDidClose:*(void *)(a1 + 40)];
}

- (void)_sendResponse:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  __int16 v10 = v9;
  if (a4)
  {
    int v11 = *((_DWORD *)a4 + 6);
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v11 = 0;
  if (v9)
  {
LABEL_3:
    *((unsigned char *)v9 + 32) |= 1u;
    *((_DWORD *)v9 + 4) = v11;
  }
LABEL_4:
  uint64_t v12 = objc_alloc_init(ICPBDGSMessage);
  id v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_response, a3);
  }

  uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = self;
    __int16 v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending response message: %@", (uint8_t *)&v15, 0x16u);
  }

  [(ICDelegationServiceConnection *)self _sendMessage:v13 withCompletionHandler:v8];
}

- (void)_sendRequest:(id)a3 withResponseHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(ICDelegationServiceConnection *)self _nextRequestUniqueID];
  if (v7)
  {
    v7[28] |= 1u;
    *((_DWORD *)v7 + 6) = v9;
  }
  __int16 v10 = [NSNumber numberWithUnsignedInt:v9];
  if (!self->_pendingRequestIDToRequestContext)
  {
    int v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequestIDToRequestContext = self->_pendingRequestIDToRequestContext;
    self->_pendingRequestIDToRequestContext = v11;
  }
  id v13 = [[_ICDelegationServiceConnectionPendingRequestContext alloc] initWithRequest:v7 responseHandler:v8];
  [(NSMutableDictionary *)self->_pendingRequestIDToRequestContext setObject:v13 forKey:v10];
  uint64_t v14 = objc_alloc_init(ICPBDGSMessage);
  int v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_request, a3);
  }
  id v16 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending request message: %@", buf, 0x16u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke;
  v19[3] = &unk_1E5ACC6E8;
  v19[4] = self;
  id v20 = v10;
  id v21 = v8;
  id v17 = v8;
  id v18 = v10;
  [(ICDelegationServiceConnection *)self _sendMessage:v15 withCompletionHandler:v19];
}

void __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_2;
    v8[3] = &unk_1E5ACD2A0;
    v8[4] = v6;
    id v9 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v10 = v5;
    dispatch_barrier_async(v7, v8);
  }
}

void __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)];

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_3;
    v4[3] = &unk_1E5ACD2F0;
    id v6 = *(id *)(a1 + 56);
    id v5 = *(id *)(a1 + 48);
    dispatch_async(v3, v4);
  }
}

void __66__ICDelegationServiceConnection__sendRequest_withResponseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v4);
  }
}

- (void)_sendMessage:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  pairingSession = self->_pairingSession;
  if (pairingSession)
  {
    id v9 = [v6 data];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E5ACD3D8;
    v12[4] = self;
    id v13 = v7;
    [(ICDelegationServicePairingSession *)pairingSession getEncryptedDataForData:v9 withCompletionHandler:v12];
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v15 = self;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Failing to send message as there is no longer a pairing session", buf, 0xCu);
    }

    if (v7)
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
}

void __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F779A0];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "createHeader:", objc_msgSend(v4, "length"));
  id v6 = objc_opt_new();
  [v6 appendData:v5];
  [v6 appendData:v4];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 96);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5ACD250;
  void block[4] = v7;
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v9 = v6;
  dispatch_async(v8, block);
}

void __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) length];
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Writing data of length: %li", buf, 0x16u);
  }

  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_22;
  v10[3] = &unk_1E5ACCD60;
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 writeData:v6 withCompletion:v10];
}

void __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_22(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2_23;
    block[3] = &unk_1E5ACD008;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __68__ICDelegationServiceConnection__sendMessage_withCompletionHandler___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (unsigned)_nextRequestUniqueID
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_nextRequestID, 1u) + 1;
}

- (void)sendResponse:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__ICDelegationServiceConnection_sendResponse_forRequest_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5ACD2A0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_barrier_async(accessQueue, v15);
}

uint64_t __79__ICDelegationServiceConnection_sendResponse_forRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendResponse:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ICDelegationServiceConnection_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(accessQueue, block);
}

uint64_t __65__ICDelegationServiceConnection_sendRequest_withResponseHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendRequest:*(void *)(a1 + 40) withResponseHandler:*(void *)(a1 + 48)];
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
  if (*(void *)(*(void *)(a1 + 32) + 104) == 2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  uint64_t v3 = [[ICDelegationServicePairingSession alloc] initWithRole:v2 securitySettings:*(void *)(*(void *)(a1 + 32) + 112)];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v3;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "setDelegate:");
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 80);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5ACD4C8;
  void block[4] = v7;
  id v9 = v6;
  id v20 = v9;
  dispatch_async(v8, block);
  dispatch_group_enter(v9);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(NSObject **)(v10 + 96);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_1E5ACD4C8;
  v17[4] = v10;
  id v18 = v9;
  id v12 = v9;
  dispatch_async(v11, v17);
  id v13 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_4;
  v15[3] = &unk_1E5ACD2F0;
  id v14 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v14;
  dispatch_group_notify(v12, v13, v15);
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) start];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) start];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_5;
  v3[3] = &unk_1E5ACD2F0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 33))
  {
    uint64_t v2 = *(void **)(v1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_6;
    v8[3] = &unk_1E5ACCD60;
    v8[4] = v1;
    id v9 = *(id *)(a1 + 40);
    [v2 prepareEncryptedSessionWithCompletionHandler:v8];
    uint64_t v3 = v9;
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    if (!v4) {
      return;
    }
    id v5 = *(NSObject **)(v1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_9;
    block[3] = &unk_1E5ACD170;
    id v7 = v4;
    dispatch_async(v5, block);
    uint64_t v3 = v7;
  }
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = v6[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_7;
    block[3] = &unk_1E5ACD750;
    void block[4] = v6;
    dispatch_barrier_async(v7, block);
  }
  else
  {
    [v6 close];
  }
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_8;
    v10[3] = &unk_1E5ACD008;
    id v12 = v8;
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v9, v10);
  }
}

void __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7100 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_7(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

uint64_t __59__ICDelegationServiceConnection_openWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)close
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__ICDelegationServiceConnection_close__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

void __38__ICDelegationServiceConnection_close__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 33))
  {
    *(unsigned char *)(v1 + 33) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(NSObject **)(v5 + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__ICDelegationServiceConnection_close__block_invoke_2;
    block[3] = &unk_1E5ACD750;
    void block[4] = v5;
    dispatch_async(v6, block);
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 96);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__ICDelegationServiceConnection_close__block_invoke_3;
    v9[3] = &unk_1E5ACD750;
    v9[4] = v7;
    dispatch_async(v8, v9);
  }
}

uint64_t __38__ICDelegationServiceConnection_close__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) stop];
}

uint64_t __38__ICDelegationServiceConnection_close__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) stop];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ICDelegationServiceConnection_setDelegate___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __45__ICDelegationServiceConnection_setDelegate___block_invoke(uint64_t a1)
{
}

- (ICDelegationServiceConnectionDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__19419;
  uint64_t v10 = __Block_byref_object_dispose__19420;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__ICDelegationServiceConnection_delegate__block_invoke;
  v5[3] = &unk_1E5ACD880;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ICDelegationServiceConnectionDelegate *)v3;
}

void __41__ICDelegationServiceConnection_delegate__block_invoke(uint64_t a1)
{
}

- (void)parser:(id)a3 didParseMessage:(id)a4
{
  if (a4)
  {
    pairingSession = self->_pairingSession;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke;
    v5[3] = &unk_1E5AC96D8;
    void v5[4] = self;
    [(ICDelegationServicePairingSession *)pairingSession getDecryptedDataForEncryptedData:a4 withCompletionHandler:v5];
  }
}

void __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ICPBDGSMessage alloc] initWithData:v3];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke_2;
    v7[3] = &unk_1E5ACD4C8;
    v7[4] = v5;
    uint64_t v8 = v4;
    dispatch_barrier_async(v6, v7);
  }
}

uint64_t __56__ICDelegationServiceConnection_parser_didParseMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _streamDidParseMessage:*(void *)(a1 + 40)];
}

- (void)delegationServicePairingSession:(id)a3 sendData:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  streamWriterQueue = self->_streamWriterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5ACD250;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(streamWriterQueue, block);
}

void __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) length];
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Writing data of length: %li", buf, 0x16u);
  }

  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_15;
  v10[3] = &unk_1E5ACCD60;
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 writeData:v6 withCompletion:v10];
}

void __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_15(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5ACD008;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __96__ICDelegationServiceConnection_delegationServicePairingSession_sendData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)dealloc
{
  [(ICDelegationServicePairingSession *)self->_pairingSession setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)ICDelegationServiceConnection;
  [(ICDelegationServiceConnection *)&v3 dealloc];
}

- (ICDelegationServiceConnection)initWithConnectionRole:(int64_t)a3 inputStream:(id)a4 outputStream:(id)a5 securitySettings:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v43.receiver = self;
  v43.super_class = (Class)ICDelegationServiceConnection;
  id v13 = [(ICDelegationServiceConnection *)&v43 init];
  if (v13)
  {
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.calloutQueue", 0);
    calloutQueue = v13->_calloutQueue;
    v13->_calloutQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.streamReaderQueue", 0);
    streamReaderQueue = v13->_streamReaderQueue;
    v13->_streamReaderQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.iTunesCloud.ICDelegationServiceConnection.streamWriterQueue", 0);
    streamWriterQueue = v13->_streamWriterQueue;
    v13->_streamWriterQueue = (OS_dispatch_queue *)v20;

    v13->_connectionRole = a3;
    objc_storeStrong((id *)&v13->_securitySettings, a6);
    objc_initWeak(&location, v13);
    uint64_t v22 = (MSVMessageParser *)objc_alloc_init(MEMORY[0x1E4F779A0]);
    messageParser = v13->_messageParser;
    v13->_messageParser = v22;

    [(MSVMessageParser *)v13->_messageParser setDelegate:v13];
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F77A08]) initWithInputStream:v10 queue:v13->_streamReaderQueue];
    streamReader = v13->_streamReader;
    v13->_streamReader = (MSVStreamReader *)v24;

    uint64_t v26 = v13->_streamReader;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke;
    v40[3] = &unk_1E5ACC760;
    objc_copyWeak(&v41, &location);
    [(MSVStreamReader *)v26 setDidEncounterErrorBlock:v40];
    v27 = v13->_streamReader;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2;
    v38[3] = &unk_1E5AC96B0;
    objc_copyWeak(&v39, &location);
    [(MSVStreamReader *)v27 setDidReadDataBlock:v38];
    v28 = v13->_streamReader;
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2_10;
    v36 = &unk_1E5ACD778;
    objc_copyWeak(&v37, &location);
    [(MSVStreamReader *)v28 setDidFinishReadingBlock:&v33];
    id v29 = objc_alloc(MEMORY[0x1E4F77A10]);
    uint64_t v30 = objc_msgSend(v29, "initWithOutputStream:queue:", v11, v13->_streamWriterQueue, v33, v34, v35, v36);
    streamWriter = v13->_streamWriter;
    v13->_streamWriter = (MSVStreamWriter *)v30;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered error: %{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_5;
    v7[3] = &unk_1E5ACD4C8;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_barrier_async(v6, v7);
  }
}

void __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2048;
    uint64_t v13 = [v3 length];
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Received data of length: %li.", buf, 0x16u);
  }

  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_8;
    v7[3] = &unk_1E5ACD4C8;
    id v8 = WeakRetained;
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

void __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_2_10(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished reading.", buf, 0xCu);
  }

  if (WeakRetained)
  {
    id v3 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_11;
    block[3] = &unk_1E5ACD750;
    id v5 = WeakRetained;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _streamDidClose];
}

uint64_t __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32)) {
    return [*(id *)(v1 + 40) processData:*(void *)(result + 40)];
  }
  if (*(unsigned char *)(v1 + 33)) {
    return [*(id *)(v1 + 56) receievedData:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __98__ICDelegationServiceConnection_initWithConnectionRole_inputStream_outputStream_securitySettings___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _streamEncounteredError:*(void *)(a1 + 40)];
}

@end