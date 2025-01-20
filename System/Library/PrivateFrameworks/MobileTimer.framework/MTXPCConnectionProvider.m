@interface MTXPCConnectionProvider
+ (MTXPCConnectionProvider)providerWithConnectionInfo:(id)a3 errorHandler:(id)a4;
+ (MTXPCConnectionProvider)providerWithConnectionInfo:(id)a3 reconnectHandler:(id)a4;
- (MTXPCConnectionInfo)info;
- (MTXPCConnectionProvider)initWithConnectionInfo:(id)a3 errorHandler:(id)a4 reconnectHandler:(id)a5;
- (NAScheduler)callbackScheduler;
- (NSDate)lastLifecycleNotification;
- (id)_asyncRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)_connectionRebuildingIfNecessary;
- (id)_remoteObjectProxyWithXPCConnectionProvider:(id)a3 remoteObjectProxyProvider:(id)a4 errorHandler:(id)a5;
- (id)_retryConnection;
- (id)_syncRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)connection;
- (id)description;
- (id)errorHandler;
- (id)reconnectHandler;
- (os_unfair_lock_s)connectionLock;
- (void)_didInterruptConnection;
- (void)_didInvalidateConnection;
- (void)_retryConnectionWithRecover:(BOOL)a3;
- (void)dealloc;
- (void)didReceiveLifecycleNotification;
- (void)invalidate;
- (void)performRemoteBlock:(id)a3;
- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4;
- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4 isSynchronous:(BOOL)a5;
- (void)setCallbackScheduler:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInfo:(id)a3;
- (void)setLastLifecycleNotification:(id)a3;
- (void)setReconnectHandler:(id)a3;
@end

@implementation MTXPCConnectionProvider

void __77__MTXPCConnectionProvider_performRemoteBlock_withErrorHandler_isSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = NAEmptyResult();
  char v4 = [v5 isEqual:v3];

  if ((v4 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTXPCConnectionProvider *)self info];
  v6 = [v5 machServiceName];
  v7 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v6];

  return v7;
}

- (id)_connectionRebuildingIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = MTLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ rebuilding connection", buf, 0xCu);
    }

    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    v6 = [(MTXPCConnectionProvider *)self info];
    v7 = [v6 machServiceName];
    v8 = [(MTXPCConnectionProvider *)self info];
    v9 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", v7, objc_msgSend(v8, "options"));
    v10 = self->_connection;
    self->_connection = v9;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke;
    v21[3] = &unk_1E59150A8;
    v21[4] = self;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke_2;
    v20[3] = &unk_1E59150A8;
    v20[4] = self;
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v20];
    v11 = [(MTXPCConnectionProvider *)self info];
    v12 = [v11 remoteObjectInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v12];

    v13 = [(MTXPCConnectionProvider *)self info];
    v14 = [v13 exportedObject];

    if (v14)
    {
      v15 = [(MTXPCConnectionProvider *)self info];
      v16 = [v15 exportedObjectInterface];
      [(NSXPCConnection *)self->_connection setExportedInterface:v16];

      v17 = [(MTXPCConnectionProvider *)self info];
      v18 = [v17 exportedObject];
      [(NSXPCConnection *)self->_connection setExportedObject:v18];
    }
    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  return connection;
}

- (MTXPCConnectionInfo)info
{
  return self->_info;
}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4 isSynchronous:(BOOL)a5
{
  id v8 = a3;
  if (a5) {
    [(MTXPCConnectionProvider *)self _syncRemoteObjectProxyWithErrorHandler:a4];
  }
  else {
  v9 = [(MTXPCConnectionProvider *)self _asyncRemoteObjectProxyWithErrorHandler:a4];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__MTXPCConnectionProvider_performRemoteBlock_withErrorHandler_isSynchronous___block_invoke;
  v12[3] = &unk_1E5915678;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v9 addSuccessBlock:v12];
}

- (id)_asyncRemoteObjectProxyWithErrorHandler:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__MTXPCConnectionProvider__asyncRemoteObjectProxyWithErrorHandler___block_invoke;
  v5[3] = &unk_1E59156A0;
  v5[4] = self;
  v3 = [(MTXPCConnectionProvider *)self _remoteObjectProxyWithXPCConnectionProvider:v5 remoteObjectProxyProvider:&__block_literal_global_10 errorHandler:a3];
  return v3;
}

- (id)_remoteObjectProxyWithXPCConnectionProvider:(id)a3 remoteObjectProxyProvider:(id)a4 errorHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (*((void (**)(id))a3 + 2))(a3);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke;
  v15[3] = &unk_1E5915710;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = [v10 flatMap:v15];

  return v13;
}

