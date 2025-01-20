@interface STDynamicActivityAttributionPublisher
+ (id)sharedInstance;
+ (void)setCurrentAttributionKey:(id)a3 andApp:(id)a4;
+ (void)setCurrentAttributionLocalizableKey:(id)a3 auditToken:(id *)a4;
+ (void)setCurrentAttributionStringWithFormat:(id)a3 auditToken:(id *)a4;
+ (void)setCurrentAttributionWebsiteString:(id)a3 auditToken:(id *)a4;
- (STDynamicActivityAttributionPublisher)init;
- (void)_internalQueue_sendAttributionKey:(void *)a3 andApp:;
- (void)_internalQueue_setupXPCConnectionIfNecessary;
- (void)dealloc;
- (void)didObserveServerLaunch:(id)a3;
@end

@implementation STDynamicActivityAttributionPublisher

+ (id)sharedInstance
{
  self;
  if (qword_1EB5A35A8 != -1) {
    dispatch_once(&qword_1EB5A35A8, &__block_literal_global_11);
  }
  v0 = (void *)_MergedGlobals_11;

  return v0;
}

uint64_t __55__STDynamicActivityAttributionPublisher_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(STDynamicActivityAttributionPublisher);
  uint64_t v1 = _MergedGlobals_11;
  _MergedGlobals_11 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)setCurrentAttributionKey:(id)a3 andApp:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    v7 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 138543618;
      *(void *)&v12[4] = v5;
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = v6;
      _os_log_impl(&dword_1D9514000, v7, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionKey: %{public}@, andApp: %{public}@", v12, 0x16u);
    }
  }
  v8 = +[STDynamicActivityAttributionPublisher sharedInstance]();
  id v9 = v5;
  id v10 = v6;
  if (v8)
  {
    v11 = v8[1];
    *(void *)v12 = MEMORY[0x1E4F143A8];
    *(void *)&v12[8] = 3221225472;
    *(void *)&v12[16] = __78__STDynamicActivityAttributionPublisher_setCurrentAttributionKey_application___block_invoke;
    v13 = &unk_1E6B635E0;
    v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_sync(v11, v12);
  }
}

+ (void)setCurrentAttributionLocalizableKey:(id)a3 auditToken:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    id v6 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = BSPIDForAuditToken();
      _os_log_impl(&dword_1D9514000, v6, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionLocalizableKey: %{public}@, auditToken(pid): %{public}d", buf, 0x12u);
    }
  }
  v7 = +[STDynamicActivityAttributionPublisher sharedInstance]();
  long long v11 = *(_OWORD *)a4->var0;
  long long v12 = *(_OWORD *)&a4->var0[4];
  id v8 = v5;
  id v9 = v8;
  if (v7)
  {
    id v10 = v7[1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __101__STDynamicActivityAttributionPublisher_setCurrentAttributionLocalizableKey_maskingClientAuditToken___block_invoke;
    v14 = &unk_1E6B63BD0;
    id v15 = v7;
    id v16 = v8;
    long long v17 = v11;
    long long v18 = v12;
    dispatch_sync(v10, buf);
  }
}

+ (void)setCurrentAttributionStringWithFormat:(id)a3 auditToken:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    id v6 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = BSPIDForAuditToken();
      _os_log_impl(&dword_1D9514000, v6, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionStringWithFormat: %{public}@, auditToken(pid): %{public}d", buf, 0x12u);
    }
  }
  v7 = +[STDynamicActivityAttributionPublisher sharedInstance]();
  long long v11 = *(_OWORD *)a4->var0;
  long long v12 = *(_OWORD *)&a4->var0[4];
  id v8 = v5;
  id v9 = v8;
  if (v7)
  {
    id v10 = v7[1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __103__STDynamicActivityAttributionPublisher_setCurrentAttributionStringWithFormat_maskingClientAuditToken___block_invoke;
    v14 = &unk_1E6B63BD0;
    id v15 = v7;
    id v16 = v8;
    long long v17 = v11;
    long long v18 = v12;
    dispatch_sync(v10, buf);
  }
}

