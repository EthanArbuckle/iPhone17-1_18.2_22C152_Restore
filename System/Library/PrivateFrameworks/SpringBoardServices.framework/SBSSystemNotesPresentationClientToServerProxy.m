@interface SBSSystemNotesPresentationClientToServerProxy
- (SBSSystemNotesPresentationServerToClientInterface)delegate;
- (void)_setupAndActivateConnection;
- (void)activateConfiguration:(id)a3;
- (void)invalidate;
- (void)presentWithConfiguration:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBSSystemNotesPresentationClientToServerProxy

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)activateConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_requestedConfiguration, a3);
  id v5 = a3;
  requestedConfiguration = self->_requestedConfiguration;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke;
  v7[3] = &unk_1E566B570;
  v7[4] = self;
  [(SBSSystemNotesPresentationConfiguration *)requestedConfiguration prepareForXPCCall:v7];
}

void __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = SBLogSystemNotes();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }

    WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [WeakRetained configuration:*(void *)(*(void *)(a1 + 32) + 24) didInvalidateWithError:v3];
  }
  else
  {
    [*(id *)(a1 + 32) _setupAndActivateConnection];
    WeakRetained = [*(id *)(*(void *)(a1 + 32) + 8) remoteTarget];
    [WeakRetained activateConfiguration:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  [MEMORY[0x1E4F28B00] currentHandler:a3, a4];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"SBSSystemNotesPresentationClientToServerProxy.m" lineNumber:49 description:@"deprecated method that should be called via SBSSystemNotesPresentationRequest"];
}

- (void)_setupAndActivateConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_requestedConfiguration)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBSSystemNotesPresentationClientToServerProxy.m" lineNumber:55 description:@"expected to have a _requestedConfiguration by activation"];
  }
  if (self->_connection)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBSSystemNotesPresentationClientToServerProxy.m", 56, @"_activateConnection called but we already have a connection: %@", self->_connection object file lineNumber description];
  }
  if (self->_connectionQueue)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBSSystemNotesPresentationClientToServerProxy.m", 57, @"_activateConnection called but we already have a connection queue: %@", self->_connectionQueue object file lineNumber description];
  }
  v4 = (void *)MEMORY[0x1E4F50BB8];
  id v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
  id v6 = +[SBSSystemNotesPresentationServiceInterfaceSpecification identifier];
  v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SpringBoardServices.SBSSystemNotesPresentationRequest.connectionQueue", v8);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v9;

  v11 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
  connection = self->_connection;
  self->_connection = v11;

  v13 = self->_connection;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke;
  v19[3] = &unk_1E566B118;
  v19[4] = self;
  [(BSServiceConnection *)v13 configureConnection:v19];
  v14 = SBLogSystemNotes();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_connection;
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    _os_log_impl(&dword_18FBC5000, v14, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  [(BSServiceConnection *)self->_connection activate];
}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSSystemNotesPresentationServiceInterfaceSpecification interface];
  [v3 setInterface:v4];

  id v5 = +[SBSSystemNotesPresentationServiceInterfaceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [v3 setInterfaceTarget:WeakRetained];

  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  [v3 setActivationHandler:&__block_literal_global_7];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19;
  v7[3] = &unk_1E566B0F0;
  objc_copyWeak(&v8, &location);
  [v3 setInvalidationHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = SBLogSystemNotes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_18FBC5000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = SBLogSystemNotes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)WeakRetained + 4);
    [v7 configuration:v6[3] didInvalidateWithError:0];
  }
}

- (SBSSystemNotesPresentationServerToClientInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSSystemNotesPresentationServerToClientInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestedConfiguration, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "Failed to prepare SBSSystemNotesPresentationConfiguration for XPC call. request: %{public}@; error: %{public}@",
    (uint8_t *)&v4,
    0x16u);
}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_19_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "Received invalidation for connection: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end