@interface ATXModeClassifier
+ (id)updateModeWithUUID:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originAnchorType:(id)a7 originBundleId:(id)a8 uiLocation:(unint64_t)a9 confidenceScore:(double)a10 serializedTriggers:(id)a11 allowsSmartEntry:(BOOL)a12 shouldSuggestTriggers:(BOOL)a13 currentMode:(id)a14 stream:(id)a15;
+ (void)provideModeClassifierWhenReadyWithBlock:(id)a3;
+ (void)provideModeClassifierWhenReadyWithDuetHelper:(id)a3 block:(id)a4;
- (ATXModeClassifier)init;
- (BOOL)_isModeType:(int)a3 uuid:(id)a4 sameAsModeFromEvent:(id)a5;
- (BOOL)_shouldUpdateMode:(int)a3 currentModeScore:(id)a4 newModeOrigin:(int)a5 newModeScore:(id)a6;
- (BOOL)allowSmartEntryWithModeUUID:(id)a3;
- (id)currentMode;
- (void)_expireMode;
- (void)_setUpModeExpirationTimerIfNeededWithModeOrigin:(int)a3;
- (void)_updateWithGuardedData:(id)a3 newModeUUID:(id)a4 userModeName:(id)a5 modeType:(int)a6 modeOrigin:(int)a7 originBundleId:(id)a8 originAnchorType:(id)a9 uiLocation:(unint64_t)a10 confidenceScore:(double)a11 serializedTriggers:(id)a12 allowsSmartEntry:(BOOL)a13 shouldSuggestTriggers:(BOOL)a14;
- (void)_updateWithNewModeUUID:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originBundleId:(id)a7 originAnchorType:(id)a8 uiLocation:(unint64_t)a9 confidenceScore:(double)a10 serializedTriggers:(id)a11 allowsSmartEntry:(BOOL)a12 shouldSuggestTriggers:(BOOL)a13;
- (void)_updateWithNewModeUUIDIfNeeded:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originBundleId:(id)a7 originAnchorType:(id)a8 confidenceScore:(double)a9 serializedTriggers:(id)a10;
- (void)clientModel:(id)a3 didUpdatePredictionWithUUID:(id)a4 userModeName:(id)a5 modeType:(int)a6 confidenceScore:(double)a7 modeOrigin:(int)a8 originBundleId:(id)a9 originAnchorType:(id)a10 serializedTriggers:(id)a11;
- (void)init;
@end

@implementation ATXModeClassifier

+ (void)provideModeClassifierWhenReadyWithDuetHelper:(id)a3 block:(id)a4
{
  id v4 = a4;
  v5 = (void *)MEMORY[0x1E4F93B10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATXModeClassifier_provideModeClassifierWhenReadyWithDuetHelper_block___block_invoke;
  v7[3] = &unk_1E6BE6DC0;
  id v8 = v4;
  id v6 = v4;
  [v5 runBlockWhenDeviceIsClassCUnlocked:v7];
}

void __72__ATXModeClassifier_provideModeClassifierWhenReadyWithDuetHelper_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (void)provideModeClassifierWhenReadyWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F93B10];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__ATXModeClassifier_provideModeClassifierWhenReadyWithBlock___block_invoke;
  v6[3] = &unk_1E6BE6DC0;
  id v7 = v3;
  id v5 = v3;
  [v4 runBlockWhenDeviceIsClassCUnlocked:v6];
}

