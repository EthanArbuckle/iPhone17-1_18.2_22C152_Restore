@interface SCLSchoolModeServer
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (OS_dispatch_source)timerSource;
- (OS_os_transaction)activeTransaction;
- (SCLSchedulingEngine)schedulingEngine;
- (SCLSchoolModeServer)initWithQueue:(id)a3 suppressionManager:(id)a4 wakeScheduler:(id)a5;
- (SCLSchoolModeWakeScheduler)wakeScheduler;
- (SCLState)currentState;
- (SCLSuppressSchoolModeAssertionManager)suppressionManager;
- (int)timeChangeToken;
- (void)_scheduleTimerForDate:(id)a3;
- (void)addObserver:(id)a3;
- (void)applySchedule:(id)a3;
- (void)assertionManager:(id)a3 didUpdateAssertionsStatus:(unint64_t)a4;
- (void)configureParameters:(id)a3 forSuppressionStatus:(unint64_t)a4;
- (void)handleLocaleChange;
- (void)handleSignificantTimeChange;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)schedulingEngine:(id)a3 didUpdateState:(id)a4 fromState:(id)a5 nextEvaluationDate:(id)a6;
- (void)setActive:(BOOL)a3;
- (void)setActiveTransaction:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSchedulingEngine:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setTimeChangeToken:(int)a3;
- (void)setTimerSource:(id)a3;
- (void)startWithScheduleSettings:(id)a3 shouldStartManuallyActive:(BOOL)a4;
- (void)timerFired;
@end

@implementation SCLSchoolModeServer

- (SCLSchoolModeServer)initWithQueue:(id)a3 suppressionManager:(id)a4 wakeScheduler:(id)a5
{
  v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SCLSchoolModeServer;
  v12 = [(SCLSchoolModeServer *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_targetQueue, a3);
    objc_storeStrong((id *)&v13->_suppressionManager, a4);
    objc_storeStrong((id *)&v13->_wakeScheduler, a5);
    uint64_t v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v17 = dispatch_queue_attr_make_initially_inactive(v16);

    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("com.apple.schooltime.schoolmodeserver", v17, v9);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;
  }
  return v13;
}

- (SCLState)currentState
{
  v2 = [(SCLSchoolModeServer *)self schedulingEngine];
  v3 = [v2 state];

  return (SCLState *)v3;
}

- (void)startWithScheduleSettings:(id)a3 shouldStartManuallyActive:(BOOL)a4
{
  id v6 = a3;
  v7 = [(SCLSchoolModeServer *)self targetQueue];
  dispatch_assert_queue_V2(v7);

  v8 = scl_framework_log();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = scl_framework_log();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "startWithScheduleSettings", (const char *)&unk_22B7E6621, (uint8_t *)&buf, 2u);
  }

  int out_token = -1;
  objc_initWeak(&buf, self);
  v12 = [(SCLSchoolModeServer *)self queue];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke;
  handler[3] = &unk_2648AC628;
  objc_copyWeak(&v23, &buf);
  notify_register_dispatch("SignificantTimeChangeNotification", &out_token, v12, handler);

  [(SCLSchoolModeServer *)self setTimeChangeToken:out_token];
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:self selector:sel_handleLocaleChange name:*MEMORY[0x263EFF458] object:0];

  uint64_t v14 = [(SCLSchoolModeServer *)self suppressionManager];
  [v14 addObserver:self];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_2;
  block[3] = &unk_2648AC678;
  id v18 = v6;
  v19 = self;
  BOOL v21 = a4;
  os_signpost_id_t v20 = v9;
  id v15 = v6;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
  dispatch_async((dispatch_queue_t)self->_queue, v16);
  dispatch_activate((dispatch_object_t)self->_queue);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&buf);
}

void __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleSignificantTimeChange];
}

