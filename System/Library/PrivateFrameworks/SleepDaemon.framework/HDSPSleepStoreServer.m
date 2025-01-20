@interface HDSPSleepStoreServer
- (HDSPEnvironment)environment;
- (HDSPProcessStateManager)processStateManager;
- (HDSPSleepStoreServer)initWithEnvironment:(id)a3;
- (HDSPSleepStoreServer)initWithEnvironment:(id)a3 connectionListenerProvider:(id)a4 processStateManager:(id)a5;
- (HKSPPersistentSyncAnchorContainer)syncAnchorContainer;
- (HKSPXPCConnectionListener)connectionListener;
- (id)_checkForSuspendedBlock;
- (id)diagnosticDescription;
- (id)diagnosticInfo;
- (id)eventIdentifiers;
- (void)_notifyClient:(id)a3 forMissedMessagesWithSyncAnchorContainer:(id)a4;
- (void)_performWhenClientIsReady:(id)a3 block:(id)a4;
- (void)_performWhenCurrentClientIsReady:(id)a3;
- (void)_performWhenEnvironmentIsReady:(id)a3;
- (void)_performWhenEnvironmentIsReady:(id)a3 withContext:(id)a4;
- (void)checkInWithSyncAnchorContainer:(id)a3 completion:(id)a4;
- (void)clearWidgetOverrideWithCompletion:(id)a3;
- (void)configureSleepFocusWithState:(unint64_t)a3 completion:(id)a4;
- (void)confirmAwakeWithCompletion:(id)a3;
- (void)connectWithCompletion:(id)a3;
- (void)connectionListenerDidAddClient:(id)a3;
- (void)connectionListenerDidRemoveClient:(id)a3;
- (void)createSleepFocusInState:(unint64_t)a3 completion:(id)a4;
- (void)deleteSleepFocusModeWithCompletion:(id)a3;
- (void)dismissGoodMorningWithCompletion:(id)a3;
- (void)dismissSleepLockWithCompletion:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)environmentWillInvalidate:(id)a3;
- (void)getSleepEventRecordWithCompletion:(id)a3;
- (void)getSleepModeWithCompletion:(id)a3;
- (void)getSleepScheduleModelWithCompletion:(id)a3;
- (void)getSleepScheduleStateWithCompletion:(id)a3;
- (void)getSleepScheduleWithCompletion:(id)a3;
- (void)getSleepSettingsWithCompletion:(id)a3;
- (void)getSleepWidgetStateWithCompletion:(id)a3;
- (void)processDidBecomeSuspended:(int)a3;
- (void)processNoLongerSuspended:(int)a3;
- (void)publishNotificationWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)publishWakeUpResultsNotificationWithCompletion:(id)a3;
- (void)saveSleepEventRecord:(id)a3 completion:(id)a4;
- (void)saveSleepSchedule:(id)a3 completion:(id)a4;
- (void)saveSleepSettings:(id)a3 completion:(id)a4;
- (void)setLockScreenOverrideState:(int64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)setSleepMode:(int64_t)a3 reason:(unint64_t)a4 completion:(id)a5;
- (void)setSyncAnchorContainer:(id)a3;
- (void)setWidgetOverrideState:(int64_t)a3 completion:(id)a4;
- (void)sleepAlarmWasDismissedOnDate:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)sleepAlarmWasModifiedFromSource:(unint64_t)a3 completion:(id)a4;
- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)sleepEventIsDue:(id)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepEventRecord:(id)a4;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSchedule:(id)a4;
- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSettings:(id)a4;
- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5;
- (void)startListening;
@end

@implementation HDSPSleepStoreServer

- (void)connectionListenerDidAddClient:(id)a3
{
  processStateManager = self->_processStateManager;
  uint64_t v4 = [a3 processID];

  [(HDSPProcessStateManager *)processStateManager startMonitoringProcessState:v4];
}

- (void)getSleepScheduleModelWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    v9 = [(HDSPSleepStoreServer *)self connectionListener];
    v8 = [v9 currentClient];

    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep schedule model from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__HDSPSleepStoreServer_getSleepScheduleModelWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

- (void)getSleepScheduleWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    v9 = [(HDSPSleepStoreServer *)self connectionListener];
    v8 = [v9 currentClient];

    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep schedule from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__HDSPSleepStoreServer_getSleepScheduleWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

void __55__HDSPSleepStoreServer_getSleepScheduleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v5 = v13;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep schedule from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  v7 = [v6 sleepScheduleModelManager];
  v8 = [v7 sleepSchedule];

  v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2114;
    id v15 = v3;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep schedule from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__HDSPSleepStoreServer_getSleepScheduleModelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v5 = v13;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep schedule model from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  v7 = [v6 sleepScheduleModelManager];
  v8 = [v7 sleepScheduleModel];

  v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2114;
    id v15 = v3;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep schedule model from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSleepSettingsWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    v9 = [(HDSPSleepStoreServer *)self connectionListener];
    v8 = [v9 currentClient];

    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep settings from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__HDSPSleepStoreServer_getSleepSettingsWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    __int16 v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

- (void)getSleepEventRecordWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    v9 = [(HDSPSleepStoreServer *)self connectionListener];
    v8 = [v9 currentClient];

    v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep event record from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__HDSPSleepStoreServer_getSleepEventRecordWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    __int16 v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

- (void)connectWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, void))a3;
  id v5 = [(HDSPSleepStoreServer *)self connectionListener];
  int v6 = [v5 currentClient];

  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    __int16 v14 = v6;
    id v8 = v12;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] connect received from %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v9 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  v10 = [v9 inMemoryCopy];
  v4[2](v4, v10, 0);
}

- (HKSPXPCConnectionListener)connectionListener
{
  return self->_connectionListener;
}

- (HKSPPersistentSyncAnchorContainer)syncAnchorContainer
{
  return self->_syncAnchorContainer;
}

uint64_t __67__HDSPSleepStoreServer__performWhenEnvironmentIsReady_withContext___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58__HDSPSleepStoreServer_getSleepEventRecordWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v5 = v13;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep event record from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  v7 = [v6 sleepScheduleModelManager];
  id v8 = [v7 sleepEventRecord];

  v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2114;
    id v15 = v3;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep event record from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

void __55__HDSPSleepStoreServer_getSleepSettingsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v5 = v13;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep settings from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  v7 = [v6 sleepScheduleModelManager];
  id v8 = [v7 sleepSettings];

  v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    int v12 = 138543618;
    id v13 = v10;
    __int16 v14 = 2114;
    id v15 = v3;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep settings from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_2;
  v3[3] = &unk_2645D9B28;
  id v5 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  [v2 _performWhenEnvironmentIsReady:v3 withContext:*(void *)(a1 + 48)];
}

