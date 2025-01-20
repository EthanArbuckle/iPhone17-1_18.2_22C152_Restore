@interface SLDServiceProxy
+ (id)proxyForServiceClass:(Class)a3 targetSerialQueue:(id)a4 delegate:(id)a5;
- (BOOL)connectionActive;
- (BOOL)shouldAutoReconnect;
- (BOOL)waitingForConnection;
- (Class)serviceClass;
- (NSXPCConnection)conn;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)propertyConcurrentQueue;
- (SLDActiveCallService)activeCallService;
- (SLDCollaborationAttributionViewService)collaborationAttributionViewService;
- (SLDServiceProxy)initWithServiceClass:(Class)a3 targetSerialQueue:(id)a4 delegate:(id)a5;
- (SLDServiceProxyDelegate)delegate;
- (id)description;
- (id)remoteService;
- (id)synchronousRemoteService;
- (id)synchronousRemoteServiceWithErrorHandler:(id)a3;
- (int)remoteProcessID;
- (unint64_t)connectionRetryCount;
- (void)_atomicConfigureWithNewConnection:(id)a3;
- (void)_connectionInvalidated;
- (void)_establishNewConnection;
- (void)_invalidateAndDestroyConnection;
- (void)_notifyDelegateProxyDidConnect;
- (void)_notifyDelegateProxyDidDisconnect;
- (void)_receivedServiceConnection:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)setConn:(id)a3;
- (void)setConnectionActive:(BOOL)a3;
- (void)setConnectionRetryCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceClass:(Class)a3;
- (void)setShouldAutoReconnect:(BOOL)a3;
- (void)setWaitingForConnection:(BOOL)a3;
@end

@implementation SLDServiceProxy

uint64_t __39__SLDServiceProxy_waitingForConnection__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

void __23__SLDServiceProxy_conn__block_invoke(uint64_t a1)
{
}

- (id)synchronousRemoteService
{
  v3 = [(SLDServiceProxy *)self conn];

  if (v3)
  {
    v4 = [(SLDServiceProxy *)self conn];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SLDServiceProxy_synchronousRemoteService__block_invoke;
    v8[3] = &unk_1E58A8658;
    v8[4] = self;
    v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];
  }
  else
  {
    v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:]();
    }

    v5 = 0;
  }
  return v5;
}

- (NSXPCConnection)conn
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  v3 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__SLDServiceProxy_conn__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSXPCConnection *)v4;
}

- (BOOL)waitingForConnection
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SLDServiceProxy_waitingForConnection__block_invoke;
  v5[3] = &unk_1E58A86A8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)propertyConcurrentQueue
{
  return self->_propertyConcurrentQueue;
}

+ (id)proxyForServiceClass:(Class)a3 targetSerialQueue:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  char v9 = [[SLDServiceProxy alloc] initWithServiceClass:a3 targetSerialQueue:v8 delegate:v7];

  return v9;
}

- (SLDServiceProxy)initWithServiceClass:(Class)a3 targetSerialQueue:(id)a4 delegate:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SLDServiceProxy;
  v10 = [(SLDServiceProxy *)&v21 init];
  v11 = v10;
  if (v10)
  {
    v10->_serviceClass = a3;
    if (v8)
    {
      id v12 = (OS_dispatch_queue *)v8;
      clientQueue = v11->_clientQueue;
      v11->_clientQueue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      clientQueue = v11->_clientQueue;
      v11->_clientQueue = v14;
    }

    objc_storeWeak((id *)&v11->_delegate, v9);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.SocialLayer.SLDServiceCenter.Properties", v16);
    propertyConcurrentQueue = v11->_propertyConcurrentQueue;
    v11->_propertyConcurrentQueue = (OS_dispatch_queue *)v17;

    v11->_connectionRetryCount = 3;
    v19 = SLDaemonLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v11;
      __int16 v24 = 2112;
      Class v25 = a3;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_debug_impl(&dword_19BE17000, v19, OS_LOG_TYPE_DEBUG, "[%@] Initialized SLDServiceProxy with serviceClass: %@, delegate:%@", buf, 0x20u);
    }
  }
  return v11;
}

