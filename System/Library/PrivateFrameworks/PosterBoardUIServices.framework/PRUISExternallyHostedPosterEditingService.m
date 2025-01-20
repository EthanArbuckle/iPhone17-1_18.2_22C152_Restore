@interface PRUISExternallyHostedPosterEditingService
+ (BOOL)isExternalEditingSupported;
+ (id)editingRequestForEntryPoint:(id)a3;
- (PRUISExternallyHostedPosterEditingService)init;
- (PRUISExternallyHostedPosterEditingServiceDelegate)delegate;
- (id)_serviceInterfaceWithError:(id *)a3;
- (void)beginEditingWithRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didEndEditingWithResponse:(id)a3;
- (void)init;
- (void)invalidate;
- (void)sendRequestDismissalActionWithRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)willEndEditingWithResponse:(id)a3;
@end

@implementation PRUISExternallyHostedPosterEditingService

+ (BOOL)isExternalEditingSupported
{
  v2 = [MEMORY[0x263F29CA0] sharedInstance];
  BOOL v3 = [v2 deviceClass] == 2;

  return v3;
}

+ (id)editingRequestForEntryPoint:(id)a3
{
  return +[PRUISExternallyHostedPosterEntryPointWrapper wrapperWithEntryPoint:a3];
}

- (PRUISExternallyHostedPosterEditingService)init
{
  v20.receiver = self;
  v20.super_class = (Class)PRUISExternallyHostedPosterEditingService;
  v2 = [(PRUISExternallyHostedPosterEditingService *)&v20 init];
  if (v2)
  {
    BOOL v3 = PRUISExternallyHostedPosterEditingServiceInterface();
    v4 = (void *)MEMORY[0x263F3F400];
    v5 = [v3 identifier];
    v6 = [v4 endpointForMachName:@"com.apple.posterboardui.services" service:v5 instance:0];

    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    if (v6)
    {
      uint64_t v9 = [MEMORY[0x263F3F3F8] connectionWithEndpoint:v6];
      serviceConnection = v2->_serviceConnection;
      v2->_serviceConnection = (BSServiceConnectionClient *)v9;

      objc_initWeak(&location, v2);
      v11 = v2->_serviceConnection;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __49__PRUISExternallyHostedPosterEditingService_init__block_invoke;
      v14[3] = &unk_26546BFE0;
      id v15 = v3;
      v16 = v2;
      id v17 = v8;
      objc_copyWeak(&v18, &location);
      [(BSServiceConnectionClient *)v11 configureConnection:v14];
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    else
    {
      v12 = PRUISLogRemoteEditing();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(PRUISExternallyHostedPosterEditingService *)(uint64_t)v8 init];
      }
    }
  }
  return v2;
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v4 = PRUISDefaultServiceQuality();
  [v3 setServiceQuality:v4];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_2;
  v8[3] = &unk_26546BF90;
  id v9 = *(id *)(a1 + 48);
  objc_copyWeak(&v10, (id *)(a1 + 56));
  [v3 setInterruptionHandler:v8];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4;
  v5[3] = &unk_26546BFB8;
  id v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v10);
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    id v8 = WeakRetained;
    _os_log_impl(&dword_25A03F000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> interrupted", (uint8_t *)&v5, 0x16u);
  }
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4(uint64_t a1)
{
  v2 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4_cold_1(a1);
  }
}

- (void)dealloc
{
  [(PRUISExternallyHostedPosterEditingService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRUISExternallyHostedPosterEditingService;
  [(PRUISExternallyHostedPosterEditingService *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)willEndEditingWithResponse:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = v4;
  id v5 = v4;
  id v6 = WeakRetained;
  BSDispatchMain();
}

uint64_t __72__PRUISExternallyHostedPosterEditingService_willEndEditingWithResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willEndEditingWithResponse:*(void *)(a1 + 40)];
}

- (void)didEndEditingWithResponse:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = v4;
  id v5 = v4;
  id v6 = WeakRetained;
  BSDispatchMain();
}

uint64_t __71__PRUISExternallyHostedPosterEditingService_didEndEditingWithResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndEditingWithResponse:*(void *)(a1 + 40)];
}

