@interface SBAlwaysOnTelemetryEmitter
+ (id)new;
- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator;
- (SBAlwaysOnTelemetryEmitter)init;
- (SBAlwaysOnTelemetryEmitter)initWithBacklightEnvironmentSessionProvider:(id)a3;
- (id)_analyticsPayloadForHistogram:(uint64_t)a1;
- (id)_mq_metrics;
- (id)_payloadForAlwaysOnEnabled:(uint64_t)a1;
- (uint64_t)_noteAlwaysOnEnabledReasonsMayHaveChanged;
- (uint64_t)_resolveTelemetryBacklightState;
- (uint64_t)_resolveTelemetryBacklightState:(uint64_t)a1;
- (void)_emitAnalyticsEventForBacklightStateTransitionWithEvent:(uint64_t)a1;
- (void)_emitBiomeEventsForAlwaysOnEnabled:(uint64_t)a1;
- (void)_emitEventsForAlwaysOnEnabled:(uint64_t)a1;
- (void)_emitEventsForAlwaysOnEnabled:(uint64_t)a1 ifPayloadChanged:(char)a2;
- (void)_emitPowerLogEventForBacklightStateTransitionWithEvent:(uint64_t)a3 telemetryBacklightState:;
- (void)_logAnalyticsEvent:(void *)a3 metrics:;
- (void)_logPowerlogEvent:(uint64_t)a3 payload:;
- (void)_logPowerlogEvent:(void *)a3 metrics:;
- (void)_logTelemetryForBacklightStateUpdate:(void *)a3 event:;
- (void)_logTelemetryForBacklightStateUpdateFromTelemetrySource:(void *)a3 event:;
- (void)_mq_triggerDeferredLogging;
- (void)_performDeferredLogging;
- (void)_significantTimeChange:(id)a3;
- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4;
- (void)backlightEnvironmentSessionsProvider:(id)a3 didUpdatePresentation:(id)a4 withBundleIdentifiers:(id)a5;
- (void)backlightTelemetrySource:(id)a3 didCompleteUpdateToFlipbookState:(int64_t)a4 forEvent:(id)a5;
- (void)backlightTelemetrySource:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)completeIntializationAfterBLSStartup;
- (void)dealloc;
- (void)logTelemetryForInvalidation:(id)a3;
- (void)logTelemetryForRenderSession:(id)a3;
- (void)logTelemetryForRequestDates:(id)a3;
- (void)setAlwaysOnPolicyCoordinator:(id)a3;
@end

@implementation SBAlwaysOnTelemetryEmitter

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SBAlwaysOnTelemetryEmitter.m", 69, @"%s is unavailable; use %@ instead",
    "+[SBAlwaysOnTelemetryEmitter new]",
    v5);

  return 0;
}

- (SBAlwaysOnTelemetryEmitter)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBAlwaysOnTelemetryEmitter.m", 73, @"%s is unavailable; use %@ instead",
    "-[SBAlwaysOnTelemetryEmitter init]",
    v5);

  return 0;
}

