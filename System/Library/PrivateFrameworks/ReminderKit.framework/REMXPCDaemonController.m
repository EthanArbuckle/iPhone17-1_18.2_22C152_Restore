@interface REMXPCDaemonController
+ (id)userInteractiveDaemonController;
+ (id)weakSharedInstance;
- (NSMutableDictionary)l_performersByName;
- (NSString)description;
- (NSString)serviceName;
- (NSXPCConnection)xpcConnection;
- (REMStoreContainerToken)storeContainerToken;
- (REMXPCDaemonController)init;
- (REMXPCDaemonController)initWithStoreContainerToken:(id)a3;
- (REMXPCDaemonController)initWithStoreContainerToken:(id)a3 userInteractive:(BOOL)a4;
- (REMXPCDaemonControllerCloudKitNetworkActivityDelegate)cloudKitNetworkActivityDelegate;
- (id)_resolveAndCachePerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5;
- (id)_resolvePerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5;
- (id)_syncPerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5;
- (id)_xpcConnectionReconnectingIfNecessary;
- (id)syncChangeTrackingPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncDebugPerformerWithErrorHandler:(id)a3;
- (id)syncDebugPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncIndexingPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncStorePerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncSyncInterfacePerformerWithReason:(id)a3 errorHandler:(id)a4;
- (os_unfair_lock_s)ivarLock;
- (void)_asyncPerformerWithResolver:(id)a3 reason:(id)a4 loadHandler:(id)a5 errorHandler:(id)a6;
- (void)_asyncResolveAndCachePerformerWithResolver:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_asyncResolvePerformerWithResolver:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)_xpcConnectionDidInvalidate;
- (void)asyncDebugPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)asyncIndexingPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)asyncStorePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)asyncSyncInterfacePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setCloudKitNetworkActivityDelegate:(id)a3;
- (void)setIvarLock:(os_unfair_lock_s)a3;
- (void)setL_performersByName:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setStoreContainerToken:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation REMXPCDaemonController

+ (id)weakSharedInstance
{
  os_unfair_lock_lock((os_unfair_lock_t)&weakSharedInstance_sLock);
  id WeakRetained = objc_loadWeakRetained(&weakSharedInstance__sDaemonController);

  if (WeakRetained)
  {
    v3 = (REMXPCDaemonController *)objc_loadWeakRetained(&weakSharedInstance__sDaemonController);
  }
  else
  {
    v3 = objc_alloc_init(REMXPCDaemonController);
    objc_storeWeak(&weakSharedInstance__sDaemonController, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&weakSharedInstance_sLock);

  return v3;
}

- (REMXPCDaemonController)init
{
  return [(REMXPCDaemonController *)self initWithStoreContainerToken:0 userInteractive:0];
}

+ (id)userInteractiveDaemonController
{
  v2 = (void *)[objc_alloc((Class)a1) initWithStoreContainerToken:0 userInteractive:1];

  return v2;
}

- (id)syncSyncInterfacePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_sync);
  v9 = [(REMXPCDaemonController *)self _syncPerformerWithResolver:v8 reason:v7 errorHandler:v6];

  return v9;
}

- (void)setCloudKitNetworkActivityDelegate:(id)a3
{
  id v4 = a3;
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__REMXPCDaemonController_setCloudKitNetworkActivityDelegate___block_invoke;
  v7[3] = &unk_1E61DCB18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  __61__REMXPCDaemonController_setCloudKitNetworkActivityDelegate___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_ivarLock);
}

void __61__REMXPCDaemonController_setCloudKitNetworkActivityDelegate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  id v3 = [v2 exportedObject];

  if (v3) {
    [v3 setCloudKitNetworkActivityDelegate:*(void *)(a1 + 40)];
  }
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (id)syncStorePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [REMXPCDaemonControllerPerformerResolver_store alloc];
  v9 = [(REMXPCDaemonController *)self storeContainerToken];
  v10 = [(REMXPCDaemonControllerPerformerResolver_store *)v8 initWithStoreContainerToken:v9];
  v11 = [(REMXPCDaemonController *)self _syncPerformerWithResolver:v10 reason:v7 errorHandler:v6];

  return v11;
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

