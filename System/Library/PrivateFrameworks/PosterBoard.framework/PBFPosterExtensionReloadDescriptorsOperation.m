@interface PBFPosterExtensionReloadDescriptorsOperation
- (BOOL)didTimeout;
- (BOOL)hasUniqueSessionInfo;
- (NSArray)postRefreshPosterDescriptors;
- (NSArray)preRefreshPosterDescriptors;
- (NSError)error;
- (NSString)description;
- (NSString)extensionBundleIdentifier;
- (PBFPosterExtensionReloadDescriptorsOperation)initWithUpdatingService:(id)a3 extensionBundleIdentifier:(id)a4 sessionInfo:(id)a5 preRefreshPosterDescriptors:(id)a6 runtimeAssertionProvider:(id)a7 timeout:(double)a8 powerLogReason:(int64_t)a9;
- (PBFRuntimeAssertionProviding)runtimeAssertionProvider;
- (PFPosterPathsAssertion)postRefreshPosterPathsAssertion;
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
- (void)cancel;
- (void)dealloc;
- (void)invalidateAssertionsWithCompletion:(id)a3;
- (void)setDidTimeout:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setPostRefreshPosterPathsAssertion:(id)a3;
- (void)updatingService:(id)a3 didInvalidateWithError:(id)a4;
@end

@implementation PBFPosterExtensionReloadDescriptorsOperation

- (BOOL)hasUniqueSessionInfo
{
  sessionInfo = self->_sessionInfo;
  if (sessionInfo) {
    LOBYTE(sessionInfo) = [(PRSPosterUpdateSessionInfo *)sessionInfo isEmpty] ^ 1;
  }
  return (char)sessionInfo;
}

- (NSArray)postRefreshPosterDescriptors
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = [(PFPosterPathsAssertion *)self->_lock_postRefreshPosterPathsAssertion paths];
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (PBFPosterExtensionReloadDescriptorsOperation)initWithUpdatingService:(id)a3 extensionBundleIdentifier:(id)a4 sessionInfo:(id)a5 preRefreshPosterDescriptors:(id)a6 runtimeAssertionProvider:(id)a7 timeout:(double)a8 powerLogReason:(int64_t)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = v18;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v22)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]();
    }
LABEL_44:
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323921CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]();
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3239280);
  }

  id v23 = v19;
  if (v23)
  {
    NSClassFromString(&cfstr_Prsposterupdat_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.9();
      }
      goto LABEL_44;
    }
  }

  id v24 = v20;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v24)
  {
    v37 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]();
    }
    [v37 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32392E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]();
    }
    [v38 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3239348);
  }

  id v25 = v17;
  NSClassFromString(&cfstr_Prupdatingserv.isa);
  if (!v25)
  {
    v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]();
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32393ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRUpdatingServiceClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:]();
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3239410);
  }

  id v26 = v21;
  if (!v26)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.4();
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3239474);
  }
  v27 = v26;
  if (([v26 conformsToProtocol:&unk_1F2AE46C8] & 1) == 0)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.4();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32394D8);
  }

  if (BSFloatLessThanOrEqualToFloat())
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"__objc_no == BSFloatLessThanOrEqualToFloat(timeoutInterval, 0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionReloadDescriptorsOperation initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:].cold.5();
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323953CLL);
  }
  v44.receiver = self;
  v44.super_class = (Class)PBFPosterExtensionReloadDescriptorsOperation;
  v28 = [(NSBlockOperation *)&v44 init];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_updatingService, a3);
    uint64_t v30 = [v22 copy];
    extensionBundleIdentifier = v29->_extensionBundleIdentifier;
    v29->_extensionBundleIdentifier = (NSString *)v30;

    objc_storeStrong((id *)&v29->_sessionInfo, a5);
    uint64_t v32 = [v24 copy];
    preRefreshPosterDescriptors = v29->_preRefreshPosterDescriptors;
    v29->_preRefreshPosterDescriptors = (NSArray *)v32;

    v29->_timeoutInterval = a8;
    objc_storeStrong((id *)&v29->_runtimeAssertionProvider, a7);
    v29->_powerLogReason = a9;
    v29->_lock = 0;
    [(PBFPosterExtensionReloadDescriptorsOperation *)v29 _setup];
  }

  return v29;
}

