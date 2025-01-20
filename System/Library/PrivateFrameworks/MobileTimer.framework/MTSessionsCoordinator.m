@interface MTSessionsCoordinator
+ (BOOL)supportsSessions;
- (BOOL)_isSystemReady;
- (BOOL)hasActiveSession;
- (BOOL)systemReady;
- (BSServiceConnectionClient)connection;
- (MTAlarmStorage)alarmStorage;
- (MTSessionsCoordinator)initWithStorage:(id)a3 alarmStorage:(id)a4;
- (MTSessionsManager)sessionsManager;
- (MTTimerStorage)timerStorage;
- (NAScheduler)serializer;
- (OS_dispatch_queue)connectionQueue;
- (OS_dispatch_queue)serializerQueue;
- (id)currentDateProvider;
- (id)currentTimer;
- (id)normalizedTimeString:(double)a3 state:(unint64_t)a4;
- (id)server;
- (id)setupInterface;
- (id)sourceIdentifier;
- (id)timerWithIdentifier:(id)a3;
- (void)_endAlertWithId:(id)a3 activityId:(id)a4;
- (void)buildConnection;
- (void)dealloc;
- (void)didEndAlertWithId:(id)a3 activityId:(id)a4;
- (void)didRestoreAlarmSessions:(id)a3;
- (void)didRestoreTimerSessions:(id)a3;
- (void)dismissAlarmWithId:(id)a3;
- (void)dismissTimerAndEndSessionWithId:(id)a3 completion:(id)a4;
- (void)dismissTimerWithIdentifier:(id)a3;
- (void)endAlertingSession;
- (void)endSessionForTimerId:(id)a3;
- (void)handleSystemReady;
- (void)initializeSessionWithTimer:(id)a3;
- (void)pauseTimerWithId:(id)a3;
- (void)processAlarmUpdate:(id)a3 fromAlarm:(id)a4;
- (void)processTimerStateUpdate:(id)a3 fromTimer:(id)a4;
- (void)processTimerUpdate:(id)a3 fromTimer:(id)a4 changeSet:(id)a5;
- (void)removeSessionForAlarm:(id)a3;
- (void)removeSessionForAlarm:(id)a3 removeFromServer:(BOOL)a4;
- (void)repeatTimerWithIdentifier:(id)a3;
- (void)resendAlarmDataEntryWithId:(id)a3;
- (void)resendTimerDataEntryWithId:(id)a3;
- (void)restoreSessions;
- (void)resumeTimerWithId:(id)a3;
- (void)server;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setCurrentDateProvider:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSerializerQueue:(id)a3;
- (void)setSessionsManager:(id)a3;
- (void)setSystemReady:(BOOL)a3;
- (void)snoozeAlarmWithId:(id)a3;
- (void)source:(id)a3 didAddTimers:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didDismissTimer:(id)a4;
- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5;
- (void)source:(id)a3 didFireTimer:(id)a4;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didRemoveTimers:(id)a4;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4 previousAlarms:(id)a5;
- (void)source:(id)a3 didUpdateTimers:(id)a4 fromTimers:(id)a5;
- (void)stopSnoozeAlarmWithId:(id)a3;
- (void)stopTimerWithId:(id)a3;
- (void)updateTimerWithId:(id)a3 state:(unint64_t)a4;
@end

@implementation MTSessionsCoordinator

- (void)endAlertingSession
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(MTSessionsCoordinator *)self hasActiveSession])
  {
    v3 = MTLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ ending alerting session", (uint8_t *)&v6, 0xCu);
    }

    v4 = [(MTSessionsCoordinator *)self server];
    v5 = [v4 alertingSessionId];

    if ([v5 length]) {
      [(MTSessionsCoordinator *)self _endAlertWithId:v5 activityId:0];
    }
  }
}

- (BOOL)hasActiveSession
{
  v3 = [(MTSessionsCoordinator *)self sessionsManager];
  if ([v3 hasActiveAlarmSession])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(MTSessionsCoordinator *)self sessionsManager];
    char v4 = [v5 hasActiveTimerSession];
  }
  return v4;
}

- (MTSessionsManager)sessionsManager
{
  return self->_sessionsManager;
}

- (MTSessionsCoordinator)initWithStorage:(id)a3 alarmStorage:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    v9 = MTLogForCategory(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543874;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v7;
      __int16 v27 = 2114;
      id v28 = v8;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@ with timerStorage:%{public}@ alarmStorage:%{public}@", (uint8_t *)&v23, 0x20u);
    }

    objc_storeStrong((id *)&self->_timerStorage, a3);
    objc_storeStrong((id *)&self->_alarmStorage, a4);
    [(MTTimerStorage *)self->_timerStorage registerObserver:self];
    [(MTAlarmStorage *)self->_alarmStorage registerObserver:self];
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MTSessionsCoordinator.serialqueue", v10);
    [(MTSessionsCoordinator *)self setSerializerQueue:v11];

    v12 = (void *)MEMORY[0x1E4F7A0F0];
    v13 = [(MTSessionsCoordinator *)self serializerQueue];
    v14 = [v12 schedulerWithDispatchQueue:v13];
    serializer = self->_serializer;
    self->_serializer = v14;

    v16 = (MTSessionsManager *)objc_alloc_init((Class)getMTSessionsManagerClass());
    sessionsManager = self->_sessionsManager;
    self->_sessionsManager = v16;

    v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobiletimer.launchAngelConnection", 0);
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v18;

    v20 = MTCurrentDateProvider();
    id currentDateProvider = self->_currentDateProvider;
    self->_id currentDateProvider = v20;

    [(MTSessionsCoordinator *)self buildConnection];
  }

  return self;
}

- (void)restoreSessions
{
  sessionsManager = self->_sessionsManager;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MTSessionsCoordinator_restoreSessions__block_invoke;
  v6[3] = &unk_1E59154C0;
  v6[4] = self;
  [(MTSessionsManager *)sessionsManager restoreAlarmSessionsWithCompletion:v6];
  char v4 = self->_sessionsManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__MTSessionsCoordinator_restoreSessions__block_invoke_3;
  v5[3] = &unk_1E59154C0;
  v5[4] = self;
  [(MTSessionsManager *)v4 restoreTimerSessionsWithCompletion:v5];
}