uint64_t __43__SLDServiceProxy_setWaitingForConnection___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __35__SLDServiceProxy_connectionActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_receivedServiceConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = SLDaemonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(SLDServiceProxy *)self _receivedServiceConnection:v5];
    }

    [(SLDServiceProxy *)self _atomicConfigureWithNewConnection:v4];
    objc_initWeak(&location, self);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __46__SLDServiceProxy__receivedServiceConnection___block_invoke;
    v14 = &unk_1E58A85E0;
    objc_copyWeak(&v15, &location);
    [v4 setInvalidationHandler:&v11];
    objc_msgSend(v4, "resume", v11, v12, v13, v14);
    uint64_t v6 = [(SLDServiceProxy *)self synchronousRemoteService];
    id v7 = [(objc_class *)[(SLDServiceProxy *)self serviceClass] remoteObjectProtocol];
    char v8 = [v6 conformsToProtocol:v7];

    if (v8)
    {
      [(SLDServiceProxy *)self _notifyDelegateProxyDidConnect];
    }
    else
    {
      id v9 = SLDaemonLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [(objc_class *)[(SLDServiceProxy *)self serviceClass] remoteObjectProtocol];
        *(_DWORD *)buf = 138412802;
        v18 = self;
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        v22 = v10;
        _os_log_error_impl(&dword_19BE17000, v9, OS_LOG_TYPE_ERROR, "[%@] The new connection (%@) either didn't yield a remote service, or it didn't conform to the expected remote object protocol:%@. Closing connection.", buf, 0x20u);
      }
      [(SLDServiceProxy *)self _invalidateAndDestroyConnection];
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  if (([*(id *)(a1 + 32) waitingForConnection] & 1) != 0
    || (SLDAllowedServiceClasses(),
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = objc_msgSend(v2, "containsObject:", objc_msgSend(*v1, "serviceClass")),
        v2,
        !v3))
  {
    uint64_t v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_1(v1, v6);
    }
  }
  else
  {
    id v4 = SLDaemonLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_3(v1);
    }

    [*v1 setWaitingForConnection:1];
    v5 = +[SLDServiceCenter sharedCenter];
    uint64_t v6 = objc_msgSend(v5, "connectionForServiceClass:", objc_msgSend(*v1, "serviceClass"));

    if (v6)
    {
LABEL_6:
      [*v1 _receivedServiceConnection:v6];
    }
    else
    {
      unint64_t v8 = 0;
      *(void *)&long long v7 = 138413058;
      long long v15 = v7;
      while (1)
      {
        unint64_t v9 = objc_msgSend(*v1, "connectionRetryCount", v15);
        uint64_t v6 = SLDaemonLogHandle();
        BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
        if (v8 > 0x13 || v8 >= v9) {
          break;
        }
        if (v10)
        {
          id v12 = *v1;
          uint64_t v13 = [*v1 serviceClass];
          uint64_t v14 = [*v1 connectionRetryCount];
          *(_DWORD *)buf = v15;
          id v17 = v12;
          __int16 v18 = 2112;
          uint64_t v19 = v13;
          __int16 v20 = 2048;
          unint64_t v21 = v8;
          __int16 v22 = 2048;
          uint64_t v23 = v14;
          _os_log_error_impl(&dword_19BE17000, v6, OS_LOG_TYPE_ERROR, "[%@] Didn't get a connection for service class '%@'. Attempting to recover with retry number: %lu with max retries: %lu", buf, 0x2Au);
        }

        uint64_t v11 = +[SLDServiceCenter sharedCenter];
        uint64_t v6 = objc_msgSend(v11, "connectionForServiceClass:", objc_msgSend(*v1, "serviceClass"));

        ++v8;
        if (v6) {
          goto LABEL_6;
        }
      }
      if (v10) {
        __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_2();
      }
    }
  }
}

- (Class)serviceClass
{
  return self->_serviceClass;
}

- (void)setWaitingForConnection:(BOOL)a3
{
  v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SLDServiceProxy_setWaitingForConnection___block_invoke;
  v6[3] = &unk_1E58A86D0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

- (void)connect
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "[%@] Client requested service connection.", v2, v3, v4, v5, v6);
}