- (void)invalidateAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  v5 = self->_lock_posterBoardPosterUpdateRuntimeAssertion;
  lock_posterBoardPosterUpdateRuntimeAssertion = self->_lock_posterBoardPosterUpdateRuntimeAssertion;
  self->_lock_posterBoardPosterUpdateRuntimeAssertion = 0;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PBFPosterExtensionReloadDescriptorsOperation_invalidateAssertionsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6981220;
  id v7 = v4;
  id v30 = v7;
  v8 = v5;
  v29 = v8;
  v9 = _Block_copy(aBlock);
  lock_extensionPosterUpdateRuntimeAssertion = self->_lock_extensionPosterUpdateRuntimeAssertion;
  if (self->_lock_postRefreshPosterPathsAssertion)
  {
    id v11 = lock_extensionPosterUpdateRuntimeAssertion;
    v12 = self->_lock_extensionPosterUpdateRuntimeAssertion;
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;

    unint64_t v13 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    lock_extensionPosterUpdateEntitledMemoryAssertion = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;

    if ((unint64_t)v11 | v13)
    {
      v15 = (void *)MEMORY[0x1E4F4F670];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __83__PBFPosterExtensionReloadDescriptorsOperation_invalidateAssertionsWithCompletion___block_invoke_2;
      v24[3] = &unk_1E6982A90;
      id v25 = v11;
      id v26 = (RBSAssertion *)(id)v13;
      id v27 = v9;
      v16 = [v15 responderWithHandler:v24];
      objc_msgSend(v16, "setTimeout:", dispatch_time(0, 120));
      id v17 = dispatch_get_global_queue(25, 0);
      [v16 setQueue:v17];

      id v18 = v25;
    }
    else
    {
      id v18 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:]"];
      PBFDispatchAsyncWithString(v18, QOS_CLASS_USER_INITIATED, v9);
      v16 = 0;
    }

    id v22 = self->_lock_postRefreshPosterPathsAssertion;
    os_unfair_recursive_lock_unlock();
    [(PFPosterPathsAssertion *)v22 invalidateWithResponder:v16];
  }
  else
  {
    if (!lock_extensionPosterUpdateRuntimeAssertion)
    {
      id v23 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:]"];
      PBFDispatchAsyncWithString(v23, QOS_CLASS_USER_INITIATED, v9);

      os_unfair_recursive_lock_unlock();
      goto LABEL_9;
    }
    self->_lock_extensionPosterUpdateRuntimeAssertion = 0;
    id v11 = lock_extensionPosterUpdateRuntimeAssertion;

    id v19 = self->_lock_extensionPosterUpdateEntitledMemoryAssertion;
    self->_lock_extensionPosterUpdateEntitledMemoryAssertion = 0;
    id v20 = v19;

    os_unfair_recursive_lock_unlock();
    [v11 invalidate];
    [(RBSAssertion *)v20 invalidate];
    id v21 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadDescriptorsOperation invalidateAssertionsWithCompletion:]"];
    PBFDispatchAsyncWithString(v21, QOS_CLASS_USER_INITIATED, v9);
  }
LABEL_9:
}

uint64_t __83__PBFPosterExtensionReloadDescriptorsOperation_invalidateAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 invalidate];
}

uint64_t __83__PBFPosterExtensionReloadDescriptorsOperation_invalidateAssertionsWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  [*(id *)(a1 + 40) invalidate];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)dealloc
{
  v22[4] = *MEMORY[0x1E4F143B8];
  [(PBFPosterExtensionReloadDescriptorsOperation *)self invalidateAssertionsWithCompletion:0];
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
  if ([(NSMutableArray *)self->_lock_completionObservers count])
  {
    id v7 = [(PBFPosterExtensionReloadDescriptorsOperation *)self error];
    if (v7)
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
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v22[2] = v10;
      v21[3] = @"executionTime";
      id v11 = NSNumber;
      [(PBFPosterExtensionReloadDescriptorsOperation *)self _lock_executionTime];
      v12 = objc_msgSend(v11, "numberWithDouble:");
      v22[3] = v12;
      unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

      v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 0, v13);
      [(PBFPosterExtensionReloadDescriptorsOperation *)self setError:v14];
    }
    v15 = (void *)[(NSMutableArray *)self->_lock_completionObservers copy];
    v16 = [(PBFPosterExtensionReloadDescriptorsOperation *)self error];
    [(PBFPosterExtensionReloadDescriptorsOperation *)self _fireCompletionObservers:v15 instance:0 error:v16];

    [(NSMutableArray *)self->_lock_completionObservers removeAllObjects];
    lock_completionObservers = self->_lock_completionObservers;
    self->_lock_completionObservers = 0;
  }
  lock_posterBoardPosterUpdateRuntimeAssertion = self->_lock_posterBoardPosterUpdateRuntimeAssertion;
  if (lock_posterBoardPosterUpdateRuntimeAssertion)
  {
    [(RBSAssertion *)lock_posterBoardPosterUpdateRuntimeAssertion invalidate];
    id v19 = self->_lock_posterBoardPosterUpdateRuntimeAssertion;
    self->_lock_posterBoardPosterUpdateRuntimeAssertion = 0;
  }
  os_unfair_recursive_lock_unlock();
  v20.receiver = self;
  v20.super_class = (Class)PBFPosterExtensionReloadDescriptorsOperation;
  [(NSBlockOperation *)&v20 dealloc];
}