void __40__MTSessionsCoordinator_restoreSessions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ restored alarm sessions: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) didRestoreAlarmSessions:v3];
}

void __40__MTSessionsCoordinator_restoreSessions__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ restored timer sessions: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) didRestoreTimerSessions:v3];
}

+ (BOOL)supportsSessions
{
  id MTSessionsManagerClass = getMTSessionsManagerClass();
  return [MTSessionsManagerClass supportsSessions];
}

- (BOOL)_isSystemReady
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(MTSessionsCoordinator *)self serializerQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MTSessionsCoordinator__isSystemReady__block_invoke;
  v5[3] = &unk_1E5915340;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __39__MTSessionsCoordinator__isSystemReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)handleSystemReady
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ handleSystemReady, restoring sessions", buf, 0xCu);
  }

  char v4 = [(MTSessionsCoordinator *)self serializerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MTSessionsCoordinator_handleSystemReady__block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_sync(v4, block);

  [(MTSessionsCoordinator *)self restoreSessions];
}

uint64_t __42__MTSessionsCoordinator_handleSystemReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did add timers, starting sessions", buf, 0xCu);
  }

  serializer = self->_serializer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MTSessionsCoordinator_source_didAddTimers___block_invoke;
  v9[3] = &unk_1E5915000;
  id v10 = v5;
  dispatch_queue_t v11 = self;
  id v8 = v5;
  [(NAScheduler *)serializer performBlock:v9];
}

uint64_t __45__MTSessionsCoordinator_source_didAddTimers___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__MTSessionsCoordinator_source_didAddTimers___block_invoke_2;
  v3[3] = &unk_1E59160A0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __45__MTSessionsCoordinator_source_didAddTimers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 3) {
    [*(id *)(a1 + 32) initializeSessionWithTimer:v3];
  }
}

- (void)source:(id)a3 didFireTimer:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ did fire timer", buf, 0xCu);
  }

  uint64_t v7 = [(MTSessionsCoordinator *)self server];
  [v7 warmUp];

  serializer = self->_serializer;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke;
  v10[3] = &unk_1E5915000;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(NAScheduler *)serializer performBlock:v10];
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sessionsManager];
  id v3 = [*(id *)(a1 + 40) timerIDString];
  char v4 = [v2 activityIdForTimerId:v3];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_2;
  v15[3] = &unk_1E5915000;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v16 = v5;
  uint64_t v17 = v6;
  uint64_t v7 = (void (**)(void))MEMORY[0x19F3A0FB0](v15);
  if (v4)
  {
    id v8 = [*(id *)(a1 + 32) sessionsManager];
    id v9 = [*(id *)(a1 + 40) timerIDString];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_8;
    v13[3] = &unk_1E59156E8;
    v13[4] = *(void *)(a1 + 32);
    uint64_t v14 = v7;
    [v8 finishSessionWithTimerId:v9 completion:v13];
  }
  else
  {
    id v10 = MTLogForCategory(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = [*(id *)(a1 + 40) timerIDString];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ didFireTimer could not find activity for timer id:%{public}@", buf, 0x16u);
    }
    v7[2](v7);
  }
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sound];
  char v3 = [v2 isSilent];

  if (v3)
  {
    char v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) timerID];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not posting alert for stop playing timer %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) sessionsManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3;
    v9[3] = &unk_1E59160C8;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    [v7 createSessionWithTimer:(id)v8.i64[0] forAlert:1 completion:v9];
  }
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MTLogForCategory(4);
  int8x16_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ created new session for timer alert, proceeding to alert", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_6;
    block[3] = &unk_1E5915078;
    block[4] = *(void *)(a1 + 32);
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    dispatch_after(1uLL, MEMORY[0x1E4F14428], block);
  }
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_6(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) server];
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = [*(id *)(a1 + 48) timerIDString];
  [v4 alertTimerWithActivityId:v2 timerId:v3];
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ finished timer session with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  id v5 = a4;
  int v6 = [(MTSessionsCoordinator *)self server];
  [v6 warmUp];

  serializer = self->_serializer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke;
  v9[3] = &unk_1E5915000;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  [(NAScheduler *)serializer performBlock:v9];
}

uint64_t __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke_2;
  v3[3] = &unk_1E59160A0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

void __48__MTSessionsCoordinator_source_didRemoveTimers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 timerIDString];
  [v2 endSessionForTimerId:v3];
}

- (void)source:(id)a3 didUpdateTimers:(id)a4 fromTimers:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MTSessionsCoordinator *)self server];
  [v9 warmUp];

  id v10 = MTLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = self;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ did update timer, updating session", buf, 0xCu);
  }

  serializer = self->_serializer;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke;
  v14[3] = &unk_1E5915078;
  id v15 = v7;
  id v16 = v8;
  uint64_t v17 = self;
  id v12 = v8;
  id v13 = v7;
  [(NAScheduler *)serializer performBlock:v14];
}

void __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_2;
  v5[3] = &unk_1E59160F0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  objc_msgSend(v2, "na_each:", v5);
}

void __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_3;
  v12[3] = &unk_1E59151E8;
  id v5 = v3;
  id v13 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v12);
  uint64_t v7 = +[MTChangeSet changeSetWithChangesFromObject:v5 toObject:v6];
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ timer update change set: %{public}@", buf, 0x16u);
  }

  id v10 = +[MTTimer propertiesAffectingSessions];
  int v11 = [v7 hasChangesInProperties:v10];

  if (v11) {
    [*(id *)(a1 + 40) processTimerUpdate:v5 fromTimer:v6 changeSet:v7];
  }
}

uint64_t __59__MTSessionsCoordinator_source_didUpdateTimers_fromTimers___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 timerIDString];
  id v5 = [v3 timerIDString];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (void)source:(id)a3 didDismissTimer:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 timerIDString];
    *(_DWORD *)buf = 138543618;
    id v13 = self;
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ didDismissTimer: %{public}@", buf, 0x16u);
  }
  serializer = self->_serializer;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MTSessionsCoordinator_source_didDismissTimer___block_invoke;
  v10[3] = &unk_1E5915000;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  [(NAScheduler *)serializer performBlock:v10];
}

void __48__MTSessionsCoordinator_source_didDismissTimer___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) timerIDString];
  [v1 endSessionForTimerId:v2];
}

