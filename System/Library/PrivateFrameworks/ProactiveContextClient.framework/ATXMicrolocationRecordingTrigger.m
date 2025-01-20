@interface ATXMicrolocationRecordingTrigger
- (ATXMicrolocationRecordingTrigger)initWithInferredModeStream:(id)a3;
- (BOOL)_isInferredModeEventEligibleForHistoricalLabelDonations:(id)a3;
- (BOOL)_isInferredModeEventEligibleForMicrolocationRecording:(id)a3;
- (BOOL)_isUserFocusComputedModeEventEligibleForHistoricalLabelDonations:(id)a3;
- (BOOL)_isUserFocusComputedModeEventEligibleForMicrolocationRecording:(id)a3;
- (id)_schedulerForStreamName:(id)a3;
- (id)_triggerMicroLocationRecordingScan;
- (id)_truthLabelForMode:(int)a3;
- (void)_donateTruthLabelForTriggerUUID:(id)a3 truthLabel:(id)a4;
- (void)_subscribeToModeChanges;
- (void)_subscribeToStreamWithPublisher:(id)a3 scheduler:(id)a4 sink:(id)a5;
- (void)_triggerHistoricalLabelDonationAtModeEndWithStoreEvent:(id)a3;
- (void)_triggerMicroLocationHistoricalLabelDonationWithStartDate:(id)a3 endDate:(id)a4;
- (void)_triggerMicroLocationRecordingScan;
- (void)_triggerMicrolocationRecordingAtModeStartWithStoreEvent:(id)a3;
- (void)_userDidEnterModeOrModeWasPredicted;
- (void)_userDidExitModeOrModeWasNoLongerPredicted;
- (void)dealloc;
@end

@implementation ATXMicrolocationRecordingTrigger

- (ATXMicrolocationRecordingTrigger)initWithInferredModeStream:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ATXMicrolocationRecordingTrigger;
  v6 = [(ATXMicrolocationRecordingTrigger *)&v26 init];
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.proactive.ProactiveContextClient.ATXMicrolocationRecordingTrigger.queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F93B98]);
    v11 = v6->_queue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke;
    v23[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v24, &location);
    uint64_t v12 = [v10 initWithQueue:v11 operation:v23];
    coalescingTimerForRecordingScans = v6->_coalescingTimerForRecordingScans;
    v6->_coalescingTimerForRecordingScans = (_PASSimpleCoalescingTimer *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F93B98]);
    v15 = v6->_queue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke_2;
    v21[3] = &unk_1E6BE68A8;
    objc_copyWeak(&v22, &location);
    uint64_t v16 = [v14 initWithQueue:v15 operation:v21];
    coalescingTimerForHistoricalLabelDonations = v6->_coalescingTimerForHistoricalLabelDonations;
    v6->_coalescingTimerForHistoricalLabelDonations = (_PASSimpleCoalescingTimer *)v16;

    objc_storeStrong((id *)&v6->_inferredModeStream, a3);
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.DuetExpertCenter.AppPredictionExpert"];
    [v18 doubleForKey:@"ATXMicrolocationRecordingTriggerTimeBufferKey"];
    if (v19 <= 0.0) {
      double v19 = 300.0;
    }
    v6->_timeBuffer = v19;
    [(ATXMicrolocationRecordingTrigger *)v6 _subscribeToModeChanges];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _userDidEnterModeOrModeWasPredicted];
}

void __63__ATXMicrolocationRecordingTrigger_initWithInferredModeStream___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _userDidExitModeOrModeWasNoLongerPredicted];
}

- (void)_subscribeToModeChanges
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = BiomeLibrary();
  id v5 = [v4 UserFocus];
  v6 = [v5 ComputedMode];
  userFocusComputedModeStream = self->_userFocusComputedModeStream;
  self->_userFocusComputedModeStream = v6;

  dispatch_queue_t v8 = __atxlog_handle_modes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = NSStringFromSelector(a2);
    uint64_t v12 = [(BMStream *)self->_inferredModeStream identifier];
    v13 = [(BMStream *)self->_userFocusComputedModeStream identifier];
    int v22 = 138413058;
    v23 = v9;
    __int16 v24 = 2112;
    v25 = v11;
    __int16 v26 = 2112;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1DAFF9000, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@] subscribing to %@ and %@ streams", (uint8_t *)&v22, 0x2Au);
  }
  id v14 = [(BMStream *)self->_inferredModeStream identifier];
  v15 = [(ATXMicrolocationRecordingTrigger *)self _schedulerForStreamName:v14];
  inferredModeScheduler = self->_inferredModeScheduler;
  self->_inferredModeScheduler = v15;

  v17 = [(BMStream *)self->_userFocusComputedModeStream identifier];
  v18 = [(ATXMicrolocationRecordingTrigger *)self _schedulerForStreamName:v17];
  userComputedModeScheduler = self->_userComputedModeScheduler;
  self->_userComputedModeScheduler = v18;

  v20 = [(BMStream *)self->_inferredModeStream DSLPublisher];
  [(ATXMicrolocationRecordingTrigger *)self _subscribeToStreamWithPublisher:v20 scheduler:self->_inferredModeScheduler sink:self->_inferredModeStreamSink];

  v21 = [(BMStream *)self->_userFocusComputedModeStream DSLPublisher];
  [(ATXMicrolocationRecordingTrigger *)self _subscribeToStreamWithPublisher:v21 scheduler:self->_userComputedModeScheduler sink:self->_userComputedModeStreamSink];
}

