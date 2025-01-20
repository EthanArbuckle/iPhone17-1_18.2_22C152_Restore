@interface URTAlertService
- (BSInvalidatable)domainActivationToken;
- (BSServiceConnectionListener)listener;
- (NSMutableArray)connections;
- (NSString)domain;
- (OS_dispatch_queue)connectionQueue;
- (URTAlertService)initWithDomain:(id)a3;
- (URTAlertServiceDelegate)delegate;
- (URTAlertServiceDelegateProxy)delegateProxy;
- (id)_connectionQueue_alertConnectionForConnection:(id)a3;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_dismissAlert:(id)a3 forConnection:(id)a4;
- (void)_connectionQueue_presentAlert:(id)a3 preferringPresentationStyle:(int64_t)a4 forConnection:(id)a5;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)_performClientActionForAlert:(id)a3 clientAction:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDomainActivationToken:(id)a3;
@end

@implementation URTAlertService

- (URTAlertService)initWithDomain:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)URTAlertService;
  v6 = [(URTAlertService *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domain, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    connections = v7->_connections;
    v7->_connections = (NSMutableArray *)v8;

    v10 = [[URTAlertServiceDelegateProxy alloc] initWithService:v7];
    delegateProxy = v7->_delegateProxy;
    v7->_delegateProxy = v10;

    v12 = [MEMORY[0x263F29C50] serial];
    uint64_t v13 = BSDispatchQueueCreate();
    connectionQueue = v7->_connectionQueue;
    v7->_connectionQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x263F2B9E0];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __34__URTAlertService_initWithDomain___block_invoke;
    v28 = &unk_26479A8E0;
    id v16 = v5;
    id v29 = v16;
    v17 = v7;
    v30 = v17;
    uint64_t v18 = [v15 listenerWithConfigurator:&v25];
    listener = v17->_listener;
    v17->_listener = (BSServiceConnectionListener *)v18;

    v20 = URTLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = v17->_listener;
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl(&dword_2262C3000, v20, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    [(BSServiceConnectionListener *)v17->_listener activate];
    uint64_t v22 = [MEMORY[0x263F2BA00] activateManualDomain:v16];
    domainActivationToken = v17->_domainActivationToken;
    v17->_domainActivationToken = (BSInvalidatable *)v22;
  }
  return v7;
}

void __34__URTAlertService_initWithDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setDomain:v3];
  v4 = +[URTAlertServiceSpecification identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  uint64_t v3 = [(URTAlertService *)self domainActivationToken];
  [v3 invalidate];

  id v4 = [(URTAlertService *)self listener];
  [v4 invalidate];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = URTLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 instance];
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_2262C3000, v7, OS_LOG_TYPE_INFO, "Received connection! %@, reason: %@", buf, 0x16u);
  }
  v9 = [v6 remoteProcess];
  v10 = +[URTAlertServiceSpecification entitlementName];
  v11 = [v9 valueForEntitlement:v10];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(URTAlertService *)self domain],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v11 containsObject:v12],
        v12,
        (v13 & 1) != 0))
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke;
    v20[3] = &unk_26479A930;
    v20[4] = self;
    [v6 configureConnection:v20];
    v14 = URTLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_2262C3000, v14, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
    }

    v15 = [(URTAlertService *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_90;
    block[3] = &unk_26479A958;
    block[4] = self;
    id v16 = v6;
    id v19 = v16;
    dispatch_async(v15, block);

    [v16 activate];
  }
  else
  {
    v17 = URTLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[URTAlertService listener:didReceiveConnection:withContext:](v6, self, v17);
    }

    [v6 invalidate];
  }
}

void __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[URTAlertServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[URTAlertServiceSpecification interface];
  [v3 setInterface:v5];

  id v6 = [*(id *)(a1 + 32) delegateProxy];
  [v3 setInterfaceTarget:v6];

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_2;
  v11 = &unk_26479A908;
  objc_copyWeak(&v12, &location);
  [v3 setInvalidationHandler:&v8];
  v7 = objc_msgSend(*(id *)(a1 + 32), "connectionQueue", v8, v9, v10, v11);
  [v3 setTargetQueue:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_2262C3000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionQueue_removeConnection:", v3);
}

uint64_t __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
}

- (void)_connectionQueue_addConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(URTAlertService *)self connectionQueue];
  BSDispatchQueueAssert();

  int v6 = [[URTAlertConnection alloc] initWithConnection:v4];
  id v7 = [(URTAlertService *)self connections];
  [v7 addObject:v6];

  uint64_t v8 = URTLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(URTAlertService *)self connections];
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = [v9 count];
    _os_log_impl(&dword_2262C3000, v8, OS_LOG_TYPE_INFO, "Added connection %@, connection count: %ld", (uint8_t *)&v10, 0x16u);
  }
}

