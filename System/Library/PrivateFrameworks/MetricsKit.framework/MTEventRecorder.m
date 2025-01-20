@interface MTEventRecorder
+ (id)_compositePromiseWithPromises:(id)a3 resolvingResultFromPromise:(id)a4;
+ (id)_metricsDataApplyingAllowlisting:(id)a3 usingRecorder:(id)a4;
- (BOOL)monitorsLifecycleEvents;
- (MTEventRecorder)init;
- (MTEventRecorder)initWithMetricsKit:(id)a3;
- (MTEventRecorderDelegate)delegate;
- (NSMutableArray)eventListeners;
- (id)_amsDelegate;
- (id)_flushUnreportedEventsUsingRecorder:(id)a3;
- (id)_recordEvent:(id)a3 toTopic:(id)a4 usingRecorder:(id)a5;
- (id)_recordEvent:(id)a3 usingRecorder:(id)a4;
- (id)flushUnreportedEvents;
- (id)recordEvent:(id)a3;
- (id)recordEvent:(id)a3 shouldSkipValidation:(BOOL)a4;
- (id)recordEvent:(id)a3 toTopic:(id)a4;
- (id)sendMethod;
- (void)addEventListener:(id)a3;
- (void)dealloc;
- (void)maybeSubscribeToFlushNotification;
- (void)removeEventListener:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventListeners:(id)a3;
- (void)setMonitorsLifecycleEvents:(BOOL)a3;
@end

@implementation MTEventRecorder

id __76__MTEventRecorder__compositePromiseWithPromises_resolvingResultFromPromise___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v9 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v9);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(MTObject *)self metricsKit];
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained setMetricsKit:v7];
  }
}

- (MTEventRecorder)initWithMetricsKit:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTEventRecorder;
  v3 = [(MTObject *)&v6 initWithMetricsKit:a3];
  v4 = v3;
  if (v3) {
    [(MTEventRecorder *)v3 maybeSubscribeToFlushNotification];
  }
  return v4;
}

- (MTEventRecorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTEventRecorder;
  v2 = [(MTEventRecorder *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTEventRecorder *)v2 maybeSubscribeToFlushNotification];
  }
  return v3;
}

- (void)maybeSubscribeToFlushNotification
{
  v3 = +[MTFrameworkEnvironment sharedEnvironment];
  int v4 = [v3 isInternalBuild];

  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_MTHandleFlushNotification, @"MTEventRecorderFlushNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventListeners, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)flushUnreportedEvents
{
  v3 = [(MTEventRecorder *)self delegate];
  int v4 = [(MTEventRecorder *)self _flushUnreportedEventsUsingRecorder:v3];

  objc_super v5 = [(MTEventRecorder *)self eventListeners];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__MTEventRecorder_flushUnreportedEvents__block_invoke;
  v9[3] = &unk_26430FC50;
  v9[4] = self;
  objc_super v6 = objc_msgSend(v5, "mt_map:", v9);

  v7 = +[MTEventRecorder _compositePromiseWithPromises:v6 resolvingResultFromPromise:v4];

  return v7;
}

- (NSMutableArray)eventListeners
{
  eventListeners = self->_eventListeners;
  if (!eventListeners)
  {
    int v4 = (NSMutableArray *)objc_opt_new();
    objc_super v5 = self->_eventListeners;
    self->_eventListeners = v4;

    eventListeners = self->_eventListeners;
  }

  return eventListeners;
}

- (MTEventRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTEventRecorderDelegate *)WeakRetained;
}

- (id)_flushUnreportedEventsUsingRecorder:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 flushUnreportedEvents];
  }
  else {
  int v4 = +[MTPromise promiseWithResult:&unk_26C96FD30];
  }

  return v4;
}

+ (id)_compositePromiseWithPromises:(id)a3 resolvingResultFromPromise:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v15[0] = v5;
  v15[1] = a3;
  objc_super v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:v15 count:2];
  id v9 = +[MTPromise promiseWithComposition:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__MTEventRecorder__compositePromiseWithPromises_resolvingResultFromPromise___block_invoke;
  v13[3] = &unk_26430F898;
  id v14 = v5;
  id v10 = v5;
  v11 = [v9 thenWithBlock:v13];

  return v11;
}

- (void)dealloc
{
  id v3 = +[MTFrameworkEnvironment sharedEnvironment];
  int v4 = [v3 isInternalBuild];

  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
  v6.receiver = self;
  v6.super_class = (Class)MTEventRecorder;
  [(MTEventRecorder *)&v6 dealloc];
}

- (void)addEventListener:(id)a3
{
  id v7 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MTObject *)v4 metricsKit];
    [v7 setMetricsKit:v5];
  }
  objc_super v6 = [(MTEventRecorder *)v4 eventListeners];
  [v6 addObject:v7];

  objc_sync_exit(v4);
}

- (void)removeEventListener:(id)a3
{
  id v6 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MTEventRecorder *)v4 eventListeners];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

uint64_t __40__MTEventRecorder_flushUnreportedEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _flushUnreportedEventsUsingRecorder:a2];
}

