@interface SCLSchoolModeCoordinator
- (BOOL)applySchedule:(id)a3 error:(id *)a4;
- (BOOL)applySchedule:(id)a3 forInitialSync:(BOOL)a4 error:(id *)a5;
- (BOOL)isReady;
- (BOOL)setActive:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSMutableSet)clients;
- (NSURL)directoryURL;
- (NSURL)scheduleURL;
- (SCLActiveDurationAnalyticsSource)activeDurationAnalyticsSource;
- (SCLPersistentSettings)persistentSettings;
- (SCLScheduleSettings)scheduleSettings;
- (SCLSchoolModeCoordinator)initWithConfiguration:(id)a3;
- (SCLSchoolModeCoordinatorConfiguration)configuration;
- (SCLSettingsSyncCoordinator)settingsSyncCoordinator;
- (SCLState)currentState;
- (SCLUnlockHistoryItem)pendingUnlockItem;
- (id)_configuration;
- (id)historyStore;
- (id)idsDevice;
- (id)nrDevice;
- (id)server;
- (id)transportController;
- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3;
- (unint64_t)stateHandle;
- (void)_checkIfClassCDataIsAvailable;
- (void)_classCDataIsAvailable;
- (void)_createSchoolTimeDirectoryIfNeeded;
- (void)_lock_loadPersistentSchedule;
- (void)_lock_updatePersistentSettingsWithBlock:(id)a3;
- (void)_noteHistoryDidUpdate;
- (void)_persistSettings:(id)a3;
- (void)_registerForFirstUnlockIfNeeded;
- (void)_requestRemoteScheduleSettingsIfNeeded;
- (void)_updateClientsWithSchedule:(id)a3 notify:(BOOL)a4;
- (void)activateSettingsSyncCoordinatorWithSettings:(id)a3;
- (void)addClient:(id)a3;
- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteHistoryWithCompletion:(id)a3;
- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3;
- (void)purgeOldHistoryItems;
- (void)removeClient:(id)a3;
- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5;
- (void)setPendingUnlockItem:(id)a3;
- (void)setPersistentSettings:(id)a3;
- (void)setSettingsSyncCoordinator:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)transportController:(id)a3 didReceiveSchedule:(id)a4 forInitialSync:(BOOL)a5;
- (void)transportController:(id)a3 didReceiveUnlockHistoryItem:(id)a4;
@end

@implementation SCLSchoolModeCoordinator

- (SCLSchoolModeCoordinator)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SCLSchoolModeCoordinator;
  v5 = [(SCLSchoolModeCoordinator *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (SCLSchoolModeCoordinatorConfiguration *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    clients = v5->_clients;
    v5->_clients = v8;

    uint64_t v10 = [(SCLSchoolModeCoordinatorConfiguration *)v5->_configuration directoryURL];
    directoryURL = v5->_directoryURL;
    v5->_directoryURL = (NSURL *)v10;

    uint64_t v12 = [(NSURL *)v5->_directoryURL URLByAppendingPathComponent:@"ScheduleSettings.dat"];
    scheduleURL = v5->_scheduleURL;
    v5->_scheduleURL = (NSURL *)v12;

    v14 = [[SCLState alloc] initWithActiveState:0 scheduleEnabled:0 inSchedule:0];
    currentState = v5->_currentState;
    v5->_currentState = v14;

    v16 = [[SCLActiveDurationAnalyticsSource alloc] initWithInitialState:v5->_currentState];
    activeDurationAnalyticsSource = v5->_activeDurationAnalyticsSource;
    v5->_activeDurationAnalyticsSource = v16;

    v18 = [v4 server];
    v19 = v18;
    if (v18) {
      [v18 addObserver:v5];
    }
    v20 = [(SCLSchoolModeCoordinatorConfiguration *)v5->_configuration transportController];
    [v20 setDelegate:v5];

    [(SCLSchoolModeCoordinator *)v5 _createSchoolTimeDirectoryIfNeeded];
    [(SCLSchoolModeCoordinator *)v5 _registerForFirstUnlockIfNeeded];
    objc_initWeak(&location, v5);
    v21 = [v4 targetQueue];
    objc_copyWeak(&v23, &location);
    v5->_stateHandle = os_state_add_handler();

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v5;
}

uint64_t __50__SCLSchoolModeCoordinator_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained stateDataWithHints:a2];

  return v4;
}

