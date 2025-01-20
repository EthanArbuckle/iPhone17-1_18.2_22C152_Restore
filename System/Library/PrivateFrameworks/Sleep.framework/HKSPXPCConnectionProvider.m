@interface HKSPXPCConnectionProvider
+ (HKSPXPCConnectionProvider)providerWithConnectionInfo:(id)a3;
- (BOOL)invalidated;
- (BOOL)isInvalidated;
- (HKSPXPCConnectionInfo)connectionInfo;
- (HKSPXPCConnectionProvider)initWithConnectionInfo:(id)a3;
- (HKSPXPCConnectionProvider)initWithConnectionInfo:(id)a3 connectionProvider:(id)a4 heartbeatListener:(id)a5;
- (HKSPXPCConnectionProviderDelegate)delegate;
- (HKSPXPCHeartbeatListener)heartbeatListener;
- (NSMutableDictionary)pendingMessages;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)connectionProvider;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (os_unfair_lock_s)connectionLock;
- (os_unfair_lock_s)pendingMessagesLock;
- (void)_addPendingMessage:(id)a3;
- (void)_didInterruptConnection;
- (void)_didInvalidateConnection;
- (void)_removePendingMessage:(id)a3;
- (void)_retryPendingMessages;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)listenerDidReceiveHeartbeat:(id)a3;
- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4;
- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4 doSynchronously:(BOOL)a5;
- (void)sendMessage:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKSPXPCConnectionProvider

id __52__HKSPXPCConnectionProvider_initWithConnectionInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29268];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 machServiceName];
  uint64_t v6 = [v3 options];

  v7 = (void *)[v4 initWithMachServiceName:v5 options:v6];
  return v7;
}

- (void)sendMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 options];
  uint64_t v6 = [(HKSPXPCConnectionProvider *)self connection];
  v7 = [v4 errorHandler];
  if (v5) {
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v7];
  }
  else {
  v8 = [v6 remoteObjectProxyWithErrorHandler:v7];
  }

  if (v8)
  {
    if (([v4 options] & 2) != 0) {
      [(HKSPXPCConnectionProvider *)self _addPendingMessage:v4];
    }
    v9 = [v4 block];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__HKSPXPCConnectionProvider_sendMessage___block_invoke;
    v12[3] = &unk_1E5D33270;
    v12[4] = self;
    id v13 = v4;
    ((void (**)(void, void *, void *))v9)[2](v9, v8, v12);
  }
  else
  {
    v10 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2048;
      v17 = self;
      id v11 = v15;
      _os_log_error_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_ERROR, "[%{public}@.%p] remote object is nil", buf, 0x16u);
    }
  }
}

- (NSXPCConnection)connection
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__9;
  v9 = __Block_byref_object_dispose__9;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__HKSPXPCConnectionProvider_connection__block_invoke;
  v4[3] = &unk_1E5D32A68;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPXPCConnectionProvider *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSXPCConnection *)v2;
}

- (void)_withLock:(id)a3
{
  p_connectionLock = &self->_connectionLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_connectionLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_connectionLock);
}

void __39__HKSPXPCConnectionProvider_connection__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_opt_class();
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v21 = v4;
      __int16 v22 = 2048;
      uint64_t v23 = v5;
      id v6 = v4;
      _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] rebuilding connection", buf, 0x16u);
    }
    uint64_t v7 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
    v8 = *(void **)(*(void *)(a1 + 32) + 32);
    *(void *)(*(void *)(a1 + 32) + 32) = v7;

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __39__HKSPXPCConnectionProvider_connection__block_invoke_291;
    v18[3] = &unk_1E5D32D28;
    objc_copyWeak(&v19, (id *)buf);
    [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:v18];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __39__HKSPXPCConnectionProvider_connection__block_invoke_2;
    __int16 v16 = &unk_1E5D32D28;
    objc_copyWeak(&v17, (id *)buf);
    [*(id *)(*(void *)(a1 + 32) + 32) setInvalidationHandler:&v13];
    uint64_t v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "remoteObjectInterface", v13, v14, v15, v16);
    [*(id *)(*(void *)(a1 + 32) + 32) setRemoteObjectInterface:v9];

    id v10 = [*(id *)(*(void *)(a1 + 32) + 40) exportedObject];
    LOBYTE(v9) = v10 == 0;

    if ((v9 & 1) == 0)
    {
      id v11 = [*(id *)(*(void *)(a1 + 32) + 40) exportedObjectInterface];
      [*(id *)(*(void *)(a1 + 32) + 32) setExportedInterface:v11];

      v12 = [*(id *)(*(void *)(a1 + 32) + 40) exportedObject];
      [*(id *)(*(void *)(a1 + 32) + 32) setExportedObject:v12];
    }
    [*(id *)(*(void *)(a1 + 32) + 32) resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __81__HKSPXPCConnectionProvider_performRemoteBlock_withErrorHandler_doSynchronously___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_addPendingMessage:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifier];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKSPXPCConnectionProvider.m", 70, @"Invalid parameter not satisfying: %@", @"message.identifier != nil" object file lineNumber description];
  }
  p_pendingMessagesLock = &self->_pendingMessagesLock;
  os_unfair_lock_lock(&self->_pendingMessagesLock);
  pendingMessages = self->_pendingMessages;
  uint64_t v9 = [v5 identifier];
  [(NSMutableDictionary *)pendingMessages setObject:v5 forKeyedSubscript:v9];

  os_unfair_lock_unlock(p_pendingMessagesLock);
}

