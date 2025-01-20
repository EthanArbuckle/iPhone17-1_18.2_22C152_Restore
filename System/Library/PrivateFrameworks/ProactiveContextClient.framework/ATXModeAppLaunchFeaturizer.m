@interface ATXModeAppLaunchFeaturizer
- (ATXModeAppLaunchFeaturizer)init;
- (ATXModeFeaturizerDelegate)delegate;
- (BOOL)cooldownTimerIsEnabled;
- (BOOL)easeInTimerIsEnabled;
- (id)_latestAppLaunchBundleIds;
- (id)_provideFeaturesWithBundleIds:(id)a3;
- (id)additionalAllowedBundleIds;
- (id)provideFeatures;
- (id)registrationId;
- (int)modeFeatureType;
- (int64_t)state;
- (unint64_t)expectedGenreId;
- (void)_actuallyEndMode;
- (void)_actuallyStartMode;
- (void)_processActiveApps:(id)a3;
- (void)beginListening;
- (void)setCooldownTimerIsEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEaseInTimerIsEnabled:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)stopListening;
@end

@implementation ATXModeAppLaunchFeaturizer

- (id)additionalAllowedBundleIds
{
  v2 = objc_opt_new();

  return v2;
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_26(uint64_t a1, void *a2)
{
  id v14 = a2;
  v3 = [v14 eventBody];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained)
    {
LABEL_9:

      goto LABEL_10;
    }
    v5 = [v14 eventBody];
    if ([v5 starting])
    {
      v6 = [v14 eventBody];
      v7 = [v6 bundleID];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0187360]();
        id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        v11 = [v14 eventBody];
        v12 = [v11 bundleID];
        v13 = objc_msgSend(v10, "initWithObjects:", v12, 0);

LABEL_8:
        [WeakRetained _processActiveApps:v13];

        goto LABEL_9;
      }
    }
    else
    {
    }
    v13 = objc_opt_new();
    goto LABEL_8;
  }
LABEL_10:
}

- (void)_processActiveApps:(id)a3
{
  id v4 = a3;
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXModeAppLaunchFeaturizer _processActiveApps:]();
  }

  int64_t v6 = [(ATXModeAppLaunchFeaturizer *)self state];
  if ([v4 count])
  {
    uint64_t v7 = [(ATXModeAppLaunchFeaturizer *)self expectedGenreId];
    uint64_t v8 = [(ATXModeAppLaunchFeaturizer *)self additionalAllowedBundleIds];
    v9 = activeBundleForBundleIds(v4, v7, v8);
    if (v9) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  if (v6 != v10)
  {
    switch(v6)
    {
      case 0:
        break;
      case 1:
        if (v10 != 3) {
          goto LABEL_25;
        }
        v11 = __atxlog_handle_modes();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DAFF9000, v11, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Entering ease in period before entering state", buf, 2u);
        }

        [(ATXModeAppLaunchFeaturizer *)self setState:2];
        easeInTimer = self->_easeInTimer;
        BOOL easeInTimerIsEnabled = self->_easeInTimerIsEnabled;
        goto LABEL_22;
      case 2:
        id v14 = __atxlog_handle_modes();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v10 != 3)
        {
          if (v15)
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1DAFF9000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Going back to inactive state since user quit prematurely", v26, 2u);
          }

          [(ATXModeAppLaunchFeaturizer *)self setState:1];
          cooldownTimer = self->_easeInTimer;
          goto LABEL_35;
        }
        if (!v15) {
          goto LABEL_39;
        }
        __int16 v27 = 0;
        v16 = "ATXModeAppLaunchFeaturizer: Already easing in and still not in state";
        v17 = (uint8_t *)&v27;
        goto LABEL_38;
      case 3:
        if (v10 != 1) {
          goto LABEL_25;
        }
        v18 = __atxlog_handle_modes();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_1DAFF9000, v18, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Entering cool down period before exiting state", v25, 2u);
        }

        [(ATXModeAppLaunchFeaturizer *)self setState:4];
        easeInTimer = self->_cooldownTimer;
        BOOL easeInTimerIsEnabled = self->_cooldownTimerIsEnabled;
LABEL_22:
        double v19 = 300.0;
        if (!easeInTimerIsEnabled) {
          double v19 = 0.0;
        }
        [(_PASSimpleCoalescingTimer *)easeInTimer runAfterDelaySeconds:1 coalescingBehavior:v19];
        break;
      case 4:
        id v14 = __atxlog_handle_modes();
        BOOL v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v10 == 3)
        {
          if (v21)
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1DAFF9000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Going back to proper state", v24, 2u);
          }

          [(ATXModeAppLaunchFeaturizer *)self setState:3];
          cooldownTimer = self->_cooldownTimer;