void __61__ATXModeClassifier_provideModeClassifierWhenReadyWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (ATXModeClassifier)init
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)ATXModeClassifier;
  id v3 = [(ATXModeClassifier *)&v46 init];
  if (v3)
  {
    if ([MEMORY[0x1E4F93B10] isClassCLocked])
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      [v39 handleFailureInMethod:a2 object:v3 file:@"ATXModeClassifier.m" lineNumber:71 description:@"ATXModeClassifier must not be initialized when the device is Class C locked"];
    }
    uint64_t v4 = objc_opt_new();
    modeService = v3->_modeService;
    v3->_modeService = (ATXConfiguredModeService *)v4;

    id v6 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E4F1E600]);
    locationManager = v3->_locationManager;
    v3->_locationManager = v6;

    id v8 = [[ATXModeHeuristicClassifier alloc] initWithConfiguredModeService:v3->_modeService locationManager:v3->_locationManager];
    heuristicModeClassifier = v3->_heuristicModeClassifier;
    v3->_heuristicModeClassifier = v8;

    [(ATXModeHeuristicClassifier *)v3->_heuristicModeClassifier setDelegate:v3];
    [(ATXModeHeuristicClassifier *)v3->_heuristicModeClassifier update];
    v10 = [[ATXModeAnchorModelSuggestionServer alloc] initWithConfiguredModeService:v3->_modeService];
    anchorModelSuggestionServer = v3->_anchorModelSuggestionServer;
    v3->_anchorModelSuggestionServer = v10;

    [(ATXModeAnchorModelSuggestionServer *)v3->_anchorModelSuggestionServer setDelegate:v3];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v16;

    v18 = BiomeLibrary();
    v19 = [v18 UserFocus];
    uint64_t v20 = [v19 InferredMode];
    inferredModeStream = v3->_inferredModeStream;
    v3->_inferredModeStream = (BMStream *)v20;

    v22 = [[ATXMicrolocationRecordingTrigger alloc] initWithInferredModeStream:v3->_inferredModeStream];
    microlocationRecordingTrigger = v3->_microlocationRecordingTrigger;
    v3->_microlocationRecordingTrigger = v22;

    objc_initWeak(&location, v3);
    id v24 = objc_alloc(MEMORY[0x1E4F93B98]);
    id v25 = MEMORY[0x1E4F14428];
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __25__ATXModeClassifier_init__block_invoke;
    v43 = &unk_1E6BE68A8;
    objc_copyWeak(&v44, &location);
    uint64_t v26 = [v24 initWithQueue:MEMORY[0x1E4F14428] operation:&v40];
    modeExpirationTimer = v3->_modeExpirationTimer;
    v3->_modeExpirationTimer = (_PASSimpleCoalescingTimer *)v26;

    v28 = (id *)objc_opt_new();
    v29 = [ATXUserFocusInferredMode alloc];
    v30 = -[ATXUserFocusInferredMode initWithStream:](v29, "initWithStream:", v3->_inferredModeStream, v40, v41, v42, v43);
    uint64_t v31 = [(ATXUserFocusInferredMode *)v30 currentMode];
    id v32 = v28[1];
    v28[1] = (id)v31;

    v33 = __atxlog_handle_modes();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [v28[1] modeIdentifier];
      *(_DWORD *)buf = 138412290;
      v48 = v34;
      _os_log_impl(&dword_1DAFF9000, v33, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier initing with current mode: %@", buf, 0xCu);
    }
    -[ATXModeClassifier _setUpModeExpirationTimerIfNeededWithModeOrigin:](v3, "_setUpModeExpirationTimerIfNeededWithModeOrigin:", [v28[1] origin]);
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F93B80]) initWithGuardedData:v28 serialQueue:v3->_queue];

    lock = v3->_lock;
    v3->_lock = (_PASQueueLock *)v35;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  v37 = __atxlog_handle_modes();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    -[ATXModeClassifier init](v37);
  }

  return v3;
}

void __25__ATXModeClassifier_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _expireMode];
}

- (id)currentMode
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__ATXModeClassifier_currentMode__block_invoke;
  v5[3] = &unk_1E6BE6DE8;
  v5[4] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __32__ATXModeClassifier_currentMode__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) modeIdentifier];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isModeType:(int)a3 uuid:(id)a4 sameAsModeFromEvent:(id)a5
{
  unint64_t v7 = (unint64_t)a4;
  id v8 = a5;
  uint64_t v9 = [v8 modeIdentifier];
  uint64_t v10 = v9;
  if (v7 && v9 && ([(id)v7 isEqualToString:v9] & 1) != 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    int v12 = [v8 modeType];
    if (v7 | v10) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v12 == a3;
    }
    BOOL v11 = v13;
  }

  return v11;
}