- (void)dealloc
{
  v3 = [(SCLSchoolModeCoordinator *)self _configuration];
  uint64_t v4 = [v3 server];

  [v4 removeObserver:self];
  [v4 invalidate];
  int firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1) {
    notify_cancel(firstUnlockToken);
  }
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)SCLSchoolModeCoordinator;
  [(SCLSchoolModeCoordinator *)&v6 dealloc];
}

- (os_state_data_s)stateDataWithHints:(os_state_hints_s *)a3
{
  uint64_t v4 = [(SCLSchoolModeCoordinator *)self configuration];
  v5 = [v4 targetQueue];
  dispatch_assert_queue_V2(v5);

  objc_super v6 = [MEMORY[0x263F29C40] builderWithObject:self];
  v7 = [(SCLSchoolModeCoordinator *)self configuration];
  v8 = [v7 NRDevice];
  v9 = [v8 pairingID];
  id v10 = (id)[v6 appendObject:v9 withName:@"pairingID"];

  v11 = [(SCLSchoolModeCoordinator *)self configuration];
  uint64_t v12 = [v11 idsDevice];
  v13 = [v12 uniqueIDOverride];
  id v14 = (id)[v6 appendObject:v13 withName:@"IDSDeviceID"];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__SCLSchoolModeCoordinator_stateDataWithHints___block_invoke;
  v20[3] = &unk_2648AC710;
  id v21 = v6;
  v22 = self;
  id v15 = v6;
  [v15 appendBodySectionWithName:0 multilinePrefix:0 block:v20];
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"SCLSchooolModeCoordinator %p", self);
  v17 = [v15 build];
  v18 = (os_state_data_s *)SCLSStateDataWithTitleDescriptionAndHints(v16, (uint64_t)v17);

  return v18;
}

void __47__SCLSchoolModeCoordinator_stateDataWithHints___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) persistentSettings];
  uint64_t v4 = [v3 scheduleSettings];
  id v5 = (id)[v2 appendObject:v4 withName:@"schedule"];

  objc_super v6 = [*(id *)(a1 + 40) configuration];
  v7 = [v6 server];

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    id v12 = [*(id *)(a1 + 40) configuration];
    v9 = [v12 server];
    id v10 = [v9 currentState];
    id v11 = (id)[v8 appendObject:v10 withName:@"serverState"];
  }
}

- (void)_createSchoolTimeDirectoryIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "Could not create SchoolTime folder at %@; %@");
}

- (void)_lock_loadPersistentSchedule
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to load schedule settings from data: %@", v2, v3, v4, v5, v6);
}

- (void)_requestRemoteScheduleSettingsIfNeeded
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22B7B4000, v0, v1, "Already requested schedule settings for pairingID %@", v2, v3, v4, v5, v6);
}