- (void)updatingService:(id)a3 didInvalidateWithError:(id)a4
{
}

- (void)_setup
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke;
  v3[3] = &unk_1E6981D18;
  objc_copyWeak(&v4, &location);
  [(NSBlockOperation *)self addExecutionBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0 && (objc_msgSend(v2, "isFinished") & 1) == 0)
  {
    v3 = [v2 updatingService];
    id v4 = v3;
    if (!v3 || ([v3 isValid] & 1) == 0)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      v10 = [v2 _userInfoForErrors];
      v5 = objc_msgSend(v9, "pbf_dataStoreErrorWithCode:userInfo:", -2211, v10);

      [v2 _finishWithError:v5 postRefreshPosterPathsAssertion:0];
LABEL_32:

      goto LABEL_33;
    }
    v5 = [v4 auditToken];
    if (!v5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      v12 = [v2 _userInfoForErrors];
      v6 = objc_msgSend(v11, "pbf_dataStoreErrorWithCode:userInfo:", -2210, v12);

      [v2 _finishWithError:v6 postRefreshPosterPathsAssertion:0];
LABEL_31:

      goto LABEL_32;
    }
    v6 = [v4 target];
    if (!v6)
    {
      unint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      v14 = [v2 _userInfoForErrors];
      id v7 = objc_msgSend(v13, "pbf_dataStoreErrorWithCode:userInfo:", -2209, v14);

      [v2 _finishWithError:v7 postRefreshPosterPathsAssertion:0];
LABEL_30:

      goto LABEL_31;
    }
    id v7 = [v4 bundleIdentifier];
    os_unfair_recursive_lock_lock_with_options();
    if (*((unsigned char *)v2 + 280))
    {
      os_unfair_recursive_lock_unlock();
      v8 = PBFLogReloadDescriptors();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        objc_super v44 = v2;
        _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Invalidated before operation started", buf, 0xCu);
      }
      goto LABEL_29;
    }
    v15 = PBFLogReloadDescriptors();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v2[47];
      *(_DWORD *)buf = 138412546;
      objc_super v44 = v2;
      __int16 v45 = 2112;
      id v46 = v16;
      _os_log_impl(&dword_1D31CE000, v15, OS_LOG_TYPE_DEFAULT, "(%@)  Starting reload operation for %@", buf, 0x16u);
    }

    BSAbsoluteMachTimeNow();
    v2[45] = v17;
    id v18 = PBFLogReloadDescriptors();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v2[50];
      *(_DWORD *)buf = 138412546;
      objc_super v44 = v2;
      __int16 v45 = 2112;
      id v46 = v19;
      _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "(%@)  Current understanding of paths: %@", buf, 0x16u);
    }

    uint64_t v20 = [v2[49] acquirePosterUpdateRuntimeAssertionForReason:@"reloadDescriptors" target:v6];
    id v21 = v2[41];
    v2[41] = (id)v20;

    uint64_t v22 = [v2[49] acquirePosterUpdateMemoryAssertionForReason:@"reloadDescriptors entitled update" target:v6 auditToken:v5 posterProviderBundleIdentifier:v7];
    id v23 = v2[42];
    v2[42] = (id)v22;

    id v24 = v2[49];
    id v25 = [@"reloadDescriptors for " stringByAppendingString:v7];
    id v26 = [MEMORY[0x1E4F96478] currentProcess];
    uint64_t v27 = [v24 acquirePosterUpdateRuntimeAssertionForReason:v25 target:v26];
    id v28 = v2[40];
    v2[40] = (id)v27;

    dispatch_group_t v29 = dispatch_group_create();
    id v30 = v2[38];
    v2[38] = v29;

    v8 = v29;
    dispatch_group_enter(v8);
    os_unfair_recursive_lock_unlock();
    [v4 addUpdatingServiceObserver:v2];
    +[PBFPowerLogger logUpdate:1 reason:v2[37] inServiceOfBundleIdentifier:v7];
    v31 = [v4 invalidationError];
    if (v31)
    {
    }
    else if ([v4 isValid])
    {
      id v32 = v2[50];
      id v33 = v2[36];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_121;
      v42[3] = &unk_1E6982AB8;
      v42[4] = v2;
      [v4 updateDescriptors:v32 sessionInfo:v33 completion:v42];
      os_unfair_recursive_lock_lock_with_options();
      int v34 = *((unsigned __int8 *)v2 + 280);
      os_unfair_recursive_lock_unlock();
      if (v34)
      {
        v35 = PBFLogReloadDescriptors();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          objc_super v44 = v2;
          _os_log_impl(&dword_1D31CE000, v35, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Abort timeout check; operation has already finished.",
            buf,
            0xCu);
        }
        goto LABEL_28;
      }
      [v2 timeoutInterval];
      dispatch_time_t v39 = dispatch_time(0, (uint64_t)(v38 * 1000000000.0));
      if (!dispatch_group_wait(v8, v39)) {
        goto LABEL_29;
      }
      v40 = (void *)MEMORY[0x1E4F28C58];
      v41 = [v2 _userInfoForErrors];
      v35 = objc_msgSend(v40, "pbf_dataStoreErrorWithCode:userInfo:", -2221, v41);

      v37 = PBFLogReloadDescriptors();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        objc_super v44 = v2;
        _os_log_impl(&dword_1D31CE000, v37, OS_LOG_TYPE_DEFAULT, "(%@)  Timed out!", buf, 0xCu);
      }
      goto LABEL_26;
    }
    v35 = [v4 invalidationError];
    if (v35)
    {
LABEL_27:
      [v2 _finishWithError:v35 postRefreshPosterPathsAssertion:0];
LABEL_28:

LABEL_29:
      goto LABEL_30;
    }
    v36 = (void *)MEMORY[0x1E4F28C58];
    v37 = [v2 _userInfoForErrors];
    v35 = objc_msgSend(v36, "pbf_generalErrorWithCode:userInfo:", 3, v37);