- (void)_updateWithGuardedData:(id)a3 newModeUUID:(id)a4 userModeName:(id)a5 modeType:(int)a6 modeOrigin:(int)a7 originBundleId:(id)a8 originAnchorType:(id)a9 uiLocation:(unint64_t)a10 confidenceScore:(double)a11 serializedTriggers:(id)a12 allowsSmartEntry:(BOOL)a13 shouldSuggestTriggers:(BOOL)a14
{
  uint64_t v16 = *(void *)&a7;
  uint64_t v17 = *(void *)&a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v21 = (id *)a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a8;
  id v25 = a9;
  id v26 = a12;
  if ([(ATXModeClassifier *)self _isModeType:v17 uuid:v22 sameAsModeFromEvent:v21[1]])
  {
    v27 = __atxlog_handle_modes();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      [v21[1] modeIdentifier];
      v29 = id v28 = v24;
      int v30 = [v21[1] modeType];
      *(_DWORD *)buf = 138544130;
      uint64_t v51 = (uint64_t)v22;
      __int16 v52 = 2048;
      uint64_t v53 = (int)v17;
      __int16 v54 = 2114;
      id v55 = v29;
      __int16 v56 = 2048;
      uint64_t v57 = v30;
      _os_log_impl(&dword_1DAFF9000, v27, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: not updating because new mode (%{public}@, %lu) is same as current mode (%{public}@, %lu)", buf, 0x2Au);

      id v24 = v28;
    }
  }
  else
  {
    id v31 = v25;
    uint64_t v32 = v16;
    id v49 = v24;
    uint64_t v33 = [v21[1] modeIdentifier];
    v34 = __atxlog_handle_modes();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = [v21[1] modeType];
      *(_DWORD *)buf = 138544386;
      uint64_t v51 = v33;
      __int16 v52 = 2048;
      uint64_t v53 = v35;
      __int16 v54 = 2114;
      id v55 = v22;
      __int16 v56 = 2048;
      uint64_t v57 = (int)v17;
      __int16 v58 = 2048;
      unint64_t v59 = a10;
      _os_log_impl(&dword_1DAFF9000, v34, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: mode updated from uuid:%{public}@, modeType:%lu to uuid:%{public}@, modeType:%lu, uiLocation of new suggestion: %lu", buf, 0x34u);
    }

    v36 = objc_opt_class();
    LOWORD(v47) = __PAIR16__(a14, a13);
    id v46 = v26;
    id v37 = v22;
    id v24 = v49;
    v48 = v33;
    id v38 = v22;
    id v39 = v26;
    uint64_t v40 = v32;
    uint64_t v41 = v32;
    id v25 = v31;
    v42 = objc_msgSend(v36, "updateModeWithUUID:userModeName:modeType:modeOrigin:originAnchorType:originBundleId:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:currentMode:stream:", v37, v23, v17, v41, v31, v49, a11, a10, v46, v47, v21[1], self->_inferredModeStream);
    id v43 = v21[1];
    v21[1] = v42;
    id v44 = v42;

    [(_PASSimpleCoalescingTimer *)self->_modeExpirationTimer cancelPendingOperations];
    uint64_t v45 = v40;
    id v26 = v39;
    id v22 = v38;
    v27 = v48;
    [(ATXModeClassifier *)self _setUpModeExpirationTimerIfNeededWithModeOrigin:v45];
  }
}

