@interface _TPSXPCConnection
- (NSString)debugIdentifier;
- (_TPSXPCConnection)initWithListenerEndpoint:(id)a3;
- (_TPSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4;
- (_TPSXPCConnection)initWithServiceName:(id)a3;
- (_TPSXPCConnection)initWithUnderlyingConnection:(id)a3;
- (_TPSXPCExportable)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setDebugIdentifier:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation _TPSXPCConnection

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_underlyingConnection remoteObjectProxyWithErrorHandler:a3];
}

- (void)setExportedObject:(id)a3
{
}

- (void)resume
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  if (WeakRetained)
  {
    if (self->_debugIdentifier)
    {
      v4 = [NSString stringWithFormat:@"%@: ", self->_debugIdentifier];
    }
    else
    {
      v4 = &stru_1EED877F8;
    }
    uint64_t v5 = [(NSXPCConnection *)self->_underlyingConnection serviceName];
    v6 = (void *)v5;
    v7 = @"<anonymous>";
    if (v5) {
      v7 = (__CFString *)v5;
    }
    v8 = v7;

    objc_initWeak(&location, self);
    underlyingConnection = self->_underlyingConnection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __27___TPSXPCConnection_resume__block_invoke;
    v24[3] = &unk_1E5908390;
    objc_copyWeak(&v27, &location);
    v10 = v4;
    v25 = v10;
    v11 = v8;
    v26 = v11;
    [(NSXPCConnection *)underlyingConnection setInterruptionHandler:v24];
    v12 = self->_underlyingConnection;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __27___TPSXPCConnection_resume__block_invoke_12;
    v20[3] = &unk_1E5908390;
    objc_copyWeak(&v23, &location);
    v13 = v10;
    v21 = v13;
    v14 = v11;
    v22 = v14;
    [(NSXPCConnection *)v12 setInvalidationHandler:v20];
    v15 = self->_underlyingConnection;
    v16 = [WeakRetained exportedInterface];
    [(NSXPCConnection *)v15 setExportedInterface:v16];

    v17 = self->_underlyingConnection;
    v18 = [WeakRetained remoteInterface];
    [(NSXPCConnection *)v17 setRemoteObjectInterface:v18];

    v19 = objc_alloc_init(_TPSXPCExportedObjectProxy);
    [(_TPSXPCExportedObjectProxy *)v19 setWeakExportedObject:WeakRetained];
    [(NSXPCConnection *)self->_underlyingConnection setExportedObject:v19];
    if (objc_opt_respondsToSelector()) {
      [WeakRetained connectionConfigured];
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  [(NSXPCConnection *)self->_underlyingConnection resume];
}

- (_TPSXPCConnection)initWithUnderlyingConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TPSXPCConnection;
  v6 = [(_TPSXPCConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingConnection, a3);
    [(_TPSXPCConnection *)v7 setInterruptionHandler:0];
    [(_TPSXPCConnection *)v7 setInvalidationHandler:0];
  }

  return v7;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44___TPSXPCConnection_setInvalidationHandler___block_invoke;
    v7[3] = &unk_1E5906E60;
    objc_copyWeak(&v8, &location);
    id v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  id v5 = _Block_copy(v4);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v5;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44___TPSXPCConnection_setInterruptionHandler___block_invoke;
    v7[3] = &unk_1E5906E60;
    objc_copyWeak(&v8, &location);
    id v4 = _Block_copy(v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  id v5 = _Block_copy(v4);
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v5;
}

- (_TPSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v6 options:a4];
  if (v7)
  {
    self = [(_TPSXPCConnection *)self initWithUnderlyingConnection:v7];
    id v8 = self;
  }
  else
  {
    objc_super v9 = +[TPSLogger data];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_TPSXPCConnection initWithServiceName:]((uint64_t)v6, v9);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_underlyingConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_underlyingConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_TPSXPCConnection;
  [(_TPSXPCConnection *)&v3 dealloc];
}

- (_TPSXPCConnection)initWithServiceName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:v4];
  if (v5)
  {
    self = [(_TPSXPCConnection *)self initWithUnderlyingConnection:v5];
    id v6 = self;
  }
  else
  {
    v7 = +[TPSLogger data];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_TPSXPCConnection initWithServiceName:]((uint64_t)v4, v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (_TPSXPCConnection)initWithListenerEndpoint:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29268];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithListenerEndpoint:v5];

  v7 = [(_TPSXPCConnection *)self initWithUnderlyingConnection:v6];
  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_underlyingConnection synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void)invalidate
{
}

- (_TPSXPCExportable)exportedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  return (_TPSXPCExportable *)WeakRetained;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_underlyingConnection, 0);
}

- (void)initWithServiceName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_ERROR, "Could not establish connection with %@", (uint8_t *)&v2, 0xCu);
}

@end