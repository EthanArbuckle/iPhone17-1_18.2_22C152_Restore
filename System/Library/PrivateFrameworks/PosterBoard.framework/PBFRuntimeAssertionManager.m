@interface PBFRuntimeAssertionManager
- (NSString)debugDescription;
- (NSString)description;
- (PBFRuntimeAssertionManager)init;
- (id)_buildRBSAssertionForTarget:(id)a3 assertionIdentifier:(id)a4 explanation:(id)a5 invalidationHandler:(id)a6;
- (id)_stateQueue_debugDescription;
- (id)_stateQueue_debugDescriptionForPosterBoardProcessAssertions;
- (id)_stateQueue_debugDescriptionForPosterExtensionProcessAssertions;
- (id)_stateQueue_debugDescriptionForTarget:(id)a3;
- (id)acquireAssertion:(id)a3 reason:(id)a4 target:(id)a5 invalidationHandler:(id)a6;
- (id)acquirePosterUpdateMemoryAssertionForReason:(id)a3 target:(id)a4 auditToken:(id)a5 posterProviderBundleIdentifier:(id)a6;
- (id)acquirePosterUpdateRuntimeAssertionForReason:(id)a3 target:(id)a4;
- (id)acquirePrewarmRuntimeAssertionForReason:(id)a3 target:(id)a4 invalidationHandler:(id)a5;
- (void)_runningBoardAssertionStateDidUpdate:(id)a3 assertionIdentifier:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PBFRuntimeAssertionManager

- (PBFRuntimeAssertionManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)PBFRuntimeAssertionManager;
  v2 = [(PBFRuntimeAssertionManager *)&v18 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)Serial;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    stateQueue_knownAssertions = v2->_stateQueue_knownAssertions;
    v2->_stateQueue_knownAssertions = (NSHashTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    stateQueue_acquistionDateForAssertion = v2->_stateQueue_acquistionDateForAssertion;
    v2->_stateQueue_acquistionDateForAssertion = (NSMapTable *)v9;

    objc_initWeak(&location, v2);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    objc_copyWeak(&v16, &location);
    uint64_t v13 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureSentinel = v2->_stateCaptureSentinel;
    v2->_stateCaptureSentinel = (BSInvalidatable *)v13;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __34__PBFRuntimeAssertionManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_stateQueue_debugDescription");

  return v2;
}

- (void)dealloc
{
  [(PBFRuntimeAssertionManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBFRuntimeAssertionManager;
  [(PBFRuntimeAssertionManager *)&v3 dealloc];
}

- (id)acquirePrewarmRuntimeAssertionForReason:(id)a3 target:(id)a4 invalidationHandler:(id)a5
{
  return [(PBFRuntimeAssertionManager *)self acquireAssertion:*MEMORY[0x1E4F92510] reason:a3 target:a4 invalidationHandler:a5];
}

- (id)acquirePosterUpdateRuntimeAssertionForReason:(id)a3 target:(id)a4
{
  return [(PBFRuntimeAssertionManager *)self acquireAssertion:*MEMORY[0x1E4F92508] reason:a3 target:a4 invalidationHandler:0];
}

- (id)acquirePosterUpdateMemoryAssertionForReason:(id)a3 target:(id)a4 auditToken:(id)a5 posterProviderBundleIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([a5 hasEntitlement:@"com.apple.posterkit.enhanced-memory-limits"])
  {
    int v13 = PFBundleIdentifierRequiresMemoryHogAssertion();
    v14 = (void *)MEMORY[0x1E4F92500];
    if (!v13) {
      v14 = (void *)MEMORY[0x1E4F924F8];
    }
    v15 = [(PBFRuntimeAssertionManager *)self acquireAssertion:*v14 reason:v10 target:v11 invalidationHandler:0];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)acquireAssertion:(id)a3 reason:(id)a4 target:(id)a5 invalidationHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v14)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3273A78);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3273ADCLL);
  }

  id v15 = v11;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3273B40);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3273BA4);
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Rbstarget.isa);
  if (!v16)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3273C08);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSTargetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]();
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3273C6CLL);
  }

  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    id v17 = 0;
  }
  else
  {
    objc_super v18 = PBFLogRuntime();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v40 = v14;
      __int16 v41 = 2114;
      id v42 = v15;
      __int16 v43 = 2114;
      id v44 = v16;
      _os_log_impl(&dword_1D31CE000, v18, OS_LOG_TYPE_DEFAULT, "acquireAssertion:'%{public}@' reason:'%{public}@' target:'%{public}@'", buf, 0x20u);
    }

    v19 = [(PBFRuntimeAssertionManager *)self _buildRBSAssertionForTarget:v16 assertionIdentifier:v14 explanation:v15 invalidationHandler:v13];
    id v38 = 0;
    int v20 = [v19 acquireWithError:&v38];
    id v21 = v38;
    v22 = PBFLogRuntime();
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        id v40 = v14;
        __int16 v41 = 2114;
        id v42 = v15;
        __int16 v43 = 2114;
        id v44 = v16;
        __int16 v45 = 2114;
        id v46 = v21;
        _os_log_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_DEFAULT, "SUCCESS acquireAssertion:'%{public}@' reason:'%{public}@' target:'%{public}@': %{public}@", buf, 0x2Au);
      }

      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke;
      block[3] = &unk_1E69808E8;
      block[4] = self;
      id v17 = v19;
      id v37 = v17;
      dispatch_async(stateQueue, block);
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        id v40 = v14;
        __int16 v41 = 2114;
        id v42 = v15;
        __int16 v43 = 2114;
        id v44 = v16;
        __int16 v45 = 2114;
        id v46 = v21;
        _os_log_error_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_ERROR, "FAILED acquireAssertion:'%{public}@' reason:'%{public}@' target:'%{public}@': %{public}@", buf, 0x2Au);
      }

      if (v13)
      {
        v25 = [NSString stringWithUTF8String:"-[PBFRuntimeAssertionManager acquireAssertion:reason:target:invalidationHandler:]"];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke_33;
        v33[3] = &unk_1E6981220;
        id v35 = v13;
        id v34 = v21;
        PBFDispatchAsyncWithString(v25, QOS_CLASS_USER_INTERACTIVE, v33);
      }
      id v17 = 0;
    }
  }
  return v17;
}