- (void)processTimerUpdate:(id)a3 fromTimer:(id)a4 changeSet:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 state];
  if (v11 == [v9 state])
  {
    id v12 = [v8 fireTime];
    id v13 = [v9 fireTime];
    char v14 = [v12 isEqualToTime:v13];

    if (v14)
    {
      if ([v10 hasChangeForProperty:@"MTTimerTitle"])
      {
        uint64_t v15 = MTLogForCategory(4);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v32 = self;
          _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ updating session title", buf, 0xCu);
        }

        uint64_t v16 = [(MTSessionsCoordinator *)self sessionsManager];
        [v16 updateSessionWithTimer:v8];

        uint64_t v17 = [(MTSessionsCoordinator *)self server];
        uint64_t v18 = [v8 timerIDString];
        uint64_t v19 = [v8 title];
        [v17 updateTimerSessionWithId:v18 title:v19];
      }
    }
    else
    {
      uint64_t v20 = MTLogForCategory(4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v8 timerIDString];
        uint64_t v22 = [v9 fireDate];
        int v23 = [v8 fireDate];
        *(_DWORD *)buf = 138544130;
        v32 = self;
        __int16 v33 = 2114;
        v34 = v21;
        __int16 v35 = 2114;
        v36 = v22;
        __int16 v37 = 2114;
        v38 = v23;
        _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ fire time changed for timer id: %{public}@ from: %{public}@ to: %{public}@, restarting", buf, 0x2Au);
      }
      v24 = [(MTSessionsCoordinator *)self sessionsManager];
      __int16 v25 = [v8 timerIDString];
      id v26 = [v24 activityIdForTimerId:v25];

      if (v26)
      {
        __int16 v27 = [(MTSessionsCoordinator *)self sessionsManager];
        id v28 = [v8 timerIDString];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke;
        v29[3] = &unk_1E5915600;
        v29[4] = self;
        id v30 = v8;
        [v27 finishSessionWithTimerId:v28 completion:v29];
      }
    }
  }
  else
  {
    [(MTSessionsCoordinator *)self processTimerStateUpdate:v8 fromTimer:v9];
  }
}

void __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) initializeSessionWithTimer:*(void *)(a1 + 40)];
}

- (void)processTimerStateUpdate:(id)a3 fromTimer:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v42 = self;
    __int16 v43 = 2114;
    id v44 = v6;
    __int16 v45 = 2114;
    id v46 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ process timer state update: %{public}@, old timer: %{public}@", buf, 0x20u);
  }

  uint64_t v9 = [v6 state];
  if (v9 == 1)
  {
    if ([v6 isFiring]) {
      goto LABEL_24;
    }
    uint64_t v19 = MTLogForCategory(4);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = self;
      _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping timer", buf, 0xCu);
    }

    uint64_t v20 = [v6 timerIDString];
    [(MTSessionsCoordinator *)self endSessionForTimerId:v20];
LABEL_21:

    goto LABEL_24;
  }
  if (v9 == 2)
  {
    v21 = [(MTSessionsCoordinator *)self server];
    uint64_t v22 = [v6 timerIDString];
    int v23 = [v6 title];
    v24 = (void *)MEMORY[0x1E4F28ED0];
    [v6 duration];
    __int16 v25 = objc_msgSend(v24, "numberWithDouble:");
    id v26 = (void *)MEMORY[0x1E4F28ED0];
    [v6 remainingTime];
    __int16 v27 = objc_msgSend(v26, "numberWithDouble:");
    [v6 remainingTime];
    uint64_t v29 = -[MTSessionsCoordinator normalizedTimeString:state:](self, "normalizedTimeString:state:", [v6 state], v28);
    id v30 = (void *)MEMORY[0x1E4F28ED0];
    [v6 remainingTime];
    double v32 = v31;
    [v6 duration];
    v34 = [v30 numberWithDouble:v32 / v33];
    [v21 pauseTimerSessionWithId:v22 title:v23 duration:v25 remaining:v27 timeRemainingString:v29 remainingPortion:v34];

    uint64_t v20 = MTLogForCategory(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = self;
      _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ pausing timer", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (v9 != 3)
  {
    uint64_t v20 = MTLogForCategory(4);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MTSessionsCoordinator processTimerStateUpdate:fromTimer:]();
    }
    goto LABEL_21;
  }
  id v10 = MTLogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v42 = self;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ starting/resuming timer", buf, 0xCu);
  }

  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  __int16 v37 = __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke;
  v38 = &unk_1E5915600;
  uint64_t v39 = self;
  id v11 = v6;
  id v40 = v11;
  id v12 = (void (**)(void, void))MEMORY[0x19F3A0FB0](&v35);
  if (objc_msgSend(v7, "state", v35, v36, v37, v38, v39) != 1) {
    goto LABEL_22;
  }
  id v13 = [(MTSessionsCoordinator *)self sessionsManager];
  char v14 = [v11 timerIDString];
  uint64_t v15 = [v13 activityIdForTimerId:v14];

  if (v15)
  {
    uint64_t v16 = MTLogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v42 = self;
      _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ has existing timer session, need to end it first", buf, 0xCu);
    }

    uint64_t v17 = [(MTSessionsCoordinator *)self sessionsManager];
    uint64_t v18 = [v11 timerIDString];
    [v17 finishSessionWithTimerId:v18 completion:v12];
  }
  else
  {
LABEL_22:
    v12[2](v12, 0);
  }

LABEL_24:
}

void __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) initializeSessionWithTimer:*(void *)(a1 + 40)];
  }
}