- (id)sendMethod
{
  id v3 = [(MTEventRecorder *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v12 = [(MTEventRecorder *)self delegate];
    v13 = [v12 sendMethod];
  }
  else
  {
    id v14 = MTUndelegatedMethodError((uint64_t)"-[MTEventRecorder sendMethod]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }

  return v13;
}

- (id)recordEvent:(id)a3
{
  return [(MTEventRecorder *)self recordEvent:a3 shouldSkipValidation:0];
}

- (id)recordEvent:(id)a3 toTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTEventRecorder *)self delegate];
  uint64_t v9 = [(MTEventRecorder *)self _recordEvent:v6 toTopic:v7 usingRecorder:v8];

  uint64_t v10 = [(MTEventRecorder *)self eventListeners];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__MTEventRecorder_recordEvent_toTopic___block_invoke;
  v16[3] = &unk_26430FC78;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  v13 = objc_msgSend(v10, "mt_map:", v16);

  id v14 = +[MTEventRecorder _compositePromiseWithPromises:v13 resolvingResultFromPromise:v9];

  return v14;
}

uint64_t __39__MTEventRecorder_recordEvent_toTopic___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recordEvent:*(void *)(a1 + 40) toTopic:*(void *)(a1 + 48) usingRecorder:a2];
}

- (id)recordEvent:(id)a3 shouldSkipValidation:(BOOL)a4
{
  id v6 = +[MTPromise promiseWithResult:a3];
  if (!a4)
  {
    id v7 = [MTFinalValidationFilter alloc];
    uint64_t v8 = [(MTObject *)self metricsKit];
    uint64_t v9 = [(MTObject *)v7 initWithMetricsKit:v8];

    uint64_t v10 = [(MTFinalValidationFilter *)v9 apply:v6];

    id v6 = (void *)v10;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke;
  v13[3] = &unk_26430F898;
  void v13[4] = self;
  id v11 = [v6 thenWithBlock:v13];

  return v11;
}

id __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 delegate];
  id v6 = [v4 _recordEvent:v3 usingRecorder:v5];

  id v7 = [*(id *)(a1 + 32) eventListeners];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke_2;
  v15 = &unk_26430FCA0;
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v3;
  id v8 = v3;
  uint64_t v9 = objc_msgSend(v7, "mt_map:", &v12);

  uint64_t v10 = +[MTEventRecorder _compositePromiseWithPromises:resolvingResultFromPromise:](MTEventRecorder, "_compositePromiseWithPromises:resolvingResultFromPromise:", v9, v6, v12, v13, v14, v15, v16);

  return v10;
}

uint64_t __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recordEvent:*(void *)(a1 + 40) usingRecorder:a2];
}

- (id)_recordEvent:(id)a3 usingRecorder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v7 shouldRecordEvent:v6] & 1) == 0)
  {
    uint64_t v12 = +[MTPromise promiseWithResult:&unk_26C96FD30];
  }
  else
  {
    id v8 = +[MTEventRecorder _metricsDataApplyingAllowlisting:v6 usingRecorder:v7];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [v7 recordEvent:v8];
    }
    else
    {
      uint64_t v10 = [(MTObject *)self metricsKit];
      id v11 = [v10 topic];
      uint64_t v9 = [(MTEventRecorder *)self _recordEvent:v8 toTopic:v11 usingRecorder:v7];
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __46__MTEventRecorder__recordEvent_usingRecorder___block_invoke;
    v14[3] = &unk_26430F7A8;
    id v15 = v6;
    uint64_t v12 = [v9 catchWithBlock:v14];
  }

  return v12;
}

id __46__MTEventRecorder__recordEvent_usingRecorder___block_invoke(uint64_t a1, void *a2)
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v13[0] = @"The event recorder failed to record the metrics data.";
  uint64_t v4 = *MEMORY[0x263F08338];
  v12[0] = v3;
  v12[1] = v4;
  id v5 = a2;
  id v6 = [v5 localizedDescription];
  v12[2] = @"MetricsData";
  uint64_t v7 = *(void *)(a1 + 32);
  v13[1] = v6;
  v13[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  uint64_t v9 = MTWrappedError(v5, 500, v8);

  uint64_t v10 = +[MTPromise promiseWithError:v9];

  return v10;
}

- (id)_recordEvent:(id)a3 toTopic:(id)a4 usingRecorder:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && ![v9 shouldRecordEvent:v7])
    {
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];
      uint64_t v17 = +[MTPromise promiseWithResult:v16];
    }
    else
    {
      uint64_t v16 = +[MTEventRecorder _metricsDataApplyingAllowlisting:v7 usingRecorder:v9];
      uint64_t v17 = [v9 recordEvent:v16 toTopic:v8];
    }
  }
  else
  {
    uint64_t v16 = MTConfigurationError(101, @"Required method 'recordEvent:toTopic' is not implemented on recorder '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    uint64_t v17 = +[MTPromise promiseWithError:v16];
  }
  id v18 = (void *)v17;

  return v18;
}

+ (id)_metricsDataApplyingAllowlisting:(id)a3 usingRecorder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 conformsToProtocol:&unk_26C97F2A0])
  {
    id v7 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v7 allowlistedFields];
      objc_msgSend(v5, "mt_removingKeys:", v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v5;
    }
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void)setEventListeners:(id)a3
{
}

- (BOOL)monitorsLifecycleEvents
{
  uint64_t v3 = [(MTEventRecorder *)self _amsDelegate];
  if (v3)
  {
    uint64_t v4 = [(MTEventRecorder *)self _amsDelegate];
    char v5 = [v4 monitorsLifecycleEvents];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(MTEventRecorder *)self _amsDelegate];

  if (v5)
  {
    id v6 = [(MTEventRecorder *)self _amsDelegate];
    [v6 setMonitorsLifecycleEvents:v3];
  }
}

- (id)_amsDelegate
{
  v2 = [(MTEventRecorder *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end