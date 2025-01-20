@interface ATXModeAnchorModelSuggestionServer
- (ATXModeAnchorModelSuggestionServer)initWithConfiguredModeService:(id)a3;
- (ATXModeAnchorModelSuggestionServer)initWithXPCListener:(id)a3 configuredModeService:(id)a4;
- (ATXModeClassifierClientModelDelegate)delegate;
- (BOOL)_shouldUpdateHighestConfidenceSuggestion:(id)a3 newSuggestion:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)anchorModelDidProvideModeSuggestions:(id)a3;
- (void)dealloc;
- (void)fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11;
- (void)fetchCombinedSuggestionScoreForModeEvent:(id)a3 completionHandler:(id)a4;
- (void)fetchCombinedSuggestionScoreForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11;
- (void)pingWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ATXModeAnchorModelSuggestionServer

- (ATXModeAnchorModelSuggestionServer)initWithConfiguredModeService:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29290];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithMachServiceName:@"com.apple.proactive.ModeAnchorModelSuggestion.xpc"];
  v7 = [(ATXModeAnchorModelSuggestionServer *)self initWithXPCListener:v6 configuredModeService:v5];

  return v7;
}

- (ATXModeAnchorModelSuggestionServer)initWithXPCListener:(id)a3 configuredModeService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXModeAnchorModelSuggestionServer;
  v9 = [(ATXModeAnchorModelSuggestionServer *)&v15 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    objc_storeStrong((id *)&v9->_modeService, a4);
    objc_storeStrong((id *)&v9->_xpcListener, a3);
    [(NSXPCListener *)v9->_xpcListener setDelegate:v9];
    [(NSXPCListener *)v9->_xpcListener resume];
  }

  return v9;
}

- (void)dealloc
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global];
  v3.receiver = self;
  v3.super_class = (Class)ATXModeAnchorModelSuggestionServer;
  [(ATXModeAnchorModelSuggestionServer *)&v3 dealloc];
}

void __45__ATXModeAnchorModelSuggestionServer_dealloc__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)a2[1];
  v4 = a2;
  [v3 invalidate];
  id v5 = (id)a2[1];
  a2[1] = 0;
}

- (void)fetchCombinedSuggestionScoreForModeEvent:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v20 = [v7 modeIdentifier];
  uint64_t v8 = [v7 modeType];
  uint64_t v9 = [v7 origin];
  id v10 = [v7 originBundleID];
  v11 = [v7 originAnchorType];
  [v7 confidenceScore];
  double v13 = v12;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v15 = v14;
  v16 = [v7 absoluteTimestamp];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v15 - v17;
  v19 = [v7 serializedTriggers];

  [(ATXModeAnchorModelSuggestionServer *)self fetchCombinedSuggestionScoreForModeWithUUID:v20 modeType:v8 origin:v9 originBundleId:v10 originAnchorType:v11 confidenceScore:v19 secondsSinceSuggested:v13 serializedTriggers:v18 completionHandler:v6];
}

- (void)fetchCombinedSuggestionScoreForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  lock = self->_lock;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke;
  v30[3] = &unk_1E6BE6860;
  id v34 = v22;
  id v35 = v23;
  int v38 = a4;
  int v39 = a5;
  id v31 = v19;
  id v32 = v20;
  double v36 = a8;
  double v37 = a9;
  id v33 = v21;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v23;
  [(_PASLock *)lock runWithLockAcquired:v30];
}

void __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = *(void **)(a2 + 8);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2;
  uint64_t v8 = &unk_1E6BE6838;
  id v9 = *(id *)(a1 + 64);
  v4 = [v3 remoteObjectProxyWithErrorHandler:&v5];
  objc_msgSend(v4, "fetchCombinedSuggestionScoreForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(void *)(a1 + 64), v5, v6, v7, v8);
}

void __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  lock = self->_lock;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke;
  v30[3] = &unk_1E6BE6860;
  id v34 = v22;
  id v35 = v23;
  int v38 = a4;
  int v39 = a5;
  id v31 = v19;
  id v32 = v20;
  double v36 = a8;
  double v37 = a9;
  id v33 = v21;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v23;
  [(_PASLock *)lock runWithLockAcquired:v30];
}

void __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a2 + 8);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2;
  uint64_t v8 = &unk_1E6BE6838;
  id v9 = *(id *)(a1 + 64);
  v4 = [v3 remoteObjectProxyWithErrorHandler:&v5];
  objc_msgSend(v4, "fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(void *)(a1 + 64), v5, v6, v7, v8);
}

void __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pingWithCompletion:(id)a3
{
}