- (SBAlwaysOnTelemetryEmitter)initWithBacklightEnvironmentSessionProvider:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBAlwaysOnTelemetryEmitter;
  v6 = [(SBAlwaysOnTelemetryEmitter *)&v31 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backlightEnvironmentSessionProvider, a3);
    [(SBBacklightEnvironmentSessionProvider *)v7->_backlightEnvironmentSessionProvider addObserver:v7];
    v8 = (SBAlwaysOnDefaults *)objc_alloc_init(MEMORY[0x1E4FA5E40]);
    alwaysOnDefaults = v7->_alwaysOnDefaults;
    v7->_alwaysOnDefaults = v8;

    objc_initWeak(&location, v7);
    v10 = v7->_alwaysOnDefaults;
    v11 = [NSString stringWithUTF8String:"showWallpaperInAlwaysOn"];
    v32[0] = v11;
    v12 = [NSString stringWithUTF8String:"showNotificationsInAlwaysOn"];
    v32[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v14 = MEMORY[0x1E4F14428];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __74__SBAlwaysOnTelemetryEmitter_initWithBacklightEnvironmentSessionProvider___block_invoke;
    v28[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v29, &location);
    uint64_t v15 = [(SBAlwaysOnDefaults *)v10 observeDefaults:v13 onQueue:MEMORY[0x1E4F14428] withBlock:v28];
    alwaysOnDefaultsObserverToken = v7->_alwaysOnDefaultsObserverToken;
    v7->_alwaysOnDefaultsObserverToken = (BSDefaultObserver *)v15;

    v17 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
    [v17 addObserver:v7];
    objc_storeStrong((id *)&v7->_backlight, v17);
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    metricsQueue = v7->_metricsQueue;
    v7->_metricsQueue = (OS_dispatch_queue *)SerialWithQoS;

    uint64_t v20 = BSDispatchQueueCreateSerialWithQoS();
    powerlogSendQueue = v7->_powerlogSendQueue;
    v7->_powerlogSendQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = BSDispatchQueueCreateSerialWithQoS();
    biomeWriterQueue = v7->_biomeWriterQueue;
    v7->_biomeWriterQueue = (OS_dispatch_queue *)v22;

    v24 = objc_alloc_init(SBAlwaysOnTelemetryMetrics);
    mq_metrics = v7->_mq_metrics;
    v7->_mq_metrics = v24;

    -[SBAlwaysOnTelemetryMetrics setBacklightState:](v7->_mq_metrics, "setBacklightState:", -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:]((uint64_t)v7, v7->_backlight));
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v7 selector:sel__significantTimeChange_ name:@"SBSignificantTimeChangedNotification" object:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __74__SBAlwaysOnTelemetryEmitter_initWithBacklightEnvironmentSessionProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAlwaysOnTelemetryEmitter _noteAlwaysOnEnabledReasonsMayHaveChanged]((uint64_t)WeakRetained);
}

- (uint64_t)_noteAlwaysOnEnabledReasonsMayHaveChanged
{
  if (result) {
    return BSDispatchMain();
  }
  return result;
}

- (uint64_t)_resolveTelemetryBacklightState
{
  if (result) {
    return -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:](result, *(void **)(result + 32));
  }
  return result;
}

- (void)dealloc
{
  [(BSDefaultObserver *)self->_alwaysOnDefaultsObserverToken invalidate];
  v3 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
  [v3 removeObserver:self];

  v4 = [(id)SBApp blshService];
  id v5 = [v4 localAssertionService];
  [v5 removeObserver:self];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)SBAlwaysOnTelemetryEmitter;
  [(SBAlwaysOnTelemetryEmitter *)&v7 dealloc];
}

- (void)completeIntializationAfterBLSStartup
{
  id v5 = [MEMORY[0x1E4F4F550] sharedTelemetrySource];
  [v5 setTelemetryDelegate:self];
  v3 = [(id)SBApp blshService];
  v4 = [v3 localAssertionService];

  [v4 addObserver:self];
}

- (void)backlightTelemetrySource:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if (a4 != 1) {
    -[SBAlwaysOnTelemetryEmitter _logTelemetryForBacklightStateUpdateFromTelemetrySource:event:]((uint64_t)self, a3, a5);
  }
}

- (void)_logTelemetryForBacklightStateUpdateFromTelemetrySource:(void *)a3 event:
{
  if (a1)
  {
    id v6 = a3;
    uint64_t v5 = -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:](a1, a2);
    -[SBAlwaysOnTelemetryEmitter _logTelemetryForBacklightStateUpdate:event:](a1, v5, v6);
  }
}

- (void)backlightTelemetrySource:(id)a3 didCompleteUpdateToFlipbookState:(int64_t)a4 forEvent:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (a4 && a4 != 3) {
    -[SBAlwaysOnTelemetryEmitter _logTelemetryForBacklightStateUpdateFromTelemetrySource:event:]((uint64_t)self, v9, v8);
  }
}

- (void)backlight:(id)a3 didChangeAlwaysOnEnabled:(BOOL)a4
{
  if (self) {
    -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:]((uint64_t)self, a4);
  }
}

- (void)_emitEventsForAlwaysOnEnabled:(uint64_t)a1
{
  if (a1) {
    -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:](a1, a2);
  }
}

- (void)logTelemetryForInvalidation:(id)a3
{
  id v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBAlwaysOnTelemetryEmitter_logTelemetryForInvalidation___block_invoke;
  block[3] = &unk_1E6AF5290;
  id v6 = v4;
  id v9 = v6;
  v10 = self;
  dispatch_async(metricsQueue, block);
  id v7 = v6;
  AnalyticsSendEventLazy();
}

