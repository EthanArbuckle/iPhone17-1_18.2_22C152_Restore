@interface HKSPXPCConnectionListener
+ (id)listenerWithConnectionInfo:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HKSPThrottler)logThrottler;
- (HKSPXPCClient)currentClient;
- (HKSPXPCConnectionInfo)connectionInfo;
- (HKSPXPCConnectionListener)initWithConnectionInfo:(id)a3;
- (HKSPXPCConnectionListener)initWithConnectionInfo:(id)a3 connectionListener:(id)a4 heartbeatGenerator:(id)a5;
- (HKSPXPCConnectionListenerDelegate)delegate;
- (HKSPXPCHeartbeatGenerator)heartbeatGenerator;
- (NSArray)connectedClients;
- (NSMutableSet)connectedClientSet;
- (NSString)description;
- (NSXPCListener)connectionListener;
- (id)_clientIdentifierProviderForClientLink:(id)a3;
- (id)_clientWithConnection:(id)a3 clientLink:(id)a4;
- (id)_currentClientForConnection:(id)a3;
- (id)connectedClientsWithPID:(int)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (os_unfair_lock_s)clientLock;
- (void)_didInterruptConnection;
- (void)_didInvalidateConnection:(id)a3;
- (void)_logConnectedClients;
- (void)_withLock:(id)a3;
- (void)addClientConnection:(id)a3 clientLink:(id)a4;
- (void)dealloc;
- (void)performRemoteBlock:(id)a3 onClient:(id)a4;
- (void)performRemoteBlockOnClients:(id)a3;
- (void)performRemoteBlockOnClients:(id)a3 passingTest:(id)a4;
- (void)removeClientConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListening;
@end

@implementation HKSPXPCConnectionListener

uint64_t __68__HKSPXPCConnectionListener__clientIdentifierProviderForClientLink___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

BOOL __57__HKSPXPCConnectionListener__currentClientForConnection___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 connection];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HKSPXPCConnectionInfo *)self->_connectionInfo requiredEntitlement];
  if (!v8) {
    goto LABEL_3;
  }
  v9 = [(HKSPXPCConnectionInfo *)self->_connectionInfo requiredEntitlement];
  v10 = [v7 valueForEntitlement:v9];
  int v11 = [v10 BOOLValue];

  if (!v11)
  {
    v17 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      connectionInfo = self->_connectionInfo;
      id v21 = v19;
      v22 = [(HKSPXPCConnectionInfo *)connectionInfo requiredEntitlement];
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v19;
      __int16 v36 = 2114;
      id v37 = v7;
      __int16 v38 = 2114;
      v39 = v22;
      _os_log_error_impl(&dword_1A7E74000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] connection %{public}@ not entitled (%{public}@)", location, 0x20u);
    }
    BOOL v16 = 0;
  }
  else
  {
LABEL_3:
    v12 = [(HKSPXPCConnectionInfo *)self->_connectionInfo exportedObjectInterface];
    [v7 setExportedInterface:v12];

    v13 = [(HKSPXPCConnectionInfo *)self->_connectionInfo exportedObject];
    [v7 setExportedObject:v13];

    v14 = [(HKSPXPCConnectionInfo *)self->_connectionInfo remoteObjectInterface];
    [v7 setRemoteObjectInterface:v14];

    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v7);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
    v31[3] = &unk_1E5D33BA0;
    objc_copyWeak(&v32, (id *)location);
    objc_copyWeak(&v33, &from);
    v15 = [v7 remoteObjectProxyWithErrorHandler:v31];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
    v28[3] = &unk_1E5D33BC8;
    objc_copyWeak(&v29, (id *)location);
    objc_copyWeak(&v30, &from);
    [v7 setInvalidationHandler:v28];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_281;
    v26 = &unk_1E5D32D28;
    objc_copyWeak(&v27, (id *)location);
    [v7 setInterruptionHandler:&v23];
    -[HKSPXPCConnectionListener addClientConnection:clientLink:](self, "addClientConnection:clientLink:", v7, v15, v23, v24, v25, v26);
    [v7 resume];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
    BOOL v16 = 1;
  }

  return v16;
}