void __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

uint64_t __81__PBFRuntimeAssertionManager_acquireAssertion_reason_target_invalidationHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    [(BSInvalidatable *)self->_stateCaptureSentinel invalidate];
    stateCaptureSentinel = self->_stateCaptureSentinel;
    self->_stateCaptureSentinel = 0;

    v4 = self->_stateQueue_knownAssertions;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PBFRuntimeAssertionManager_invalidate__block_invoke;
    block[3] = &unk_1E69808C0;
    v8 = v4;
    v6 = v4;
    dispatch_async(stateQueue, block);
  }
}

void __40__PBFRuntimeAssertionManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) invalidate];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)_buildRBSAssertionForTarget:(id)a3 assertionIdentifier:(id)a4 explanation:(id)a5 invalidationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  NSClassFromString(&cfstr_Rbstarget.isa);
  if (!v14)
  {
    int v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
LABEL_19:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32740BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSTargetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:].cold.4();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3274120);
  }

  id v15 = v11;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3274184);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFRuntimeAssertionManager _buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:]();
    }
    goto LABEL_19;
  }

  objc_initWeak(&location, self);
  id v16 = objc_msgSend(MEMORY[0x1E4F96318], "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v14, v15, v12, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __110__PBFRuntimeAssertionManager__buildRBSAssertionForTarget_assertionIdentifier_explanation_invalidationHandler___block_invoke;
  v23[3] = &unk_1E69839C8;
  objc_copyWeak(&v26, &location);
  id v17 = v15;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  [v16 setInvalidationHandler:v23];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v16;
}

void __110__PBFRuntimeAssertionManager__buildRBSAssertionForTarget_assertionIdentifier_explanation_invalidationHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _runningBoardAssertionStateDidUpdate:v9 assertionIdentifier:*(void *)(a1 + 32) error:v5];
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
    }
  }
}

- (void)_runningBoardAssertionStateDidUpdate:(id)a3 assertionIdentifier:(id)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PBFLogRuntime();
  id v12 = v11;
  if (v10)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v13 = [v8 target];
    *(_DWORD *)buf = 138544130;
    id v18 = v9;
    __int16 v19 = 2114;
    int v20 = v13;
    __int16 v21 = 1024;
    int v22 = [v8 isValid];
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_error_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_ERROR, "_runningBoardAssertionStateDidUpdate:'%{public}@' target:'%{public}@' isActive:%{BOOL}u error: %{public}@", buf, 0x26u);
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v13 = [v8 target];
    *(_DWORD *)buf = 138544130;
    id v18 = v9;
    __int16 v19 = 2114;
    int v20 = v13;
    __int16 v21 = 1024;
    int v22 = [v8 isValid];
    __int16 v23 = 2114;
    id v24 = 0;
    _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "_runningBoardAssertionStateDidUpdate:'%{public}@' target:'%{public}@' isActive:%{BOOL}u error: %{public}@", buf, 0x26u);
  }