- (void)_performWhenEnvironmentIsReady:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__HDSPSleepStoreServer__performWhenEnvironmentIsReady_withContext___block_invoke;
  v10[3] = &unk_2645D9B78;
  id v11 = v6;
  id v9 = v6;
  [WeakRetained performWhenEnvironmentIsReady:v10 withContext:v7];
}

- (void)_performWhenClientIsReady:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = +[HDSPEnvironmentContext contextWithSource:v6];
    id v9 = [v6 clientIdentifierProvider];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke;
    v19[3] = &unk_2645D9B50;
    v19[4] = self;
    id v22 = v7;
    id v20 = v6;
    id v21 = v8;
    id v10 = v8;
    id v11 = v7;
    id v12 = (id)[v9 addCompletionBlock:v19];
  }
  else
  {
    id v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = (id)objc_opt_class();
      id v15 = v24;
      _os_log_error_impl(&dword_221A52000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] client was nil!", buf, 0xCu);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_287;
    v16[3] = &unk_2645D9B28;
    id v17 = 0;
    id v18 = v7;
    id v14 = v7;
    [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v16];

    id v10 = v18;
  }
}

- (HDSPSleepStoreServer)initWithEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(HDSPProcessStateManager);
  id v6 = [(HDSPSleepStoreServer *)self initWithEnvironment:v4 connectionListenerProvider:&__block_literal_global_4 processStateManager:v5];

  return v6;
}

id __44__HDSPSleepStoreServer_initWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F75EC8];
  uint64_t v3 = *MEMORY[0x263F75CB8];
  id v4 = a2;
  id v5 = HKSPSleepClientInterface();
  id v6 = HKSPSleepServerInterface();
  id v7 = [v2 infoForMachServiceName:v3 remoteObjectInterface:v5 exportedObject:v4 exportedObjectInterface:v6 lifecycleNotification:*MEMORY[0x263F75CB0] requiredEntitlement:*MEMORY[0x263F75C08] options:0];

  id v8 = [MEMORY[0x263F75ED0] listenerWithConnectionInfo:v7];

  return v8;
}

- (HDSPSleepStoreServer)initWithEnvironment:(id)a3 connectionListenerProvider:(id)a4 processStateManager:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, HDSPSleepStoreServer *))a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HDSPSleepStoreServer;
  id v11 = [(HDSPSleepStoreServer *)&v26 init];
  if (v11)
  {
    id v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      __int16 v29 = 2048;
      v30 = v11;
      id v14 = v13;
      _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v11->_environment, v8);
    if (v9)
    {
      uint64_t v15 = v9[2](v9, v11);
      connectionListener = v11->_connectionListener;
      v11->_connectionListener = (HKSPXPCConnectionListener *)v15;
    }
    else
    {
      connectionListener = v11->_connectionListener;
      v11->_connectionListener = 0;
    }

    [(HKSPXPCConnectionListener *)v11->_connectionListener setDelegate:v11];
    objc_storeStrong((id *)&v11->_processStateManager, a5);
    [(HDSPProcessStateManager *)v11->_processStateManager setDelegate:v11];
    id v17 = objc_alloc(MEMORY[0x263F75E28]);
    id v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_environment);
    id v21 = [WeakRetained userDefaults];
    uint64_t v22 = [v17 initWithIdentifier:v19 defaults:v21];
    syncAnchorContainer = v11->_syncAnchorContainer;
    v11->_syncAnchorContainer = (HKSPPersistentSyncAnchorContainer *)v22;

    id v24 = v11;
  }

  return v11;
}

- (void)startListening
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startListening", (uint8_t *)&v5, 0xCu);
  }
  [(HKSPXPCConnectionListener *)self->_connectionListener startListening];
}

- (void)_performWhenCurrentClientIsReady:(id)a3
{
  id v4 = a3;
  int v5 = [(HDSPSleepStoreServer *)self connectionListener];
  id v6 = [v5 currentClient];

  [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v6 block:v4];
}

uint64_t __56__HDSPSleepStoreServer__performWhenClientIsReady_block___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_performWhenEnvironmentIsReady:(id)a3
{
  id v4 = a3;
  int v5 = [(HDSPSleepStoreServer *)self connectionListener];
  id v7 = [v5 currentClient];

  id v6 = +[HDSPEnvironmentContext contextWithSource:v7];
  [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v4 withContext:v6];
}

- (void)environmentWillBecomeReady:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v12, 0xCu);
  }
  id v7 = [v4 sleepScheduleModelManager];
  [v7 addObserver:self];

  id v8 = [v4 sleepScheduler];
  [v8 addEventHandler:self];

  id v9 = [v4 sleepCoordinator];
  [v9 addObserver:self];

  id v10 = [v4 sleepModeManager];
  [v10 addObserver:self];

  id v11 = [v4 diagnostics];

  [v11 addProvider:self];
}

- (void)environmentDidBecomeReady:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v5, 0xCu);
  }
}

- (void)environmentWillInvalidate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment will become invalid", (uint8_t *)&v7, 0xCu);
  }
  connectionListener = self->_connectionListener;
  self->_connectionListener = 0;
}

- (void)checkInWithSyncAnchorContainer:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v9 = [WeakRetained isDisabled];

  if (v9)
  {
    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    v7[2](v7, 1, 0);
  }
  else
  {
    id v11 = [(HDSPSleepStoreServer *)self connectionListener];
    int v12 = [v11 currentClient];

    id v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      id v24 = v6;
      id v14 = v20;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] check in received from %{public}@ with sync anchor container: %{public}@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __66__HDSPSleepStoreServer_checkInWithSyncAnchorContainer_completion___block_invoke;
    v16[3] = &unk_2645D9BA0;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v12 block:v16];
  }
}

uint64_t __66__HDSPSleepStoreServer_checkInWithSyncAnchorContainer_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _notifyClient:a2 forMissedMessagesWithSyncAnchorContainer:*(void *)(a1 + 40)];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

- (void)saveSleepSchedule:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v9 = [WeakRetained isDisabled];

  if (v9)
  {
    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v7[2](v7, v11);
  }
  else
  {
    int v12 = [(HDSPSleepStoreServer *)self connectionListener];
    id v11 = [v12 currentClient];

    id v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v11;
      id v14 = v20;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to save current sleep schedule: %{public}@ from: %{public}@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__HDSPSleepStoreServer_saveSleepSchedule_completion___block_invoke;
    v16[3] = &unk_2645D9BA0;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v11 block:v16];
  }
}

