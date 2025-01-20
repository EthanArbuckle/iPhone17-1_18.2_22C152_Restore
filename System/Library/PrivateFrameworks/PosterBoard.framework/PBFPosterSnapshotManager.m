@interface PBFPosterSnapshotManager
- (BOOL)_assertionLock_isExtensionProhibitedFromSnapshotting:(id)a3;
- (BOOL)_isExtensionProhibitedFromSnapshotting:(id)a3;
- (BOOL)_isOperationQueueSuspended;
- (BOOL)_isRequestValid:(id)a3 error:(id *)a4;
- (BOOL)_lock_cancelSnapshotter:(id)a3 reason:(id)a4;
- (BOOL)_operationQueueLock_updateOperationQueueSuspended:(BOOL)a3;
- (BOOL)_updateOperationQueueSuspended:(BOOL)a3;
- (BOOL)areSnapshotsFullyPrepared:(id)a3;
- (BOOL)cancelRequestedSnapshotsForExtensionBundleIdentifier:(id)a3;
- (BOOL)cancelRequestedSnapshotsForIdentity:(id)a3;
- (BOOL)cancelRequestedSnapshotsForRequests:(id)a3 reason:(id)a4;
- (BOOL)ingestSnapshotCollection:(id)a3 forConfiguration:(id)a4 error:(id *)a5;
- (BOOL)isSnapshotRequestFulfilled:(id)a3;
- (PBFPosterSnapshotManager)initWithRuntimeAssertionProvider:(id)a3 extensionProvider:(id)a4 modelCoordinatorProvider:(id)a5 applicationStateMonitor:(id)a6;
- (id)_createSnapshotForDefinition:(id)a3 withSurface:(id)a4 snapshotScale:(double)a5 configuredProperties:(id)a6 path:(id)a7 context:(id)a8 error:(id *)a9;
- (id)_loadReservationsForDefinitionForRequest:(id)a3;
- (id)_lock_buildSnapshotterForRequest:(id)a3 attemptNumber:(unint64_t)a4;
- (id)_lock_snapshotterForRequest:(id)a3 requestContainingRequest:(id *)a4;
- (id)_lock_snapshottersForExtensionBundleIdentifier:(id)a3;
- (id)_snapshotCoordinatorForPath:(id)a3;
- (id)_snapshotSuspendedExtensionBundleIdentifiers;
- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4;
- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4;
- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3;
- (id)activeEditingSessionAssertionExtensionIdentifiers;
- (id)activeSnapshotterInUseAssertionReasons;
- (id)posterSnapshotForRequest:(id)a3 definition:(id)a4 error:(id *)a5;
- (unint64_t)_lock_numberOfRemainingOperations;
- (unint64_t)activeSnapshotterInUseAssertionCount;
- (void)_acquirePrewarmAssertionIfNeeded:(BOOL)a3;
- (void)_enqueueSnapshotForRequestIfNeeded:(id)a3 relativePriority:(unint64_t)a4 completion:(id)a5;
- (void)_enumerateAssertionObservers:(id)a3 respondingToSelector:(SEL)a4;
- (void)_evaluateInUseAssertionsByRemovingAssertion:(id)a3 orAddingAssertion:(id)a4;
- (void)_failRequest:(id)a3 withError:(id)a4 shouldReEnqueue:(BOOL)a5 attempt:(unint64_t)a6;
- (void)_ingestResultsFromSnapshotter:(id)a3;
- (void)_ingestSnapshotServiceResult:(id)a3 forRequest:(id)a4;
- (void)_invalidateEditingSessionAssertion:(id)a3 extensionIdentifier:(id)a4;
- (void)_invalidateExtensionSnapshotterDisabledAssertion:(id)a3 extensionIdentifier:(id)a4;
- (void)_invalidateInUseAssertion:(id)a3;
- (void)_kickoffNextOperation;
- (void)_lock_acquirePrewarmAssertionIfNeeded:(BOOL)a3;
- (void)_lock_addCompletion:(id)a3 forRequest:(id)a4;
- (void)_lock_cancelAllRequests;
- (void)_lock_cleanupAfterOperation:(id)a3;
- (void)_lock_cleanupAfterRequest:(id)a3;
- (void)_lock_enqueueSnapshotter:(id)a3 forRequest:(id)a4 attempt:(int64_t)a5 relativePriority:(unint64_t)a6 completion:(id)a7;
- (void)_lock_enumerateObservers:(id)a3;
- (void)_lock_fireCompletionsForRequest:(id)a3 snapshotImagesByReservation:(id)a4 error:(id)a5;
- (void)_lock_fireDidUpdateSnapshotForPath:(id)a3 snapshotImagesByReservation:(id)a4;
- (void)_lock_ingestSnapshotsByDefinition:(id)a3 forRequest:(id)a4;
- (void)_lock_invalidateAllCompletionHandlers;
- (void)_lock_kickoffNextOperation;
- (void)_lock_logOperationQueueStatus;
- (void)_lock_prioritizeOperation:(id)a3;
- (void)_lock_submitSBRendererRequestForRequest:(id)a3 relativePriority:(unint64_t)a4 completion:(id)a5;
- (void)_lock_teardownPrewarmAssertionShouldForce:(BOOL)a3 reason:(id)a4;
- (void)_operationDidComplete:(id)a3 snapshotter:(id)a4;
- (void)_posterBoardPrewarmAssertionWasInvalidated;
- (void)_setupMemoryPressureTracking;
- (void)_teardownBehaviorAssertionsIfAppropriate:(id)a3;
- (void)_teardownPrewarmAssertionShouldForce:(BOOL)a3 reason:(id)a4;
- (void)addBehaviorAssertionObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequests:(id)a3 reason:(id)a4;
- (void)dealloc;
- (void)duplicateSnapshotsFromPath:(id)a3 to:(id)a4;
- (void)fetchPosterSnapshotForRequest:(id)a3 definition:(id)a4 completion:(id)a5;
- (void)fetchPosterSnapshotsForRequest:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)prewarmCachesForFulfilledRequests:(id)a3;
- (void)prewarmSnapshotsForRequests:(id)a3 completion:(id)a4;
- (void)purgeSnapshotCacheForType:(int64_t)a3;
- (void)removeBehaviorAssertionObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation PBFPosterSnapshotManager

- (PBFPosterSnapshotManager)initWithRuntimeAssertionProvider:(id)a3 extensionProvider:(id)a4 modelCoordinatorProvider:(id)a5 applicationStateMonitor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  if (!v15)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]();
    }
LABEL_36:
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D06CLL);
  }
  v16 = v15;
  if (([v15 conformsToProtocol:&unk_1F2AE46C8] & 1) == 0)
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFRuntimeAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]();
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D0D0);
  }

  id v17 = v12;
  if (!v17)
  {
    v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]();
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D134);
  }
  v18 = v17;
  if (([v17 conformsToProtocol:&unk_1F2AC6AB8] & 1) == 0)
  {
    v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFExtensionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]();
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D198);
  }

  id v19 = v13;
  if (!v19)
  {
    v47 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]();
    }
    [v47 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D1FCLL);
  }
  v20 = v19;
  if (([v19 conformsToProtocol:&unk_1F2AC6B88] & 1) == 0)
  {
    v48 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFModelCoordinatorProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:]();
    }
    [v48 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D260);
  }

  id v21 = v14;
  NSClassFromString(&cfstr_Pbfapplication.isa);
  if (!v21)
  {
    v49 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.4();
    }
    [v49 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324D2C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFApplicationStateMonitorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:].cold.4();
    }
    goto LABEL_36;
  }

  v50.receiver = self;
  v50.super_class = (Class)PBFPosterSnapshotManager;
  v22 = [(PBFPosterSnapshotManager *)&v50 init];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_modelCoordinatorProvider, v20);
    objc_storeStrong((id *)&v23->_runtimeAssertionProvider, a3);
    objc_storeStrong((id *)&v23->_applicationStateMonitor, a6);
    *(void *)&v23->_lock._os_unfair_lock_opaque = 0;
    v23->_operationQueueLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v23->_extensionProvider, v18);
    uint64_t v24 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_requestToCompletion = v23->_lock_requestToCompletion;
    v23->_lock_requestToCompletion = (NSMapTable *)v24;

    uint64_t v26 = objc_opt_new();
    lock_priorityQueue = v23->_lock_priorityQueue;
    v23->_lock_priorityQueue = (PBFPriorityQueue *)v26;

    uint64_t v28 = objc_opt_new();
    lock_fulfilledSnapshotBlocks = v23->_lock_fulfilledSnapshotBlocks;
    v23->_lock_fulfilledSnapshotBlocks = (NSMutableArray *)v28;

    uint64_t v30 = objc_opt_new();
    assertionLock_inUseAssertions = v23->_assertionLock_inUseAssertions;
    v23->_assertionLock_inUseAssertions = (NSMutableSet *)v30;

    uint64_t v32 = objc_opt_new();
    assertionLock_extensionSnapshotterDisabledAssertions = v23->_assertionLock_extensionSnapshotterDisabledAssertions;
    v23->_assertionLock_extensionSnapshotterDisabledAssertions = (NSMutableDictionary *)v32;

    uint64_t v34 = objc_opt_new();
    assertionLock_extensionEditingInProgressAssertions = v23->_assertionLock_extensionEditingInProgressAssertions;
    v23->_assertionLock_extensionEditingInProgressAssertions = (NSMutableDictionary *)v34;

    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v23->_operationQueue;
    v23->_operationQueue = v36;

    [(NSOperationQueue *)v23->_operationQueue setName:@"SnapshotQueue"];
    [(NSOperationQueue *)v23->_operationQueue setSuspended:1];
    [(NSOperationQueue *)v23->_operationQueue setMaxConcurrentOperationCount:6];
    v23->_operationQueueLock_isOperationQueueSuspended = 1;
    os_activity_t v38 = _os_activity_create(&dword_1D31CE000, "PBFPosterSnapshotManager Snapshotting Activity", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DETACHED);
    snapshotActivity = v23->_snapshotActivity;
    v23->_snapshotActivity = (OS_os_activity *)v38;

    [(PBFPosterSnapshotManager *)v23 _setupMemoryPressureTracking];
    if (PUIFeatureEnabled())
    {
      uint64_t v40 = objc_opt_new();
      snapshotService = v23->_snapshotService;
      v23->_snapshotService = (PRUISSnapshotService *)v40;
    }
  }

  return v23;
}

- (void)dealloc
{
  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
  {
    dispatch_source_cancel(memoryPressureSource);
    v4 = self->_memoryPressureSource;
    self->_memoryPressureSource = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _lock_invalidateAllCompletionHandlers];
  os_unfair_lock_unlock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _teardownBehaviorAssertionsIfAppropriate:@"Dealloc"];
  [(PBFPosterSnapshotManager *)self _teardownPrewarmAssertionShouldForce:1 reason:@"Dealloc"];
  v5.receiver = self;
  v5.super_class = (Class)PBFPosterSnapshotManager;
  [(PBFPosterSnapshotManager *)&v5 dealloc];
}

- (void)_setupMemoryPressureTracking
{
  if (!self->_memoryPressureSource)
  {
    v3 = dispatch_queue_create("com.apple.PosterBoard.PBFPosterSnapshotManager.memoryWarningQueue", 0);
    objc_initWeak(&location, self);
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, v3);
    memoryPressureSource = self->_memoryPressureSource;
    self->_memoryPressureSource = v4;

    v6 = self->_operationQueue;
    v7 = self->_memoryPressureSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__PBFPosterSnapshotManager__setupMemoryPressureTracking__block_invoke;
    handler[3] = &unk_1E69826D8;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    v8 = v6;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__PBFPosterSnapshotManager__setupMemoryPressureTracking__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uintptr_t data = dispatch_source_get_data(WeakRetained[22]);
    switch(data)
    {
      case 4uLL:
        objc_super v5 = PBFLogSnapshotter();
        uint64_t v6 = 1;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 67109120;
          int v9 = 1;
          v7 = "DISPATCH_MEMORYPRESSURE_CRITICAL; setting MaxConcurrentOperationCount to %d";
          goto LABEL_11;
        }
LABEL_12:

        [*(id *)(a1 + 32) setMaxConcurrentOperationCount:v6];
        break;
      case 2uLL:
        objc_super v5 = PBFLogSnapshotter();
        uint64_t v6 = 2;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 67109120;
          int v9 = 2;
          v7 = "DISPATCH_MEMORYPRESSURE_WARN; setting MaxConcurrentOperationCount to %d";
          goto LABEL_11;
        }
        goto LABEL_12;
      case 1uLL:
        objc_super v5 = PBFLogSnapshotter();
        uint64_t v6 = 6;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 67109120;
          int v9 = 6;
          v7 = "DISPATCH_MEMORYPRESSURE_NORMAL; setting MaxConcurrentOperationCount to %d";
