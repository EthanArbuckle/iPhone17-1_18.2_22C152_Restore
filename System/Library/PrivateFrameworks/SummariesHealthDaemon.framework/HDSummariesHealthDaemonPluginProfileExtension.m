@interface HDSummariesHealthDaemonPluginProfileExtension
- (HDNotificationSyncClient)notificationSyncClient;
- (HDPrimaryProfile)profile;
- (HDSummariesHealthDaemonPluginProfileExtension)initWithProfile:(id)a3;
- (id)unitTest_didProcessNotificationInstruction;
- (void)_handleDismissInstructionWithClient:(id)a3;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
- (void)setNotificationSyncClient:(id)a3;
- (void)setUnitTest_didProcessNotificationInstruction:(id)a3;
@end

@implementation HDSummariesHealthDaemonPluginProfileExtension

- (HDSummariesHealthDaemonPluginProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDSummariesHealthDaemonPluginProfileExtension;
  v5 = [(HDSummariesHealthDaemonPluginProfileExtension *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x263F432A0]);
    v8 = HKCreateSerialDispatchQueue();
    uint64_t v9 = [v7 initWithProfile:v4 clientIdentifier:@"SummariesHealthSharingNotificationSyncClientIdentifier" queue:v8];
    notificationSyncClient = v6->_notificationSyncClient;
    v6->_notificationSyncClient = (HDNotificationSyncClient *)v9;

    [(HDNotificationSyncClient *)v6->_notificationSyncClient setDelegate:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v12 = [WeakRetained healthDaemon];
    [v12 registerDaemonReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (os_log_t *)MEMORY[0x263F09948];
  v8 = (void *)*MEMORY[0x263F09948];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v10 = objc_opt_class();
    id v11 = v10;
    v12 = NSStringFromHKNotificationInstructionAction();
    int v15 = 138543618;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_25E503000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", (uint8_t *)&v15, 0x16u);
  }
  if (a4 == 1)
  {
    [(HDSummariesHealthDaemonPluginProfileExtension *)self _handleDismissInstructionWithClient:v6];
  }
  else
  {
    _HKInitializeLogging();
    v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[HDSummariesHealthDaemonPluginProfileExtension notificationSyncClient:didReceiveInstructionWithAction:]((uint64_t)self, a4, v13);
    }
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction) {
    unitTest_didProcessNotificationInstruction[2]();
  }
}

- (void)_handleDismissInstructionWithClient:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = (void **)MEMORY[0x263F09948];
  id v6 = *MEMORY[0x263F09948];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09948], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_25E503000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling dismiss instruction", buf, 0xCu);
  }
  id v26 = 0;
  id v7 = [v4 pendingNotificationDismissInstructionsWithError:&v26];
  id v8 = v26;
  _HKInitializeLogging();
  uint64_t v9 = *v5;
  v10 = *v5;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      v12 = (HDSummariesHealthDaemonPluginProfileExtension *)objc_opt_class();
      v13 = v12;
      objc_super v14 = [v7 messageIdentifiers];
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_25E503000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification dismiss instructions with identifiers: %{public}@", buf, 0x16u);
    }
    int v15 = [v7 categoryIdentifiers];
    v16 = [v15 allObjects];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v18 = [WeakRetained notificationManager];
    [v18 removeDeliveredNotificationsWithIdentifiers:v16];

    id v25 = v8;
    LODWORD(v18) = [v4 markPendingNotificationInstructionsAsProcessed:v7 error:&v25];
    id v19 = v25;

    _HKInitializeLogging();
    v20 = *v5;
    v21 = *v5;
    if (v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v20;
        v23 = (HDSummariesHealthDaemonPluginProfileExtension *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v28 = v23;
        __int16 v29 = 2114;
        v30 = v16;
        v24 = v23;
        _os_log_impl(&dword_25E503000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed notifications: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[HDSummariesHealthDaemonPluginProfileExtension _handleDismissInstructionWithClient:](v20);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HDSummariesHealthDaemonPluginProfileExtension _handleDismissInstructionWithClient:](v9);
    }
    id v19 = v8;
  }
}

- (HDPrimaryProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDPrimaryProfile *)WeakRetained;
}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (void)setNotificationSyncClient:(id)a3
{
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationSyncClient:(os_log_t)log didReceiveInstructionWithAction:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25E503000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected notification instruction received: %ld", (uint8_t *)&v3, 0x16u);
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_25E503000, v4, v5, "[%{public}@] Pending notification dismiss instructions returned nil with error = [%{public}@]", v6, v7, v8, v9, v10);
}

- (void)_handleDismissInstructionWithClient:(void *)a1 .cold.2(void *a1)
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_25E503000, v4, v5, "[%{public}@] Mark pending notification instruction as processed failed with error: [%{public}@]", v6, v7, v8, v9, v10);
}

@end