- (void)addClientConnection:(id)a3 clientLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  uint64_t v23 = __Block_byref_object_dispose__7;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __60__HKSPXPCConnectionListener_addClientConnection_clientLink___block_invoke;
  v14 = &unk_1E5D33BF0;
  id v8 = v7;
  v18 = &v19;
  id v15 = v8;
  BOOL v16 = self;
  id v9 = v6;
  id v17 = v9;
  [(HKSPXPCConnectionListener *)self _withLock:&v11];
  [(HKSPThrottler *)self->_logThrottler execute];
  if (v20[5])
  {
    v10 = [(HKSPXPCConnectionListener *)self delegate];
    [v10 connectionListenerDidAddClient:v20[5]];
  }
  _Block_object_dispose(&v19, 8);
}

- (HKSPXPCClient)currentClient
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  v3 = [MEMORY[0x1E4F29268] currentConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HKSPXPCConnectionListener_currentClient__block_invoke;
  v7[3] = &unk_1E5D32148;
  id v9 = &v10;
  v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  [(HKSPXPCConnectionListener *)self _withLock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return (HKSPXPCClient *)v5;
}

- (void)_withLock:(id)a3
{
  p_clientLock = &self->_clientLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_clientLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_clientLock);
}

uint64_t __42__HKSPXPCConnectionListener_currentClient__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _currentClientForConnection:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)_currentClientForConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableSet *)self->_connectedClientSet allObjects];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__HKSPXPCConnectionListener__currentClientForConnection___block_invoke;
    v8[3] = &unk_1E5D33CB0;
    id v9 = v4;
    id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __60__HKSPXPCConnectionListener_addClientConnection_clientLink___block_invoke(uint64_t result)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend(*(id *)(result + 40), "_clientWithConnection:clientLink:", *(void *)(result + 48));
    uint64_t v3 = *(void *)(*(void *)(v1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      uint64_t v7 = *(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40);
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      id v8 = v6;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding XPC client: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    return [*(id *)(*(void *)(v1 + 40) + 48) addObject:*(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40)];
  }
  return result;
}

- (HKSPXPCConnectionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPXPCConnectionListenerDelegate *)WeakRetained;
}

- (id)_clientWithConnection:(id)a3 clientLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKSPXPCConnectionListener *)self _clientIdentifierProviderForClientLink:v7];
  int v9 = +[HKSPXPCClient clientForConnection:v6 clientIdentifierProvider:v8 clientLink:v7];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__HKSPXPCConnectionListener__clientWithConnection_clientLink___block_invoke;
  v12[3] = &unk_1E5D33C18;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  id v10 = (id)[v8 addSuccessBlock:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v9;
}

- (id)_clientIdentifierProviderForClientLink:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F7A0D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__HKSPXPCConnectionListener__clientIdentifierProviderForClientLink___block_invoke;
  v8[3] = &unk_1E5D33C40;
  id v6 = v5;
  id v9 = v6;
  [v4 getClientIdentifierWithCompletion:v8];

  return v6;
}

uint64_t __49__HKSPXPCConnectionListener__logConnectedClients__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  return MEMORY[0x1F41817F8]();
}

void __62__HKSPXPCConnectionListener__clientWithConnection_clientLink___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] determined identity of client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __90__HKSPXPCConnectionListener_initWithConnectionInfo_connectionListener_heartbeatGenerator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _logConnectedClients];
}

- (void)_logConnectedClients
{
  *(void *)&v21[13] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7;
  BOOL v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HKSPXPCConnectionListener__logConnectedClients__block_invoke;
  v11[3] = &unk_1E5D320F8;
  v11[4] = self;
  v11[5] = &v12;
  [(HKSPXPCConnectionListener *)self _withLock:v11];
  uint64_t v2 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)objc_opt_class();
    uint64_t v4 = [(id)v13[5] count];
    *(_DWORD *)buf = 138543618;
    id v19 = v3;
    __int16 v20 = 2048;
    *(void *)uint64_t v21 = v4;
    _os_log_impl(&dword_1A7E74000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] current XPC clients: %lu", buf, 0x16u);
  }
  unint64_t v5 = 0;
  *(void *)&long long v6 = 138543874;
  long long v10 = v6;
  while (objc_msgSend((id)v13[5], "count", v10) > v5)
  {
    id v7 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (id)objc_opt_class();
      id v9 = [(id)v13[5] objectAtIndexedSubscript:v5];
      *(_DWORD *)buf = v10;
      id v19 = v8;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = v5;
      v21[2] = 2114;
      *(void *)&v21[3] = v9;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] connected client[%i]: %{public}@", buf, 0x1Cu);
    }
    ++v5;
  }
  _Block_object_dispose(&v12, 8);
}