+ (void)setCurrentAttributionWebsiteString:(id)a3 auditToken:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
  }
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    id v6 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        v7 = @"non-nil";
      }
      else {
        v7 = @"nil";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = BSPIDForAuditToken();
      _os_log_impl(&dword_1D9514000, v6, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionWebsiteString: %{public}@, auditToken(pid): %{public}d", buf, 0x12u);
    }
  }
  id v8 = +[STDynamicActivityAttributionPublisher sharedInstance]();
  long long v12 = *(_OWORD *)a4->var0;
  long long v13 = *(_OWORD *)&a4->var0[4];
  id v9 = v5;
  id v10 = v9;
  if (v8)
  {
    long long v11 = v8[1];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __100__STDynamicActivityAttributionPublisher_setCurrentAttributionWebsiteString_maskingClientAuditToken___block_invoke;
    id v15 = &unk_1E6B63BD0;
    id v16 = v8;
    id v17 = v9;
    long long v18 = v12;
    long long v19 = v13;
    dispatch_sync(v11, buf);
  }
}

- (STDynamicActivityAttributionPublisher)init
{
  v8.receiver = self;
  v8.super_class = (Class)STDynamicActivityAttributionPublisher;
  v2 = [(STDynamicActivityAttributionPublisher *)&v8 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = +[STServerLaunchMonitor sharedInstance];
    serverLaunchObservable = v2->_serverLaunchObservable;
    v2->_serverLaunchObservable = (STServerLaunchObservable *)v5;

    [(STServerLaunchObservable *)v2->_serverLaunchObservable addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v2 = self;
  if (self) {
    self = (STDynamicActivityAttributionPublisher *)self->_serverLaunchObservable;
  }
  [(STDynamicActivityAttributionPublisher *)self removeObserver:v2];
  v3.receiver = v2;
  v3.super_class = (Class)STDynamicActivityAttributionPublisher;
  [(STDynamicActivityAttributionPublisher *)&v3 dealloc];
}

- (void)didObserveServerLaunch:(id)a3
{
  v4 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1D9514000, v4, OS_LOG_TYPE_DEFAULT, "Server launched, attempting to re-send cached attribution values if necessary", (uint8_t *)v6, 2u);
  }

  if (self)
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__STDynamicActivityAttributionPublisher__resendAttributionData__block_invoke;
    v6[3] = &unk_1E6B633E8;
    v6[4] = self;
    dispatch_async(internalQueue, v6);
  }
}

void __78__STDynamicActivityAttributionPublisher_setCurrentAttributionKey_application___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (objc_storeStrong((id *)(v2 + 24), *(id *)(a1 + 40)), (uint64_t v3 = *(void *)(a1 + 32)) != 0))
  {
    objc_storeStrong((id *)(v3 + 32), *(id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);

  -[STDynamicActivityAttributionPublisher _internalQueue_sendAttributionKey:andApp:](v4, v5, v6);
}

- (void)_internalQueue_sendAttributionKey:(void *)a3 andApp:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      v7 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1D9514000, v7, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionKey:andApp:", v9, 2u);
      }
    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](a1);
    objc_super v8 = [*(id *)(a1 + 16) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_17_0];
    [v8 setCurrentAttributionKey:v6 application:v5 reply:&__block_literal_global_21];
  }
}

void __101__STDynamicActivityAttributionPublisher_setCurrentAttributionLocalizableKey_maskingClientAuditToken___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v3;
  if (v2)
  {
    id v4 = v1;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      id v5 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionLocalizableKey:maskingClientAuditToken:", (uint8_t *)v7, 2u);
      }
    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](v2);
    id v6 = [*(id *)(v2 + 16) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_23_0];
    v7[0] = v8;
    v7[1] = v9;
    [v6 setCurrentAttributionLocalizableKey:v4 maskingClientAuditToken:v7 reply:&__block_literal_global_26];
  }
}

