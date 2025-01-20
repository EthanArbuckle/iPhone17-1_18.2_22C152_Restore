@interface WFUIPresenterLaunchAngelConnection
- (BOOL)connectionInterrupted;
- (BOOL)isConnected;
- (BSServiceConnectionClient)connection;
- (WFUIPresenterHostInterface)host;
- (WFUIPresenterLaunchAngelConnection)init;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)presenterWithErrorHandler:(id)a3;
- (os_unfair_lock_s)lock;
- (void)cleanUpWithReason:(id)a3;
- (void)dealloc;
- (void)prepareConnectionIfNecessary;
- (void)setConnectionInterrupted:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHost:(id)a3;
- (void)setInterruptionHandler:(id)a3;
@end

@implementation WFUIPresenterLaunchAngelConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (void)setConnectionInterrupted:(BOOL)a3
{
  self->_connectionInterrupted = a3;
}

- (BOOL)connectionInterrupted
{
  return self->_connectionInterrupted;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (WFUIPresenterHostInterface)host
{
  return self->_host;
}

- (BOOL)isConnected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(WFUIPresenterLaunchAngelConnection *)v2 connection];
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)presenterWithErrorHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[WFUIPresenterLaunchAngelConnection presenterWithErrorHandler:]";
    __int16 v15 = 2048;
    CFTimeInterval v16 = CACurrentMediaTime();
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s [Performance] Opening connection to the UI presenter, %f", buf, 0x16u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WFUIPresenterLaunchAngelConnection *)self prepareConnectionIfNecessary];
  [(WFUIPresenterLaunchAngelConnection *)self setErrorHandler:v4];

  v7 = [(WFUIPresenterLaunchAngelConnection *)self connection];
  v8 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v12 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v10 = [v7 remoteTargetWithLaunchingAssertionAttributes:v9];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)prepareConnectionIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v4 = [(WFUIPresenterLaunchAngelConnection *)self connection];
  if (v4
    && (v5 = (void *)v4,
        BOOL v6 = [(WFUIPresenterLaunchAngelConnection *)self connectionInterrupted],
        v5,
        v6))
  {
    v7 = [(WFUIPresenterLaunchAngelConnection *)self connection];
    [v7 activate];

    [(WFUIPresenterLaunchAngelConnection *)self setConnectionInterrupted:0];
  }
  else
  {
    v8 = [(WFUIPresenterLaunchAngelConnection *)self connection];

    if (!v8)
    {
      v9 = [MEMORY[0x1E4F62888] endpointForMachName:@"com.apple.shortcuts.view-service" service:@"com.apple.shortcuts.ui-presenter" instance:0];
      if (!v9)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"WFUIPresenterConnection.m" lineNumber:209 description:@"This process cannot connect to the view service endpoint."];
      }
      v10 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v9];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke;
      v15[3] = &unk_1E6550370;
      v15[4] = self;
      [v10 configureConnection:v15];
      v11 = getWFLaunchAngelLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]";
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel activating", buf, 0xCu);
      }

      [v10 activate];
      connection = self->_connection;
      self->_connection = (BSServiceConnectionClient *)v10;
      id v13 = v10;
    }
  }
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F628B0] userInitiated];
  [v3 setServiceQuality:v4];

  v5 = WFUIPresenterServiceInterface();
  [v3 setInterface:v5];

  BOOL v6 = [*(id *)(a1 + 32) host];
  if (v6) {
    [v3 setInterfaceTarget:v6];
  }
  [v3 setActivationHandler:&__block_literal_global_311];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_312;
  v8[3] = &unk_1E6550348;
  v8[4] = *(void *)(a1 + 32);
  [v3 setInterruptionHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_313;
  v7[3] = &unk_1E6550348;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_312(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = getWFLaunchAngelLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel connection interruption", (uint8_t *)&v9, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  [*(id *)(a1 + 32) setConnectionInterrupted:1];
  id v3 = [*(id *)(a1 + 32) errorHandler];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) errorHandler];
    v5 = WFRunnerFailureErrorMessage(0);
    ((void (**)(void, void *))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setErrorHandler:0];
  }
  BOOL v6 = [*(id *)(a1 + 32) interruptionHandler];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) interruptionHandler];
    v8 = WFRunnerFailureErrorMessage(0);
    ((void (**)(void, void *))v7)[2](v7, v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_313(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  v2 = getWFLaunchAngelLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    BOOL v6 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel connection invalidated", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
}

void __66__WFUIPresenterLaunchAngelConnection_prepareConnectionIfNecessary__block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = getWFLaunchAngelLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    v2 = "-[WFUIPresenterLaunchAngelConnection prepareConnectionIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1C7F0A000, v0, OS_LOG_TYPE_DEFAULT, "%s [Host-side] Launch angel connection activated", (uint8_t *)&v1, 0xCu);
  }
}

- (void)setHost:(id)a3
{
  p_lock = &self->_lock;
  int v5 = (WFUIPresenterHostInterface *)a3;
  os_unfair_lock_lock(p_lock);
  host = self->_host;

  if (host != v5) {
    [(WFUIPresenterLaunchAngelConnection *)self cleanUpWithReason:@"got a new host object, have to set up a bidirectional connection"];
  }
  self->_host = v5;
  os_unfair_lock_unlock(p_lock);
}

- (void)cleanUpWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  int v5 = [(WFUIPresenterLaunchAngelConnection *)self connection];

  connection = getWFLaunchAngelLogObject();
  BOOL v7 = os_log_type_enabled(connection, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 136315394;
      v10 = "-[WFUIPresenterLaunchAngelConnection cleanUpWithReason:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1C7F0A000, connection, OS_LOG_TYPE_DEFAULT, "%s Invalidating launch angel connection because '%@'", (uint8_t *)&v9, 0x16u);
    }

    v8 = [(WFUIPresenterLaunchAngelConnection *)self connection];
    [v8 invalidate];

    connection = self->_connection;
    self->_connection = 0;
  }
  else if (v7)
  {
    int v9 = 136315394;
    v10 = "-[WFUIPresenterLaunchAngelConnection cleanUpWithReason:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1C7F0A000, connection, OS_LOG_TYPE_DEFAULT, "%s Tried to invalidate any existing launch angel connections because '%@', but there aren't any. Moving on.", (uint8_t *)&v9, 0x16u);
  }
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(WFUIPresenterLaunchAngelConnection *)self cleanUpWithReason:@"the connection class is deallocating"];
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)WFUIPresenterLaunchAngelConnection;
  [(WFUIPresenterLaunchAngelConnection *)&v4 dealloc];
}

- (WFUIPresenterLaunchAngelConnection)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFUIPresenterLaunchAngelConnection;
  v2 = [(WFUIPresenterLaunchAngelConnection *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_super v4 = v2;
  }

  return v3;
}

@end