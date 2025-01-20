@interface PREXPCClientHelpers
- (PREXPCClientHelpers)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 clientExportedObject:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_locked_establishConnection;
- (void)dealloc;
@end

@implementation PREXPCClientHelpers

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_destroyWeak(&self->_clientExportedObject);
  objc_storeStrong((id *)&self->_whitelistedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_connLock = &self->_connLock;
  id v5 = a3;
  pthread_mutex_lock(p_connLock);
  [(PREXPCClientHelpers *)self _locked_establishConnection];
  v6 = [(NSXPCConnection *)self->_conn synchronousRemoteObjectProxyWithErrorHandler:v5];

  pthread_mutex_unlock(p_connLock);

  return v6;
}

- (id)remoteObjectProxy
{
  p_connLock = &self->_connLock;
  pthread_mutex_lock(&self->_connLock);
  [(PREXPCClientHelpers *)self _locked_establishConnection];
  v4 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
  pthread_mutex_unlock(p_connLock);

  return v4;
}

- (void)_locked_establishConnection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_conn)
  {
    v3 = pre_xpc_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = serviceName;
      _os_log_impl(&dword_1CA622000, v3, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }

    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_serviceName options:0];
    conn = self->_conn;
    self->_conn = v5;

    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:self->_whitelistedServerInterface];
    id WeakRetained = objc_loadWeakRetained(&self->_clientExportedObject);
    [(NSXPCConnection *)self->_conn setExportedObject:WeakRetained];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__PREXPCClientHelpers__locked_establishConnection__block_invoke;
    v13[3] = &unk_1E65B1AE0;
    objc_copyWeak(&v14, (id *)buf);
    [(NSXPCConnection *)self->_conn setInterruptionHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __50__PREXPCClientHelpers__locked_establishConnection__block_invoke_3;
    v11 = &unk_1E65B1AE0;
    objc_copyWeak(&v12, (id *)buf);
    [(NSXPCConnection *)self->_conn setInvalidationHandler:&v8];
    [(NSXPCConnection *)self->_conn resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __50__PREXPCClientHelpers__locked_establishConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = pre_xpc_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = WeakRetained[10];
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_error_impl(&dword_1CA622000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(WeakRetained[13] + 16))();
  }
}

void __50__PREXPCClientHelpers__locked_establishConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = pre_xpc_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *((void *)WeakRetained + 10);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1CA622000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated.", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*((void *)WeakRetained + 14) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    int v4 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_connLock);
  v3.receiver = self;
  v3.super_class = (Class)PREXPCClientHelpers;
  [(PREXPCClientHelpers *)&v3 dealloc];
}

- (PREXPCClientHelpers)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 clientExportedObject:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PREXPCClientHelpers;
  v18 = [(PREXPCClientHelpers *)&v25 init];
  v19 = v18;
  if (v18)
  {
    pthread_mutex_init(&v18->_connLock, 0);
    objc_storeStrong((id *)&v19->_serviceName, a3);
    objc_storeStrong((id *)&v19->_whitelistedServerInterface, a4);
    objc_storeWeak(&v19->_clientExportedObject, v15);
    uint64_t v20 = MEMORY[0x1CB799770](v16);
    id interruptionHandler = v19->_interruptionHandler;
    v19->_id interruptionHandler = (id)v20;

    uint64_t v22 = MEMORY[0x1CB799770](v17);
    id invalidationHandler = v19->_invalidationHandler;
    v19->_id invalidationHandler = (id)v22;
  }
  return v19;
}

@end