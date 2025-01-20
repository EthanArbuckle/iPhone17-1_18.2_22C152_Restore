@interface SCLSettingsSyncCoordinator
- (NSString)xpcActivityName;
- (NSURL)contextURL;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timerSource;
- (SCLScheduleSettings)schedule;
- (SCLSettingsSyncCoordinator)initWithFileURL:(id)a3 pairingID:(id)a4 schedule:(id)a5 queue:(id)a6;
- (SCLSettingsSyncStateMachine)stateMachine;
- (SCLSettingsSyncTransport)transport;
- (void)activate;
- (void)applySchedule:(id)a3;
- (void)beginActivity:(id)a3;
- (void)cancelCommitTimerForStateMachine:(id)a3;
- (void)cancelRetryActivityForStateMachine:(id)a3;
- (void)commitTimerFired;
- (void)didDeliverMessageWithIdentifier:(id)a3;
- (void)identifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (void)noteSignificantUserInteractionOccured;
- (void)performSyncForStateMachine:(id)a3;
- (void)registerActivityWithCriteria:(id)a3;
- (void)setTimerSource:(id)a3;
- (void)setTransport:(id)a3;
- (void)stateMachine:(id)a3 didTransitionFromState:(id)a4 toState:(id)a5;
- (void)stateMachine:(id)a3 scheduleCommitTimerWithInterval:(double)a4;
- (void)stateMachine:(id)a3 scheduleRetryWithActivityCriteria:(id)a4;
@end

@implementation SCLSettingsSyncCoordinator

- (SCLSettingsSyncCoordinator)initWithFileURL:(id)a3 pairingID:(id)a4 schedule:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SCLSettingsSyncCoordinator;
  v14 = [(SCLSettingsSyncCoordinator *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 URLByAppendingPathComponent:@"SettingsSyncContext.plist"];
    contextURL = v14->_contextURL;
    v14->_contextURL = (NSURL *)v15;

    objc_storeStrong((id *)&v14->_schedule, a5);
    objc_storeStrong((id *)&v14->_queue, a6);
    v17 = NSString;
    v18 = [v11 UUIDString];
    uint64_t v19 = [v17 stringWithFormat:@"com.apple.schooltimed.settingssync-%@", v18];
    xpcActivityName = v14->_xpcActivityName;
    v14->_xpcActivityName = (NSString *)v19;

    v21 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v14->_contextURL];
    if (v21)
    {
      v22 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v21 error:0];
    }
    else
    {
      v22 = 0;
    }
    v23 = [[SCLSettingsSyncStateMachine alloc] initWithContext:v22];
    stateMachine = v14->_stateMachine;
    v14->_stateMachine = v23;

    [(SCLSettingsSyncStateMachine *)v14->_stateMachine setDelegate:v14];
    [(SCLSettingsSyncCoordinator *)v14 registerActivityWithCriteria:*MEMORY[0x263EF8188]];
  }
  return v14;
}

- (void)activate
{
  id v2 = [(SCLSettingsSyncCoordinator *)self stateMachine];
  [v2 activate];
}

- (void)applySchedule:(id)a3
{
  id v4 = a3;
  v5 = [(SCLSettingsSyncCoordinator *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = (SCLScheduleSettings *)[v4 copy];
  schedule = self->_schedule;
  self->_schedule = v6;

  id v8 = [(SCLSettingsSyncCoordinator *)self stateMachine];
  [v8 settingsDidChange];
}

- (void)noteSignificantUserInteractionOccured
{
  v3 = [(SCLSettingsSyncCoordinator *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SCLSettingsSyncCoordinator *)self stateMachine];
  [v4 significantUserInteractionOccurred];
}

- (void)commitTimerFired
{
  v3 = [(SCLSettingsSyncCoordinator *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SCLSettingsSyncCoordinator *)self timerSource];
  dispatch_source_cancel(v4);

  [(SCLSettingsSyncCoordinator *)self setTimerSource:0];
  id v5 = [(SCLSettingsSyncCoordinator *)self stateMachine];
  [v5 commitSettings];
}

- (void)identifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v11 = a5;
  id v8 = a3;
  v9 = [(SCLSettingsSyncCoordinator *)self stateMachine];
  id v10 = v9;
  if (v5) {
    [v9 messageDidSend:v8];
  }
  else {
    [v9 message:v8 failedWithError:v11];
  }
}

- (void)didDeliverMessageWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSettingsSyncCoordinator *)self stateMachine];
  [v5 messageWasDelivered:v4];
}

