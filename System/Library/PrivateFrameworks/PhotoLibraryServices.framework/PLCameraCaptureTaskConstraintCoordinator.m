@interface PLCameraCaptureTaskConstraintCoordinator
+ (BOOL)_shouldUseFailsafeTimerForRole:(int64_t)a3;
+ (BOOL)_shouldWatchCameraViewfinderForRole:(int64_t)a3;
+ (id)taskConstraintStatus;
- (NSString)description;
- (PLCameraCaptureTaskConstraintCoordinator)initWithTaskContstraintRole:(int64_t)a3 name:(id)a4;
- (id)sessionStatusDescription;
- (int64_t)role;
- (void)_activateCameraSessionTaskConstraints;
- (void)_cancelSessionFailsafeTimer;
- (void)_deactivateCameraSessionTaskConstraintsAfterDelay:(double)a3;
- (void)_invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:(BOOL)a3;
- (void)_startSessionFailsafeTimer;
- (void)_startWatchingCameraActivity;
- (void)activateCameraSessionTaskConstraints;
- (void)cameraWatcherDidChangeState:(id)a3;
- (void)deactivateCameraSessionTaskConstraints;
- (void)invalidate;
@end

@implementation PLCameraCaptureTaskConstraintCoordinator

- (NSString)description
{
  if (self->_failsafeTimerEnabled)
  {
    v16.receiver = self;
    v16.super_class = (Class)PLCameraCaptureTaskConstraintCoordinator;
    v3 = [(PLCameraCaptureTaskConstraintCoordinator *)&v16 description];
    v4 = v3;
    int64_t role = self->_role;
    v6 = @"AutomaticCameraViewfinderSession";
    if (role != 2) {
      v6 = 0;
    }
    if (role == 1) {
      v7 = @"CameraAppKeepAlive";
    }
    else {
      v7 = v6;
    }
    [v3 stringByAppendingFormat:@" (%@, %@, %@, %@)", v7, self->_name, self->_creationDateString, self->_failsafeTimer];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PLCameraCaptureTaskConstraintCoordinator;
    v8 = [(PLCameraCaptureTaskConstraintCoordinator *)&v15 description];
    v4 = v8;
    int64_t v9 = self->_role;
    v10 = @"AutomaticCameraViewfinderSession";
    if (v9 != 2) {
      v10 = 0;
    }
    if (v9 == 1) {
      v11 = @"CameraAppKeepAlive";
    }
    else {
      v11 = v10;
    }
    [v8 stringByAppendingFormat:@" (%@, %@, %@)", v11, self->_name, self->_creationDateString, v14];
  v12 = };

  return (NSString *)v12;
}

uint64_t __80__PLCameraCaptureTaskConstraintCoordinator_activateCameraSessionTaskConstraints__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    v2 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_FAULT, "%{public}@: activate camera session already has an active transaction", (uint8_t *)&v7, 0xCu);
    }
  }
  v4 = PLCameraTaskConstraintsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: activating camera session task constraints", (uint8_t *)&v7, 0xCu);
  }

  return [*(id *)(a1 + 32) _activateCameraSessionTaskConstraints];
}

- (void)_activateCameraSessionTaskConstraints
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  uint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"PLCameraCaptureTaskConstraintCoordinator"];
  transaction = self->_transaction;
  self->_transaction = v3;

  if (self->_delayedDeactivationInProgress)
  {
    uint64_t v5 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138543362;
      uint64_t v8 = self;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: cancelling delayed deactivation", (uint8_t *)&v7, 0xCu);
    }

    self->_delayedDeactivationInProgress = 0;
  }
  if ([(PLDelayedActionTimer *)self->_failsafeTimer isRunning]) {
    [(PLCameraCaptureTaskConstraintCoordinator *)self _cancelSessionFailsafeTimer];
  }
  v6 = +[PLCameraCaptureTaskConstraints sharedTaskConstraints];
  [v6 startConstrainingTasksWithCoordinator:self];

  if (self->_failsafeTimerEnabled) {
    [(PLCameraCaptureTaskConstraintCoordinator *)self _startSessionFailsafeTimer];
  }
}

- (void)activateCameraSessionTaskConstraints
{
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PLCameraCaptureTaskConstraintCoordinator_activateCameraSessionTaskConstraints__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(activationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraWatcherQueue, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_failsafeTimer, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activationQueue, 0);
  objc_storeStrong((id *)&self->_creationDateString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (int64_t)role
{
  return self->_role;
}

- (void)cameraWatcherDidChangeState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  cameraWatcherQueue = self->_cameraWatcherQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(cameraWatcherQueue);
  int v6 = [v5 isCameraRunning];

  int v7 = PLCameraTaskConstraintsGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      int v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: activating camera session task constraints automatically", (uint8_t *)&v9, 0xCu);
    }

    [(PLCameraCaptureTaskConstraintCoordinator *)self activateCameraSessionTaskConstraints];
  }
  else
  {
    if (v8)
    {
      int v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: deactivating camera session task constraints automatically", (uint8_t *)&v9, 0xCu);
    }

    [(PLCameraCaptureTaskConstraintCoordinator *)self deactivateCameraSessionTaskConstraints];
  }
}

