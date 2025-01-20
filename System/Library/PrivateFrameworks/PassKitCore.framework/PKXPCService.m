@interface PKXPCService
+ (void)setForegroundActiveArbiter:(id)a3;
- (BOOL)connectionEstablished;
- (BOOL)forceConnectionOnResume;
- (BOOL)isSuspended;
- (NSString)machServiceName;
- (PKXPCService)init;
- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6;
- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 serviceResumedNotificationName:(id)a7;
- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 serviceResumedNotificationName:(id)a7 options:(unint64_t)a8;
- (PKXPCServiceDelegate)delegate;
- (id)_connection;
- (id)existingRemoteObjectProxy;
- (id)existingRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)existingSynchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)remoteObjectProxyWithFailureHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (uint64_t)_newWrappedErrorHandlerForHandler:(uint64_t)a1;
- (unint64_t)options;
- (void)_createConnectionIfPossible:(uint64_t)a1;
- (void)_establishServiceConnection;
- (void)_sendResumed;
- (void)_sendSuspended;
- (void)dealloc;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setForceConnectionOnResume:(BOOL)a3;
@end

@implementation PKXPCService

uint64_t __47__PKXPCService__invalidateConnectionIfPossible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)remoteObjectProxyWithFailureHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PKXPCService_remoteObjectProxyWithFailureHandler___block_invoke;
    v8[3] = &unk_1E56D8388;
    id v9 = v4;
    v6 = [(PKXPCService *)self remoteObjectProxyWithErrorHandler:v8];
  }
  else
  {
    v6 = [(PKXPCService *)self remoteObjectProxyWithErrorHandler:0];
  }

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(void, void))-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, a3);
  v5 = -[PKXPCService _connection]((os_unfair_lock_s *)self);
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  if (!v6 && v4) {
    v4[2](v4, 0);
  }

  return v6;
}

- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 serviceResumedNotificationName:(id)a7 options:(unint64_t)a8
{
  v51[1] = *(id *)MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  if ([v14 length])
  {
    v45.receiver = self;
    v45.super_class = (Class)PKXPCService;
    v21 = [(PKXPCService *)&v45 init];
    if (v21)
    {
      uint64_t v22 = [v14 copy];
      machServiceName = v21->_machServiceName;
      v21->_machServiceName = (NSString *)v22;

      if (v15)
      {
        v24 = (NSXPCInterface *)v15;
      }
      else
      {
        v24 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE22F580];
      }
      remoteObjectInterface = v21->_remoteObjectInterface;
      v21->_remoteObjectInterface = v24;

      if (v16)
      {
        v27 = (NSXPCInterface *)v16;
      }
      else
      {
        v27 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE22F580];
      }
      exportedObjectInterface = v21->_exportedObjectInterface;
      v21->_exportedObjectInterface = v27;

      if (v17)
      {
        v29 = (PKXPCForwarder *)PKXPCForwarderCreate(v17);
        templateExportedProxy = v21->_templateExportedProxy;
        v21->_templateExportedProxy = v29;
      }
      v21->_options = a8;
      uint64_t v31 = [v20 copy];
      className = v21->_className;
      v21->_className = (NSString *)v31;

      if ([v18 length])
      {
        uint64_t v33 = [v18 copy];
        serviceResumedNotificationName = v21->_serviceResumedNotificationName;
        v21->_serviceResumedNotificationName = (NSString *)v33;
      }
      else
      {
        serviceResumedNotificationName = v21->_serviceResumedNotificationName;
        v21->_serviceResumedNotificationName = 0;
      }

      v21->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v21->_foregroundActiveArbiter, (id)ForegroundActiveArbiter);
      foregroundActiveArbiter = v21->_foregroundActiveArbiter;
      if (!foregroundActiveArbiter
        || (v21->_suspendCallbacks = ([(PKForegroundActiveArbiter *)foregroundActiveArbiter registerObserver:v21] & 1) == 0, !v21->_foregroundActiveArbiter))
      {
        if (!v21->_foregroundListener || !v21->_backgroundListener)
        {
          v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
          objc_initWeak(&location, v21);
          if (!v21->_foregroundListener)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke;
            v50 = &unk_1E56DDE90;
            objc_copyWeak(v51, &location);
            uint64_t v37 = [v36 addObserverForName:@"UIApplicationWillEnterForegroundNotification" object:0 queue:0 usingBlock:buf];
            foregroundListener = v21->_foregroundListener;
            v21->_foregroundListener = v37;

            objc_destroyWeak(v51);
          }
          if (!v21->_backgroundListener)
          {
            from[0] = (id)MEMORY[0x1E4F143A8];
            from[1] = (id)3221225472;
            from[2] = __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke_2;
            from[3] = &unk_1E56DDE90;
            objc_copyWeak(&v47, &location);
            uint64_t v39 = [v36 addObserverForName:@"UIApplicationDidEnterBackgroundNotification" object:0 queue:0 usingBlock:from];
            backgroundListener = v21->_backgroundListener;
            v21->_backgroundListener = v39;

            objc_destroyWeak(&v47);
          }
          objc_destroyWeak(&location);
        }
      }
      if (!v21->_serviceResumedListenerInvalidater && v21->_serviceResumedNotificationName)
      {
        objc_initWeak(from, v21);
        v41 = v21->_serviceResumedNotificationName;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __63__PKXPCService__registerForServiceListenerResumedNotifications__block_invoke;
        v50 = &unk_1E56E1478;
        objc_copyWeak(v51, from);
        uint64_t v42 = PKNotifyCoalescedRegister(v41, buf);
        serviceResumedListenerInvalidater = v21->_serviceResumedListenerInvalidater;
        v21->_serviceResumedListenerInvalidater = (PKInvalidatable *)v42;

        objc_destroyWeak(v51);
        objc_destroyWeak(from);
      }
      if (!v21->_suspendCallbacks) {
        -[PKXPCService _establishServiceConnection]((uint64_t)v21);
      }
    }
  }
  else
  {
    v25 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      _os_log_error_impl(&dword_190E10000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Invalid mach service name %{public}@", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

- (void)_establishServiceConnection
{
  v2 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if (!*(void *)(a1 + 48)) {
    -[PKXPCService _createConnectionIfPossible:](a1, 1);
  }
  os_unfair_lock_unlock(v2);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(void, void))-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, a3);
  v5 = -[PKXPCService _connection]((os_unfair_lock_s *)self);
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v6 && v4) {
    v4[2](v4, 0);
  }

  return v6;
}