LABEL_11:
          _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v8, 8u);
          goto LABEL_12;
        }
        goto LABEL_12;
    }
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_lock);
    lock_observers = self->_lock_observers;
    if (!lock_observers)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v7 = self->_lock_observers;
      self->_lock_observers = v6;

      lock_observers = self->_lock_observers;
    }
    [(NSHashTable *)lock_observers addObject:v8];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v8;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSHashTable *)self->_lock_observers removeObject:v5];

    if (![(NSHashTable *)self->_lock_observers count])
    {
      lock_observers = self->_lock_observers;
      self->_lock_observers = 0;
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_lock_enumerateObservers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_lock_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)ingestSnapshotCollection:(id)a3 forConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  NSClassFromString(&cfstr_Prspostersnaps_0.isa);
  if (!v10)
  {
    v76 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:]();
    }
    [v76 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324E0B4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v77 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterSnapshotCollectionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:]();
    }
    [v77 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324E118);
  }

  id v11 = v9;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v11)
  {
    v78 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:]();
    }
    [v78 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324E17CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v79 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager ingestSnapshotCollection:forConfiguration:error:]();
    }
    [v79 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324E1E0);
  }

  long long v12 = [v11 _path];
  long long v13 = [v11 loadConfiguredPropertiesWithError:a5];
  if (v13)
  {
    long long v14 = [v10 primaryLayersSnapshot];
    long long v15 = [v14 surface];

    if (!v15)
    {
      if (a5)
      {
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v96 = *MEMORY[0x1E4F28588];
        v97 = @"unable to ingest snapshotCollection which does not possess snapshots backed by IOSurface";
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        v27 = objc_msgSend(v25, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v26);

        id v28 = v27;
        *a5 = v28;
      }
      v29 = PBFLogSnapshotter();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v99 = v10;
        _os_log_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEFAULT, "Snapshotter could not ingest snapshotCollection because it is not backed by an IOSurface: %@", buf, 0xCu);
      }
      BOOL v24 = 0;
      goto LABEL_57;
    }
    int IsVolatile = PUIIOSurfaceIsVolatile();
    uint64_t v17 = PBFLogSnapshotter();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    v87 = a5;
    v89 = self;
    if (IsVolatile)
    {
      if (!v18) {
        goto LABEL_19;
      }
      id v19 = [v12 serverIdentity];
      v20 = [v19 posterUUID];
      *(_DWORD *)buf = 138412546;
      id v99 = v15;
      __int16 v100 = 2114;
      v101 = v20;
      id v21 = "Attempting to ingest *VOLATILE* Surface %@ for path %{public}@";
      v22 = v17;
      uint32_t v23 = 22;
    }
    else
    {
      if (!v18) {
        goto LABEL_19;
      }
      id v19 = [v12 serverIdentity];
      v20 = [v19 posterUUID];
      *(_DWORD *)buf = 138543362;
      id v99 = v20;
      id v21 = "Attempting to ingest Surface for path %{public}@";
      v22 = v17;
      uint32_t v23 = 12;
    }
    _os_log_impl(&dword_1D31CE000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

LABEL_19:
    v90 = v12;

    uint64_t v30 = [v10 interfaceStyle];
    if (v30 == 2) {
      unint64_t v31 = 2;
    }
    else {
      unint64_t v31 = v30 == 1;
    }
    uint64_t v32 = [v10 accessibilityContrast];
    if (v32 == 1) {
      uint64_t v33 = 0;
    }
    else {
      uint64_t v33 = -1;
    }
    if (v32 == 2) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = v33;
    }
    v35 = [v15 attachmentForKey:@"kPaperboardIOSurfaceDeviceOrientationPropertiesKey"];
    v36 = v15;
    uint64_t v37 = [v35 unsignedIntegerValue];

    os_activity_t v38 = [v36 attachmentForKey:@"kPaperboardIOSurfaceInterfaceOrientationPropertiesKey"];
    uint64_t v39 = [v38 unsignedIntegerValue];

    if (MEMORY[0x1D94336E0]()) {
      uint64_t v40 = v37;
    }
    else {
      uint64_t v40 = v39;
    }
    if (!v40)
    {
      unint64_t v41 = [v10 interfaceOrientation];
      if (v41 > 2) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = qword_1D337EA98[v41];
      }
    }
    [v10 snapshotScale];
    double v43 = v42;
    uint64_t v84 = [v10 snapshotDisplayIdentity];
    v44 = +[PBFGenericDisplayContext displayContextForDisplayIdentifier:](PBFGenericDisplayContext, "displayContextForDisplayIdentifier:");
    v45 = [v44 displayContextWithUpdatedUserInterfaceStyle:PBFUserInterfaceStyleFromUIUserInterfaceStyle(v31)];
    v46 = [v45 displayContextWithUpdatedAccessibilityContrast:PBFAccessibilityContrastFromUIAccessibilityContrast(v34)];
    v47 = [v46 displayContextWithUpdatedInterfaceOrientation:v40];

    v48 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    uint64_t v49 = +[PBFPosterSnapshotDefinition switcherSnapshotDefinition];
    objc_super v50 = v89;
    uint64_t v51 = [(PBFPosterSnapshotManager *)v89 _createSnapshotForDefinition:v49 withSurface:v36 snapshotScale:v13 configuredProperties:v90 path:v47 context:v87 error:v43];
    v52 = (void *)v51;
    long long v15 = v36;
    v85 = (void *)v49;
    if (!v51)
    {
      BOOL v24 = 0;
      long long v12 = v90;
      v29 = v84;
LABEL_56:

LABEL_57:
      goto LABEL_58;
    }
    v82 = (void *)v51;
    v83 = v36;
    [v48 setObject:v51 forKeyedSubscript:v49];
    v53 = [v10 floatingLayerSnapshot];
    uint64_t v54 = [v53 surface];

    v86 = (void *)v54;
    if (!v54) {
      goto LABEL_46;
    }
    int v55 = PUIIOSurfaceIsVolatile();
    v56 = PBFLogSnapshotter();
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    if (v55)
    {
      long long v12 = v90;
      v58 = v87;
      if (v57)
      {
        v59 = [v90 serverIdentity];
        v60 = [v59 posterUUID];
        *(_DWORD *)buf = 138412546;
        id v99 = v83;
        __int16 v100 = 2114;
        v101 = v60;
        v61 = "Attempting to ingest *VOLATILE* floating Surface %@ for path %{public}@";
        v62 = v56;
        uint32_t v63 = 22;
LABEL_43:
        _os_log_impl(&dword_1D31CE000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);

        long long v12 = v90;
      }
    }
    else
    {
      long long v12 = v90;
      v58 = v87;
      if (v57)
      {
        v59 = [v90 serverIdentity];
        v60 = [v59 posterUUID];
        *(_DWORD *)buf = 138543362;
        id v99 = v60;
        v61 = "Attempting to ingest floating Surface for path %{public}@";
        v62 = v56;
        uint32_t v63 = 12;
        goto LABEL_43;
      }
    }

    v64 = +[PBFPosterSnapshotDefinition switcherFloatingLayerSnapshotDefinition];
    uint64_t v65 = [(PBFPosterSnapshotManager *)v89 _createSnapshotForDefinition:v64 withSurface:v86 snapshotScale:v13 configuredProperties:v12 path:v47 context:v58 error:v43];
    if (!v65)
    {
      BOOL v24 = 0;
LABEL_55:

      long long v15 = v83;
      v29 = v84;
      v52 = v82;
      goto LABEL_56;
    }
    v66 = (void *)v65;
    [v48 setObject:v65 forKeyedSubscript:v64];

    objc_super v50 = v89;
LABEL_46:
    id v81 = v11;
    id v88 = v10;
    v64 = [(PBFPosterSnapshotManager *)v50 _snapshotCoordinatorForPath:v90];
    [v64 ingestSnapshotsByDefinition:v48 path:v90 configuredProperties:v13 context:v47];
    v67 = objc_opt_new();
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v80 = v48;
    id v68 = v48;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v91 objects:v95 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v92 != v71) {
            objc_enumerationMutation(v68);
          }
          uint64_t v73 = *(void *)(*((void *)&v91 + 1) + 8 * i);
          v74 = [v64 snapshotReservationForDefinition:v73 configuredProperties:v13 context:v47];
          [v67 setObject:v74 forKeyedSubscript:v73];
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v91 objects:v95 count:16];
      }
      while (v70);
    }

    os_unfair_lock_lock(&v89->_lock);
    long long v12 = v90;
    [(PBFPosterSnapshotManager *)v89 _lock_fireDidUpdateSnapshotForPath:v90 snapshotImagesByReservation:v67];
    os_unfair_lock_unlock(&v89->_lock);

    BOOL v24 = 1;
    id v10 = v88;
    v48 = v80;
    id v11 = v81;
    goto LABEL_55;
  }
  BOOL v24 = 0;
LABEL_58:

  return v24;
}

- (id)_createSnapshotForDefinition:(id)a3 withSurface:(id)a4 snapshotScale:(double)a5 configuredProperties:(id)a6 path:(id)a7 context:(id)a8 error:(id *)a9
{
  long long v15 = (void *)MEMORY[0x1E4F927D8];
  id v16 = a4;
  uint64_t v17 = objc_msgSend(v15, "pbf_imageEncoderForPath:definition:configuredProperties:context:", a7, a3, a6, a8);
  BOOL v18 = +[PBFPosterSnapshotter createSnapshotUsingIOSurface:v16 snapshotScale:v17 imageEncoder:a9 error:a5];

  return v18;
}

- (id)acquireSnapshotterInUseAssertionWithReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __71__PBFPosterSnapshotManager_acquireSnapshotterInUseAssertionWithReason___block_invoke;
  id v11 = &unk_1E6982EE0;
  objc_copyWeak(&v12, &location);
  uint64_t v6 = (void *)[v5 initWithIdentifier:@"com.apple.PosterBoard.snapshotter.inUseAssertion" forReason:v4 invalidationBlock:&v8];
  -[PBFPosterSnapshotManager _evaluateInUseAssertionsByRemovingAssertion:orAddingAssertion:](self, "_evaluateInUseAssertionsByRemovingAssertion:orAddingAssertion:", 0, v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __71__PBFPosterSnapshotManager_acquireSnapshotterInUseAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _invalidateInUseAssertion:v3];
}

- (id)activeSnapshotterInUseAssertionReasons
{
  id v3 = objc_opt_new();
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  id v5 = [(NSMutableSet *)self->_assertionLock_inUseAssertions bs_array];
  uint64_t v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_16);
  [v3 addObjectsFromArray:v6];

  os_unfair_lock_unlock(p_assertionLock);
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

uint64_t __66__PBFPosterSnapshotManager_activeSnapshotterInUseAssertionReasons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason];
}

- (unint64_t)activeSnapshotterInUseAssertionCount
{
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  unint64_t v4 = [(NSMutableSet *)self->_assertionLock_inUseAssertions count];
  os_unfair_lock_unlock(p_assertionLock);
  return v4;
}

- (void)_invalidateInUseAssertion:(id)a3
{
}

- (void)_evaluateInUseAssertionsByRemovingAssertion:(id)a3 orAddingAssertion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  if (v6) {
    [(NSMutableSet *)self->_assertionLock_inUseAssertions removeObject:v6];
  }
  if (v7) {
    [(NSMutableSet *)self->_assertionLock_inUseAssertions addObject:v7];
  }
  uint64_t v9 = [(NSMutableSet *)self->_assertionLock_inUseAssertions count];
  os_unfair_lock_lock(&self->_operationQueueLock);
  BOOL operationQueueLock_isOperationQueueSuspended = self->_operationQueueLock_isOperationQueueSuspended;
  os_unfair_lock_unlock(&self->_operationQueueLock);
  objc_initWeak(&location, self);
  if (!v9)
  {
    if (!operationQueueLock_isOperationQueueSuspended)
    {
      id v21 = PBFLogSnapshotter();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "snapshotter operation queue suspending...", buf, 2u);
      }

      runtimeAssertionProvider = self->_runtimeAssertionProvider;
      uint32_t v23 = [MEMORY[0x1E4F96478] currentProcess];
      BOOL v24 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePrewarmRuntimeAssertionForReason:@"Updating foreground->background" target:v23 invalidationHandler:0];

      os_activity_scope_leave(&self->_snapshotActivityState);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke;
      v29[3] = &unk_1E6982F50;
      long long v15 = &v31;
      objc_copyWeak(&v31, &location);
      v29[4] = self;
      uint64_t v30 = v24;
      id v16 = v24;
      uint64_t v17 = _Block_copy(v29);
      BOOL v18 = v30;
      goto LABEL_20;
    }
    id v19 = PBFLogSnapshotter();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "snapshotter operation queue already suspended";