void __53__HDSPSleepStoreServer_saveSleepSchedule_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v3;
    id v7 = v5;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request to save current sleep schedule: %{public}@ from: %{public}@", buf, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) environment];
  int v9 = [v8 sleepScheduleModelManager];
  uint64_t v10 = *(void *)(a1 + 40);
  id v19 = 0;
  int v11 = [v9 saveSleepSchedule:v10 error:&v19];
  id v12 = v19;

  id v13 = HKSPLogForCategory();
  id v14 = v13;
  if (!v11 || v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    __int16 v21 = v18;
    __int16 v22 = 2114;
    id v23 = v12;
    id v17 = v18;
    _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] request received to save current sleep schedule failed: %{public}@", buf, 0x16u);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    uint64_t v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v15;
    __int16 v22 = 2114;
    id v23 = v16;
    __int16 v24 = 2114;
    id v25 = v3;
    id v17 = v15;
    _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to save current sleep schedule: %{public}@ from: %{public}@", buf, 0x20u);
LABEL_7:
  }
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)saveSleepSettings:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v9 = [WeakRetained isDisabled];

  if (v9)
  {
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v7[2](v7, v11);
  }
  else
  {
    id v12 = [(HDSPSleepStoreServer *)self connectionListener];
    int v11 = [v12 currentClient];

    id v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      __int16 v24 = v11;
      id v14 = v20;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to save current sleep settings: %{public}@ from: %{public}@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__HDSPSleepStoreServer_saveSleepSettings_completion___block_invoke;
    v16[3] = &unk_2645D9BA0;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v11 block:v16];
  }
}

void __53__HDSPSleepStoreServer_saveSleepSettings_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v3;
    id v7 = v5;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request to save current sleep settings: %{public}@ from: %{public}@", buf, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) environment];
  int v9 = [v8 sleepScheduleModelManager];
  uint64_t v10 = *(void *)(a1 + 40);
  id v19 = 0;
  int v11 = [v9 saveSleepSettings:v10 error:&v19];
  id v12 = v19;

  id v13 = HKSPLogForCategory();
  id v14 = v13;
  if (!v11 || v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    __int16 v21 = v18;
    __int16 v22 = 2114;
    id v23 = v12;
    id v17 = v18;
    _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] request received to save current sleep settings failed: %{public}@", buf, 0x16u);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    uint64_t v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v15;
    __int16 v22 = 2114;
    id v23 = v16;
    __int16 v24 = 2114;
    id v25 = v3;
    id v17 = v15;
    _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to save current sleep settings: %{public}@ from: %{public}@", buf, 0x20u);
LABEL_7:
  }
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)saveSleepEventRecord:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v9 = [WeakRetained isDisabled];

  if (v9)
  {
    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v7[2](v7, v11);
  }
  else
  {
    id v12 = [(HDSPSleepStoreServer *)self connectionListener];
    int v11 = [v12 currentClient];

    id v13 = HKSPLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      __int16 v24 = v11;
      id v14 = v20;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to save current sleep event record: %{public}@ from: %{public}@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__HDSPSleepStoreServer_saveSleepEventRecord_completion___block_invoke;
    v16[3] = &unk_2645D9BA0;
    void v16[4] = self;
    id v17 = v6;
    id v18 = v7;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v11 block:v16];
  }
}

void __56__HDSPSleepStoreServer_saveSleepEventRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v3;
    id v7 = v5;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request to save current sleep event record: %{public}@ from: %{public}@", buf, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) environment];
  int v9 = [v8 sleepScheduleModelManager];
  uint64_t v10 = *(void *)(a1 + 40);
  id v19 = 0;
  int v11 = [v9 saveSleepEventRecord:v10 error:&v19];
  id v12 = v19;

  id v13 = HKSPLogForCategory();
  id v14 = v13;
  if (!v11 || v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    __int16 v21 = v18;
    __int16 v22 = 2114;
    id v23 = v12;
    id v17 = v18;
    _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] request received to save current sleep event record failed: %{public}@", buf, 0x16u);
    goto LABEL_7;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    uint64_t v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v15;
    __int16 v22 = 2114;
    id v23 = v16;
    __int16 v24 = 2114;
    id v25 = v3;
    id v17 = v15;
    _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to save current sleep event record: %{public}@ from: %{public}@", buf, 0x20u);
LABEL_7:
  }
LABEL_9:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getSleepModeWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    int v9 = [(HDSPSleepStoreServer *)self connectionListener];
    id v8 = [v9 currentClient];

    uint64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep mode on from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__HDSPSleepStoreServer_getSleepModeWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    id v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

void __51__HDSPSleepStoreServer_getSleepModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v3;
    id v5 = v13;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep mode on from: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = [v6 sleepModeManager];
  [v7 sleepMode];

  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = objc_opt_class();
    id v10 = v9;
    id v11 = NSStringFromHKSPSleepMode();
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v3;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep mode: %{public}@ from: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setSleepMode:(int64_t)a3 reason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v10 = [WeakRetained isDisabled];

  if (v10)
  {
    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = (id)objc_opt_class();
      id v19 = v25;
      _os_log_error_impl(&dword_221A52000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v8[2](v8, v12);
  }
  else
  {
    id v13 = [(HDSPSleepStoreServer *)self connectionListener];
    int v12 = [v13 currentClient];

    __int16 v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_opt_class();
      id v16 = v15;
      id v17 = NSStringFromHKSPSleepMode();
      uint64_t v18 = NSStringFromHKSPSleepModeChangeReason();
      *(_DWORD *)buf = 138544130;
      id v25 = v15;
      __int16 v26 = 2114;
      v27 = v17;
      __int16 v28 = 2114;
      __int16 v29 = v18;
      __int16 v30 = 2114;
      uint64_t v31 = v12;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received to set sleep mode: %{public}@ (%{public}@) from: %{public}@", buf, 0x2Au);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__HDSPSleepStoreServer_setSleepMode_reason_completion___block_invoke;
    v20[3] = &unk_2645D9BF0;
    v20[4] = self;
    int64_t v22 = a3;
    unint64_t v23 = a4;
    __int16 v21 = v8;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v12 block:v20];
  }
}

void __55__HDSPSleepStoreServer_setSleepMode_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = NSStringFromHKSPSleepMode();
    id v8 = NSStringFromHKSPSleepModeChangeReason();
    int v16 = 138544130;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 2114;
    id v23 = v3;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request set sleep mode: %{public}@ (%{public}@) from: %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  int v9 = [*(id *)(a1 + 32) environment];
  int v10 = [v9 sleepModeManager];
  [v10 setSleepMode:*(void *)(a1 + 48) reason:*(void *)(a1 + 56)];

  id v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = objc_opt_class();
    id v13 = v12;
    __int16 v14 = NSStringFromHKSPSleepMode();
    id v15 = NSStringFromHKSPSleepModeChangeReason();
    int v16 = 138544130;
    id v17 = v12;
    __int16 v18 = 2114;
    id v19 = v14;
    __int16 v20 = 2114;
    __int16 v21 = v15;
    __int16 v22 = 2114;
    id v23 = v3;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request to set sleep mode: %{public}@ (%{public}@) from: %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSleepScheduleStateWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  id v7 = HKSPLogForCategory();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep schedule state", buf, 0xCu);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__HDSPSleepStoreServer_getSleepScheduleStateWithCompletion___block_invoke;
    v12[3] = &unk_2645D9BC8;
    v12[4] = self;
    id v13 = v4;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v12];
  }
}