- (void)_classCDataIsAvailable
{
  uint64_t v3 = [(SCLSchoolModeCoordinator *)self configuration];
  uint64_t v4 = [v3 targetQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = scl_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_22B7B4000, v5, OS_LOG_TYPE_INFO, "Class C Data is available", v15, 2u);
  }

  self->_hasReceivedFirstUnlock = 1;
  int firstUnlockToken = self->_firstUnlockToken;
  if (firstUnlockToken != -1)
  {
    notify_cancel(firstUnlockToken);
    self->_int firstUnlockToken = -1;
  }
  [(SCLSchoolModeCoordinator *)self _lock_loadPersistentSchedule];
  v7 = [(SCLSchoolModeCoordinator *)self configuration];
  v8 = [v7 historyStore];
  [v8 loadStore];

  v9 = [(SCLSchoolModeCoordinator *)self persistentSettings];
  id v10 = [(SCLSchoolModeCoordinator *)self configuration];
  id v11 = [v10 server];

  id v12 = [v9 scheduleSettings];
  v13 = [(SCLSchoolModeCoordinator *)self configuration];
  int v14 = [v13 sendsRemoteScheduleSettings];

  if (v14) {
    [(SCLSchoolModeCoordinator *)self activateSettingsSyncCoordinatorWithSettings:v12];
  }
  [(SCLSchoolModeCoordinator *)self _updateClientsWithSchedule:v12 notify:0];
  objc_msgSend(v11, "startWithScheduleSettings:shouldStartManuallyActive:", v12, objc_msgSend(v9, "isManualSchoolModeEnabled"));
  self->_ready = 1;
}

- (void)activateSettingsSyncCoordinatorWithSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCLSchoolModeCoordinator *)self configuration];
  uint8_t v6 = [v5 NRDevice];
  id v16 = [v6 pairingID];

  v7 = [(SCLSchoolModeCoordinator *)self configuration];
  v8 = [v7 targetQueue];

  v9 = [[SCLSettingsSyncCoordinator alloc] initWithFileURL:self->_directoryURL pairingID:v16 schedule:v4 queue:v8];
  settingsSyncCoordinator = self->_settingsSyncCoordinator;
  self->_settingsSyncCoordinator = v9;

  id v11 = [(SCLSchoolModeCoordinator *)self configuration];
  id v12 = [v11 transportController];
  [v12 setSettingsSyncCoordinator:self->_settingsSyncCoordinator];

  v13 = self->_settingsSyncCoordinator;
  int v14 = [(SCLSchoolModeCoordinator *)self configuration];
  id v15 = [v14 transportController];
  [(SCLSettingsSyncCoordinator *)v13 setTransport:v15];

  [(SCLSettingsSyncCoordinator *)self->_settingsSyncCoordinator activate];
}

- (void)_checkIfClassCDataIsAvailable
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_22B7B4000, log, OS_LOG_TYPE_DEBUG, "Device has been unlocked. Immediately handling classC data", v1, 2u);
}

- (void)_registerForFirstUnlockIfNeeded
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22B7B4000, log, OS_LOG_TYPE_ERROR, "Could not register for first unlock notifications: %@", buf, 0xCu);
}

void __59__SCLSchoolModeCoordinator__registerForFirstUnlockIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = scl_framework_log();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = scl_framework_log();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SchoolTimeMobileKeybagUnlock", (const char *)&unk_22B7E6621, buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SCLSchoolModeCoordinator__registerForFirstUnlockIfNeeded__block_invoke_41;
  block[3] = &unk_2648AC6A0;
  id v7 = WeakRetained;
  id v12 = v7;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), v8);
  v9 = scl_framework_log();
  id v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v10, OS_SIGNPOST_INTERVAL_END, v3, "SchoolTimeMobileKeybagUnlock", (const char *)&unk_22B7E6621, buf, 2u);
  }
}

void __59__SCLSchoolModeCoordinator__registerForFirstUnlockIfNeeded__block_invoke_41(uint64_t a1)
{
  uint64_t v2 = scl_framework_log();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  id v4 = scl_framework_log();
  uint64_t v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SchoolTimeClassCAvailable", (const char *)&unk_22B7E6621, buf, 2u);
  }

  [*(id *)(a1 + 32) _classCDataIsAvailable];
  uint8_t v6 = scl_framework_log();
  id v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)dispatch_block_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_22B7B4000, v7, OS_SIGNPOST_INTERVAL_END, v3, "SchoolTimeClassCAvailable", (const char *)&unk_22B7E6621, v8, 2u);
  }
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCLSchoolModeCoordinator *)self configuration];
  uint8_t v6 = [v5 targetQueue];
  dispatch_assert_queue_V2(v6);

  [v4 setCoordinator:self];
  [(SCLSchoolModeCoordinator *)self _checkIfClassCDataIsAvailable];
  id v7 = [(SCLSchoolModeCoordinator *)self clients];
  [v7 addObject:v4];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SCLSchoolModeCoordinator *)self configuration];
  uint8_t v6 = [v5 targetQueue];
  dispatch_assert_queue_V2(v6);

  [v4 setCoordinator:0];
  id v7 = [(SCLSchoolModeCoordinator *)self clients];
  [v7 removeObject:v4];
}

