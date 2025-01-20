@interface SBSCardItemsController
- (SBSCardItemsController)initWithIdentifier:(id)a3;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (void)_connectToServerIfNecessary;
- (void)_invalidateConnection;
- (void)_noteConnectionDropped;
- (void)dealloc;
- (void)getCardItemsWithHandler:(id)a3;
- (void)setCardItems:(id)a3;
@end

@implementation SBSCardItemsController

- (SBSCardItemsController)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSCardItemsController;
  v5 = [(SBSCardItemsController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(SBSCardItemsController *)self _invalidateConnection];
  v3.receiver = self;
  v3.super_class = (Class)SBSCardItemsController;
  [(SBSCardItemsController *)&v3 dealloc];
}

- (void)setCardItems:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogWallet();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = [v4 count];
    _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "Set %ld SBSCardItems", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(SBSCardItemsController *)self _remoteInterfaceWithErrorHandler:&__block_literal_global_37];
  [v6 setCardItems:v4 forControllerWithIdentifier:self->_identifier];
}

void __39__SBSCardItemsController_setCardItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = SBLogWallet();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __39__SBSCardItemsController_setCardItems___block_invoke_cold_1();
  }
}

- (void)getCardItemsWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = SBLogWallet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FBC5000, v5, OS_LOG_TYPE_INFO, "Get SBSCardItems", buf, 2u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke;
    v11[3] = &unk_1E566B488;
    id v6 = v4;
    id v12 = v6;
    int v7 = [(SBSCardItemsController *)self _remoteInterfaceWithErrorHandler:v11];
    identifier = self->_identifier;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_175;
    v9[3] = &unk_1E566D3E8;
    id v10 = v6;
    [v7 getCardItemsForControllerWithIdentifier:identifier withHandler:v9];
  }
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogWallet();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_175(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v7 = SBLogWallet();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = [v5 count];
      _os_log_impl(&dword_18FBC5000, v7, OS_LOG_TYPE_INFO, "Got %ld SBSCardItems", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v9 = SBLogWallet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_175_cold_1((uint64_t)v5, v9);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  [(SBSCardItemsController *)self _connectToServerIfNecessary];
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke;
  v9[3] = &unk_1E566B488;
  id v10 = v4;
  id v6 = v4;
  int v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogWallet();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)_connectToServerIfNecessary
{
  if (!self->_connected)
  {
    [(SBSCardItemsController *)self _invalidateConnection];
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.springboard.carditemscontroller" options:0];
    connection = self->_connection;
    self->_connection = v3;

    uint64_t v5 = self->_connection;
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDF660F0];
    [(NSXPCConnection *)v5 setExportedInterface:v6];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    int v7 = self->_connection;
    uint64_t v8 = SBCardItemsControllerServerInterface();
    [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __53__SBSCardItemsController__connectToServerIfNecessary__block_invoke;
    v13 = &unk_1E566D410;
    objc_copyWeak(&v14, &location);
    uint64_t v9 = (void *)MEMORY[0x192FC0DF0](&v10);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v9, v10, v11, v12, v13);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v9];
    [(NSXPCConnection *)self->_connection resume];
    self->_connected = 1;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __53__SBSCardItemsController__connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _noteConnectionDropped];
}

- (void)_noteConnectionDropped
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "SBSCardItems XPC connection dropped", v1, 2u);
}

- (void)_invalidateConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;

    self->_connected = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __39__SBSCardItemsController_setCardItems___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "Setting SBSCardItems failed with error %{pubic}@", v2, v3, v4, v5, v6);
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "Getting SBSCardItems failed with error %{pubic}@", v2, v3, v4, v5, v6);
}

void __50__SBSCardItemsController_getCardItemsWithHandler___block_invoke_175_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  id v4 = v3;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "Got unexpected type %{public}@ of SBSCardItems", v5, 0xCu);
}

void __59__SBSCardItemsController__remoteInterfaceWithErrorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_18FBC5000, v0, v1, "SBSCardItems XPC message failed: %{public}@", v2, v3, v4, v5, v6);
}

@end