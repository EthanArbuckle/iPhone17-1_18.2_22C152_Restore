@interface SiriQuickTypeGestureSource
- (SiriQuickTypeGestureSource)init;
- (id)prewarm;
- (void)activate;
- (void)configureConnection;
@end

@implementation SiriQuickTypeGestureSource

- (SiriQuickTypeGestureSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)SiriQuickTypeGestureSource;
  v2 = [(SiriActivationSource *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SiriQuickTypeGestureSource *)v2 configureConnection];
  }
  return v3;
}

- (void)configureConnection
{
  v3 = (void *)MEMORY[0x1E4F50BB8];
  v4 = +[SASBoardServicesConfiguration configuration];
  objc_super v5 = [v4 machServiceIdentifier];
  v6 = +[SASBoardServicesConfiguration configuration];
  v7 = [v6 identifierForService:1];
  v8 = [v3 endpointForMachName:v5 service:v7 instance:0];

  v9 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v8];
  connection = self->super._connection;
  self->super._connection = v9;

  objc_initWeak(&location, self);
  v11 = self->super._connection;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __49__SiriQuickTypeGestureSource_configureConnection__block_invoke;
  v15 = &unk_1E6B67588;
  objc_copyWeak(&v16, &location);
  [(BSServiceConnection *)v11 configureConnection:&v12];
  [(BSServiceConnection *)self->super._connection activate];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __49__SiriQuickTypeGestureSource_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = [WeakRetained identifier];
    v8 = +[SASSignalServer serviceQuality];
    [v3 setServiceQuality:v8];

    v9 = +[SASSignalServer interface];
    [v3 setInterface:v9];

    [v3 setInterfaceTarget:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_2;
    v15[3] = &unk_1E6B67518;
    id v10 = v7;
    id v16 = v10;
    [v3 setInvalidationHandler:v15];
    [v3 setInterruptionHandler:&__block_literal_global_1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_26;
    v12[3] = &unk_1E6B67560;
    objc_copyWeak(&v14, v4);
    id v11 = v10;
    id v13 = v11;
    [v3 setActivationHandler:v12];

    objc_destroyWeak(&v14);
  }
}

void __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[SiriQuickTypeGestureSource configureConnection]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Invalidated %@", (uint8_t *)&v6, 0x16u);
  }
  objc_super v5 = [v3 remoteTarget];
  [v5 unregisterNonButtonSourceWithType:&unk_1F337C560 withUUID:*(void *)(a1 + 32)];
}

void __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_24(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_24_cold_1((uint64_t)v2, v3);
  }
  [v2 activate];
}

void __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    int v6 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[SiriQuickTypeGestureSource configureConnection]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1D9588000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation BSServiceConnection Activated %@", (uint8_t *)&v8, 0x16u);
    }
    v7 = [v3 remoteTarget];
    [v7 registerNonButtonSourceWithType:&unk_1F337C560 withUUID:*(void *)(a1 + 32)];

    os_unfair_lock_unlock(v5 + 4);
  }
}

- (id)prewarm
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = SiriSystemUpTimeFromCFAbsoluteCurrentTime(Current);
  objc_initWeak(&location, self);
  objc_super v5 = [SiriActivityAssertion alloc];
  int v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __37__SiriQuickTypeGestureSource_prewarm__block_invoke;
  v15 = &unk_1E6B67660;
  objc_copyWeak(&v16, &location);
  int v8 = [(SiriActivityAssertion *)v5 initWithIdentifier:v7 reference:@"SiriQuickTypeGestureSource.ActivityAssertion" reason:@"SiriQuickTypeGestureSource.ActivityAssertionReason.Prepare" timestamp:&v12 invalidationBlock:v4];

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  __int16 v10 = [(BSServiceConnection *)self->super._connection remoteTarget];
  [v10 prewarmForFirstTapOfQuickTypeToSiriGesture];

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v8;
}

void __37__SiriQuickTypeGestureSource_prewarm__block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained + 4;
    double v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    id v3 = [v4[1] remoteTarget];
    [v3 cancelPrewarmForFirstTapOfQuickTypeToSiriGesture];

    os_unfair_lock_unlock(v2);
    id WeakRetained = (os_unfair_lock_s *)v4;
  }
}

- (void)activate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  double v4 = [(BSServiceConnection *)self->super._connection remoteTarget];
  [v4 activationRequestFromSimpleActivation:&unk_1F337C578];

  os_unfair_lock_unlock(p_lock);
}

void __49__SiriQuickTypeGestureSource_configureConnection__block_invoke_24_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SiriQuickTypeGestureSource configureConnection]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D9588000, a2, OS_LOG_TYPE_ERROR, "%s #activation BSServiceConnection Interrupted, re-activating %@", (uint8_t *)&v2, 0x16u);
}

@end