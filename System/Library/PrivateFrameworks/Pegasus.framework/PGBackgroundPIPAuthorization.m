@interface PGBackgroundPIPAuthorization
- (NSString)activitySessionIdentifier;
- (NSString)appBundleIdentifier;
- (NSString)description;
- (PGBackgroundPIPAuthorization)initWithActivitySessionIdentifier:(id)a3 appBundleIdentifier:(id)a4 stateTransitionHandler:(id)a5;
- (id)stateTransitionHandler;
- (int64_t)state;
- (void)_transitionToState:(int64_t)a3;
- (void)dealloc;
- (void)revoke;
- (void)transitionToState:(id)a3;
@end

@implementation PGBackgroundPIPAuthorization

- (PGBackgroundPIPAuthorization)initWithActivitySessionIdentifier:(id)a3 appBundleIdentifier:(id)a4 stateTransitionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PGBackgroundPIPAuthorization.m", 41, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  v40.receiver = self;
  v40.super_class = (Class)PGBackgroundPIPAuthorization;
  v12 = [(PGBackgroundPIPAuthorization *)&v40 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v12);
    uint64_t v14 = [v9 copy];
    activitySessionIdentifier = v13->_activitySessionIdentifier;
    v13->_activitySessionIdentifier = (NSString *)v14;

    uint64_t v16 = MEMORY[0x1BA99D810](v11);
    id stateTransitionHandler = v13->_stateTransitionHandler;
    v13->_id stateTransitionHandler = (id)v16;

    uint64_t v18 = [v10 copy];
    appBundleIdentifier = v13->_appBundleIdentifier;
    v13->_appBundleIdentifier = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E4F62888];
    v21 = [MEMORY[0x1E4F62888] defaultShellMachName];
    v22 = +[PGBackgroundPIPServiceSpecification identifier];
    v23 = [v20 endpointForMachName:v21 service:v22 instance:0];

    uint64_t v24 = [MEMORY[0x1E4F62880] connectionWithEndpoint:v23];
    connection = v13->_connection;
    v13->_connection = (BSServiceConnection *)v24;

    v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.pegasus.background-pip-authorization-request", v26);

    v28 = v13->_connection;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke;
    v34[3] = &unk_1E610C598;
    v29 = v27;
    v35 = v29;
    objc_copyWeak(&v38, &location);
    id v30 = v9;
    id v36 = v30;
    id v37 = v10;
    [(BSServiceConnection *)v28 configureConnection:v34];
    v31 = PGLogCommon();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]";
      __int16 v43 = 2114;
      id v44 = v30;
      _os_log_impl(&dword_1B5645000, v31, OS_LOG_TYPE_DEFAULT, "%s Authorizing identifier %{public}@", buf, 0x16u);
    }

    [(BSServiceConnection *)v13->_connection activate];
    objc_destroyWeak(&v38);

    objc_destroyWeak(&location);
  }

  return v13;
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[PGBackgroundPIPServiceSpecification interface];
  [v3 setInterface:v4];

  v5 = +[PGBackgroundPIPServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setTargetQueue:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [v3 setInterfaceTarget:WeakRetained];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_2;
  v9[3] = &unk_1E610C528;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v3 setActivationHandler:v9];
  [v3 setInterruptionHandler:&__block_literal_global_5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_34;
  v7[3] = &unk_1E610C570;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  [v3 setInvalidationHandler:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v12);
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]_block_invoke_2";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s Connection Activated: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && ![WeakRetained state])
  {
    [v6 _transitionToState:1];
    v7 = [v3 remoteTarget];
    [v7 grantAuthorizationForActivitySessionWithIdentifier:*(void *)(a1 + 32) bundleIdentifier:*(void *)(a1 + 40)];
  }
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PGLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_1B5645000, v3, OS_LOG_TYPE_DEFAULT, "%s Received interruption for connection: %{public}@", (uint8_t *)&v4, 0x16u);
  }

  [v2 activate];
}

void __109__PGBackgroundPIPAuthorization_initWithActivitySessionIdentifier_appBundleIdentifier_stateTransitionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[PGBackgroundPIPAuthorization initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1B5645000, v4, OS_LOG_TYPE_DEFAULT, "%s Received invalidation for connection: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained revoke];
}

- (int64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)transitionToState:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertNotMain();
  v5 = PGLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [v4 integerValue];
    if (v6 > 5) {
      id v7 = @"invalid";
    }
    else {
      id v7 = off_1E610C5E0[v6];
    }
    int v8 = 136315394;
    id v9 = "-[PGBackgroundPIPAuthorization transitionToState:]";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_1B5645000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  -[PGBackgroundPIPAuthorization _transitionToState:](self, "_transitionToState:", [v4 integerValue]);
}

- (void)_transitionToState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state >= a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_int64_t lock_state = a3;
    os_unfair_lock_unlock(p_lock);
    BSDispatchMain();
  }
}

void __51__PGBackgroundPIPAuthorization__transitionToState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateTransitionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)revoke
{
  if ([(PGBackgroundPIPAuthorization *)self state] != 5)
  {
    id v3 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v3 revokeAuthorization];

    [(BSServiceConnection *)self->_connection invalidate];
    [(PGBackgroundPIPAuthorization *)self _transitionToState:5];
  }
}

- (NSString)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PGBackgroundPIPAuthorization;
  id v4 = [(PGBackgroundPIPAuthorization *)&v11 description];
  activitySessionIdentifier = self->_activitySessionIdentifier;
  appBundleIdentifier = self->_appBundleIdentifier;
  unint64_t v7 = [(PGBackgroundPIPAuthorization *)self state];
  if (v7 > 5) {
    int v8 = @"invalid";
  }
  else {
    int v8 = off_1E610C5E0[v7];
  }
  id v9 = [v3 stringWithFormat:@"%@ - %@.%@ - %@", v4, activitySessionIdentifier, appBundleIdentifier, v8];

  return (NSString *)v9;
}

- (void)dealloc
{
  if ([(PGBackgroundPIPAuthorization *)self state] != 5)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PGBackgroundPIPAuthorization.m", 121, @"Released %@ without revoking it first", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)PGBackgroundPIPAuthorization;
  [(PGBackgroundPIPAuthorization *)&v5 dealloc];
}

- (NSString)activitySessionIdentifier
{
  return self->_activitySessionIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (id)stateTransitionHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateTransitionHandler, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activitySessionIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end