- (void)_startWatchingCameraActivity
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLCameraTaskConstraintsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138543362;
    uint64_t v11 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: starting camera viewfinder monitor", (uint8_t *)&v10, 0xCu);
  }

  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);

  int v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.backgroundjobservice.isolationqueue", v5);
  cameraWatcherQueue = self->_cameraWatcherQueue;
  self->_cameraWatcherQueue = v6;

  BOOL v8 = (PFCameraViewfinderSessionWatcher *)[objc_alloc(MEMORY[0x1E4F8CBE8]) initWithDispatchQueue:self->_cameraWatcherQueue delegate:self];
  cameraWatcher = self->_cameraWatcher;
  self->_cameraWatcher = v8;

  [(PFCameraViewfinderSessionWatcher *)self->_cameraWatcher startWatching];
}

- (void)_cancelSessionFailsafeTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  int v3 = [(PLDelayedActionTimer *)self->_failsafeTimer isRunning];
  v4 = PLCameraTaskConstraintsGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      failsafeTimer = self->_failsafeTimer;
      int v7 = 138543618;
      BOOL v8 = self;
      __int16 v9 = 2114;
      int v10 = failsafeTimer;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: PLCameraCaptureTaskConstraintCoordinator cancelling failsafe timer %{public}@", (uint8_t *)&v7, 0x16u);
    }

    [(PLDelayedActionTimer *)self->_failsafeTimer cancel];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      BOOL v8 = self;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: PLCameraCaptureTaskConstraintCoordinator ignoring request to cancel NULL failsafe timer", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_startSessionFailsafeTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  if ([(PLDelayedActionTimer *)self->_failsafeTimer isRunning])
  {
    int v3 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      failsafeTimer = self->_failsafeTimer;
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = failsafeTimer;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: ignoring request to start active task constraint failsafe timer %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = self->_failsafeTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__PLCameraCaptureTaskConstraintCoordinator__startSessionFailsafeTimer__block_invoke;
    v8[3] = &unk_1E5875DA0;
    v8[4] = self;
    objc_copyWeak(&v9, &location);
    [(PLDelayedActionTimer *)v5 afterDelay:v8 performBlock:600.0];
    int v6 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = self->_failsafeTimer;
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: started task constraint failsafe timer %{public}@", buf, 0x16u);
    }

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __70__PLCameraCaptureTaskConstraintCoordinator__startSessionFailsafeTimer__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = PLCameraTaskConstraintsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 48);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: task constraint failsafe timer fired %{public}@, deactivating task constraints", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _deactivateCameraSessionTaskConstraintsAfterDelay:0.0];
}

- (void)_invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!self->_delayedDeactivationInProgress)
    {
      int v6 = PLCameraTaskConstraintsGetLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      int v12 = 138543362;
      __int16 v13 = self;
      uint64_t v7 = "%{public}@: delayed task constraint deactivation cancelled by re-activation";
      uint64_t v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
    uint64_t v4 = +[PLCameraCaptureTaskConstraints sharedTaskConstraints];
    [v4 stopConstrainingTasksWithCoordinator:self];

    transaction = self->_transaction;
    self->_transaction = 0;

    self->_delayedDeactivationInProgress = 0;
    int v6 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138543362;
      __int16 v13 = self;
      uint64_t v7 = "%{public}@: task constraints deactivated after delay";
LABEL_7:
      uint64_t v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v10, v11, v7, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    __int16 v8 = +[PLCameraCaptureTaskConstraints sharedTaskConstraints];
    [v8 stopConstrainingTasksWithCoordinator:self];

    uint64_t v9 = self->_transaction;
    self->_transaction = 0;

    int v6 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138543362;
      __int16 v13 = self;
      uint64_t v7 = "%{public}@: task constraints deactivated";
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)_deactivateCameraSessionTaskConstraintsAfterDelay:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_activationQueue);
  if (self->_delayedDeactivationInProgress)
  {
    id v5 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      os_log_type_t v11 = self;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: task constraint deactivation already in progress", buf, 0xCu);
    }
  }
  else
  {
    if ([(PLDelayedActionTimer *)self->_failsafeTimer isRunning]) {
      [(PLCameraCaptureTaskConstraintCoordinator *)self _cancelSessionFailsafeTimer];
    }
    if (a3 == 0.0)
    {
      [(PLCameraCaptureTaskConstraintCoordinator *)self _invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:0];
    }
    else
    {
      self->_delayedDeactivationInProgress = 1;
      objc_initWeak((id *)buf, self);
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      activationQueue = self->_activationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__PLCameraCaptureTaskConstraintCoordinator__deactivateCameraSessionTaskConstraintsAfterDelay___block_invoke;
      block[3] = &unk_1E5875F08;
      objc_copyWeak(&v9, (id *)buf);
      dispatch_after(v6, activationQueue, block);
      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __94__PLCameraCaptureTaskConstraintCoordinator__deactivateCameraSessionTaskConstraintsAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateTransactionAndStopConstrainingTasksWithDelayedDeactivation:1];
}

