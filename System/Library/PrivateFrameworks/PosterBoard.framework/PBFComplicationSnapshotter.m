@interface PBFComplicationSnapshotter
- (BOOL)_hasStarted;
- (BOOL)_isFinished;
- (BOOL)_main_kickoffHostViewController:(id)a3;
- (BOOL)_wasCleanedUp;
- (BOOL)_wasInvalidated;
- (BOOL)start;
- (NSError)snapshotError;
- (PBFComplicationSnapshotRequest)request;
- (PBFComplicationSnapshotter)initWithComplicationSnapshotRequest:(id)a3;
- (UIImage)snapshot;
- (double)elapsedTime;
- (void)_finishWithImage:(id)a3 error:(id)a4;
- (void)_main_cleanup;
- (void)_main_requestTimedOut;
- (void)addObserver:(id)a3;
- (void)cancelWithReason:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation PBFComplicationSnapshotter

- (PBFComplicationSnapshotter)initWithComplicationSnapshotRequest:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PBFComplicationSnapshotter;
  v6 = [(PBFComplicationSnapshotter *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v7->_lock_observers;
    v7->_lock_observers = (NSHashTable *)v8;

    v10 = NSString;
    v11 = [MEMORY[0x1E4F29128] UUID];
    v12 = [v11 UUIDString];
    v13 = [v12 substringToIndex:7];
    v14 = [v5 widget];
    v15 = [v14 extensionBundleIdentifier];
    v16 = [v5 metrics];
    uint64_t v17 = [v10 stringWithFormat:@"%@-%@-%@", v13, v15, v16];
    snapshotterIdentifier = v7->_snapshotterIdentifier;
    v7->_snapshotterIdentifier = (NSString *)v17;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)start
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_started = self->_lock_started;
  if (self->_lock_started)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_startTime = CFAbsoluteTimeGetCurrent();
    self->_BOOL lock_started = 1;
    os_unfair_lock_unlock(p_lock);
    id v5 = PBFLogSnapshotter();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      snapshotterIdentifier = self->_snapshotterIdentifier;
      *(_DWORD *)buf = 138543362;
      v21 = snapshotterIdentifier;
      _os_log_impl(&dword_1D31CE000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Starting complication snapshotter", buf, 0xCu);
    }

    v7 = [(PBFComplicationSnapshotRequest *)self->_request widget];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PBFComplicationSnapshotter_start__block_invoke;
    block[3] = &unk_1E69808E8;
    id v8 = v7;
    id v18 = v8;
    v19 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (([v9 BOOLForKey:@"DISABLE_SNAPSHOT_TIMEOUT"] & 1) == 0)
    {
      v10 = PBFLogSnapshotter();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_snapshotterIdentifier;
        *(_DWORD *)buf = 138543362;
        v21 = v11;
        _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_INFO, "(%{public}@) Starting complication snapshotter timeout watching", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      dispatch_time_t v12 = dispatch_time(0, 60000000000);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __35__PBFComplicationSnapshotter_start__block_invoke_9;
      v15[3] = &unk_1E6981D18;
      objc_copyWeak(&v16, (id *)buf);
      v13 = (void *)MEMORY[0x1E4F14428];
      dispatch_after(v12, MEMORY[0x1E4F14428], v15);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  return !lock_started;
}

void __35__PBFComplicationSnapshotter_start__block_invoke(uint64_t a1)
{
  v2 = PRSharedWidgetDescriptorProvider();
  v3 = [v2 descriptorForPersonality:*(void *)(a1 + 32)];

  uint64_t v4 = [v3 intentType];
  if (v4
    && (id v5 = (void *)v4,
        [*(id *)(a1 + 32) intent],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__PBFComplicationSnapshotter_start__block_invoke_2;
    v9[3] = &unk_1E6981CF0;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = v7;
    uint64_t v11 = v8;
    [v3 loadDefaultIntent:v9];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_main_kickoffHostViewController:", *(void *)(a1 + 32));
  }
}

void __35__PBFComplicationSnapshotter_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) widgetByReplacingIntent:a2];
  objc_msgSend(*(id *)(a1 + 40), "_main_kickoffHostViewController:", v3);
}

void __35__PBFComplicationSnapshotter_start__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_requestTimedOut");
}

- (BOOL)_main_kickoffHostViewController:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Chswidget.isa);
  if (!v5)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotter _main_kickoffHostViewController:](a2);
    }