- (BOOL)applySchedule:(id)a3 error:(id *)a4
{
  return [(SCLSchoolModeCoordinator *)self applySchedule:a3 forInitialSync:0 error:a4];
}

- (BOOL)applySchedule:(id)a3 forInitialSync:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [(SCLSchoolModeCoordinator *)self configuration];
  id v10 = [v9 targetQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)[v8 copy];
  if (self->_hasReceivedFirstUnlock)
  {
    if (v6
      && ([(SCLPersistentSettings *)self->_persistentSettings scheduleSettings],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 schedule],
          v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 isMemberOfClass:objc_opt_class()],
          v13,
          v12,
          (v14 & 1) == 0))
    {
      if (a5)
      {
        v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v38 = *MEMORY[0x263F08320];
        v39 = @"Cannot overwrite existing schedule for initial sync.";
        v24 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        v26 = v29;
        uint64_t v27 = 7;
        goto LABEL_17;
      }
    }
    else
    {
      id v15 = [v11 schedule];
      int v16 = [v15 isValid];

      if (v16)
      {
        v17 = scl_persistence_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[SCLSchoolModeCoordinator applySchedule:forInitialSync:error:]();
        }

        uint64_t v31 = MEMORY[0x263EF8330];
        uint64_t v32 = 3221225472;
        v33 = __63__SCLSchoolModeCoordinator_applySchedule_forInitialSync_error___block_invoke;
        v34 = &unk_2648AC948;
        id v18 = v11;
        id v35 = v18;
        [(SCLSchoolModeCoordinator *)self _lock_updatePersistentSettingsWithBlock:&v31];
        v19 = [(SCLSchoolModeCoordinator *)self server];
        [v19 applySchedule:v18];

        v20 = [(SCLSchoolModeCoordinator *)self configuration];
        int v21 = [v20 sendsRemoteScheduleSettings];

        if (v21 && !v6)
        {
          v22 = [(SCLSchoolModeCoordinator *)self settingsSyncCoordinator];
          [v22 applySchedule:v18];
        }
        BOOL v23 = 1;
        [(SCLSchoolModeCoordinator *)self _updateClientsWithSchedule:v18 notify:1];
        v24 = v35;
        goto LABEL_18;
      }
      if (a5)
      {
        v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v36 = *MEMORY[0x263F08320];
        v37 = @"The schedule is invalid";
        v24 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v26 = v28;
        uint64_t v27 = 3;
        goto LABEL_17;
      }
    }
LABEL_19:
    BOOL v23 = 0;
    goto LABEL_20;
  }
  if (!a5) {
    goto LABEL_19;
  }
  objc_super v25 = (void *)MEMORY[0x263F087E8];
  uint64_t v40 = *MEMORY[0x263F08320];
  v41[0] = @"Schedule cannot be set before first unlock.";
  v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
  v26 = v25;
  uint64_t v27 = 6;
LABEL_17:
  [v26 errorWithDomain:@"com.apple.schooltime" code:v27 userInfo:v24];
  BOOL v23 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_20:
  return v23;
}

uint64_t __63__SCLSchoolModeCoordinator_applySchedule_forInitialSync_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setScheduleSettings:*(void *)(a1 + 32)];
}

