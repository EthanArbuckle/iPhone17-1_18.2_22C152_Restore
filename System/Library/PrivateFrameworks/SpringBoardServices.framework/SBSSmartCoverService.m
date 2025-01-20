@interface SBSSmartCoverService
+ (id)sharedInstance;
- (SBSSmartCoverService)init;
- (id)registerSmartCoverStateObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)observeSmartCoverStateDidChange:(id)a3;
@end

@implementation SBSSmartCoverService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_service_0;
  return v2;
}

uint64_t __38__SBSSmartCoverService_sharedInstance__block_invoke()
{
  sharedInstance_service_0 = objc_alloc_init(SBSSmartCoverService);
  return MEMORY[0x1F41817F8]();
}

- (SBSSmartCoverService)init
{
  v23.receiver = self;
  v23.super_class = (Class)SBSSmartCoverService;
  v2 = [(SBSSmartCoverService *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E4F4F6E8];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __28__SBSSmartCoverService_init__block_invoke;
    v21[3] = &unk_1E566B528;
    v5 = v2;
    v22 = v5;
    uint64_t v6 = [v4 assertionWithIdentifier:@"SBSSmartCoverObserver" stateDidChangeHandler:v21];
    observerAssertion = v5->_observerAssertion;
    v5->_observerAssertion = (BSCompoundAssertion *)v6;

    v8 = (void *)MEMORY[0x1E4F50BB8];
    v9 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v10 = +[SBSSmartCoverServiceSpecification identifier];
    v11 = [v8 endpointForMachName:v9 service:v10 instance:0];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v11];
      lock_connection = v5->_lock_connection;
      v5->_lock_connection = (BSServiceConnection *)v12;

      v14 = v5->_lock_connection;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __28__SBSSmartCoverService_init__block_invoke_2;
      v19 = &unk_1E566B118;
      v20 = v5;
      [(BSServiceConnection *)v14 configureConnection:&v16];
      [(BSServiceConnection *)v5->_lock_connection activate];
    }
  }
  return v3;
}

void __28__SBSSmartCoverService_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  v5 = [*(id *)(*(void *)(a1 + 32) + 16) remoteTarget];
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = [v4 isActive];

  v8 = [v6 numberWithBool:v7];
  [v5 setWantsSmartCoverStateChanges:v8];

  v9 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v9);
}

void __28__SBSSmartCoverService_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SBSSmartCoverServiceSpecification interface];
  [v3 setInterface:v4];

  v5 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__SBSSmartCoverService_init__block_invoke_3;
  v8[3] = &unk_1E566B0F0;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__SBSSmartCoverService_init__block_invoke_26;
  v6[3] = &unk_1E566B0F0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __28__SBSSmartCoverService_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "SBSSmartCoverService: interrupted - resyncing state", (uint8_t *)v9, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    int v7 = [WeakRetained[3] isActive];
    [v3 activate];
    if (v7)
    {
      v8 = [v3 remoteTarget];
      [v8 setWantsSmartCoverStateChanges:MEMORY[0x1E4F1CC38]];
    }
  }
}

void __28__SBSSmartCoverService_init__block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_DEFAULT, "SBSSmartCoverService: invalidated remotely", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  [*((id *)WeakRetained + 2) invalidate];
  id v3 = (void *)*((void *)WeakRetained + 2);
  *((void *)WeakRetained + 2) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSSmartCoverService.m";
  __int16 v16 = 1024;
  int v17 = 110;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_18FBC5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(BSServiceConnection *)self->_lock_connection invalidate];
  lock_connection = self->_lock_connection;
  self->_lock_connection = 0;

  os_unfair_lock_lock(p_lock);
}

- (id)registerSmartCoverStateObserver:(id)a3
{
  observerAssertion = self->_observerAssertion;
  id v4 = a3;
  v5 = [(id)objc_opt_class() description];
  uint64_t v6 = [(BSCompoundAssertion *)observerAssertion acquireForReason:v5 withContext:v4];

  return v6;
}

- (void)observeSmartCoverStateDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 integerValue];
  v5 = [(BSCompoundAssertion *)self->_observerAssertion context];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) smartCoverStateDidChange:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerAssertion, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end