+ (id)listenerWithConnectionInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnectionInfo:v3];

  return v4;
}

- (HKSPXPCConnectionListener)initWithConnectionInfo:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F29290];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 machServiceName];
  id v8 = (void *)[v6 initWithMachServiceName:v7];
  id v9 = HKSPStandardHeartbeatGenerator(v5);
  long long v10 = [(HKSPXPCConnectionListener *)self initWithConnectionInfo:v5 connectionListener:v8 heartbeatGenerator:v9];

  return v10;
}

- (HKSPXPCConnectionListener)initWithConnectionInfo:(id)a3 connectionListener:(id)a4 heartbeatGenerator:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKSPXPCConnectionListener;
  uint64_t v12 = [(HKSPXPCConnectionListener *)&v25 init];
  if (v12)
  {
    id v13 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v27 = v14;
      __int16 v28 = 2114;
      id v29 = v9;
      id v15 = v14;
      _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing with %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v12->_connectionInfo, a3);
    objc_storeStrong((id *)&v12->_heartbeatGenerator, a5);
    BOOL v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connectedClientSet = v12->_connectedClientSet;
    v12->_connectedClientSet = v16;

    v12->_clientLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_connectionListener, a4);
    [(NSXPCListener *)v12->_connectionListener setDelegate:v12];
    objc_initWeak((id *)buf, v12);
    v18 = [HKSPThrottler alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__HKSPXPCConnectionListener_initWithConnectionInfo_connectionListener_heartbeatGenerator___block_invoke;
    v23[3] = &unk_1E5D32D28;
    objc_copyWeak(&v24, (id *)buf);
    uint64_t v19 = [(HKSPThrottler *)v18 initWithInterval:v23 executeBlock:1.0];
    logThrottler = v12->_logThrottler;
    v12->_logThrottler = (HKSPThrottler *)v19;

    uint64_t v21 = v12;
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

  return v12;
}

- (void)startListening
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(NSXPCListener *)self->_connectionListener resume];
  id v3 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sending heartbeat", (uint8_t *)&v5, 0xCu);
  }
  [(HKSPXPCHeartbeatGenerator *)self->_heartbeatGenerator sendHeartbeat];
}

void __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didInvalidateConnection:v2];
}

void __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v7;
    _os_log_error_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] invalidation handler called for connection %{public}@...", (uint8_t *)&v6, 0x16u);
  }
  [WeakRetained _didInvalidateConnection:v3];
}

void __64__HKSPXPCConnectionListener_listener_shouldAcceptNewConnection___block_invoke_281(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didInterruptConnection];
}

- (void)_didInterruptConnection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = objc_opt_class();
    connectionInfo = self->_connectionInfo;
    id v6 = v4;
    id v7 = [(HKSPXPCConnectionInfo *)connectionInfo machServiceName];
    int v8 = 138543618;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_error_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] connection to server via %{public}@ mach port was interrupted.", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_didInvalidateConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_opt_class();
    connectionInfo = self->_connectionInfo;
    id v8 = v6;
    id v9 = [(HKSPXPCConnectionInfo *)connectionInfo machServiceName];
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_error_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] connection to server via %{public}@ mach port was invalidated.", (uint8_t *)&v10, 0x16u);
  }
  [(HKSPXPCConnectionListener *)self removeClientConnection:v4];
}

- (void)removeClientConnection:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__7;
  uint64_t v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HKSPXPCConnectionListener_removeClientConnection___block_invoke;
  v7[3] = &unk_1E5D33C68;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(HKSPXPCConnectionListener *)self _withLock:v7];
  [(HKSPThrottler *)self->_logThrottler execute];
  if (v11[5])
  {
    id v6 = [(HKSPXPCConnectionListener *)self delegate];
    [v6 connectionListenerDidRemoveClient:v11[5]];
  }
  _Block_object_dispose(&v10, 8);
}