- (void)deactivateCameraSessionTaskConstraints
{
  activationQueue = self->_activationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PLCameraCaptureTaskConstraintCoordinator_deactivateCameraSessionTaskConstraints__block_invoke;
  block[3] = &unk_1E5875CE0;
  void block[4] = self;
  dispatch_sync(activationQueue, block);
}

uint64_t __82__PLCameraCaptureTaskConstraintCoordinator_deactivateCameraSessionTaskConstraints__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 32))
  {
    uint64_t v3 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_FAULT, "%{public}@: deactivate camera session with no active transaction", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(v2 + 80);
  dispatch_time_t v6 = PLCameraTaskConstraintsGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 2)
  {
    double v8 = 2.0;
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = 0x4000000000000000;
      uint64_t v10 = "%{public}@: deactivating camera session task constraints after %1.1f delay";
      os_log_type_t v11 = v6;
      uint32_t v12 = 22;
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    double v8 = 0.0;
    if (v7)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v13;
      uint64_t v10 = "%{public}@: deactivating camera session task constraints";
      os_log_type_t v11 = v6;
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }

  return [*(id *)(a1 + 32) _deactivateCameraSessionTaskConstraintsAfterDelay:v8];
}

- (id)sessionStatusDescription
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__54149;
  uint64_t v10 = __Block_byref_object_dispose__54150;
  os_log_type_t v11 = @"inactive";
  activationQueue = self->_activationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PLCameraCaptureTaskConstraintCoordinator_sessionStatusDescription__block_invoke;
  v5[3] = &unk_1E5875E68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(activationQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __68__PLCameraCaptureTaskConstraintCoordinator_sessionStatusDescription__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v2 = *(void **)(v1 + 40);
    *(void *)(v1 + 40) = @"active";
  }
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = PLCameraTaskConstraintsGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: invalidate", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = +[PLCameraCaptureTaskConstraints sharedTaskConstraints];
  [v4 stopConstrainingTasksWithCoordinator:self];
}

- (PLCameraCaptureTaskConstraintCoordinator)initWithTaskContstraintRole:(int64_t)a3 name:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLCameraCaptureTaskConstraintCoordinator;
  uint64_t v7 = [(PLCameraCaptureTaskConstraintCoordinator *)&v20 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = PLDateToISO8160StringWithLocalTimeZone(v10);
    creationDateString = v7->_creationDateString;
    v7->_creationDateString = (NSString *)v11;

    v7->_int64_t role = a3;
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v14 = pl_dispatch_queue_create_with_fallback_qos();
    activationQueue = v7->_activationQueue;
    v7->_activationQueue = (OS_dispatch_queue *)v14;

    if (+[PLCameraCaptureTaskConstraintCoordinator _shouldWatchCameraViewfinderForRole:a3])
    {
      [(PLCameraCaptureTaskConstraintCoordinator *)v7 _startWatchingCameraActivity];
    }
    if (+[PLCameraCaptureTaskConstraintCoordinator _shouldUseFailsafeTimerForRole:a3])
    {
      v7->_failsafeTimerEnabled = 1;
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F8B8C8]) initWithTargetQueue:v7->_activationQueue];
      failsafeTimer = v7->_failsafeTimer;
      v7->_failsafeTimer = (PLDelayedActionTimer *)v16;
    }
    uint64_t v18 = PLCameraTaskConstraintsGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: initialized", buf, 0xCu);
    }
  }
  return v7;
}

+ (id)taskConstraintStatus
{
  uint64_t v2 = +[PLCameraCaptureTaskConstraints sharedTaskConstraints];
  id v3 = [v2 taskConstraintStatus];

  return v3;
}

+ (BOOL)_shouldWatchCameraViewfinderForRole:(int64_t)a3
{
  return a3 == 2;
}

+ (BOOL)_shouldUseFailsafeTimerForRole:(int64_t)a3
{
  return a3 == 2;
}

@end