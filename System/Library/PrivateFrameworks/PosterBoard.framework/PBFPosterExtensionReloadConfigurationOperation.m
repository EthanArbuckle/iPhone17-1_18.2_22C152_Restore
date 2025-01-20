@interface PBFPosterExtensionReloadConfigurationOperation
- (BOOL)didTimeout;
- (BOOL)hasUniqueSessionInfo;
- (NSError)error;
- (NSString)description;
- (NSString)extensionBundleIdentifier;
- (PBFBehaviorAssertionProviding)behaviorAssertionProvider;
- (PBFPosterExtensionReloadConfigurationOperation)initWithUpdatingService:(id)a3 sessionInfo:(id)a4 existingConfigurationPath:(id)a5 locationInUse:(BOOL)a6 runtimeAssertionProvider:(id)a7 behaviorAssertionProvider:(id)a8 timeout:(double)a9 powerLogReason:(int64_t)a10;
- (PBFRuntimeAssertionProviding)runtimeAssertionProvider;
- (PFPosterPath)existingConfigurationPath;
- (PFPosterPath)postRefreshPosterConfiguration;
- (PFPosterPath)preRefreshPosterConfiguration;
- (PRUpdatingService)updatingService;
- (double)_lock_executionTime;
- (double)executionFinishDate;
- (double)executionStartDate;
- (double)executionTime;
- (double)timeoutInterval;
- (id)_userInfoForErrors;
- (void)_finishWithError:(id)a3 postRefreshPosterPathsAssertion:(id)a4;
- (void)_fireCompletionObservers:(id)a3 instance:(id)a4 error:(id)a5;
- (void)_setup;
- (void)addCompletionObserver:(id)a3;
- (void)assertionProviderDidAcquireEditingSessionAssertion:(id)a3 forExtensionIdentifier:(id)a4;
- (void)assertionProviderDidAcquireSnapshotterDisabledAssertion:(id)a3 forExtensionIdentifier:(id)a4;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)dealloc;
- (void)invalidateAssertionsWithCompletion:(id)a3;
- (void)setDidTimeout:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setPreRefreshPosterConfiguration:(id)a3;
- (void)updatingService:(id)a3 didInvalidateWithError:(id)a4;
@end

@implementation PBFPosterExtensionReloadConfigurationOperation

- (BOOL)hasUniqueSessionInfo
{
  sessionInfo = self->_sessionInfo;
  if (sessionInfo) {
    LOBYTE(sessionInfo) = [(PRSPosterUpdateSessionInfo *)sessionInfo isEmpty] ^ 1;
  }
  return (char)sessionInfo;
}

- (PFPosterPath)postRefreshPosterConfiguration
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(PFPosterPathsAssertion *)self->_lock_postRefreshPosterPathsAssertion paths];
  v4 = [v3 firstObject];

  os_unfair_recursive_lock_unlock();
  return (PFPosterPath *)v4;
}

- (PBFPosterExtensionReloadConfigurationOperation)initWithUpdatingService:(id)a3 sessionInfo:(id)a4 existingConfigurationPath:(id)a5 locationInUse:(BOOL)a6 runtimeAssertionProvider:(id)a7 behaviorAssertionProvider:(id)a8 timeout:(double)a9 powerLogReason:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = v17;
  if (v21)
  {
    NSClassFromString(&cfstr_Prsposterupdat_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]0();
      }