- (void)beginEditingWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PRUISExternallyHostedPosterEditingService.m", 95, @"Invalid parameter not satisfying: %@", @"editingRequest" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PRUISExternallyHostedPosterEditingService.m", 96, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PRUISExternallyHostedPosterEditingService.m" lineNumber:99 description:@"editing request must be the appropriate concrete type"];
  }
  id v12 = v7;
  id v23 = 0;
  v13 = [(PRUISExternallyHostedPosterEditingService *)self _serviceInterfaceWithError:&v23];
  id v14 = v23;
  if (v13)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke;
    v20[3] = &unk_26546C008;
    SEL v22 = a2;
    v20[4] = self;
    v21 = v9;
    [v13 beginEditingWithEntryPointWrapper:v12 completion:v20];
  }
  else if (v9)
  {
    ((void (**)(void, id))v9)[2](v9, v14);
  }
  if (v14)
  {
    id v15 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      v25 = v16;
      __int16 v26 = 2114;
      v27 = self;
      __int16 v28 = 2114;
      id v29 = v14;
      _os_log_error_impl(&dword_25A03F000, v15, OS_LOG_TYPE_ERROR, "calling %{public}@ on %{public}@, error: %{public}@", buf, 0x20u);
    }
  }
}

void __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PRUISLogRemoteEditing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke_cold_1(a1, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sendRequestDismissalActionWithRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PRUISExternallyHostedPosterEditingService.m", 118, @"Invalid parameter not satisfying: %@", @"editingRequest" object file lineNumber description];
  }
  id v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PRUISExternallyHostedPosterEditingService.m" lineNumber:120 description:@"editing request must be the appropriate concrete type"];
  }
  id v8 = v5;
  id v15 = 0;
  uint64_t v9 = [(PRUISExternallyHostedPosterEditingService *)self _serviceInterfaceWithError:&v15];
  id v10 = v15;
  if (v9) {
    [v9 sendRequestDismissalActionWithEntryPointWrapper:v8];
  }
  if (v10)
  {
    v11 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543874;
      id v17 = v12;
      __int16 v18 = 2114;
      v19 = self;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_error_impl(&dword_25A03F000, v11, OS_LOG_TYPE_ERROR, "calling %{public}@ on %{public}@, error: %{public}@", buf, 0x20u);
    }
  }
}

- (id)_serviceInterfaceWithError:(id *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  p_serviceConnection = &self->_serviceConnection;
  [(BSServiceConnectionClient *)self->_serviceConnection activate];
  id v5 = *p_serviceConnection;
  id v6 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v14[0] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v8 = [(BSServiceConnectionClient *)v5 remoteTargetWithLaunchingAssertionAttributes:v7];

  if (!v8)
  {
    uint64_t v9 = PRUISLogRemoteEditing();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PRUISExternallyHostedPosterEditingService _serviceInterfaceWithError:]();
    }

    if (a3)
    {
      id v10 = (void *)MEMORY[0x263F087E8];
      v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *a3 = [v10 errorWithDomain:v12 code:1 userInfo:0];
    }
  }

  return v8;
}

- (PRUISExternallyHostedPosterEditingServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PRUISExternallyHostedPosterEditingServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A03F000, log, OS_LOG_TYPE_ERROR, "%{public}@:%p> failed to lookup endpoint", (uint8_t *)&v3, 0x16u);
}

void __49__PRUISExternallyHostedPosterEditingService_init__block_invoke_4_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  OUTLINED_FUNCTION_1_3(&dword_25A03F000, v1, v2, "<%{public}@:%p> remotely invalidated", v3, v4, v5, v6, 2u);
}

void __80__PRUISExternallyHostedPosterEditingService_beginEditingWithRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_25A03F000, a2, OS_LOG_TYPE_DEBUG, "received reply to %{public}@ on %{public}@", v4, 0x16u);
}

- (void)_serviceInterfaceWithError:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_25A03F000, v2, v3, "%{public}@ failed to create proxy for connection: %{public}@", v4, v5, v6, v7, v8);
}

@end