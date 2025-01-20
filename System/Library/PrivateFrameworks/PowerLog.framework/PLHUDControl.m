@interface PLHUDControl
- (BOOL)internalHUDEnabled;
- (BSServiceConnectionClient)connection;
- (id)_hudServer;
- (void)_ensureConnection;
- (void)dealloc;
- (void)internalHUDEnabled;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setInternalHUDEnabled:(BOOL)a3;
@end

@implementation PLHUDControl

- (void)invalidate
{
}

- (void)_ensureConnection
{
  if (!self->_connection)
  {
    v3 = [MEMORY[0x1E4F50BB0] endpointForMachName:@"com.apple.internal.PerfPowerHUD.service" service:@"com.apple.internal.PerfPowerHUD.service.hudctl" instance:0];
    v4 = [MEMORY[0x1E4F50B90] interfaceWithIdentifier:@"com.apple.internal.PerfPowerHUD.service.hudctl"];
    v5 = [MEMORY[0x1E4F4F7B0] protocolForProtocol:&unk_1EF455490];
    [v4 setClient:v5];

    v6 = [MEMORY[0x1E4F4F7B0] protocolForProtocol:&unk_1EF4554F0];
    [v4 setServer:v6];

    [v4 setClientMessagingExpectation:0];
    objc_initWeak(&location, self);
    v7 = [MEMORY[0x1E4F50BA8] connectionWithEndpoint:v3];
    connection = self->_connection;
    self->_connection = v7;

    v9 = self->_connection;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __33__PLHUDControl__ensureConnection__block_invoke;
    v14 = &unk_1E5A46328;
    id v10 = v4;
    id v15 = v10;
    v16 = self;
    objc_copyWeak(&v17, &location);
    [(BSServiceConnectionClient *)v9 configureConnection:&v11];
    [(BSServiceConnectionClient *)self->_connection activate];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
}

void __33__PLHUDControl__ensureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v4 = [MEMORY[0x1E4F50BD8] userInitiated];
  [v3 setServiceQuality:v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PLHUDControl__ensureConnection__block_invoke_2;
  v5[3] = &unk_1E5A46300;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v3 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
}

void __33__PLHUDControl__ensureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __33__PLHUDControl__ensureConnection__block_invoke_2_cold_1((uint64_t)v3);
    }
    v5 = [WeakRetained connection];
    [v5 invalidate];

    [WeakRetained setConnection:0];
  }
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLHUDControl;
  [(PLHUDControl *)&v3 dealloc];
}

- (id)_hudServer
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [(PLHUDControl *)self _ensureConnection];
  connection = self->_connection;
  v4 = [MEMORY[0x1E4F96360] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  return v6;
}

- (BOOL)internalHUDEnabled
{
  v2 = [(PLHUDControl *)self _hudServer];
  id v6 = 0;
  char v3 = [v2 isHUDVisibleWithError:&v6];
  id v4 = v6;

  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PLHUDControl internalHUDEnabled]((uint64_t)v4);
  }

  return v3;
}

- (void)setInternalHUDEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLHUDControl *)self _hudServer];
  v5 = [NSNumber numberWithBool:v3];
  id v7 = 0;
  [v4 setHUDVisible:v5 withError:&v7];
  id v6 = v7;

  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PLHUDControl setInternalHUDEnabled:](v3, (uint64_t)v6);
  }
}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __33__PLHUDControl__ensureConnection__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "HUD: Invalidated/Interrupted connection %@", (uint8_t *)&v1, 0xCu);
}

- (void)internalHUDEnabled
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "HUD: service encountered error when querying state %@", (uint8_t *)&v1, 0xCu);
}

- (void)setInternalHUDEnabled:(char)a1 .cold.1(char a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = a1 & 1;
  __int16 v3 = 2112;
  uint64_t v4 = a2;
  _os_log_error_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "HUD: service encountered error when setting enabled:%d %@", (uint8_t *)v2, 0x12u);
}

@end