LABEL_44:
      [v33 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3286F38);
    }
  }

  id v22 = v18;
  NSClassFromString(&cfstr_Pfposterpath.isa);
  if (!v22)
  {
    v33 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]();
    }
    goto LABEL_44;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]();
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3286F9CLL);
  }

  id v23 = v16;
  NSClassFromString(&cfstr_Prupdatingserv.isa);
  if (!v23)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3287000);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRUpdatingServiceClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3287064);
  }

  id v24 = v19;
  if (!v24)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32870C8);
  }
  v25 = v24;
  if (([v24 conformsToProtocol:&unk_1F2AE46C8] & 1) == 0)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:]();
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328712CLL);
  }

  id v26 = v20;
  if (!v26)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.4();
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3287190);
  }
  v27 = v26;
  if (([v26 conformsToProtocol:&unk_1F2AC71E8] & 1) == 0)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFBehaviorAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.4();
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32871F4);
  }

  if (BSFloatLessThanOrEqualToFloat())
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"__objc_no == BSFloatLessThanOrEqualToFloat(timeoutInterval, 0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadConfigurationOperation initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:].cold.5();
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3287258);
  }
  v44.receiver = self;
  v44.super_class = (Class)PBFPosterExtensionReloadConfigurationOperation;
  v28 = [(NSBlockOperation *)&v44 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_updatingService, a3);
    uint64_t v30 = [v23 bundleIdentifier];
    extensionBundleIdentifier = v29->_extensionBundleIdentifier;
    v29->_extensionBundleIdentifier = (NSString *)v30;

    objc_storeStrong((id *)&v29->_sessionInfo, a4);
    objc_storeStrong((id *)&v29->_runtimeAssertionProvider, a7);
    objc_storeStrong((id *)&v29->_behaviorAssertionProvider, a8);
    [(PBFPosterExtensionReloadConfigurationOperation *)v29 setPreRefreshPosterConfiguration:v22];
    v29->_timeoutInterval = a9;
    v29->_locationInUse = a6;
    v29->_reason = a10;
    v29->_lock = 0;
    [(PBFPosterExtensionReloadConfigurationOperation *)v29 _setup];
  }

  return v29;
}

- (void)invalidateAssertionsWithCompletion:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  [(RBSAssertion *)self->_lock_posterBoardPosterUpdateRuntimeAssertion invalidate];
  lock_posterBoardPosterUpdateRuntimeAssertion = self->_lock_posterBoardPosterUpdateRuntimeAssertion;
  self->_lock_posterBoardPosterUpdateRuntimeAssertion = 0;

  [(BSInvalidatable *)self->_lock_snapshotterDisabledAssertion invalidate];
  lock_snapshotterDisabledAssertion = self->_lock_snapshotterDisabledAssertion;
  self->_lock_snapshotterDisabledAssertion = 0;

  lock_extensionPosterUpdateRuntimeAssertion = self->_lock_extensionPosterUpdateRuntimeAssertion;
  if (self->_lock_postRefreshPosterPathsAssertion)
  {
    id v8 = lock_extensionPosterUpdateRuntimeAssertion;
    v9 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

    unint64_t v10 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    lock_extensionPosterUpdateEntitledMemoryAssertion = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

    v12 = self->_lock_locationInUseAssertion;
    lock_locationInUseAssertion = self->_lock_locationInUseAssertion;
    self->_lock_locationInUseAssertion = 0;

    if ((unint64_t)v8 | v10)
    {
      v14 = (void *)MEMORY[0x1E4F4F670];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __85__PBFPosterExtensionReloadConfigurationOperation_invalidateAssertionsWithCompletion___block_invoke;
      v26[3] = &unk_1E6982A90;
      id v27 = v8;
      v28 = (RBSAssertion *)(id)v10;
      id v29 = v4;
      v15 = [v14 responderWithHandler:v26];
      objc_msgSend(v15, "setTimeout:", dispatch_time(0, 120000000000));
      id v16 = dispatch_get_global_queue(25, 0);
      [v15 setQueue:v16];
    }
    else
    {
      if (v4)
      {
        id v22 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:]"];
        PBFDispatchAsyncWithString(v22, QOS_CLASS_USER_INITIATED, v4);
      }
      v15 = 0;
    }
    id v23 = self->_lock_postRefreshPosterPathsAssertion;
    os_unfair_recursive_lock_unlock();
    if (v12)
    {
      [(CLInUseAssertion *)v12 invalidate];
      id v24 = PBFLogReloadConfiguration();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v12;
        _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "invalidating CLInUseAssertion: %{public}@", buf, 0xCu);
      }
    }
    [(PFPosterPathsAssertion *)v23 invalidateWithResponder:v15];