- (void)anchorModelDidProvideModeSuggestions:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v54 = [v4 count];
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Received %{public}lu suggestions", buf, 0xCu);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (!v7)
  {
    v42 = 0;
    v41 = 0;
    id v32 = v6;
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  v44 = 0;
  uint64_t v43 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v50;
  do
  {
    uint64_t v11 = 0;
    uint64_t v45 = v8;
    do
    {
      if (*(void *)v50 != v10) {
        objc_enumerationMutation(v6);
      }
      double v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
      uint64_t v46 = MEMORY[0x1E0187360]();
      double v13 = __atxlog_handle_modes();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = [v12 modeUUID];
        uint64_t v15 = v10;
        v16 = v9;
        double v17 = self;
        id v18 = v6;
        id v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isStart"));
        id v20 = [v12 anchorType];
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = (uint64_t)v14;
        __int16 v55 = 2114;
        v56 = v19;
        __int16 v57 = 2114;
        v58 = v20;
        _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Suggestion modeId: %{public}@, isStart: %{public}@, anchorType: %{public}@", buf, 0x20u);

        id v6 = v18;
        self = v17;
        id v9 = v16;
        uint64_t v10 = v15;
        uint64_t v8 = v45;
      }
      uint64_t v48 = 0;
      modeService = self->_modeService;
      id v22 = [v12 modeUUID];
      id v47 = 0;
      LOBYTE(modeService) = [(ATXConfiguredModeService *)modeService isActivityWithUUIDConfigured:v22 activityType:&v48 allowsSmartEntry:0 userModeName:&v47];
      id v23 = v47;

      if ((modeService & 1) == 0)
      {
        id v25 = __atxlog_handle_modes();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v12 modeUUID];
          *(_DWORD *)buf = 138543362;
          uint64_t v54 = (uint64_t)v26;
          _os_log_impl(&dword_1DAFF9000, v25, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Suggestion modeUUID: %{public}@ is not configured, skipping", buf, 0xCu);
        }
        goto LABEL_15;
      }
      if ([(ATXModeAnchorModelSuggestionServer *)self _shouldUpdateHighestConfidenceSuggestion:v9 newSuggestion:v12])
      {
        id v24 = v12;

        uint64_t v43 = v48;
        id v25 = v44;
        v44 = v23;
        id v9 = v24;
LABEL_15:
        id v27 = (void *)v46;

        goto LABEL_17;
      }
      id v27 = (void *)v46;
LABEL_17:

      ++v11;
    }
    while (v8 != v11);
    uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v59 count:16];
  }
  while (v8);

  if (v9)
  {
    id v28 = __atxlog_handle_modes();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v9 modeUUID];
      v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isStart"));
      id v31 = [v9 anchorType];
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = (uint64_t)v29;
      __int16 v55 = 2114;
      v56 = v30;
      __int16 v57 = 2114;
      v58 = v31;
      _os_log_impl(&dword_1DAFF9000, v28, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Updated suggestion to modeUUID: %{public}@, isStart: %{public}@, anchorType: %{public}@", buf, 0x20u);
    }
    id v32 = [v9 modeUUID];
    uint64_t v33 = ATXActivityTypeToBMUserFocusInferredModeType(v43);
    if (([v9 isStart] & 1) == 0)
    {

      id v32 = 0;
      uint64_t v33 = 2;
    }
    id v34 = [(ATXModeAnchorModelSuggestionServer *)self delegate];
    [v9 score];
    double v36 = v35;
    double v37 = [v9 anchorType];
    [v9 serializedTriggers];
    v39 = int v38 = v9;
    v40 = self;
    v41 = v44;
    [v34 clientModel:v40 didUpdatePredictionWithUUID:v32 userModeName:v44 modeType:v33 confidenceScore:11 modeOrigin:0 originBundleId:v36 originAnchorType:v37 serializedTriggers:v39];

    v42 = v38;
LABEL_26:
  }
  else
  {
    v42 = 0;
    v41 = v44;
  }
}

- (BOOL)_shouldUpdateHighestConfidenceSuggestion:(id)a3 newSuggestion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v10 = 1;
  if (v5)
  {
    [v5 score];
    double v8 = v7;
    [v6 score];
    if (v8 >= v9
      && (vabdd_f64(v8, v9) >= 2.22044605e-16
       || ([v5 isStart] & 1) != 0
       || ([v6 isStart] & 1) == 0))
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 valueForEntitlement:@"com.apple.proactive.ModeAnchorModelSuggestion.xpc"];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && ([v8 BOOLValue] & 1) != 0)
  {
    double v9 = ATXModeAnchorModelSuggestionServerXPCInterface();
    [v7 setExportedInterface:v9];

    [v7 setExportedObject:self];
    [v7 setInterruptionHandler:&__block_literal_global_17];
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_18;
    v19[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v20, &location);
    [v7 setInvalidationHandler:v19];
    BOOL v10 = ATXModeAnchorModelSuggestionClientXPCInterface();
    [v7 setRemoteObjectInterface:v10];

    lock = self->_lock;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v17[3] = &unk_1E6BE68D0;
    id v12 = v7;
    id v18 = v12;
    [(_PASLock *)lock runWithLockAcquired:v17];
    [v12 resume];
    double v13 = __atxlog_handle_modes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v12;
      _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: accepts XPC connection: %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v15 = __atxlog_handle_modes();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXModeAnchorModelSuggestionServer listener:shouldAcceptNewConnection:]((uint64_t)v7, @"com.apple.proactive.ModeAnchorModelSuggestion.xpc", v15);
    }

    BOOL v14 = 0;
  }

  return v14;
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);
  }
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_18(uint64_t a1)
{
  v2 = __atxlog_handle_modes();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1DAFF9000, v2, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: XPC connection invalidated.", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[2] runWithLockAcquired:&__block_literal_global_21];
  }
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_19(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 8);
  *(void *)(a2 + 8) = 0;
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (ATXModeClassifierClientModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeClassifierClientModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_ERROR, "%s: error with xpc connection: %@", (uint8_t *)v1, 0x16u);
}

void __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_ERROR, "%s: error with xpc connection: %@", (uint8_t *)v1, 0x16u);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXModeAnchorModelSuggestionServer: Rejecting connection %{public}@ without entitlement %{public}@", (uint8_t *)&v3, 0x16u);
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXModeAnchorModelSuggestionServer: XPC connection interrupted.", v1, 2u);
}

@end