LABEL_35:
          [(_PASSimpleCoalescingTimer *)cooldownTimer cancelPendingOperations];
        }
        else
        {
          if (v21)
          {
            __int16 v23 = 0;
            v16 = "ATXModeAppLaunchFeaturizer: Already cooling down and still not in state";
            v17 = (uint8_t *)&v23;
LABEL_38:
            _os_log_impl(&dword_1DAFF9000, v14, OS_LOG_TYPE_DEFAULT, v16, v17, 2u);
          }
LABEL_39:
        }
        break;
      default:
LABEL_25:
        v20 = __atxlog_handle_modes();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          -[ATXModeAppLaunchFeaturizer _processActiveApps:]();
        }

        break;
    }
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ATXModeAppLaunchFeaturizer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXModeAppLaunchFeaturizer;
  v2 = [(ATXModeAppLaunchFeaturizer *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_cooldownTimerIsEnabled = 1;
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(@"RemoveModeSwitchCooldown", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
      {
        v3->_cooldownTimerIsEnabled = 0;
      }
    }
    v3->_BOOL easeInTimerIsEnabled = 1;
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(@"RemoveModeSwitchEaseIn", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
      {
        v3->_BOOL easeInTimerIsEnabled = 0;
      }
    }
    id v4 = (ATXFrontBoardLayoutAggregator *)objc_alloc_init(MEMORY[0x1E4F4B630]);
    frontBoardLayoutAggregator = v3->_frontBoardLayoutAggregator;
    v3->_frontBoardLayoutAggregator = v4;

    int64_t v6 = v3;
  }

  return v3;
}

- (id)_latestAppLaunchBundleIds
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  BOOL v15 = __Block_byref_object_dispose__3;
  id v16 = (id)objc_opt_new();
  v2 = BiomeLibrary();
  v3 = [v2 App];
  id v4 = [v3 InFocus];
  v5 = objc_msgSend(v4, "atx_publisherFromStartDate:", 0);
  int64_t v6 = [v5 last];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_7;
  v10[3] = &unk_1E6BE6988;
  v10[4] = &v11;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_4 receiveInput:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  id v4 = __atxlog_handle_modes();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: done fetching last app launch event", v6, 2u);
  }
}

void __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_7(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 eventBody];
  if ([v3 starting])
  {
    id v4 = [v13 eventBody];
    v5 = [v4 bundleID];
    uint64_t v6 = [v5 length];

    if (!v6) {
      goto LABEL_5;
    }
    id v7 = (void *)MEMORY[0x1E0187360]();
    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v9 = [v13 eventBody];
    uint64_t v10 = [v9 bundleID];
    uint64_t v11 = objc_msgSend(v8, "initWithObjects:", v10, 0);

    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v3 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }

LABEL_5:
}

- (id)provideFeatures
{
  uint64_t v3 = [(ATXModeAppLaunchFeaturizer *)self _latestAppLaunchBundleIds];
  id v4 = [(ATXModeAppLaunchFeaturizer *)self _provideFeaturesWithBundleIds:v3];

  return v4;
}

- (id)_provideFeaturesWithBundleIds:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(ATXModeFeatureSet);
  int64_t v6 = [(ATXModeAppLaunchFeaturizer *)self state];
  if (v6 == 4 || v6 == 3)
  {
    v9 = 0;
    BOOL v10 = 1;
  }
  else if (v6)
  {
    BOOL v10 = 0;
    v9 = 0;
  }
  else
  {
    uint64_t v7 = [(ATXModeAppLaunchFeaturizer *)self expectedGenreId];
    id v8 = [(ATXModeAppLaunchFeaturizer *)self additionalAllowedBundleIds];
    v9 = activeBundleForBundleIds(v4, v7, v8);

    BOOL v10 = v9 != 0;
    if (v9) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 1;
    }
    [(ATXModeAppLaunchFeaturizer *)self setState:v11];
    uint64_t v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      int64_t v15 = [(ATXModeAppLaunchFeaturizer *)self state];
      _os_log_impl(&dword_1DAFF9000, v12, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: Initial state: %ld", (uint8_t *)&v14, 0xCu);
    }
  }
  [(ATXModeFeatureSet *)v5 setValue:v10 forBinaryFeatureOfType:[(ATXModeAppLaunchFeaturizer *)self modeFeatureType]];
  if (v10 && v9) {
    [(ATXModeFeatureSet *)v5 setString:v9 forFeatureType:16];
  }
  else {
    [(ATXModeFeatureSet *)v5 setNullForFeatureType:16];
  }

  return v5;
}

- (void)_actuallyEndMode
{
  if ([(ATXModeAppLaunchFeaturizer *)self state] == 4)
  {
    [(ATXModeAppLaunchFeaturizer *)self setState:1];
    uint64_t v3 = __atxlog_handle_modes();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1DAFF9000, v3, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: State after cooldown: not active", v7, 2u);
    }

    id v4 = [(ATXModeAppLaunchFeaturizer *)self delegate];
    v5 = objc_opt_new();
    int64_t v6 = [(ATXModeAppLaunchFeaturizer *)self _provideFeaturesWithBundleIds:v5];
    [v4 featurizer:self didUpdateFeatures:v6];
  }
}