void __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke_22(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[REMLog xpc];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_21_cold_1();
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_DEFAULT, "Resolved performer {name: %{public}@, performer: %@}", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_resolvePerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 name];
  uint64_t v12 = +[REMLog xpc];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_DEFAULT, "Cache-miss getting performer. Resolving sync {name: %{public}@, reason: %{public}@}", buf, 0x16u);
  }

  __int16 v13 = [(REMXPCDaemonController *)self _xpcConnectionReconnectingIfNecessary];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke;
  v25[3] = &unk_1E61DC448;
  id v14 = v11;
  id v26 = v14;
  id v15 = v10;
  id v27 = v15;
  v16 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v25];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__8;
  v30 = __Block_byref_object_dispose__8;
  id v31 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke_22;
  v21[3] = &unk_1E61DD8D8;
  id v17 = v14;
  id v22 = v17;
  v24 = buf;
  id v18 = v15;
  id v23 = v18;
  [v8 resolveWithDaemon:v16 reason:v9 completion:v21];
  id v19 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v19;
}

- (id)_syncPerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [v10 name];
  uint64_t v12 = [(REMXPCDaemonController *)self _resolveAndCachePerformerWithResolver:v10 reason:v9 errorHandler:v8];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke;
  v17[3] = &unk_1E61DC600;
  id v18 = v11;
  id v19 = self;
  id v20 = v8;
  id v13 = v8;
  id v14 = v11;
  id v15 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v17];

  return v15;
}

- (id)_resolveAndCachePerformerWithResolver:(id)a3 reason:(id)a4 errorHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 name];
  uint64_t v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x3032000000;
  v29[2] = __Block_byref_object_copy__8;
  v29[3] = __Block_byref_object_dispose__8;
  id v30 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke;
  v25[3] = &unk_1E61DD838;
  id v27 = &v28;
  void v25[4] = self;
  id v12 = v11;
  id v26 = v12;
  __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke((uint64_t)v25);
  os_unfair_lock_unlock(&self->_ivarLock);

  if (*(void *)(v29[0] + 40))
  {
    id v13 = +[REMLog xpc];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[REMXPCDaemonController _resolveAndCachePerformerWithResolver:reason:errorHandler:]((uint64_t)v12, (uint64_t)v29, v13);
    }

    id v14 = *(id *)(v29[0] + 40);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18;
    v21[3] = &unk_1E61DC600;
    id v15 = v12;
    id v22 = v15;
    id v23 = self;
    id v24 = v10;
    id v14 = [(REMXPCDaemonController *)self _resolvePerformerWithResolver:v8 reason:v9 errorHandler:v21];
    if (v14)
    {
      os_unfair_lock_lock(&self->_ivarLock);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_2;
      v18[3] = &unk_1E61DD860;
      v18[4] = self;
      id v19 = v15;
      id v20 = v14;
      __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_2((uint64_t)v18);
      os_unfair_lock_unlock(&self->_ivarLock);
    }
  }
  id v16 = v14;
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)l_performersByName
{
  return self->_l_performersByName;
}

- (REMXPCDaemonController)initWithStoreContainerToken:(id)a3 userInteractive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)REMXPCDaemonController;
  id v8 = [(REMXPCDaemonController *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_storeContainerToken, a3);
    v9->_ivarLock._os_unfair_lock_opaque = 0;
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    l_performersByName = v9->_l_performersByName;
    v9->_l_performersByName = v10;

    id v12 = REMDaemonMachServiceName;
    if (v4) {
      id v12 = REMDaemonMachServiceName_userInteractive;
    }
    id v13 = *v12;
    id v14 = *v12;
    objc_storeStrong((id *)&v9->_serviceName, v13);
    id v15 = [(REMXPCDaemonController *)v9 _xpcConnectionReconnectingIfNecessary];
  }
  id v16 = +[REMLog xpc];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v9;
    _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_DEFAULT, "Created new REMXPCDaemonController {self: %{public}@}", buf, 0xCu);
  }

  return v9;
}

