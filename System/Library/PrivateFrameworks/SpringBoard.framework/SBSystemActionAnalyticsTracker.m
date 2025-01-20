@interface SBSystemActionAnalyticsTracker
+ (id)sharedTracker;
- (SBSystemActionAnalyticsTracker)init;
- (id)_openCameraActionIdentifier;
- (uint64_t)trackPressDownForLatencyMeasurement:(uint64_t)result;
- (void)_logSignificantTimeChanged;
- (void)_sendEventToPowerLog:(id)a3 payload:(id)a4;
- (void)trackInteractionWithType:(void *)a3 forAction:(void *)a4 suppressionStatus:;
- (void)trackPerformedAction:(double)a3 executionTime:;
- (void)trackPocketStateQueryWithExecutionTime:(double)a3 error:;
- (void)trackPressUpForLatencyMeasurement:(int)a3 cancelled:(int)a4 longPressTriggered:(void *)a5 selectedActionIdentifier:;
- (void)trackSelectedActionChanged:(void *)a1;
- (void)trackSuppressionStatusUpdate:(uint64_t)a1;
@end

@implementation SBSystemActionAnalyticsTracker

+ (id)sharedTracker
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBSystemActionAnalyticsTracker_sharedTracker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedTracker_onceToken != -1) {
    dispatch_once(&sharedTracker_onceToken, block);
  }
  v1 = (void *)sharedTracker_tracker;
  return v1;
}

void __47__SBSystemActionAnalyticsTracker_sharedTracker__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedTracker_tracker;
  sharedTracker_tracker = (uint64_t)v1;
}

- (SBSystemActionAnalyticsTracker)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBSystemActionAnalyticsTracker;
  v2 = [(SBSystemActionAnalyticsTracker *)&v9 init];
  if (v2)
  {
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    powerLogSendQueue = v2->_powerLogSendQueue;
    v2->_powerLogSendQueue = (OS_dispatch_queue *)SerialWithQoS;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = [MEMORY[0x1E4F28F08] mainQueue];
    id v7 = (id)[v5 addObserverForName:@"SBSignificantTimeChangedNotification" object:0 queue:v6 usingBlock:&__block_literal_global_292];
  }
  return v2;
}

void __38__SBSystemActionAnalyticsTracker_init__block_invoke()
{
  +[SBSystemActionAnalyticsTracker sharedTracker]();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 _logSignificantTimeChanged];
}

- (void)trackInteractionWithType:(void *)a3 forAction:(void *)a4 suppressionStatus:
{
  id v22 = a3;
  id v6 = a4;
  if (!a1)
  {
LABEL_10:

    return;
  }
  if (v22)
  {
    uint64_t v7 = [v22 analyticsData];
    v8 = (void *)v7;
    v10 = v9;
    if (v7) {
      v11 = (__CFString *)v7;
    }
    else {
      v11 = @"null";
    }
    objc_storeStrong((id *)(a1 + 16), v11);
    if (v10) {
      v12 = v10;
    }
    else {
      v12 = @"null";
    }
    objc_storeStrong((id *)(a1 + 24), v12);
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    v14 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v13;

    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = NSStringFromSBSAnalyticsActionButtonInteractionType();
    [v15 setObject:v16 forKeyedSubscript:@"type"];

    [v15 setObject:*(void *)(a1 + 16) forKeyedSubscript:@"action"];
    [v15 setObject:*(void *)(a1 + 24) forKeyedSubscript:@"param_value"];
    v17 = (void *)[v15 copy];
    v18 = NSStringFromAnalyticsEventType();
    [(id)a1 _sendEventToPowerLog:v18 payload:v17];

    v19 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v6);
    SBAddSuppressionMetricsIntoEventPayload(v15, v19, 0);

    v20 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v20 emitEvent:63 withPayload:v15];

    goto LABEL_10;
  }
  v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"action != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBSystemActionAnalyticsTracker trackInteractionWithType:forAction:suppressionStatus:](sel_trackInteractionWithType_forAction_suppressionStatus_, a1, (uint64_t)v21);
  }
  [v21 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)trackPerformedAction:(double)a3 executionTime:
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = (__CFString *)[v5 analyticsData];
    objc_super v9 = v8;
    v10 = [MEMORY[0x1E4FA5E78] sharedInstance];
    v11 = @"null";
    v15[0] = @"action";
    v15[1] = @"param_value";
    if (v7) {
      v12 = v7;
    }
    else {
      v12 = @"null";
    }
    if (v9) {
      v11 = v9;
    }
    v16[0] = v12;
    v16[1] = v11;
    v15[2] = @"execution_time";
    uint64_t v13 = [NSNumber numberWithDouble:a3];
    v16[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
    [v10 emitEvent:67 withPayload:v14];
  }
}