- (void)beginActivity:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (_xpc_activity_s *)a3;
  id v5 = _os_activity_create(&dword_22B7B4000, "Settings Sync Activity", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = scl_transport_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(SCLSettingsSyncCoordinator *)self xpcActivityName];
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Begin sync activity %@", buf, 0xCu);
  }
  if (!xpc_activity_set_state(v4, 4))
  {
    id v8 = scl_persistence_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(SCLSettingsSyncCoordinator *)self xpcActivityName];
      [(SCLSettingsSyncCoordinator *)v9 beginActivity:v8];
    }
  }
  id v10 = [(SCLSettingsSyncCoordinator *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke;
  v12[3] = &unk_2648AC710;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_async(v10, v12);

  os_activity_scope_leave(&state);
}

void __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 xpcActivityStarted];

  if (!xpc_activity_set_state(*(xpc_activity_t *)(v1 + 8), 5))
  {
    v3 = scl_transport_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke_cold_1((id *)v1, v3);
    }
  }
}

- (void)stateMachine:(id)a3 didTransitionFromState:(id)a4 toState:(id)a5
{
  v6 = (void *)MEMORY[0x263F08910];
  v7 = [a3 context];
  id v16 = 0;
  id v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v16];
  id v9 = v16;

  if (v9)
  {
    id v10 = scl_transport_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SCLSettingsSyncCoordinator stateMachine:didTransitionFromState:toState:]((uint64_t)v9, v10);
    }
  }
  else
  {
    id v11 = [(SCLSettingsSyncCoordinator *)self contextURL];
    id v15 = 0;
    char v12 = [v8 writeToURL:v11 options:0x10000000 error:&v15];
    id v9 = v15;

    id v13 = scl_transport_log();
    id v10 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_22B7B4000, v10, OS_LOG_TYPE_INFO, "Saved state machine context", v14, 2u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      -[SCLSettingsSyncCoordinator stateMachine:didTransitionFromState:toState:]((uint64_t)v9, v10);
    }
  }
}

- (void)stateMachine:(id)a3 scheduleCommitTimerWithInterval:(double)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = scl_persistence_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithDouble:a4];
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_22B7B4000, v7, OS_LOG_TYPE_DEFAULT, "Sync coordinator start timer: %@", buf, 0xCu);
  }
  id v9 = [(SCLSettingsSyncCoordinator *)self timerSource];

  if (v9)
  {
    id v10 = [(SCLSettingsSyncCoordinator *)self timerSource];
    dispatch_source_cancel(v10);

    [(SCLSettingsSyncCoordinator *)self setTimerSource:0];
  }
  id v11 = [(SCLSettingsSyncCoordinator *)self timerSource];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    id v13 = [(SCLSettingsSyncCoordinator *)self queue];
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v13);
    [(SCLSettingsSyncCoordinator *)self setTimerSource:v14];
  }
  id v15 = [(SCLSettingsSyncCoordinator *)self timerSource];
  dispatch_time_t v16 = dispatch_walltime(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);

  objc_initWeak((id *)buf, self);
  uint64_t v17 = [(SCLSettingsSyncCoordinator *)self timerSource];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __75__SCLSettingsSyncCoordinator_stateMachine_scheduleCommitTimerWithInterval___block_invoke;
  handler[3] = &unk_2648AC4E0;
  objc_copyWeak(&v20, (id *)buf);
  dispatch_source_set_event_handler(v17, handler);

  v18 = [(SCLSettingsSyncCoordinator *)self timerSource];
  dispatch_resume(v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __75__SCLSettingsSyncCoordinator_stateMachine_scheduleCommitTimerWithInterval___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained commitTimerFired];
}

- (void)cancelCommitTimerForStateMachine:(id)a3
{
  id v4 = scl_persistence_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "Sync coordinator cancel tiemr", v7, 2u);
  }

  id v5 = [(SCLSettingsSyncCoordinator *)self timerSource];

  if (v5)
  {
    id v6 = [(SCLSettingsSyncCoordinator *)self timerSource];
    dispatch_source_cancel(v6);
  }
}