- (id)_xpcConnectionReconnectingIfNecessary
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke;
  v14[3] = &unk_1E61DC740;
  v14[4] = self;
  __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke((uint64_t)v14);
  os_unfair_lock_unlock(p_ivarLock);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__8;
  id v12 = __Block_byref_object_dispose__8;
  id v13 = 0;
  os_unfair_lock_lock(p_ivarLock);
  uint64_t v4 = [(REMXPCDaemonController *)self xpcConnection];
  id v5 = (void *)v9[5];
  v9[5] = v4;

  os_unfair_lock_unlock(p_ivarLock);
  id v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) xpcConnection];

  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [*(id *)(a1 + 32) serviceName];
    id v5 = (void *)[v3 initWithMachServiceName:v4 options:0];

    id v6 = +[REMXPCDaemonInterface interface];
    [v5 setRemoteObjectInterface:v6];

    id v7 = objc_alloc_init(REMXPCDaemonControllerExportedObject);
    uint64_t v8 = [*(id *)(a1 + 32) cloudKitNetworkActivityDelegate];
    [(REMXPCDaemonControllerExportedObject *)v7 setCloudKitNetworkActivityDelegate:v8];

    [v5 setExportedObject:v7];
    id v9 = +[REMXPCClientInterface interface];
    [v5 setExportedInterface:v9];

    objc_initWeak(&location, *(id *)(a1 + 32));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2;
    v12[3] = &unk_1E61DD420;
    objc_copyWeak(&v13, &location);
    [v5 setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_28;
    v10[3] = &unk_1E61DD420;
    objc_copyWeak(&v11, &location);
    [v5 setInvalidationHandler:v10];
    [v5 resume];
    [*(id *)(a1 + 32) setXpcConnection:v5];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMXPCDaemonController *)self serviceName];
  id v6 = [v3 stringWithFormat:@"<%@: %p serviceName:%@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (REMXPCDaemonControllerCloudKitNetworkActivityDelegate)cloudKitNetworkActivityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitNetworkActivityDelegate);

  return (REMXPCDaemonControllerCloudKitNetworkActivityDelegate *)WeakRetained;
}

- (void)asyncStorePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [REMXPCDaemonControllerPerformerResolver_store alloc];
  id v13 = [(REMXPCDaemonController *)self storeContainerToken];
  id v12 = [(REMXPCDaemonControllerPerformerResolver_store *)v11 initWithStoreContainerToken:v13];
  [(REMXPCDaemonController *)self _asyncPerformerWithResolver:v12 reason:v10 loadHandler:v9 errorHandler:v8];
}

- (void)asyncSyncInterfacePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_sync);
  [(REMXPCDaemonController *)self _asyncPerformerWithResolver:v11 reason:v10 loadHandler:v9 errorHandler:v8];
}

- (void)_asyncPerformerWithResolver:(id)a3 reason:(id)a4 loadHandler:(id)a5 errorHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 name];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke;
  v18[3] = &unk_1E61DD810;
  id v19 = v14;
  id v20 = self;
  id v21 = v11;
  id v22 = v10;
  id v15 = v10;
  id v16 = v11;
  id v17 = v14;
  [(REMXPCDaemonController *)self _asyncResolveAndCachePerformerWithResolver:v13 reason:v12 completion:v18];
}

- (void)_asyncResolveAndCachePerformerWithResolver:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [v8 name];
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  id v26 = 0;
  os_unfair_lock_lock(&self->_ivarLock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke;
  v18[3] = &unk_1E61DD838;
  id v20 = &v21;
  void v18[4] = self;
  id v12 = v11;
  id v19 = v12;
  __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke((uint64_t)v18);
  os_unfair_lock_unlock(&self->_ivarLock);

  if (v22[5])
  {
    id v13 = +[REMLog xpc];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v22[5];
      *(_DWORD *)buf = 138543874;
      id v28 = v12;
      __int16 v29 = 2114;
      id v30 = v9;
      __int16 v31 = 2112;
      uint64_t v32 = v14;
      _os_log_debug_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_DEBUG, "Returning existing performer {name: %{public}@, reason: %{public}@, performer: %@}", buf, 0x20u);
    }

    v10[2](v10, v22[5], 0);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_20;
    v15[3] = &unk_1E61DD888;
    v15[4] = self;
    id v16 = v12;
    id v17 = v10;
    [(REMXPCDaemonController *)self _asyncResolvePerformerWithResolver:v8 reason:v9 completion:v15];
  }
  _Block_object_dispose(&v21, 8);
}