LABEL_19:
    goto LABEL_20;
  }
  if (lock_extensionPosterUpdateRuntimeAssertion)
  {
    id v8 = lock_extensionPosterUpdateRuntimeAssertion;
    id v17 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

    unint64_t v10 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    id v18 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

    v12 = self->_lock_locationInUseAssertion;
    id v19 = self->_lock_locationInUseAssertion;
    self->_lock_locationInUseAssertion = 0;

    os_unfair_recursive_lock_unlock();
    [v8 invalidate];
    [(id)v10 invalidate];
    if (v12)
    {
      [(CLInUseAssertion *)v12 invalidate];
      id v20 = PBFLogReloadConfiguration();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v12;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "invalidating CLInUseAssertion: %{public}@", buf, 0xCu);
      }
    }
    if (v4)
    {
      id v21 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:]"];
      PBFDispatchAsyncWithString(v21, QOS_CLASS_USER_INITIATED, v4);
    }
    goto LABEL_19;
  }
  os_unfair_recursive_lock_unlock();
  if (v4)
  {
    v25 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadConfigurationOperation invalidateAssertionsWithCompletion:]"];
    PBFDispatchAsyncWithString(v25, QOS_CLASS_USER_INITIATED, v4);
  }
LABEL_20:
}

uint64_t __85__PBFPosterExtensionReloadConfigurationOperation_invalidateAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)dealloc
{
  v22[4] = *MEMORY[0x1E4F143B8];
  [(PBFPosterExtensionReloadConfigurationOperation *)self invalidateAssertionsWithCompletion:0];
  os_unfair_recursive_lock_lock_with_options();
  lock_extensionPosterUpdateRuntimeAssertion = self->_lock_extensionPosterUpdateRuntimeAssertion;
  if (lock_extensionPosterUpdateRuntimeAssertion)
  {
    [(RBSAssertion *)lock_extensionPosterUpdateRuntimeAssertion invalidate];
    id v4 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;
  }
  lock_extensionPosterUpdateEntitledMemoryAssertion = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
  if (lock_extensionPosterUpdateEntitledMemoryAssertion)
  {
    [(RBSAssertion *)lock_extensionPosterUpdateEntitledMemoryAssertion invalidate];
    v6 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;
  }
  lock_locationInUseAssertion = self->_lock_locationInUseAssertion;
  if (lock_locationInUseAssertion)
  {
    [(CLInUseAssertion *)lock_locationInUseAssertion invalidate];
    id v8 = self->_lock_locationInUseAssertion;
    self->_lock_locationInUseAssertion = 0;
  }
  if ([(NSMutableArray *)self->_lock_completionObservers count])
  {
    v9 = [(PBFPosterExtensionReloadConfigurationOperation *)self error];
    if (v9)
    {
    }
    else if (!self->_lock_isFinished)
    {
      v21[0] = *MEMORY[0x1E4F28588];
      v21[1] = @"extensionBundleIdentifier";
      extensionBundleIdentifier = (__CFString *)self->_extensionBundleIdentifier;
      if (!extensionBundleIdentifier) {
        extensionBundleIdentifier = @"(unknown extension)";
      }
      v22[0] = @"Operation failed to finish in time";
      v22[1] = extensionBundleIdentifier;
      v21[2] = @"operationClass";
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v22[2] = v12;
      v21[3] = @"executionTime";
      v13 = NSNumber;
      [(PBFPosterExtensionReloadConfigurationOperation *)self _lock_executionTime];
      v14 = objc_msgSend(v13, "numberWithDouble:");
      v22[3] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

      id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 0, v15);
      [(PBFPosterExtensionReloadConfigurationOperation *)self setError:v16];
    }
    id v17 = (void *)[(NSMutableArray *)self->_lock_completionObservers copy];
    id v18 = [(PBFPosterExtensionReloadConfigurationOperation *)self error];
    [(PBFPosterExtensionReloadConfigurationOperation *)self _fireCompletionObservers:v17 instance:0 error:v18];

    [(NSMutableArray *)self->_lock_completionObservers removeAllObjects];
    lock_completionObservers = self->_lock_completionObservers;
    self->_lock_completionObservers = 0;
  }
  os_unfair_recursive_lock_unlock();
  v20.receiver = self;
  v20.super_class = (Class)PBFPosterExtensionReloadConfigurationOperation;
  [(NSBlockOperation *)&v20 dealloc];
}