- (void)_actuallyStartMode
{
  if ([(ATXModeAppLaunchFeaturizer *)self state] == 2)
  {
    [(ATXModeAppLaunchFeaturizer *)self setState:3];
    uint64_t v3 = __atxlog_handle_modes();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1DAFF9000, v3, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: State after ease-in: active", v7, 2u);
    }

    id v4 = [(ATXModeAppLaunchFeaturizer *)self delegate];
    v5 = [(ATXModeAppLaunchFeaturizer *)self _latestAppLaunchBundleIds];
    int64_t v6 = [(ATXModeAppLaunchFeaturizer *)self _provideFeaturesWithBundleIds:v5];
    [v4 featurizer:self didUpdateFeatures:v6];
  }
}

- (unint64_t)expectedGenreId
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Subclasses should implement -[ATXModeAppLaunchFeaturizer expectedGenreId]" userInfo:0];
  objc_exception_throw(v2);
}

- (int)modeFeatureType
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Subclasses should implement -[ATXModeAppLaunchFeaturizer modeFeatureType]" userInfo:0];
  objc_exception_throw(v2);
}

- (id)registrationId
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Subclasses should implement -[ATXModeAppLaunchFeaturizer registrationId]" userInfo:0];
  objc_exception_throw(v2);
}

- (void)beginListening
{
  objc_initWeak(&location, self);
  if (!self->_cooldownTimer)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B98]);
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke;
    v31[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v32, &location);
    int64_t v6 = (_PASSimpleCoalescingTimer *)[v3 initWithQueue:v4 operation:v31];
    cooldownTimer = self->_cooldownTimer;
    self->_cooldownTimer = v6;

    objc_destroyWeak(&v32);
  }
  if (!self->_easeInTimer)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F93B98]);
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_2;
    v29[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v30, &location);
    uint64_t v11 = (_PASSimpleCoalescingTimer *)[v8 initWithQueue:v9 operation:v29];
    easeInTimer = self->_easeInTimer;
    self->_easeInTimer = v11;

    objc_destroyWeak(&v30);
  }
  if (!self->_queue)
  {
    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeAppLaunch.queue", v13);
    queue = self->_queue;
    self->_queue = v14;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F502E8]);
  v17 = [(ATXModeAppLaunchFeaturizer *)self registrationId];
  v18 = (BMBiomeScheduler *)[v16 initWithIdentifier:v17 targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v18;

  v20 = BiomeLibrary();
  BOOL v21 = [v20 App];
  v22 = [v21 InFocus];
  __int16 v23 = objc_msgSend(v22, "atx_DSLPublisher");
  v24 = [v23 subscribeOn:self->_scheduler];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_26;
  v27[3] = &unk_1E6BE6A38;
  objc_copyWeak(&v28, &location);
  v25 = [v24 sinkWithCompletion:&__block_literal_global_25_0 receiveInput:v27];
  sink = self->_sink;
  self->_sink = v25;

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _actuallyEndMode];
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _actuallyStartMode];
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  uint64_t v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_3_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAppLaunchFeaturizer: done listening to app launch events", v6, 2u);
  }
}

- (void)stopListening
{
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;
}

- (ATXModeFeaturizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeFeaturizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)easeInTimerIsEnabled
{
  return self->_easeInTimerIsEnabled;
}

- (void)setEaseInTimerIsEnabled:(BOOL)a3
{
  self->_BOOL easeInTimerIsEnabled = a3;
}

- (BOOL)cooldownTimerIsEnabled
{
  return self->_cooldownTimerIsEnabled;
}

- (void)setCooldownTimerIsEnabled:(BOOL)a3
{
  self->_cooldownTimerIsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_frontBoardLayoutAggregator, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_easeInTimer, 0);

  objc_storeStrong((id *)&self->_cooldownTimer, 0);
}

void __55__ATXModeAppLaunchFeaturizer__latestAppLaunchBundleIds__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeAppLaunchFeaturizer: error fetching last app launch event: %@", v4, v5, v6, v7, v8);
}

- (void)_processActiveApps:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1DAFF9000, v1, OS_LOG_TYPE_FAULT, "ATXModeAppLaunchFeaturizer: Unexpected state %ld %ld", v2, 0x16u);
}

- (void)_processActiveApps:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_DEBUG, "ATXModeAppLaunchFeaturizer: Processing active apps: %@", v1, 0xCu);
}

void __44__ATXModeAppLaunchFeaturizer_beginListening__block_invoke_3_cold_1(void *a1)
{
  os_log_t v1 = [a1 error];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeAppLaunchFeaturizer: error listening to app launch events: %@", v4, v5, v6, v7, v8);
}

@end