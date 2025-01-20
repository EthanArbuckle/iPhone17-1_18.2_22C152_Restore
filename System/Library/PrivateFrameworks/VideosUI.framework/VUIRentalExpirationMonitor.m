@interface VUIRentalExpirationMonitor
+ (id)sharedInstance;
- (NSDate)dateOfLastRentalExpirationHandling;
- (NSTimer)earliestExpirationTimer;
- (OS_dispatch_queue)serialQueue;
- (TVPStateMachine)stateMachine;
- (VUIRentalExpirationMonitor)init;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_expirationTimerDidFire:(id)a3;
- (void)_isPlaybackUIBeingShownDidChange:(id)a3;
- (void)_libraryContentsDidChange:(id)a3;
- (void)_registerStateMachineHandlers;
- (void)dealloc;
- (void)setDateOfLastRentalExpirationHandling:(id)a3;
- (void)setEarliestExpirationTimer:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)startMonitoring;
@end

@implementation VUIRentalExpirationMonitor

void __44__VUIRentalExpirationMonitor_sharedInstance__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIRentalExpirationMonitor");
  v1 = (void *)sLogObject_19;
  sLogObject_19 = (uint64_t)v0;

  v2 = objc_alloc_init(VUIRentalExpirationMonitor);
  v3 = (void *)sharedInstance_instance_4;
  sharedInstance_instance_4 = (uint64_t)v2;
}

- (VUIRentalExpirationMonitor)init
{
  v16.receiver = self;
  v16.super_class = (Class)VUIRentalExpirationMonitor;
  v2 = [(VUIRentalExpirationMonitor *)&v16 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", objc_opt_class()];
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.VideosUI.VUIRentalExpirationMonitor", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FA9DA8]) initWithName:v3 initialState:@"Idle" mode:0];
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v6;

    [(TVPStateMachine *)v2->_stateMachine setLogObject:sLogObject_19];
    [(VUIRentalExpirationMonitor *)v2 _registerStateMachineHandlers];
    [(TVPStateMachine *)v2->_stateMachine setShouldAcceptEvents:1];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v2 selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4FB3D70] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10 = VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0];
    v11 = +[VUIPlaybackManager sharedInstance];
    [v9 addObserver:v2 selector:sel__isPlaybackUIBeingShownDidChange_ name:v10 object:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F79378];
    v14 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
    [v12 addObserver:v2 selector:sel__libraryContentsDidChange_ name:v13 object:v14];
  }
  return v2;
}