void __60__HDSPSleepStoreServer_getSleepScheduleStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v3 = v11;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep schedule state", (uint8_t *)&v10, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 sleepCoordinator];
  [v5 currentSleepScheduleState];

  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    int v9 = NSStringFromHKSPSleepScheduleState();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep schedule state: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSleepWidgetStateWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  id v7 = HKSPLogForCategory();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] request received for sleep widget state", buf, 0xCu);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__HDSPSleepStoreServer_getSleepWidgetStateWithCompletion___block_invoke;
    v12[3] = &unk_2645D9BC8;
    v12[4] = self;
    id v13 = v4;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v12];
  }
}

void __58__HDSPSleepStoreServer_getSleepWidgetStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = (id)objc_opt_class();
    id v3 = v11;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing request for sleep widget state", (uint8_t *)&v10, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 sleepWidgetManager];
  [v5 currentSleepWidgetState];

  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    int v9 = NSStringFromHKSPSleepWidgetState();
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] completing request for sleep widget state: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)publishNotificationWithIdentifier:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v12 = [WeakRetained isDisabled];

  id v13 = HKSPLogForCategory();
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = (id)objc_opt_class();
      id v17 = v23;
      _os_log_error_impl(&dword_221A52000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v10[2](v10, 0, v15);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2112;
      id v25 = v8;
      id v16 = v23;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to publish notification: %@", buf, 0x16u);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __78__HDSPSleepStoreServer_publishNotificationWithIdentifier_userInfo_completion___block_invoke;
    v18[3] = &unk_2645D9C18;
    v18[4] = self;
    id v19 = v8;
    id v20 = v9;
    __int16 v21 = v10;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v18];
  }
}

void __78__HDSPSleepStoreServer_publishNotificationWithIdentifier_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    id v5 = v3;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to publish notification: %@", buf, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = (void *)MEMORY[0x263F75E50];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v6 currentDateProvider];
  int v10 = v9[2]();
  id v11 = [v7 sleepEventWithIdentifier:v8 dueDate:v10 context:*(void *)(a1 + 48)];

  int v12 = [v6 sleepScheduler];
  __int16 v18 = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  [v12 notifyForOverdueEvents:v13];

  uint64_t v14 = HKSPLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    id v17 = v15;
    _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to publish notification: %@", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)publishWakeUpResultsNotificationWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  id v7 = HKSPLogForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to publish wake up results notification", buf, 0xCu);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke;
    v12[3] = &unk_2645D9BC8;
    v12[4] = self;
    id v13 = v4;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v12];
  }
}

void __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v3 = v15;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to publish wake up results notification", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 wakeUpResultsNotificationManager];

  if (v5)
  {
    int v6 = [v4 wakeUpResultsNotificationManager];
    id v7 = [v6 performImmediateQueryForNotification];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke_292;
    v11[3] = &unk_2645D9C40;
    id v13 = *(id *)(a1 + 40);
    id v12 = v4;
    id v8 = (id)[v7 addCompletionBlock:v11];

    id v9 = v13;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:2 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v9);
  }
}

void __71__HDSPSleepStoreServer_publishWakeUpResultsNotificationWithCompletion___block_invoke_292(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [a2 buildNotification];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = (void *)MEMORY[0x263F75E50];
      int v6 = [v3 identifier];
      id v7 = [*(id *)(a1 + 32) currentDateProvider];
      id v8 = v7[2]();
      id v9 = [v4 userInfo];
      uint64_t v10 = [v5 sleepEventWithIdentifier:v6 dueDate:v8 context:v9];

      id v11 = [*(id *)(a1 + 32) sleepScheduler];
      v16[0] = v10;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
      [v11 notifyForOverdueEvents:v12];

      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = [v10 context];
      (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    id v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v15();
  }
}

- (void)setLockScreenOverrideState:(int64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v11 = [WeakRetained isDisabled];

  id v12 = HKSPLogForCategory();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = (id)objc_opt_class();
      id v18 = v24;
      _os_log_error_impl(&dword_221A52000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v9[2](v9, 0, v14);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_opt_class();
      id v16 = v15;
      id v17 = NSStringFromHKSPSleepLockScreenState();
      *(_DWORD *)buf = 138543874;
      id v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v17;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to override lock screen state: %@ (userInfo: %@)", buf, 0x20u);
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__HDSPSleepStoreServer_setLockScreenOverrideState_userInfo_completion___block_invoke;
    v19[3] = &unk_2645D9C68;
    v19[4] = self;
    int64_t v22 = a3;
    id v20 = v8;
    __int16 v21 = v9;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v19];
  }
}

void __71__HDSPSleepStoreServer_setLockScreenOverrideState_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    id v4 = v3;
    id v5 = NSStringFromHKSPSleepLockScreenState();
    int v17 = 138543618;
    id v18 = v3;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request override lock screen state: %@", (uint8_t *)&v17, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = [v6 sleepLockScreenManager];

  if (v7)
  {
    id v8 = [v6 sleepLockScreenManager];
    [v8 overrideLockScreenState:*(void *)(a1 + 56) userInfo:*(void *)(a1 + 40)];
  }
  else
  {
    id v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      int v17 = 138543362;
      id v18 = v15;
      id v16 = v15;
      _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] lock screen not supported on this device", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:2 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v8);
  }

  int v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = NSStringFromHKSPSleepLockScreenState();
    int v17 = 138543618;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request override lock screen state: %@", (uint8_t *)&v17, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setWidgetOverrideState:(int64_t)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v6 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v8 = [WeakRetained isDisabled];

  id v9 = HKSPLogForCategory();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v6[2](v6, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      id v13 = v12;
      uint64_t v14 = NSStringFromHKSPSleepWidgetState();
      *(_DWORD *)buf = 138543618;
      id v20 = v12;
      __int16 v21 = 2112;
      int64_t v22 = v14;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to override sleep widget state: %@", buf, 0x16u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __58__HDSPSleepStoreServer_setWidgetOverrideState_completion___block_invoke;
    v16[3] = &unk_2645D9C90;
    void v16[4] = self;
    int64_t v18 = a3;
    int v17 = v6;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v16];
  }
}