LABEL_15:
      _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_16:

    os_unfair_lock_unlock(p_assertionLock);
    goto LABEL_22;
  }
  if (!operationQueueLock_isOperationQueueSuspended)
  {
    id v19 = PBFLogSnapshotter();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v20 = "snapshotter operation queue already activated; no work to do";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  os_activity_scope_enter((os_activity_t)self->_snapshotActivity, &self->_snapshotActivityState);
  id v11 = PBFLogSnapshotter();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v11, OS_LOG_TYPE_DEFAULT, "snapshotter operation queue activating...", buf, 2u);
  }

  id v12 = self->_runtimeAssertionProvider;
  long long v13 = [MEMORY[0x1E4F96478] currentProcess];
  long long v14 = [(PBFRuntimeAssertionProviding *)v12 acquirePrewarmRuntimeAssertionForReason:@"Updating background->foreground" target:v13 invalidationHandler:0];

  [(PBFPosterSnapshotManager *)self _updateOperationQueueSuspended:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke_182;
  aBlock[3] = &unk_1E69826D8;
  long long v15 = &v28;
  objc_copyWeak(&v28, &location);
  v27 = v14;
  id v16 = v14;
  uint64_t v17 = _Block_copy(aBlock);
  BOOL v18 = v27;
LABEL_20:

  objc_destroyWeak(v15);
  os_unfair_lock_unlock(p_assertionLock);
  if (v17)
  {
    v25 = [NSString stringWithUTF8String:"-[PBFPosterSnapshotManager _evaluateInUseAssertionsByRemovingAssertion:orAddingAssertion:]"];
    PBFDispatchAsyncWithString(v25, QOS_CLASS_USER_INITIATED, v17);
  }
LABEL_22:
  objc_destroyWeak(&location);
}

void __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke_2;
    v6[3] = &unk_1E6982F28;
    v6[4] = *(void *)(a1 + 32);
    [WeakRetained _enumerateAssertionObservers:v6 respondingToSelector:sel_assertionProviderDidRelinquishInUseAssertion_];
    [v3 _teardownPrewarmAssertionShouldForce:1 reason:@"Queue suspended"];
  }
  unint64_t v4 = PBFLogSnapshotter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "snapshotter operation queue suspended", v5, 2u);
  }

  [*(id *)(a1 + 40) invalidate];
}

uint64_t __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 assertionProviderDidRelinquishInUseAssertion:*(void *)(a1 + 32)];
}

void __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke_182(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _acquirePrewarmAssertionIfNeeded:0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke_2_183;
    v6[3] = &unk_1E6982F28;
    v6[4] = v3;
    [v3 _enumerateAssertionObservers:v6 respondingToSelector:sel_assertionProviderDidAcquireInUseAssertion_];
  }
  unint64_t v4 = PBFLogSnapshotter();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "snapshotter operation queue activated", v5, 2u);
  }

  [*(id *)(a1 + 32) invalidate];
}

uint64_t __90__PBFPosterSnapshotManager__evaluateInUseAssertionsByRemovingAssertion_orAddingAssertion___block_invoke_2_183(uint64_t a1, void *a2)
{
  return [a2 assertionProviderDidAcquireInUseAssertion:*(void *)(a1 + 32)];
}

- (id)acquireSnapshotterDisabledAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager acquireSnapshotterDisabledAssertionForProvider:withReason:]();
    }
LABEL_13:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324ED30);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager acquireSnapshotterDisabledAssertionForProvider:withReason:]();
    }
    goto LABEL_13;
  }

  objc_initWeak(&location, self);
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v10 = [NSString stringWithFormat:@"com.apple.PosterBoard.snapshotter.disabledAssertion-%@", v8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PBFPosterSnapshotManager_acquireSnapshotterDisabledAssertionForProvider_withReason___block_invoke;
  v16[3] = &unk_1E6982F78;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v17 = v11;
  id v12 = (void *)[v9 initWithIdentifier:v10 forReason:v7 invalidationBlock:v16];

  os_unfair_lock_lock(&self->_assertionLock);
  long long v13 = [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions objectForKey:v11];
  if (!v13)
  {
    long long v13 = objc_opt_new();
    [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions setObject:v13 forKey:v11];
  }
  [v13 addObject:v12];
  os_unfair_lock_unlock(&self->_assertionLock);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

void __86__PBFPosterSnapshotManager_acquireSnapshotterDisabledAssertionForProvider_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _invalidateExtensionSnapshotterDisabledAssertion:v4 extensionIdentifier:*(void *)(a1 + 32)];
}

- (id)acquireEditingSessionAssertionForProvider:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    id v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager acquireEditingSessionAssertionForProvider:withReason:]();
    }
LABEL_18:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324F138);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager acquireEditingSessionAssertionForProvider:withReason:]();
    }
    goto LABEL_18;
  }

  objc_initWeak(&location, self);
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = @"(null)";
  }
  id v10 = [@"EditingSessionAcquisition-" stringByAppendingString:v9];
  id v11 = [(PBFPosterSnapshotManager *)self acquireSnapshotterDisabledAssertionForProvider:v8 withReason:v10];

  id v12 = objc_alloc(MEMORY[0x1E4F4F838]);
  long long v13 = [NSString stringWithFormat:@"com.apple.PosterBoard.editingSession-%@", v8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke;
  v24[3] = &unk_1E6982FA0;
  id v14 = v11;
  id v25 = v14;
  objc_copyWeak(&v27, &location);
  id v15 = v8;
  id v26 = v15;
  id v16 = (void *)[v12 initWithIdentifier:v13 forReason:v7 invalidationBlock:v24];

  os_unfair_lock_lock(&self->_assertionLock);
  id v17 = [(NSMutableDictionary *)self->_assertionLock_extensionEditingInProgressAssertions objectForKey:v15];
  uint64_t v18 = [v17 count];
  if (!v18)
  {
    uint64_t v19 = objc_opt_new();

    [(NSMutableDictionary *)self->_assertionLock_extensionEditingInProgressAssertions setObject:v19 forKey:v15];
    id v17 = (void *)v19;
  }
  [v17 addObject:v16];
  os_unfair_lock_unlock(&self->_assertionLock);
  if (!v18)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke_2;
    v22[3] = &unk_1E6982FC8;
    v22[4] = self;
    id v23 = v15;
    [(PBFPosterSnapshotManager *)self _enumerateAssertionObservers:v22 respondingToSelector:sel_assertionProviderDidAcquireEditingSessionAssertion_forExtensionIdentifier_];
  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
  return v16;
}

void __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _invalidateEditingSessionAssertion:v4 extensionIdentifier:*(void *)(a1 + 40)];
}

uint64_t __81__PBFPosterSnapshotManager_acquireEditingSessionAssertionForProvider_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 assertionProviderDidAcquireEditingSessionAssertion:*(void *)(a1 + 32) forExtensionIdentifier:*(void *)(a1 + 40)];
}

- (id)activeEditingSessionAssertionExtensionIdentifiers
{
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(NSMutableDictionary *)self->_assertionLock_extensionEditingInProgressAssertions allKeys];
  id v6 = [v4 setWithArray:v5];

  os_unfair_lock_unlock(p_assertionLock);
  return v6;
}

- (void)addBehaviorAssertionObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    os_unfair_lock_lock(&self->_assertionLock);
    assertionLock_assertionObservers = self->_assertionLock_assertionObservers;
    if (!assertionLock_assertionObservers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_assertionLock_assertionObservers;
      self->_assertionLock_assertionObservers = v6;

      assertionLock_assertionObservers = self->_assertionLock_assertionObservers;
    }
    [(NSHashTable *)assertionLock_assertionObservers addObject:v8];
    os_unfair_lock_unlock(&self->_assertionLock);
    id v4 = v8;
  }
}

- (void)removeBehaviorAssertionObserver:(id)a3
{
  if (a3)
  {
    p_assertionLock = &self->_assertionLock;
    id v5 = a3;
    os_unfair_lock_lock(p_assertionLock);
    [(NSHashTable *)self->_assertionLock_assertionObservers removeObject:v5];

    os_unfair_lock_unlock(p_assertionLock);
  }
}

- (void)_enumerateAssertionObservers:(id)a3 respondingToSelector:(SEL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, uint64_t, char *))a3;
  os_unfair_lock_lock(&self->_assertionLock);
  id v6 = (void *)[(NSHashTable *)self->_assertionLock_assertionObservers copy];
  os_unfair_lock_unlock(&self->_assertionLock);
  if ([v6 count])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL lock_invalidated = self->_lock_invalidated;
    os_unfair_lock_unlock(p_lock);
    if (!lock_invalidated)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
          if (objc_opt_respondsToSelector())
          {
            char v15 = 0;
            v5[2](v5, v14, &v15);
            if (v15) {
              break;
            }
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v11) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
  }
}

- (void)_invalidateExtensionSnapshotterDisabledAssertion:(id)a3 extensionIdentifier:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_assertionLock);
  id v7 = [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions objectForKey:v8];
  [v7 removeObject:v6];

  if ([v7 count])
  {
    os_unfair_lock_unlock(&self->_assertionLock);
  }
  else
  {
    [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions removeObjectForKey:v8];
    os_unfair_lock_unlock(&self->_assertionLock);
    [(PBFPosterSnapshotManager *)self _kickoffNextOperation];
  }
}

- (void)_invalidateEditingSessionAssertion:(id)a3 extensionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_unfair_lock_lock(&self->_assertionLock);
  id v8 = [(NSMutableDictionary *)self->_assertionLock_extensionEditingInProgressAssertions objectForKey:v6];
  [v8 removeObject:v7];

  if ([v8 count])
  {
    os_unfair_lock_unlock(&self->_assertionLock);
  }
  else
  {
    [(NSMutableDictionary *)self->_assertionLock_extensionEditingInProgressAssertions removeObjectForKey:v6];
    os_unfair_lock_unlock(&self->_assertionLock);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PBFPosterSnapshotManager__invalidateEditingSessionAssertion_extensionIdentifier___block_invoke;
    v9[3] = &unk_1E6982FC8;
    v9[4] = self;
    id v10 = v6;
    [(PBFPosterSnapshotManager *)self _enumerateAssertionObservers:v9 respondingToSelector:sel_assertionProviderDidRelinquishEditingSessionAssertion_forExtensionIdentifier_];
  }
}

uint64_t __83__PBFPosterSnapshotManager__invalidateEditingSessionAssertion_extensionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assertionProviderDidRelinquishEditingSessionAssertion:*(void *)(a1 + 32) forExtensionIdentifier:*(void *)(a1 + 40)];
}

- (id)_snapshotSuspendedExtensionBundleIdentifiers
{
  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions allKeys];
  id v6 = [v4 setWithArray:v5];

  os_unfair_lock_unlock(p_assertionLock);
  return v6;
}

- (BOOL)_isExtensionProhibitedFromSnapshotting:(id)a3
{
  id v3 = self;
  p_assertionLock = &self->_assertionLock;
  id v5 = a3;
  os_unfair_lock_lock(p_assertionLock);
  LOBYTE(v3) = [(PBFPosterSnapshotManager *)v3 _assertionLock_isExtensionProhibitedFromSnapshotting:v5];

  os_unfair_lock_unlock(p_assertionLock);
  return (char)v3;
}

- (BOOL)_assertionLock_isExtensionProhibitedFromSnapshotting:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_posterBoardPrewarmAssertionWasInvalidated
{
}

- (BOOL)_isOperationQueueSuspended
{
  v2 = self;
  p_operationQueueLock = &self->_operationQueueLock;
  os_unfair_lock_lock(&self->_operationQueueLock);
  LOBYTE(v2) = v2->_operationQueueLock_isOperationQueueSuspended;
  os_unfair_lock_unlock(p_operationQueueLock);
  return (char)v2;
}