- (uint64_t)_newWrappedErrorHandlerForHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 24);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __50__PKXPCService__newWrappedErrorHandlerForHandler___block_invoke;
    v11 = &unk_1E56D9528;
    id v12 = v4;
    id v13 = v3;
    id v5 = v4;
    v6 = _Block_copy(&v8);
    a1 = objc_msgSend(v6, "copy", v8, v9, v10, v11);
  }
  return a1;
}

- (id)_connection
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 10;
    os_unfair_lock_lock(a1 + 10);
    -[PKXPCService _createConnectionIfPossible:]((uint64_t)v1, 0);
    v1 = (id *)v1[6];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_createConnectionIfPossible:(uint64_t)a1
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 48))
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:*(void *)(a1 + 120) options:0];
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;

    [*(id *)(a1 + 48) setRemoteObjectInterface:*(void *)(a1 + 8)];
    [*(id *)(a1 + 48) setExportedInterface:*(void *)(a1 + 16)];
    v6 = *(void **)(a1 + 56);
    if (v6)
    {
      PKXPCForwarderCopy(v6);
      v7 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v8;

      [*(id *)(a1 + 48) setExportedObject:*(void *)(a1 + 64)];
    }
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 24);
    objc_initWeak(&location, (id)a1);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke;
    v41[3] = &unk_1E56E1428;
    id v11 = v9;
    id v42 = v11;
    v27 = &v43;
    objc_copyWeak(&v43, &location);
    id v12 = (void *)[v41 copy];
    id v13 = *(void **)(a1 + 48);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke_3;
    v36[3] = &unk_1E56E1450;
    id v14 = v10;
    id v37 = v14;
    objc_copyWeak(&v40, &location);
    id v15 = v11;
    id v38 = v15;
    id v16 = v12;
    id v39 = v16;
    [v13 setInterruptionHandler:v36];
    id v17 = *(void **)(a1 + 48);
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __44__PKXPCService__createConnectionIfPossible___block_invoke_56;
    uint64_t v31 = &unk_1E56E1450;
    id v18 = v14;
    id v32 = v18;
    objc_copyWeak(&v35, &location);
    id v19 = v15;
    id v33 = v19;
    id v20 = v16;
    id v34 = v20;
    [v17 setInvalidationHandler:&v28];
    if (*(unsigned char *)(a1 + 128))
    {
      v21 = objc_msgSend(*(id *)(a1 + 48), "_xpcConnection", &v43, v28, v29, v30, v31, v32, v33);
      xpc_connection_set_non_launching();
    }
    uint64_t v22 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 24);
      uint64_t v24 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v23;
      __int16 v47 = 2048;
      uint64_t v48 = a1;
      __int16 v49 = 2048;
      uint64_t v50 = v24;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): connection created and resumed.", buf, 0x20u);
    }

    [*(id *)(a1 + 48) resume];
    if (*(unsigned char *)(a1 + 72))
    {
      v25 = [*(id *)(a1 + 48) remoteObjectProxy];
      [v25 serviceSuspended];
    }
    else
    {
      if (!a2)
      {
LABEL_13:
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        [WeakRetained remoteService:a1 didEstablishConnection:*(void *)(a1 + 48)];

        objc_destroyWeak(&v35);
        objc_destroyWeak(&v40);

        objc_destroyWeak(v27);
        objc_destroyWeak(&location);

        return;
      }
      v25 = [*(id *)(a1 + 48) remoteObjectProxy];
      [v25 serviceResumed];
    }

    goto LABEL_13;
  }
}

- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 serviceResumedNotificationName:(id)a7
{
  return [(PKXPCService *)self initWithMachServiceName:a3 remoteObjectInterface:a4 exportedObjectInterface:a5 exportedObject:a6 serviceResumedNotificationName:a7 options:0];
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6
{
  return [(PKXPCService *)self initWithMachServiceName:a3 remoteObjectInterface:a4 exportedObjectInterface:a5 exportedObject:a6 serviceResumedNotificationName:@"com.apple.passd.listener.resumed"];
}

- (void)setForceConnectionOnResume:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_forceConnectionOnResume = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(PKForegroundActiveArbiter *)self->_foregroundActiveArbiter unregisterObserver:self];
  serviceResumedListenerInvalidater = self->_serviceResumedListenerInvalidater;
  if (serviceResumedListenerInvalidater)
  {
    [(PKInvalidatable *)serviceResumedListenerInvalidater invalidate];
    uint64_t v4 = self->_serviceResumedListenerInvalidater;
    self->_serviceResumedListenerInvalidater = 0;
  }
  if (self->_foregroundListener || self->_backgroundListener)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = v5;
    if (self->_foregroundListener)
    {
      objc_msgSend(v5, "removeObserver:");
      foregroundListener = self->_foregroundListener;
      self->_foregroundListener = 0;
    }
    if (self->_backgroundListener)
    {
      objc_msgSend(v6, "removeObserver:");
      backgroundListener = self->_backgroundListener;
      self->_backgroundListener = 0;
    }
  }
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
  {
    id v10 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      className = self->_className;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = className;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      id v20 = connection;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): Tearing down existing connection", buf, 0x20u);
    }

    currentExportedProxy = self->_currentExportedProxy;
    if (currentExportedProxy)
    {
      PKXPCForwarderInvalidate(currentExportedProxy);
      id v13 = self->_currentExportedProxy;
      self->_currentExportedProxy = 0;
    }
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
    id v14 = self->_connection;
    id v15 = self->_connection;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __47__PKXPCService__invalidateConnectionIfPossible__block_invoke;
    id v20 = (NSXPCConnection *)&unk_1E56D8AE0;
    v21 = v14;
    id v16 = v14;
    [(NSXPCConnection *)v15 addBarrierBlock:buf];
    id v17 = self->_connection;
    self->_connection = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  v18.receiver = self;
  v18.super_class = (Class)PKXPCService;
  [(PKXPCService *)&v18 dealloc];
}

uint64_t __44__PKXPCService__createConnectionIfPossible___block_invoke_56(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    id v10 = WeakRetained;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): connection invalidated", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __44__PKXPCService__createConnectionIfPossible___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setInterruptionHandler:0];
  [*(id *)(a1 + 32) setInvalidationHandler:0];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 10);
    if (*(void *)&v5[12]._os_unfair_lock_opaque == *(void *)(a1 + 32))
    {
      v6 = *(void **)&v5[16]._os_unfair_lock_opaque;
      if (v6)
      {
        PKXPCForwarderInvalidate(v6);
        int v7 = *(void **)&v5[16]._os_unfair_lock_opaque;
        *(void *)&v5[16]._os_unfair_lock_opaque = 0;
      }
      if (a2)
      {
        id v8 = *(id *)(a1 + 32);
        __int16 v9 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke_2;
        v14[3] = &unk_1E56D8AE0;
        id v15 = v8;
        id v10 = v8;
        [v9 addBarrierBlock:v14];

        __int16 v11 = *(void **)&v5[12]._os_unfair_lock_opaque;
        *(void *)&v5[12]._os_unfair_lock_opaque = 0;

        id v12 = objc_loadWeakRetained((id *)&v5[28]);
        [v12 remoteService:v5 didInterruptConnection:*(void *)(a1 + 32)];
      }
      else
      {
        uint64_t v13 = *(void **)&v5[12]._os_unfair_lock_opaque;
        *(void *)&v5[12]._os_unfair_lock_opaque = 0;
      }
    }
    os_unfair_lock_unlock(v5 + 10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceResumedListenerInvalidater, 0);
  objc_storeStrong((id *)&self->_backgroundListener, 0);
  objc_storeStrong((id *)&self->_foregroundListener, 0);
  objc_storeStrong((id *)&self->_foregroundActiveArbiter, 0);
  objc_storeStrong((id *)&self->_currentExportedProxy, 0);
  objc_storeStrong((id *)&self->_templateExportedProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceResumedNotificationName, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
}

