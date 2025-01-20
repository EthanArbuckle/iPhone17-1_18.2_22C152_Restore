@interface WLKConsentServiceReporter
- (WLKConsentServiceReporter)init;
- (id)_connection;
- (void)_invalidationHandler;
@end

@implementation WLKConsentServiceReporter

- (WLKConsentServiceReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKConsentServiceReporter;
  result = [(WLKConsentServiceReporter *)&v3 init];
  if (result) {
    result->_xpcLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)_connection
{
  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  if (!self->_connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v8 = self->_connection;
    v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_26];
    objc_initWeak(&location, self);
    v10 = self->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __40__WLKConsentServiceReporter__connection__block_invoke_2;
    v16 = &unk_1E620A550;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  v11 = self->_connection;

  return v11;
}

void __40__WLKConsentServiceReporter__connection__block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKConsentServiceReporter - Connection interrupted.", v1, 2u);
  }
}

void __40__WLKConsentServiceReporter__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidationHandler];
}

- (void)_invalidationHandler
{
  objc_super v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKConsentServiceReporter - Connection invalidated.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_xpcLock);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(&self->_xpcLock);
}

- (void).cxx_destruct
{
}

@end