- (BOOL)_updateOperationQueueSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  p_operationQueueLock = &self->_operationQueueLock;
  os_unfair_lock_lock(&self->_operationQueueLock);
  LOBYTE(v3) = [(PBFPosterSnapshotManager *)self _operationQueueLock_updateOperationQueueSuspended:v3];
  os_unfair_lock_unlock(p_operationQueueLock);
  return v3;
}

- (BOOL)_operationQueueLock_updateOperationQueueSuspended:(BOOL)a3
{
  int v3 = a3;
  int operationQueueLock_isOperationQueueSuspended = self->_operationQueueLock_isOperationQueueSuspended;
  if (operationQueueLock_isOperationQueueSuspended != a3)
  {
    self->_int operationQueueLock_isOperationQueueSuspended = a3;
    [(NSOperationQueue *)self->_operationQueue setSuspended:a3];
  }
  return operationQueueLock_isOperationQueueSuspended != v3;
}

- (id)posterSnapshotForRequest:(id)a3 definition:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  NSClassFromString(&cfstr_Pbfpostersnaps_1.isa);
  if (!v10)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:]();
    }
LABEL_24:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324FB18);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324FB7CLL);
  }

  id v11 = v9;
  NSClassFromString(&cfstr_Pbfpostersnaps_5.isa);
  if (!v11)
  {
    id v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324FBE0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager posterSnapshotForRequest:definition:error:]();
    }
    goto LABEL_24;
  }

  if ([(PBFPosterSnapshotManager *)self isSnapshotRequestFulfilled:v10])
  {
    uint64_t v12 = [v10 path];
    uint64_t v13 = [(PBFPosterSnapshotManager *)self _snapshotCoordinatorForPath:v12];
    uint64_t v14 = [v10 configuredProperties];
    char v15 = [v10 displayContext];
    long long v16 = [v13 snapshotReservationForDefinition:v11 configuredProperties:v14 context:v15];

    long long v17 = [v16 error];
    long long v18 = v17;
    if (a5) {
      *a5 = v17;
    }
    long long v19 = [v16 image];
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (void)fetchPosterSnapshotForRequest:(id)a3 definition:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  NSClassFromString(&cfstr_Pbfpostersnaps_1.isa);
  if (!v11)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:]();
    }
LABEL_22:
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324FF38);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D324FF9CLL);
  }

  id v12 = v9;
  NSClassFromString(&cfstr_Pbfpostersnaps_5.isa);
  if (!v12)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3250000);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotDefinitionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotForRequest:definition:completion:]();
    }
    goto LABEL_22;
  }

  uint64_t v13 = [v11 path];
  uint64_t v14 = [(PBFPosterSnapshotManager *)self _snapshotCoordinatorForPath:v13];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke;
  aBlock[3] = &unk_1E6982FF0;
  id v15 = v10;
  id v29 = v15;
  long long v16 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  if ([(PBFPosterSnapshotManager *)self isSnapshotRequestFulfilled:v11])
  {
    long long v17 = [v11 configuredProperties];
    long long v18 = [v11 displayContext];
    long long v19 = [v14 snapshotReservationForDefinition:v12 configuredProperties:v17 context:v18];

    v16[2](v16, v19, 0);
  }
  else if (v15)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke_2;
    v23[3] = &unk_1E6983018;
    id v24 = v14;
    id v25 = v12;
    id v26 = v11;
    id v27 = v16;
    [(PBFPosterSnapshotManager *)self _enqueueSnapshotForRequestIfNeeded:v26 relativePriority:0 completion:v23];
  }
  else
  {
    [(PBFPosterSnapshotManager *)self _enqueueSnapshotForRequestIfNeeded:v11 relativePriority:0 completion:0];
  }
}

void __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    id v7 = [v9 image];
    if (v5)
    {
      (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
    }
    else
    {
      id v8 = [v9 error];
      (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
    }
  }
}

void __80__PBFPosterSnapshotManager_fetchPosterSnapshotForRequest_definition_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if (v9)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) configuredProperties];
    id v8 = [*(id *)(a1 + 48) displayContext];
    BOOL v4 = [v5 snapshotReservationForDefinition:v6 configuredProperties:v7 context:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchPosterSnapshotsForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:]();
    }
LABEL_16:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3250398);
  }
  id v8 = (void (**)(void, void))v7;
  id v9 = v6;
  NSClassFromString(&cfstr_Pbfpostersnaps_1.isa);
  if (!v9)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32503FCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager fetchPosterSnapshotsForRequest:completion:]();
    }
    goto LABEL_16;
  }

  if ([(PBFPosterSnapshotManager *)self isSnapshotRequestFulfilled:v9])
  {
    id v10 = [(PBFPosterSnapshotManager *)self _loadReservationsForDefinitionForRequest:v9];
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PBFPosterSnapshotManager_fetchPosterSnapshotsForRequest_completion___block_invoke;
    v13[3] = &unk_1E6983040;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    [(PBFPosterSnapshotManager *)self _enqueueSnapshotForRequestIfNeeded:v14 relativePriority:0 completion:v13];
  }
}

void __70__PBFPosterSnapshotManager_fetchPosterSnapshotsForRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _loadReservationsForDefinitionForRequest:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)prewarmSnapshotsForRequests:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)[v6 mutableCopy];
    id v9 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([(PBFPosterSnapshotManager *)self isSnapshotRequestFulfilled:v15])
          {
            [v9 addObject:v15];
            [v8 removeObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v12);
    }

    [(PBFPosterSnapshotManager *)self prewarmCachesForFulfilledRequests:v9];
    if ([v8 count])
    {
      long long v16 = dispatch_group_create();
      dispatch_group_enter(v16);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke;
      v21[3] = &unk_1E6983090;
      long long v17 = v16;
      v22 = v17;
      id v23 = self;
      id v24 = v10;
      [v8 enumerateObjectsUsingBlock:v21];
      if (v7)
      {
        long long v18 = dispatch_get_global_queue(25, 0);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_3;
        v19[3] = &unk_1E69830B8;
        id v20 = v7;
        dispatch_group_notify(v17, v18, v19);
      }
      dispatch_group_leave(v17);
    }
    else if (v7)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_group_enter(v5);
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 48) count] - a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_2;
  v9[3] = &unk_1E6983068;
  id v10 = *(id *)(a1 + 32);
  [v7 _enqueueSnapshotForRequestIfNeeded:v6 relativePriority:v8 completion:v9];
}

void __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __67__PBFPosterSnapshotManager_prewarmSnapshotsForRequests_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL lock_invalidated = 1;
  [(PBFPosterSnapshotManager *)self _lock_teardownPrewarmAssertionShouldForce:1 reason:@"invalidated"];
  [(PBFPosterSnapshotManager *)self _lock_cancelAllRequests];
  [(PBFPosterSnapshotManager *)self _lock_invalidateAllCompletionHandlers];
  os_unfair_lock_unlock(p_lock);
  [(PBFPosterSnapshotManager *)self _teardownBehaviorAssertionsIfAppropriate:@"invalidated"];
}

- (void)cancelRequests:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = [a3 allObjects];
  [(PBFPosterSnapshotManager *)self cancelRequestedSnapshotsForRequests:v7 reason:v6];
}

- (void)_lock_invalidateAllCompletionHandlers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v3 = objc_opt_new();
  BOOL v4 = [(NSMapTable *)self->_lock_requestToCompletion keyEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      [v3 addObject:v6];
      uint64_t v7 = [v4 nextObject];

      id v6 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), 0, v8, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)purgeSnapshotCacheForType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoordinatorProvider);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PBFPosterSnapshotManager_purgeSnapshotCacheForType___block_invoke;
  v5[3] = &__block_descriptor_40_e69_v32__0__PBFPosterSnapshotCoordinator_8__PFServerPosterIdentity_16_B24l;
  v5[4] = a3;
  objc_msgSend(WeakRetained, "pbf_enumerateSnapshotCoordinators:", v5);
}

void __54__PBFPosterSnapshotManager_purgeSnapshotCacheForType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 type] == *(void *)(a1 + 32)) {
    [v5 cancel];
  }
}

- (void)prewarmCachesForFulfilledRequests:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoordinatorProvider);
  if (WeakRetained)
  {
    uint64_t v7 = NSStringFromSelector(a2);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__PBFPosterSnapshotManager_prewarmCachesForFulfilledRequests___block_invoke;
    v8[3] = &unk_1E69808E8;
    id v9 = v5;
    id v10 = WeakRetained;
    PBFDispatchAsyncWithString(v7, QOS_CLASS_USER_INITIATED, v8);
  }
}

void __62__PBFPosterSnapshotManager_prewarmCachesForFulfilledRequests___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        id v2 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        int v3 = *(void **)(a1 + 40);
        BOOL v4 = [v2 path];
        id v5 = [v4 identity];
        id v6 = objc_msgSend(v3, "pbf_posterSnapshotCoordinatorForIdentity:", v5);

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v7 = [v2 definitions];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v13 = [v2 configuredProperties];
              long long v14 = [v2 displayContext];
              long long v15 = [v6 snapshotReservationForDefinition:v12 configuredProperties:v13 context:v14];
              id v16 = (id)[v15 image];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
}

- (BOOL)cancelRequestedSnapshotsForExtensionBundleIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager cancelRequestedSnapshotsForExtensionBundleIdentifier:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32510BCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager cancelRequestedSnapshotsForExtensionBundleIdentifier:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3251120);
  }

  os_unfair_lock_lock(&self->_lock);
  id v5 = [(PBFPosterSnapshotManager *)self _lock_snapshottersForExtensionBundleIdentifier:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (void *)[v5 copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v16;
    uint64_t v10 = v7;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PBFPosterSnapshotManager *)self _lock_cancelSnapshotter:*(void *)(*((void *)&v15 + 1) + 8 * v11++) reason:@"cancelRequestedSnapshotsForExtensionBundleIdentifier:"];
      }
      while (v10 != v11);
      uint64_t v10 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8 != 0;
}

- (BOOL)cancelRequestedSnapshotsForRequests:(id)a3 reason:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v54 = a4;
  double v42 = v6;
  if ([v6 count])
  {
    locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v46 = objc_opt_new();
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v72 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "provider", lock, v42);
          unint64_t v14 = [(PBFPriorityQueue *)self->_lock_priorityQueue numberOfEnqueuedUpItemsForIdentifier:v13];
          if (v14 | [(PBFPriorityQueue *)self->_lock_priorityQueue numberOfActiveItemForIdentifier:v13])
          {
            long long v15 = [v46 objectForKey:v13];
            if (!v15)
            {
              long long v15 = objc_opt_new();
              [v46 setObject:v15 forKey:v13];
            }
            [v15 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v71 objects:v79 count:16];
      }
      while (v9);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = [v46 keyEnumerator];
    uint64_t v45 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    char v16 = 0;
    if (v45)
    {
      uint64_t v44 = *(void *)v68;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v68 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v47 = v17;
          uint64_t v53 = *(void *)(*((void *)&v67 + 1) + 8 * v17);
          long long v18 = [v46 objectForKey:lock];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v48 = v18;
          uint64_t v50 = [v18 countByEnumeratingWithState:&v63 objects:v77 count:16];
          if (v50)
          {
            uint64_t v49 = *(void *)v64;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v64 != v49) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v52 = v19;
                uint64_t v20 = *(void *)(*((void *)&v63 + 1) + 8 * v19);
                long long v21 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedItemsForIdentifier:v53];
                long long v59 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                uint64_t v22 = [v21 countByEnumeratingWithState:&v59 objects:v76 count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  uint64_t v24 = *(void *)v60;
                  do
                  {
                    for (uint64_t j = 0; j != v23; ++j)
                    {
                      if (*(void *)v60 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      long long v26 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                      long long v27 = [v26 request];
                      int v28 = [v27 isEqual:v20];

                      if (v28)
                      {
                        id v29 = [v26 snapshotter];
                        [(PBFPosterSnapshotManager *)self _lock_cancelSnapshotter:v29 reason:v54];

                        char v16 = 1;
                      }
                    }
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v59 objects:v76 count:16];
                  }
                  while (v23);
                }
                uint64_t v51 = v21;
                uint64_t v30 = self;
                uint64_t v31 = [(PBFPriorityQueue *)self->_lock_priorityQueue activeItemsForIdentifier:v53];
                long long v55 = 0u;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v75 count:16];
                if (v32)
                {
                  uint64_t v33 = v32;
                  uint64_t v34 = *(void *)v56;
                  do
                  {
                    for (uint64_t k = 0; k != v33; ++k)
                    {
                      if (*(void *)v56 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      v36 = *(void **)(*((void *)&v55 + 1) + 8 * k);
                      uint64_t v37 = [v36 request];
                      int v38 = [v37 isEqual:v20];

                      if (v38)
                      {
                        uint64_t v39 = [v36 snapshotter];
                        [(PBFPosterSnapshotManager *)v30 _lock_cancelSnapshotter:v39 reason:v54];

                        char v16 = 1;
                      }
                    }
                    uint64_t v33 = [v31 countByEnumeratingWithState:&v55 objects:v75 count:16];
                  }
                  while (v33);
                }

                uint64_t v19 = v52 + 1;
                self = v30;
              }
              while (v52 + 1 != v50);
              uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v77 count:16];
            }
            while (v50);
          }

          uint64_t v17 = v47 + 1;
        }
        while (v47 + 1 != v45);
        uint64_t v45 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
      }
      while (v45);
    }

    os_unfair_lock_unlock(lock);
  }
  else
  {
    char v16 = 0;
  }

  return v16 & 1;
}