LABEL_26:

    goto LABEL_27;
  }
LABEL_33:
}

void __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PBFLogReloadDescriptors();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_121_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = [v5 paths];
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@)  finished with paths %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) _finishWithError:v6 postRefreshPosterPathsAssertion:v5];
}

- (void)cancel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = PBFLogReloadDescriptors();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Cancel!", buf, 0xCu);
  }

  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = [(PBFPosterExtensionReloadDescriptorsOperation *)self _userInfoForErrors];
  id v6 = objc_msgSend(v4, "pbf_generalErrorWithCode:userInfo:", 4, v5);
  [(PBFPosterExtensionReloadDescriptorsOperation *)self _finishWithError:v6 postRefreshPosterPathsAssertion:0];

  v7.receiver = self;
  v7.super_class = (Class)PBFPosterExtensionReloadDescriptorsOperation;
  [(PBFPosterExtensionReloadDescriptorsOperation *)&v7 cancel];
}

- (double)executionTime
{
  os_unfair_recursive_lock_lock_with_options();
  [(PBFPosterExtensionReloadDescriptorsOperation *)self _lock_executionTime];
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
      objc_super v7 = [(PBFPosterExtensionReloadDescriptorsOperation *)self error];
      [(PBFPosterExtensionReloadDescriptorsOperation *)self _fireCompletionObservers:v6 instance:self error:v7];
    }
    else
    {
      lock_completionObservers = self->_lock_completionObservers;
      if (!lock_completionObservers)
      {
        uint64_t v9 = (NSMutableArray *)objc_opt_new();
        uint64_t v10 = self->_lock_completionObservers;
        self->_lock_completionObservers = v9;

        lock_completionObservers = self->_lock_completionObservers;
      }
      int v11 = (void *)[v4 copy];
      [(NSMutableArray *)lock_completionObservers addObject:v11];

      os_unfair_recursive_lock_unlock();
    }
  }
}