- (void)_updateClientsWithSchedule:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SCLSchoolModeCoordinator *)self configuration];
  id v8 = [v7 targetQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(SCLSchoolModeCoordinator *)self clients];
  id v10 = (void *)[v9 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "didUpdateScheduleSettings:notify:", v6, v4, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(SCLSchoolModeCoordinator *)self configuration];
  id v8 = [v7 targetQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [(SCLSchoolModeCoordinator *)self historyStore];
  uint64_t v10 = [v9 insertItem:v13];

  v6[2](v6, v10, 0);
  [(SCLSchoolModeCoordinator *)self _noteHistoryDidUpdate];
  id v11 = [(SCLSchoolModeCoordinator *)self configuration];
  LODWORD(v9) = [v11 sendsRemoteHistoryItems];

  if (v9)
  {
    uint64_t v12 = [(SCLSchoolModeCoordinator *)self transportController];
    [v12 addUnlockHistoryItem:v13];
  }
}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  uint64_t v5 = [(SCLSchoolModeCoordinator *)self configuration];
  id v6 = [v5 targetQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(SCLSchoolModeCoordinator *)self historyStore];
  uint64_t v8 = [v7 recentHistoryItems];

  if (v8) {
    v9 = (void *)v8;
  }
  else {
    v9 = (void *)MEMORY[0x263EFFA68];
  }
  id v10 = v9;
  v4[2](v4);
}

- (BOOL)setActive:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6 = a4;
  BOOL v7 = a3;
  v20[1] = *MEMORY[0x263EF8340];
  v9 = [(SCLSchoolModeCoordinator *)self configuration];
  id v10 = [v9 targetQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(SCLSchoolModeCoordinator *)self server];
  uint64_t v12 = [v11 currentState];

  if ((v6 & 1) != 0 && v7 && ([v12 isInSchedule] & 1) == 0)
  {
    if (!a5)
    {
      BOOL v16 = 0;
      goto LABEL_12;
    }
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Activation was rejected because Schooltime is no longer in schedule.";
    id v15 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.schooltime" code:8 userInfo:v15];
    BOOL v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = [(SCLSchoolModeCoordinator *)self server];
    [v13 setActive:v7];

    uint64_t v14 = [(SCLSchoolModeCoordinator *)self configuration];
    id v15 = [v14 NRDevice];

    BOOL v16 = 1;
    if (v7 && v15 && ![v12 activeState] && (objc_msgSend(v12, "isInSchedule") & 1) == 0)
    {
      id v15 = v15;
      id v18 = v12;
      AnalyticsSendEventLazy();
    }
  }

LABEL_12:
  return v16;
}

id __52__SCLSchoolModeCoordinator_setActive_options_error___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"isAltAccount";
  uint64_t v2 = NSNumber;
  os_signpost_id_t v3 = [*(id *)(a1 + 32) valueForProperty:*MEMORY[0x263F575B0]];
  BOOL v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
  v8[1] = @"scheduleEnabled";
  v9[0] = v4;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isScheduleEnabled"));
  v9[1] = v5;
  char v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (void)deleteHistoryWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, uint64_t, id))a3;
  uint64_t v5 = [(SCLSchoolModeCoordinator *)self configuration];
  char v6 = [v5 targetQueue];
  dispatch_assert_queue_V2(v6);

  BOOL v7 = [(SCLSchoolModeCoordinator *)self historyStore];
  id v10 = 0;
  uint64_t v8 = [v7 deleteHistory:&v10];
  id v9 = v10;

  v4[2](v4, v8, v9);
  [(SCLSchoolModeCoordinator *)self _noteHistoryDidUpdate];
}

- (void)purgeOldHistoryItems
{
  os_signpost_id_t v3 = [(SCLSchoolModeCoordinator *)self configuration];
  BOOL v4 = [v3 targetQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SCLSchoolModeCoordinator *)self historyStore];
  [v5 purgeOldItems];
}