- (void)dealloc
{
  [(BPSSink *)self->_inferredModeStreamSink cancel];
  [(BPSSink *)self->_userComputedModeStreamSink cancel];
  v3.receiver = self;
  v3.super_class = (Class)ATXMicrolocationRecordingTrigger;
  [(ATXMicrolocationRecordingTrigger *)&v3 dealloc];
}

- (void)_subscribeToStreamWithPublisher:(id)a3 scheduler:(id)a4 sink:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    uint64_t v12 = __atxlog_handle_modes();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = objc_opt_class();
        id v15 = v14;
        uint64_t v16 = NSStringFromSelector(a2);
        v17 = [v9 rootStreamIdentifiers];
        *(_DWORD *)buf = 138412802;
        __int16 v26 = v14;
        __int16 v27 = 2112;
        __int16 v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = v17;
        _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@] listening to stream %@ for mode start events", buf, 0x20u);
      }
      objc_initWeak((id *)buf, self);
      v18 = [v9 subscribeOn:v10];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke;
      v23[3] = &unk_1E6BE6960;
      objc_copyWeak(v24, (id *)buf);
      v24[1] = (id)a2;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_16;
      v20[3] = &unk_1E6BE6C48;
      objc_copyWeak(v22, (id *)buf);
      v22[1] = (id)a2;
      id v21 = v9;
      id v11 = [v18 sinkWithCompletion:v23 receiveInput:v20];

      if (!v11)
      {
        double v19 = __atxlog_handle_modes();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[ATXMicrolocationRecordingTrigger _subscribeToStreamWithPublisher:scheduler:sink:](v19);
        }
      }
      objc_destroyWeak(v22);
      objc_destroyWeak(v24);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ATXMicrolocationRecordingTrigger _subscribeToStreamWithPublisher:scheduler:sink:]((uint64_t)self, a2, v13);
      }

      id v11 = 0;
    }
  }
}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 state];
  v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = objc_opt_class();
    dispatch_queue_t v8 = *(const char **)(a1 + 40);
    id v9 = v7;
    id v10 = NSStringFromSelector(v8);
    int v11 = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] successfully completed listening to mode events", (uint8_t *)&v11, 0x16u);
  }
}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = __atxlog_handle_modes();
  v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      dispatch_queue_t v8 = *(const char **)(a1 + 48);
      id v9 = v7;
      id v10 = NSStringFromSelector(v8);
      int v11 = [*(id *)(a1 + 32) rootStreamIdentifiers];
      int v12 = 138412802;
      __int16 v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] mode event received from %@", (uint8_t *)&v12, 0x20u);
    }
    [WeakRetained _triggerMicrolocationRecordingAtModeStartWithStoreEvent:v3];
    [WeakRetained _triggerHistoricalLabelDonationAtModeEndWithStoreEvent:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_16_cold_1(a1);
    }
  }
}

