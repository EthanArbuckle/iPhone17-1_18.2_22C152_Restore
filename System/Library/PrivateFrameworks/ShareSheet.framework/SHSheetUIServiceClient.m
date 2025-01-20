@interface SHSheetUIServiceClient
- (BOOL)isConnected;
- (BSServiceConnection)connection;
- (NSString)sessionIdentifier;
- (SHSheetContentPresenter)presenter;
- (SHSheetUIServiceClient)initWithSessionIdentifier:(id)a3;
- (SHSheetUIServiceClientContext)currentContext;
- (id)sessionServer;
- (int64_t)pendingRequest;
- (int64_t)state;
- (void)_activateConnection;
- (void)_didActivateConnection;
- (void)_didInvalidateConnection;
- (void)_reconnect;
- (void)_setupNewConnection;
- (void)connect;
- (void)invalidate;
- (void)setCurrentContext:(id)a3;
- (void)setPendingRequest:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)updateWithContext:(id)a3;
@end

@implementation SHSheetUIServiceClient

- (SHSheetUIServiceClient)initWithSessionIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetUIServiceClient;
  v5 = [(SHSheetUIServiceClient *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    [(SHSheetUIServiceClient *)v5 _setupNewConnection];
  }

  return v5;
}

- (void)_setupNewConnection
{
  if (_setupNewConnection_onceToken != -1) {
    dispatch_once(&_setupNewConnection_onceToken, &__block_literal_global_28);
  }
  v3 = [MEMORY[0x1E4F62888] endpointForMachName:@"com.apple.sharinguiservice.services" service:@"com.apple.sharinguiservice.sharesheet-service" instance:0];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v3];
    connection = self->_connection;
    self->_connection = v4;

    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v6 = self->_connection;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    objc_super v9 = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_2;
    v10 = &unk_1E5A22D68;
    objc_copyWeak(&v11, &location);
    [(BSServiceConnection *)v6 configureConnection:&v7];
    [(SHSheetUIServiceClient *)self _activateConnection];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke()
{
  id v3 = [MEMORY[0x1E4F62858] interfaceWithIdentifier:@"com.apple.sharinguiservice.sharesheet-service"];
  v0 = [MEMORY[0x1E4F62868] protocolForProtocol:&unk_1EF3A5258];
  [v3 setServer:v0];

  uint64_t v1 = [v3 copy];
  v2 = (void *)_setupNewConnection___interface;
  _setupNewConnection___interface = v1;
}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F628B0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:_setupNewConnection___interface];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_3;
  v9[3] = &unk_1E5A22D40;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  [v3 setActivationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_4;
  v7[3] = &unk_1E5A22D40;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  [v3 setInterruptionHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_5;
  v5[3] = &unk_1E5A22D40;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didActivateConnection];
}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reconnect];
}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didInvalidateConnection];
}

- (id)sessionServer
{
  v2 = [(SHSheetUIServiceClient *)self connection];
  id v3 = [v2 remoteTarget];

  return v3;
}

- (BOOL)isConnected
{
  return [(SHSheetUIServiceClient *)self state] == 2;
}

- (void)connect
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Connect UI Service", buf, 2u);
  }

  if ([(SHSheetUIServiceClient *)self isConnected])
  {
    id v4 = [(SHSheetUIServiceClient *)self sessionServer];
    v5 = [(SHSheetUIServiceClient *)self sessionIdentifier];
    [v4 connectWithSessionIdentifier:v5];
  }
  else
  {
    id v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Current connection is not activated yet.", v7, 2u);
    }

    [(SHSheetUIServiceClient *)self setPendingRequest:[(SHSheetUIServiceClient *)self pendingRequest] | 1];
  }
}

- (void)updateWithContext:(id)a3
{
  id v4 = a3;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Request UI Service update", buf, 2u);
  }

  [(SHSheetUIServiceClient *)self setCurrentContext:v4];
  if ([(SHSheetUIServiceClient *)self isConnected])
  {
    id v6 = [(SHSheetUIServiceClient *)self sessionServer];
    [v6 updateWithContext:v4];
  }
  else
  {
    uint64_t v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Current connection is not activated yet.", v8, 2u);
    }

    [(SHSheetUIServiceClient *)self setPendingRequest:[(SHSheetUIServiceClient *)self pendingRequest] | 2];
  }
}

- (void)invalidate
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate UI Service connection", v5, 2u);
  }

  id v4 = [(SHSheetUIServiceClient *)self connection];
  [v4 invalidate];
}

- (void)_activateConnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHSheetUIServiceClient *)self connection];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Activate UI Service connection:%@", (uint8_t *)&v6, 0xCu);
  }
  if ([(SHSheetUIServiceClient *)self state] != 1)
  {
    [(SHSheetUIServiceClient *)self setState:1];
    v5 = [(SHSheetUIServiceClient *)self connection];
    [v5 activate];
  }
}

- (void)_reconnect
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHSheetUIServiceClient *)self connection];
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Reconnect UI Service connection:%@", (uint8_t *)&v5, 0xCu);
  }
  [(SHSheetUIServiceClient *)self setPendingRequest:[(SHSheetUIServiceClient *)self pendingRequest] | 1];
  [(SHSheetUIServiceClient *)self setPendingRequest:[(SHSheetUIServiceClient *)self pendingRequest] | 2];
  [(SHSheetUIServiceClient *)self _activateConnection];
}

- (void)_didActivateConnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHSheetUIServiceClient *)self connection];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "UI Service Connection was activated:%@", (uint8_t *)&v6, 0xCu);
  }
  [(SHSheetUIServiceClient *)self setState:2];
  if ([(SHSheetUIServiceClient *)self pendingRequest]) {
    [(SHSheetUIServiceClient *)self connect];
  }
  if (([(SHSheetUIServiceClient *)self pendingRequest] & 2) != 0)
  {
    int v5 = [(SHSheetUIServiceClient *)self currentContext];
    [(SHSheetUIServiceClient *)self updateWithContext:v5];
  }
  [(SHSheetUIServiceClient *)self setPendingRequest:0];
}

- (void)_didInvalidateConnection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHSheetUIServiceClient *)self connection];
    int v5 = 138412290;
    int v6 = v4;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "UI Service Connection was invalidated:%@", (uint8_t *)&v5, 0xCu);
  }
  [(SHSheetUIServiceClient *)self setState:0];
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SHSheetContentPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SHSheetContentPresenter *)WeakRetained;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(int64_t)a3
{
  self->_pendingRequest = a3;
}

- (SHSheetUIServiceClientContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end