- (void)updatingService:(id)a3 didInvalidateWithError:(id)a4
{
}

- (void)assertionProviderDidAcquireSnapshotterDisabledAssertion:(id)a3 forExtensionIdentifier:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = [(PBFPosterExtensionReloadConfigurationOperation *)self _userInfoForErrors];
  objc_msgSend(v5, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(PBFPosterExtensionReloadConfigurationOperation *)self _finishWithError:v7 postRefreshPosterPathsAssertion:0];
}

- (void)_setup
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke;
  v3[3] = &unk_1E6981D18;
  objc_copyWeak(&v4, &location);
  [(NSBlockOperation *)self addExecutionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = (uint64_t)WeakRetained;
  if (WeakRetained
    && ([WeakRetained isCancelled] & 1) == 0
    && ([(id)v3 isFinished] & 1) == 0)
  {
    id v4 = [(id)v3 updatingService];
    v5 = v4;
    if (!v4 || ([v4 isValid] & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = [(id)v3 _userInfoForErrors];
      id v16 = objc_msgSend(v14, "pbf_dataStoreErrorWithCode:userInfo:", -2211, v15);

      [(id)v3 _finishWithError:v16 postRefreshPosterPathsAssertion:0];
LABEL_42:

      goto LABEL_43;
    }
    v6 = [v5 auditToken];
    if (!v6)
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      id v18 = [(id)v3 _userInfoForErrors];
      id v19 = objc_msgSend(v17, "pbf_dataStoreErrorWithCode:userInfo:", -2210, v18);

      [(id)v3 _finishWithError:v19 postRefreshPosterPathsAssertion:0];
LABEL_41:

      goto LABEL_42;
    }
    id v7 = [v5 target];
    if (!v7)
    {
      objc_super v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = [(id)v3 _userInfoForErrors];
      id v22 = objc_msgSend(v20, "pbf_dataStoreErrorWithCode:userInfo:", -2209, v21);

      [(id)v3 _finishWithError:v22 postRefreshPosterPathsAssertion:0];
LABEL_40:

      goto LABEL_41;
    }
    id v8 = [v5 bundleIdentifier];
    v68 = [(id)v3 behaviorAssertionProvider];
    v9 = [v68 activeEditingSessionAssertionExtensionIdentifiers];
    int v10 = [v9 containsObject:v8];

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      v12 = [(id)v3 _userInfoForErrors];
      v13 = objc_msgSend(v11, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v12);

      [(id)v3 _finishWithError:v13 postRefreshPosterPathsAssertion:0];
LABEL_39:

      goto LABEL_40;
    }
    os_unfair_recursive_lock_lock_with_options();
    if (*(unsigned char *)(v3 + 304))
    {
      os_unfair_recursive_lock_unlock();
      id v23 = PBFLogReloadConfiguration();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v72 = v3;
        _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Invalidated before operation started", buf, 0xCu);
      }

      goto LABEL_39;
    }
    id v24 = PBFLogReloadConfiguration();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [(id)v3 preRefreshPosterConfiguration];
      id v26 = [v25 serverIdentity];
      id v27 = [v26 provider];
      *(_DWORD *)buf = 138543618;
      uint64_t v72 = v3;
      __int16 v73 = 2114;
      v74 = v27;
      _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Starting reload configuration operation for %{public}@", buf, 0x16u);
    }
    BSAbsoluteMachTimeNow();
    *(void *)(v3 + 384) = v28;
    id v29 = PBFLogReloadConfiguration();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [(id)v3 preRefreshPosterConfiguration];
      *(_DWORD *)buf = 138543618;
      uint64_t v72 = v3;
      __int16 v73 = 2114;
      v74 = v30;
      _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Current understanding of paths: %{public}@", buf, 0x16u);
    }
    v31 = *(void **)(v3 + 416);
    uint64_t v32 = [@"PBFPosterExtensionReloadConfigurationOperation refreshPosterConfiguration" stringByAppendingString:v8];
    v33 = [MEMORY[0x1E4F96478] currentProcess];
    uint64_t v34 = [v31 acquirePosterUpdateRuntimeAssertionForReason:v32 target:v33];
    v35 = *(void **)(v3 + 352);
    *(void *)(v3 + 352) = v34;

    uint64_t v36 = [*(id *)(v3 + 416) acquirePosterUpdateRuntimeAssertionForReason:@"reloadConfiguration" target:v7];
    v37 = *(void **)(v3 + 320);
    *(void *)(v3 + 320) = v36;

    uint64_t v38 = [*(id *)(v3 + 416) acquirePosterUpdateMemoryAssertionForReason:@"reloadConfiguration entitled update" target:v7 auditToken:v6 posterProviderBundleIdentifier:v8];
    v39 = *(void **)(v3 + 328);
    *(void *)(v3 + 328) = v38;

    uint64_t v40 = [*(id *)(v3 + 424) acquireSnapshotterDisabledAssertionForProvider:v8 withReason:@"refreshPosterConfiguration"];
    v41 = *(void **)(v3 + 344);
    *(void *)(v3 + 344) = v40;

    if (*(unsigned char *)(v3 + 368))
    {
      uint64_t v42 = [MEMORY[0x1E4F1E5E8] newAssertionForBundleIdentifier:v8 withReason:@"background update of in-use poster" level:0];
      v43 = *(void **)(v3 + 336);
      *(void *)(v3 + 336) = v42;

      objc_super v44 = PBFLogReloadConfiguration();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *(void *)(v3 + 336);
        *(_DWORD *)buf = 134218242;
        uint64_t v72 = v45;
        __int16 v73 = 2114;
        v74 = v8;
        _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, "created CLInUseAssertion=%p for background update of %{public}@", buf, 0x16u);
      }
    }
    dispatch_group_t v46 = dispatch_group_create();
    v47 = *(void **)(v3 + 296);
    *(void *)(v3 + 296) = v46;

    v48 = v46;
    dispatch_group_enter(v48);
    os_unfair_recursive_lock_unlock();
    [v5 addUpdatingServiceObserver:v3];
    [v68 addBehaviorAssertionObserver:v3];
    +[PBFPowerLogger logUpdate:2 reason:*(void *)(v3 + 360) inServiceOfBundleIdentifier:v8];
    v49 = [v5 invalidationError];
    if (v49 || ([v5 isValid] & 1) == 0)
    {
    }
    else
    {
      v50 = [v68 activeEditingSessionAssertionExtensionIdentifiers];
      int v51 = [v50 containsObject:v8];

      if (!v51)
      {
        v52 = [(id)v3 preRefreshPosterConfiguration];
        uint64_t v53 = *(void *)(v3 + 288);
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_154;
        v69[3] = &unk_1E6983E58;
        v69[4] = v3;
        objc_copyWeak(&v70, v1);
        [v5 updateConfiguration:v52 sessionInfo:v53 completion:v69];

        os_unfair_recursive_lock_lock_with_options();
        LODWORD(v53) = *(unsigned __int8 *)(v3 + 304);
        os_unfair_recursive_lock_unlock();
        if (v53)
        {
          v54 = PBFLogReloadConfiguration();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v72 = v3;
            _os_log_impl(&dword_1D31CE000, v54, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Abort timeout check; operation has already finished.",
              buf,
              0xCu);
          }

          objc_destroyWeak(&v70);
          goto LABEL_39;
        }
        [(id)v3 timeoutInterval];
        dispatch_time_t v63 = dispatch_time(0, (uint64_t)(v62 * 1000000000.0));
        if (dispatch_group_wait(v48, v63))
        {
          v64 = (void *)MEMORY[0x1E4F28C58];
          v65 = [(id)v3 _userInfoForErrors];
          v66 = objc_msgSend(v64, "pbf_dataStoreErrorWithCode:userInfo:", -2221, v65);

          v67 = PBFLogReloadConfiguration();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
            __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_cold_1(v3, v67);
          }

          [(id)v3 _finishWithError:v66 postRefreshPosterPathsAssertion:0];
        }
        objc_destroyWeak(&v70);
        goto LABEL_38;
      }
    }
    v55 = [v5 invalidationError];
    if (!v55)
    {
      v56 = [v68 activeEditingSessionAssertionExtensionIdentifiers];
      int v57 = [v56 containsObject:v8];

      if (!v57
        || (v58 = (void *)MEMORY[0x1E4F28C58],
            [(id)v3 _userInfoForErrors],
            v59 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v58, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v59),
            v55 = objc_claimAutoreleasedReturnValue(),
            v59,
            !v55))
      {
        v60 = (void *)MEMORY[0x1E4F28C58];
        v61 = [(id)v3 _userInfoForErrors];
        v55 = objc_msgSend(v60, "pbf_generalErrorWithCode:userInfo:", 3, v61);
      }
    }
    [(id)v3 _finishWithError:v55 postRefreshPosterPathsAssertion:0];