- (void)_triggerMicrolocationRecordingAtModeStartWithStoreEvent:(id)a3
{
  id v11 = a3;
  v4 = [v11 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = [v11 eventBody];
  if (isKindOfClass)
  {
    BOOL v7 = [(ATXMicrolocationRecordingTrigger *)self _isUserFocusComputedModeEventEligibleForMicrolocationRecording:v6];

    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    [(_PASSimpleCoalescingTimer *)self->_coalescingTimerForRecordingScans runAfterDelaySeconds:1 coalescingBehavior:self->_timeBuffer];
    goto LABEL_7;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0) {
    goto LABEL_6;
  }
  id v9 = [v11 eventBody];
  BOOL v10 = [(ATXMicrolocationRecordingTrigger *)self _isInferredModeEventEligibleForMicrolocationRecording:v9];

  if (v10) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_triggerHistoricalLabelDonationAtModeEndWithStoreEvent:(id)a3
{
  id v11 = a3;
  v4 = [v11 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = [v11 eventBody];
  if (isKindOfClass)
  {
    BOOL v7 = [(ATXMicrolocationRecordingTrigger *)self _isUserFocusComputedModeEventEligibleForHistoricalLabelDonations:v6];

    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    [(_PASSimpleCoalescingTimer *)self->_coalescingTimerForHistoricalLabelDonations runAfterDelaySeconds:1 coalescingBehavior:5.0];
    goto LABEL_7;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0) {
    goto LABEL_6;
  }
  id v9 = [v11 eventBody];
  BOOL v10 = [(ATXMicrolocationRecordingTrigger *)self _isInferredModeEventEligibleForHistoricalLabelDonations:v9];

  if (v10) {
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)_isUserFocusComputedModeEventEligibleForMicrolocationRecording:(id)a3
{
  id v3 = a3;
  if ([v3 starting]) {
    BOOL v4 = [v3 semanticType] == 6;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_isUserFocusComputedModeEventEligibleForHistoricalLabelDonations:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 starting] & 1) == 0 && objc_msgSend(v3, "semanticType") == 6;

  return v4;
}

- (BOOL)_isInferredModeEventEligibleForMicrolocationRecording:(id)a3
{
  id v3 = a3;
  if ([v3 isStart]) {
    BOOL v4 = [v3 modeType] == 4;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_isInferredModeEventEligibleForHistoricalLabelDonations:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isStart] & 1) == 0 && objc_msgSend(v3, "modeType") == 4;

  return v4;
}

- (id)_schedulerForStreamName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = NSString;
  v6 = (void *)MEMORY[0x1E4F28F80];
  id v7 = a3;
  char v8 = [v6 processInfo];
  id v9 = [v8 processName];
  BOOL v10 = [v5 stringWithFormat:@"ATXMicrolocationRecordingTrigger.Modes.%@.%@", v9, v7];

  id v11 = __atxlog_handle_modes();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = objc_opt_class();
    id v13 = v12;
    __int16 v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    __int16 v26 = v14;
    __int16 v27 = 2112;
    __int16 v28 = v10;
    _os_log_impl(&dword_1DAFF9000, v11, OS_LOG_TYPE_INFO, "[%@][%@] scheduler identifier: %@", buf, 0x20u);
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:v10 targetQueue:self->_queue];
  __int16 v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    uint64_t v18 = __atxlog_handle_modes();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      id v21 = v20;
      int v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v24 = v20;
      __int16 v25 = 2112;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      __int16 v28 = v10;
      _os_log_error_impl(&dword_1DAFF9000, v18, OS_LOG_TYPE_ERROR, "[%@][%@] unable to initialize Biome Scheduler: %@", buf, 0x20u);
    }
  }

  return v16;
}