- (void)_noteHistoryDidUpdate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_signpost_id_t v3 = [(SCLSchoolModeCoordinator *)self configuration];
  BOOL v4 = [v3 targetQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)[(NSMutableSet *)self->_clients copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "unlockHistoryDidChange", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_lock_updatePersistentSettingsWithBlock:(id)a3
{
  BOOL v4 = (void (**)(id, SCLPersistentSettings *))a3;
  id v5 = [(SCLSchoolModeCoordinator *)self configuration];
  id v6 = [v5 targetQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(SCLSchoolModeCoordinator *)self persistentSettings];
  uint64_t v8 = (SCLPersistentSettings *)[(id)v7 copy];

  v4[2](v4, v8);
  uint64_t v9 = [(SCLSchoolModeCoordinator *)self persistentSettings];
  LOBYTE(v7) = [(SCLPersistentSettings *)v8 isEqual:v9];

  if ((v7 & 1) == 0) {
    [(SCLSchoolModeCoordinator *)self _persistSettings:v8];
  }
  persistentSettings = self->_persistentSettings;
  self->_persistentSettings = v8;
}

- (void)_persistSettings:(id)a3
{
  id v4 = a3;
  id v13 = 0;
  id v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
  id v6 = v13;
  uint64_t v7 = scl_persistence_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SCLSchoolModeCoordinator _persistSettings:](v4, v7);
  }

  if (!v5)
  {
    long long v11 = scl_persistence_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCLSchoolModeCoordinator _persistSettings:]();
    }
    id v10 = v6;
    goto LABEL_10;
  }
  scheduleURL = self->_scheduleURL;
  id v12 = v6;
  char v9 = [v5 writeToURL:scheduleURL options:1073741825 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    long long v11 = scl_persistence_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCLSchoolModeCoordinator _persistSettings:]();
    }
LABEL_10:
  }
}

- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SCLSchoolModeCoordinator *)self configuration];
  long long v11 = [v10 targetQueue];
  dispatch_assert_queue_V2(v11);

  objc_storeStrong((id *)&self->_currentState, a4);
  id v12 = [(SCLSchoolModeCoordinator *)self clients];
  id v13 = (void *)[v12 copy];

  long long v14 = [(SCLSchoolModeCoordinator *)self pendingUnlockItem];
  if (v14)
  {
  }
  else if (SCLIsStateTransitionStartOfUnlockPeriod(v9, v8))
  {
    id v15 = [MEMORY[0x263EFF910] date];
    uint64_t v16 = [MEMORY[0x263EFF8F0] currentCalendar];
    long long v17 = [(SCLPersistentSettings *)self->_persistentSettings scheduleSettings];
    id v18 = [v17 recurrenceForActiveScheduleOnOrAfterDate:v15 calendar:v16];
    uint64_t v19 = v18;
    if (v18)
    {
      v20 = [v18 timeInterval];
      [v20 startTime];
      uint64_t v21 = v61 = v19;

      [v61 timeInterval];
      v22 = v58 = v17;
      BOOL v23 = [v22 endTime];

      v24 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v15 duration:0.0];
      [MEMORY[0x263EFFA18] localTimeZone];
      objc_super v25 = v57 = v15;
      v26 = v16;
      uint64_t v27 = [[SCLUnlockHistoryItem alloc] initWithInterval:v24 calendar:v16 timeZone:v25 startTime:v21 endTime:v23];
      [(SCLSchoolModeCoordinator *)self setPendingUnlockItem:v27];

      uint64_t v16 = v26;
      id v15 = v57;

      long long v17 = v58;
      uint64_t v19 = v61;
    }
    else
    {
      v45 = scl_framework_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        [v17 schedule];
        v54 = v53 = v15;
        [v54 recurrences];
        v60 = v17;
        v56 = v55 = v16;
        *(_DWORD *)buf = 138412802;
        v72 = v53;
        __int16 v73 = 2112;
        v74 = v55;
        __int16 v75 = 2112;
        v76 = v56;
        _os_log_fault_impl(&dword_22B7B4000, v45, OS_LOG_TYPE_FAULT, "Failed to find active schedule recurrence for unlock period at date %@ in calendar %@: %@", buf, 0x20u);

        id v15 = v53;
        uint64_t v16 = v55;
        long long v17 = v60;
      }
    }