- (BOOL)connectionActive
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SLDServiceProxy_connectionActive__block_invoke;
  v5[3] = &unk_1E58A86A8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_notifyDelegateProxyDidConnect
{
  uint64_t v3 = [(SLDServiceProxy *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SLDServiceProxy__notifyDelegateProxyDidConnect__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_establishNewConnection
{
  uint64_t v3 = [(SLDServiceProxy *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SLDServiceProxy__establishNewConnection__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)_atomicConfigureWithNewConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SLDServiceProxy__atomicConfigureWithNewConnection___block_invoke;
  v7[3] = &unk_1E58A8680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __53__SLDServiceProxy__atomicConfigureWithNewConnection___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
}

uint64_t __27__SLDServiceProxy_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

void __49__SLDServiceProxy__notifyDelegateProxyDidConnect__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceProxyDidConnect:*(void *)(a1 + 32)];
}

- (SLDServiceProxyDelegate)delegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  uint64_t v3 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__SLDServiceProxy_delegate__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SLDServiceProxyDelegate *)v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<SLDServiceProxy: %p> %@", self, -[SLDServiceProxy serviceClass](self, "serviceClass")];
}

- (void)disconnect
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "[%@] Client requested disconnection.", v2, v3, v4, v5, v6);
}

- (id)synchronousRemoteServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLDServiceProxy *)self conn];

  if (v5)
  {
    uint8_t v6 = [(SLDServiceProxy *)self conn];
    uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:]();
    }

    uint64_t v7 = 0;
  }

  return v7;
}

void __43__SLDServiceProxy_synchronousRemoteService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__SLDServiceProxy_synchronousRemoteService__block_invoke_cold_1(a1);
  }
}

- (id)remoteService
{
  id v3 = [(SLDServiceProxy *)self conn];

  if (v3)
  {
    id v4 = [(SLDServiceProxy *)self conn];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__SLDServiceProxy_remoteService__block_invoke;
    v8[3] = &unk_1E58A8658;
    v8[4] = self;
    uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v8];
  }
  else
  {
    uint8_t v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLDServiceProxy synchronousRemoteServiceWithErrorHandler:]();
    }

    uint64_t v5 = 0;
  }
  return v5;
}

void __32__SLDServiceProxy_remoteService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __32__SLDServiceProxy_remoteService__block_invoke_cold_1(a1);
  }
}

- (int)remoteProcessID
{
  if (![(SLDServiceProxy *)self connectionActive]) {
    return 0;
  }
  id v3 = [(SLDServiceProxy *)self conn];

  if (!v3) {
    return 0;
  }
  id v4 = [(SLDServiceProxy *)self conn];
  int v5 = [v4 processIdentifier];

  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  int v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__SLDServiceProxy_setDelegate___block_invoke;
  v7[3] = &unk_1E58A8680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

id __31__SLDServiceProxy_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)setConnectionActive:(BOOL)a3
{
  int v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SLDServiceProxy_setConnectionActive___block_invoke;
  v6[3] = &unk_1E58A86D0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __39__SLDServiceProxy_setConnectionActive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (unint64_t)connectionRetryCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__SLDServiceProxy_connectionRetryCount__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__SLDServiceProxy_connectionRetryCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setConnectionRetryCount:(unint64_t)a3
{
  int v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SLDServiceProxy_setConnectionRetryCount___block_invoke;
  v6[3] = &unk_1E58A86F8;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_barrier_async(v5, v6);
}

void __43__SLDServiceProxy_setConnectionRetryCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 24) != v2)
  {
    if (v2 >= 0x14) {
      unint64_t v2 = 20;
    }
    *(void *)(v1 + 24) = v2;
    id v3 = SLDaemonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43__SLDServiceProxy_setConnectionRetryCount___block_invoke_cold_1();
    }
  }
}

- (void)setConn:(id)a3
{
  id v4 = a3;
  int v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__SLDServiceProxy_setConn___block_invoke;
  v7[3] = &unk_1E58A8680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __27__SLDServiceProxy_setConn___block_invoke(uint64_t a1)
{
}

- (BOOL)shouldAutoReconnect
{
  unint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SLDServiceProxy_shouldAutoReconnect__block_invoke;
  v5[3] = &unk_1E58A86A8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__SLDServiceProxy_shouldAutoReconnect__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 10);
  return result;
}