void __58__SBAlwaysOnTelemetryEmitter_logTelemetryForInvalidation___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) wasReset];
  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [*(id *)(a1 + 32) invalidatedFramesHistogram];
  if (v2) {
    [v4 accumulateDiscardHistogram:v3];
  }
  else {
    [v4 accumulateInvalidationHistogram:v3];
  }
}

- (id)_mq_metrics
{
  if (a1)
  {
    int v2 = a1;
    BSDispatchQueueAssert();
    -[SBAlwaysOnTelemetryEmitter _mq_triggerDeferredLogging](v2);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

id __58__SBAlwaysOnTelemetryEmitter_logTelemetryForInvalidation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) invalidatedFramesHistogram];
  id v4 = -[SBAlwaysOnTelemetryEmitter _analyticsPayloadForHistogram:](v2, v3);
  uint64_t v5 = (void *)[v4 mutableCopy];

  id v6 = [*(id *)(a1 + 40) reason];
  [v5 setObject:v6 forKeyedSubscript:@"reason"];

  id v7 = [*(id *)(a1 + 40) source];
  [v5 setObject:v7 forKeyedSubscript:@"source"];

  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didClearDateSpecifiers"));
  [v5 setObject:v8 forKeyedSubscript:@"didClearDateSpecifiers"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "wasReset"));
  [v5 setObject:v9 forKeyedSubscript:@"wasReset"];

  return v5;
}

- (id)_analyticsPayloadForHistogram:(uint64_t)a1
{
  v21[10] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v20[0] = @"histogram_totalCount";
    uint64_t v2 = NSNumber;
    id v3 = a2;
    v19 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "totalCount"));
    v21[0] = v19;
    v20[1] = @"histogram_countLessThan1Min";
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "countLessThan1Min"));
    v21[1] = v4;
    v20[2] = @"histogram_count1to2Min";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "count1to2Min"));
    v21[2] = v5;
    v20[3] = @"histogram_count2to3Min";
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "count2to3Min"));
    v21[3] = v6;
    v20[4] = @"histogram_count3to4Min";
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "count3to4Min"));
    v21[4] = v7;
    v20[5] = @"histogram_count4to5Min";
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "count4to5Min"));
    v21[5] = v8;
    v20[6] = @"histogram_count5to6Min";
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "count5to6Min"));
    v21[6] = v9;
    v20[7] = @"histogram_countMoreThan6Min";
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "countMoreThan6Min"));
    v21[7] = v10;
    v20[8] = @"histogram_intervalUntilFirstFrame";
    v11 = NSNumber;
    [v3 intervalUntilFirstFrame];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    v21[8] = v12;
    v20[9] = @"histogram_presentationDuration";
    v13 = NSNumber;
    [v3 presentationDuration];
    double v15 = v14;

    v16 = [v13 numberWithDouble:v15];
    v21[9] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:10];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (void)logTelemetryForRenderSession:(id)a3
{
  id v4 = a3;
  metricsQueue = self->_metricsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SBAlwaysOnTelemetryEmitter_logTelemetryForRenderSession___block_invoke;
  block[3] = &unk_1E6AF5290;
  void block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_async(metricsQueue, block);
  id v7 = v6;
  AnalyticsSendEventLazy();
}

void __59__SBAlwaysOnTelemetryEmitter_logTelemetryForRenderSession___block_invoke(uint64_t a1)
{
  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 40) sessionFramesHistogram];
  [v3 accumulateRenderHistogram:v2];
}