LABEL_38:
    goto LABEL_39;
  }
LABEL_43:
}

void __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PBFLogReloadConfiguration();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_121_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)  finished with paths %{public}@", (uint8_t *)&v11, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishWithError:v6 postRefreshPosterPathsAssertion:v5];
}

- (void)cancel
{
}

- (void)cancelWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PBFLogReloadConfiguration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    int v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Cancel with error: %{public}@", buf, 0x16u);
  }

  if (v4)
  {
    [(PBFPosterExtensionReloadConfigurationOperation *)self _finishWithError:v4 postRefreshPosterPathsAssertion:0];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = [(PBFPosterExtensionReloadConfigurationOperation *)self _userInfoForErrors];
    id v8 = objc_msgSend(v6, "pbf_generalErrorWithCode:userInfo:", 4, v7);
    [(PBFPosterExtensionReloadConfigurationOperation *)self _finishWithError:v8 postRefreshPosterPathsAssertion:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)PBFPosterExtensionReloadConfigurationOperation;
  [(PBFPosterExtensionReloadConfigurationOperation *)&v9 cancel];
}

- (double)executionTime
{
  os_unfair_recursive_lock_lock_with_options();
  [(PBFPosterExtensionReloadConfigurationOperation *)self _lock_executionTime];
  double v4 = v3;
  os_unfair_recursive_lock_unlock();
  return v4;
}

