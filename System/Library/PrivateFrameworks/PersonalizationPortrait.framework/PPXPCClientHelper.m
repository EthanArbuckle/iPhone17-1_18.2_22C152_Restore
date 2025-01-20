@interface PPXPCClientHelper
- (PPXPCClientHelper)initWithServiceName:(id)a3 allowedServerInterface:(id)a4 allowedClientInterface:(id)a5 clientExportedObject:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_locked_establishConnection;
- (void)dealloc;
@end

@implementation PPXPCClientHelper

void __48__PPXPCClientHelper__locked_establishConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = pp_xpc_client_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = WeakRetained[10];
      int v4 = 138412290;
      uint64_t v5 = v3;
      _os_log_error_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v4, 0xCu);
    }

    (*(void (**)(void))(WeakRetained[14] + 16))();
  }
}

- (PPXPCClientHelper)initWithServiceName:(id)a3 allowedServerInterface:(id)a4 allowedClientInterface:(id)a5 clientExportedObject:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8
{
  id v27 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PPXPCClientHelper;
  v20 = [(PPXPCClientHelper *)&v28 init];
  v21 = v20;
  if (v20)
  {
    pthread_mutex_init(&v20->_connLock, 0);
    objc_storeStrong((id *)&v21->_serviceName, a3);
    objc_storeStrong((id *)&v21->_allowedServerInterface, a4);
    objc_storeStrong((id *)&v21->_allowedClientInterface, a5);
    objc_storeWeak(&v21->_clientExportedObject, v17);
    uint64_t v22 = MEMORY[0x192F975A0](v18);
    id interruptionHandler = v21->_interruptionHandler;
    v21->_id interruptionHandler = (id)v22;

    uint64_t v24 = MEMORY[0x192F975A0](v19);
    id invalidationHandler = v21->_invalidationHandler;
    v21->_id invalidationHandler = (id)v24;
  }
  return v21;
}

- (id)remoteObjectProxy
{
  p_connLock = &self->_connLock;
  pthread_mutex_lock(&self->_connLock);
  [(PPXPCClientHelper *)self _locked_establishConnection];
  int v4 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
  pthread_mutex_unlock(p_connLock);
  return v4;
}

- (void)_locked_establishConnection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_conn)
  {
    uint64_t v3 = pp_xpc_client_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = serviceName;
      _os_log_impl(&dword_18CAA6000, v3, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }

    uint64_t v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_serviceName options:0];
    conn = self->_conn;
    self->_conn = v5;

    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:self->_allowedServerInterface];
    id WeakRetained = objc_loadWeakRetained(&self->_clientExportedObject);
    [(NSXPCConnection *)self->_conn setExportedObject:WeakRetained];

    if (self->_allowedClientInterface) {
      -[NSXPCConnection setExportedInterface:](self->_conn, "setExportedInterface:");
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__PPXPCClientHelper__locked_establishConnection__block_invoke;
    v13[3] = &unk_1E550F488;
    objc_copyWeak(&v14, (id *)buf);
    [(NSXPCConnection *)self->_conn setInterruptionHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __48__PPXPCClientHelper__locked_establishConnection__block_invoke_3;
    v11 = &unk_1E550F488;
    objc_copyWeak(&v12, (id *)buf);
    [(NSXPCConnection *)self->_conn setInvalidationHandler:&v8];
    [(NSXPCConnection *)self->_conn resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_destroyWeak(&self->_clientExportedObject);
  objc_storeStrong((id *)&self->_allowedClientInterface, 0);
  objc_storeStrong((id *)&self->_allowedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_connLock = &self->_connLock;
  id v5 = a3;
  pthread_mutex_lock(p_connLock);
  [(PPXPCClientHelper *)self _locked_establishConnection];
  uint64_t v6 = [(NSXPCConnection *)self->_conn synchronousRemoteObjectProxyWithErrorHandler:v5];

  pthread_mutex_unlock(p_connLock);
  return v6;
}

void __48__PPXPCClientHelper__locked_establishConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = pp_xpc_client_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *((void *)WeakRetained + 10);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18CAA6000, v2, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*((void *)WeakRetained + 15) + 16))();
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 8));
    int v4 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;

    pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 8));
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_conn invalidate];
  pthread_mutex_destroy(&self->_connLock);
  v3.receiver = self;
  v3.super_class = (Class)PPXPCClientHelper;
  [(PPXPCClientHelper *)&v3 dealloc];
}

@end