- (BOOL)cancelRequestedSnapshotsForIdentity:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterSnapshotManager cancelRequestedSnapshotsForIdentity:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3251828);
  }
  id v5 = v4;
  uint64_t v6 = [v4 provider];
  os_unfair_lock_lock(&self->_lock);
  long long v18 = (void *)v6;
  [(PBFPosterSnapshotManager *)self _lock_snapshottersForExtensionBundleIdentifier:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v23 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v19 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 serverPosterPath];
        unint64_t v14 = [v13 identity];
        int v15 = [v14 isEqual:v5];

        if (v15)
        {
          [(PBFPosterSnapshotManager *)self _lock_cancelSnapshotter:v12 reason:@"cancelRequestedSnapshotsForIdentity:"];
          char v19 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  else
  {
    char v19 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);

  return v19 & 1;
}

- (BOOL)areSnapshotsFullyPrepared:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!-[PBFPosterSnapshotManager isSnapshotRequestFulfilled:](self, "isSnapshotRequestFulfilled:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isSnapshotRequestFulfilled:(id)a3
{
  id v4 = a3;
  p_modelCoordinatorProvider = &self->_modelCoordinatorProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_modelCoordinatorProvider);

  BOOL v7 = 0;
  if (v4 && WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_modelCoordinatorProvider);
    BOOL v7 = +[PBFPosterSnapshotRequest isRequestFulfilled:v4 modelCoordinatorProvider:v8];
  }
  return v7;
}

- (BOOL)_isRequestValid:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F927B0];
  uint64_t v6 = [a3 path];
  BOOL v7 = [v6 role];
  char v8 = [v5 snapshottingSupportedForRole:v7];

  if (a4 && (v8 & 1) == 0)
  {
    BOOL v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28588];
    v13[0] = @"PBFPosterSnapshotManager only supports PFPosterRoleLockScreen currently.";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    objc_msgSend(v9, "pbf_generalErrorWithCode:userInfo:", 1, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)cancelAllRequests
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _lock_cancelAllRequests];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelAllRequests
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v3 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedItemsForIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        [v8 makeObjectsPerformSelector:sel_cancel];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v5);
  }

  [(PBFPriorityQueue *)self->_lock_priorityQueue removeAllEnqueuedItems];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = [(PBFPriorityQueue *)self->_lock_priorityQueue activeIdentifiers];
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v14 = [(PBFPriorityQueue *)self->_lock_priorityQueue activeItemsForIdentifier:v13];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              char v19 = [*(id *)(*((void *)&v21 + 1) + 8 * k) snapshotter];
              [(PBFPosterSnapshotManager *)self _lock_cancelSnapshotter:v19 reason:@"cancelAllRequests"];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v33 count:16];
          }
          while (v16);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v10);
  }

  [(PBFPriorityQueue *)self->_lock_priorityQueue removeAllActiveItems];
}

- (void)duplicateSnapshotsFromPath:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v8 = [(PBFPosterSnapshotManager *)self _snapshotCoordinatorForPath:a3];
  BOOL v7 = [(PBFPosterSnapshotManager *)self _snapshotCoordinatorForPath:v6];

  [v7 ingestSnapshotsFromCoordinator:v8];
}

- (BOOL)_lock_cancelSnapshotter:(id)a3 reason:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 request];
  uint64_t v9 = [v8 provider];

  lock_priorityQueue = self->_lock_priorityQueue;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __59__PBFPosterSnapshotManager__lock_cancelSnapshotter_reason___block_invoke;
  v33[3] = &unk_1E6983100;
  id v11 = v6;
  id v34 = v11;
  uint64_t v12 = [(PBFPriorityQueue *)lock_priorityQueue firstActiveItemForIdentifier:v9 passingTest:v33];
  id v28 = v7;
  if (v12)
  {
    [v11 cancelWithReason:v7];
    uint64_t v26 = [v11 error];
    [(PBFPriorityQueue *)self->_lock_priorityQueue removeActiveItem:v12 forIdentifier:v9];
  }
  else
  {
    uint64_t v26 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", v9, v26);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
LABEL_6:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v13);
      }
      long long v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
      id v19 = [v18 snapshotter];

      if (v19 == v11) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v15) {
          goto LABEL_6;
        }
        goto LABEL_12;
      }
    }
    long long v20 = v28;
    [v11 cancelWithReason:v28];
    long long v21 = [v11 error];

    BOOL v22 = [(PBFPriorityQueue *)self->_lock_priorityQueue removeEnqueuedItem:v18 forIdentifier:v9];
    if (!v12 && !v22)
    {
      BOOL v23 = 0;
      goto LABEL_19;
    }
  }
  else
  {
LABEL_12:

    if (!v12)
    {
      BOOL v23 = 0;
      long long v21 = v27;
      long long v20 = v28;
      goto LABEL_19;
    }
    long long v21 = v27;
    long long v20 = v28;
  }
  long long v24 = [v11 request];
  [(PBFPosterSnapshotManager *)self _lock_fireCompletionsForRequest:v24 snapshotImagesByReservation:0 error:v21];

  BOOL v23 = 1;
LABEL_19:

  return v23;
}

BOOL __59__PBFPosterSnapshotManager__lock_cancelSnapshotter_reason___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 snapshotter];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_snapshotCoordinatorForPath:(id)a3
{
  p_modelCoordinatorProvider = &self->_modelCoordinatorProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_modelCoordinatorProvider);
  id v6 = [v4 serverIdentity];

  id v7 = objc_msgSend(WeakRetained, "pbf_posterSnapshotCoordinatorForIdentity:", v6);

  return v7;
}

- (id)_loadReservationsForDefinitionForRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v22 = [v3 path];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = [v3 definitions];
  id v6 = [v4 setWithArray:v5];

  id v7 = [v3 configuredProperties];
  id v23 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v25;
    long long v20 = &v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (!v11)
        {
          id v11 = [(PBFPosterSnapshotManager *)self _snapshotCoordinatorForPath:v22];
        }
        uint64_t v15 = objc_msgSend(v3, "displayContext", v20);
        uint64_t v16 = [v11 snapshotReservationForDefinition:v14 configuredProperties:v7 context:v15];

        if ([v16 isValid])
        {
          [v23 setObject:v16 forKey:v14];
        }
        else
        {
          uint64_t v17 = [v16 error];

          if (v17)
          {
            long long v18 = PBFLogSnapshotter();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[PBFPosterSnapshotManager _loadReservationsForDefinitionForRequest:](v28, v16, v20, v18);
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  return v23;
}

- (void)_enqueueSnapshotForRequestIfNeeded:(id)a3 relativePriority:(unint64_t)a4 completion:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  id v22 = 0;
  BOOL v10 = [(PBFPosterSnapshotManager *)self _isRequestValid:v8 error:&v22];
  id v11 = v22;
  if (v10)
  {
    if ([(PBFPosterSnapshotManager *)self isSnapshotRequestFulfilled:v8])
    {
      if (v9)
      {
        uint64_t v12 = [(PBFPosterSnapshotManager *)self _loadReservationsForDefinitionForRequest:v8];
        v9[2](v9, v12, 0);
      }
      goto LABEL_21;
    }
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_invalidated)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      goto LABEL_17;
    }
    id v21 = 0;
    uint64_t v15 = [(PBFPosterSnapshotManager *)self _lock_snapshotterForRequest:v8 requestContainingRequest:&v21];
    id v16 = v21;

    if (v15)
    {
      if (v9)
      {
        if (!v16)
        {
          long long v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"requestContainingRequest != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PBFPosterSnapshotManager _enqueueSnapshotForRequestIfNeeded:relativePriority:completion:]();
          }
          [v20 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D32526D8);
        }
        [(PBFPosterSnapshotManager *)self _lock_addCompletion:v9 forRequest:v16];
      }
    }
    else
    {
      if (!PUIFeatureEnabled())
      {
        uint64_t v17 = [(PBFPosterSnapshotManager *)self _lock_buildSnapshotterForRequest:v8 attemptNumber:0];
        if (v17)
        {
          [(PBFPosterSnapshotManager *)self _lock_enqueueSnapshotter:v17 forRequest:v8 attempt:0 relativePriority:a4 completion:v9];
          uint64_t v14 = 0;
        }
        else
        {
          long long v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v23 = *MEMORY[0x1E4F28588];
          v24[0] = @"Unable to build snapshotter for request; check extension provider?";
          id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
          uint64_t v14 = objc_msgSend(v18, "pbf_dataStoreErrorWithCode:userInfo:", -2214, v19);
        }
        goto LABEL_16;
      }
      [(PBFPosterSnapshotManager *)self _lock_submitSBRendererRequestForRequest:v8 relativePriority:a4 completion:v9];
    }
    uint64_t v14 = 0;
LABEL_16:

LABEL_17:
    os_unfair_lock_unlock(p_lock);
    if (v9 && v14) {
      ((void (**)(id, void *, void *))v9)[2](v9, 0, v14);
    }

    goto LABEL_21;
  }
  if (v9) {
    ((void (**)(id, void *, id))v9)[2](v9, 0, v11);
  }
LABEL_21:
}

- (void)_lock_submitSBRendererRequestForRequest:(id)a3 relativePriority:(unint64_t)a4 completion:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a5;
  long long v27 = v6;
  id v7 = [v6 buildPUIPosterSnapshotRequestsForOutput:2 priority:0 timeout:30.0];
  id v8 = PBFLogSnapshotter();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 count];
    BOOL v10 = [v27 path];
    *(_DWORD *)buf = 134349314;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D31CE000, v8, OS_LOG_TYPE_DEFAULT, "Submitting %{public}lu snapshotService requests for path: %{public}@", buf, 0x16u);
  }
  if (v24) {
    [(PBFPosterSnapshotManager *)self _lock_addCompletion:v24 forRequest:v27];
  }
  id v11 = dispatch_group_create();
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2810000000;
  v47[3] = &unk_1D33BE967;
  int v48 = 0;
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v55 = __Block_byref_object_copy__6;
  long long v56 = __Block_byref_object_dispose__6;
  id v57 = (id)objc_opt_new();
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__6;
  v45[4] = __Block_byref_object_dispose__6;
  id v46 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v13)
  {
    uint64_t v25 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v12);
        }
        uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v16 = [v12 objectForKey:v15];
        dispatch_group_enter(v11);
        uint64_t v17 = PBFLogSnapshotter();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v16 uniqueIdentifier];
          id v19 = [v27 path];
          *(_DWORD *)uint64_t v49 = 138543618;
          id v50 = v18;
          __int16 v51 = 2114;
          uint64_t v52 = v19;
          _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "Submitting snapshotService request %{public}@ for path: %{public}@", v49, 0x16u);
        }
        snapshotService = self->_snapshotService;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke;
        v33[3] = &unk_1E6983128;
        int v38 = v47;
        id v21 = v16;
        id v34 = v21;
        id v22 = v27;
        uint64_t v39 = v45;
        uint64_t v40 = buf;
        id v35 = v22;
        uint64_t v36 = v15;
        uint64_t v37 = v11;
        [(PRUISSnapshotService *)snapshotService executeSnapshotRequest:v21 completion:v33];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v13);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_266;
  block[3] = &unk_1E6982330;
  id v29 = v27;
  long long v30 = self;
  uint64_t v31 = v45;
  long long v32 = buf;
  id v23 = v27;
  dispatch_group_notify(v11, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v47, 8);
}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  id v8 = PBFLogSnapshotter();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v6 executionTime];
      uint64_t v11 = v10;
      id v12 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v13 = [*(id *)(a1 + 40) path];
      int v17 = 134349570;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      long long v20 = v12;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "snapshotService response (%{public}f seconds) for request %{public}@ path: %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v6 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_2(a1);
    }

    uint64_t v14 = v7;
    if (!v7)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pui_errorWithCode:", 0);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v14);
    if (!v7) {
  }
    }
  [v6 executionTime];
  if (v15 > 11.0)
  {
    id v16 = PBFLogSnapshotter();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_1(v6, a1);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_266(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = PBFLogSnapshotter();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_266_cold_1(a1);
    }

    return [*(id *)(a1 + 40) _failRequest:*(void *)(a1 + 32) withError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) shouldReEnqueue:0 attempt:0];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) path];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "SUCCESS: Received all snapshotService responses for path: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(a1 + 40) _ingestSnapshotServiceResult:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forRequest:*(void *)(a1 + 32)];
  }
}