id __67__MTXPCConnectionProvider__asyncRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F7A0D8];
  v2 = [*(id *)(a1 + 32) connection];
  v3 = [v1 futureWithResult:v2];

  return v3;
}

id __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = MTLogForCategory(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_2();
    }

    goto LABEL_11;
  }
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2;
  id v16 = &unk_1E59156E8;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = a1 + 32;
  uint64_t v17 = v5;
  id v18 = *(id *)(v4 + 8);
  v6 = (void *)MEMORY[0x19F3A0FB0](&v13);
  id v9 = (*(void (**)(void, id, void *, uint64_t, uint64_t))(*(void *)(v4 + 16) + 16))(*(void *)(v4 + 16), v3, v6, v7, v8);
  if (v9)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", v9, v13, v14, v15, v16, v17);
  }
  else
  {
    id v11 = MTLogForCategory(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_1();
    }
  }
  if (!v9)
  {
LABEL_11:
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithNoResult", v13, v14, v15, v16, v17);
  }

  return (id)v4;
}

uint64_t __67__MTXPCConnectionProvider__asyncRemoteObjectProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:");
}

- (id)connection
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  uint64_t v4 = [(MTXPCConnectionProvider *)self _connectionRebuildingIfNecessary];
  os_unfair_lock_unlock(p_connectionLock);
  return v4;
}

+ (MTXPCConnectionProvider)providerWithConnectionInfo:(id)a3 reconnectHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnectionInfo:v6 errorHandler:0 reconnectHandler:v5];

  return (MTXPCConnectionProvider *)v7;
}

- (MTXPCConnectionProvider)initWithConnectionInfo:(id)a3 errorHandler:(id)a4 reconnectHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MTXPCConnectionProvider.m" lineNumber:43 description:@"Connection info must be non-nil"];

    v26 = MTLogForCategory(2);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[MTXPCConnectionProvider initWithConnectionInfo:errorHandler:reconnectHandler:](v26);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)MTXPCConnectionProvider;
  uint64_t v13 = [(MTXPCConnectionProvider *)&v27 init];
  if (v13)
  {
    uint64_t v14 = MTLogForCategory(2);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      __int16 v30 = 2114;
      id v31 = v10;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "Initializing %{public}@ with info %{public}@", buf, 0x16u);
    }

    v13->_connectionLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
    callbackScheduler = v13->_callbackScheduler;
    v13->_callbackScheduler = (NAScheduler *)v15;

    objc_storeStrong((id *)&v13->_info, a3);
    uint64_t v17 = [v11 copy];
    id errorHandler = v13->_errorHandler;
    v13->_id errorHandler = (id)v17;

    uint64_t v19 = [v12 copy];
    id reconnectHandler = v13->_reconnectHandler;
    v13->_id reconnectHandler = (id)v19;

    v13->_alive = 1;
    v21 = [v10 lifecycleNotification];

    if (v21)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v23 = [v10 lifecycleNotification];
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)_handleLifeCycleNotification, v23, v13, (CFNotificationSuspensionBehavior)1025);
    }
  }

  return v13;
}

- (void)performRemoteBlock:(id)a3 withErrorHandler:(id)a4
{
}

+ (MTXPCConnectionProvider)providerWithConnectionInfo:(id)a3 errorHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnectionInfo:v6 errorHandler:v5 reconnectHandler:0];

  return (MTXPCConnectionProvider *)v7;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_connectionLock);
  self->_alive = 0;
  os_unfair_lock_unlock(&self->_connectionLock);
  [(MTXPCConnectionProvider *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MTXPCConnectionProvider;
  [(MTXPCConnectionProvider *)&v4 dealloc];
}

uint64_t __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInterruptConnection];
}

uint64_t __59__MTXPCConnectionProvider__connectionRebuildingIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didInvalidateConnection];
}

- (void)_didInterruptConnection
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ connection interrupted", v2, v3, v4, v5, v6);
}

void __50__MTXPCConnectionProvider__didInterruptConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) errorHandler];
  uint64_t v1 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
  v2[2](v2, v1);
}

- (void)_didInvalidateConnection
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ connection invalidated", v2, v3, v4, v5, v6);
}

void __51__MTXPCConnectionProvider__didInvalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) errorHandler];
  uint64_t v1 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:0];
  v2[2](v2, v1);
}

- (void)didReceiveLifecycleNotification
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ received lifecycle darwin notification but does not have a reconnection handler.", v2, v3, v4, v5, v6);
}