id __59__SBAlwaysOnTelemetryEmitter_logTelemetryForRenderSession___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) sessionFramesHistogram];
  id v4 = -[SBAlwaysOnTelemetryEmitter _analyticsPayloadForHistogram:](v2, v3);
  uint64_t v5 = (void *)[v4 mutableCopy];

  id v6 = [*(id *)(a1 + 40) environmentIdentifiers];
  id v7 = [v6 firstObject];
  [v5 setObject:v7 forKeyedSubscript:@"firstEnvironmentIdentifier"];

  id v8 = [*(id *)(a1 + 40) reasonEnded];
  [v5 setObject:v8 forKeyedSubscript:@"reasonEnded"];

  id v9 = NSNumber;
  v10 = [*(id *)(a1 + 40) environmentIdentifiers];
  v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  [v5 setObject:v11 forKeyedSubscript:@"environmentCount"];

  v12 = NSNumber;
  [*(id *)(a1 + 40) totalPreparationDuration];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v5 setObject:v13 forKeyedSubscript:@"totalPreparationDuration"];

  double v14 = NSNumber;
  [*(id *)(a1 + 40) accumulatedLayoutDuration];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v5 setObject:v15 forKeyedSubscript:@"accumulatedLayoutDuration"];

  v16 = NSNumber;
  [*(id *)(a1 + 40) accumulatedRenderDuration];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  [v5 setObject:v17 forKeyedSubscript:@"accumulatedRenderDuration"];

  v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "didFailToRender"));
  [v5 setObject:v18 forKeyedSubscript:@"didFailToRender"];

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "timedOutEnvironmentCount"));
  [v5 setObject:v19 forKeyedSubscript:@"timedOutEnvironmentCount"];

  uint64_t v20 = NSNumber;
  [*(id *)(a1 + 40) totalPreparationDuration];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  [v5 setObject:v21 forKeyedSubscript:@"totalPreparationDuration"];

  return v5;
}

- (void)logTelemetryForRequestDates:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __58__SBAlwaysOnTelemetryEmitter_logTelemetryForRequestDates___block_invoke(uint64_t a1)
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v19[0] = @"firstEnvironmentIdentifier";
  v18 = [*(id *)(a1 + 32) environmentIdentifiers];
  uint64_t v2 = [v18 firstObject];
  v20[0] = v2;
  v19[1] = @"environmentCount";
  id v3 = NSNumber;
  id v4 = [*(id *)(a1 + 32) environmentIdentifiers];
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v20[1] = v5;
  v19[2] = @"shortestInterval";
  id v6 = NSNumber;
  [*(id *)(a1 + 32) shortestInterval];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  v20[2] = v7;
  v19[3] = @"averageInterval";
  id v8 = NSNumber;
  [*(id *)(a1 + 32) averageInterval];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  v20[3] = v9;
  v19[4] = @"longestInterval";
  v10 = NSNumber;
  [*(id *)(a1 + 32) longestInterval];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v20[4] = v11;
  v19[5] = @"completionDuration";
  v12 = NSNumber;
  [*(id *)(a1 + 32) completionDuration];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v20[5] = v13;
  v19[6] = @"didReset";
  double v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "didReset"));
  v20[6] = v14;
  v19[7] = @"timedOutCount";
  double v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "timedOutCount"));
  v20[7] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8];

  return v16;
}

- (void)backlightEnvironmentSessionsProvider:(id)a3 didUpdatePresentation:(id)a4 withBundleIdentifiers:(id)a5
{
  id v6 = a5;
  metricsQueue = self->_metricsQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__SBAlwaysOnTelemetryEmitter_backlightEnvironmentSessionsProvider_didUpdatePresentation_withBundleIdentifiers___block_invoke;
  v9[3] = &unk_1E6AF5290;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(metricsQueue, v9);
}

void __111__SBAlwaysOnTelemetryEmitter_backlightEnvironmentSessionsProvider_didUpdatePresentation_withBundleIdentifiers___block_invoke(uint64_t a1)
{
  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 accumulatePresentationSources:*(void *)(a1 + 40)];
}

- (void)_significantTimeChange:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"SBSignificantTimeChangeWasMidnight"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    char v7 = [(BLSBacklight *)self->_backlight isAlwaysOnEnabled];
    -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:]((uint64_t)self, v7);
  }
}

- (void)_mq_triggerDeferredLogging
{
  if (a1)
  {
    BSDispatchQueueAssert();
    if (!a1[7])
    {
      objc_initWeak(&location, a1);
      id v2 = (void *)MEMORY[0x1E4F1CB00];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke;
      v9[3] = &unk_1E6AF61A0;
      objc_copyWeak(&v10, &location);
      uint64_t v3 = [v2 timerWithTimeInterval:0 repeats:v9 block:1200.0];
      id v4 = a1[7];
      a1[7] = (id)v3;

      id v5 = a1[7];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke_2;
      block[3] = &unk_1E6AF4AC0;
      id v8 = v5;
      id v6 = v5;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBAlwaysOnTelemetryEmitter _performDeferredLogging]((uint64_t)WeakRetained);
}

- (void)_performDeferredLogging
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SBAlwaysOnTelemetryEmitter__performDeferredLogging__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __56__SBAlwaysOnTelemetryEmitter__mq_triggerDeferredLogging__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v2 addTimer:*(void *)(a1 + 32) forMode:*MEMORY[0x1E4F1C4B0]];
}