- (void)trackSuppressionStatusUpdate:(uint64_t)a1
{
  id v4 = a2;
  if (!a1)
  {
LABEL_10:

    return;
  }
  if (v4)
  {
    id v20 = v4;
    id v5 = *(id *)(a1 + 8);
    objc_storeStrong((id *)(a1 + 8), a2);
    if (v5)
    {
      if (*(void *)(a1 + 16))
      {
        if (*(void *)(a1 + 32))
        {
          BOOL v6 = -[SBCameraActivationManager workspace]((uint64_t)v20) != 1;
          if (((v6 ^ (-[SBCameraActivationManager workspace]((uint64_t)v5) == 1)) & 1) == 0)
          {
            uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
            [v7 timeIntervalSinceDate:*(void *)(a1 + 32)];
            double v9 = v8;

            if (v9 <= 0.5)
            {
              v10 = [MEMORY[0x1E4F1CA60] dictionary];
              [v10 setObject:*(void *)(a1 + 16) forKeyedSubscript:@"action"];
              [v10 setObject:*(void *)(a1 + 24) forKeyedSubscript:@"param_value"];
              v11 = [NSNumber numberWithDouble:v9];
              [v10 setObject:v11 forKeyedSubscript:@"time_delta"];

              unint64_t v12 = -[SBCameraActivationManager workspace]((uint64_t)v20);
              uint64_t v13 = NSStringFromSBSystemActionSuppressionState(v12);
              [v10 setObject:v13 forKeyedSubscript:@"state"];

              v14 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v20);
              SBAddSuppressionMetricsIntoEventPayload(v10, v14, 0);

              unint64_t v15 = -[SBCameraActivationManager workspace]((uint64_t)v5);
              v16 = NSStringFromSBSystemActionSuppressionState(v15);
              [v10 setObject:v16 forKeyedSubscript:@"prev_state"];

              v17 = -[SBHomeScreenConfigurationServer listener]((uint64_t)v5);
              SBAddSuppressionMetricsIntoEventPayload(v10, v17, @"prev_");

              v18 = [MEMORY[0x1E4FA5E78] sharedInstance];
              [v18 emitEvent:66 withPayload:v10];
            }
          }
        }
      }
    }

    id v4 = v20;
    goto LABEL_10;
  }
  v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"status != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    [(SBSystemActionAnalyticsTracker *)sel_trackSuppressionStatusUpdate_ trackSuppressionStatusUpdate:(uint64_t)v19];
  }
  [v19 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)trackSelectedActionChanged:(void *)a1
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 analyticsData];
    uint64_t v7 = (void *)v5;
    double v8 = v6;
    double v9 = @"null";
    v14[0] = @"action";
    v14[1] = @"param_value";
    if (v5) {
      v10 = (__CFString *)v5;
    }
    else {
      v10 = @"null";
    }
    if (v6) {
      double v9 = v6;
    }
    v15[0] = v10;
    v15[1] = v9;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    unint64_t v12 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v12 emitEvent:65 withPayload:v11];

    uint64_t v13 = NSStringFromAnalyticsEventType();
    [a1 _sendEventToPowerLog:v13 payload:v11];
  }
}

- (void)trackPocketStateQueryWithExecutionTime:(double)a3 error:
{
  id v12 = a2;
  if (a1)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v6 = [NSNumber numberWithDouble:a3];
    [v5 setObject:v6 forKeyedSubscript:@"execution_time"];

    if (v12)
    {
      uint64_t v7 = NSString;
      double v8 = [v12 domain];
      double v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
      v10 = [v7 stringWithFormat:@"%@: %@", v8, v9];
      [v5 setObject:v10 forKeyedSubscript:@"error"];
    }
    v11 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v11 emitEvent:68 withPayload:v5];
  }
}

- (uint64_t)trackPressDownForLatencyMeasurement:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    *(double *)(result + 40) = a2;
    result = BSAbsoluteMachTimeNow();
    *(void *)(v2 + 48) = v3;
  }
  return result;
}