- (void)_operationDidComplete:(id)a3 snapshotter:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _lock_cleanupAfterOperation:v14];
  os_unfair_lock_unlock(&self->_lock);
  int v7 = [v6 error];

  id v8 = [v7 domain];
  if ([v8 isEqualToString:PBFGeneralErrorDomain]) {
    BOOL v9 = [v7 code] == 4;
  }
  else {
    BOOL v9 = 0;
  }

  uint64_t v10 = [v7 domain];
  if ([v10 isEqualToString:PBFGeneralErrorDomain]) {
    BOOL v11 = [v7 code] == 3;
  }
  else {
    BOOL v11 = 0;
  }

  if (v7) {
    char v12 = 1;
  }
  else {
    char v12 = v9;
  }
  if ((v12 & 1) != 0 || v11)
  {
    uint64_t v13 = [v14 request];
    -[PBFPosterSnapshotManager _failRequest:withError:shouldReEnqueue:attempt:](self, "_failRequest:withError:shouldReEnqueue:attempt:", v13, v7, !v9 && !v11, [v14 attempt]);
  }
  else
  {
    uint64_t v13 = [v14 snapshotter];
    [(PBFPosterSnapshotManager *)self _ingestResultsFromSnapshotter:v13];
  }
}

- (void)_failRequest:(id)a3 withError:(id)a4 shouldReEnqueue:(BOOL)a5 attempt:(unint64_t)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v7)
  {
    int64_t v11 = a6 + 1;
    uint64_t v12 = [(PBFPosterSnapshotManager *)self _lock_buildSnapshotterForRequest:v14 attemptNumber:a6 + 1];
    uint64_t v13 = (void *)v12;
    if (v11 <= 2 && v12)
    {
      [(PBFPosterSnapshotManager *)self _lock_enqueueSnapshotter:v12 forRequest:v14 attempt:v11 relativePriority:0 completion:0];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [(PBFPosterSnapshotManager *)self _lock_fireCompletionsForRequest:v14 snapshotImagesByReservation:0 error:v10];
LABEL_7:
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_ingestSnapshotServiceResult:(id)a3 forRequest:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  uint64_t v23 = objc_opt_new();
  id v22 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v25)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v8 = [obj objectForKey:v7];
        BOOL v9 = [v8 snapshotBundle];
        +[PBFPosterSnapshotDefinition snapshotOptionsForDefinition:v7];
        PRSPosterSnapshotOptionsIsFloatingLayerOnly();
        id v10 = [v9 bundleURL];
        int64_t v11 = PUIPosterSnapshotBundleURLForComponent();

        uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v13 = [v24 path];
        uint64_t v14 = [v24 configuredProperties];
        double v15 = [v24 displayContext];
        id v16 = objc_msgSend(v12, "pbf_snapshotURLForPath:definition:configuredProperties:context:", v13, v7, v14, v15);

        [v22 removeItemAtURL:v16 error:0];
        id v27 = 0;
        LOBYTE(v14) = [v22 copyItemAtURL:v11 toURL:v16 error:&v27];
        id v17 = v27;
        uint64_t v18 = PBFLogSnapshotter();
        __int16 v19 = v18;
        if (v14)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v33 = v11;
            __int16 v34 = 2112;
            id v35 = v16;
            _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "Successfully copied %@ to %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v33 = v17;
          __int16 v34 = 2112;
          id v35 = v11;
          __int16 v36 = 2112;
          uint64_t v37 = v16;
          _os_log_error_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_ERROR, "Snapshot copy failed (%@) to copy from %@ to %@", buf, 0x20u);
        }

        [v23 setObject:v16 forKey:v7];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v25);
  }

  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _lock_ingestSnapshotsByDefinition:v23 forRequest:v24];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_ingestResultsFromSnapshotter:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v7 = [v5 snapshotsByDefinition];
  id v6 = [v5 request];

  [(PBFPosterSnapshotManager *)self _lock_ingestSnapshotsByDefinition:v7 forRequest:v6];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_ingestSnapshotsByDefinition:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelCoordinatorProvider);
  BOOL v9 = [v6 path];
  id v10 = [v9 serverIdentity];
  int64_t v11 = objc_msgSend(WeakRetained, "pbf_posterSnapshotCoordinatorForIdentity:", v10);

  uint64_t v12 = [v6 configuredProperties];
  uint64_t v13 = [v6 path];
  uint64_t v14 = [v6 displayContext];
  [v11 ingestSnapshotsByDefinition:v7 path:v13 configuredProperties:v12 context:v14];

  double v15 = objc_opt_new();
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __73__PBFPosterSnapshotManager__lock_ingestSnapshotsByDefinition_forRequest___block_invoke;
  uint64_t v23 = &unk_1E6983150;
  id v24 = v11;
  id v25 = v12;
  id v26 = v6;
  id v27 = v15;
  id v16 = v15;
  id v17 = v6;
  id v18 = v12;
  id v19 = v11;
  [v7 enumerateKeysAndObjectsUsingBlock:&v20];

  -[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:](self, "_lock_fireCompletionsForRequest:snapshotImagesByReservation:error:", v17, v16, 0, v20, v21, v22, v23);
}

void __73__PBFPosterSnapshotManager__lock_ingestSnapshotsByDefinition_forRequest___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) displayContext];
  id v6 = [v3 snapshotReservationForDefinition:v7 configuredProperties:v4 context:v5];

  if (v6) {
    [*(id *)(a1 + 56) setObject:v6 forKey:v7];
  }
}

- (void)_lock_addCompletion:(id)a3 forRequest:(id)a4
{
  id v6 = a4;
  if (a3 && v6)
  {
    lock_requestToCompletion = self->_lock_requestToCompletion;
    id v11 = v6;
    id v8 = a3;
    BOOL v9 = [(NSMapTable *)lock_requestToCompletion objectForKey:v11];
    id v10 = [[PBFPosterSnapshotFetchCompletionHandler alloc] initWithRequest:v11 completionHandler:v8];

    if (v9)
    {
      [v9 addObject:v10];
    }
    else
    {
      BOOL v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v10];
      [(NSMapTable *)self->_lock_requestToCompletion setObject:v9 forKey:v11];
    }

    id v6 = v11;
  }
}

- (void)_lock_fireCompletionsForRequest:(id)a3 snapshotImagesByReservation:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSMapTable *)self->_lock_requestToCompletion objectForKey:v8];
  [(PBFPosterSnapshotManager *)self _lock_cleanupAfterRequest:v8];
  if ([v11 count])
  {
    dispatch_qos_class_t v12 = PBFDispatchQualityOfServiceFromPBFPosterSnapshotRequestIntention([v8 intention]);
    uint64_t v13 = [NSString stringWithUTF8String:"-[PBFPosterSnapshotManager _lock_fireCompletionsForRequest:snapshotImagesByReservation:error:]"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__PBFPosterSnapshotManager__lock_fireCompletionsForRequest_snapshotImagesByReservation_error___block_invoke;
    v15[3] = &unk_1E6981338;
    id v16 = v11;
    id v17 = v10;
    id v18 = v9;
    PBFDispatchAsyncWithString(v13, v12, v15);
  }
  uint64_t v14 = [v8 path];
  [(PBFPosterSnapshotManager *)self _lock_fireDidUpdateSnapshotForPath:v14 snapshotImagesByReservation:v9];
}

void __94__PBFPosterSnapshotManager__lock_fireCompletionsForRequest_snapshotImagesByReservation_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (*(void *)(a1 + 40)) {
          objc_msgSend(v7, "finishWithError:");
        }
        else {
          objc_msgSend(v7, "finishWithSuccess:", *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_lock_fireDidUpdateSnapshotForPath:(id)a3 snapshotImagesByReservation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__PBFPosterSnapshotManager__lock_fireDidUpdateSnapshotForPath_snapshotImagesByReservation___block_invoke;
  v10[3] = &unk_1E6983178;
  id v11 = v7;
  dispatch_qos_class_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [(PBFPosterSnapshotManager *)self _lock_enumerateObservers:v10];
}

void __91__PBFPosterSnapshotManager__lock_fireDidUpdateSnapshotForPath_snapshotImagesByReservation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          long long v10 = [*(id *)(a1 + 32) objectForKey:v9];
          id v11 = [v10 error];

          if (!v11) {
            [v3 snapshotManager:*(void *)(a1 + 40) didUpdateSnapshotForPath:*(void *)(a1 + 48) forDefinition:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)_lock_cleanupAfterRequest:(id)a3
{
  id v4 = a3;
  [(NSMapTable *)self->_lock_requestToCompletion removeObjectForKey:v4];
  uint64_t v5 = [v4 provider];
  lock_priorityQueue = self->_lock_priorityQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke;
  v17[3] = &unk_1E6983100;
  id v7 = v4;
  id v18 = v7;
  id v8 = [(PBFPriorityQueue *)lock_priorityQueue firstActiveItemForIdentifier:v5 passingTest:v17];
  if (v8) {
    [(PBFPriorityQueue *)self->_lock_priorityQueue removeActiveItem:v8 forIdentifier:v5];
  }
  uint64_t v9 = self->_lock_priorityQueue;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke_2;
  long long v15 = &unk_1E69831A0;
  id v16 = v7;
  id v10 = v7;
  id v11 = [(PBFPriorityQueue *)v9 filterEnqueuedItemForIdentifier:v5 passingTest:&v12];
  [(PBFPosterSnapshotManager *)self _lock_kickoffNextOperation];
  [(PBFPosterSnapshotManager *)self _lock_teardownPrewarmAssertionShouldForce:0 reason:@"Cleanup after request"];
}

uint64_t __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __54__PBFPosterSnapshotManager__lock_cleanupAfterRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_lock_cleanupAfterOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 request];
  uint64_t v6 = [v5 provider];
  lock_priorityQueue = self->_lock_priorityQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke;
  v18[3] = &unk_1E6983100;
  id v8 = v4;
  id v19 = v8;
  id v9 = [(PBFPriorityQueue *)lock_priorityQueue firstActiveItemForIdentifier:v6 passingTest:v18];
  if (v9 == v8) {
    [(PBFPriorityQueue *)self->_lock_priorityQueue removeActiveItem:v8 forIdentifier:v6];
  }
  id v10 = self->_lock_priorityQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  long long v15 = __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke_2;
  id v16 = &unk_1E6983100;
  id v17 = v8;
  id v11 = v8;
  id v12 = [(PBFPriorityQueue *)v10 filterEnqueuedItemForIdentifier:v6 passingTest:&v13];
  [(PBFPosterSnapshotManager *)self _lock_kickoffNextOperation];
  [(PBFPosterSnapshotManager *)self _lock_teardownPrewarmAssertionShouldForce:0 reason:@"Cleanup after operation"];
}

BOOL __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

BOOL __56__PBFPosterSnapshotManager__lock_cleanupAfterOperation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (id)_lock_snapshotterForRequest:(id)a3 requestContainingRequest:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__6;
  id v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__6;
  uint64_t v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  id v7 = [v6 provider];
  id v8 = [(PBFPosterSnapshotManager *)self _lock_snapshottersForExtensionBundleIdentifier:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PBFPosterSnapshotManager__lock_snapshotterForRequest_requestContainingRequest___block_invoke;
  v12[3] = &unk_1E69831C8;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v16;
  long long v15 = &v22;
  [v8 enumerateObjectsUsingBlock:v12];
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __81__PBFPosterSnapshotManager__lock_snapshotterForRequest_requestContainingRequest___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = [v8 request];
  if ([v7 containsRequest:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v7);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_lock_snapshottersForExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedItemsForIdentifier:v4];
  id v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_284);
  [v5 addObjectsFromArray:v7];

  id v8 = [(PBFPriorityQueue *)self->_lock_priorityQueue activeItemsForIdentifier:v4];

  id v9 = [v8 allObjects];
  id v10 = objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_286);
  [v5 addObjectsFromArray:v10];

  return v5;
}

