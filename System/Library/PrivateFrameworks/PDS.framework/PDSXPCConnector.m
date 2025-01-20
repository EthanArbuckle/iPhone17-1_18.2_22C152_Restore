@interface PDSXPCConnector
- (BOOL)validateConnectionWithError:(id *)a3;
- (NSError)connectionError;
- (NSString)clientID;
- (PDSRemote)remoteObject;
- (PDSRemote)syncRemoteObject;
- (PDSRemoteInternal)internalRemoteObject;
- (PDSRemoteInternal)syncInternalRemoteObject;
- (PDSXPCConnection)XPCConnection;
- (PDSXPCConnectionVendor)connectionVendor;
- (PDSXPCConnector)initWithClientID:(id)a3;
- (PDSXPCConnector)initWithClientID:(id)a3 interfaceVendor:(id)a4 connectionVendor:(id)a5;
- (PDSXPCHandshake)handshakeProxy;
- (PDSXPCInterfaceVendor)interfaceVendor;
- (id)_genericProxyWithError:(id *)a3 remoteBlock:(id)a4;
- (id)_genericSyncProxyWithErrorHandler:(id)a3 localStorage:(id *)a4 remoteBlock:(id)a5;
- (id)_lockedPerformConnectWithBlock:(id)a3;
- (id)_lockedRemoteInternalObject;
- (id)_lockedRemoteObject;
- (id)_lockedXPCConnection;
- (id)internalRemoteObjectProxyWithError:(id *)a3;
- (id)remoteObjectProxyWithError:(id *)a3;
- (id)synchronousInternalRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (os_unfair_lock_s)lock;
- (void)setClientID:(id)a3;
- (void)setConnectionError:(id)a3;
- (void)setConnectionVendor:(id)a3;
- (void)setHandshakeProxy:(id)a3;
- (void)setInterfaceVendor:(id)a3;
- (void)setInternalRemoteObject:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setRemoteObject:(id)a3;
- (void)setSyncInternalRemoteObject:(id)a3;
- (void)setSyncRemoteObject:(id)a3;
- (void)setXPCConnection:(id)a3;
@end

@implementation PDSXPCConnector

- (BOOL)validateConnectionWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(PDSXPCConnector *)self _lockedRemoteObject];
  v7 = [(PDSXPCConnector *)self connectionError];
  v8 = v7;
  if (a3 && v7) {
    *a3 = v7;
  }
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  BOOL v10 = !v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__PDSXPCConnector_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v8[3] = &unk_2644CC208;
  v8[4] = self;
  v6 = [(PDSXPCConnector *)self _genericSyncProxyWithErrorHandler:v5 localStorage:&self->_syncRemoteObject remoteBlock:v8];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_genericSyncProxyWithErrorHandler:(id)a3 localStorage:(id *)a4 remoteBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  id v10 = *a4;
  if (!*a4)
  {
    id v20 = 0;
    v11 = [(PDSXPCConnector *)self _genericProxyWithError:&v20 remoteBlock:v9];
    id v12 = v20;
    v13 = v12;
    if (v11)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __78__PDSXPCConnector__genericSyncProxyWithErrorHandler_localStorage_remoteBlock___block_invoke;
      v18[3] = &unk_2644CC278;
      id v19 = v8;
      v14 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
      id v15 = *a4;
      *a4 = v14;
    }
    else if (v8 && v12)
    {
      (*((void (**)(id, id))v8 + 2))(v8, v12);
    }

    id v10 = *a4;
  }
  id v16 = v10;

  return v16;
}

- (id)_genericProxyWithError:(id *)a3 remoteBlock:(id)a4
{
  v6 = (void (**)(void))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = [(PDSXPCConnector *)self connectionError];

  if (v7)
  {
    if (a3)
    {
      [(PDSXPCConnector *)self connectionError];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v9 = v6[2](v6);
    id v8 = v9;
    if (v9)
    {
      id v10 = v9;
    }
    else if (a3)
    {
      *a3 = [(PDSXPCConnector *)self connectionError];
    }
  }
  return v8;
}

- (NSError)connectionError
{
  return self->_connectionError;
}

- (id)_lockedRemoteObject
{
  os_unfair_lock_assert_owner(&self->_lock);
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__PDSXPCConnector__lockedRemoteObject__block_invoke;
    v7[3] = &unk_2644CC230;
    v7[4] = self;
    v4 = [(PDSXPCConnector *)self _lockedPerformConnectWithBlock:v7];
    id v5 = self->_remoteObject;
    self->_remoteObject = v4;

    remoteObject = self->_remoteObject;
  }
  return remoteObject;
}