void __58__HDSPSleepStoreServer_setWidgetOverrideState_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    id v4 = v3;
    id v5 = NSStringFromHKSPSleepWidgetState();
    int v17 = 138543618;
    int64_t v18 = v3;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to override sleep widget state: %@", (uint8_t *)&v17, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = [v6 sleepWidgetManager];

  if (v7)
  {
    int v8 = [v6 sleepWidgetManager];
    [v8 overrideWidgetState:*(void *)(a1 + 48)];
  }
  else
  {
    id v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      int v17 = 138543362;
      int64_t v18 = v15;
      id v16 = v15;
      _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] widgets not supported on this device", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    int v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:2 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v8);
  }

  int v11 = HKSPLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = NSStringFromHKSPSleepWidgetState();
    int v17 = 138543618;
    int64_t v18 = v12;
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to override sleep widget state: %@", (uint8_t *)&v17, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clearWidgetOverrideWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  id v7 = HKSPLogForCategory();
  int v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to clear sleep widget override", buf, 0xCu);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__HDSPSleepStoreServer_clearWidgetOverrideWithCompletion___block_invoke;
    v12[3] = &unk_2645D9BC8;
    v12[4] = self;
    id v13 = v4;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v12];
  }
}

void __58__HDSPSleepStoreServer_clearWidgetOverrideWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    id v15 = (id)objc_opt_class();
    id v3 = v15;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request clear sleep widget override", (uint8_t *)&v14, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 sleepWidgetManager];

  if (v5)
  {
    int v6 = [v4 sleepWidgetManager];
    [v6 clearWidgetOverrideState];
  }
  else
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      int v14 = 138543362;
      id v15 = v12;
      id v13 = v12;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] widgets not supported on this device", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    int v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:2 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v6);
  }

  id v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    int v14 = 138543362;
    id v15 = v10;
    id v11 = v10;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to clear sleep widget override", (uint8_t *)&v14, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createSleepFocusInState:(unint64_t)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v6 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v8 = [WeakRetained isDisabled];

  id v9 = HKSPLogForCategory();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v6[2](v6, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      id v13 = v12;
      int v14 = NSStringFromHKSPSleepFocusConfigurationState();
      *(_DWORD *)buf = 138543618;
      id v20 = v12;
      __int16 v21 = 2114;
      int64_t v22 = v14;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to create sleep focus mode (%{public}@)", buf, 0x16u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __59__HDSPSleepStoreServer_createSleepFocusInState_completion___block_invoke;
    v16[3] = &unk_2645D9C90;
    void v16[4] = self;
    unint64_t v18 = a3;
    int v17 = v6;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v16];
  }
}

void __59__HDSPSleepStoreServer_createSleepFocusInState_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    id v4 = v3;
    id v5 = NSStringFromHKSPSleepFocusConfigurationState();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v3;
    __int16 v17 = 2114;
    unint64_t v18 = v5;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to create sleep focus mode (%{public}@)", buf, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = [v6 sleepModeManager];
  uint64_t v8 = *(void *)(a1 + 48);
  id v14 = 0;
  [v7 createFocusModeInState:v8 error:&v14];
  id v9 = v14;

  id v10 = HKSPLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    id v13 = NSStringFromHKSPSleepFocusConfigurationState();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    unint64_t v18 = v13;
    _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to create sleep focus mode (%{public}@)", buf, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSleepFocusModeWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  id v7 = HKSPLogForCategory();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to delete sleep focus mode", buf, 0xCu);
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__HDSPSleepStoreServer_deleteSleepFocusModeWithCompletion___block_invoke;
    v12[3] = &unk_2645D9BC8;
    v12[4] = self;
    id v13 = v4;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v12];
  }
}

void __59__HDSPSleepStoreServer_deleteSleepFocusModeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v3 = v12;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to delete sleep focus mode", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 sleepModeManager];
  id v10 = 0;
  [v5 deleteFocusModeWithError:&v10];
  id v6 = v10;

  id v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v12 = v8;
    id v9 = v8;
    _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to delete sleep focus mode", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)configureSleepFocusWithState:(unint64_t)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v8 = [WeakRetained isDisabled];

  id v9 = HKSPLogForCategory();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = (id)objc_opt_class();
      id v15 = v20;
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v6[2](v6, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_opt_class();
      id v13 = v12;
      id v14 = NSStringFromHKSPSleepFocusConfigurationState();
      *(_DWORD *)buf = 138543618;
      id v20 = v12;
      __int16 v21 = 2114;
      int64_t v22 = v14;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to configure sleep focus mode (state: %{public}@)", buf, 0x16u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __64__HDSPSleepStoreServer_configureSleepFocusWithState_completion___block_invoke;
    v16[3] = &unk_2645D9C90;
    void v16[4] = self;
    unint64_t v18 = a3;
    __int16 v17 = v6;
    [(HDSPSleepStoreServer *)self _performWhenCurrentClientIsReady:v16];
  }
}

void __64__HDSPSleepStoreServer_configureSleepFocusWithState_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v3 = v13;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to configure sleep focus mode", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 sleepModeManager];
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = 0;
  [v5 configureFocusModeWithState:v6 error:&v11];
  id v7 = v11;

  int v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v13 = v9;
    id v10 = v9;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to configure sleep focus mode", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)confirmAwakeWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    id v9 = [(HDSPSleepStoreServer *)self connectionListener];
    int v8 = [v9 currentClient];

    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      unint64_t v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to confirm awake from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__HDSPSleepStoreServer_confirmAwakeWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    uint64_t v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

void __51__HDSPSleepStoreServer_confirmAwakeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v3 = v10;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to confirm awake", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 actionManager];

  [v5 confirmWakeUp:1];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    int v9 = 138543362;
    id v10 = v7;
    id v8 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to confirm awake", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dismissGoodMorningWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    int v9 = [(HDSPSleepStoreServer *)self connectionListener];
    id v8 = [v9 currentClient];

    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      unint64_t v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to dismiss good morning from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__HDSPSleepStoreServer_dismissGoodMorningWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    uint64_t v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

void __57__HDSPSleepStoreServer_dismissGoodMorningWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v3 = v10;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to dismiss good morning", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 actionManager];

  [v5 dismissGoodMorning];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    int v9 = 138543362;
    id v10 = v7;
    id v8 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to dismiss good morning", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dismissSleepLockWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained isDisabled];

  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v4[2](v4, 0, v8);
  }
  else
  {
    int v9 = [(HDSPSleepStoreServer *)self connectionListener];
    id v8 = [v9 currentClient];

    id v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      unint64_t v18 = v8;
      id v11 = v16;
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received to dismiss sleep lock from: %{public}@", buf, 0x16u);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __55__HDSPSleepStoreServer_dismissSleepLockWithCompletion___block_invoke;
    v13[3] = &unk_2645D9BC8;
    v13[4] = self;
    uint64_t v14 = v4;
    [(HDSPSleepStoreServer *)self _performWhenClientIsReady:v8 block:v13];
  }
}