uint64_t __75__PBFPosterSnapshotManager__lock_snapshottersForExtensionBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 snapshotter];
}

uint64_t __75__PBFPosterSnapshotManager__lock_snapshottersForExtensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 snapshotter];
}

- (void)_lock_enqueueSnapshotter:(id)a3 forRequest:(id)a4 attempt:(int64_t)a5 relativePriority:(unint64_t)a6 completion:(id)a7
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  long long v15 = (void (**)(void, void, void))v14;
  if (a5 < 4)
  {
    if (self->_lock_invalidated)
    {
      if (v14)
      {
        id v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = *MEMORY[0x1E4F28588];
        long long v43 = @"snapshot manager was invalidated";
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v21 = objc_msgSend(v19, "pbf_generalErrorWithCode:userInfo:", 3, v20);
        ((void (**)(void, void, void *))v15)[2](v15, 0, v21);
      }
    }
    else
    {
      [(PBFPosterSnapshotManager *)self _lock_acquirePrewarmAssertionIfNeeded:1];
      id location = 0;
      uint64_t v22 = [[PBFPosterSnapshotterOperation alloc] initWithRequest:v13 snapshotter:v12];
      objc_storeWeak(&location, v22);
      [(PBFPosterSnapshotterOperation *)v22 setMaxNumberOfAttempts:3];
      [(PBFPosterSnapshotterOperation *)v22 setAttempt:a5];
      if ([v12 necessitatesExtensionInstance])
      {
        uint64_t v35 = 0;
        if (a5 <= 0) {
          uint64_t v23 = 8 * ([v13 intention] == 2);
        }
        else {
          uint64_t v23 = -4;
        }
      }
      else
      {
        uint64_t v35 = -1;
        uint64_t v23 = 8;
      }
      uint64_t v24 = objc_msgSend(v12, "definitions", v23);
      id v25 = +[PBFPosterSnapshotDefinition switcherSnapshotDefinition];
      char v26 = [v24 containsObject:v25];

      if (v26)
      {
        uint64_t v27 = -2;
        uint64_t v28 = 8;
      }
      else
      {
        long long v29 = [v12 definitions];
        long long v30 = +[PBFPosterSnapshotDefinition switcherFloatingLayerSnapshotDefinition];
        int v31 = [v29 containsObject:v30];

        if (v31) {
          uint64_t v28 = 8;
        }
        else {
          uint64_t v28 = v34;
        }
        if (v31) {
          uint64_t v27 = -2;
        }
        else {
          uint64_t v27 = v35;
        }
      }
      [(PBFPosterSnapshotterOperation *)v22 setQueuePriority:v28];
      if (v27) {
        BOOL v32 = 1;
      }
      else {
        BOOL v32 = a6 == 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v32) {
        unint64_t v33 = v27;
      }
      else {
        unint64_t v33 = a6;
      }
      [(PBFPosterSnapshotterOperation *)v22 setAdvisoryQueuePriority:v33];
      objc_initWeak(&from, self);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __100__PBFPosterSnapshotManager__lock_enqueueSnapshotter_forRequest_attempt_relativePriority_completion___block_invoke;
      v36[3] = &unk_1E6983210;
      objc_copyWeak(&v38, &from);
      objc_copyWeak(&v39, &location);
      id v37 = v12;
      [(PBFPosterSnapshotterOperation *)v22 setCompletionBlock:v36];
      [(PBFPosterSnapshotManager *)self _lock_prioritizeOperation:v22];
      if (!a5 && v15) {
        [(PBFPosterSnapshotManager *)self _lock_addCompletion:v15 forRequest:v13];
      }
      [(PBFPosterSnapshotManager *)self _lock_kickoffNextOperation];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&v38);
      objc_destroyWeak(&from);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28588];
    v45[0] = @"Exceeded max number of retries";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    uint64_t v18 = objc_msgSend(v16, "pbf_generalErrorWithCode:userInfo:", 3, v17);
    [(PBFPosterSnapshotManager *)self _lock_fireCompletionsForRequest:v13 snapshotImagesByReservation:0 error:v18];
  }
}

void __100__PBFPosterSnapshotManager__lock_enqueueSnapshotter_forRequest_attempt_relativePriority_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _operationDidComplete:v2 snapshotter:*(void *)(a1 + 32)];
}

- (void)_kickoffNextOperation
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _lock_kickoffNextOperation];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_kickoffNextOperation
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (self->_lock_invalidated) {
    return;
  }
  id v3 = [(PBFPosterSnapshotManager *)self _snapshotSuspendedExtensionBundleIdentifiers];
  if ([(PBFPosterSnapshotManager *)self _isOperationQueueSuspended]) {
    goto LABEL_47;
  }
  uint64_t v42 = [(PBFApplicationStateMonitor *)self->_applicationStateMonitor currentApplicationContext];
  id v4 = [v42 posterUUIDs];
  BOOL v41 = [v4 count] != 0;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v56 = 0u;
  long long v55 = 0u;
  uint64_t v5 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (!v6) {
    goto LABEL_46;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v56;
  *(void *)&long long v7 = 138543618;
  long long v37 = v7;
  id v39 = v5;
  uint64_t v40 = v3;
  uint64_t v38 = *(void *)v56;
  do
  {
    uint64_t v10 = 0;
    uint64_t v43 = v8;
    do
    {
      if (*(void *)v56 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v55 + 1) + 8 * v10);
      if (objc_msgSend(v3, "containsObject:", v11, v37)) {
        goto LABEL_44;
      }
      unint64_t v12 = [(PBFPriorityQueue *)self->_lock_priorityQueue numberOfActiveItemForIdentifier:v11];
      if (v12)
      {
        unint64_t v13 = v12;
        id v14 = PBFLogSnapshotter();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v37;
          id v60 = v11;
          __int16 v61 = 2048;
          unint64_t v62 = v13;
          _os_log_debug_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ numberOfActiveOperations %lu >= MAX_NUMBER_OF_ACTIVE_ITEMS; moving on.",
            buf,
            0x16u);
        }
        goto LABEL_43;
      }
      uint64_t v45 = v10;
      lock_priorityQueue = self->_lock_priorityQueue;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __54__PBFPosterSnapshotManager__lock_kickoffNextOperation__block_invoke;
      v52[3] = &unk_1E6983238;
      BOOL v54 = v41;
      uint64_t v53 = v42;
      [(PBFPriorityQueue *)lock_priorityQueue sortItemsForIdentifier:v11 usingComparator:v52];
      uint64_t v16 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedItemsForIdentifier:v11];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v17 = [v16 reverseObjectEnumerator];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v63 count:16];
      if (!v18)
      {
        uint64_t v8 = v43;
        goto LABEL_41;
      }
      uint64_t v19 = v18;
      uint64_t v44 = v16;
      uint64_t v20 = *(void *)v49;
      id v21 = v17;
      id v46 = v17;
LABEL_14:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v21);
        }
        uint64_t v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
        if ([v23 isCancelled]) {
          goto LABEL_23;
        }
        if ([v23 isFinished]) {
          goto LABEL_23;
        }
        uint64_t v24 = [v23 snapshotter];
        if (!v24) {
          goto LABEL_23;
        }
        id v25 = (void *)v24;
        char v26 = [v23 snapshotter];
        if ([v26 isFinished])
        {

LABEL_23:
          long long v29 = PBFLogSnapshotter();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v60 = v23;
            _os_log_debug_impl(&dword_1D31CE000, v29, OS_LOG_TYPE_DEBUG, "Operation is finished already, bailing... %{public}@", buf, 0xCu);
          }

          [(PBFPriorityQueue *)self->_lock_priorityQueue removeEnqueuedItem:v23 forIdentifier:v11];
          id v30 = [v23 request];
          int v31 = [v23 snapshotter];
          BOOL v32 = [v31 error];
          [(PBFPosterSnapshotManager *)self _lock_fireCompletionsForRequest:v30 snapshotImagesByReservation:0 error:v32];

          goto LABEL_26;
        }
        uint64_t v27 = [v23 snapshotter];
        uint64_t v28 = [v27 error];

        id v21 = v46;
        if (v28) {
          goto LABEL_23;
        }
        unint64_t v33 = [v23 snapshotter];
        id v47 = 0;
        char v34 = [v33 checkIfSnapshotterIsPreparedToExecute:&v47];
        id v30 = v47;

        if (v34) {
          break;
        }
        [(PBFPriorityQueue *)self->_lock_priorityQueue removeEnqueuedItem:v23 forIdentifier:v11];
        int v31 = [v23 request];
        [(PBFPosterSnapshotManager *)self _lock_fireCompletionsForRequest:v31 snapshotImagesByReservation:0 error:v30];
        id v21 = v46;
LABEL_26:

        if (v19 == ++v22)
        {
          uint64_t v35 = [v21 countByEnumeratingWithState:&v48 objects:v63 count:16];
          uint64_t v19 = v35;
          if (!v35)
          {
            id v17 = v21;
            uint64_t v5 = v39;
            id v3 = v40;
            uint64_t v9 = v38;
            uint64_t v8 = v43;
            uint64_t v10 = v45;
            goto LABEL_40;
          }
          goto LABEL_14;
        }
      }
      if ([v23 isExecuting])
      {
        int v31 = PBFLogSnapshotter();
        id v21 = v46;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v60 = v23;
          _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "Operation is still executing, continuing... %{public}@", buf, 0xCu);
        }
        goto LABEL_26;
      }
      id v17 = v23;

      uint64_t v5 = v39;
      id v3 = v40;
      uint64_t v9 = v38;
      uint64_t v8 = v43;
      uint64_t v16 = v44;
      uint64_t v10 = v45;
      if (!v17) {
        goto LABEL_42;
      }
      [(PBFPriorityQueue *)self->_lock_priorityQueue markItemActive:v17 forIdentifier:v11];
      [(NSOperationQueue *)self->_operationQueue addOperation:v17];
      __int16 v36 = PBFLogSnapshotter();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v60 = v17;
        _os_log_debug_impl(&dword_1D31CE000, v36, OS_LOG_TYPE_DEBUG, "Operation moving to active %{public}@", buf, 0xCu);
      }

LABEL_40:
      uint64_t v16 = v44;
LABEL_41:

LABEL_42:
      id v14 = v53;
LABEL_43:

LABEL_44:
      ++v10;
    }
    while (v10 != v8);
    uint64_t v8 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  }
  while (v8);
LABEL_46:

  [(PBFPosterSnapshotManager *)self _lock_logOperationQueueStatus];
LABEL_47:
}

uint64_t __54__PBFPosterSnapshotManager__lock_kickoffNextOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_7;
  }
  long long v7 = [v5 request];
  uint64_t v8 = [v7 path];
  uint64_t v9 = [v8 serverIdentity];

  uint64_t v10 = [v6 request];
  id v11 = [v10 path];
  unint64_t v12 = [v11 serverIdentity];

  unint64_t v13 = [*(id *)(a1 + 32) posterUUIDs];
  id v14 = [v9 posterUUID];
  int v15 = [v13 containsObject:v14];

  uint64_t v16 = [*(id *)(a1 + 32) posterUUIDs];
  id v17 = [v12 posterUUID];
  int v18 = [v16 containsObject:v17];

  if (!v15 || v18)
  {
    int v19 = v15 | v18 ^ 1;
    uint64_t v20 = -1;
  }
  else
  {
    int v19 = 0;
    uint64_t v20 = 1;
  }

  if (v19)
  {
LABEL_7:
    [v5 queuePriority];
    [v6 queuePriority];
    uint64_t v20 = BSCompareIntegers();
    if (!v20)
    {
      [v5 advisoryQueuePriority];
      [v6 advisoryQueuePriority];
      uint64_t v20 = BSCompareIntegers();
    }
  }

  return v20;
}