- (double)_lock_executionTime
{
  double lock_executionFinishDate = self->_lock_executionFinishDate;
  if (lock_executionFinishDate == 0.0) {
    BSAbsoluteMachTimeNow();
  }
  return lock_executionFinishDate - self->_lock_executionStateDate;
}

- (void)addCompletionObserver:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (self->_lock_isFinished)
    {
      os_unfair_recursive_lock_unlock();
      id v5 = _Block_copy(v4);
      v12[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      id v7 = [(PBFPosterExtensionReloadConfigurationOperation *)self error];
      [(PBFPosterExtensionReloadConfigurationOperation *)self _fireCompletionObservers:v6 instance:self error:v7];
    }
    else
    {
      lock_completionObservers = self->_lock_completionObservers;
      if (!lock_completionObservers)
      {
        objc_super v9 = (NSMutableArray *)objc_opt_new();
        int v10 = self->_lock_completionObservers;
        self->_lock_completionObservers = v9;

        lock_completionObservers = self->_lock_completionObservers;
      }
      int v11 = (void *)[v4 copy];
      [(NSMutableArray *)lock_completionObservers addObject:v11];

      os_unfair_recursive_lock_unlock();
    }
  }
}

- (void)assertionProviderDidAcquireEditingSessionAssertion:(id)a3 forExtensionIdentifier:(id)a4
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL lock_isFinished = self->_lock_isFinished;
  os_unfair_recursive_lock_unlock();
  if (([(PBFPosterExtensionReloadConfigurationOperation *)self isFinished] & 1) == 0)
  {
    char v6 = [(PBFPosterExtensionReloadConfigurationOperation *)self isCancelled];
    if (!lock_isFinished && (v6 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      id v8 = [(PBFPosterExtensionReloadConfigurationOperation *)self _userInfoForErrors];
      objc_msgSend(v7, "pbf_dataStoreErrorWithCode:userInfo:", -2204, v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      [(PBFPosterExtensionReloadConfigurationOperation *)self cancelWithError:v9];
    }
  }
}

- (void)_finishWithError:(id)a3 postRefreshPosterPathsAssertion:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_isFinished)
  {
    id v8 = 0;
  }
  else
  {
    lock_group = self->_lock_group;
    if (lock_group)
    {
      dispatch_group_leave(lock_group);
      int v10 = self->_lock_group;
      self->_lock_group = 0;
    }
    self->_BOOL lock_isFinished = 1;
    BSAbsoluteMachTimeNow();
    self->_double lock_executionFinishDate = v11;
    __int16 v12 = [(PBFPosterExtensionReloadConfigurationOperation *)self behaviorAssertionProvider];
    [v12 removeBehaviorAssertionObserver:self];

    id v13 = [(PBFPosterExtensionReloadConfigurationOperation *)self updatingService];
    [v13 removeUpdatingServiceObserver:self];

    if (v6) {
      goto LABEL_6;
    }
    uint64_t v15 = [v7 paths];
    uint64_t v16 = [v15 count];

    if (v16 == 1) {
      goto LABEL_11;
    }
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28588];
    id v18 = [NSString stringWithFormat:@"Extension did not return appropriate path data : %@", v7];
    v36[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    objc_msgSend(v17, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v19);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_6:
      uint64_t v14 = PBFLogReloadConfiguration();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionReloadDescriptorsOperation _finishWithError:postRefreshPosterPathsAssertion:](self, (uint64_t)v6, v14);
      }

      [(PBFPosterExtensionReloadConfigurationOperation *)self setError:v6];
      [(PBFPosterExtensionReloadConfigurationOperation *)self invalidateAssertionsWithCompletion:0];
    }
    else
    {
LABEL_11:
      objc_super v20 = PBFLogReloadConfiguration();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v7 paths];
        id v22 = [(PBFPosterExtensionReloadConfigurationOperation *)self preRefreshPosterConfiguration];
        id v26 = v22;
        id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
        int v24 = [v21 isEqual:v23] ^ 1;
        [(PBFPosterExtensionReloadConfigurationOperation *)self executionTime];
        *(_DWORD *)buf = 138544130;
        uint64_t v28 = self;
        __int16 v29 = 1024;
        int v30 = v24;
        __int16 v31 = 2114;
        id v32 = v7;
        __int16 v33 = 2048;
        uint64_t v34 = v25;
        _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Finished SUCCESSFULLY; Has modified paths? %{BOOL}d -- '%{public}@' -- execution time: %f",
          buf,
          0x26u);
      }
      objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, a4);
      id v6 = 0;
    }
    id v8 = (void *)[(NSMutableArray *)self->_lock_completionObservers copy];
    [(NSMutableArray *)self->_lock_completionObservers removeAllObjects];
  }
  os_unfair_recursive_lock_unlock();
  [(PBFPosterExtensionReloadConfigurationOperation *)self _fireCompletionObservers:v8 instance:self error:v6];
}

