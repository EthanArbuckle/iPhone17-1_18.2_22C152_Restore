@interface SBSCaptureIntentService
+ (id)sharedInstance;
- (SBSCaptureIntentService)init;
- (id)context;
- (void)dealloc;
- (void)invalidate;
- (void)setContext:(id)a3;
@end

@implementation SBSCaptureIntentService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_22);
  }
  v2 = (void *)sharedInstance_service_1;
  return v2;
}

uint64_t __41__SBSCaptureIntentService_sharedInstance__block_invoke()
{
  sharedInstance_service_1 = objc_alloc_init(SBSCaptureIntentService);
  return MEMORY[0x1F41817F8]();
}

- (SBSCaptureIntentService)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBSCaptureIntentService;
  v2 = [(SBSCaptureIntentService *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E4F50BB8];
    v5 = [MEMORY[0x1E4F50BB8] defaultShellMachName];
    v6 = +[SBSCaptureIntentServiceSpecification identifier];
    v7 = [v4 endpointForMachName:v5 service:v6 instance:0];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v7];
      lock_connection = v3->_lock_connection;
      v3->_lock_connection = (BSServiceConnection *)v8;

      v10 = v3->_lock_connection;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __31__SBSCaptureIntentService_init__block_invoke;
      v12[3] = &unk_1E566B118;
      v13 = v3;
      [(BSServiceConnection *)v10 configureConnection:v12];
      [(BSServiceConnection *)v3->_lock_connection activate];
    }
  }
  return v3;
}

void __31__SBSCaptureIntentService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBSCaptureIntentServiceSpecification interface];
  [v3 setInterface:v4];

  v5 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  [v3 setInterruptionHandler:&__block_literal_global_7_1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SBSCaptureIntentService_init__block_invoke_8;
  v6[3] = &unk_1E566B0F0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __31__SBSCaptureIntentService_init__block_invoke_2()
{
  v0 = SBLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18FBC5000, v0, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: interrupted", v1, 2u);
  }
}

void __31__SBSCaptureIntentService_init__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FBC5000, v2, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: remotely invalidated", v4, 2u);
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
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSCaptureIntentService.m";
  __int16 v16 = 1024;
  int v17 = 67;
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

- (void)setContext:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_18FBC5000, v6, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: Setting capture intent context for bundle identifier", v8, 2u);
  }

  id v7 = [(BSServiceConnection *)self->_lock_connection remoteTarget];
  [v7 setCaptureIntentContext:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_18FBC5000, v4, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: Retrieving capture intent context for bundle identifier", v8, 2u);
  }

  id v5 = [(BSServiceConnection *)self->_lock_connection remoteTarget];
  v6 = [v5 captureIntentContext];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
}

@end