- (void)trackPressUpForLatencyMeasurement:(int)a3 cancelled:(int)a4 longPressTriggered:(void *)a5 selectedActionIdentifier:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a5;
  if (a1 && (_os_feature_enabled_impl() & 1) == 0)
  {
    BSAbsoluteMachTimeNow();
    double v12 = v11;
    double v13 = a1[6];
    v14 = a1 + 5;
    double v15 = v13 - a1[5];
    uint64_t v16 = -[SBCameraActivationManager workspace]((uint64_t)v9);
    v17 = [a1 _openCameraActionIdentifier];
    int v18 = [v10 containsString:v17];

    if (v15 > 0.0)
    {
      double v19 = v12 - v13;
      AnalyticsSendEventLazy();
      id v20 = SBLogButtonsRinger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219264;
        double v22 = v15;
        __int16 v23 = 2048;
        double v24 = v19;
        __int16 v25 = 1024;
        int v26 = a3;
        __int16 v27 = 2048;
        uint64_t v28 = v16;
        __int16 v29 = 1024;
        int v30 = a4;
        __int16 v31 = 1024;
        int v32 = v18;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "Action Button press event delivery latency analytics: %f, duration: %f, cancelled: %{BOOL}d, suppression state: %lu, longPressTriggered: %{BOOL}d, cameraActionSelected: %{BOOL}d", buf, 0x32u);
      }
    }
    void *v14 = 0;
    v14[1] = 0;
  }
}

id __122__SBSystemActionAnalyticsTracker_trackPressUpForLatencyMeasurement_cancelled_longPressTriggered_selectedActionIdentifier___block_invoke(uint64_t a1)
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"deliveryLatency";
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v11[0] = v2;
  v10[1] = @"pressDuration";
  uint64_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v11[1] = v3;
  v10[2] = @"canceled";
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v11[2] = v4;
  v10[3] = @"suppressionState";
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v11[3] = v5;
  v10[4] = @"longPressTriggered";
  BOOL v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
  v11[4] = v6;
  v10[5] = @"cameraActionSelected";
  uint64_t v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 58)];
  v11[5] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

- (void)_logSignificantTimeChanged
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)SBApp systemActionControl];
  id v4 = (__CFString *)-[SBSystemActionControl selectedActionAnalyticsData]((uint64_t)v3);
  BOOL v6 = v5;

  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = @"null";
  }
  v12[0] = @"action";
  v12[1] = @"param_value";
  if (v6) {
    double v8 = v6;
  }
  else {
    double v8 = @"null";
  }
  v13[0] = v7;
  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v10 emitEvent:64 withPayload:v9];

  double v11 = NSStringFromAnalyticsEventType();
  [(SBSystemActionAnalyticsTracker *)self _sendEventToPowerLog:v11 payload:v9];
}

- (void)_sendEventToPowerLog:(id)a3 payload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  powerLogSendQueue = self->_powerLogSendQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SBSystemActionAnalyticsTracker__sendEventToPowerLog_payload___block_invoke;
  v11[3] = &unk_1E6AF5290;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(powerLogSendQueue, v11);
}

uint64_t __63__SBSystemActionAnalyticsTracker__sendEventToPowerLog_payload___block_invoke()
{
  uint64_t result = PLShouldLogRegisteredEvent();
  if (result)
  {
    return PLLogRegisteredEvent();
  }
  return result;
}

- (id)_openCameraActionIdentifier
{
  if (_openCameraActionIdentifier___onceToken != -1) {
    dispatch_once(&_openCameraActionIdentifier___onceToken, &__block_literal_global_122_0);
  }
  uint64_t v2 = (void *)_openCameraActionIdentifier___openCameraActionIdentifier;
  return v2;
}

void __61__SBSystemActionAnalyticsTracker__openCameraActionIdentifier__block_invoke()
{
  uint64_t v0 = [@"com.apple.springboard" stringByAppendingFormat:@".%@", *MEMORY[0x1E4FA6950]];
  id v1 = (void *)_openCameraActionIdentifier___openCameraActionIdentifier;
  _openCameraActionIdentifier___openCameraActionIdentifier = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogSendQueue, 0);
  objc_storeStrong((id *)&self->_lastQueryTimestamp, 0);
  objc_storeStrong((id *)&self->_lastQueriedParameterValueIdentifier, 0);
  objc_storeStrong((id *)&self->_lastQueriedActionIdentifier, 0);
  objc_storeStrong((id *)&self->_suppressionStatus, 0);
}

- (void)trackInteractionWithType:(const char *)a1 forAction:(uint64_t)a2 suppressionStatus:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_19();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  id v12 = @"SBSystemActionAnalyticsTracker.m";
  __int16 v13 = 1024;
  int v14 = 80;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

- (void)trackSuppressionStatusUpdate:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_19();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  id v12 = @"SBSystemActionAnalyticsTracker.m";
  __int16 v13 = 1024;
  int v14 = 113;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end