- (void)initializeSessionWithTimer:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = MTLogForCategory(4);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 nextTrigger];
    id v8 = [v7 triggerDate];
    int v21 = 138543874;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    id v24 = v5;
    __int16 v25 = 2114;
    id v26 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing session with timer: %{public}@, next fire trigger: %{public}@", (uint8_t *)&v21, 0x20u);
  }
  uint64_t v9 = [(MTSessionsCoordinator *)self server];
  id v10 = [v5 timerIDString];
  id v11 = [v5 title];
  id v12 = [v5 fireDate];
  id v13 = v12;
  if (!v12)
  {
    id v3 = [MEMORY[0x1E4F1C9C8] date];
    [v5 remainingTime];
    id v13 = objc_msgSend(v3, "dateByAddingTimeInterval:");
  }
  char v14 = (void *)MEMORY[0x1E4F28ED0];
  [v5 duration];
  *(float *)&double v15 = v15;
  uint64_t v16 = [v14 numberWithFloat:v15];
  [v9 startTimerSessionWithId:v10 title:v11 estimatedEndDate:v13 duartion:v16];

  if (!v12)
  {
  }
  uint64_t v17 = [(MTSessionsCoordinator *)self sessionsManager];
  uint64_t v18 = [v5 timerIDString];
  uint64_t v19 = [v17 activityIdForTimerId:v18];

  if (!v19)
  {
    uint64_t v20 = [(MTSessionsCoordinator *)self sessionsManager];
    [v20 createSessionWithTimer:v5];
  }
}

- (id)normalizedTimeString:(double)a3 state:(unint64_t)a4
{
  double v4 = round(a3);
  double v5 = 0.0;
  if (a4 == 2) {
    double v5 = 1.0;
  }
  if (v4 < v5) {
    double v4 = v5;
  }
  return FormatTimeWithConfig(0, 0, 0, v4);
}

- (void)endSessionForTimerId:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ ending session for timer id: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [(MTSessionsCoordinator *)self sessionsManager];
  id v7 = [v6 activityIdForTimerId:v4];

  if (v7)
  {
    id v8 = [(MTSessionsCoordinator *)self server];
    [v8 stopTimerSessionWithId:v4];

    uint64_t v9 = [(MTSessionsCoordinator *)self sessionsManager];
    [v9 finishSessionWithTimerId:v4];
  }
  else
  {
    uint64_t v9 = MTLogForCategory(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ no active session for timer id: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)buildConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ activating BSServiceConnection", buf, 0xCu);
  }

  id v4 = [(MTSessionsCoordinator *)self setupInterface];
  double v5 = [MEMORY[0x1E4F50BB8] endpointForMachName:@"com.apple.ClockAngel.mach" service:@"com.apple.ClockAngel-service" instance:0];
  id v6 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
  id v7 = MTLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    int v21 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ created connection: %{public}@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  __int16 v12 = __40__MTSessionsCoordinator_buildConnection__block_invoke;
  id v13 = &unk_1E5916168;
  id v8 = v4;
  id v14 = v8;
  double v15 = self;
  objc_copyWeak(&v16, &location);
  [v6 configureConnection:&v10];
  -[MTSessionsCoordinator setConnection:](self, "setConnection:", v6, v10, v11, v12, v13);
  uint64_t v9 = MTLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = self;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ calling connection activate", buf, 0xCu);
  }

  [v6 activate];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __40__MTSessionsCoordinator_buildConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setName:@"Clock Angel Connection"];
  id v4 = [MEMORY[0x1E4F50BE0] userInitiated];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__MTSessionsCoordinator_buildConnection__block_invoke_2;
  v12[3] = &unk_1E5916118;
  void v12[4] = *(void *)(a1 + 40);
  [v3 setActivationHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__MTSessionsCoordinator_buildConnection__block_invoke_26;
  v11[3] = &unk_1E5916118;
  v11[4] = *(void *)(a1 + 40);
  [v3 setInterruptionHandler:v11];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __40__MTSessionsCoordinator_buildConnection__block_invoke_27;
  id v8 = &unk_1E5916140;
  uint64_t v9 = *(void *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 48));
  [v3 setInvalidationHandler:&v5];
  objc_msgSend(v3, "setTargetQueue:", *(void *)(*(void *)(a1 + 40) + 56), v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
}

void __40__MTSessionsCoordinator_buildConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 remoteProcess];
    id v7 = [v6 bundleIdentifier];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ launch angel connection activated to bundle id: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

void __40__MTSessionsCoordinator_buildConnection__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 remoteProcess];
    id v7 = [v6 bundleIdentifier];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ launch angel connection interrupted to bundle id: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [v3 activate];
}

void __40__MTSessionsCoordinator_buildConnection__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [v3 remoteProcess];
    id v7 = [v6 bundleIdentifier];
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ launch angel connection invalidated to bundle id: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setConnection:0];
  }
}

- (void)dealloc
{
  id v3 = [(MTSessionsCoordinator *)self connection];
  [v3 invalidate];

  [(MTSessionsCoordinator *)self setConnection:0];
  v4.receiver = self;
  v4.super_class = (Class)MTSessionsCoordinator;
  [(MTSessionsCoordinator *)&v4 dealloc];
}

- (id)setupInterface
{
  if (setupInterface_onceToken != -1) {
    dispatch_once(&setupInterface_onceToken, &__block_literal_global_15);
  }
  id v2 = (void *)setupInterface_interface;
  return v2;
}

void __39__MTSessionsCoordinator_setupInterface__block_invoke()
{
  id v4 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.ClockAngel-service"];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EEE34D58];
  [v4 setServer:v0];

  v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EEE1D458];
  [v4 setClient:v1];

  [v4 setClientMessagingExpectation:0];
  uint64_t v2 = [v4 copy];
  id v3 = (void *)setupInterface_interface;
  setupInterface_interface = v2;
}

- (id)server
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(MTSessionsCoordinator *)self connection];

  if (!v3)
  {
    id v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ no server connection, rebuilding", buf, 0xCu);
    }

    [(MTSessionsCoordinator *)self buildConnection];
  }
  uint64_t v5 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v6 = [(MTSessionsCoordinator *)self connection];
  __int16 v12 = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  int v8 = [v6 remoteTargetWithLaunchingAssertionAttributes:v7];

  uint64_t v9 = MTLogForCategory(4);
  int v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = self;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ server connection created", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[MTSessionsCoordinator server](self);
  }

  return v8;
}

- (void)pauseTimerWithId:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ pausing timer", (uint8_t *)&v6, 0xCu);
  }

  [(MTSessionsCoordinator *)self updateTimerWithId:v4 state:2];
}

- (void)resumeTimerWithId:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ resuming timer", (uint8_t *)&v6, 0xCu);
  }

  [(MTSessionsCoordinator *)self updateTimerWithId:v4 state:3];
}