- (void)_registerStateMachineHandlers
{
  v39[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = [(VUIRentalExpirationMonitor *)self stateMachine];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3;
  aBlock[3] = &unk_1E6DFAB20;
  objc_copyWeak(&v37, &location);
  id v35 = &__block_literal_global_93;
  id v36 = &__block_literal_global_80;
  dispatch_queue_t v4 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_102;
  v30[3] = &unk_1E6DFAB48;
  objc_copyWeak(&v33, &location);
  id v31 = &__block_literal_global_80;
  id v32 = &__block_literal_global_90;
  v5 = _Block_copy(v30);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_107;
  v27[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v29, &location);
  id v6 = v5;
  id v28 = v6;
  [v3 registerHandlerForEvent:@"Start monitoring" onState:@"Idle" withBlock:v27];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_109;
  v24[3] = &unk_1E6DF5E28;
  objc_copyWeak(&v26, &location);
  id v7 = v4;
  id v25 = v7;
  [v3 registerHandlerForEvent:@"Rental query did complete" onState:@"Waiting for rental query to complete" withBlock:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_114;
  v22[3] = &unk_1E6DF6470;
  id v8 = v7;
  id v23 = v8;
  [v3 registerHandlerForEvent:@"Application did become active" onState:@"Waiting for appropriate app state to handle expiration" withBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_115;
  v20[3] = &unk_1E6DF6470;
  id v9 = v8;
  id v21 = v9;
  [v3 registerHandlerForEvent:@"Playback UI no longer being shown" onState:@"Waiting for appropriate app state to handle expiration" withBlock:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_116;
  v18[3] = &unk_1E6DF6470;
  id v10 = v6;
  id v19 = v10;
  [v3 registerHandlerForEvent:@"Expiration UI complete" onState:@"Showing expiration UI" withBlock:v18];
  v39[0] = @"Idle";
  v39[1] = @"Waiting for earliest rental to expire";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_117;
  v16[3] = &unk_1E6DF6470;
  id v12 = v10;
  id v17 = v12;
  [v3 registerHandlerForEvent:@"Library contents did change" onStates:v11 withBlock:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_118;
  v14[3] = &unk_1E6DF6470;
  id v13 = v12;
  id v15 = v13;
  [v3 registerHandlerForEvent:@"Rental expiration timer did fire" onState:@"Waiting for earliest rental to expire" withBlock:v14];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_107(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)CFPreferencesCopyAppValue(@"LastRunValue", @"com.apple.videos-preferences");
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = v4;
  if (v3)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 doubleValue];
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F28ED0];
    [v4 timeIntervalSinceReferenceDate];
    CFPreferencesSetAppValue(@"LastRunValue", (CFPropertyListRef)objc_msgSend(v8, "numberWithDouble:"), @"com.apple.videos-preferences");
    CFPreferencesAppSynchronize(@"com.apple.videos-preferences");
    id v7 = v5;
  }
  id v9 = v7;
  [WeakRetained setDateOfLastRentalExpirationHandling:v7];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return @"Waiting for rental query to complete";
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_102(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = [WeakRetained dateOfLastRentalExpirationHandling];
  id v8 = (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v4, v7);

  id v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  id v10 = [WeakRetained serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_103;
  block[3] = &unk_1E6DF7230;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  objc_copyWeak(&v16, v3);
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
}

id __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_87(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F79AA0];
  uint64_t v3 = *MEMORY[0x1E4F79800];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  [a2 timeIntervalSinceReferenceDate];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v6 = [v2 predicateWithProperty:v3 value:v5 comparison:3];

  id v7 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79758] equalToInteger:1];
  id v8 = (void *)MEMORY[0x1E4F79A60];
  v16[0] = v7;
  v16[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v10 = [v8 predicateMatchingPredicates:v9];

  id v11 = (void *)MEMORY[0x1E4F79B50];
  id v12 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
  id v13 = [v11 queryWithLibrary:v12 predicate:v10 orderingTerms:0];

  [v13 setIgnoreSystemFilterPredicates:1];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F79B28]) initWithQuery:v13];

  return v14;
}