- (void)_userDidEnterModeOrModeWasPredicted
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = NSStringFromSelector(a2);
    int v38 = 138412546;
    v39 = v5;
    __int16 v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_INFO, "[%@][%@] Starting Microlocation recording scan", (uint8_t *)&v38, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v8 = self->_timeBuffer + 1.0;
  id v9 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v10 = [[ATXUserFocusComputedMode alloc] initWithStream:self->_userFocusComputedModeStream];
  id v11 = [(ATXUserFocusComputedMode *)v10 currentModeEvent];

  int v12 = [v11 eventBody];
  if ([(ATXMicrolocationRecordingTrigger *)self _isUserFocusComputedModeEventEligibleForMicrolocationRecording:v12])
  {
    [v9 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v11 timestamp];
    double v16 = v14 - v15;

    if (v16 < v8)
    {
      id v17 = NSNumber;
      uint64_t v18 = [v11 eventBody];
      uint64_t v19 = BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType([v18 semanticType]);
LABEL_10:
      __int16 v26 = [v17 numberWithInt:v19];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v20 = [[ATXUserFocusInferredMode alloc] initWithStream:self->_inferredModeStream];
  uint64_t v18 = [(ATXUserFocusInferredMode *)v20 currentMode];

  if ([(ATXMicrolocationRecordingTrigger *)self _isInferredModeEventEligibleForMicrolocationRecording:v18])
  {
    [v9 timeIntervalSinceReferenceDate];
    double v22 = v21;
    v23 = [v18 absoluteTimestamp];
    [v23 timeIntervalSinceReferenceDate];
    double v25 = v22 - v24;

    if (v25 < v8)
    {
      id v17 = NSNumber;
      uint64_t v19 = [v18 modeType];
      goto LABEL_10;
    }
  }
  __int16 v26 = 0;
LABEL_12:

  if (v26)
  {
    uint64_t v27 = [v26 integerValue];
    __int16 v28 = __atxlog_handle_modes();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      id v30 = v29;
      uint64_t v31 = NSStringFromSelector(a2);
      v32 = BMUserFocusInferredModeTypeAsString();
      int v38 = 138412802;
      v39 = v29;
      __int16 v40 = 2112;
      v41 = v31;
      __int16 v42 = 2114;
      double v43 = *(double *)&v32;
      _os_log_impl(&dword_1DAFF9000, v28, OS_LOG_TYPE_DEFAULT, "[%@][%@] user entered mode: %{public}@", (uint8_t *)&v38, 0x20u);
    }
    v33 = [(ATXMicrolocationRecordingTrigger *)self _triggerMicroLocationRecordingScan];
    if (v33)
    {
      v34 = [(ATXMicrolocationRecordingTrigger *)self _truthLabelForMode:v27];
      [(ATXMicrolocationRecordingTrigger *)self _donateTruthLabelForTriggerUUID:v33 truthLabel:v34];
    }
  }
  else
  {
    v33 = __atxlog_handle_modes();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_opt_class();
      id v36 = v35;
      v37 = NSStringFromSelector(a2);
      int v38 = 138412802;
      v39 = v35;
      __int16 v40 = 2112;
      v41 = v37;
      __int16 v42 = 2048;
      double v43 = v8;
      _os_log_error_impl(&dword_1DAFF9000, v33, OS_LOG_TYPE_ERROR, "[%@][%@] Unable to find an inferred mode event or user focus computed mode event in the past %f seconds", (uint8_t *)&v38, 0x20u);
    }
  }
}

- (void)_userDidExitModeOrModeWasNoLongerPredicted
{
  id v3 = (id)objc_opt_class();
  BOOL v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DAFF9000, v5, v6, "[%@][%@] Error: Expected to see at least two events in either the inferred mode stream or the user computed stream", v7, v8, v9, v10, 2u);
}

- (void)_triggerMicroLocationHistoricalLabelDonationWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = __atxlog_handle_modes();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    int v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    double v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@] Labeling scans between startDate: %@ and endDate: %@ with work label", buf, 0x2Au);
  }
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C9FC4298-DE04-494A-9791-71AB71B52E27"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke;
  v14[3] = &unk_1E6BE6C70;
  v14[4] = self;
  v14[5] = a2;
  [MEMORY[0x1E4F77EF0] donateMicroLocationTruthTagWithTagUUID:v13 forRecordingEventsBetweenDate:v7 andDate:v8 handler:v14];
}

void __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = __atxlog_handle_modes();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = *(const char **)(a1 + 40);
    id v8 = v6;
    uint64_t v9 = NSStringFromSelector(v7);
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    double v13 = v9;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] Successfully donated historical labels", (uint8_t *)&v10, 0x16u);
  }
}

- (id)_triggerMicroLocationRecordingScan
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke;
  v12[3] = &unk_1E6BE6C98;
  v12[4] = self;
  v12[5] = a2;
  BOOL v4 = [MEMORY[0x1E4F77EF0] getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:0 shouldForceRecording:0 handler:v12];
  uint64_t v5 = __atxlog_handle_modes();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      double v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Generated triggerId: %@", buf, 0x20u);
    }
    id v10 = v4;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ATXMicrolocationRecordingTrigger *)(uint64_t)self _triggerMicroLocationRecordingScan];
    }
  }

  return v4;
}

void __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    id v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = *(const char **)(a1 + 40);
      id v10 = v8;
      id v11 = NSStringFromSelector(v9);
      int v12 = 138412546;
      double v13 = v8;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_impl(&dword_1DAFF9000, v7, OS_LOG_TYPE_DEFAULT, "[%@][%@]  Successfully requested MiLo recording scan", (uint8_t *)&v12, 0x16u);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v5)
  {
    id v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke_cold_1();
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_donateTruthLabelForTriggerUUID:(id)a3 truthLabel:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = __atxlog_handle_modes();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    int v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    __int16 v21 = v10;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@] Donating truth label: %@ for triggerId: %@", buf, 0x2Au);
  }
  double v13 = (void *)MEMORY[0x1E4F77EF0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke;
  v16[3] = &unk_1E6BE6CC0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  SEL v19 = a2;
  id v14 = v7;
  id v15 = v8;
  [v13 donateMicroLocationTruthTagWithTagUUID:v15 correspondingToTriggerUUID:v14 handler:v16];
}

