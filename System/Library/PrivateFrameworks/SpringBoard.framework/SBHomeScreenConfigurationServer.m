@interface SBHomeScreenConfigurationServer
- (SBHomeScreenConfigurationServer)init;
- (id)configurationSessionConnection;
- (id)delegate;
- (id)makeErrorWithCode:(void *)a1;
- (id)setConfigurationSessionConnection:(id *)result;
- (id)setDelegate:(id *)result;
- (uint64_t)activate;
- (uint64_t)authenticator;
- (uint64_t)connections;
- (uint64_t)listener;
- (uint64_t)queue;
- (void)applyConfiguration:(id)a3 completion:(id)a4;
- (void)beginConfigurationSessionWithCompletion:(id)a3;
- (void)endConfigurationSessionWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeConnection:(uint64_t)a1;
@end

@implementation SBHomeScreenConfigurationServer

- (SBHomeScreenConfigurationServer)init
{
  v17.receiver = self;
  v17.super_class = (Class)SBHomeScreenConfigurationServer;
  v2 = [(SBHomeScreenConfigurationServer *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.home-screen-configuration"];
    authenticator = v2->_authenticator;
    v2->_authenticator = (FBServiceClientAuthenticator *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SpringBoard.SBHomeScreenConfigurationServer.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v8;

    v10 = (void *)MEMORY[0x1E4F628A0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__SBHomeScreenConfigurationServer_init__block_invoke;
    v15[3] = &unk_1E6AF58F0;
    v11 = v2;
    v16 = v11;
    uint64_t v12 = [v10 listenerWithConfigurator:v15];
    listener = v11->_listener;
    v11->_listener = (BSServiceConnectionListener *)v12;
  }
  return v2;
}

void __39__SBHomeScreenConfigurationServer_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4FA6AB0];
  id v6 = a2;
  v4 = [v3 domain];
  [v6 setDomain:v4];

  v5 = [MEMORY[0x1E4FA6AB0] identifier];
  [v6 setService:v5];

  [v6 setDelegate:*(void *)(a1 + 32)];
}

- (uint64_t)activate
{
  if (result) {
    return [*(id *)(result + 16) activate];
  }
  return result;
}

- (uint64_t)listener
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 remoteProcess];
  uint64_t v12 = [v11 auditToken];

  if (self)
  {
    v13 = self->_queue;
    objc_initWeak(&location, self);
    authenticator = self->_authenticator;
  }
  else
  {
    v13 = 0;
    authenticator = 0;
    id location = 0;
  }
  v15 = authenticator;
  char v16 = [(FBServiceClientAuthenticator *)v15 authenticateAuditToken:v12];

  if (v16)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke;
    block[3] = &unk_1E6AF5968;
    id v17 = v9;
    id v20 = v17;
    v21 = self;
    objc_copyWeak(&v23, &location);
    v22 = v13;
    dispatch_sync(v22, block);
    [v17 activate];

    objc_destroyWeak(&v23);
  }
  else
  {
    v18 = SBLogHomeScreenConfiguration();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:]((uint64_t)v9, v18);
    }

    [v9 invalidate];
  }
  objc_destroyWeak(&location);
}

- (uint64_t)queue
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)authenticator
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_2;
  id v8 = &unk_1E6AF5940;
  v2 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  [v2 configureConnection:&v5];
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    uint64_t v3 = (void *)v3[5];
  }
  v4 = v3;
  objc_msgSend(v4, "addObject:", *(void *)(a1 + 32), v5, v6, v7, v8, v9);

  objc_destroyWeak(&v12);
}

void __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4FA6AB0] serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = [MEMORY[0x1E4FA6AB0] interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_3;
  uint64_t v9 = &unk_1E6AF5918;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 40);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(a1 + 48), v6, v7, v8, v9);

  objc_destroyWeak(&v11);
}

void __77__SBHomeScreenConfigurationServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = SBLogHomeScreenConfiguration();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Received Connection Invalidation: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[SBHomeScreenConfigurationServer removeConnection:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
}

- (void)removeConnection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    [*(id *)(a1 + 40) removeObject:v6];
    id v3 = v6;
    if (WeakRetained == v6)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 8));
      [v5 configurationServerDidEndConfigurationSession:a1 completion:&__block_literal_global_11];

      id v3 = v6;
    }
  }
}

- (uint64_t)connections
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (id)configurationSessionConnection
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)delegate
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)beginConfigurationSessionWithCompletion:(id)a3
{
  id v11 = (void (**)(id, void))a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = objc_loadWeakRetained((id *)&self->_configurationSessionConnection);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id WeakRetained = 0;
    id v5 = 0;
  }
  id v6 = [MEMORY[0x1E4F62880] currentContext];
  id v7 = v6;
  if (!WeakRetained)
  {
    uint64_t v8 = self;
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (v6 == v5)
  {
    v11[2](v11, 0);
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = self;
      uint64_t v9 = 2;
LABEL_8:
      id v10 = -[SBHomeScreenConfigurationServer makeErrorWithCode:](v8, v9);
      ((void (**)(id, void *))v11)[2](v11, v10);

      goto LABEL_13;
    }
    if (self) {
      objc_storeWeak((id *)&self->_configurationSessionConnection, v6);
    }
    [WeakRetained configurationServerDidBeginConfigurationSession:self completion:v11];
  }
LABEL_13:
}

- (id)makeErrorWithCode:(void *)a1
{
  if (a1)
  {
    a1 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FA6FF8] code:a2 userInfo:0];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)setConfigurationSessionConnection:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 6, a2);
  }
  return result;
}

- (void)applyConfiguration:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = objc_loadWeakRetained((id *)&self->_configurationSessionConnection);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id WeakRetained = 0;
    id v8 = 0;
  }
  uint64_t v9 = [MEMORY[0x1E4F62880] currentContext];
  id v10 = (void *)v9;
  if (WeakRetained)
  {
    if (v8 && v8 == (id)v9)
    {
      [WeakRetained configurationServer:self didReceiveConfiguration:v14 completion:v6];
      goto LABEL_10;
    }
    id v11 = self;
    uint64_t v12 = 1;
  }
  else
  {
    id v11 = self;
    uint64_t v12 = 0;
  }
  v13 = -[SBHomeScreenConfigurationServer makeErrorWithCode:](v11, v12);
  v6[2](v6, v13);

LABEL_10:
}

- (void)endConfigurationSessionWithCompletion:(id)a3
{
  id v11 = (void (**)(id, void *))a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = objc_loadWeakRetained((id *)&self->_configurationSessionConnection);
  }
  else
  {
    dispatch_assert_queue_V2(0);
    id WeakRetained = 0;
    id v5 = 0;
  }
  uint64_t v6 = [MEMORY[0x1E4F62880] currentContext];
  id v7 = (void *)v6;
  if (!WeakRetained)
  {
    id v8 = self;
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (v5)
  {
    if (v5 != (id)v6)
    {
      id v8 = self;
      uint64_t v9 = 1;
LABEL_8:
      id v10 = -[SBHomeScreenConfigurationServer makeErrorWithCode:](v8, v9);
      v11[2](v11, v10);

      goto LABEL_13;
    }
    if (self) {
      objc_storeWeak((id *)&self->_configurationSessionConnection, 0);
    }
    [WeakRetained configurationServerDidEndConfigurationSession:self completion:v11];
  }
  else
  {
    v11[2](v11, 0);
  }
LABEL_13:
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 1, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationSessionConnection);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Connection did not pass entitlement validation: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end