- (void)stopTimerWithId:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ stopping timer", (uint8_t *)&v6, 0xCu);
  }

  [(MTSessionsCoordinator *)self updateTimerWithId:v4 state:1];
}

- (void)resendTimerDataEntryWithId:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resending timer data entry with id: %{public}@", buf, 0x16u);
  }

  if ([(MTSessionsCoordinator *)self systemReady])
  {
    int v6 = [(MTTimerStorage *)self->_timerStorage timers];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__MTSessionsCoordinator_resendTimerDataEntryWithId___block_invoke;
    v13[3] = &unk_1E59151E8;
    id v7 = v4;
    uint64_t v14 = v7;
    uint64_t v8 = objc_msgSend(v6, "na_filter:", v13);
    uint64_t v9 = [v8 firstObject];

    int v10 = MTLogForCategory(4);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        id v16 = self;
        __int16 v17 = 2114;
        uint64_t v18 = v7;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ resending timer to server, id: %{public}@", buf, 0x16u);
      }

      [(MTSessionsCoordinator *)self processTimerStateUpdate:v9 fromTimer:0];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        id v16 = self;
        __int16 v17 = 2114;
        uint64_t v18 = v7;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ could not find matching active timer for id: %{public}@", buf, 0x16u);
      }
    }
    __int16 v12 = v14;
  }
  else
  {
    __int16 v12 = MTLogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = self;
      __int16 v17 = 2114;
      uint64_t v18 = v4;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ system not ready, canceling resend data for timer id: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __52__MTSessionsCoordinator_resendTimerDataEntryWithId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 timerIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)repeatTimerWithIdentifier:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ repeating timer with id: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_120;
  v7[3] = &unk_1E5915600;
  v7[4] = v6;
  id v8 = v5;
  [v6 dismissTimerAndEndSessionWithId:v8 completion:v7];
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_120(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_120_cold_1();
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E5915AA8;
    v8[4] = v6;
    objc_msgSend(v7, "repeatTimerWithIdentifier:withCompletion:source:", v5, v8);
  }
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = MTLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2_cold_1();
    }
  }
}

- (void)dismissTimerWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MTTimerStorage *)self->_timerStorage timers];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke;
  v13[3] = &unk_1E59151E8;
  id v6 = v4;
  id v14 = v6;
  id v7 = objc_msgSend(v5, "na_filter:", v13);
  id v8 = [v7 firstObject];

  LODWORD(v7) = [v8 isFiring];
  uint64_t v9 = MTLogForCategory(4);
  uint64_t v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing firing timer with identifier: %{public}@", buf, 0x16u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_121;
    v11[3] = &unk_1E5915600;
    v11[4] = self;
    id v12 = v6;
    [(MTSessionsCoordinator *)self dismissTimerAndEndSessionWithId:v12 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MTSessionsCoordinator dismissTimerWithIdentifier:]();
    }
  }
}

uint64_t __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 timerIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_121(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = MTLogForCategory(4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_121_cold_1();
    }
  }
}

- (void)dismissTimerAndEndSessionWithId:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing session timer for id: %{public}@", buf, 0x16u);
  }

  uint64_t v9 = dispatch_group_create();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v30 = __Block_byref_object_copy__4;
  double v31 = __Block_byref_object_dispose__4;
  id v32 = 0;
  dispatch_group_enter(v9);
  uint64_t v10 = [(MTSessionsCoordinator *)self sessionsManager];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke;
  v25[3] = &unk_1E5916190;
  v25[4] = self;
  id v11 = v6;
  id v26 = v11;
  double v28 = buf;
  id v12 = v9;
  uint64_t v27 = v12;
  [v10 finishSessionWithTimerId:v11 completion:v25];

  dispatch_group_enter(v12);
  timerStorage = self->_timerStorage;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_122;
  v21[3] = &unk_1E5916190;
  v21[4] = self;
  id v14 = v11;
  id v22 = v14;
  id v24 = buf;
  uint64_t v15 = v12;
  __int16 v23 = v15;
  [(MTTimerStorage *)timerStorage dismissTimerWithIdentifier:v14 withCompletion:v21 source:self];
  connectionQueue = self->_connectionQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_123;
  v18[3] = &unk_1E59161B8;
  id v19 = v7;
  __int16 v20 = buf;
  id v17 = v7;
  dispatch_group_notify(v15, connectionQueue, v18);

  _Block_object_dispose(buf, 8);
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = MTLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_122(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = MTLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_122_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_123(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (void)updateTimerWithId:(id)a3 state:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = MTLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%{public}@ updating timer to state %lu", buf, 0x16u);
  }

  serializer = self->_serializer;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke;
  v10[3] = &unk_1E5915258;
  v10[4] = self;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [(NAScheduler *)serializer performBlock:v10];
}

void __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = (void *)v2[2];
  id v4 = [v2 timerWithIdentifier:a1[5]];
  uint64_t v5 = [v4 timerByUpdatingWithState:a1[6]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2;
  v7[3] = &unk_1E59161E0;
  uint64_t v6 = a1[6];
  v7[4] = a1[4];
  void v7[5] = v6;
  objc_msgSend(v3, "updateTimer:withCompletion:source:", v5, v7);
}

void __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(1);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ updated timer state to %lu successfully", (uint8_t *)&v8, 0x16u);
  }
}

- (id)currentTimer
{
  id v2 = [(MTTimerStorage *)self->_timerStorage timers];
  id v3 = +[MTTimer currentTimerFromTimers:v2];

  return v3;
}

- (id)timerWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTTimerStorage *)self->_timerStorage timers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MTSessionsCoordinator_timerWithIdentifier___block_invoke;
  v9[3] = &unk_1E59151E8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __45__MTSessionsCoordinator_timerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 timerIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)stopSnoozeAlarmWithId:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ received stop snooze alarm action from server for id: %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke;
  v8[3] = &unk_1E5915000;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NAScheduler *)serializer performBlock:v8];
}

uint64_t __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke_2;
  v5[3] = &unk_1E5915AA8;
  void v5[4] = v2;
  return objc_msgSend(v3, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v1, 6, v5);
}

void __47__MTSessionsCoordinator_stopSnoozeAlarmWithId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ dismissing snoozed alarm completed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)dismissAlarmWithId:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ received dismiss alarm action from server for id: %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke;
  v8[3] = &unk_1E5915000;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NAScheduler *)serializer performBlock:v8];
}

