@interface SBSmartCoverService
- (SBSmartCoverService)initWithInitialState:(int64_t)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setWantsSmartCoverStateChanges:(id)a3;
- (void)smartCoverStateDidChange:(int64_t)a3;
@end

@implementation SBSmartCoverService

- (SBSmartCoverService)initWithInitialState:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SBSmartCoverService;
  v4 = [(SBSmartCoverService *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_lastSmartCoverState = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    connections = v5->_connections;
    v5->_connections = (NSMutableSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    observingConnections = v5->_observingConnections;
    v5->_observingConnections = (NSMutableSet *)v8;

    v10 = (void *)MEMORY[0x1E4F628A0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__SBSmartCoverService_initWithInitialState___block_invoke;
    v15[3] = &unk_1E6AF58F0;
    v11 = v5;
    v16 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v15];
    id v13 = v11[1];
    v11[1] = (id)v12;

    [v11[1] activate];
  }
  return v5;
}

void __44__SBSmartCoverService_initWithInitialState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.frontboard"];
  [v3 setService:@"com.apple.springboard.smart-cover"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

- (void)smartCoverStateDidChange:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_lastSmartCoverState != a3)
  {
    self->_lastSmartCoverState = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = self->_observingConnections;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "remoteTarget", (void)v11);
          v10 = [NSNumber numberWithInteger:a3];
          [v9 observeSmartCoverStateDidChange:v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.springboard.smartCoverObserving"];

  if (v8)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    long long v13 = __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke;
    long long v14 = &unk_1E6AFD478;
    v15 = self;
    id v9 = v6;
    id v16 = v9;
    [v9 configureConnection:&v11];
    -[NSMutableSet addObject:](self->_connections, "addObject:", v9, v11, v12, v13, v14, v15);
    [v9 activate];
  }
  else
  {
    v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBSmartCoverService listener:didReceiveConnection:withContext:](v10);
    }

    [v6 invalidate];
  }
}

void __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FA6BF8];
  id v4 = a2;
  uint64_t v5 = [v3 interface];
  [v4 setInterface:v5];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4F628B0] userInitiated];
  [v4 setServiceQuality:v6];

  [v4 setTargetQueue:MEMORY[0x1E4F14428]];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E6AFD8D0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  [v4 setInvalidationHandler:v9];
}

void __65__SBSmartCoverService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) remoteProcess];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBSmartCoverService: connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) removeObject:v3];
  [*(id *)(*(void *)(a1 + 40) + 16) removeObject:v3];
}

- (void)setWantsSmartCoverStateChanges:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F62880];
  id v5 = a3;
  int v6 = [v4 currentContext];
  int v7 = [v5 BOOLValue];

  int v8 = [(NSMutableSet *)self->_observingConnections containsObject:v6];
  if (v7)
  {
    if ((v8 & 1) == 0)
    {
      id v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v6 remoteProcess];
        int v15 = 138543362;
        id v16 = v10;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBSmartCoverService: observer added: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      [(NSMutableSet *)self->_observingConnections addObject:v6];
      uint64_t v11 = [v6 remoteTarget];
      uint64_t v12 = [NSNumber numberWithInteger:self->_lastSmartCoverState];
      [v11 observeSmartCoverStateDidChange:v12];
    }
  }
  else if (v8)
  {
    long long v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v6 remoteProcess];
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "SBSmartCoverService: observer removed: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    [(NSMutableSet *)self->_observingConnections removeObject:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log didReceiveConnection:withContext:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  v2 = @"com.apple.springboard.smartCoverObserving";
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBSmartCoverService: requires entitlement %{public}@", (uint8_t *)&v1, 0xCu);
}

@end