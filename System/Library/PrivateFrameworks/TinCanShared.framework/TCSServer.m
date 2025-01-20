@interface TCSServer
- (BOOL)hasValidConnection;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TCSServer)init;
- (TCSServerXPC)delegate;
- (void)_addConnection:(id)a3;
- (void)_enumerateConnectionsWithBlock:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)callConnected:(id)a3;
- (void)callStatusChanged:(id)a3;
- (void)completeInvitationFlowForContact:(id)a3;
- (void)disconnectCall:(id)a3;
- (void)getCall:(id)a3;
- (void)getLogEntryForCallWithUniqueProxyIdentifier:(id)a3 completion:(id)a4;
- (void)queryIsTinCannable:(id)a3;
- (void)remoteUplinkMuteChanged:(id)a3;
- (void)sessionViewControllerViewDidAppear;
- (void)setDelegate:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 for:(id)a4 completion:(id)a5;
@end

@implementation TCSServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD5F88];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD6208];
  [v7 setRemoteObjectInterface:v9];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_2644C8E58;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [v7 setInvalidationHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke_64;
  v11[3] = &unk_2644C8B00;
  objc_copyWeak(&v12, &from);
  [v7 setInterruptionHandler:v11];
  [(TCSServer *)self _addConnection:v7];
  [v7 resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    _TCSInitializeLogging();
    v4 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_21E834000, v4, OS_LOG_TYPE_DEFAULT, "TCSServer connection invalidation handler called for %@", (uint8_t *)&v5, 0xCu);
    }
    [WeakRetained _removeConnection:v3];
  }
}

void __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke_64(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_21E834000, v2, OS_LOG_TYPE_DEFAULT, "TCSServer connection interruption handler called for %@", (uint8_t *)&v3, 0xCu);
    }
    [WeakRetained invalidate];
  }
}

- (TCSServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)TCSServer;
  v2 = [(TCSServer *)&v9 init];
  int v3 = v2;
  if (v2)
  {
    v2->_connectionsLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    connections = v3->_connections;
    v3->_connections = (NSMutableArray *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.tincan.server"];
    listener = v3->_listener;
    v3->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v3->_listener setDelegate:v3];
    [(NSXPCListener *)v3->_listener resume];
  }
  return v3;
}

- (BOOL)hasValidConnection
{
  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  uint64_t v4 = [(NSMutableArray *)self->_connections count];
  os_unfair_lock_unlock(p_connectionsLock);
  return v4 != 0;
}

- (void)callStatusChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__TCSServer_callStatusChanged___block_invoke;
  v6[3] = &unk_2644C8E80;
  id v7 = v4;
  id v5 = v4;
  [(TCSServer *)self _enumerateConnectionsWithBlock:v6];
}

void __31__TCSServer_callStatusChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 callStatusChanged:*(void *)(a1 + 32)];
}

- (void)callConnected:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__TCSServer_callConnected___block_invoke;
  v6[3] = &unk_2644C8E80;
  id v7 = v4;
  id v5 = v4;
  [(TCSServer *)self _enumerateConnectionsWithBlock:v6];
}

void __27__TCSServer_callConnected___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 callConnected:*(void *)(a1 + 32)];
}

- (void)remoteUplinkMuteChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__TCSServer_remoteUplinkMuteChanged___block_invoke;
  v6[3] = &unk_2644C8E80;
  id v7 = v4;
  id v5 = v4;
  [(TCSServer *)self _enumerateConnectionsWithBlock:v6];
}

void __37__TCSServer_remoteUplinkMuteChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteObjectProxy];
  [v3 remoteUplinkMuteChanged:*(void *)(a1 + 32)];
}

- (void)sessionViewControllerViewDidAppear
{
  id v2 = [(TCSServer *)self delegate];
  [v2 sessionViewControllerViewDidAppear];
}

- (void)getCall:(id)a3
{
  id v4 = a3;
  id v5 = [(TCSServer *)self delegate];
  [v5 getCall:v4];
}

- (void)disconnectCall:(id)a3
{
  id v4 = a3;
  id v5 = [(TCSServer *)self delegate];
  [v5 disconnectCall:v4];
}

- (void)queryIsTinCannable:(id)a3
{
  id v4 = a3;
  id v5 = [(TCSServer *)self delegate];
  [v5 queryIsTinCannable:v4];
}

- (void)completeInvitationFlowForContact:(id)a3
{
  id v4 = a3;
  id v5 = [(TCSServer *)self delegate];
  [v5 completeInvitationFlowForContact:v4];
}

- (void)setUplinkMuted:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(TCSServer *)self delegate];
  [v10 setUplinkMuted:v6 for:v9 completion:v8];
}

- (void)getLogEntryForCallWithUniqueProxyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TCSServer *)self delegate];
  [v8 getLogEntryForCallWithUniqueProxyIdentifier:v7 completion:v6];
}

- (void)_addConnection:(id)a3
{
  p_connectionsLock = &self->_connectionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_connectionsLock);
  [(NSMutableArray *)self->_connections addObject:v5];

  os_unfair_lock_unlock(p_connectionsLock);
}

- (void)_enumerateConnectionsWithBlock:(id)a3
{
  id v4 = a3;
  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  connections = self->_connections;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__TCSServer__enumerateConnectionsWithBlock___block_invoke;
  v8[3] = &unk_2644C8EA8;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableArray *)connections enumerateObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_connectionsLock);
}

uint64_t __44__TCSServer__enumerateConnectionsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeConnection:(id)a3
{
  p_connectionsLock = &self->_connectionsLock;
  id v5 = a3;
  os_unfair_lock_lock(p_connectionsLock);
  [(NSMutableArray *)self->_connections removeObject:v5];

  [(NSMutableArray *)self->_connections count];
  os_unfair_lock_unlock(p_connectionsLock);
}

- (TCSServerXPC)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TCSServerXPC *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end