+ (void)setForegroundActiveArbiter:(id)a3
{
}

void __50__PKXPCService__newWrappedErrorHandlerForHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v3;
    _os_log_error_impl(&dword_190E10000, v4, OS_LOG_TYPE_ERROR, "%{public}@ XPC Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (PKXPCService)init
{
  id v3 = PDXPCServiceInterface();
  uint64_t v4 = [(PKXPCService *)self initWithMachServiceName:0 remoteObjectInterface:v3 exportedObjectInterface:0 exportedObject:0];

  return v4;
}

- (id)remoteObjectProxy
{
  return [(PKXPCService *)self remoteObjectProxyWithFailureHandler:0];
}

uint64_t __52__PKXPCService_remoteObjectProxyWithFailureHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)existingRemoteObjectProxy
{
  return [(PKXPCService *)self existingRemoteObjectProxyWithErrorHandler:0];
}

- (id)existingRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  int v7 = (void (**)(void, void))-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, v5);

  uint64_t v8 = [(NSXPCConnection *)v6 remoteObjectProxyWithErrorHandler:v7];

  if (v7 && !v8) {
    v7[2](v7, 0);
  }

  return v8;
}

- (id)existingSynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  int v7 = (void *)-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, v5);

  uint64_t v8 = [(NSXPCConnection *)v6 synchronousRemoteObjectProxyWithErrorHandler:v7];

  return v8;
}

uint64_t __44__PKXPCService__createConnectionIfPossible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __44__PKXPCService__createConnectionIfPossible___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    id v10 = WeakRetained;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): connection interrupted", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_sendResumed
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(unsigned char *)(a1 + 72))
    {
      *(unsigned char *)(a1 + 72) = 0;
      if (*(unsigned char *)(a1 + 73)) {
        -[PKXPCService _createConnectionIfPossible:](a1, 0);
      }
      uint64_t v3 = *(void **)(a1 + 48);
      if (v3)
      {
        uint64_t v4 = [v3 remoteObjectProxy];
        [v4 serviceResumed];
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      if (objc_opt_respondsToSelector()) {
        [WeakRetained remoteServiceDidResume:a1];
      }
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)_sendSuspended
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (!*(unsigned char *)(a1 + 72))
    {
      *(unsigned char *)(a1 + 72) = 1;
      uint64_t v3 = *(void **)(a1 + 48);
      if (v3)
      {
        uint64_t v4 = [v3 remoteObjectProxy];
        [v4 serviceSuspended];
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      if (objc_opt_respondsToSelector()) {
        [WeakRetained remoteServiceDidSuspend:a1];
      }
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  if (a4.var0) {
    -[PKXPCService _sendResumed]((uint64_t)self);
  }
  else {
    -[PKXPCService _sendSuspended]((uint64_t)self);
  }
}

void __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = (void *)MEMORY[0x192FDC630]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    -[PKXPCService _sendResumed]((uint64_t)WeakRetained);
  }
}

void __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = (void *)MEMORY[0x192FDC630]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    -[PKXPCService _sendSuspended]((uint64_t)WeakRetained);
  }
}

void __63__PKXPCService__registerForServiceListenerResumedNotifications__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = WeakRetained[3];
      int v4 = 138543618;
      uint64_t v5 = v3;
      __int16 v6 = 2048;
      int v7 = WeakRetained;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_INFO, "%{public}@:%p: listener resumed notification received", (uint8_t *)&v4, 0x16u);
    }

    -[PKXPCService _establishServiceConnection]((uint64_t)WeakRetained);
  }
}

- (PKXPCServiceDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PKXPCServiceDelegate *)WeakRetained;
}

- (BOOL)isSuspended
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_suspendCallbacks;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)connectionEstablished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_connection != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)forceConnectionOnResume
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_forceConnectionOnResume;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (unint64_t)options
{
  return self->_options;
}

@end