- (PDSXPCConnector)initWithClientID:(id)a3
{
  id v4 = a3;
  id v5 = +[PDSXPCAdapter defaultInterfaceVendor];
  v6 = +[PDSXPCAdapter defaultConnectionVendor];
  v7 = [(PDSXPCConnector *)self initWithClientID:v4 interfaceVendor:v5 connectionVendor:v6];

  return v7;
}

- (PDSXPCConnector)initWithClientID:(id)a3 interfaceVendor:(id)a4 connectionVendor:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PDSXPCConnector.m", 50, @"Invalid parameter not satisfying: %@", @"interfaceVendor" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PDSXPCConnector.m", 49, @"Invalid parameter not satisfying: %@", @"clientID" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PDSXPCConnector.m", 51, @"Invalid parameter not satisfying: %@", @"connectionVendor" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)PDSXPCConnector;
  v13 = [(PDSXPCConnector *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clientID, a3);
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_interfaceVendor, a4);
    objc_storeStrong((id *)&v14->_connectionVendor, a5);
  }

  return v14;
}

uint64_t __64__PDSXPCConnector_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockedRemoteObject];
}

- (id)remoteObjectProxyWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__PDSXPCConnector_remoteObjectProxyWithError___block_invoke;
  v8[3] = &unk_2644CC208;
  v8[4] = self;
  v6 = [(PDSXPCConnector *)self _genericProxyWithError:a3 remoteBlock:v8];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __46__PDSXPCConnector_remoteObjectProxyWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockedRemoteObject];
}

- (id)synchronousInternalRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__PDSXPCConnector_synchronousInternalRemoteObjectProxyWithErrorHandler___block_invoke;
  v8[3] = &unk_2644CC208;
  v8[4] = self;
  v6 = [(PDSXPCConnector *)self _genericSyncProxyWithErrorHandler:v5 localStorage:&self->_syncInternalRemoteObject remoteBlock:v8];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __72__PDSXPCConnector_synchronousInternalRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockedRemoteInternalObject];
}

- (id)internalRemoteObjectProxyWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__PDSXPCConnector_internalRemoteObjectProxyWithError___block_invoke;
  v8[3] = &unk_2644CC208;
  v8[4] = self;
  v6 = [(PDSXPCConnector *)self _genericProxyWithError:a3 remoteBlock:v8];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __54__PDSXPCConnector_internalRemoteObjectProxyWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lockedRemoteInternalObject];
}

uint64_t __38__PDSXPCConnector__lockedRemoteObject__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 connectWithClientID:*(void *)(*(void *)(a1 + 32) + 16) completion:a3];
}

- (id)_lockedRemoteInternalObject
{
  os_unfair_lock_assert_owner(&self->_lock);
  internalRemoteObject = self->_internalRemoteObject;
  if (!internalRemoteObject)
  {
    id v4 = [(PDSXPCConnector *)self _lockedPerformConnectWithBlock:&__block_literal_global_0];
    id v5 = self->_internalRemoteObject;
    self->_internalRemoteObject = v4;

    internalRemoteObject = self->_internalRemoteObject;
  }
  return internalRemoteObject;
}

uint64_t __46__PDSXPCConnector__lockedRemoteInternalObject__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "connectInternalWithCompletion:");
}

uint64_t __78__PDSXPCConnector__genericSyncProxyWithErrorHandler_localStorage_remoteBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_lockedPerformConnectWithBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, PDSXPCHandshake *, void *))a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_connectionError)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    uint64_t v18 = 0;
    objc_super v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    v6 = self->_handshakeProxy;
    if (!self->_handshakeProxy)
    {
      v7 = [(PDSXPCConnector *)self _lockedXPCConnection];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke;
      v17[3] = &unk_2644CC2A0;
      v17[4] = &v24;
      id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v17];
      handshakeProxy = self->_handshakeProxy;
      self->_handshakeProxy = v8;

      id v10 = self->_handshakeProxy;
      if (v25[5])
      {
        id v11 = self->_handshakeProxy;
        self->_handshakeProxy = 0;
      }
      id v12 = pds_defaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = v25[5];
        *(_DWORD *)buf = 134218242;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl(&dword_21E879000, v12, OS_LOG_TYPE_DEFAULT, "PDSXPCConnection acquired handshake proxy {selfPointer: %p, XPCError: %@}", buf, 0x16u);
      }

      v6 = v10;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    if (v6)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke_17;
      v16[3] = &unk_2644CC2C8;
      v16[4] = &v18;
      v16[5] = buf;
      v4[2](v4, v6, v16);
    }
    if (v25[5] || v19[5])
    {
      -[PDSXPCConnector setConnectionError:](self, "setConnectionError:");
      v14 = self->_handshakeProxy;
      self->_handshakeProxy = 0;
    }
    id v5 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  return v5;
}

