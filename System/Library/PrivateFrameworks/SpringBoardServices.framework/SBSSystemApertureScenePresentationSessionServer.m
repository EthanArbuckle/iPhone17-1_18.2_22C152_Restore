@interface SBSSystemApertureScenePresentationSessionServer
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
+ (SBSSystemApertureScenePresentationSessionServer)activeInstance;
- (SBSSystemApertureScenePresentationSessionServer)initWithDelegate:(id)a3;
- (SBSSystemApertureScenePresentationSessionServerDelegate)delegate;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)requestSystemApertureScene:(id)a3;
- (void)requestSystemApertureSceneForCurrentProcess;
- (void)requestSystemApertureSceneInvalidationWithIdentityToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startServer;
@end

@implementation SBSSystemApertureScenePresentationSessionServer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.system-aperture-scene-request-service";
}

+ (SBSSystemApertureScenePresentationSessionServer)activeInstance
{
  id WeakRetained = objc_loadWeakRetained(&SBSSystemApertureScenePresentationSessionServerActiveInstance);
  return (SBSSystemApertureScenePresentationSessionServer *)WeakRetained;
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBSSystemApertureScenePresentationSessionServer_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_22 != -1) {
    dispatch_once(&interface_onceToken_22, block);
  }
  v2 = (void *)interface___interface_21;
  return (BSServiceInterface *)v2;
}

void __60__SBSSystemApertureScenePresentationSessionServer_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F50B98];
  v2 = [*(id *)(a1 + 32) identifier];
  id v6 = [v1 interfaceWithIdentifier:v2];

  v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF67078];
  [v6 setServer:v3];
  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_21;
  interface___interface_21 = v4;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

- (SBSSystemApertureScenePresentationSessionServer)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSSystemApertureScenePresentationSessionServer;
  v5 = [(SBSSystemApertureScenePresentationSessionServer *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_connectionsLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sceneConnections = v6->_sceneConnections;
    v6->_sceneConnections = v7;
  }
  return v6;
}

- (void)startServer
{
  if (!self->_connectionListener)
  {
    objc_storeWeak(&SBSSystemApertureScenePresentationSessionServerActiveInstance, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__SBSSystemApertureScenePresentationSessionServer_startServer__block_invoke;
    v5[3] = &unk_1E566D910;
    v5[4] = self;
    v3 = [MEMORY[0x1E4F50BC8] listenerWithConfigurator:v5];
    connectionListener = self->_connectionListener;
    self->_connectionListener = v3;

    [(BSServiceConnectionListener *)self->_connectionListener activate];
  }
}

void __62__SBSSystemApertureScenePresentationSessionServer_startServer__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.frontboard"];
  v3 = +[SBSSystemApertureScenePresentationSessionServer identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(BSServiceConnectionListener *)self->_connectionListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSSystemApertureScenePresentationSessionServer;
  [(SBSSystemApertureScenePresentationSessionServer *)&v3 dealloc];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 remoteProcess];
  int v12 = [v11 hasEntitlement:@"com.apple.springboard.requestSystemApertureScene"];

  if (v12)
  {
    objc_initWeak(&location, self);
    v13 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_impl(&dword_18FBC5000, v13, OS_LOG_TYPE_DEFAULT, "SBSSystemApertureScenePresentationSessionServer received connection %@", buf, 0xCu);
    }

    [(SBSSystemApertureScenePresentationSessionServer *)self _addConnection:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke;
    v15[3] = &unk_1E566B438;
    v15[4] = self;
    objc_copyWeak(&v16, &location);
    [v9 configureConnection:v15];
    [v9 activate];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v14 = SBLogSystemApertureHosting();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SBSSystemApertureScenePresentationSessionServer listener:didReceiveConnection:withContext:](v9, v14);
    }

    [v9 invalidate];
  }
}

void __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSSystemApertureScenePresentationSessionServer serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[SBSSystemApertureScenePresentationSessionServer interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E566D938;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
}

void __93__SBSSystemApertureScenePresentationSessionServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogSystemApertureHosting();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "SBSSystemApertureScenePresentationSessionServer invalidated connection %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeConnection:v3];
}

- (void)requestSystemApertureSceneForCurrentProcess
{
  id v3 = [FBSSceneClientIdentity localIdentity];
  id v2 = v3;
  BSDispatchMain();
}

void __94__SBSSystemApertureScenePresentationSessionServer_requestSystemApertureSceneForCurrentProcess__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  id v2 = (id)[v3 sceneCreationRequestServer:*(void *)(a1 + 32) didReceiveRequestForSystemApertureSceneWithClientIdentity:*(void *)(a1 + 40)];
}

- (void)requestSystemApertureSceneInvalidationWithIdentityToken:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __107__SBSSystemApertureScenePresentationSessionServer_requestSystemApertureSceneInvalidationWithIdentityToken___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sceneCreationRequestServer:*(void *)(a1 + 32) invalidateSceneElement:*(void *)(a1 + 40)];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _removeConnection:v3];
  [v3 invalidate];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)requestSystemApertureScene:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F50BA0] currentContext];
  v5 = [v4 remoteProcess];
  int v6 = [MEMORY[0x1E4F963F8] identifierWithPid:[v5 pid]];
  id v7 = [MEMORY[0x1E4F963E8] handleForIdentifier:v6 error:0];
  uint64_t v8 = [v7 identity];
  id v9 = [FBSSceneClientIdentity identityForProcessIdentity:v8];
  v13 = v4;
  v14 = v3;
  id v10 = v3;
  id v11 = v4;
  id v12 = v9;
  BSDispatchMain();
}

void __78__SBSSystemApertureScenePresentationSessionServer_requestSystemApertureScene___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 sceneCreationRequestServer:*(void *)(a1 + 32) didReceiveRequestForSystemApertureSceneWithClientIdentity:*(void *)(a1 + 40)];

  [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 48) forKey:v3];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_connectionsLock);
    connectionsLock_connections = self->_connectionsLock_connections;
    if (connectionsLock_connections)
    {
      [(NSMutableSet *)connectionsLock_connections addObject:v8];
    }
    else
    {
      int v6 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
      id v7 = self->_connectionsLock_connections;
      self->_connectionsLock_connections = v6;
    }
    os_unfair_lock_unlock(&self->_connectionsLock);
    id v4 = v8;
  }
}

- (void)_removeConnection:(id)a3
{
  if (a3)
  {
    p_connectionsLock = &self->_connectionsLock;
    id v5 = a3;
    os_unfair_lock_lock(p_connectionsLock);
    [(NSMutableSet *)self->_connectionsLock_connections removeObject:v5];

    if (![(NSMutableSet *)self->_connectionsLock_connections count])
    {
      connectionsLock_connections = self->_connectionsLock_connections;
      self->_connectionsLock_connections = 0;
    }
    os_unfair_lock_unlock(p_connectionsLock);
  }
}

- (SBSSystemApertureScenePresentationSessionServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSSystemApertureScenePresentationSessionServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneConnections, 0);
  objc_storeStrong((id *)&self->_connectionsLock_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 remoteProcess];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "Unauthorized process %{public}@ attempted to request system aperture scene.", (uint8_t *)&v4, 0xCu);
}

@end