LABEL_15:
    v28 = 0;
    goto LABEL_16;
  }
  v28 = [(SCLSchoolModeCoordinator *)self pendingUnlockItem];
  if (!v28) {
    goto LABEL_16;
  }
  int v29 = SCLIsStateTransitionEndOfUnlockPeriod(v9, v8);

  if (!v29) {
    goto LABEL_15;
  }
  v30 = [(SCLSchoolModeCoordinator *)self pendingUnlockItem];
  uint64_t v31 = [MEMORY[0x263EFF910] date];
  uint64_t v32 = [v30 unlockedInterval];
  v33 = [v32 startDate];
  [v31 timeIntervalSinceDate:v33];
  double v35 = v34;

  if (v35 < 0.0) {
    double v35 = 0.0;
  }
  id v36 = objc_alloc(MEMORY[0x263F08798]);
  v37 = [v30 unlockedInterval];
  uint64_t v38 = [v37 startDate];
  v62 = (void *)[v36 initWithStartDate:v38 duration:v35];

  v39 = [SCLUnlockHistoryItem alloc];
  v59 = [v30 calendar];
  uint64_t v40 = [v30 timeZone];
  v41 = [v30 scheduleStartTime];
  [v30 scheduleEndTime];
  id v42 = v8;
  v44 = v43 = v13;
  v28 = [(SCLUnlockHistoryItem *)v39 initWithInterval:v62 calendar:v59 timeZone:v40 startTime:v41 endTime:v44];

  id v13 = v43;
  id v8 = v42;

  [(SCLSchoolModeCoordinator *)self setPendingUnlockItem:0];
LABEL_16:
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __60__SCLSchoolModeCoordinator_server_didUpdateState_fromState___block_invoke;
  v68[3] = &unk_2648AC948;
  id v46 = v8;
  id v69 = v46;
  [(SCLSchoolModeCoordinator *)self _lock_updatePersistentSettingsWithBlock:v68];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v47 = v13;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v65 != v50) {
          objc_enumerationMutation(v47);
        }
        objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * i), "didUpdateState:fromState:", v46, v9, v57);
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v49);
  }

  if (v28)
  {
    [(SCLSchoolModeCoordinator *)self addUnlockHistoryItem:v28 completion:&__block_literal_global_7];
    v63 = v28;
    AnalyticsSendEventLazy();
  }
  v52 = [(SCLSchoolModeCoordinator *)self activeDurationAnalyticsSource];
  [v52 setCurrentState:v46];
}

void __60__SCLSchoolModeCoordinator_server_didUpdateState_fromState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([*(id *)(a1 + 32) isActive]) {
    uint64_t v3 = [*(id *)(a1 + 32) isInSchedule] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setManualSchoolModeEnabled:v3];
}

id __60__SCLSchoolModeCoordinator_server_didUpdateState_fromState___block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = @"UnlockDuration";
  uint64_t v1 = NSNumber;
  uint64_t v2 = [*(id *)(a1 + 32) unlockedInterval];
  [v2 duration];
  *(float *)&double v3 = v3;
  *(float *)&double v3 = roundf(*(float *)&v3);
  id v4 = [v1 numberWithFloat:v3];
  v8[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (SCLScheduleSettings)scheduleSettings
{
  double v3 = [(SCLSchoolModeCoordinator *)self configuration];
  id v4 = [v3 targetQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SCLPersistentSettings *)self->_persistentSettings scheduleSettings];
  id v6 = (void *)[v5 copy];

  return (SCLScheduleSettings *)v6;
}

