@interface ICNASnapshotBackgroundTask
+ (id)makeTaskRequest;
- (BOOL)shouldStartSession;
- (ICNAController)analyticsController;
- (ICNAEventReporter)eventReporter;
- (ICNASnapshotBackgroundTask)initWithAnalyticsController:(id)a3 eventReporter:(id)a4 snapshotReporter:(id)a5;
- (ICNASnapshotReporter)snapshotReporter;
- (void)cleanupWithCompletion:(id)a3;
- (void)didRegister:(BOOL)a3;
- (void)handleTaskExpiration;
- (void)runTaskWithCompletion:(id)a3;
- (void)startAnalyticsSessionWithReferralURL:(id)a3 referralApplication:(id)a4;
@end

@implementation ICNASnapshotBackgroundTask

- (ICNASnapshotBackgroundTask)initWithAnalyticsController:(id)a3 eventReporter:(id)a4 snapshotReporter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICNASnapshotBackgroundTask;
  v12 = [(ICNASnapshotBackgroundTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_analyticsController, a3);
    objc_storeStrong((id *)&v13->_eventReporter, a4);
    objc_storeStrong((id *)&v13->_snapshotReporter, a5);
    v13->_shouldStartSession = [v9 sessionState] == 0;
  }

  return v13;
}

- (void)didRegister:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICNASnapshotBackgroundTask *)self eventReporter];
  [v5 submitSnapshotRegisterEventIsSuccessful:v3];

  v6 = +[ICNASnapshotReporter sharedReporter];
  [v6 scheduleSnapshotIfNecessary];

  v7 = dispatch_get_global_queue(-32768, 0);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__ICNASnapshotBackgroundTask_didRegister___block_invoke;
  v10[3] = &unk_1E64B8A70;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_after(v8, v9, v10);
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

+ (id)makeTaskRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F18B40]) initWithIdentifier:@"com.notes.analytics.snapshotBackgroundTask"];
  [v2 setRequiresNetworkConnectivity:1];
  [v2 setRequiresExternalPower:1];
  return v2;
}

void __42__ICNASnapshotBackgroundTask_didRegister___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) snapshotReporter];
  int v3 = [v2 shouldRunSnapshotManually];

  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2;
    block[3] = &unk_1E64B8A48;
    v5 = *(NSObject **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v4, v5, block);
  }
}

uint64_t __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 32) runTaskWithCompletion:0];
}

- (void)handleTaskExpiration
{
  int v3 = [(ICNASnapshotBackgroundTask *)self eventReporter];
  [v3 submitSnapshotCompletionEventIsSuccessful:0];

  [(ICNASnapshotBackgroundTask *)self cleanupWithCompletion:&__block_literal_global_2];
}

void __50__ICNASnapshotBackgroundTask_handleTaskExpiration__block_invoke()
{
  v0 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __50__ICNASnapshotBackgroundTask_handleTaskExpiration__block_invoke_cold_1();
  }
}

- (void)runTaskWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICNASnapshotBackgroundTask runTaskWithCompletion:]();
  }

  [MEMORY[0x1E4F837E8] postBasicEvent:27];
  if ([(ICNASnapshotBackgroundTask *)self shouldStartSession])
  {
    v6 = [MEMORY[0x1E4F83290] referralURLForSnapshotBackgroundTask];
    [(ICNASnapshotBackgroundTask *)self startAnalyticsSessionWithReferralURL:v6 referralApplication:0];
  }
  v7 = [(ICNASnapshotBackgroundTask *)self analyticsController];
  [v7 addSnapshotReferralDataToSessionLevel];

  dispatch_time_t v8 = [(ICNASnapshotBackgroundTask *)self eventReporter];
  [v8 submitSnapshotTriggeredEvent];

  id v9 = +[ICNASnapshotReporter sharedReporter];
  int v10 = [v9 shouldSnapshot];

  if (v10)
  {
    id v11 = +[ICNASnapshotReporter sharedReporter];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke;
    v17[3] = &unk_1E64B91C8;
    v17[4] = self;
    id v18 = v4;
    id v12 = v4;
    [v11 reallyPerformSnapshotWithCompletionHandler:v17];

    v13 = v18;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_16;
    v15[3] = &unk_1E64B91A0;
    id v16 = v4;
    id v14 = v4;
    [(ICNASnapshotBackgroundTask *)self cleanupWithCompletion:v15];
    v13 = v16;
  }
}

void __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) eventReporter];
  [v2 submitSnapshotCompletionEventIsSuccessful:1];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2;
  v4[3] = &unk_1E64B91A0;
  int v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 cleanupWithCompletion:v4];
}

uint64_t __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1();
  }

  [MEMORY[0x1E4F837E8] postBasicEvent:28];
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_16(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C3EAD000, v2, OS_LOG_TYPE_INFO, "Snapshot not run", v4, 2u);
  }

  [MEMORY[0x1E4F837E8] postBasicEvent:28];
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)startAnalyticsSessionWithReferralURL:(id)a3 referralApplication:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICNASnapshotBackgroundTask *)self analyticsController];
  [v8 startSessionWithReferralURL:v7 referralApplication:v6 startingSessionType:4];
}

- (void)cleanupWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  if ([(ICNASnapshotBackgroundTask *)self shouldStartSession])
  {
    id v4 = [(ICNASnapshotBackgroundTask *)self analyticsController];
    [v4 endSessionSynchronously:0 forSessionType:4 endReason:7 successHandler:v5];
  }
  else if (v5)
  {
    v5[2]();
  }
}

- (ICNAController)analyticsController
{
  return self->_analyticsController;
}

- (ICNASnapshotReporter)snapshotReporter
{
  return self->_snapshotReporter;
}

- (BOOL)shouldStartSession
{
  return self->_shouldStartSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReporter, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
}

void __42__ICNASnapshotBackgroundTask_didRegister___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Running snapshot manually", v2, v3, v4, v5, v6);
}

void __50__ICNASnapshotBackgroundTask_handleTaskExpiration__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1C3EAD000, v0, OS_LOG_TYPE_ERROR, "Snapshot background task expired", v1, 2u);
}

- (void)runTaskWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Snapshot background task started", v2, v3, v4, v5, v6);
}

void __52__ICNASnapshotBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C3EAD000, v0, v1, "Snapshot background task completed", v2, v3, v4, v5, v6);
}

@end