- (id)_connectionQueue_alertConnectionForConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(URTAlertService *)self connectionQueue];
  BSDispatchQueueAssert();

  int v6 = [(URTAlertService *)self connections];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__URTAlertService__connectionQueue_alertConnectionForConnection___block_invoke;
  v10[3] = &unk_26479A980;
  id v11 = v4;
  id v7 = v4;
  uint64_t v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __65__URTAlertService__connectionQueue_alertConnectionForConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 connection];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_connectionQueue_presentAlert:(id)a3 preferringPresentationStyle:(int64_t)a4 forConnection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(URTAlertService *)self connectionQueue];
  BSDispatchQueueAssert();

  int v10 = [(URTAlertService *)self _connectionQueue_alertConnectionForConnection:v8];
  id v11 = v10;
  if (v10) {
    [v10 setAlert:v7];
  }
  objc_initWeak(location, self);
  objc_initWeak(&from, v7);
  __int16 v12 = [v7 defaultAction];

  if (v12)
  {
    uint64_t v13 = [v7 defaultAction];
    uint64_t v14 = [v13 title];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke;
    v32[3] = &unk_26479A9C8;
    objc_copyWeak(&v33, location);
    objc_copyWeak(&v34, &from);
    v15 = +[URTAlertAction actionWithTitle:v14 handler:v32];
    [v7 setDefaultAction:v15];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
  }
  id v16 = [v7 otherAction];

  if (v16)
  {
    v17 = [v7 otherAction];
    uint64_t v18 = [v17 title];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2;
    v29[3] = &unk_26479A9C8;
    objc_copyWeak(&v30, location);
    objc_copyWeak(&v31, &from);
    id v19 = +[URTAlertAction actionWithTitle:v18 handler:v29];
    [v7 setOtherAction:v19];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
  }
  v20 = [v7 cancelAction];

  if (v20)
  {
    v21 = [v7 cancelAction];
    id v22 = [v21 title];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2_101;
    v26[3] = &unk_26479A9C8;
    objc_copyWeak(&v27, location);
    objc_copyWeak(&v28, &from);
    __int16 v23 = +[URTAlertAction actionWithTitle:v22 handler:v26];
    [v7 setCancelAction:v23];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
  }
  v24 = [(URTAlertService *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v24 alertService:self wantsPresentationForAlert:v7 preferredPresentationStyle:a4];
  }

  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2262C3000, v4, OS_LOG_TYPE_DEFAULT, "Alert: default action \"%@\" tapped", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performClientActionForAlert:v7 clientAction:&__block_literal_global_1];
}

uint64_t __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_95(uint64_t a1, void *a2)
{
  return [a2 handleDefaultAction];
}

void __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2262C3000, v4, OS_LOG_TYPE_DEFAULT, "Alert: other action \"%@\" tapped", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performClientActionForAlert:v7 clientAction:&__block_literal_global_100];
}

uint64_t __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_98(uint64_t a1, void *a2)
{
  return [a2 handleOtherAction];
}

void __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2_101(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = URTLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2262C3000, v4, OS_LOG_TYPE_DEFAULT, "Alert: cancel action \"%@\" tapped", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performClientActionForAlert:v7 clientAction:&__block_literal_global_104];
}

uint64_t __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_102(uint64_t a1, void *a2)
{
  return [a2 handleCancelAction];
}

- (void)_performClientActionForAlert:(id)a3 clientAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(URTAlertService *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke;
  block[3] = &unk_26479A9F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connections];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke_2;
  v10[3] = &unk_26479A980;
  id v11 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "bs_firstObjectPassingTest:", v10);

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = [v3 connection];
      id v6 = [v5 remoteTarget];
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
    }
    int v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = [v3 connection];
    objc_msgSend(v8, "_connectionQueue_dismissAlert:forConnection:", v7, v9);
  }
}

uint64_t __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 alert];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_connectionQueue_dismissAlert:(id)a3 forConnection:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(URTAlertService *)self connectionQueue];
  BSDispatchQueueAssert();

  int v8 = [(URTAlertService *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 alertService:self wantsDismissalForAlert:v11];
  }
  id v9 = [(URTAlertService *)self _connectionQueue_alertConnectionForConnection:v6];
  id v10 = v9;
  if (v9) {
    [v9 setAlert:0];
  }
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(URTAlertService *)self connectionQueue];
  BSDispatchQueueAssert();

  id v6 = [(URTAlertService *)self _connectionQueue_alertConnectionForConnection:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 alert];
    if (v8)
    {
      id v9 = URTLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_2262C3000, v9, OS_LOG_TYPE_INFO, "Dismissing alert due to client disconnection", (uint8_t *)&v15, 2u);
      }

      id v10 = [(URTAlertService *)self delegateProxy];
      [v10 dismissAlert:v8];
    }
    id v11 = [(URTAlertService *)self connections];
    [v11 removeObject:v7];

    id v12 = URTLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [(URTAlertService *)self connections];
      uint64_t v14 = [v13 count];
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2048;
      uint64_t v18 = v14;
      _os_log_impl(&dword_2262C3000, v12, OS_LOG_TYPE_INFO, "Removed connection %@, connection count: %ld", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (URTAlertServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (URTAlertServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (BSInvalidatable)domainActivationToken
{
  return self->_domainActivationToken;
}

- (void)setDomainActivationToken:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (URTAlertServiceDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_domainActivationToken, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 didReceiveConnection:(void *)a2 withContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = [a1 remoteProcess];
  id v6 = +[URTAlertServiceSpecification entitlementName];
  uint64_t v7 = [a2 domain];
  int v8 = 138412802;
  id v9 = v5;
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_error_impl(&dword_2262C3000, a3, OS_LOG_TYPE_ERROR, "Process %@ does not have an array for the alert entitlement %@ that contains the destination %@", (uint8_t *)&v8, 0x20u);
}

@end