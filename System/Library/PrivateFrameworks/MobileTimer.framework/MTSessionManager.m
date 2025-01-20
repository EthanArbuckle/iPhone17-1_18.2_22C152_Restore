@interface MTSessionManager
+ (void)warmUp;
- (MTMetrics)metrics;
- (MTSessionManager)init;
- (MTSessionManager)initWithConnectionProvider:(id)a3 metrics:(id)a4;
- (MTSessionManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (MTSessionManager)initWithMetrics:(id)a3;
- (MTSessionManagerExportedObject)exportedObject;
- (MTXPCConnectionProvider)connectionProvider;
- (NSNotificationCenter)notificationCenter;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4;
- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5;
- (void)dealloc;
- (void)endAlertingSession;
- (void)reconnect;
- (void)setExportedObject:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNotificationCenter:(id)a3;
@end

@implementation MTSessionManager

uint64_t __38__MTSessionManager_endAlertingSession__block_invoke(uint64_t a1, void *a2)
{
  return [a2 endAlertingSession];
}

- (MTSessionManager)init
{
  v3 = objc_alloc_init(MTMetrics);
  v4 = [(MTSessionManager *)self initWithMetrics:v3];

  return v4;
}

- (MTSessionManager)initWithMetrics:(id)a3
{
  return (MTSessionManager *)[(MTSessionManager *)self _initWithConnectionProvidingBlock:&__block_literal_global_41 metrics:a3];
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 defaultCenter];
  id v10 = [(MTSessionManager *)self _initWithConnectionProvidingBlock:v8 metrics:v7 notificationCenter:v9];

  return v10;
}

- (id)_initWithConnectionProvidingBlock:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, MTSessionManager *))a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MTSessionManager;
  v11 = [(MTSessionManager *)&v18 init];
  if (v11)
  {
    v12 = MTLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing...", buf, 0xCu);
    }

    objc_storeStrong((id *)&v11->_notificationCenter, a5);
    v13 = [[MTSessionManagerExportedObject alloc] initWithSessionManager:v11];
    exportedObject = v11->_exportedObject;
    v11->_exportedObject = v13;

    objc_storeStrong((id *)&v11->_metrics, a4);
    uint64_t v15 = v8[2](v8, v11);
    connectionProvider = v11->_connectionProvider;
    v11->_connectionProvider = (MTXPCConnectionProvider *)v15;
  }
  return v11;
}

+ (void)warmUp
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a1;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ warming...", (uint8_t *)&v6, 0xCu);
  }

  id v4 = MTSessionServerInterface();
  id v5 = MTSessionClientInterface();
}

id __36__MTSessionManager_initWithMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = MTSessionServerInterface();
  id v4 = [v2 exportedObject];
  id v5 = MTSessionClientInterface();
  int v6 = +[MTXPCConnectionInfo infoForMachServiceName:@"com.apple.MobileTimer.sessionserver" remoteObjectInterface:v3 exportedObject:v4 exportedObjectInterface:v5 lifecycleNotification:@"com.apple.MTSessionServer.wakeup" requiredEntitlement:0 options:4096];

  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__MTSessionManager_initWithMetrics___block_invoke_2;
  v9[3] = &unk_1E5915428;
  objc_copyWeak(&v10, &location);
  id v7 = +[MTXPCConnectionProvider providerWithConnectionInfo:v6 reconnectHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (MTSessionManagerExportedObject)exportedObject
{
  return self->_exportedObject;
}

- (void)endAlertingSession
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ending alerting session", buf, 0xCu);
  }

  id v4 = [(MTSessionManager *)self connectionProvider];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MTSessionManager_endAlertingSession__block_invoke_2;
  v5[3] = &unk_1E5915AA8;
  v5[4] = self;
  [v4 performRemoteBlock:&__block_literal_global_16 withErrorHandler:v5];
}

- (MTXPCConnectionProvider)connectionProvider
{
  return self->_connectionProvider;
}

void __36__MTSessionManager_initWithMetrics___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

- (MTSessionManager)initWithConnectionProvider:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__MTSessionManager_initWithConnectionProvider_metrics___block_invoke;
  v10[3] = &unk_1E5917E08;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(MTSessionManager *)self _initWithConnectionProvidingBlock:v10 metrics:a4];

  return v8;
}

id __55__MTSessionManager_initWithConnectionProvider_metrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MTSessionManager)initWithConnectionProvider:(id)a3 metrics:(id)a4 notificationCenter:(id)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__MTSessionManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke;
  v12[3] = &unk_1E5917E08;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(MTSessionManager *)self _initWithConnectionProvidingBlock:v12 metrics:a4 notificationCenter:a5];

  return v10;
}

id __74__MTSessionManager_initWithConnectionProvider_metrics_notificationCenter___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  [(MTXPCConnectionProvider *)self->_connectionProvider invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MTSessionManager;
  [(MTSessionManager *)&v4 dealloc];
}

- (void)reconnect
{
  id v2 = [(MTSessionManager *)self connectionProvider];
  [v2 performRemoteBlock:&__block_literal_global_14_1 withErrorHandler:0];
}

uint64_t __29__MTSessionManager_reconnect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 checkIn];
}

void __38__MTSessionManager_endAlertingSession__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__MTSessionManager_endAlertingSession__block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (void)setExportedObject:(id)a3
{
}

- (MTMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_exportedObject, 0);
}

void __38__MTSessionManager_endAlertingSession__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ ending alerting session failed with error %{public}@", (uint8_t *)&v4, 0x16u);
}

@end