- (void)_asyncResolvePerformerWithResolver:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 name];
  id v12 = +[REMLog xpc];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_DEFAULT, "Cache-miss getting performer. Resolving async {name: %{public}@, reason: %{public}@}", buf, 0x16u);
  }

  id v13 = [(REMXPCDaemonController *)self _xpcConnectionReconnectingIfNecessary];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke;
  v22[3] = &unk_1E61DC448;
  id v14 = v11;
  id v23 = v14;
  id v15 = v9;
  id v24 = v15;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v22];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_21;
  v19[3] = &unk_1E61DD8B0;
  id v20 = v14;
  id v21 = v15;
  id v17 = v15;
  id v18 = v14;
  [v10 resolveWithDaemon:v16 reason:v8 completion:v19];
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLog xpc];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_21_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "Resolve performer {name: %{public}@, performer: %@}", (uint8_t *)&v11, 0x16u);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_20(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_2;
    v11[3] = &unk_1E61DD860;
    id v7 = (void *)a1[5];
    v11[4] = a1[4];
    id v12 = v7;
    id v13 = v5;
    __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_2((uint64_t)v11);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_3;
    v9[3] = &unk_1E61DCB18;
    id v8 = (void *)a1[5];
    v9[4] = a1[4];
    id v10 = v8;
    __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_3((uint64_t)v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 8));
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_2;
    v8[3] = &unk_1E61DC600;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = v5;
    id v11 = v6;
    id v7 = [v3 remoteObjectProxyWithErrorHandler:v8];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_28_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "XPC connection was invalidated", v1, 2u);
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_28(uint64_t a1)
{
  uint64_t v2 = +[REMLog xpc];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_28_cold_1(v2);
  }

  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [(os_unfair_lock_s *)WeakRetained _xpcConnectionDidInvalidate];
    os_unfair_lock_lock(v4 + 2);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_29;
    v5[3] = &unk_1E61DC740;
    v5[4] = v4;
    __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_29((uint64_t)v5);
    os_unfair_lock_unlock(v4 + 2);
  }
}

- (void)invalidate
{
  id v3 = +[REMLog xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_DEFAULT, "REMXPCDaemonController invalidate", v5, 2u);
  }

  id v4 = [(REMXPCDaemonController *)self xpcConnection];
  [v4 invalidate];
}

- (void)dealloc
{
  [(REMXPCDaemonController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)REMXPCDaemonController;
  [(REMXPCDaemonController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContainerToken, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_l_performersByName, 0);

  objc_destroyWeak((id *)&self->_cloudKitNetworkActivityDelegate);
}

- (REMXPCDaemonController)initWithStoreContainerToken:(id)a3
{
  return [(REMXPCDaemonController *)self initWithStoreContainerToken:a3 userInteractive:0];
}

- (id)syncChangeTrackingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [REMXPCDaemonControllerPerformerResolver_changeTracking alloc];
  id v9 = [(REMXPCDaemonController *)self storeContainerToken];
  uint64_t v10 = [(REMXPCDaemonControllerPerformerResolver_changeTracking *)v8 initWithStoreContainerToken:v9];
  id v11 = [(REMXPCDaemonController *)self _syncPerformerWithResolver:v10 reason:v7 errorHandler:v6];

  return v11;
}

- (void)asyncDebugPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [REMXPCDaemonControllerPerformerResolver_debug alloc];
  id v13 = [(REMXPCDaemonController *)self storeContainerToken];
  id v12 = [(REMXPCDaemonControllerPerformerResolver_debug *)v11 initWithStoreContainerToken:v13];
  [(REMXPCDaemonController *)self _asyncPerformerWithResolver:v12 reason:v10 loadHandler:v9 errorHandler:v8];
}

- (id)syncDebugPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [REMXPCDaemonControllerPerformerResolver_debug alloc];
  id v9 = [(REMXPCDaemonController *)self storeContainerToken];
  id v10 = [(REMXPCDaemonControllerPerformerResolver_debug *)v8 initWithStoreContainerToken:v9];
  id v11 = [(REMXPCDaemonController *)self _syncPerformerWithResolver:v10 reason:v7 errorHandler:v6];

  return v11;
}