- (void)transportController:(id)a3 didReceiveSchedule:(id)a4 forInitialSync:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = [(SCLSchoolModeCoordinator *)self configuration];
  id v9 = [(id)v8 targetQueue];
  dispatch_assert_queue_V2(v9);

  id v13 = 0;
  LOBYTE(v8) = [(SCLSchoolModeCoordinator *)self applySchedule:v7 forInitialSync:v5 error:&v13];
  id v10 = v13;
  long long v11 = scl_transport_log();
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SCLSchoolModeCoordinator transportController:didReceiveSchedule:forInitialSync:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[SCLSchoolModeCoordinator transportController:didReceiveSchedule:forInitialSync:]();
  }
}

- (void)transportController:(id)a3 didReceiveUnlockHistoryItem:(id)a4
{
  id v5 = a4;
  id v6 = [(SCLSchoolModeCoordinator *)self configuration];
  id v7 = [v6 targetQueue];
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke;
  void v9[3] = &unk_2648AC9C0;
  id v10 = v5;
  id v8 = v5;
  [(SCLSchoolModeCoordinator *)self addUnlockHistoryItem:v8 completion:v9];
}

void __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = scl_transport_log();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (id)transportController
{
  return [(SCLSchoolModeCoordinatorConfiguration *)self->_configuration transportController];
}

- (id)nrDevice
{
  return [(SCLSchoolModeCoordinatorConfiguration *)self->_configuration NRDevice];
}

- (id)idsDevice
{
  return [(SCLSchoolModeCoordinatorConfiguration *)self->_configuration idsDevice];
}

- (id)server
{
  return [(SCLSchoolModeCoordinatorConfiguration *)self->_configuration server];
}

- (id)historyStore
{
  return [(SCLSchoolModeCoordinatorConfiguration *)self->_configuration historyStore];
}

- (id)_configuration
{
  return self->_configuration;
}

- (SCLSchoolModeCoordinatorConfiguration)configuration
{
  return self->_configuration;
}

- (SCLState)currentState
{
  return self->_currentState;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSURL)scheduleURL
{
  return self->_scheduleURL;
}

- (SCLUnlockHistoryItem)pendingUnlockItem
{
  return self->_pendingUnlockItem;
}

- (void)setPendingUnlockItem:(id)a3
{
}

- (SCLPersistentSettings)persistentSettings
{
  return self->_persistentSettings;
}

- (void)setPersistentSettings:(id)a3
{
}

- (SCLSettingsSyncCoordinator)settingsSyncCoordinator
{
  return self->_settingsSyncCoordinator;
}

- (void)setSettingsSyncCoordinator:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (SCLActiveDurationAnalyticsSource)activeDurationAnalyticsSource
{
  return self->_activeDurationAnalyticsSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDurationAnalyticsSource, 0);
  objc_storeStrong((id *)&self->_settingsSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentSettings, 0);
  objc_storeStrong((id *)&self->_pendingUnlockItem, 0);
  objc_storeStrong((id *)&self->_scheduleURL, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)applySchedule:forInitialSync:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22B7B4000, v0, v1, "Apply schedule: %@", v2, v3, v4, v5, v6);
}

- (void)_persistSettings:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "Failed to create data for settings: %@ %@");
}

- (void)_persistSettings:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to write data for schedule: %@", v2, v3, v4, v5, v6);
}

- (void)_persistSettings:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = [a1 isManualSchoolModeEnabled];
  uint64_t v5 = [a1 scheduleSettings];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_debug_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_DEBUG, "Persist settings - manualSchoolModeEnabled: %{BOOL}u; schedule: %@",
    (uint8_t *)v6,
    0x12u);
}

- (void)transportController:didReceiveSchedule:forInitialSync:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_22B7B4000, v0, v1, "Applied remote schedule: %@", v2, v3, v4, v5, v6);
}

- (void)transportController:didReceiveSchedule:forInitialSync:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22B7B4000, v0, v1, "Failed to apply schedule %@ from remote source with error: %@");
}

void __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __76__SCLSchoolModeCoordinator_transportController_didReceiveUnlockHistoryItem___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22B7B4000, v0, v1, "Failed to add incoming remote history item: %@", v2, v3, v4, v5, v6);
}

@end