void __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) sleepAlarms];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_2;
  v10[3] = &unk_1E5914D40;
  id v11 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "na_filter:", v10);
  uint64_t v4 = [v3 count];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 24);
  if (v4) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_3;
  v9[3] = &unk_1E5915AA8;
  void v9[4] = v6;
  objc_msgSend(v7, "dismissAlarmWithIdentifier:dismissAction:withCompletion:source:", v5, v8, v9);
}

uint64_t __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __44__MTSessionsCoordinator_dismissAlarmWithId___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ dismissing alarm completed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)snoozeAlarmWithId:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ received snooze alarm action from server for id: %{public}@", buf, 0x16u);
  }

  serializer = self->_serializer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke;
  v8[3] = &unk_1E5915000;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NAScheduler *)serializer performBlock:v8];
}

uint64_t __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke_2;
  v5[3] = &unk_1E5915AA8;
  void v5[4] = v2;
  return objc_msgSend(v3, "snoozeAlarmWithIdentifier:snoozeAction:withCompletion:source:", v1, 0, v5);
}

void __43__MTSessionsCoordinator_snoozeAlarmWithId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ snooze alarm completed with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didEndAlertWithId:(id)a3 activityId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = MTLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didEndAlertWithId id: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(MTSessionsCoordinator *)self _endAlertWithId:v6 activityId:v7];
}

- (void)_endAlertWithId:(id)a3 activityId:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(MTSessionsCoordinator *)self sessionsManager];
  int v9 = [v8 activityIdForAlarmId:v6];

  uint64_t v10 = [(MTSessionsCoordinator *)self sessionsManager];
  __int16 v11 = [v10 activityIdForTimerId:v6];

  id v12 = MTLogForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544386;
    int v21 = self;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    uint64_t v29 = v11;
    _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_INFO, "%{public}@ _endAlertWithId for alert id: %{public}@, remote activity id: %{public}@, found local alarm activity id: %{public}@, local timer activity id: %{public}@", buf, 0x34u);
  }

  if (v9)
  {
    alarmStorage = self->_alarmStorage;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__MTSessionsCoordinator__endAlertWithId_activityId___block_invoke;
    v15[3] = &unk_1E5915CD8;
    id v16 = v7;
    id v17 = v9;
    id v18 = self;
    id v19 = v6;
    [(MTAlarmStorage *)alarmStorage alarmWithIdentifier:v19 withCompletion:v15];
  }
  else if (v11)
  {
    [(MTSessionsCoordinator *)self dismissTimerWithIdentifier:v6];
  }
  else
  {
    uint64_t v14 = MTLogForCategory(1);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      int v21 = self;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "%{public}@ does not have any alarm or timer sessions for alert id: %{public}@", buf, 0x16u);
    }
  }
}

void __52__MTSessionsCoordinator__endAlertWithId_activityId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isSnoozed] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) length]
      && ([*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
    {
      id v4 = MTLogForCategory(1);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 56);
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(a1 + 40);
        int v9 = 138544130;
        uint64_t v10 = v5;
        __int16 v11 = 2114;
        uint64_t v12 = v6;
        __int16 v13 = 2114;
        uint64_t v14 = v7;
        __int16 v15 = 2114;
        uint64_t v16 = v8;
        _os_log_error_impl(&dword_19CC95000, v4, OS_LOG_TYPE_ERROR, "%{public}@ mismatched activity ids for alarm id: %{public}@, local: %{public}@, remote: %{public}@", (uint8_t *)&v9, 0x2Au);
      }
    }
    else
    {
      if ([v3 isFiring])
      {
        [*(id *)(a1 + 48) dismissAlarmWithId:*(void *)(a1 + 56)];
        goto LABEL_11;
      }
      id v4 = MTLogForCategory(3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __52__MTSessionsCoordinator__endAlertWithId_activityId___block_invoke_cold_1(a1, v3, v4);
      }
    }
  }
LABEL_11:
}

- (void)resendAlarmDataEntryWithId:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v15 = self;
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resending alarm data entry with id: %{public}@", buf, 0x16u);
  }

  uint64_t v6 = [(MTAlarmStorage *)self->_alarmStorage allAlarms];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__MTSessionsCoordinator_resendAlarmDataEntryWithId___block_invoke;
  v12[3] = &unk_1E5914D40;
  id v7 = v4;
  id v13 = v7;
  uint64_t v8 = objc_msgSend(v6, "na_filter:", v12);
  int v9 = [v8 firstObject];

  uint64_t v10 = MTLogForCategory(4);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      __int16 v15 = self;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ resending alarm to server, id: %{public}@", buf, 0x16u);
    }

    uint64_t v10 = [(MTSessionsCoordinator *)self server];
    [v10 updateAlarmEntry:v9];
  }
  else if (v11)
  {
    *(_DWORD *)buf = 138543618;
    __int16 v15 = self;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ could not find matching active alarm for id: %{public}@", buf, 0x16u);
  }
}

uint64_t __52__MTSessionsCoordinator_resendAlarmDataEntryWithId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)sourceIdentifier
{
  return @"MTWidgetEventListener";
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = self;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ did snooze alarm", buf, 0xCu);
  }

  if (+[MTUtilities mtSBUIIsSystemApertureEnabled])
  {
    serializer = self->_serializer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke;
    v10[3] = &unk_1E5915000;
    void v10[4] = self;
    id v11 = v6;
    [(NAScheduler *)serializer performBlock:v10];
  }
  else
  {
    int v9 = MTLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ system aperture disabled, aborting", buf, 0xCu);
    }
  }
}

void __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionsManager];
  id v3 = [*(id *)(a1 + 40) alarmIDString];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2;
  v5[3] = &unk_1E5915600;
  uint64_t v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 finishSessionWithAlarmId:v3 completion:v5];
}