- (uint64_t)_resolveTelemetryBacklightState:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 backlightState];
    uint64_t v6 = [v4 flipbookState];
    if (v5 == 1)
    {
      if ((unint64_t)(v6 - 1) > 4) {
        a1 = 4;
      }
      else {
        a1 = qword_1D8FD1640[v6 - 1];
      }
    }
    else
    {
      uint64_t v7 = v6 == 3;
      if (v5 == 3) {
        uint64_t v7 = 6;
      }
      if (v5 == 2) {
        a1 = 5;
      }
      else {
        a1 = v7;
      }
    }
  }

  return a1;
}

- (void)_logTelemetryForBacklightStateUpdate:(void *)a3 event:
{
  if (a1)
  {
    uint64_t v5 = *(NSObject **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__SBAlwaysOnTelemetryEmitter__logTelemetryForBacklightStateUpdate_event___block_invoke;
    v7[3] = &unk_1E6AF4A70;
    v7[4] = a1;
    v7[5] = a2;
    id v6 = a3;
    dispatch_async(v5, v7);
    -[SBAlwaysOnTelemetryEmitter _emitPowerLogEventForBacklightStateTransitionWithEvent:telemetryBacklightState:](a1, v6, a2);
    -[SBAlwaysOnTelemetryEmitter _emitAnalyticsEventForBacklightStateTransitionWithEvent:](a1, v6);
  }
}

void __73__SBAlwaysOnTelemetryEmitter__logTelemetryForBacklightStateUpdate_event___block_invoke(uint64_t a1)
{
  -[SBAlwaysOnTelemetryEmitter _mq_metrics](*(id **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setBacklightState:*(void *)(a1 + 40)];
}

- (void)_emitPowerLogEventForBacklightStateTransitionWithEvent:(uint64_t)a3 telemetryBacklightState:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __109__SBAlwaysOnTelemetryEmitter__emitPowerLogEventForBacklightStateTransitionWithEvent_telemetryBacklightState___block_invoke;
    v7[3] = &unk_1E6AFC910;
    uint64_t v9 = a3;
    id v8 = v5;
    -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:payload:](a1, @"BacklightStateChange", (uint64_t)v7);
  }
}

- (void)_emitAnalyticsEventForBacklightStateTransitionWithEvent:(uint64_t)a1
{
  if (a1)
  {
    id v2 = [a2 changeRequest];
    id v3 = [v2 sourceEventMetadata];
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = v7;
      AnalyticsSendEventLazy();
    }
  }
}

- (void)_logPowerlogEvent:(uint64_t)a3 payload:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = (*(void (**)(uint64_t))(a3 + 16))(a3);
    id v7 = SBLogBacklight();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v5;
      __int16 v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Reporting to powerlog. eventName: %{public}@; payload: %{public}@",
        buf,
        0x16u);
    }

    id v8 = *(NSObject **)(a1 + 64);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_payload___block_invoke;
    v10[3] = &unk_1E6AF5290;
    id v11 = v5;
    id v12 = v6;
    id v9 = v6;
    dispatch_async(v8, v10);
  }
}

uint64_t __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_payload___block_invoke()
{
  uint64_t result = PLShouldLogRegisteredEvent();
  if (result)
  {
    return PLLogRegisteredEvent();
  }
  return result;
}

- (void)_logPowerlogEvent:(void *)a3 metrics:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_metrics___block_invoke;
    v8[3] = &unk_1E6AFFB58;
    id v9 = v6;
    id v10 = v5;
    -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:payload:](a1, v10, (uint64_t)v8);
  }
}

uint64_t __56__SBAlwaysOnTelemetryEmitter__logPowerlogEvent_metrics___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataForPowerlogEvent:*(void *)(a1 + 40)];
}

- (void)_logAnalyticsEvent:(void *)a3 metrics:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    id v8 = v6;
    id v9 = v5;
    AnalyticsSendEventLazy();
  }
}