- (id)syncDebugPerformerWithErrorHandler:(id)a3
{
  return [(REMXPCDaemonController *)self syncDebugPerformerWithReason:@"eventKitSyncStub" errorHandler:a3];
}

- (id)syncIndexingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_indexing);
  id v9 = [(REMXPCDaemonController *)self _syncPerformerWithResolver:v8 reason:v7 errorHandler:v6];

  return v9;
}

- (void)asyncIndexingPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(REMXPCDaemonControllerPerformerResolver_indexing);
  [(REMXPCDaemonController *)self _asyncPerformerWithResolver:v11 reason:v10 loadHandler:v9 errorHandler:v8];
}

void __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_cold_1();
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 8));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_14;
  v7[3] = &unk_1E61DCB18;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_14((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 8));

  (*(void (**)(void))(a1[3].i64[0] + 16))();
}

void __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_14(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_2(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_cold_1();
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 8));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_16;
  v7[3] = &unk_1E61DCB18;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_16((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 8));

  (*(void (**)(void))(a1[3].i64[0] + 16))();
}

void __86__REMXPCDaemonController__asyncPerformerWithResolver_reason_loadHandler_errorHandler___block_invoke_16(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18(int8x16_t *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18_cold_1();
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 8));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_19;
  v7[3] = &unk_1E61DCB18;
  int8x16_t v6 = a1[2];
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_19((uint64_t)v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 8));

  (*(void (**)(void))(a1[3].i64[0] + 16))();
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_19(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __87__REMXPCDaemonController__asyncResolveAndCachePerformerWithResolver_reason_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__REMXPCDaemonController__resolvePerformerWithResolver_reason_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLog xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = +[REMLog xpc];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_cold_1(v2);
  }

  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [(os_unfair_lock_s *)WeakRetained _xpcConnectionDidInterrupt];
    os_unfair_lock_lock(v4 + 2);
    id v5 = [(os_unfair_lock_s *)v4 l_performersByName];
    [v5 removeAllObjects];

    os_unfair_lock_unlock(v4 + 2);
  }
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_27(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 removeAllObjects];
}

uint64_t __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_29(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "l_performersByName");
  [v2 removeAllObjects];

  id v3 = *(void **)(a1 + 32);

  return [v3 setXpcConnection:0];
}

uint64_t __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_30(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) xpcConnection];

  return MEMORY[0x1F41817F8]();
}

- (void)_xpcConnectionDidInvalidate
{
  id v2 = [(REMXPCDaemonController *)self cloudKitNetworkActivityDelegate];
  [v2 cloudKitNetworkActivityDidChange:&unk_1F136C2C0];
}

- (os_unfair_lock_s)ivarLock
{
  return self->_ivarLock;
}

- (void)setIvarLock:(os_unfair_lock_s)a3
{
  self->_ivarLock = a3;
}

- (void)setL_performersByName:(id)a3
{
}

- (void)setServiceName:(id)a3
{
}

- (void)setStoreContainerToken:(id)a3
{
}

void __73__REMXPCDaemonController__syncPerformerWithResolver_reason_errorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Clearing cached performer due to proxy xpc error {name: %{public}@, error: %{public}@}");
}

- (void)_resolveAndCachePerformerWithResolver:(uint64_t)a1 reason:(uint64_t)a2 errorHandler:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_DEBUG, "Returning existing performer {name: %{public}@, performer: %@}", (uint8_t *)&v4, 0x16u);
}

void __84__REMXPCDaemonController__resolveAndCachePerformerWithResolver_reason_errorHandler___block_invoke_18_cold_1()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Clearing cached performer due to resolve xpc error {name: %{public}@, error: %{public}@}");
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "xpc connection error getting resolver {name: %{public}@, error: %{public}@}");
}

void __79__REMXPCDaemonController__asyncResolvePerformerWithResolver_reason_completion___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_2_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Error resolving performer {name: %{public}@, error: %{public}@}");
}

void __63__REMXPCDaemonController__xpcConnectionReconnectingIfNecessary__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "XPC connection was interrupted", v1, 2u);
}

@end