void __55__HDSPSleepStoreServer_dismissSleepLockWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v3 = v10;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request to dismiss sleep lock", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 actionManager];

  [v5 dismissSleepLock];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    int v9 = 138543362;
    id v10 = v7;
    id v8 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request to dismiss sleep lock", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sleepAlarmWasDismissedOnDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v11 = [WeakRetained isDisabled];

  if (v11)
  {
    id v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = (id)objc_opt_class();
      id v19 = v25;
      _os_log_error_impl(&dword_221A52000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v9[2](v9, 0, v13);
  }
  else
  {
    uint64_t v14 = [(HDSPSleepStoreServer *)self connectionListener];
    id v13 = [v14 currentClient];

    id v15 = HKSPLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      id v17 = v16;
      unint64_t v18 = NSStringFromHKSPAlarmSource();
      *(_DWORD *)buf = 138544130;
      id v25 = v16;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2114;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      uint64_t v31 = v13;
      _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received for sleep alarm dismissal on %{public}@ (%{public}@) from: %{public}@", buf, 0x2Au);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__HDSPSleepStoreServer_sleepAlarmWasDismissedOnDate_source_completion___block_invoke;
    v20[3] = &unk_2645D9CB8;
    v20[4] = self;
    id v21 = v8;
    unint64_t v23 = a4;
    int64_t v22 = v9;
    [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v20];
  }
}

void __71__HDSPSleepStoreServer_sleepAlarmWasDismissedOnDate_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 138543618;
    id v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    id v5 = v3;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request for sleep alarm dismissal on %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = [v6 actionManager];

  [v7 sleepAlarmDismissedOnDate:*(void *)(a1 + 40) source:*(void *)(a1 + 56)];
  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    id v11 = v9;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request for sleep alarm dismissal on %{public}@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sleepAlarmWasSnoozedUntilDate:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v11 = [WeakRetained isDisabled];

  if (v11)
  {
    int v12 = HKSPLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = (id)objc_opt_class();
      id v19 = v25;
      _os_log_error_impl(&dword_221A52000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v9[2](v9, 0, v13);
  }
  else
  {
    __int16 v14 = [(HDSPSleepStoreServer *)self connectionListener];
    id v13 = [v14 currentClient];

    uint64_t v15 = HKSPLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = v16;
      unint64_t v18 = NSStringFromHKSPAlarmSource();
      *(_DWORD *)buf = 138544130;
      id v25 = v16;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2114;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      uint64_t v31 = v13;
      _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received for sleep alarm snooze until %{public}@ (%{public}@) from: %{public}@", buf, 0x2Au);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __72__HDSPSleepStoreServer_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke;
    v20[3] = &unk_2645D9CB8;
    v20[4] = self;
    id v21 = v8;
    unint64_t v23 = a4;
    int64_t v22 = v9;
    [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v20];
  }
}

void __72__HDSPSleepStoreServer_sleepAlarmWasSnoozedUntilDate_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 40);
    int v12 = 138543618;
    id v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    id v5 = v3;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request for sleep alarm snooze until %{public}@", (uint8_t *)&v12, 0x16u);
  }
  int v6 = [*(id *)(a1 + 32) environment];
  id v7 = [v6 actionManager];

  [v7 sleepAlarmSnoozedUntilDate:*(void *)(a1 + 40) source:*(void *)(a1 + 56)];
  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 40);
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2114;
    uint64_t v15 = v10;
    id v11 = v9;
    _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request for sleep alarm snooze until %{public}@", (uint8_t *)&v12, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sleepAlarmWasModifiedFromSource:(unint64_t)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v7 = [WeakRetained isDisabled];

  if (v7)
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = (id)objc_opt_class();
      id v15 = v19;
      _os_log_error_impl(&dword_221A52000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] server disabled", buf, 0xCu);
    }
    int v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.sleep.HDSPSleepStoreServer" code:1 userInfo:0];
    v5[2](v5, 0, v9);
  }
  else
  {
    uint64_t v10 = [(HDSPSleepStoreServer *)self connectionListener];
    int v9 = [v10 currentClient];

    id v11 = HKSPLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = objc_opt_class();
      id v13 = v12;
      __int16 v14 = NSStringFromHKSPAlarmSource();
      *(_DWORD *)buf = 138543874;
      id v19 = v12;
      __int16 v20 = 2114;
      id v21 = v14;
      __int16 v22 = 2114;
      unint64_t v23 = v9;
      _os_log_impl(&dword_221A52000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request received for sleep alarm modified (%{public}@) from: %{public}@", buf, 0x20u);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    void v16[2] = __67__HDSPSleepStoreServer_sleepAlarmWasModifiedFromSource_completion___block_invoke;
    v16[3] = &unk_2645D9CE0;
    void v16[4] = self;
    id v17 = v5;
    [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v16];
  }
}

void __67__HDSPSleepStoreServer_sleepAlarmWasModifiedFromSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v3 = v10;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Performing request for sleep alarm modified", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 32) environment];
  id v5 = [v4 actionManager];

  [v5 sleepAlarmWasModified];
  int v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = objc_opt_class();
    int v9 = 138543362;
    id v10 = v7;
    id v8 = v7;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completing request for sleep alarm modified", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSchedule:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(HDSPSleepStoreServer *)self environment];
  int v7 = [v6 currentSource];

  id v8 = [(HDSPSleepStoreServer *)self connectionListener];
  int v9 = [v8 connectedClients];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke;
  v26[3] = &unk_2645D9D08;
  id v10 = v7;
  id v27 = v10;
  uint64_t v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v26);

  int v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v13;
    __int16 v30 = 2114;
    id v31 = v10;
    __int16 v32 = 2114;
    id v33 = v5;
    id v14 = v13;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] source: %{public}@ didUpdateSleepSchedule: %{public}@", buf, 0x20u);
  }
  id v15 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  uint64_t v16 = [v15 incrementSleepScheduleSyncAnchor];

  id v17 = [(HDSPSleepStoreServer *)self connectionListener];
  uint64_t v22 = MEMORY[0x263EF8330];
  id v23 = v5;
  id v24 = v16;
  id v25 = v11;
  id v18 = v11;
  id v19 = v16;
  id v20 = v5;
  id v21 = [(HDSPSleepStoreServer *)self _checkForSuspendedBlock];
  [v17 performRemoteBlockOnClients:&v22 passingTest:v21];
}

BOOL __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSchedule___block_invoke_295(uint64_t a1, void *a2)
{
  id v3 = a2;
  HKSPSleepScheduleWrapWithSyncAnchor();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [*(id *)(a1 + 48) clientIdentifier];
  [v3 sleepScheduleChanged:v5 clientIdentifier:v4];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSettings:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(HDSPSleepStoreServer *)self environment];
  int v7 = [v6 currentSource];

  id v8 = [(HDSPSleepStoreServer *)self connectionListener];
  int v9 = [v8 connectedClients];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke;
  v26[3] = &unk_2645D9D08;
  id v10 = v7;
  id v27 = v10;
  uint64_t v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v26);

  int v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v13;
    __int16 v30 = 2114;
    id v31 = v10;
    __int16 v32 = 2114;
    id v33 = v5;
    id v14 = v13;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] source: %{public}@ didUpdateSleepSettings: %{public}@", buf, 0x20u);
  }
  id v15 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  uint64_t v16 = [v15 incrementSleepSettingsSyncAnchor];

  id v17 = [(HDSPSleepStoreServer *)self connectionListener];
  uint64_t v22 = MEMORY[0x263EF8330];
  id v23 = v5;
  id v24 = v16;
  id v25 = v11;
  id v18 = v11;
  id v19 = v16;
  id v20 = v5;
  id v21 = [(HDSPSleepStoreServer *)self _checkForSuspendedBlock];
  [v17 performRemoteBlockOnClients:&v22 passingTest:v21];
}