void __58__MTXPCConnectionProvider_didReceiveLifecycleNotification__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) reconnectHandler];
  v1[2]();
}

- (id)_retryConnection
{
  uint64_t v3 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__MTXPCConnectionProvider__retryConnection__block_invoke;
  v10[3] = &unk_1E59155D8;
  id v11 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MTXPCConnectionProvider__retryConnection__block_invoke_2;
  v8[3] = &unk_1E5915600;
  v8[4] = self;
  id v4 = v11;
  id v9 = v4;
  [(MTXPCConnectionProvider *)self performRemoteBlock:v10 withErrorHandler:v8];
  uint64_t v5 = v9;
  id v6 = v4;

  return v6;
}

uint64_t __43__MTXPCConnectionProvider__retryConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

void __43__MTXPCConnectionProvider__retryConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__MTXPCConnectionProvider__retryConnection__block_invoke_2_cold_1();
  }

  [*(id *)(a1 + 40) finishWithError:v3];
}

- (void)_retryConnectionWithRecover:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTXPCConnectionProvider *)self _retryConnection];
  id v6 = v5;
  if (v3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke;
    v10[3] = &unk_1E5915628;
    void v10[4] = self;
    uint64_t v7 = [v5 recover:v10];

    id v6 = (void *)v7;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_19;
  v9[3] = &unk_1E5915650;
  v9[4] = self;
  id v8 = (id)[v6 addCompletionBlock:v9];
}

id __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_cold_1();
  }

  BOOL v3 = [*(id *)(a1 + 32) _retryConnection];
  return v3;
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 BOOLValue])
  {
    id v12 = MTLogForCategory(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_19_cold_1();
    }
  }
  else
  {
    uint64_t v7 = MTLogForCategory(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to reconnect.", buf, 0xCu);
    }

    id v9 = [*(id *)(a1 + 32) reconnectHandler];

    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_20;
      v13[3] = &unk_1E59150A8;
      v13[4] = v10;
      [v11 performBlock:v13];
    }
  }
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) reconnectHandler];
  v1[2]();
}

- (void)performRemoteBlock:(id)a3
{
}

- (id)_syncRemoteObjectProxyWithErrorHandler:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__MTXPCConnectionProvider__syncRemoteObjectProxyWithErrorHandler___block_invoke;
  v5[3] = &unk_1E59156A0;
  v5[4] = self;
  BOOL v3 = [(MTXPCConnectionProvider *)self _remoteObjectProxyWithXPCConnectionProvider:v5 remoteObjectProxyProvider:&__block_literal_global_25 errorHandler:a3];
  return v3;
}

id __66__MTXPCConnectionProvider__syncRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  BOOL v3 = [v1 futureWithResult:v2];

  return v3;
}

uint64_t __66__MTXPCConnectionProvider__syncRemoteObjectProxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "synchronousRemoteObjectProxyWithErrorHandler:");
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = MTLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating", (uint8_t *)&v8, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v5 = [(MTXPCConnectionProvider *)self info];
  id v6 = [v5 lifecycleNotification];
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, self);

  os_unfair_lock_lock(&self->_connectionLock);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(&self->_connectionLock);
}

- (void)setInfo:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)reconnectHandler
{
  return self->_reconnectHandler;
}

- (void)setReconnectHandler:(id)a3
{
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (void)setCallbackScheduler:(id)a3
{
}

- (NSDate)lastLifecycleNotification
{
  return self->_lastLifecycleNotification;
}

- (void)setLastLifecycleNotification:(id)a3
{
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLifecycleNotification, 0);
  objc_storeStrong((id *)&self->_callbackScheduler, 0);
  objc_storeStrong(&self->_reconnectHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnectionInfo:(os_log_t)log errorHandler:reconnectHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "Connection info must be non-nil", v1, 2u);
}

void __43__MTXPCConnectionProvider__retryConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "Failed to reconnect for provider %{public}@ with error %{public}@.");
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ retrying failed reconnect", v2, v3, v4, v5, v6);
}

void __55__MTXPCConnectionProvider__retryConnectionWithRecover___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ failed to reconnect too many times", v2, v3, v4, v5, v6);
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ expected non-nil proxy@", v2, v3, v4, v5, v6);
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19CC95000, v0, v1, "%{public}@ expected non-nil connection", v2, v3, v4, v5, v6);
}

void __110__MTXPCConnectionProvider__remoteObjectProxyWithXPCConnectionProvider_remoteObjectProxyProvider_errorHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ received a remote proxy error: %{public}@");
}

@end