id __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    id v7 = (void *)MEMORY[0x1E4F79AA0];
    uint64_t v8 = *MEMORY[0x1E4F79800];
    id v9 = (void *)MEMORY[0x1E4F28ED0];
    [v5 timeIntervalSinceReferenceDate];
    id v10 = objc_msgSend(v9, "numberWithDouble:");
    id v11 = [v7 predicateWithProperty:v8 value:v10 comparison:3];

    id v12 = (void *)MEMORY[0x1E4F79AA0];
    id v13 = (void *)MEMORY[0x1E4F28ED0];
    [v4 timeIntervalSinceReferenceDate];
    id v14 = objc_msgSend(v13, "numberWithDouble:");
    id v15 = [v12 predicateWithProperty:v8 value:v14 comparison:5];

    id v16 = [MEMORY[0x1E4F79AA0] predicateWithProperty:*MEMORY[0x1E4F79758] equalToInteger:1];
    id v17 = (void *)MEMORY[0x1E4F79A60];
    v26[0] = v11;
    v26[1] = v15;
    v26[2] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    id v19 = [v17 predicateMatchingPredicates:v18];

    v20 = (void *)MEMORY[0x1E4F79B50];
    id v21 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
    v22 = [v20 queryWithLibrary:v21 predicate:v19 orderingTerms:0];

    [v22 setIgnoreSystemFilterPredicates:1];
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4F79B28]) initWithQuery:v22];
  }
  else
  {
    v24 = sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_ERROR)) {
      __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_cold_1(v24);
    }
    id v23 = 0;
  }

  return v23;
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_103(id *a1)
{
  [a1[4] updateToLibraryCurrentRevision];
  [a1[5] updateToLibraryCurrentRevision];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_104;
  block[3] = &unk_1E6DF45D8;
  id v4 = a1[4];
  id v5 = a1[5];
  id v6 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setDateOfLastRentalExpirationHandling:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (NSDate)dateOfLastRentalExpirationHandling
{
  return self->_dateOfLastRentalExpirationHandling;
}

- (void)startMonitoring
{
  id v2 = [(VUIRentalExpirationMonitor *)self stateMachine];
  [v2 postEvent:@"Start monitoring"];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_27 != -1) {
    dispatch_once(&sharedInstance_onceToken_27, &__block_literal_global_118);
  }
  id v2 = (void *)sharedInstance_instance_4;
  return v2;
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_104(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"ExpiredQueryKey"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v6 setObject:v4 forKey:@"UnexpiredQueryKey"];
  }
  id v5 = [*(id *)(a1 + 48) stateMachine];
  [v5 postEvent:@"Rental query did complete" withContext:0 userInfo:v6];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v3 = [(VUIRentalExpirationMonitor *)self stateMachine];
  [v3 postEvent:@"Application did become active"];
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_109(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v14 = [v12 objectForKey:@"ExpiredQueryKey"];
  id v15 = [v12 objectForKey:@"UnexpiredQueryKey"];
  id v16 = (void *)sLogObject_19;
  if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v14 count];
    _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu rentals that have expired since expiration handling", (uint8_t *)&buf, 0xCu);
  }
  v18 = [WeakRetained earliestExpirationTimer];
  BOOL v19 = v18 == 0;

  if (!v19)
  {
    v20 = sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Invalidating existing expiration timer", (uint8_t *)&buf, 2u);
    }
    id v21 = [WeakRetained earliestExpirationTimer];
    [v21 invalidate];

    [WeakRetained setEarliestExpirationTimer:0];
  }
  if ([v14 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = (void *)sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      uint64_t v25 = [v15 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1E2BD7000, v24, OS_LOG_TYPE_DEFAULT, "Found %lu rentals that will expire in the future", (uint8_t *)&buf, 0xCu);
    }
    if ([v15 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__24;
      v41 = __Block_byref_object_dispose__24;
      id v42 = 0;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_110;
      v35[3] = &unk_1E6DFAB70;
      v35[4] = &buf;
      [v15 enumeratePersistentIDsUsingBlock:v35];
      id v26 = *(void **)(*((void *)&buf + 1) + 40);
      if (v26)
      {
        v27 = (void *)MEMORY[0x1E4F1C9C8];
        [v26 doubleValue];
        id v29 = [v27 dateWithTimeIntervalSinceReferenceDate:v28 + 5.0];
        v30 = sLogObject_19;
        if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v36 = 138412290;
          id v37 = v29;
          _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "Scheduling expiration timer for earliest expiration: %@", v36, 0xCu);
        }
        id v31 = (void *)MEMORY[0x1E4F1CB00];
        [v29 timeIntervalSinceNow];
        id v32 = objc_msgSend(v31, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", WeakRetained, sel__expirationTimerDidFire_, 0, 0);
        [WeakRetained setEarliestExpirationTimer:v32];

        v22 = @"Waiting for earliest rental to expire";
      }
      else
      {
        id v33 = sLogObject_19;
        if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_ERROR)) {
          __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_109_cold_1(v33);
        }
        v22 = @"Idle";
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v22 = @"Idle";
    }
  }

  return v22;
}

- (NSTimer)earliestExpirationTimer
{
  return self->_earliestExpirationTimer;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIRentalExpirationMonitor;
  [(VUIRentalExpirationMonitor *)&v4 dealloc];
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v4 = +[VUIPlaybackManager sharedInstance];
  int v5 = [v4 isPlaybackUIBeingShown];

  id v6 = sLogObject_19;
  if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v5) {
      id v7 = @"YES";
    }
    *(_DWORD *)long long buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "isPlaybackUIBeingShown did change to %@", buf, 0xCu);
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Delaying EventPlaybackUINoLongerBeingShown to allow transition to finish.", buf, 2u);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__VUIRentalExpirationMonitor__isPlaybackUIBeingShownDidChange___block_invoke;
    block[3] = &unk_1E6DF4A30;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __63__VUIRentalExpirationMonitor__isPlaybackUIBeingShownDidChange___block_invoke(uint64_t a1)
{
  id v2 = +[VUIPlaybackManager sharedInstance];
  char v3 = [v2 isPlaybackUIBeingShown];

  objc_super v4 = sLogObject_19;
  BOOL v5 = os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "After delay, playback is fullscreen.  Not posting event.", v8, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "After delay, playback is not fullscreen.  Posting event.", buf, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [WeakRetained stateMachine];
    [v7 postEvent:@"Playback UI no longer being shown"];
  }
}

- (void)_libraryContentsDidChange:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4FBA8A8];
  BOOL v5 = [(VUIRentalExpirationMonitor *)self stateMachine];
  [v4 cancelPreviousPerformRequestsWithTarget:v5 selector:sel_postEvent_ object:@"Library contents did change"];

  id v6 = [(VUIRentalExpirationMonitor *)self stateMachine];
  [v6 performSelector:sel_postEvent_ withObject:@"Library contents did change" afterDelay:1.0];
}