+ (id)updateModeWithUUID:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originAnchorType:(id)a7 originBundleId:(id)a8 uiLocation:(unint64_t)a9 confidenceScore:(double)a10 serializedTriggers:(id)a11 allowsSmartEntry:(BOOL)a12 shouldSuggestTriggers:(BOOL)a13 currentMode:(id)a14 stream:(id)a15
{
  id v50 = a3;
  id v19 = a4;
  id v20 = a7;
  id v53 = a8;
  id v52 = a11;
  id v54 = a15;
  if (a14)
  {
    v21 = (objc_class *)MEMORY[0x1E4F50180];
    id v22 = a14;
    id v46 = [v21 alloc];
    uint64_t v45 = objc_opt_new();
    id v23 = [v22 modeIdentifier];
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "isAutomationEnabled"));
    id v24 = v47 = v20;
    uint64_t v25 = [v22 uuid];
    id v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = &stru_1F352D818;
    }
    id v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "uiLocation"));
    v29 = [NSNumber numberWithDouble:a10];
    int v30 = [v22 modeType];
    id v31 = [v22 userModeName];

    LODWORD(v44) = v30;
    uint64_t v32 = objc_msgSend(v46, "initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:", v45, v23, 1, 0, v24, v27, 0, v28, v29, MEMORY[0x1E4F1CBF0], v44, MEMORY[0x1E4F1CC28], v31);

    id v20 = v47;
    uint64_t v33 = [v54 source];
    [v33 sendEvent:v32];
  }
  v34 = objc_opt_new();
  v48 = [v34 UUIDString];

  id v35 = objc_alloc(MEMORY[0x1E4F50180]);
  v36 = objc_opt_new();
  id v37 = [NSNumber numberWithBool:a12];
  id v38 = [NSNumber numberWithUnsignedInteger:a9];
  id v39 = [NSNumber numberWithDouble:a10];
  uint64_t v40 = [NSNumber numberWithBool:a13];
  LODWORD(v44) = a5;
  uint64_t v41 = (void *)[v35 initWithAbsoluteTimestamp:v36 modeIdentifier:v50 origin:a6 originBundleID:v53 isAutomationEnabled:v37 isStart:MEMORY[0x1E4F1CC38] uuid:v48 originAnchorType:v20 uiLocation:v38 confidenceScore:v39 serializedTriggers:v52 modeType:v44 shouldSuggestTriggers:v40 userModeName:v19];

  v42 = [v54 source];
  [v42 sendEvent:v41];

  return v41;
}

- (void)_updateWithNewModeUUID:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originBundleId:(id)a7 originAnchorType:(id)a8 uiLocation:(unint64_t)a9 confidenceScore:(double)a10 serializedTriggers:(id)a11 allowsSmartEntry:(BOOL)a12 shouldSuggestTriggers:(BOOL)a13
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a7;
  id v23 = a8;
  id v24 = a11;
  lock = self->_lock;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __194__ATXModeClassifier__updateWithNewModeUUID_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_uiLocation_confidenceScore_serializedTriggers_allowsSmartEntry_shouldSuggestTriggers___block_invoke;
  v31[3] = &unk_1E6BE6E10;
  v31[4] = self;
  id v32 = v20;
  int v39 = a5;
  int v40 = a6;
  id v33 = v21;
  id v34 = v22;
  id v36 = v24;
  unint64_t v37 = a9;
  double v38 = a10;
  id v35 = v23;
  BOOL v41 = a12;
  BOOL v42 = a13;
  id v26 = v24;
  id v27 = v23;
  id v28 = v22;
  id v29 = v21;
  id v30 = v20;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v31];
}

uint64_t __194__ATXModeClassifier__updateWithNewModeUUID_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_uiLocation_confidenceScore_serializedTriggers_allowsSmartEntry_shouldSuggestTriggers___block_invoke(uint64_t a1, uint64_t a2)
{
  LOWORD(v3) = *(_WORD *)(a1 + 104);
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithGuardedData:newModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned int *)(a1 + 96), *(unsigned int *)(a1 + 100), *(void *)(a1 + 56), *(double *)(a1 + 88), *(void *)(a1 + 64), *(void *)(a1 + 80), *(void *)(a1 + 72), v3);
}