- (void)_removePendingMessage:(id)a3
{
  id v5 = a3;
  id v6 = [v5 identifier];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKSPXPCConnectionProvider.m", 77, @"Invalid parameter not satisfying: %@", @"message.identifier != nil" object file lineNumber description];
  }
  p_pendingMessagesLock = &self->_pendingMessagesLock;
  os_unfair_lock_lock(&self->_pendingMessagesLock);
  pendingMessages = self->_pendingMessages;
  uint64_t v9 = [v5 identifier];

  [(NSMutableDictionary *)pendingMessages removeObjectForKey:v9];
  os_unfair_lock_unlock(p_pendingMessagesLock);
}

- (void)setDelegate:(id)a3
{
}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4 doSynchronously:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [HKSPXPCMessage alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__HKSPXPCConnectionProvider_performRemoteBlock_withErrorHandler_doSynchronously___block_invoke;
  v13[3] = &unk_1E5D33F00;
  id v14 = v8;
  id v11 = v8;
  v12 = [(HKSPXPCMessage *)v10 initWithIdentifier:0 block:v13 options:v5 errorHandler:v9];

  [(HKSPXPCConnectionProvider *)self sendMessage:v12];
}

+ (HKSPXPCConnectionProvider)providerWithConnectionInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnectionInfo:v3];

  return (HKSPXPCConnectionProvider *)v4;
}

- (HKSPXPCConnectionProvider)initWithConnectionInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = HKSPStandardHeartbeatListener(v4);
  id v6 = [(HKSPXPCConnectionProvider *)self initWithConnectionInfo:v4 connectionProvider:&__block_literal_global_19 heartbeatListener:v5];

  return v6;
}

- (HKSPXPCConnectionProvider)initWithConnectionInfo:(id)a3 connectionProvider:(id)a4 heartbeatListener:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HKSPXPCConnectionProvider;
  v12 = [(HKSPXPCConnectionProvider *)&v22 init];
  if (v12)
  {
    uint64_t v13 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v14;
      __int16 v25 = 2048;
      v26 = v12;
      __int16 v27 = 2114;
      id v28 = v9;
      id v15 = v14;
      _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing with %{public}@", buf, 0x20u);
    }
    v12->_connectionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_connectionInfo, a3);
    uint64_t v16 = [v10 copy];
    id connectionProvider = v12->_connectionProvider;
    v12->_id connectionProvider = (id)v16;

    objc_storeStrong((id *)&v12->_heartbeatListener, a5);
    v12->_pendingMessagesLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingMessages = v12->_pendingMessages;
    v12->_pendingMessages = v18;

    [(HKSPXPCHeartbeatListener *)v12->_heartbeatListener setHeartbeatDelegate:v12];
    v20 = v12;
  }

  return v12;
}