void __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = (const char *)a1[7];
    id v8 = v6;
    uint64_t v9 = NSStringFromSelector(v7);
    uint64_t v10 = a1[5];
    uint64_t v11 = a1[6];
    int v12 = 138413058;
    double v13 = v6;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] Successfully donated MiLo label %@ for triggerId: %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (id)_truthLabelForMode:(int)a3
{
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C9FC4298-DE04-494A-9791-71AB71B52E27"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"75BF0CD2-AB18-4E42-AD01-3D5CAADFDFF1"];
  uint64_t v6 = v5;
  if (a3 == 4) {
    id v5 = v4;
  }
  id v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userComputedModeStreamSink, 0);
  objc_storeStrong((id *)&self->_userComputedModeScheduler, 0);
  objc_storeStrong((id *)&self->_userFocusComputedModeStream, 0);
  objc_storeStrong((id *)&self->_inferredModeStreamSink, 0);
  objc_storeStrong((id *)&self->_inferredModeScheduler, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
  objc_storeStrong((id *)&self->_coalescingTimerForHistoricalLabelDonations, 0);
  objc_storeStrong((id *)&self->_coalescingTimerForRecordingScans, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_subscribeToStreamWithPublisher:(uint64_t)a1 scheduler:(const char *)a2 sink:(NSObject *)a3 .cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_class();
  id v6 = v5;
  id v7 = NSStringFromSelector(a2);
  int v8 = 138412546;
  uint64_t v9 = v5;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DAFF9000, a3, OS_LOG_TYPE_ERROR, "[%@][%@] Publisher was unexpectedly nil", (uint8_t *)&v8, 0x16u);
}

- (void)_subscribeToStreamWithPublisher:(os_log_t)log scheduler:sink:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXMicrolocationRecordingTrigger: sink is nil", v1, 2u);
}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_opt_class();
  BOOL v4 = *(const char **)(a1 + 40);
  id v5 = v3;
  id v6 = NSStringFromSelector(v4);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DAFF9000, v7, v8, "[%@][%@] Error encountered while listening to mode events", v9, v10, v11, v12, 2u);
}

void __83__ATXMicrolocationRecordingTrigger__subscribeToStreamWithPublisher_scheduler_sink___block_invoke_16_cold_1(uint64_t a1)
{
  v2 = objc_opt_class();
  id v3 = *(const char **)(a1 + 48);
  id v4 = v2;
  id v5 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DAFF9000, v6, v7, "[%@][%@] self is nil", v8, v9, v10, v11, 2u);
}

void __102__ATXMicrolocationRecordingTrigger__triggerMicroLocationHistoricalLabelDonationWithStartDate_endDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  v2 = objc_opt_class();
  id v3 = *(const char **)(v0 + 40);
  id v4 = v2;
  id v5 = NSStringFromSelector(v3);
  id v6 = [v1 localizedDescription];
  [v6 UTF8String];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DAFF9000, v7, v8, "[%@][%@] Error encountered while donating historical labels: %{public}s", v9, v10, v11, v12, v13);
}

- (void)_triggerMicroLocationRecordingScan
{
  id v3 = (id)objc_opt_class();
  id v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1DAFF9000, v5, v6, "[%@][%@] TriggerId was unexpectedly nil", v7, v8, v9, v10, 2u);
}

void __70__ATXMicrolocationRecordingTrigger__triggerMicroLocationRecordingScan__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  v2 = objc_opt_class();
  id v3 = *(const char **)(v0 + 40);
  id v4 = v2;
  uint64_t v5 = NSStringFromSelector(v3);
  id v6 = [v1 localizedDescription];
  [v6 UTF8String];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DAFF9000, v7, v8, "[%@][%@]  Error encountered while requesting MiLo recording scan: %{public}s", v9, v10, v11, v12, v13);
}

void __79__ATXMicrolocationRecordingTrigger__donateTruthLabelForTriggerUUID_truthLabel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  v2 = objc_opt_class();
  id v3 = *(const char **)(v0 + 56);
  id v4 = v2;
  uint64_t v5 = NSStringFromSelector(v3);
  id v6 = [v1 localizedDescription];
  [v6 UTF8String];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DAFF9000, v7, v8, "[%@][%@] Error encountered while requesting MiLo recording scan: %{public}s", v9, v10, v11, v12, v13);
}

@end