@interface _PASXPCClientHelper
- (_PASXPCClientHelper)initWithServiceName:(id)a3 allowlistedServerInterface:(id)a4 allowlistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 allowSystemToUserConnection:(BOOL)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9 logHandle:(id)a10;
- (_PASXPCClientHelper)initWithServiceName:(id)a3 allowlistedServerInterface:(id)a4 allowlistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8 logHandle:(id)a9;
- (_PASXPCClientHelper)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 whitelistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8 logHandle:(id)a9;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_locked_establishConnection;
- (void)dealloc;
@end

@implementation _PASXPCClientHelper

- (void)dealloc
{
  pthread_mutex_destroy(&self->_connLock);
  [(NSXPCConnection *)self->_conn invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PASXPCClientHelper;
  [(_PASXPCClientHelper *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_serverInitiatedRequestHandler, 0);
  objc_storeStrong((id *)&self->_allowlistedClientInterface, 0);
  objc_storeStrong((id *)&self->_allowlistedServerInterface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

- (_PASXPCClientHelper)initWithServiceName:(id)a3 allowlistedServerInterface:(id)a4 allowlistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8 logHandle:(id)a9
{
  return [(_PASXPCClientHelper *)self initWithServiceName:a3 allowlistedServerInterface:a4 allowlistedClientInterface:a5 serverInitiatedRequestHandler:a6 allowSystemToUserConnection:0 interruptionHandler:a7 invalidationHandler:a8 logHandle:a9];
}

- (_PASXPCClientHelper)initWithServiceName:(id)a3 allowlistedServerInterface:(id)a4 allowlistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 allowSystemToUserConnection:(BOOL)a7 interruptionHandler:(id)a8 invalidationHandler:(id)a9 logHandle:(id)a10
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v31.receiver = self;
  v31.super_class = (Class)_PASXPCClientHelper;
  v20 = [(_PASXPCClientHelper *)&v31 init];
  v21 = v20;
  if (v20)
  {
    pthread_mutex_init(&v20->_connLock, 0);
    objc_storeStrong((id *)&v21->_serviceName, a3);
    objc_storeStrong((id *)&v21->_allowlistedServerInterface, a4);
    objc_storeStrong((id *)&v21->_allowlistedClientInterface, a5);
    objc_storeStrong(&v21->_serverInitiatedRequestHandler, a6);
    uint64_t v22 = MEMORY[0x1A6245320](v17);
    id interruptionHandler = v21->_interruptionHandler;
    v21->_id interruptionHandler = (id)v22;

    uint64_t v24 = MEMORY[0x1A6245320](v18);
    id invalidationHandler = v21->_invalidationHandler;
    v21->_id invalidationHandler = (id)v24;

    objc_storeStrong((id *)&v21->_logHandle, a10);
    v21->_allowSystemToUserConnection = a7;
  }

  return v21;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  p_connLock = &self->_connLock;
  id v5 = a3;
  pthread_mutex_lock(p_connLock);
  [(_PASXPCClientHelper *)self _locked_establishConnection];
  v6 = [(NSXPCConnection *)self->_conn synchronousRemoteObjectProxyWithErrorHandler:v5];

  pthread_mutex_unlock(p_connLock);

  return v6;
}

- (void)_locked_establishConnection
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_conn)
  {
    logHandle = self->_logHandle;
    if (logHandle && os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      v14 = serviceName;
      _os_log_impl(&dword_1A32C4000, logHandle, OS_LOG_TYPE_DEFAULT, "Establishing new connection to %@ .", buf, 0xCu);
    }
    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:self->_serviceName options:0];
    conn = self->_conn;
    self->_conn = v5;

    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:self->_allowlistedServerInterface];
    [(NSXPCConnection *)self->_conn setExportedObject:self->_serverInitiatedRequestHandler];
    [(NSXPCConnection *)self->_conn setExportedInterface:self->_allowlistedClientInterface];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50___PASXPCClientHelper__locked_establishConnection__block_invoke;
    v10[3] = &unk_1E5AEB408;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_conn setInterruptionHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___PASXPCClientHelper__locked_establishConnection__block_invoke_3;
    v8[3] = &unk_1E5AEB408;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_conn setInvalidationHandler:v8];
    if (self->_allowSystemToUserConnection)
    {
      if (xpc_user_sessions_enabled())
      {
        xpc_user_sessions_get_foreground_uid();
        v7 = [(NSXPCConnection *)self->_conn _xpcConnection];
        xpc_connection_set_target_user_session_uid();
      }
    }
    [(NSXPCConnection *)self->_conn resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  p_connLock = &self->_connLock;
  id v5 = a3;
  pthread_mutex_lock(p_connLock);
  [(_PASXPCClientHelper *)self _locked_establishConnection];
  v6 = [(NSXPCConnection *)self->_conn remoteObjectProxyWithErrorHandler:v5];

  pthread_mutex_unlock(p_connLock);

  return v6;
}

- (id)remoteObjectProxy
{
  p_connLock = &self->_connLock;
  pthread_mutex_lock(&self->_connLock);
  [(_PASXPCClientHelper *)self _locked_establishConnection];
  v4 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
  pthread_mutex_unlock(p_connLock);

  return v4;
}

- (_PASXPCClientHelper)initWithServiceName:(id)a3 whitelistedServerInterface:(id)a4 whitelistedClientInterface:(id)a5 serverInitiatedRequestHandler:(id)a6 interruptionHandler:(id)a7 invalidationHandler:(id)a8 logHandle:(id)a9
{
  return [(_PASXPCClientHelper *)self initWithServiceName:a3 allowlistedServerInterface:a4 allowlistedClientInterface:a5 serverInitiatedRequestHandler:a6 allowSystemToUserConnection:0 interruptionHandler:a7 invalidationHandler:a8 logHandle:a9];
}

@end