void __103__STDynamicActivityAttributionPublisher_setCurrentAttributionStringWithFormat_maskingClientAuditToken___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v3;
  if (v2)
  {
    id v4 = v1;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      id v5 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionStringWithFormat:maskingClientAuditToken:", (uint8_t *)v7, 2u);
      }
    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](v2);
    id v6 = [*(id *)(v2 + 16) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_28];
    v7[0] = v8;
    v7[1] = v9;
    [v6 setCurrentAttributionStringWithFormat:v4 maskingClientAuditToken:v7 reply:&__block_literal_global_31_0];
  }
}

void __100__STDynamicActivityAttributionPublisher_setCurrentAttributionWebsiteString_maskingClientAuditToken___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v3;
  if (v2)
  {
    id v4 = v1;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
    }
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      id v5 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1D9514000, v5, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionWebsiteString:maskingClientAuditToken:", (uint8_t *)v7, 2u);
      }
    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](v2);
    id v6 = [*(id *)(v2 + 16) synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_33];
    v7[0] = v8;
    v7[1] = v9;
    [v6 setCurrentAttributionWebsiteString:v4 maskingClientAuditToken:v7 reply:&__block_literal_global_36];
  }
}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.systemstatus.activityattribution" options:0];
    long long v3 = STDynamicAttributionXPCServerInterface();
    [v2 setRemoteObjectInterface:v3];

    objc_storeStrong((id *)(a1 + 16), v2);
    objc_initWeak(&location, (id)a1);
    [v2 setInterruptionHandler:&__block_literal_global_13];
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    id v6 = __85__STDynamicActivityAttributionPublisher__internalQueue_setupXPCConnectionIfNecessary__block_invoke_14;
    v7 = &unk_1E6B630F8;
    objc_copyWeak(&v8, &location);
    [v2 setInvalidationHandler:&v4];
    objc_msgSend(v2, "resume", v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __85__STDynamicActivityAttributionPublisher__internalQueue_setupXPCConnectionIfNecessary__block_invoke()
{
  v0 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D9514000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __85__STDynamicActivityAttributionPublisher__internalQueue_setupXPCConnectionIfNecessary__block_invoke_14(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v3 = WeakRetained[1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__STDynamicActivityAttributionPublisher__tearDownXPCConnection__block_invoke;
    v5[3] = &unk_1E6B633E8;
    v5[4] = v2;
    dispatch_async(v3, v5);
  }
  uint64_t v4 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_1D9514000, v4, OS_LOG_TYPE_DEFAULT, "InvalidationHandler called, tearing down xpc connection", (uint8_t *)v5, 2u);
  }
}

void __63__STDynamicActivityAttributionPublisher__resendAttributionData__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && *(void *)(v1 + 16))
  {
    uint64_t v2 = *(void **)(v1 + 32);
    id v3 = *(id *)(v1 + 24);
    -[STDynamicActivityAttributionPublisher _internalQueue_sendAttributionKey:andApp:](v1, v3, v2);
  }
}

void __63__STDynamicActivityAttributionPublisher__tearDownXPCConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

void __82__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionKey_andApp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1D9514000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionKey with error %@", (uint8_t *)&v4, 0xCu);
  }
}

void __110__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionLocalizableKey_maskingClientAuditToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1D9514000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionLocalizableKey with error %@", (uint8_t *)&v4, 0xCu);
  }
}

void __112__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionStringWithFormat_maskingClientAuditToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1D9514000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionStringWithFormat with error %@", (uint8_t *)&v4, 0xCu);
  }
}

void __109__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionWebsiteString_maskingClientAuditToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1D9514000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionWebsiteString with error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong((id *)&self->_cachedAppBundleID, 0);
  objc_storeStrong((id *)&self->_cachedLocalizedPlistKey, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end