- (void)_expirationTimerDidFire:(id)a3
{
  [(VUIRentalExpirationMonitor *)self setEarliestExpirationTimer:0];
  id v4 = [(VUIRentalExpirationMonitor *)self stateMachine];
  [v4 postEvent:@"Rental expiration timer did fire"];
}

uint64_t __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2()
{
  os_log_t v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ([v0 applicationState])
  {
    uint64_t v1 = 0;
  }
  else
  {
    id v2 = +[VUIPlaybackManager sharedInstance];
    uint64_t v1 = [v2 isPlaybackUIBeingShown] ^ 1;
  }
  return v1;
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    char v3 = [WeakRetained stateMachine];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4;
    v7[3] = &unk_1E6DF41E8;
    id v4 = *(id *)(a1 + 40);
    v7[4] = WeakRetained;
    id v8 = v4;
    [v3 executeBlockAfterCurrentStateTransition:v7];

    BOOL v5 = @"Showing expiration UI";
  }
  else
  {
    BOOL v5 = @"Waiting for appropriate app state to handle expiration";
  }

  return v5;
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) dateOfLastRentalExpirationHandling];
  id v4 = (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v9, v3);

  id v5 = *(id *)(a1 + 32);
  [v5 setDateOfLastRentalExpirationHandling:v9];
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  [v9 timeIntervalSinceReferenceDate];
  CFPreferencesSetAppValue(@"LastRunValue", (CFPropertyListRef)objc_msgSend(v6, "numberWithDouble:"), @"com.apple.videos-preferences");
  CFPreferencesAppSynchronize(@"com.apple.videos-preferences");
  [v4 updateToLibraryCurrentRevision];
  [v4 enumeratePersistentIDsUsingBlock:&__block_literal_global_98];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"VUIRentalExpirationMonitorRentalDidExpireNotification" object:v5 userInfo:0];

  id v8 = [v5 stateMachine];

  [v8 postEvent:@"Expiration UI complete"];
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F31928];
  char v3 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a2];
  id v4 = objc_msgSend(v2, "vui_mediaItemForPersistentIdentifier:", v3);

  id v5 = [[VUIUniversalAssetController alloc] initWithMPMediaItem:v4];
  id v6 = (void *)sLogObject_19;
  if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [v4 title];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Removing download for rental [%@]", (uint8_t *)&v9, 0xCu);
  }
  [(VUIUniversalAssetController *)v5 cancelAndRemoveDownload];
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_110(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F79B50]);
  id v5 = [MEMORY[0x1E4F79AF8] autoupdatingSharedLibrary];
  id v6 = (void *)[v4 initWithPersistentID:a2 inLibrary:v5];

  if (v6)
  {
    id v7 = [v6 valueForProperty:*MEMORY[0x1E4F79800]];
    id v8 = v7;
    if (!v7) {
      goto LABEL_10;
    }
    [v7 doubleValue];
    if (v9 == 0.0) {
      goto LABEL_10;
    }
    id v10 = (void *)sLogObject_19;
    if (os_log_type_enabled((os_log_t)sLogObject_19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
      id v12 = v10;
      [v8 doubleValue];
      id v13 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      int v20 = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Found rental that will expire on %@", (uint8_t *)&v20, 0xCu);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void *)(v14 + 40);
    id v15 = (id *)(v14 + 40);
    if (v16)
    {
      [v8 doubleValue];
      double v18 = v17;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) doubleValue];
      if (v18 >= v19)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v15 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    objc_storeStrong(v15, v8);
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_2_115(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_3_116(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return @"Waiting for rental query to complete";
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_4_117(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return @"Waiting for rental query to complete";
}

__CFString *__59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_118(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  return @"Waiting for rental query to complete";
}

- (void)setStateMachine:(id)a3
{
}

- (void)setEarliestExpirationTimer:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_earliestExpirationTimer, 0);
  objc_storeStrong((id *)&self->_dateOfLastRentalExpirationHandling, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to check for expired rentals since dateOfLastRentalExpirationCheck or currentDate is nil", v1, 2u);
}

void __59__VUIRentalExpirationMonitor__registerStateMachineHandlers__block_invoke_5_109_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to determine earliest expiration date.  Not scheduling expiration timer", v1, 2u);
}

@end