- (void)_updateWithNewModeUUIDIfNeeded:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originBundleId:(id)a7 originAnchorType:(id)a8 confidenceScore:(double)a9 serializedTriggers:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  objc_initWeak(&location, self);
  lock = self->_lock;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke;
  v28[3] = &unk_1E6BE6E88;
  objc_copyWeak(v34, &location);
  int v35 = a5;
  id v22 = v17;
  id v29 = v22;
  int v36 = a6;
  id v23 = v19;
  id v30 = v23;
  id v24 = v20;
  id v31 = v24;
  v34[1] = *(id *)&a9;
  id v25 = v21;
  id v32 = v25;
  id v26 = v18;
  id v33 = v26;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v28];

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained _isModeType:*(unsigned int *)(a1 + 88) uuid:*(void *)(a1 + 32) sameAsModeFromEvent:v3[1]];
    unint64_t v7 = __atxlog_handle_modes();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = *(int *)(a1 + 88);
        BOOL v11 = [v3[1] modeIdentifier];
        int v12 = [v3[1] modeType];
        *(_DWORD *)buf = 138544130;
        id v30 = v9;
        __int16 v31 = 2048;
        uint64_t v32 = v10;
        __int16 v33 = 2114;
        id v34 = v11;
        __int16 v35 = 2048;
        uint64_t v36 = v12;
        _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: not updating because new mode (%{public}@, %lu) is same as current mode (%{public}@, %lu)", buf, 0x2Au);
      }
    }
    else
    {
      if (v8)
      {
        v14 = [v3[1] modeIdentifier];
        int v15 = [v3[1] modeType];
        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(int *)(a1 + 88);
        *(_DWORD *)buf = 138544130;
        id v30 = v14;
        __int16 v31 = 2048;
        uint64_t v32 = v15;
        __int16 v33 = 2114;
        id v34 = v16;
        __int16 v35 = 2048;
        uint64_t v36 = v17;
        _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: fetching combined score for current mode (uuid: %{public}@, type:%lu) and new mode (uuid: %{public}@, type:%lu) to see if we should update", buf, 0x2Au);
      }
      id v18 = (void *)v5[5];
      id v19 = v3[1];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_35;
      v20[3] = &unk_1E6BE6E60;
      v20[4] = v5;
      id v21 = *(id *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 88);
      id v22 = *(id *)(a1 + 40);
      id v23 = *(id *)(a1 + 48);
      uint64_t v27 = *(void *)(a1 + 80);
      id v24 = *(id *)(a1 + 56);
      id v25 = v3;
      id v26 = *(id *)(a1 + 64);
      [v18 fetchCombinedSuggestionScoreForModeEvent:v19 completionHandler:v20];
    }
  }
  else
  {
    BOOL v13 = __atxlog_handle_modes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_cold_1(v13);
    }
  }
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v3;
    _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: fetched score for current mode: %@. Fetching score and flags for new mode.", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v7 = *(unsigned int *)(a1 + 96);
  uint64_t v8 = *(unsigned int *)(a1 + 100);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  double v11 = *(double *)(a1 + 88);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_36;
  v16[3] = &unk_1E6BE6E38;
  uint64_t v12 = *(void *)(a1 + 64);
  id v17 = *(id *)(a1 + 72);
  id v18 = v3;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v19 = v13;
  uint64_t v20 = v14;
  int v26 = *(_DWORD *)(a1 + 100);
  id v21 = *(id *)(a1 + 80);
  int v27 = *(_DWORD *)(a1 + 96);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 88);
  id v24 = *(id *)(a1 + 64);
  id v15 = v3;
  [v6 fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:v5 modeType:v7 origin:v8 originBundleId:v9 originAnchorType:v10 confidenceScore:v12 secondsSinceSuggested:v11 serializedTriggers:0.0 completionHandler:v16];
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_36(uint64_t a1, void *a2, int a3, char a4, char a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = __atxlog_handle_modes();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [*(id *)(*(void *)(a1 + 32) + 8) modeIdentifier];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    id v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_1DAFF9000, v10, OS_LOG_TYPE_DEFAULT, "Comparing current mode: %{public}@ (combinedScore: %{public}@, with new mode: %{public}@ (combinedScore: %{public}@)", buf, 0x2Au);
  }
  if (!v9 || !*(void *)(a1 + 40))
  {
    uint64_t v14 = __atxlog_handle_modes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_36_cold_1(a1, (uint64_t)v9, v14);
    }
  }
  if (objc_msgSend(*(id *)(a1 + 56), "_shouldUpdateMode:currentModeScore:newModeOrigin:newModeScore:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "origin"), *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), v9))
  {
    uint64_t v15 = 3;
    if (!a3) {
      uint64_t v15 = 1;
    }
    BYTE1(v16) = a4;
    LOBYTE(v16) = a5;
    objc_msgSend(*(id *)(a1 + 56), "_updateWithNewModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:", *(void *)(a1 + 48), *(void *)(a1 + 64), *(unsigned int *)(a1 + 108), *(unsigned int *)(a1 + 104), *(void *)(a1 + 72), *(void *)(a1 + 80), *(double *)(a1 + 96), v15, *(void *)(a1 + 88), v16);
  }
}

- (BOOL)allowSmartEntryWithModeUUID:(id)a3
{
  id v3 = [(ATXConfiguredModeService *)self->_modeService DNDModeConfigurationForActivityWithUUID:a3];
  BOOL v4 = [v3 allowSmartEntry] == 2;

  return v4;
}

- (BOOL)_shouldUpdateMode:(int)a3 currentModeScore:(id)a4 newModeOrigin:(int)a5 newModeScore:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (BMUserFocusInferredModeOriginIsHeuristic(a3)
    && (BMUserFocusInferredModeOriginIsHeuristic(a5) & 1) != 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    [v10 doubleValue];
    double v13 = v12;
    [v9 doubleValue];
    BOOL v11 = v13 >= v14;
  }

  return v11;
}