uint64_t __57__SBAlwaysOnTelemetryEmitter__logAnalyticsEvent_metrics___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dataForAnalyticsEvent:*(void *)(a1 + 40)];
}

void __53__SBAlwaysOnTelemetryEmitter__performDeferredLogging__block_invoke(uint64_t a1)
{
  id v2 = SBLogBacklight();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Deferred analytics timer fired", v12, 2u);
  }

  id v3 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = objc_alloc_init(SBAlwaysOnTelemetryMetrics);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setBacklightState:", -[SBAlwaysOnTelemetryEmitter _resolveTelemetryBacklightState:](*(void *)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 32)));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 48);
  id v9 = [*(id *)(v7 + 8) currentPresentationBundleIdentifiers];
  [v8 accumulatePresentationSources:v9];

  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = 0;

  -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:metrics:](*(void *)(a1 + 32), @"FlipbookStatistics", v3);
  -[SBAlwaysOnTelemetryEmitter _logAnalyticsEvent:metrics:](*(void *)(a1 + 32), @"com.apple.springboard.alwayson.flipbookstatistics", v3);
}

id __109__SBAlwaysOnTelemetryEmitter__emitPowerLogEventForBacklightStateTransitionWithEvent_telemetryBacklightState___block_invoke(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = @"state";
  id v2 = NSStringFromSBAlwaysOnTelemetryBacklightState(*(void *)(a1 + 40));
  v18[1] = @"explanation";
  v19[0] = v2;
  id v3 = [*(id *)(a1 + 32) changeRequest];
  uint64_t v4 = [v3 explanation];
  uint64_t v5 = (void *)v4;
  id v6 = &stru_1F3084718;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  v19[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = [*(id *)(a1 + 32) changeRequest];
  uint64_t v10 = [v9 sourceEventMetadata];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    [v14 type];
    __int16 v15 = NSStringFromBLSAlwaysOnSuppressionType();
    [v8 setObject:v15 forKeyedSubscript:@"suppressionChangeType"];

    [v14 reason];
    v16 = NSStringFromBLSAlwaysOnSuppressionReason();
    [v8 setObject:v16 forKeyedSubscript:@"suppressionReasons"];
  }
  return v8;
}

id __86__SBAlwaysOnTelemetryEmitter__emitAnalyticsEventForBacklightStateTransitionWithEvent___block_invoke(uint64_t a1)
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  int8x8_t v3 = (int8x8_t)[*(id *)(a1 + 32) reason];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v13 = __86__SBAlwaysOnTelemetryEmitter__emitAnalyticsEventForBacklightStateTransitionWithEvent___block_invoke_2;
  id v14 = &unk_1E6AF5510;
  id v4 = v2;
  id v15 = v4;
  uint64_t v5 = v12;
  if (v3)
  {
    char v16 = 0;
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v3);
    v6.i16[0] = vaddlv_u8(v6);
    int v7 = v6.i32[0];
    if (v6.i32[0])
    {
      unint64_t v8 = 0;
      do
      {
        if (((1 << v8) & *(void *)&v3) != 0)
        {
          v13((uint64_t)v5);
          if (v16) {
            break;
          }
          --v7;
        }
        if (v8 > 0x3E) {
          break;
        }
        ++v8;
      }
      while (v7 > 0);
    }
  }

  v17[0] = @"suppressionChangeType";
  [*(id *)(a1 + 32) type];
  id v9 = NSStringFromBLSAlwaysOnSuppressionType();
  v17[1] = @"suppressionReasons";
  v18[0] = v9;
  v18[1] = v4;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v10;
}