- (void)setShouldAutoReconnect:(BOOL)a3
{
  int v5 = [(SLDServiceProxy *)self propertyConcurrentQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SLDServiceProxy_setShouldAutoReconnect___block_invoke;
  v6[3] = &unk_1E58A86D0;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_barrier_async(v5, v6);
}

uint64_t __42__SLDServiceProxy_setShouldAutoReconnect___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 10) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_notifyDelegateProxyDidDisconnect
{
  id v3 = [(SLDServiceProxy *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SLDServiceProxy__notifyDelegateProxyDidDisconnect__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(v3, block);
}

void __52__SLDServiceProxy__notifyDelegateProxyDidDisconnect__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceProxyDidDisconnect:*(void *)(a1 + 32)];
}

void __46__SLDServiceProxy__receivedServiceConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_connectionInvalidated
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  uint64_t v5 = [a1 serviceClass];
  uint64_t v6 = [a1 delegate];
  int v7 = 138413058;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  _os_log_debug_impl(&dword_19BE17000, a2, OS_LOG_TYPE_DEBUG, "[%@] Connection: %@ was invalidated for service class: %@, delegate: %@", (uint8_t *)&v7, 0x2Au);
}

- (void)_invalidateAndDestroyConnection
{
  uint64_t v1 = [a1 conn];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "[%@] Explicitly invalidating connection: %@", v4, v5, v6, v7, v8);
}

- (void)dealloc
{
  uint64_t v1 = [a1 conn];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "[%@] Deallocated: %@", v4, v5, v6, v7, v8);
}

void __26__SLDServiceProxy_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 10) = 0;
    [*(id *)(*(void *)(a1 + 32) + 32) setInvalidationHandler:0];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

- (void)setServiceClass:(Class)a3
{
  self->_serviceClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (SLDActiveCallService)activeCallService
{
  uint64_t v2 = [(SLDServiceProxy *)self synchronousRemoteService];
  if ([v2 conformsToProtocol:&unk_1EEC4CB80]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SLDActiveCallService *)v3;
}

- (SLDCollaborationAttributionViewService)collaborationAttributionViewService
{
  uint64_t v2 = [(SLDServiceProxy *)self synchronousRemoteService];
  if ([v2 conformsToProtocol:&unk_1EEC4FB28]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SLDCollaborationAttributionViewService *)v3;
}

- (void)synchronousRemoteServiceWithErrorHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[%@] There is no current XPC connection, so no remote object proxy can be returned.", v2, v3, v4, v5, v6);
}

void __43__SLDServiceProxy_synchronousRemoteService__block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) serviceClass];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_19BE17000, v1, v2, "[%@] Error retrieving a synchronous remote proxy to service with class: %@. Error: [%@]", v3, v4, v5, v6, v7);
}

void __32__SLDServiceProxy_remoteService__block_invoke_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) serviceClass];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7(&dword_19BE17000, v1, v2, "[%@] Error retrieving an async remote proxy to service with class: %@. Error: [%@]", v3, v4, v5, v6, v7);
}

void __43__SLDServiceProxy_setConnectionRetryCount___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEBUG, "[%@] Client requested to set connectionRetryCount=%lu. Sanitized value we set: %lu", v3, 0x20u);
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [*a1 serviceClass];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[%@] Service class: %@ is not explicitly allowed.", v3, 0x16u);
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_19BE17000, v0, OS_LOG_TYPE_ERROR, "[%@] We could not retrieve a connection after attempting %lu times.", v1, 0x16u);
}

void __42__SLDServiceProxy__establishNewConnection__block_invoke_cold_3(id *a1)
{
  [*a1 serviceClass];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v1, v2, "[%@] Establishing a new connection for service class: %@.", v3, v4, v5, v6, v7);
}

- (void)_receivedServiceConnection:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = [a1 serviceClass];
  _os_log_debug_impl(&dword_19BE17000, a3, OS_LOG_TYPE_DEBUG, "[%@] Received subservice connection: %@ for service class: %@", (uint8_t *)&v4, 0x20u);
}

@end