void __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = MTLogForCategory(1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2_cold_1();
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) sessionsManager];
  [v5 createSessionWithAlarm:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) server];
  [v6 startAlarmSnoozeSessionWithAlarm:*(void *)(a1 + 40)];
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v20 = self;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2048;
    unint64_t v24 = a5;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ didDismissAlarm: %{public}@ with action: %lu", buf, 0x20u);
  }

  int v9 = [(MTSessionsCoordinator *)self sessionsManager];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __62__MTSessionsCoordinator_source_didDismissAlarm_dismissAction___block_invoke;
  __int16 v16 = &unk_1E5915600;
  id v17 = self;
  id v10 = v7;
  id v18 = v10;
  [v9 finishSessionWithAlarm:v10 completion:&v13];

  if (a5 == 6)
  {
    id v11 = [(MTSessionsCoordinator *)self server];
    uint64_t v12 = [v10 alarmIDString];
    [v11 stopAlarmSnoozeSessionWithId:v12];
  }
}

void __62__MTSessionsCoordinator_source_didDismissAlarm_dismissAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) alarmIDString];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ didDismissAlarm finished alarm session for id: %{public}@  with error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = MTLogForCategory(3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = self;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ did fire alarm", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke;
  v16[3] = &unk_1E5915000;
  v16[4] = self;
  id v8 = v6;
  id v17 = v8;
  __int16 v9 = (void *)MEMORY[0x19F3A0FB0](v16);
  serializer = self->_serializer;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_130;
  v13[3] = &unk_1E5915120;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(NAScheduler *)serializer performBlock:v13];
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionsManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2;
  v4[3] = &unk_1E59160C8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 createSessionWithAlarm:v5 forAlert:1 completion:v4];
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = MTLogForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2_cold_1();
    }
  }
  else
  {
    int v7 = [*(id *)(a1 + 32) server];
    [v7 alertAlarm:*(void *)(a1 + 40) activityId:v5];
  }
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_130(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] sessionsManager];
  id v3 = [a1[5] alarmIDString];
  uint64_t v4 = [v2 activityIdForAlarmId:v3];

  if (v4)
  {
    id v5 = MTLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = a1[4];
      int v7 = [a1[5] alarmIDString];
      *(_DWORD *)buf = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ didFireAlarm session already exists for alarm id: %{public}@, ending it first", buf, 0x16u);
    }
    id v8 = [a1[4] sessionsManager];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_131;
    v11[3] = &unk_1E5915B18;
    id v9 = a1[5];
    v11[4] = a1[4];
    id v12 = v9;
    id v13 = a1[6];
    [v8 finishSessionWithAlarm:v12 completion:v11];
  }
  else
  {
    id v10 = (void (*)(void))*((void *)a1[6] + 2);
    v10();
  }
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(1);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_131_cold_2();
    }
  }
  else
  {
    if (v5) {
      __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_131_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_134);
  int v7 = MTLogForCategory(1);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%{public}@ didRemoveAlarms, ending current sessions and sending request to server for alarms: %{public}@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_135;
  v9[3] = &unk_1E5915CB0;
  void v9[4] = self;
  objc_msgSend(v5, "na_each:", v9);

  id v8 = [(MTSessionsCoordinator *)self server];
  [v8 removeAlarms:v6];
}

uint64_t __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 alarmIDString];
}

void __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_135(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_2;
  v7[3] = &unk_1E5915000;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionsManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_3;
  v4[3] = &unk_1E5915600;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 finishSessionWithAlarm:v5 completion:v4];
}

void __48__MTSessionsCoordinator_source_didRemoveAlarms___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) alarmIDString];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ didRemoveAlarms finished alarm session for id: %{public}@  with error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4 previousAlarms:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke;
  v12[3] = &unk_1E5915078;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(NAScheduler *)serializer performBlock:v12];
}

void __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionsManager];
  id v3 = [v2 activeAlarmSessions];

  uint64_t v4 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_2;
  v12[3] = &unk_1E5914D40;
  id v13 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_filter:", v12);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_3;
  v9[3] = &unk_1E5916228;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  uint64_t v11 = v8;
  objc_msgSend(v6, "na_each:", v9);
}

uint64_t __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_4;
  v10[3] = &unk_1E5914D40;
  id v5 = v3;
  id v11 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  id v7 = +[MTChangeSet changeSetWithChangesFromObject:v5 toObject:v6];
  uint64_t v8 = +[MTAlarm propertiesAffectingSessions];
  int v9 = [v7 hasChangesInProperties:v8];

  if (v9) {
    [*(id *)(a1 + 40) processAlarmUpdate:v5 fromAlarm:v6];
  }
}

uint64_t __63__MTSessionsCoordinator_source_didUpdateAlarms_previousAlarms___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 alarmIDString];
  id v5 = [v3 alarmIDString];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (void)processAlarmUpdate:(id)a3 fromAlarm:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MTLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ processAlarmUpdate alarm:%{public}@ fromAlarm:%{public}@", buf, 0x20u);
  }

  serializer = self->_serializer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__MTSessionsCoordinator_processAlarmUpdate_fromAlarm___block_invoke;
  v12[3] = &unk_1E5915078;
  id v13 = v6;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v6;
  [(NAScheduler *)serializer performBlock:v12];
}

void __54__MTSessionsCoordinator_processAlarmUpdate_fromAlarm___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((([*(id *)(a1 + 32) repeats] & 1) != 0 || objc_msgSend(*(id *)(a1 + 40), "isSnoozed"))&& (objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) == 0&& !objc_msgSend(*(id *)(a1 + 32), "isFiring")|| objc_msgSend(*(id *)(a1 + 40), "isSnoozed")&& (objc_msgSend(*(id *)(a1 + 32), "isSnoozed") & 1) == 0&& !objc_msgSend(*(id *)(a1 + 32), "isFiring")|| objc_msgSend(*(id *)(a1 + 40), "isFiring")&& objc_msgSend(*(id *)(a1 + 32), "isSnoozed")&& objc_msgSend(*(id *)(a1 + 32), "isEnabled"))
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    [v2 removeSessionForAlarm:v3 removeFromServer:1];
  }
  else
  {
    uint64_t v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      uint64_t v10 = v6;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not removing session for alarm: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)removeSessionForAlarm:(id)a3
{
}

- (void)removeSessionForAlarm:(id)a3 removeFromServer:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  serializer = self->_serializer;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke;
  id v15 = &unk_1E5915000;
  __int16 v16 = self;
  id v8 = v6;
  id v17 = v8;
  [(NAScheduler *)serializer performBlock:&v12];
  if (v4)
  {
    __int16 v9 = [(MTSessionsCoordinator *)self server];
    uint64_t v10 = [v8 alarmIDString];
    v18[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v9 removeAlarms:v11];
  }
}