- (id)_userInfoForErrors
{
  v16[3] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v15[0] = @"extensionBundleIdentifier";
  double v3 = [(PBFPosterExtensionReloadConfigurationOperation *)self preRefreshPosterConfiguration];
  id v4 = [v3 serverIdentity];
  uint64_t v5 = [v4 provider];
  id v6 = (void *)v5;
  id v7 = @"(null)";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v16[0] = v7;
  v15[1] = @"timeoutInterval";
  id v8 = [NSNumber numberWithDouble:self->_timeoutInterval];
  v16[1] = v8;
  v15[2] = @"preRefreshPosterConfiguration";
  id v9 = [(PBFPosterExtensionReloadConfigurationOperation *)self preRefreshPosterConfiguration];
  uint64_t v10 = [v9 description];
  double v11 = (void *)v10;
  __int16 v12 = @"null";
  if (v10) {
    __int16 v12 = (__CFString *)v10;
  }
  v16[2] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  os_unfair_recursive_lock_unlock();
  return v13;
}

- (NSString)description
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(PBFPosterExtensionReloadConfigurationOperation *)self preRefreshPosterConfiguration];
  id v7 = [v6 serverIdentity];
  id v8 = [v7 provider];
  id v9 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v8];

  return (NSString *)v9;
}

- (void)_fireCompletionObservers:(id)a3 instance:(id)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadConfigurationOperation _fireCompletionObservers:instance:error:]"];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __90__PBFPosterExtensionReloadConfigurationOperation__fireCompletionObservers_instance_error___block_invoke;
        v16[3] = &unk_1E6981090;
        uint64_t v19 = v14;
        id v17 = v8;
        id v18 = v9;
        PBFDispatchAsyncWithString(v15, QOS_CLASS_DEFAULT, v16);
      }
      uint64_t v11 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
}

