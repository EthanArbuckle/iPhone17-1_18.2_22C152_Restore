@interface WBSSafariBookmarksSyncAgentConnection
- (WBSSafariBookmarksSyncAgentConnection)init;
- (WBSSafariBookmarksSyncAgentProtocol)remoteObjectProxy;
- (void)_connectionDidInvalidate;
- (void)_setUpConnectionIfNeeded;
@end

@implementation WBSSafariBookmarksSyncAgentConnection

- (WBSSafariBookmarksSyncAgentConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSSafariBookmarksSyncAgentConnection;
  v2 = [(WBSSafariBookmarksSyncAgentConnection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_connectionLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_setUpConnectionIfNeeded
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (!self->_connection)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEFAULT, "Setting up XPC to SBSA", (uint8_t *)buf, 2u);
    }
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SafariBookmarksSyncAgent" options:0];
    connection = self->_connection;
    self->_connection = v5;

    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1097E58];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v7];
    objc_initWeak(buf, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__WBSSafariBookmarksSyncAgentConnection__setUpConnectionIfNeeded__block_invoke;
    v8[3] = &unk_1E615A5D8;
    objc_copyWeak(&v9, buf);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
  os_unfair_lock_unlock(p_connectionLock);
}

void __65__WBSSafariBookmarksSyncAgentConnection__setUpConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionDidInvalidate];
}

- (void)_connectionDidInvalidate
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  v4 = WBS_LOG_CHANNEL_PREFIXXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_1B728F000, v4, OS_LOG_TYPE_DEFAULT, "XPC to SBSA invalidated", v6, 2u);
  }
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_connectionLock);
}

- (WBSSafariBookmarksSyncAgentProtocol)remoteObjectProxy
{
  [(WBSSafariBookmarksSyncAgentConnection *)self _setUpConnectionIfNeeded];
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  if ([v3 conformsToProtocol:&unk_1F1097E58]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
}

@end