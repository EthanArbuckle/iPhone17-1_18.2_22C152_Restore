@interface STDynamicAttributionXPCServerHandle
+ (id)sharedMachServiceServerHandle;
- (STDynamicAttributionXPCServerHandle)init;
- (STDynamicAttributionXPCServerHandle)initWithXPCConnectionProvider:(id)a3;
- (void)_lock_remoteProxy;
- (void)currentAttributionsDidChange:(id)a3;
- (void)dealloc;
- (void)didObserveServerLaunch:(id)a3;
- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5;
- (void)subscribeToUpdates:(id)a3;
- (void)unsubscribeFromUpdates:(id)a3;
@end

@implementation STDynamicAttributionXPCServerHandle

+ (id)sharedMachServiceServerHandle
{
  if (qword_1EB5A35E8 != -1) {
    dispatch_once(&qword_1EB5A35E8, &__block_literal_global_16);
  }
  v2 = (void *)_MergedGlobals_15;

  return v2;
}

uint64_t __68__STDynamicAttributionXPCServerHandle_sharedMachServiceServerHandle__block_invoke()
{
  v0 = objc_alloc_init(STDynamicAttributionXPCServerHandle);
  uint64_t v1 = _MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (STDynamicAttributionXPCServerHandle)init
{
  return [(STDynamicAttributionXPCServerHandle *)self initWithXPCConnectionProvider:&__block_literal_global_3_1];
}

id __43__STDynamicAttributionXPCServerHandle_init__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.systemstatus.activityattribution" options:0];

  return v0;
}

- (STDynamicAttributionXPCServerHandle)initWithXPCConnectionProvider:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STDynamicAttributionXPCServerHandle;
  v5 = [(STDynamicAttributionXPCServerHandle *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    lock_clients = v6->_lock_clients;
    v6->_lock_clients = v7;

    uint64_t v9 = [v4 copy];
    id lock_connectionProvider = v6->_lock_connectionProvider;
    v6->_id lock_connectionProvider = (id)v9;

    uint64_t v11 = +[STServerLaunchMonitor sharedInstance];
    serverLaunchObservable = v6->_serverLaunchObservable;
    v6->_serverLaunchObservable = (STServerLaunchObservable *)v11;

    [(STServerLaunchObservable *)v6->_serverLaunchObservable addObserver:v6];
  }

  return v6;
}

- (void)dealloc
{
  [(STServerLaunchObservable *)self->_serverLaunchObservable removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)STDynamicAttributionXPCServerHandle;
  [(STDynamicAttributionXPCServerHandle *)&v3 dealloc];
}

- (void)_lock_remoteProxy
{
  if (a1)
  {
    uint64_t v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      uint64_t v3 = (*(void (**)(void))(v1[3] + 16))();
      id v4 = (void *)v1[2];
      v1[2] = v3;

      v5 = (void *)v1[2];
      v6 = STDynamicAttributionXPCServerInterface();
      [v5 setRemoteObjectInterface:v6];

      v7 = (void *)v1[2];
      v8 = STDynamicAttributionXPCClientInterface();
      [v7 setExportedInterface:v8];

      [(id)v1[2] setExportedObject:v1];
      objc_initWeak(&location, v1);
      uint64_t v9 = (void *)v1[2];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke;
      v14[3] = &unk_1E6B630F8;
      objc_copyWeak(&v15, &location);
      [v9 setInterruptionHandler:v14];
      v10 = (void *)v1[2];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke_9;
      v12[3] = &unk_1E6B630F8;
      objc_copyWeak(&v13, &location);
      [v10 setInvalidationHandler:v12];
      [(id)v1[2] resume];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      v2 = (void *)v1[2];
    }
    a1 = [v2 remoteObjectProxy];
  }

  return a1;
}

void __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1D9514000, v2, OS_LOG_TYPE_DEFAULT, "%@: Connection interrupted", (uint8_t *)&v3, 0xCu);
    }
  }
}

void __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke_9(uint64_t a1)
{
  v2 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1D9514000, v2, OS_LOG_TYPE_ERROR, "STDynamicAttributionXPCServerHandle connection was invalidated", v6, 2u);
  }

  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    uint64_t v5 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(void *)&v4[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v4 + 2);
  }
}

- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = NSStringFromSelector(a2);
    id v13 = (objc_class *)objc_opt_class();
    objc_super v14 = NSStringFromClass(v13);
    int v15 = 138413314;
    v16 = v12;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2112;
    v22 = @"STDynamicAttributionXPCServerHandle.m";
    __int16 v23 = 1024;
    int v24 = 114;
    _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v15, 0x30u);
  }
  __break(0);
}

- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138413314;
    objc_super v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2112;
    v20 = @"STDynamicAttributionXPCServerHandle.m";
    __int16 v21 = 1024;
    int v22 = 118;
    _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v13, 0x30u);
  }
  __break(0);
}

- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138413314;
    objc_super v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2112;
    v20 = @"STDynamicAttributionXPCServerHandle.m";
    __int16 v21 = 1024;
    int v22 = 122;
    _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v13, 0x30u);
  }
  __break(0);
}

- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138413314;
    objc_super v14 = v10;
    __int16 v15 = 2112;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2112;
    v20 = @"STDynamicAttributionXPCServerHandle.m";
    __int16 v21 = 1024;
    int v22 = 126;
    _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v13, 0x30u);
  }
  __break(0);
}

- (void)subscribeToUpdates:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"client != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      int v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      __int16 v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      __int16 v18 = 2048;
      __int16 v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = @"STDynamicAttributionXPCServerHandle.m";
      __int16 v22 = 1024;
      int v23 = 130;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D9553078);
  }
  v6 = v5;
  v7 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v15 = v6;
    _os_log_impl(&dword_1D9514000, v7, OS_LOG_TYPE_DEFAULT, "%@: Activating", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableSet *)self->_lock_clients count])
  {
    id v8 = 0;
  }
  else
  {
    id v8 = -[STDynamicAttributionXPCServerHandle _lock_remoteProxy](self);
    id v9 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9514000, v9, OS_LOG_TYPE_DEFAULT, "Initiating XPC connection for initial client", buf, 2u);
    }
  }
  [(NSMutableSet *)self->_lock_clients addObject:v6];
  os_unfair_lock_unlock(&self->_lock);
  if (v8) {
    [v8 subscribeToUpdates];
  }
}

- (void)unsubscribeFromUpdates:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"client != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      int v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      __int16 v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      __int16 v18 = 2048;
      __int16 v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = @"STDynamicAttributionXPCServerHandle.m";
      __int16 v22 = 1024;
      int v23 = 148;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_1D9514000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D95532B4);
  }
  v6 = v5;
  v7 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v15 = v6;
    _os_log_impl(&dword_1D9514000, v7, OS_LOG_TYPE_DEFAULT, "%@: Deactivating", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_lock_clients removeObject:v6];
  if (![(NSMutableSet *)self->_lock_clients count])
  {
    id v8 = STSystemStatusLogDynamicAttribution();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9514000, v8, OS_LOG_TYPE_DEFAULT, "Tearing down XPC connection after last client", buf, 2u);
    }

    [(NSXPCConnection *)self->_lock_connection invalidate];
    lock_connection = self->_lock_connection;
    self->_lock_connection = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)currentAttributionsDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)[(NSMutableSet *)self->_lock_clients copy];
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "currentAttributionsDidChange:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)didObserveServerLaunch:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = STSystemStatusLogDynamicAttribution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = self;
    _os_log_impl(&dword_1D9514000, v4, OS_LOG_TYPE_DEFAULT, "%@: Observed server launch, resubscribing to updates if necessary", buf, 0xCu);
  }

  if (self)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_connection)
    {
      v6 = (void *)[(NSMutableSet *)self->_lock_clients copy];
      id v7 = -[STDynamicAttributionXPCServerHandle _lock_remoteProxy](self);
    }
    else
    {
      id v7 = 0;
      v6 = 0;
    }
    os_unfair_lock_unlock(p_lock);
    if ([v6 count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:buf count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        uint64_t v12 = MEMORY[0x1E4F1CBF0];
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "currentAttributionsDidChange:", v12, (void)v14);
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:buf count:16];
        }
        while (v10);
      }

      [v7 subscribeToUpdates];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong((id *)&self->_lock_clients, 0);
  objc_storeStrong(&self->_lock_connectionProvider, 0);

  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end