BOOL __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void __73__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke_297(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v3 objectWithSyncAnchor:v4];
  int v6 = [*(id *)(a1 + 48) clientIdentifier];
  [v5 sleepSettingsChanged:v7 clientIdentifier:v6];
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepEventRecord:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = [(HDSPSleepStoreServer *)self environment];
  id v7 = [v6 currentSource];

  id v8 = [(HDSPSleepStoreServer *)self connectionListener];
  int v9 = [v8 connectedClients];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke;
  v26[3] = &unk_2645D9D08;
  id v10 = v7;
  id v27 = v10;
  uint64_t v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v26);

  int v12 = HKSPLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = objc_opt_class();
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v13;
    __int16 v30 = 2114;
    id v31 = v10;
    __int16 v32 = 2114;
    id v33 = v5;
    id v14 = v13;
    _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] source: %{public}@ didUpdateSleepEventRecord: %{public}@", buf, 0x20u);
  }
  id v15 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  uint64_t v16 = [v15 incrementSleepEventRecordSyncAnchor];

  id v17 = [(HDSPSleepStoreServer *)self connectionListener];
  uint64_t v22 = MEMORY[0x263EF8330];
  id v23 = v5;
  id v24 = v16;
  id v25 = v11;
  id v18 = v11;
  id v19 = v16;
  id v20 = v5;
  id v21 = [(HDSPSleepStoreServer *)self _checkForSuspendedBlock];
  [v17 performRemoteBlockOnClients:&v22 passingTest:v21];
}

BOOL __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void __76__HDSPSleepStoreServer_sleepScheduleModelManager_didUpdateSleepEventRecord___block_invoke_298(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v3 objectWithSyncAnchor:v4];
  int v6 = [*(id *)(a1 + 48) clientIdentifier];
  [v5 sleepEventRecordChanged:v7 clientIdentifier:v6];
}

- (void)sleepEventIsDue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v4;
    id v6 = v17;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepEventIsDue: %{public}@", buf, 0x16u);
  }
  id v7 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  id v8 = [v7 incrementSleepEventSyncAnchor];

  int v9 = [(HDSPSleepStoreServer *)self connectionListener];
  uint64_t v13 = MEMORY[0x263EF8330];
  id v14 = v4;
  id v15 = v8;
  id v10 = v8;
  id v11 = v4;
  int v12 = [(HDSPSleepStoreServer *)self _checkForSuspendedBlock];
  [v9 performRemoteBlockOnClients:&v13 passingTest:v12];
}

void __40__HDSPSleepStoreServer_sleepEventIsDue___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 objectWithSyncAnchor:v3];
  [v4 sleepEventOccurred:v5];
}

- (id)eventIdentifiers
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F75E50] standardEventIdentifiers];
  v6[0] = *MEMORY[0x263F75C38];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    int v12 = NSStringFromHKSPSleepScheduleState();
    uint64_t v13 = NSStringFromHKSPSleepScheduleStateChangeReason();
    *(_DWORD *)buf = 138543874;
    id v24 = v10;
    __int16 v25 = 2114;
    __int16 v26 = v12;
    __int16 v27 = 2114;
    __int16 v28 = v13;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateDidChange: %{public}@ (%{public}@)", buf, 0x20u);
  }
  if (a3 != a4)
  {
    id v14 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
    id v15 = [v14 incrementSleepScheduleStateSyncAnchor];

    uint64_t v16 = [(HDSPSleepStoreServer *)self connectionListener];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __73__HDSPSleepStoreServer_sleepScheduleStateDidChange_previousState_reason___block_invoke;
    v19[3] = &unk_2645D9D80;
    unint64_t v21 = a3;
    unint64_t v22 = a5;
    id v20 = v15;
    id v17 = v15;
    __int16 v18 = [(HDSPSleepStoreServer *)self _checkForSuspendedBlock];
    [v16 performRemoteBlockOnClients:v19 passingTest:v18];
  }
}

void __73__HDSPSleepStoreServer_sleepScheduleStateDidChange_previousState_reason___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F75E98];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithScheduleState:a1[5] changeReason:a1[6] syncAnchor:a1[4]];
  [v4 sleepScheduleStateChanged:v5];
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v9 = HKSPLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    int v12 = NSStringFromHKSPSleepModeChangeReason();
    *(_DWORD *)buf = 138544130;
    id v23 = v10;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    __int16 v28 = 2114;
    uint64_t v29 = v12;
    _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepModeDidChange: %ld previousMode: %ld reason: %{public}@", buf, 0x2Au);
  }
  if (a3 != a4)
  {
    uint64_t v13 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
    id v14 = [v13 incrementSleepModeSyncAnchor];

    id v15 = [(HDSPSleepStoreServer *)self connectionListener];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __63__HDSPSleepStoreServer_sleepModeDidChange_previousMode_reason___block_invoke;
    v18[3] = &unk_2645D9D80;
    int64_t v20 = a3;
    unint64_t v21 = a5;
    id v19 = v14;
    id v16 = v14;
    id v17 = [(HDSPSleepStoreServer *)self _checkForSuspendedBlock];
    [v15 performRemoteBlockOnClients:v18 passingTest:v17];
  }
}

void __63__HDSPSleepStoreServer_sleepModeDidChange_previousMode_reason___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F75E78];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithSleepMode:a1[5] changeReason:a1[6] syncAnchor:a1[4]];
  [v4 sleepModeChanged:v5];
}

- (id)_checkForSuspendedBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__HDSPSleepStoreServer__checkForSuspendedBlock__block_invoke;
  v4[3] = &unk_2645D9D08;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223C8D8E0](v4, a2);

  return v2;
}

uint64_t __47__HDSPSleepStoreServer__checkForSuspendedBlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "isProcessSuspended:", objc_msgSend(v3, "processID"));
  if (v4)
  {
    id v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v3;
      id v6 = v9;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping notification to suspended client: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v4 ^ 1u;
}