void __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionsManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke_2;
  v4[3] = &unk_1E5915600;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 finishSessionWithAlarm:v5 completion:v4];
}

void __64__MTSessionsCoordinator_removeSessionForAlarm_removeFromServer___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = MTLogForCategory(1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) alarmIDString];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%{public}@ removeSessionForAlarm finished alarm session for id: %{public}@  with error: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)didRestoreAlarmSessions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ didRestoreAlarmSessions with ids: %{public}@", buf, 0x16u);
  }

  if ([v4 count])
  {
    id v6 = [(MTAlarmStorage *)self->_alarmStorage allAlarms];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke;
    v15[3] = &unk_1E5914D40;
    void v15[4] = self;
    int v7 = objc_msgSend(v6, "na_filter:", v15);
    uint64_t v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_138);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_3;
    v13[3] = &unk_1E5914F20;
    id v14 = v8;
    id v9 = v8;
    uint64_t v10 = objc_msgSend(v4, "na_filter:", v13);
    __int16 v11 = MTLogForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_INFO, "%{public}@ removing inactive alarm sessions: %{public}@", buf, 0x16u);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_140;
    v12[3] = &unk_1E5916270;
    void v12[4] = self;
    objc_msgSend(v10, "na_each:", v12);
  }
}

uint64_t __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSnoozed])
  {
    id v4 = [v3 snoozeFireDate];
    uint64_t v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
    uint64_t v6 = [v4 mtIsAfterDate:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 alarmIDString];
}

uint64_t __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

void __49__MTSessionsCoordinator_didRestoreAlarmSessions___block_invoke_140(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sessionsManager];
  [v4 finishSessionWithAlarmId:v3 completion:&__block_literal_global_143];
}

- (void)didRestoreTimerSessions:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ didRestoreTimerSessions with ids: %{public}@", buf, 0x16u);
  }

  if ([v4 count])
  {
    uint64_t v6 = [(MTTimerStorage *)self->_timerStorage timers];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__MTSessionsCoordinator_didRestoreTimerSessions___block_invoke;
    v7[3] = &unk_1E59160A0;
    v7[4] = self;
    objc_msgSend(v6, "na_each:", v7);
  }
}

void __49__MTSessionsCoordinator_didRestoreTimerSessions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (+[MTTimer isActiveTimer:v3])
  {
    id v4 = MTLogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [v3 timerID];
      int v12 = 138543618;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ resending timer to server upon restore, id: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 32) processTimerStateUpdate:v3 fromTimer:0];
  }
  else
  {
    int v7 = MTLogForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = [v3 timerIDString];
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%{public}@ removing inactive timer sessions: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    __int16 v10 = [*(id *)(a1 + 32) sessionsManager];
    id v11 = [v3 timerIDString];
    [v10 finishSessionWithTimerId:v11 completion:&__block_literal_global_147];
  }
}

- (MTTimerStorage)timerStorage
{
  return self->_timerStorage;
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void)setSessionsManager:(id)a3
{
}

- (BSServiceConnectionClient)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
}

- (BOOL)systemReady
{
  return self->_systemReady;
}

- (void)setSystemReady:(BOOL)a3
{
  self->_systemReady = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_serializerQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionsManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_timerStorage, 0);
}

void __45__MTSessionsCoordinator_source_didFireTimer___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ couldn't create new session for alert due to error: %{public}@");
}

void __64__MTSessionsCoordinator_processTimerUpdate_fromTimer_changeSet___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ couldn't finish previous timer session: %{public}@");
}

- (void)processTimerStateUpdate:fromTimer:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ cannot process timer state change: %{public}@");
}

void __59__MTSessionsCoordinator_processTimerStateUpdate_fromTimer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ Error ending previous timer session: %{public}@ ");
}

- (void)server
{
  int v7 = [a1 connection];
  OUTLINED_FUNCTION_6(&dword_19CC95000, v1, v2, "%{public}@ server not created for connection: %{public}@", v3, v4, v5, v6, 2u);
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_120_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19CC95000, v0, v1, "%{public}@ failing timer id %{public}@ repeat at group notify with error: %{public}@");
}

void __51__MTSessionsCoordinator_repeatTimerWithIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ error trying to repeat timer: %{public}@");
}

- (void)dismissTimerWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ hit a race, not dismissing non firing timer: %{public}@");
}

void __52__MTSessionsCoordinator_dismissTimerWithIdentifier___block_invoke_121_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19CC95000, v0, v1, "%{public}@ error dismissing timer with identifier: %{public}@, error:%{public}@");
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19CC95000, v0, v1, "%{public}@ error finishing session for timer id: %{public}@, error: %{public}@");
}

void __68__MTSessionsCoordinator_dismissTimerAndEndSessionWithId_completion___block_invoke_122_cold_1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_19CC95000, v0, v1, "%{public}@ error dismissing timer with id: %{public}@, error: %{public}@");
}

void __49__MTSessionsCoordinator_updateTimerWithId_state___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ error pausing timer from widget listerener: %{public}@");
}

void __52__MTSessionsCoordinator__endAlertWithId_activityId___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [a2 alarmID];
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_19CC95000, a3, OS_LOG_TYPE_ERROR, "%{public}@ trying to dismiss non firing alarm with id: %{public}@ for activity id: %{public}@", (uint8_t *)&v8, 0x20u);
}

void __60__MTSessionsCoordinator_source_didSnoozeAlarm_snoozeAction___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ error finishing alarm session: %{public}@");
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ error creating alarm sesssion: %{public}@");
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_131_cold_1(uint64_t a1)
{
  uint64_t v7 = [*(id *)(a1 + 40) alarmIDString];
  OUTLINED_FUNCTION_6(&dword_19CC95000, v1, v2, "%{public}@ didFireAlarm finished previous session for id: %{public}@  without error, creating new session", v3, v4, v5, v6, 2u);
}

void __57__MTSessionsCoordinator_source_didFireAlarm_triggerType___block_invoke_131_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v0, v1, "%{public}@ didFireAlarm error finishing session: %{public}@");
}

@end