void __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = scl_framework_log();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = scl_framework_log();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LODWORD(buf.opaque[0]) = 67109120;
    HIDWORD(buf.opaque[0]) = qos_class_self();
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "School Mode Server Initial Evaluation", "qosClass: 0x%x", (uint8_t *)&buf, 8u);
  }

  id v6 = [SCLSchedulingEngine alloc];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_6;
  v21[3] = &unk_2648AC650;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v22 = v7;
  uint64_t v23 = v8;
  os_signpost_id_t v9 = [(SCLSchedulingEngine *)v6 initWithParametersBlock:v21 shouldStartManuallyActive:*(unsigned __int8 *)(a1 + 56)];
  [(SCLSchedulingEngine *)v9 setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) setSchedulingEngine:v9];
  id v10 = _os_activity_create(&dword_22B7B4000, "School Mode Server Initial Evaluation", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  buf.opaque[0] = 0;
  buf.opaque[1] = 0;
  os_activity_scope_enter(v10, &buf);
  id v11 = scl_framework_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v20 = 0;
    _os_log_impl(&dword_22B7B4000, v11, OS_LOG_TYPE_DEFAULT, "Initial server evaluation", v20, 2u);
  }

  v12 = *(void **)(a1 + 40);
  v13 = [(SCLSchedulingEngine *)v9 state];
  uint64_t v14 = [(SCLSchedulingEngine *)v9 nextEvaluationDate];
  [v12 schedulingEngine:v9 didUpdateState:v13 fromState:0 nextEvaluationDate:v14];

  id v15 = scl_framework_log();
  dispatch_block_t v16 = v15;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)os_signpost_id_t v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v16, OS_SIGNPOST_INTERVAL_END, v3, "School Mode Server Initial Evaluation", (const char *)&unk_22B7E6621, v20, 2u);
  }

  v17 = scl_framework_log();
  id v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 48);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)os_signpost_id_t v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v18, OS_SIGNPOST_INTERVAL_END, v19, "startWithScheduleSettings", (const char *)&unk_22B7E6621, v20, 2u);
  }

  os_activity_scope_leave(&buf);
}

void __75__SCLSchoolModeServer_startWithScheduleSettings_shouldStartManuallyActive___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setScheduleSettings:v3];
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v4 setCalendar:v5];

  id v6 = [MEMORY[0x263EFF910] date];
  [v4 setEvaluationDate:v6];

  id v7 = *(void **)(a1 + 40);
  id v8 = [v7 suppressionManager];
  objc_msgSend(v7, "configureParameters:forSuppressionStatus:", v4, objc_msgSend(v8, "status"));
}

- (void)invalidate
{
  if ([(SCLSchoolModeServer *)self timeChangeToken] != -1) {
    notify_cancel([(SCLSchoolModeServer *)self timeChangeToken]);
  }
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFF458] object:0];

  id v4 = [(SCLSchoolModeServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SCLSchoolModeServer_invalidate__block_invoke;
  block[3] = &unk_2648AC6A0;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __33__SCLSchoolModeServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleTimerForDate:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(SCLSchoolModeServer *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SCLSchoolModeServer *)self observers];
  [v6 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(SCLSchoolModeServer *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SCLSchoolModeServer *)self observers];
  [v6 removeObject:v4];
}

- (void)setActive:(BOOL)a3
{
  v5 = [(SCLSchoolModeServer *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SCLSchoolModeServer_setActive___block_invoke;
  v7[3] = &unk_2648AC6E8;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  dispatch_async(v5, v6);
}

void __33__SCLSchoolModeServer_setActive___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) schedulingEngine];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__SCLSchoolModeServer_setActive___block_invoke_2;
  v3[3] = &__block_descriptor_33_e35_v16__0___SCLSchedulingParameters__8l;
  char v4 = *(unsigned char *)(a1 + 40);
  [v2 updateParametersWithBlock:v3];
}

void __33__SCLSchoolModeServer_setActive___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  id v3 = a2;
  [v3 setActivationSetting:v2];
  id v4 = [MEMORY[0x263EFF910] date];
  [v3 setEvaluationDate:v4];
}

- (void)applySchedule:(id)a3
{
  id v4 = a3;
  v5 = [(SCLSchoolModeServer *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SCLSchoolModeServer_applySchedule___block_invoke;
  v8[3] = &unk_2648AC710;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8);
  dispatch_async(v5, v7);
}

void __37__SCLSchoolModeServer_applySchedule___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) schedulingEngine];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SCLSchoolModeServer_applySchedule___block_invoke_2;
  v3[3] = &unk_2648AC5E0;
  id v4 = *(id *)(a1 + 40);
  [v2 updateParametersWithBlock:v3];
}

void __37__SCLSchoolModeServer_applySchedule___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v5 = a2;
  id v4 = [v3 date];
  [v5 setEvaluationDate:v4];

  [v5 setScheduleSettings:*(void *)(a1 + 32)];
}

- (void)handleSignificantTimeChange
{
  id v3 = [(SCLSchoolModeServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SCLSchoolModeServer *)self schedulingEngine];
  [v4 updateParametersWithBlock:&__block_literal_global_4];
}

void __50__SCLSchoolModeServer_handleSignificantTimeChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  id v4 = [v2 date];
  [v3 setEvaluationDate:v4];

  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v3 setCalendar:v5];
}

- (void)handleLocaleChange
{
  id v3 = [(SCLSchoolModeServer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCLSchoolModeServer_handleLocaleChange__block_invoke;
  block[3] = &unk_2648AC6A0;
  void block[4] = self;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v3, v4);
}

void __41__SCLSchoolModeServer_handleLocaleChange__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) schedulingEngine];
  [v1 updateParametersWithBlock:&__block_literal_global_12];
}

