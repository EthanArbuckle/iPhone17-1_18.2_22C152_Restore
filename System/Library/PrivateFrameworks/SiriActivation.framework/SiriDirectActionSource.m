@interface SiriDirectActionSource
- (SiriDirectActionSource)init;
- (SiriDirectActionSource)initWithDelegate:(id)a3;
- (SiriDirectActionSourceDelegate)delegate;
- (void)activateWithContext:(id)a3;
- (void)activateWithContext:(id)a3 completion:(id)a4;
- (void)canActivateChangedTo:(id)a3;
- (void)configureConnection;
- (void)setDelegate:(id)a3;
@end

@implementation SiriDirectActionSource

void __45__SiriDirectActionSource_configureConnection__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    v6 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      v9 = "-[SiriDirectActionSource configureConnection]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated %@", (uint8_t *)&v8, 0x16u);
    }
    v7 = [v3 remoteTarget];
    [v7 registerNonButtonSourceWithType:&unk_1F337C728 withUUID:*(void *)(a1 + 32)];

    os_unfair_lock_unlock(v5 + 4);
  }
}

- (void)configureConnection
{
  id v3 = (void *)MEMORY[0x1E4F50BB8];
  v4 = +[SASBoardServicesConfiguration configuration];
  v5 = [v4 machServiceIdentifier];
  v6 = +[SASBoardServicesConfiguration configuration];
  v7 = [v6 identifierForService:1];
  int v8 = [v3 endpointForMachName:v5 service:v7 instance:0];

  v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
  connection = self->super._connection;
  self->super._connection = v9;

  objc_initWeak(&location, self);
  id v11 = self->super._connection;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __45__SiriDirectActionSource_configureConnection__block_invoke;
  v15 = &unk_1E6B67588;
  objc_copyWeak(&v16, &location);
  [(BSServiceConnection *)v11 configureConnection:&v12];
  [(BSServiceConnection *)self->super._connection activate];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __45__SiriDirectActionSource_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained identifier];
    int v8 = +[SASSignalServer serviceQuality];
    [v3 setServiceQuality:v8];

    v9 = +[SASSignalServer interface];
    [v3 setInterface:v9];

    [v3 setInterfaceTarget:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__SiriDirectActionSource_configureConnection__block_invoke_2;
    v15[3] = &unk_1E6B67518;
    id v10 = v7;
    id v16 = v10;
    [v3 setInvalidationHandler:v15];
    [v3 setInterruptionHandler:&__block_literal_global_22];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__SiriDirectActionSource_configureConnection__block_invoke_27;
    v12[3] = &unk_1E6B67560;
    objc_copyWeak(&v14, v4);
    id v11 = v10;
    id v13 = v11;
    [v3 setActivationHandler:v12];

    objc_destroyWeak(&v14);
  }
}

- (SiriDirectActionSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriDirectActionSource;
  v5 = [(SiriActivationSource *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SiriDirectActionSource *)v5 setDelegate:v4];
    [(SiriDirectActionSource *)v6 configureConnection];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (SiriDirectActionSource)init
{
  return [(SiriDirectActionSource *)self initWithDelegate:0];
}

- (void)activateWithContext:(id)a3
{
  p_lock = &self->super._lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(BSServiceConnection *)self->super._connection remoteTarget];
  [v6 activationRequestFromDirectActionEventWithContext:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__SiriDirectActionSource_activateWithContext_completion___block_invoke;
  aBlock[3] = &unk_1E6B685E0;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  v9 = _Block_copy(aBlock);
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  id v11 = [(BSServiceConnection *)self->super._connection remoteTarget];
  [v11 activationRequestFromDirectActionEventWithContext:v8 completion:v9];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __57__SiriDirectActionSource_activateWithContext_completion___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = [a2 BOOLValue];
    id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

void __45__SiriDirectActionSource_configureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SiriDirectActionSource configureConnection]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Invalidated %@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [v3 remoteTarget];
  [v5 unregisterNonButtonSourceWithType:&unk_1F337C728 withUUID:*(void *)(a1 + 32)];
}

void __45__SiriDirectActionSource_configureConnection__block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    __45__SiriDirectActionSource_configureConnection__block_invoke_25_cold_1((uint64_t)v2, v3);
  }
  [v2 activate];
}

- (void)canActivateChangedTo:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    __int16 v8 = "-[SiriDirectActionSource canActivateChangedTo:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation canActivateChangedTo: %@", (uint8_t *)&v7, 0x16u);
  }
  int v6 = [(SiriDirectActionSource *)self delegate];
  objc_msgSend(v6, "canActivateChangedTo:", objc_msgSend(v4, "BOOLValue"));
}

- (SiriDirectActionSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriDirectActionSourceDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

void __45__SiriDirectActionSource_configureConnection__block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SiriDirectActionSource configureConnection]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9588000, a2, OS_LOG_TYPE_ERROR, "%s #activation BSServiceConnection Interrupted, re-activating %@", (uint8_t *)&v2, 0x16u);
}

@end