void __86__SBAlwaysOnTelemetryEmitter__emitAnalyticsEventForBacklightStateTransitionWithEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  NSStringFromBLSAlwaysOnSuppressionReason();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (id)_payloadForAlwaysOnEnabled:(uint64_t)a1
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v24[0] = @"alwaysOnResolvedEnabled";
    int8x8_t v3 = [NSNumber numberWithBool:a2];
    v25[0] = v3;
    v24[1] = @"alwaysOnEnabledSetting";
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 16), "enableAlwaysOn"));
    v25[1] = v4;
    v24[2] = @"showWallpaperInAlwaysOnSetting";
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 16), "showWallpaperInAlwaysOn"));
    v25[2] = v5;
    v24[3] = @"showNotificationsInAlwaysOnSetting";
    uint8x8_t v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 16), "showNotificationsInAlwaysOn"));
    v25[3] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    unint64_t v8 = (void *)[v7 mutableCopy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    uint64_t v10 = objc_msgSend(WeakRetained, "activePolicies", 0);

    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          char v16 = [v15 analyticsPolicyValue];
          uint64_t v17 = [v15 analyticsPolicyName];
          [v8 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  return v8;
}

void __71__SBAlwaysOnTelemetryEmitter__noteAlwaysOnEnabledReasonsMayHaveChanged__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = [*(id *)(v1 + 32) isAlwaysOnEnabled];
  -[SBAlwaysOnTelemetryEmitter _emitEventsForAlwaysOnEnabled:ifPayloadChanged:](v1, v2);
}

- (void)_emitEventsForAlwaysOnEnabled:(uint64_t)a1 ifPayloadChanged:(char)a2
{
  if (a1)
  {
    BSDispatchMain();
    -[SBAlwaysOnTelemetryEmitter _emitBiomeEventsForAlwaysOnEnabled:](a1, a2);
  }
}

void __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke(uint64_t a1)
{
  char v2 = -[SBAlwaysOnTelemetryEmitter _payloadForAlwaysOnEnabled:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 41)) {
    goto LABEL_5;
  }
  id v4 = *(void **)(v3 + 88);
  if (!v4) {
    goto LABEL_5;
  }
  if (([v4 isEqualToDictionary:v2] & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
LABEL_5:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_2;
    v11[3] = &unk_1E6AF8148;
    id v5 = v2;
    id v12 = v5;
    -[SBAlwaysOnTelemetryEmitter _logPowerlogEvent:payload:](v3, @"AlwaysOnEnableState", (uint64_t)v11);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    id v10 = v5;
    AnalyticsSendEventLazy();
    uint64_t v6 = objc_msgSend(v10, "copy", v9, 3221225472, __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_3, &unk_1E6AF8148);
    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = v6;
  }
}

id __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __77__SBAlwaysOnTelemetryEmitter__emitEventsForAlwaysOnEnabled_ifPayloadChanged___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_emitBiomeEventsForAlwaysOnEnabled:(uint64_t)a1
{
  if (a1)
  {
    char v2 = *(NSObject **)(a1 + 72);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __65__SBAlwaysOnTelemetryEmitter__emitBiomeEventsForAlwaysOnEnabled___block_invoke;
    v3[3] = &unk_1E6AF5D38;
    v3[4] = a1;
    char v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __65__SBAlwaysOnTelemetryEmitter__emitBiomeEventsForAlwaysOnEnabled___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) enableAlwaysOn]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F4FE10]);
  id obj = (id)[v4 initWithUserSetState:v2 resolvedState:v3 blockingPolicies:MEMORY[0x1E4F1CBF0]];
  id v5 = *(void **)(*(void *)(a1 + 32) + 80);
  if (!v5 || ([v5 isEqual:obj] & 1) == 0)
  {
    uint64_t v6 = BiomeLibrary();
    uint64_t v7 = [v6 Device];
    unint64_t v8 = [v7 Display];
    uint64_t v9 = [v8 AlwaysOn];
    id v10 = [v9 source];
    [v10 sendEvent:obj];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), obj);
  }
}

- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alwaysOnPolicyCoordinator);
  return (SBAlwaysOnPolicyCoordinator *)WeakRetained;
}

- (void)setAlwaysOnPolicyCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alwaysOnPolicyCoordinator);
  objc_storeStrong((id *)&self->_lastAlwaysOnEnabledPayload, 0);
  objc_storeStrong((id *)&self->_lastBiomeEvent, 0);
  objc_storeStrong((id *)&self->_biomeWriterQueue, 0);
  objc_storeStrong((id *)&self->_powerlogSendQueue, 0);
  objc_storeStrong((id *)&self->_mq_deferredLoggingTimer, 0);
  objc_storeStrong((id *)&self->_mq_metrics, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaultsObserverToken, 0);
  objc_storeStrong((id *)&self->_alwaysOnDefaults, 0);
  objc_storeStrong((id *)&self->_backlightEnvironmentSessionProvider, 0);
}

@end