void __41__HKSPXPCConnectionProvider_sendMessage___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _removePendingMessage:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      int v14 = 138543874;
      id v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v5;
      id v10 = v8;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "[%{public}@.%p] message failed with error %{public}@", (uint8_t *)&v14, 0x20u);
    }
    if (objc_msgSend(v5, "hksp_shouldRetryMessage"))
    {
      uint64_t v7 = HKSPLogForCategory(4uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_opt_class();
        uint64_t v12 = *(void *)(a1 + 32);
        int v14 = 138543618;
        id v15 = v11;
        __int16 v16 = 2048;
        uint64_t v17 = v12;
        id v13 = v11;
        _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@.%p] message should be retried...", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)_retryPendingMessages
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(HKSPXPCConnectionProvider *)self isInvalidated])
  {
    os_unfair_lock_lock(&self->_pendingMessagesLock);
    id v3 = [(NSMutableDictionary *)self->_pendingMessages allValues];
    [(NSMutableDictionary *)self->_pendingMessages removeAllObjects];
    os_unfair_lock_unlock(&self->_pendingMessagesLock);
    if ([v3 count])
    {
      id v4 = HKSPLogForCategory(4uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = objc_opt_class();
        id v6 = v5;
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v5;
        __int16 v24 = 2048;
        __int16 v25 = self;
        __int16 v26 = 2048;
        uint64_t v27 = [v3 count];
        _os_log_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] %ld pending messages to retry", buf, 0x20u);
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      __int16 v16 = v3;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            id v13 = HKSPLogForCategory(4uLL);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v14 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              uint64_t v23 = v14;
              __int16 v24 = 2048;
              __int16 v25 = self;
              __int16 v26 = 2114;
              uint64_t v27 = v12;
              id v15 = v14;
              _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] retrying message %{public}@", buf, 0x20u);
            }
            [(HKSPXPCConnectionProvider *)self sendMessage:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }

      id v3 = v16;
    }
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    uint64_t v9 = self;
    id v4 = v7;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] deallocing...", buf, 0x16u);
  }
  [(HKSPXPCConnectionProvider *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)HKSPXPCConnectionProvider;
  [(HKSPXPCConnectionProvider *)&v5 dealloc];
}

void __39__HKSPXPCConnectionProvider_connection__block_invoke_291(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didInterruptConnection];
}

void __39__HKSPXPCConnectionProvider_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didInvalidateConnection];
}

- (BOOL)isInvalidated
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__HKSPXPCConnectionProvider_isInvalidated__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPXPCConnectionProvider *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__HKSPXPCConnectionProvider_isInvalidated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_didInterruptConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(HKSPXPCConnectionProvider *)self isInvalidated])
  {
    id v3 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v7 = (id)objc_opt_class();
      __int16 v8 = 2048;
      uint64_t v9 = self;
      id v4 = v7;
      _os_log_error_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_ERROR, "[%{public}@.%p] connection interrupted", buf, 0x16u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HKSPXPCConnectionProvider__didInterruptConnection__block_invoke;
    block[3] = &unk_1E5D32170;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__HKSPXPCConnectionProvider__didInterruptConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryPendingMessages];
}

- (void)_didInvalidateConnection
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(HKSPXPCConnectionProvider *)self isInvalidated])
  {
    id v3 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      uint64_t v10 = self;
      id v4 = v8;
      _os_log_error_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_ERROR, "[%{public}@.%p] connection invalidated", buf, 0x16u);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke;
    v6[3] = &unk_1E5D32170;
    v6[4] = self;
    [(HKSPXPCConnectionProvider *)self _withLock:v6];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke_2;
    v5[3] = &unk_1E5D32170;
    v5[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

uint64_t __53__HKSPXPCConnectionProvider__didInvalidateConnection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryPendingMessages];
}

- (void)listenerDidReceiveHeartbeat:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(HKSPXPCConnectionProvider *)self isInvalidated])
  {
    id v4 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = (id)objc_opt_class();
      __int16 v9 = 2048;
      uint64_t v10 = self;
      id v5 = v8;
      _os_log_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] received heartbeat, reconnecting", (uint8_t *)&v7, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reconnect];
  }
}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4
{
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2048;
    uint64_t v11 = self;
    id v4 = v9;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] invalidating...", buf, 0x16u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v6 = [(HKSPXPCConnectionInfo *)self->_connectionInfo lifecycleNotification];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, self);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HKSPXPCConnectionProvider_invalidate__block_invoke;
  v7[3] = &unk_1E5D32170;
  v7[4] = self;
  [(HKSPXPCConnectionProvider *)self _withLock:v7];
}

void __39__HKSPXPCConnectionProvider_invalidate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (NSString)description
{
  return (NSString *)[(HKSPXPCConnectionProvider *)self descriptionWithMultilinePrefix:&stru_1EFE54160];
}

- (id)succinctDescription
{
  uint64_t v2 = [(HKSPXPCConnectionProvider *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HKSPXPCConnectionProvider *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(HKSPXPCConnectionProvider *)self connectionInfo];
  id v6 = (id)[v4 appendObject:v5 withName:@"connectionInfo"];

  return v4;
}

- (HKSPXPCConnectionProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPXPCConnectionProviderDelegate *)WeakRetained;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (HKSPXPCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (HKSPXPCHeartbeatListener)heartbeatListener
{
  return self->_heartbeatListener;
}

- (id)connectionProvider
{
  return self->_connectionProvider;
}

- (os_unfair_lock_s)pendingMessagesLock
{
  return self->_pendingMessagesLock;
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong(&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_heartbeatListener, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end