void __52__HKSPXPCConnectionListener_removeClientConnection___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = objc_msgSend(*(id *)(a1[4] + 48), "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 connection];
        id v9 = (void *)a1[5];

        if (v8 == v9)
        {
          uint64_t v10 = HKSPLogForCategory(4uLL);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v18 = v11;
            __int16 v19 = 2114;
            __int16 v20 = v7;
            id v12 = v11;
            _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing XPC client: %{public}@", buf, 0x16u);
          }
          [*(id *)(a1[4] + 48) removeObject:v7];
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (NSArray)connectedClients
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__7;
  id v9 = __Block_byref_object_dispose__7;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__HKSPXPCConnectionListener_connectedClients__block_invoke;
  v4[3] = &unk_1E5D320F8;
  v4[4] = self;
  v4[5] = &v5;
  [(HKSPXPCConnectionListener *)self _withLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

uint64_t __45__HKSPXPCConnectionListener_connectedClients__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) allObjects];
  return MEMORY[0x1F41817F8]();
}

- (id)connectedClientsWithPID:(int)a3
{
  uint64_t v4 = [(HKSPXPCConnectionListener *)self connectedClients];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKSPXPCConnectionListener_connectedClientsWithPID___block_invoke;
  v7[3] = &__block_descriptor_36_e23_B16__0__HKSPXPCClient_8l;
  int v8 = a3;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v7);

  return v5;
}

BOOL __53__HKSPXPCConnectionListener_connectedClientsWithPID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 processID] == *(_DWORD *)(a1 + 32);
}

- (void)performRemoteBlockOnClients:(id)a3
{
}

uint64_t __57__HKSPXPCConnectionListener_performRemoteBlockOnClients___block_invoke()
{
  return 1;
}

- (void)performRemoteBlockOnClients:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HKSPXPCConnectionListener *)self connectedClients];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HKSPXPCConnectionListener_performRemoteBlockOnClients_passingTest___block_invoke;
  v11[3] = &unk_1E5D33CF8;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  objc_msgSend(v8, "na_each:", v11);
}

void __69__HKSPXPCConnectionListener_performRemoteBlockOnClients_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [v5 clientLink];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

- (void)performRemoteBlock:(id)a3 onClient:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, NSObject *))a3;
  id v7 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__HKSPXPCConnectionListener_performRemoteBlock_onClient___block_invoke;
  v12[3] = &unk_1E5D32148;
  long long v14 = &v15;
  void v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [(HKSPXPCConnectionListener *)self _withLock:v12];
  if (*((unsigned char *)v16 + 24))
  {
    id v9 = [v8 clientLink];
    v6[2](v6, v9);
  }
  else
  {
    id v9 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = v10;
      __int16 v21 = 2114;
      id v22 = v8;
      id v11 = v10;
      _os_log_error_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] client doesn't exist: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __57__HKSPXPCConnectionListener_performRemoteBlock_onClient___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 48) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_connectionListener setDelegate:0];
  [(NSXPCListener *)self->_connectionListener invalidate];
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)HKSPXPCConnectionListener;
  [(HKSPXPCConnectionListener *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[(HKSPXPCConnectionListener *)self descriptionWithMultilinePrefix:&stru_1EFE54160];
}

- (id)succinctDescription
{
  id v2 = [(HKSPXPCConnectionListener *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(HKSPXPCConnectionListener *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(HKSPXPCConnectionListener *)self connectionInfo];
  id v6 = (id)[v4 appendObject:v5 withName:@"connectionInfo"];

  id v7 = [(HKSPXPCConnectionListener *)self connectedClients];
  [v4 appendArraySection:v7 withName:@"connectedClients" skipIfEmpty:0];

  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (HKSPXPCConnectionInfo)connectionInfo
{
  return self->_connectionInfo;
}

- (HKSPXPCHeartbeatGenerator)heartbeatGenerator
{
  return self->_heartbeatGenerator;
}

- (NSXPCListener)connectionListener
{
  return self->_connectionListener;
}

- (os_unfair_lock_s)clientLock
{
  return self->_clientLock;
}

- (NSMutableSet)connectedClientSet
{
  return self->_connectedClientSet;
}

- (HKSPThrottler)logThrottler
{
  return self->_logThrottler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logThrottler, 0);
  objc_storeStrong((id *)&self->_connectedClientSet, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_heartbeatGenerator, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end