- (void)performSyncForStateMachine:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_22B7B4000, "Perform Settings Sync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = scl_persistence_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Sync coordinator perform sync", buf, 2u);
  }

  v7 = [(SCLSettingsSyncCoordinator *)self transport];
  id v8 = [(SCLSettingsSyncCoordinator *)self schedule];
  id v15 = 0;
  id v16 = 0;
  int v9 = [v7 sendSchedule:v8 identifier:&v16 error:&v15];
  id v10 = v16;
  id v11 = v15;

  if (v9)
  {
    BOOL v12 = scl_transport_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_22B7B4000, v12, OS_LOG_TYPE_DEFAULT, "Sent schedule settings with identifier %@", buf, 0xCu);
    }

    id v13 = [(SCLSettingsSyncCoordinator *)self stateMachine];
    [v13 didEnqueueMessage:v10];
  }
  else
  {
    dispatch_source_t v14 = scl_transport_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_22B7B4000, v14, OS_LOG_TYPE_DEFAULT, "Failed to send schedule settings with error: %@", buf, 0xCu);
    }

    id v13 = [(SCLSettingsSyncCoordinator *)self stateMachine];
    [v13 enqueueFailedWithError:v11];
  }

  os_activity_scope_leave(&state);
}

- (void)cancelRetryActivityForStateMachine:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = scl_persistence_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SCLSettingsSyncCoordinator *)self xpcActivityName];
    int v8 = 138412290;
    int v9 = v5;
    _os_log_impl(&dword_22B7B4000, v4, OS_LOG_TYPE_DEFAULT, "Sync coordinator cancel retry activity: %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [(SCLSettingsSyncCoordinator *)self xpcActivityName];
  v7 = (const char *)[v6 cStringUsingEncoding:4];

  xpc_activity_unregister(v7);
}

- (void)stateMachine:(id)a3 scheduleRetryWithActivityCriteria:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = scl_persistence_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "Sync coordinator schedule retry activity %@", (uint8_t *)&v7, 0xCu);
  }

  [(SCLSettingsSyncCoordinator *)self registerActivityWithCriteria:v5];
}

- (void)registerActivityWithCriteria:(id)a3
{
  id v4 = a3;
  id v5 = [(SCLSettingsSyncCoordinator *)self xpcActivityName];
  objc_initWeak(&location, self);
  id v6 = v5;
  int v7 = (const char *)[v6 cStringUsingEncoding:4];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke;
  handler[3] = &unk_2648ACBF0;
  id v8 = v6;
  id v10 = v8;
  objc_copyWeak(&v11, &location);
  xpc_activity_register(v7, v4, handler);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = a2;
  if (!xpc_activity_get_state(v3))
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(v3);
    if (v5) {
      goto LABEL_13;
    }
    id v6 = scl_transport_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_22B7B4000, v6, OS_LOG_TYPE_DEFAULT, "No existing activity for checkin %@", (uint8_t *)&v11, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  xpc_object_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained beginActivity:v3];
    goto LABEL_13;
  }
  id v8 = scl_transport_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_2(a1, v8, v9);
  }

  if (!xpc_activity_set_state(v3, 5))
  {
    id v6 = scl_transport_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_1(a1, v6, v10);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (SCLScheduleSettings)schedule
{
  return self->_schedule;
}

- (SCLSettingsSyncTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);
  return (SCLSettingsSyncTransport *)WeakRetained;
}

- (void)setTransport:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SCLSettingsSyncStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (NSURL)contextURL
{
  return self->_contextURL;
}

- (NSString)xpcActivityName
{
  return self->_xpcActivityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityName, 0);
  objc_storeStrong((id *)&self->_contextURL, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_schedule, 0);
}

- (void)beginActivity:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_22B7B4000, a3, (uint64_t)a3, "Failed to move activity %@ to CONTINUE state", (uint8_t *)a2);
}

void __44__SCLSettingsSyncCoordinator_beginActivity___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [*a1 xpcActivityName];
  int v5 = 138412290;
  id v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_22B7B4000, a2, v4, "Failed to move activity %@ to DONE state", (uint8_t *)&v5);
}

- (void)stateMachine:(uint64_t)a1 didTransitionFromState:(NSObject *)a2 toState:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_FAULT, "Could not save state machine context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)stateMachine:(uint64_t)a1 didTransitionFromState:(NSObject *)a2 toState:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_FAULT, "Could not generate data for state machine context: %@", (uint8_t *)&v2, 0xCu);
}

void __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_22B7B4000, a2, a3, "Could not end %@", (uint8_t *)&v4);
}

void __59__SCLSettingsSyncCoordinator_registerActivityWithCriteria___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_22B7B4000, a2, a3, "Could not start activity %@", (uint8_t *)&v4);
}

@end