- (void)_lock_prioritizeOperation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_lock_invalidated)
  {
    id v6 = [v4 snapshotter];
    long long v7 = [v5 request];
    uint64_t v8 = [v7 path];
    uint64_t v9 = [v8 serverIdentity];
    uint64_t v10 = [v9 provider];

    if ([v6 necessitatesExtensionInstance])
    {
      [(PBFPriorityQueue *)self->_lock_priorityQueue enqueueItem:v5 forIdentifier:v10];
    }
    else
    {
      id v11 = PBFLogSnapshotter();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PBFPosterSnapshotManager _lock_prioritizeOperation:]((uint64_t)v5, v11);
      }

      [(NSOperationQueue *)self->_operationQueue addOperation:v5];
    }
    [(PBFPosterSnapshotManager *)self _lock_logOperationQueueStatus];
  }
}

- (void)_lock_logOperationQueueStatus
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSOperationQueue *)self->_operationQueue operationCount];
  id v4 = [(PBFPriorityQueue *)self->_lock_priorityQueue activeIdentifiers];
  uint64_t v5 = [v4 count];

  unint64_t v6 = [(PBFPosterSnapshotManager *)self _lock_numberOfRemainingOperations];
  long long v7 = [(PBFPosterSnapshotManager *)self _snapshotSuspendedExtensionBundleIdentifiers];
  uint64_t v8 = [v7 count];

  uint64_t v9 = PBFLogSnapshotter();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218752;
    NSUInteger v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    unint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = v8;
    _os_log_debug_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEBUG, "Operations active %lu / Operations queue active %lu / Operations queued %lu / Assertions preventing extensions from snapshotting: %lu", (uint8_t *)&v10, 0x2Au);
  }
}

- (unint64_t)_lock_numberOfRemainingOperations
{
  return [(PBFPriorityQueue *)self->_lock_priorityQueue numberOfEnqueuedItems];
}

- (id)_lock_buildSnapshotterForRequest:(id)a3 attemptNumber:(unint64_t)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);

  if (WeakRetained)
  {
    long long v7 = [PBFPosterSnapshotter alloc];
    id v8 = objc_loadWeakRetained((id *)&self->_extensionProvider);
    uint64_t v9 = [(PBFPosterSnapshotter *)v7 initWithRequest:v5 extensionProvider:v8 runtimeAssertionProvider:self->_runtimeAssertionProvider];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_acquirePrewarmAssertionIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PBFPosterSnapshotManager *)self _lock_acquirePrewarmAssertionIfNeeded:v3];
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(BOOL)a3
{
  if (self->_lock_invalidated) {
    return;
  }
  if (self->_lock_posterBoardPrewarmAssertion)
  {
    id v4 = PBFLogSnapshotter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_8:

    return;
  }
  if ([(PBFPosterSnapshotManager *)self _isOperationQueueSuspended])
  {
    id v4 = PBFLogSnapshotter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:](v4, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_8;
  }
  if (![(PBFPriorityQueue *)self->_lock_priorityQueue isEmpty]) {
    goto LABEL_15;
  }
  uint64_t v20 = PBFLogSnapshotter();
  id v21 = v20;
  if (a3)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

LABEL_15:
    runtimeAssertionProvider = self->_runtimeAssertionProvider;
    id v30 = [MEMORY[0x1E4F96478] currentProcess];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke;
    v34[3] = &unk_1E6980A00;
    v34[4] = self;
    int v31 = [(PBFRuntimeAssertionProviding *)runtimeAssertionProvider acquirePrewarmRuntimeAssertionForReason:@"Snapshotter is snapshotting" target:v30 invalidationHandler:v34];
    lock_posterBoardPrewarmAssertion = self->_lock_posterBoardPrewarmAssertion;
    self->_lock_posterBoardPrewarmAssertion = v31;

    unint64_t v33 = PBFLogSnapshotter();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v33, OS_LOG_TYPE_DEFAULT, "Prewarm Assertion was acquired; kicking off next operation",
        buf,
        2u);
    }

    [(PBFPosterSnapshotManager *)self _lock_kickoffNextOperation];
    return;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_INFO, "Prewarm Assertion was not acquired; operation queue has nothing queued up and we're not forcing it",
      buf,
      2u);
  }
}

void __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [NSString stringWithUTF8String:"-[PBFPosterSnapshotManager _lock_acquirePrewarmAssertionIfNeeded:]_block_invoke"];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke_2;
  v3[3] = &unk_1E69808C0;
  v3[4] = *(void *)(a1 + 32);
  PBFDispatchAsyncWithString(v2, QOS_CLASS_USER_INITIATED, v3);
}

uint64_t __66__PBFPosterSnapshotManager__lock_acquirePrewarmAssertionIfNeeded___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _posterBoardPrewarmAssertionWasInvalidated];
}

- (void)_teardownPrewarmAssertionShouldForce:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  p_locuint64_t k = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  [(PBFPosterSnapshotManager *)self _lock_teardownPrewarmAssertionShouldForce:v4 reason:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)_teardownBehaviorAssertionsIfAppropriate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = objc_opt_new();
  os_unfair_lock_lock(&self->_assertionLock);
  assertionLock_extensionSnapshotterDisabledAssertions = self->_assertionLock_extensionSnapshotterDisabledAssertions;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke;
  v20[3] = &unk_1E6983260;
  id v6 = v4;
  id v21 = v6;
  [(NSMutableDictionary *)assertionLock_extensionSnapshotterDisabledAssertions enumerateKeysAndObjectsUsingBlock:v20];
  [(NSMutableDictionary *)self->_assertionLock_extensionSnapshotterDisabledAssertions removeAllObjects];
  assertionLock_extensionEditingInProgressAssertions = self->_assertionLock_extensionEditingInProgressAssertions;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke_2;
  v18[3] = &unk_1E6983260;
  id v8 = v6;
  id v19 = v8;
  [(NSMutableDictionary *)assertionLock_extensionEditingInProgressAssertions enumerateKeysAndObjectsUsingBlock:v18];
  [(NSMutableDictionary *)self->_assertionLock_extensionEditingInProgressAssertions removeAllObjects];
  [v8 unionSet:self->_assertionLock_inUseAssertions];
  [(NSMutableSet *)self->_assertionLock_inUseAssertions removeAllObjects];
  os_unfair_lock_unlock(&self->_assertionLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "invalidate", (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

uint64_t __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

uint64_t __69__PBFPosterSnapshotManager__teardownBehaviorAssertionsIfAppropriate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

- (void)_lock_teardownPrewarmAssertionShouldForce:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a4;
  if (![(__CFString *)v6 length])
  {

    id v6 = @"(null reason)";
  }
  id v7 = PBFLogSnapshotter();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v8 = [(NSMapTable *)self->_lock_requestToCompletion count];
    BOOL lock_invalidated = self->_lock_invalidated;
    *(_DWORD *)buf = 134218240;
    NSUInteger v59 = v8;
    __int16 v60 = 1024;
    BOOL v61 = lock_invalidated;
    _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "_lock_teardownPrewarmAssertion state; outstanding snapshot handlers %ld;  invalidated: %{BOOL}u",
      buf,
      0x12u);
  }

  if (self->_lock_invalidated || v4)
  {
    uint64_t v12 = PBFLogSnapshotter();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      NSUInteger v59 = (NSUInteger)v6;
      _os_log_impl(&dword_1D31CE000, v12, OS_LOG_TYPE_DEFAULT, "Prewarm Assertion was *FORCIBLY* cleaned up: reason '%{public}@'", buf, 0xCu);
    }

    if ([(PBFPosterSnapshotManager *)self _updateOperationQueueSuspended:1])
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v13 = [(PBFPriorityQueue *)self->_lock_priorityQueue activeIdentifiers];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v50 objects:v57 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v51 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v19 = [(PBFPriorityQueue *)self->_lock_priorityQueue activeItemsForIdentifier:v18];
            uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v47;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v47 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  [*(id *)(*((void *)&v46 + 1) + 8 * j) cancel];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
              }
              while (v21);
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v50 objects:v57 count:16];
        }
        while (v15);
      }

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v24 = [(PBFPriorityQueue *)self->_lock_priorityQueue enqueuedIdentifiers];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v43;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v42 + 1) + 8 * k);
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            id v30 = -[PBFPriorityQueue enqueuedItemsForIdentifier:](self->_lock_priorityQueue, "enqueuedItemsForIdentifier:", v29, 0);
            uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v39;
              do
              {
                for (uint64_t m = 0; m != v32; ++m)
                {
                  if (*(void *)v39 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  [*(id *)(*((void *)&v38 + 1) + 8 * m) cancel];
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
              }
              while (v32);
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v55 count:16];
        }
        while (v26);
      }

      [(PBFPosterSnapshotManager *)self _lock_invalidateAllCompletionHandlers];
      [(PBFPriorityQueue *)self->_lock_priorityQueue removeAllActiveItems];
      [(PBFPriorityQueue *)self->_lock_priorityQueue removeAllEnqueuedItems];
    }
    lock_posterBoardPrewarmAssertion = self->_lock_posterBoardPrewarmAssertion;
    self->_lock_posterBoardPrewarmAssertion = 0;
    uint64_t v10 = lock_posterBoardPrewarmAssertion;

    [v10 invalidate];
  }
  else if ([(NSMapTable *)self->_lock_requestToCompletion count])
  {
    uint64_t v10 = PBFLogSnapshotter();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "Prewarm Assertion was *NOT* cleaned up: outstanding requests remain.";
LABEL_48:
      _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
  }
  else
  {
    __int16 v36 = self->_lock_posterBoardPrewarmAssertion;
    if (v36)
    {
      self->_lock_posterBoardPrewarmAssertion = 0;
      long long v37 = v36;

      [(RBSAssertion *)v37 invalidate];
      uint64_t v10 = PBFLogSnapshotter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "Prewarm Assertion *WAS* cleaned up.";
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v10 = PBFLogSnapshotter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "Prewarm Assertion was *NOT* cleaned up: no prewarm assertion currently acquired.";
        goto LABEL_48;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotService, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_modelCoordinatorProvider);
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_runtimeAssertionProvider, 0);
  objc_storeStrong((id *)&self->_lock_posterBoardPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_assertionLock_assertionObservers, 0);
  objc_storeStrong((id *)&self->_assertionLock_extensionEditingInProgressAssertions, 0);
  objc_storeStrong((id *)&self->_assertionLock_extensionSnapshotterDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_assertionLock_inUseAssertions, 0);
  objc_storeStrong((id *)&self->_lock_fulfilledSnapshotBlocks, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_requestToCompletion, 0);
  objc_storeStrong((id *)&self->_lock_priorityQueue, 0);
  objc_storeStrong((id *)&self->_snapshotActivity, 0);
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRuntimeAssertionProvider:extensionProvider:modelCoordinatorProvider:applicationStateMonitor:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestSnapshotCollection:forConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestSnapshotCollection:forConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireSnapshotterDisabledAssertionForProvider:withReason:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_12();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireSnapshotterDisabledAssertionForProvider:withReason:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_12();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireEditingSessionAssertionForProvider:withReason:.cold.1()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_12();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)acquireEditingSessionAssertionForProvider:withReason:.cold.2()
{
  OUTLINED_FUNCTION_13();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_12();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)posterSnapshotForRequest:definition:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)posterSnapshotForRequest:definition:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchPosterSnapshotForRequest:definition:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchPosterSnapshotForRequest:definition:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchPosterSnapshotsForRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)fetchPosterSnapshotsForRequest:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)cancelRequestedSnapshotsForExtensionBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)cancelRequestedSnapshotsForIdentity:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_loadReservationsForDefinitionForRequest:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 error];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1D31CE000, a4, OS_LOG_TYPE_ERROR, "skipping reservation; had error: %{public}@", a1, 0xCu);
}

- (void)_enqueueSnapshotForRequestIfNeeded:relativePriority:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_1(void *a1, uint64_t a2)
{
  [a1 executionTime];
  BOOL v3 = [*(id *)(a2 + 32) uniqueIdentifier];
  uint64_t v4 = [*(id *)(a2 + 40) path];
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x20u);
}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_cold_2(uint64_t a1)
{
  [0 executionTime];
  id v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  BOOL v3 = [*(id *)(a1 + 40) path];
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x2Au);
}

void __96__PBFPosterSnapshotManager__lock_submitSBRendererRequestForRequest_relativePriority_completion___block_invoke_266_cold_1(uint64_t a1)
{
  os_log_type_t v6 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_7_1();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

- (void)_lock_prioritizeOperation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D31CE000, a2, OS_LOG_TYPE_DEBUG, "NON-BLOCKING Operation moving to active %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)_lock_acquirePrewarmAssertionIfNeeded:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

@end