- (void)_finishWithError:(id)a3 postRefreshPosterPathsAssertion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_lock_isFinished)
  {
    v8 = 0;
  }
  else
  {
    lock_group = self->_lock_group;
    if (lock_group)
    {
      dispatch_group_leave(lock_group);
      uint64_t v10 = self->_lock_group;
      self->_lock_group = 0;
    }
    self->_lock_isFinished = 1;
    BSAbsoluteMachTimeNow();
    self->_double lock_executionFinishDate = v11;
    uint64_t v12 = PBFLogReloadDescriptors();
    __int16 v13 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionReloadDescriptorsOperation _finishWithError:postRefreshPosterPathsAssertion:](self, (uint64_t)v6, v13);
      }

      [(PBFPosterExtensionReloadDescriptorsOperation *)self setError:v6];
      [(PBFPosterExtensionReloadDescriptorsOperation *)self invalidateAssertionsWithCompletion:0];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v7 paths];
        uint64_t v15 = [(PBFPosterExtensionReloadDescriptorsOperation *)self preRefreshPosterDescriptors];
        int v16 = [v14 isEqual:v15] ^ 1;
        [(PBFPosterExtensionReloadDescriptorsOperation *)self executionTime];
        int v18 = 138544130;
        id v19 = self;
        __int16 v20 = 1024;
        int v21 = v16;
        __int16 v22 = 2114;
        id v23 = v7;
        __int16 v24 = 2048;
        uint64_t v25 = v17;
        _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@)  Finished SUCCESSFULLY; Has modified paths? %{BOOL}d -- '%{public}@' -- execution time: %f",
          (uint8_t *)&v18,
          0x26u);
      }
      objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, a4);
    }
    v8 = (void *)[(NSMutableArray *)self->_lock_completionObservers copy];
    [(NSMutableArray *)self->_lock_completionObservers removeAllObjects];
  }
  os_unfair_recursive_lock_unlock();
  [(PBFPosterExtensionReloadDescriptorsOperation *)self _fireCompletionObservers:v8 instance:self error:v6];
}

- (id)_userInfoForErrors
{
  v13[3] = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  v12[0] = @"extensionBundleIdentifier";
  uint64_t v3 = [(NSString *)self->_extensionBundleIdentifier copy];
  id v4 = (void *)v3;
  id v5 = @"(null)";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v13[0] = v5;
  v12[1] = @"timeoutInterval";
  id v6 = [NSNumber numberWithDouble:self->_timeoutInterval];
  v13[1] = v6;
  void v12[2] = @"preRefreshPosterDescriptors";
  uint64_t v7 = [(NSArray *)self->_preRefreshPosterDescriptors description];
  v8 = (void *)v7;
  uint64_t v9 = @"null";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  v13[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  os_unfair_recursive_lock_unlock();
  return v10;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, self->_extensionBundleIdentifier];

  return (NSString *)v6;
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
        uint64_t v15 = [NSString stringWithUTF8String:"-[PBFPosterExtensionReloadDescriptorsOperation _fireCompletionObservers:instance:error:]"];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __88__PBFPosterExtensionReloadDescriptorsOperation__fireCompletionObservers_instance_error___block_invoke;
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

uint64_t __88__PBFPosterExtensionReloadDescriptorsOperation__fireCompletionObservers_instance_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (double)executionStartDate
{
  return self->_lock_executionStateDate;
}

- (double)executionFinishDate
{
  return self->_lock_executionFinishDate;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (PRUpdatingService)updatingService
{
  return self->_updatingService;
}

- (PBFRuntimeAssertionProviding)runtimeAssertionProvider
{
  return self->_runtimeAssertionProvider;
}

- (NSArray)preRefreshPosterDescriptors
{
  return (NSArray *)objc_getProperty(self, a2, 400, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 408, 1);
}

- (void)setError:(id)a3
{
}

- (PFPosterPathsAssertion)postRefreshPosterPathsAssertion
{
  return (PFPosterPathsAssertion *)objc_getProperty(self, a2, 416, 1);
}

- (void)setPostRefreshPosterPathsAssertion:(id)a3
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
  objc_storeStrong((id *)&self->_postRefreshPosterPathsAssertion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_preRefreshPosterDescriptors, 0);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_updatingService, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateEntitledMemoryAssertion, 0);
  objc_storeStrong((id *)&self->_lock_extensionPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_posterBoardPosterUpdateRuntimeAssertion, 0);
  objc_storeStrong((id *)&self->_lock_postRefreshPosterPathsAssertion, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_lock_completionObservers, 0);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatingService:extensionBundleIdentifier:sessionInfo:preRefreshPosterDescriptors:runtimeAssertionProvider:timeout:powerLogReason:.cold.9()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __54__PBFPosterExtensionReloadDescriptorsOperation__setup__block_invoke_121_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "(%{public}@)  finished with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_finishWithError:(NSObject *)a3 postRefreshPosterPathsAssertion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 executionTime];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1D31CE000, a3, OS_LOG_TYPE_ERROR, "(%{public}@)  Finished unsuccessfully; error: '%{public}@' -- execution time: %f",
    (uint8_t *)&v7,
    0x20u);
}

@end