LABEL_9:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3205BBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:CHSWidgetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotter _main_kickoffHostViewController:](a2);
    }
    goto LABEL_9;
  }

  BSDispatchQueueAssertMain();
  v6 = [(PBFComplicationSnapshotRequest *)self->_request metrics];
  id v7 = (CHUISWidgetHostViewController *)[objc_alloc(MEMORY[0x1E4F58F58]) initWithWidget:v5 metrics:v6 widgetConfigurationIdentifier:0];
  hostViewController = self->_hostViewController;
  self->_hostViewController = v7;

  [(CHUISWidgetHostViewController *)self->_hostViewController setCanAppearInSecureEnvironment:1];
  [(CHUISWidgetHostViewController *)self->_hostViewController setContentType:1];
  [(CHUISWidgetHostViewController *)self->_hostViewController setColorScheme:2];
  [(CHUISWidgetHostViewController *)self->_hostViewController setWidgetPriority:1];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F58EE0]) initWithRenderingMode:1 backgroundViewPolicy:1];
  [(CHUISWidgetHostViewController *)self->_hostViewController setRenderScheme:v9];
  id v10 = objc_alloc_init(MEMORY[0x1E4F58CE8]);
  [v10 setShowsDateAlongsideText:1];
  id v11 = objc_alloc_init(MEMORY[0x1E4F58CD0]);
  [v11 setSize:&unk_1F2AAEC80];
  dispatch_time_t v12 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  [v11 setWeight:v12];

  [v10 setFontSpecification:v11];
  [v10 setSymbolScale:1];
  [(CHUISWidgetHostViewController *)self->_hostViewController setInlineTextParameters:v10];
  [(CHUISWidgetHostViewController *)self->_hostViewController setPresentationMode:2];
  objc_initWeak(&location, self);
  v13 = self->_hostViewController;
  v14 = dispatch_get_global_queue(25, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__PBFComplicationSnapshotter__main_kickoffHostViewController___block_invoke;
  v18[3] = &unk_1E6981D40;
  id v15 = v5;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  [(CHUISWidgetHostViewController *)v13 snapshotContentWithTimeout:v14 queue:v18 completion:30.0];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

void __62__PBFComplicationSnapshotter__main_kickoffHostViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  uint64_t v6 = a3;
  if (!(v5 | v6))
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    v11[0] = *MEMORY[0x1E4F28568];
    v11[1] = @"Widget";
    uint64_t v8 = *(__CFString **)(a1 + 32);
    if (!v8) {
      uint64_t v8 = @"(null widget)";
    }
    v12[0] = @"Unable to generate image for widget";
    v12[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    uint64_t v6 = objc_msgSend(v7, "pbf_generalErrorWithCode:userInfo:", 1, v9);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishWithImage:v5 error:v6];
}

- (void)_main_requestTimedOut
{
  if (![(PBFComplicationSnapshotter *)self _isFinished])
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 2, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(PBFComplicationSnapshotter *)self _finishWithImage:0 error:v3];
  }
}

- (void)_finishWithImage:(id)a3 error:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v25 = v7;
  id obj = a4;
  if (__PAIR128__((unint64_t)obj, (unint64_t)v7) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28588];
    v43[0] = @"No image was created and no error given; this is a catch all instead of just crashing.";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    objc_msgSend(v8, "pbf_generalErrorWithCode:userInfo:", 7, v9);
    id obj = (id)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = &off_1D337E000;
  if (!self->_lock_finished)
  {
    self->_lock_endTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&self->_snapshot, a3);
    objc_storeStrong((id *)&self->_snapshotError, obj);
    dispatch_time_t v12 = PBFLogSnapshotter();
    v13 = v12;
    if (obj)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        snapshotterIdentifier = self->_snapshotterIdentifier;
        double v15 = self->_lock_endTime - self->_lock_startTime;
        *(_DWORD *)buf = 138543874;
        v37 = snapshotterIdentifier;
        __int16 v38 = 2114;
        double v39 = *(double *)&obj;
        __int16 v40 = 2048;
        double v41 = v15;
        _os_log_error_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_ERROR, "(%{public}@) Finished complication snapshotter w/ error '%{public}@'; %f seconds elapsed",
          buf,
          0x20u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = self->_snapshotterIdentifier;
      double v17 = self->_lock_endTime - self->_lock_startTime;
      *(_DWORD *)buf = 138543618;
      v37 = v16;
      __int16 v38 = 2048;
      double v39 = v17;
      _os_log_impl(&dword_1D31CE000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished complication snapshotter; %f seconds elapsed",
        buf,
        0x16u);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v24 = (id)[(NSHashTable *)self->_lock_observers copy];
    uint64_t v18 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v24);
          }
          uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v23 = [NSString stringWithUTF8String:"-[PBFComplicationSnapshotter _finishWithImage:error:]"];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke;
          v28[3] = &unk_1E6981490;
          v28[4] = v22;
          v28[5] = self;
          id v29 = v25;
          id v30 = obj;
          PBFDispatchAsyncWithString(v23, QOS_CLASS_DEFAULT, v28);
        }
        uint64_t v19 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v19);
    }

    [(NSHashTable *)self->_lock_observers removeAllObjects];
    self->_lock_finished = 1;
    p_lock = &self->_lock;
    id v11 = &off_1D337E000;
  }
  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *((void *)v11 + 285);
  block[2] = __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke_2;
  block[3] = &unk_1E69808C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) complicationSnapshotter:*(void *)(a1 + 40) didFinishWithSnapshot:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_cleanup");
}

- (void)cancelWithReason:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  if (a3) {
    unint64_t v5 = (__CFString *)a3;
  }
  else {
    unint64_t v5 = @"(null)";
  }
  uint64_t v10 = *MEMORY[0x1E4F28588];
  v11[0] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  uint64_t v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = objc_msgSend(v4, "pbf_generalErrorWithCode:userInfo:", 4, v8);

  [(PBFComplicationSnapshotter *)self _finishWithImage:0 error:v9];
}

- (void)_main_cleanup
{
  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_cleanedUp)
  {
    [(CHUISWidgetHostViewController *)self->_hostViewController invalidate];
    hostViewController = self->_hostViewController;
    self->_hostViewController = 0;

    self->_lock_cleanedUp = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (UIImage)snapshot
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_snapshot;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSError)snapshotError
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_snapshotError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)elapsedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_started)
  {
    if (self->_lock_finished) {
      double lock_endTime = self->_lock_endTime;
    }
    else {
      double lock_endTime = CFAbsoluteTimeGetCurrent();
    }
    double v5 = lock_endTime - self->_lock_startTime;
  }
  else
  {
    double v5 = -1.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)_isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_hasStarted
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_wasCleanedUp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cleanedUp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_wasInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PBFComplicationSnapshotter *)self _finishWithImage:0 error:v4];
  }
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (PBFComplicationSnapshotRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotError, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_widgetWithIntent, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_snapshotterIdentifier, 0);
}

- (void)_main_kickoffHostViewController:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

- (void)_main_kickoffHostViewController:(const char *)a1 .cold.2(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end