void __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_lockedXPCConnection
{
  os_unfair_lock_assert_owner(&self->_lock);
  p_XPCConnection = &self->_XPCConnection;
  XPCConnection = self->_XPCConnection;
  if (!XPCConnection)
  {
    id v5 = [(PDSXPCConnectionVendor *)self->_connectionVendor connectionForMachService:@"com.apple.identityservicesd.pds"];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v6 = +[PDSXPCInterface handShakeInterfaceFromVendor:self->_interfaceVendor];
    [v5 setRemoteObjectInterface:v6];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__PDSXPCConnector__lockedXPCConnection__block_invoke;
    v10[3] = &unk_2644CC2F0;
    objc_copyWeak(&v11, &location);
    [v5 setInterruptionHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__PDSXPCConnector__lockedXPCConnection__block_invoke_21;
    v8[3] = &unk_2644CC2F0;
    objc_copyWeak(&v9, &location);
    [v5 setInvalidationHandler:v8];
    objc_storeStrong((id *)p_XPCConnection, v5);
    [v5 resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

    XPCConnection = *p_XPCConnection;
  }
  return XPCConnection;
}

void __39__PDSXPCConnector__lockedXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = pds_defaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      v7 = WeakRetained;
      _os_log_impl(&dword_21E879000, v2, OS_LOG_TYPE_DEFAULT, "PDSXPCConnection interrupted {selfPointer: %p}", (uint8_t *)&v6, 0xCu);
    }

    if (os_unfair_lock_trylock(WeakRetained + 2))
    {
      v3 = *(void **)&WeakRetained[10]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[10]._os_unfair_lock_opaque = 0;

      id v4 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[12]._os_unfair_lock_opaque = 0;

      id v5 = *(void **)&WeakRetained[8]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[8]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(WeakRetained + 2);
    }
  }
}

void __39__PDSXPCConnector__lockedXPCConnection__block_invoke_21(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = pds_defaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      id v10 = WeakRetained;
      _os_log_impl(&dword_21E879000, v2, OS_LOG_TYPE_DEFAULT, "PDSXPCConnection interrupted {selfPointer: %p}", (uint8_t *)&v9, 0xCu);
    }

    if (os_unfair_lock_trylock(WeakRetained + 2))
    {
      v3 = *(void **)&WeakRetained[10]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[10]._os_unfair_lock_opaque = 0;

      id v4 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[12]._os_unfair_lock_opaque = 0;

      id v5 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[6]._os_unfair_lock_opaque = 0;

      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:PDSXPCErrorDomain code:-300 userInfo:0];
      v7 = *(void **)&WeakRetained[18]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[18]._os_unfair_lock_opaque = v6;

      uint64_t v8 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
      *(void *)&WeakRetained[6]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(WeakRetained + 2);
    }
  }
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (PDSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)setXPCConnection:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (PDSXPCHandshake)handshakeProxy
{
  return self->_handshakeProxy;
}

- (void)setHandshakeProxy:(id)a3
{
}

- (PDSRemote)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (PDSRemote)syncRemoteObject
{
  return self->_syncRemoteObject;
}

- (void)setSyncRemoteObject:(id)a3
{
}

- (PDSRemoteInternal)internalRemoteObject
{
  return self->_internalRemoteObject;
}

- (void)setInternalRemoteObject:(id)a3
{
}

- (PDSRemoteInternal)syncInternalRemoteObject
{
  return self->_syncInternalRemoteObject;
}

- (void)setSyncInternalRemoteObject:(id)a3
{
}

- (void)setConnectionError:(id)a3
{
}

- (PDSXPCInterfaceVendor)interfaceVendor
{
  return self->_interfaceVendor;
}

- (void)setInterfaceVendor:(id)a3
{
}

- (PDSXPCConnectionVendor)connectionVendor
{
  return self->_connectionVendor;
}

- (void)setConnectionVendor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionVendor, 0);
  objc_storeStrong((id *)&self->_interfaceVendor, 0);
  objc_storeStrong((id *)&self->_connectionError, 0);
  objc_storeStrong((id *)&self->_syncInternalRemoteObject, 0);
  objc_storeStrong((id *)&self->_internalRemoteObject, 0);
  objc_storeStrong((id *)&self->_syncRemoteObject, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_handshakeProxy, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end