void __41__SCLSchoolModeServer_handleLocaleChange__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  dispatch_block_t v4 = [v2 date];
  [v3 setEvaluationDate:v4];

  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v3 setCalendar:v5];
}

- (void)timerFired
{
  id v3 = [(SCLSchoolModeServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(SCLSchoolModeServer *)self schedulingEngine];
  dispatch_block_t v4 = [MEMORY[0x263EFF910] date];
  [v5 reevaluateStateAtDate:v4];
}

- (void)_scheduleTimerForDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_timerSource)
  {
    id v5 = scl_framework_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_INFO, "Cancelling timer", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timerSource);
    timerSource = self->_timerSource;
    self->_timerSource = 0;
  }
  if (v4)
  {
    dispatch_block_t v7 = (OS_os_transaction *)os_transaction_create();
    activeTransaction = self->_activeTransaction;
    self->_activeTransaction = v7;

    id v9 = scl_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = NSNumber;
      [v4 timeIntervalSinceNow];
      *(float *)&double v11 = v11;
      *(float *)&double v11 = roundf(*(float *)&v11);
      v12 = [v10 numberWithFloat:v11];
      v13 = self->_activeTransaction;
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_22B7B4000, v9, OS_LOG_TYPE_INFO, "Setting timer for duration: %@ with transaction %@", buf, 0x16u);
    }
    [(SCLSchoolModeWakeScheduler *)self->_wakeScheduler scheduleWakeForDate:v4];
    uint64_t v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    id v15 = self->_timerSource;
    self->_timerSource = v14;

    dispatch_block_t v16 = self->_timerSource;
    [v4 timeIntervalSinceNow];
    dispatch_time_t v18 = dispatch_walltime(0, (uint64_t)(v17 * 1000000000.0));
    dispatch_source_set_timer(v16, v18, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    objc_initWeak((id *)buf, self);
    os_signpost_id_t v19 = self->_timerSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __45__SCLSchoolModeServer__scheduleTimerForDate___block_invoke;
    handler[3] = &unk_2648AC4E0;
    objc_copyWeak(&v22, (id *)buf);
    dispatch_source_set_event_handler(v19, handler);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(SCLSchoolModeWakeScheduler *)self->_wakeScheduler cancelWake];
    os_signpost_id_t v20 = self->_activeTransaction;
    self->_activeTransaction = 0;
  }
}

void __45__SCLSchoolModeServer__scheduleTimerForDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained timerFired];
}

- (void)schedulingEngine:(id)a3 didUpdateState:(id)a4 fromState:(id)a5 nextEvaluationDate:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(SCLSchoolModeServer *)self targetQueue];
  dispatch_assert_queue_V2(v12);

  [(SCLSchoolModeServer *)self _scheduleTimerForDate:v11];
  if (([v9 isEqual:v10] & 1) == 0)
  {
    v13 = [(SCLSchoolModeServer *)self observers];
    uint64_t v14 = [v13 allObjects];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "server:didUpdateState:fromState:", self, v9, v10, (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (void)assertionManager:(id)a3 didUpdateAssertionsStatus:(unint64_t)a4
{
  id v6 = [(SCLSchoolModeServer *)self targetQueue];
  dispatch_assert_queue_V2(v6);

  dispatch_block_t v7 = [(SCLSchoolModeServer *)self schedulingEngine];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SCLSchoolModeServer_assertionManager_didUpdateAssertionsStatus___block_invoke;
  v8[3] = &unk_2648AC758;
  v8[4] = self;
  void v8[5] = a4;
  [v7 updateParametersWithBlock:v8];
}

void __66__SCLSchoolModeServer_assertionManager_didUpdateAssertionsStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v5 = a2;
  id v4 = [v3 date];
  [v5 setEvaluationDate:v4];

  [*(id *)(a1 + 32) configureParameters:v5 forSuppressionStatus:*(void *)(a1 + 40)];
}

- (void)configureParameters:(id)a3 forSuppressionStatus:(unint64_t)a4
{
  [a3 setSuppressed:a4 == 1];
}

- (SCLSuppressSchoolModeAssertionManager)suppressionManager
{
  return self->_suppressionManager;
}

- (SCLSchoolModeWakeScheduler)wakeScheduler
{
  return self->_wakeScheduler;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

- (int)timeChangeToken
{
  return self->_timeChangeToken;
}

- (void)setTimeChangeToken:(int)a3
{
  self->_timeChangeToken = a3;
}

- (SCLSchedulingEngine)schedulingEngine
{
  return (SCLSchedulingEngine *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSchedulingEngine:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (OS_os_transaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_schedulingEngine, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_wakeScheduler, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

@end