- (void)_notifyClient:(id)a3 forMissedMessagesWithSyncAnchorContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke;
  v20[3] = &unk_2645D9DA8;
  v20[4] = self;
  id v21 = v6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_3;
  v18[3] = &unk_2645D9DA8;
  void v18[4] = self;
  id v19 = v21;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_5;
  v16[3] = &unk_2645D9DA8;
  void v16[4] = self;
  id v17 = v19;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_7;
  v14[3] = &unk_2645D9DA8;
  v14[4] = self;
  id v15 = v17;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_9;
  v12[3] = &unk_2645D9DA8;
  v12[4] = self;
  id v13 = v15;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_11;
  v10[3] = &unk_2645D9DA8;
  void v10[4] = self;
  id v11 = v13;
  id v9 = v13;
  [v8 compareWithContainer:v7 sleepScheduleSyncAnchorOutOfDate:v20 sleepSettingsSyncAnchorOutOfDate:v18 sleepEventRecordSyncAnchorOutOfDate:v16 sleepScheduleStateSyncAnchorOutOfDate:v14 sleepModeSyncAnchorOutOfDate:v12 sleepEventSyncAnchorOutOfDate:v10];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_2;
  v8[3] = &unk_2645D9D58;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 performRemoteBlock:v8 onClient:v6];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v7 = [v2 environment];
  int v4 = [v7 sleepScheduleModelManager];
  uint64_t v5 = [v4 sleepSchedule];
  uint64_t v6 = HKSPSleepScheduleWrapWithSyncAnchor();
  [v3 sleepScheduleChanged:v6 clientIdentifier:0];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_4;
  v8[3] = &unk_2645D9D58;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 performRemoteBlock:v8 onClient:v6];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 environment];
  uint64_t v5 = [v8 sleepScheduleModelManager];
  uint64_t v6 = [v5 sleepSettings];
  id v7 = [v6 objectWithSyncAnchor:*(void *)(a1 + 40)];
  [v4 sleepSettingsChanged:v7 clientIdentifier:0];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_6;
  v8[3] = &unk_2645D9D58;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 performRemoteBlock:v8 onClient:v6];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 environment];
  uint64_t v5 = [v8 sleepScheduleModelManager];
  uint64_t v6 = [v5 sleepEventRecord];
  id v7 = [v6 objectWithSyncAnchor:*(void *)(a1 + 40)];
  [v4 sleepEventRecordChanged:v7 clientIdentifier:0];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_8;
  v8[3] = &unk_2645D9D58;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 performRemoteBlock:v8 onClient:v6];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F75E98];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v8 = [*(id *)(a1 + 32) environment];
  uint64_t v6 = [v8 sleepCoordinator];
  id v7 = objc_msgSend(v5, "initWithScheduleState:changeReason:syncAnchor:", objc_msgSend(v6, "currentSleepScheduleState"), 6, *(void *)(a1 + 40));
  [v4 sleepScheduleStateChanged:v7];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_10;
  v8[3] = &unk_2645D9D58;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 performRemoteBlock:v8 onClient:v6];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F75E78];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v8 = [*(id *)(a1 + 32) environment];
  uint64_t v6 = [v8 sleepModeManager];
  id v7 = objc_msgSend(v5, "initWithSleepMode:changeReason:syncAnchor:", objc_msgSend(v6, "sleepMode"), 10, *(void *)(a1 + 40));
  [v4 sleepModeChanged:v7];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_12;
  v8[3] = &unk_2645D9D58;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 performRemoteBlock:v8 onClient:v6];
}

void __79__HDSPSleepStoreServer__notifyClient_forMissedMessagesWithSyncAnchorContainer___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 environment];
  uint64_t v5 = [v8 sleepScheduler];
  uint64_t v6 = [v5 lastStandardSleepEvent];
  id v7 = [v6 objectWithSyncAnchor:*(void *)(a1 + 40)];
  [v4 sleepEventOccurred:v7];
}

- (void)processNoLongerSuspended:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke;
  v3[3] = &unk_2645D9810;
  void v3[4] = self;
  int v4 = a3;
  [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v3];
}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connectionListener];
  id v3 = [v2 connectedClientsWithPID:*(unsigned int *)(a1 + 40)];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2;
  v4[3] = &unk_2645D9DF8;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v3;
    id v5 = v11;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] asking newly running client to check in: %{public}@", buf, 0x16u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) connectionListener];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_302;
  v8[3] = &unk_2645D9D58;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  [v6 performRemoteBlock:v8 onClient:v7];
}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_302(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2_303;
  v6[3] = &unk_2645D9DD0;
  int v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v5 clientShouldCheckInWithCompletion:v6];
}

void __49__HDSPSleepStoreServer_processNoLongerSuspended___block_invoke_2_303(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v3;
    id v7 = v5;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] check in received from %{public}@ with container: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  [*(id *)(a1 + 32) _notifyClient:*(void *)(a1 + 48) forMissedMessagesWithSyncAnchorContainer:v3];
}

- (void)processDidBecomeSuspended:(int)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke;
  v3[3] = &unk_2645D9810;
  void v3[4] = self;
  int v4 = a3;
  [(HDSPSleepStoreServer *)self _performWhenEnvironmentIsReady:v3];
}

void __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connectionListener];
  id v3 = [v2 connectedClientsWithPID:*(unsigned int *)(a1 + 40)];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke_2;
  v4[3] = &unk_2645D9DF8;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __50__HDSPSleepStoreServer_processDidBecomeSuspended___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2114;
    id v8 = v2;
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] client did become suspended: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)connectionListenerDidRemoveClient:(id)a3
{
  processStateManager = self->_processStateManager;
  uint64_t v4 = [a3 processID];

  [(HDSPProcessStateManager *)processStateManager stopMonitoringProcessState:v4];
}

- (id)diagnosticDescription
{
  id v3 = NSString;
  uint64_t v4 = [(HDSPSleepStoreServer *)self syncAnchorContainer];
  int v5 = [v4 description];
  id v6 = [(HDSPSleepStoreServer *)self connectionListener];
  __int16 v7 = [v6 connectedClients];
  id v8 = [v3 stringWithFormat:@"Sync Anchor Container: %@\nConnected Clients: %@", v5, v7];

  return v8;
}

- (id)diagnosticInfo
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = [(HDSPSleepStoreServer *)self connectionListener];
  id v3 = [v2 connectedClients];

  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_311);
  int v5 = [v4 componentsJoinedByString:@", "];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = @"none";
  }
  uint64_t v9 = @"Connected Clients";
  v10[0] = v6;
  __int16 v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

id __38__HDSPSleepStoreServer_diagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v3 processID];
  int v5 = [v3 clientIdentifier];

  id v6 = [v5 loggingIdentifier];
  __int16 v7 = [v2 stringWithFormat:@"(pid: %ul, id: %@)", v4, v6];

  return v7;
}

- (HDSPProcessStateManager)processStateManager
{
  return self->_processStateManager;
}

- (void)setSyncAnchorContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchorContainer, 0);
  objc_storeStrong((id *)&self->_processStateManager, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end