LABEL_7:
  if (([v8 isValid] & 1) == 0)
  {
    stateQueue = self->_stateQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__PBFRuntimeAssertionManager__runningBoardAssertionStateDidUpdate_assertionIdentifier_error___block_invoke;
    v15[3] = &unk_1E69808E8;
    v15[4] = self;
    id v16 = v8;
    dispatch_async(stateQueue, v15);
  }
}

uint64_t __93__PBFRuntimeAssertionManager__runningBoardAssertionStateDidUpdate_assertionIdentifier_error___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v3 removeObjectForKey:v2];
}

- (NSString)description
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PBFRuntimeAssertionManager_description__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__PBFRuntimeAssertionManager_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_debugDescription");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)debugDescription
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__9;
  id v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PBFRuntimeAssertionManager_debugDescription__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __46__PBFRuntimeAssertionManager_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_debugDescription");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_stateQueue_debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = [(PBFRuntimeAssertionManager *)self _stateQueue_debugDescriptionForPosterBoardProcessAssertions];
  [v3 appendDictionarySection:v4 withName:@"PosterBoard Assertions" multilinePrefix:@"\n\t\t" skipIfEmpty:1];

  id v5 = [(PBFRuntimeAssertionManager *)self _stateQueue_debugDescriptionForPosterExtensionProcessAssertions];
  [v3 appendDictionarySection:v5 withName:@"Poster Extension Assertions" multilinePrefix:@"\n\t\t" skipIfEmpty:1];

  uint64_t v6 = [v3 build];

  return v6;
}

- (id)_stateQueue_debugDescriptionForPosterBoardProcessAssertions
{
  uint64_t v3 = [MEMORY[0x1E4F96478] currentProcess];
  uint64_t v4 = [(PBFRuntimeAssertionManager *)self _stateQueue_debugDescriptionForTarget:v3];

  return v4;
}

- (id)_stateQueue_debugDescriptionForPosterExtensionProcessAssertions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F96478] currentProcess];
  uint64_t v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_stateQueue_knownAssertions;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) target];
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  [v4 removeObject:v3];
  id v11 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        id v18 = -[PBFRuntimeAssertionManager _stateQueue_debugDescriptionForTarget:](self, "_stateQueue_debugDescriptionForTarget:", v17, (void)v21);
        __int16 v19 = [v17 description];
        objc_msgSend(v11, "bs_setSafeObject:forKey:", v18, v19);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)_stateQueue_debugDescriptionForTarget:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v31 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = self->_stateQueue_knownAssertions;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v12 = [v11 target];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v14 = [(NSMapTable *)self->_stateQueue_acquistionDateForAssertion objectForKey:v11];
          if (v14)
          {
            [v5 addObject:v14];
            uint64_t v15 = [v11 explanation];
            id v16 = (void *)v15;
            if (v15) {
              id v17 = (__CFString *)v15;
            }
            else {
              id v17 = @"@(NULL)";
            }
            [v31 addObject:v17];
          }
        }
      }
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }

  if ([v5 count] == 1)
  {
    id v18 = [v5 anyObject];
  }
  else
  {
    __int16 v19 = [v5 allObjects];
    int v20 = [v19 sortedArrayUsingSelector:sel_compare_];
    id v18 = [v20 firstObject];
  }
  if (v18)
  {
    if ([v31 count] == 1)
    {
      long long v21 = [v31 anyObject];
    }
    else if ([v31 count])
    {
      long long v23 = [v31 allObjects];
      long long v24 = [v23 sortedArrayUsingSelector:sel_compare_];
      long long v25 = [v24 componentsJoinedByString:@"', '"];

      long long v21 = [NSString stringWithFormat:@"'%@'", v25];
    }
    else
    {
      long long v21 = @"(null)";
    }
    if (v21) {
      long long v26 = v21;
    }
    else {
      long long v26 = @"(null)";
    }
    v36[0] = @"explanations";
    v36[1] = @"creationDate";
    v37[0] = v26;
    v37[1] = v18;
    v36[2] = @"elapsedTimeInSeconds";
    long long v27 = NSNumber;
    long long v28 = [MEMORY[0x1E4F1C9C8] date];
    [v28 timeIntervalSinceDate:v18];
    v29 = objc_msgSend(v27, "numberWithDouble:");
    v37[2] = v29;
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureSentinel, 0);
  objc_storeStrong((id *)&self->_stateQueue_acquistionDateForAssertion, 0);
  objc_storeStrong((id *)&self->_stateQueue_knownAssertions, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)acquireAssertion:reason:target:invalidationHandler:.cold.1()
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

- (void)acquireAssertion:reason:target:invalidationHandler:.cold.2()
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

- (void)acquireAssertion:reason:target:invalidationHandler:.cold.3()
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

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.3()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_buildRBSAssertionForTarget:assertionIdentifier:explanation:invalidationHandler:.cold.4()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_12();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end