uint64_t __90__PBFPosterExtensionReloadConfigurationOperation__fireCompletionObservers_instance_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (double)executionStartDate
{
  return self->_lock_executionStateDate;
}

- (double)executionFinishDate
{
  return self->_lock_executionFinishDate;
}

- (PFPosterPath)existingConfigurationPath
{
  return self->_existingConfigurationPath;
}

- (PRUpdatingService)updatingService
{
  return self->_updatingService;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return self->_runtimeAssertionProvider;
}

- (PBFBehaviorAssertionProviding)behaviorAssertionProvider
{
  return self->_behaviorAssertionProvider;
}

- (PFPosterPath)preRefreshPosterConfiguration
{
  return (PFPosterPath *)objc_getProperty(self, a2, 432, 1);
}

- (void)setPreRefreshPosterConfiguration:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 440, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_preRefreshPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_behaviorAssertionProvider, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_updatingService, 0);
  objc_storeStrong((id *)&self->_existingConfigurationPath, 0);
  objc_storeStrong((id *)&self->_lock_posterBoardPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_snapshotterDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_lock_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateEntitledMemoryAssertion, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_completionObservers, 0);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:sessionInfo:existingConfigurationPath:locationInUse:runtimeAssertionProvider:behaviorAssertionProvider:timeout:powerLogReason:.cold.10()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  double v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __56__PBFPosterExtensionReloadConfigurationOperation__setup__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_ERROR, "(%{public}@)  Timed out!", (uint8_t *)&v2, 0xCu);
}

@end