- (void)_setUpModeExpirationTimerIfNeededWithModeOrigin:(int)a3
{
  if (a3 == 11) {
    [(_PASSimpleCoalescingTimer *)self->_modeExpirationTimer runAfterDelaySeconds:1 coalescingBehavior:7200.0];
  }
}

- (void)_expireMode
{
  uint64_t v14 = 0;
  unsigned __int8 v13 = 0;
  heuristicModeClassifier = self->_heuristicModeClassifier;
  id v11 = 0;
  id v12 = 0;
  id v9 = 0;
  id v10 = 0;
  [(ATXModeHeuristicClassifier *)heuristicModeClassifier currentModeUUID:&v12 userModeName:&v11 modeType:(char *)&v14 + 4 confidenceScore:0 origin:&v14 originBundleId:&v10 serializedTrigger:&v9 allowsSmartEntry:&v13];
  id v4 = v12;
  id v5 = v11;
  id v6 = v10;
  id v7 = v9;
  LOWORD(v8) = v13;
  -[ATXModeClassifier _updateWithNewModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:](self, "_updateWithNewModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:", v4, v5, HIDWORD(v14), v14, v6, 0, -1.0, 1, v7, v8);
}

- (void)clientModel:(id)a3 didUpdatePredictionWithUUID:(id)a4 userModeName:(id)a5 modeType:(int)a6 confidenceScore:(double)a7 modeOrigin:(int)a8 originBundleId:(id)a9 originAnchorType:(id)a10 serializedTriggers:(id)a11
{
  uint64_t v13 = *(void *)&a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a5;
  __int16 v23 = __atxlog_handle_modes();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543874;
    uint64_t v28 = v25;
    __int16 v29 = 2114;
    id v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = (int)v13;
    _os_log_impl(&dword_1DAFF9000, v23, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: %{public}@ updated its mode prediction: modeUUID: %{public}@, modeType: %lu", buf, 0x20u);
  }
  [(ATXModeClassifier *)self _updateWithNewModeUUIDIfNeeded:v18 userModeName:v22 modeType:v13 modeOrigin:a8 originBundleId:v21 originAnchorType:v20 confidenceScore:a7 serializedTriggers:v19];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_modeExpirationTimer, 0);
  objc_storeStrong((id *)&self->_microlocationRecordingTrigger, 0);
  objc_storeStrong((id *)&self->_heuristicModeClassifier, 0);
  objc_storeStrong((id *)&self->_anchorModelSuggestionServer, 0);
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_DEBUG, "ATXModeClassifier finished initialization", v1, 2u);
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXModeClassifier: couldn't perform update operation because swelf is nil", v1, 2u);
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_36_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXModeClassifer: something went wrong fetching widget scores! currentModeScore: %@, newModeScore: %@", (uint8_t *)&v4, 0x16u);
}

@end