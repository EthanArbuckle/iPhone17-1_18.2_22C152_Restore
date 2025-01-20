@interface MTSessionsManager
+ (BOOL)supportsSessions;
- (ACActivityCenter)activityCenter;
- (BOOL)hasActiveAlarmSession;
- (BOOL)hasActiveTimerSession;
- (BOOL)hasAlarmSessionWithId:(id)a3;
- (BOOL)hasTimerSessionWithId:(id)a3;
- (MTSessionsManager)init;
- (_TtC18MobileTimerSupport22MTBaseSessionsProvider)baseProvider;
- (_TtC18MobileTimerSupport23MTAlarmSessionsProvider)alarmProvider;
- (_TtC18MobileTimerSupport23MTTimerSessionsProvider)timerProvider;
- (id)activeAlarmSessions;
- (id)activityIdForAlarmId:(id)a3;
- (id)activityIdForTimerId:(id)a3;
- (id)contextWithAlarm:(id)a3;
- (id)contextWithTimer:(id)a3;
- (id)currentAlertingSession;
- (int64_t)sessionStateForTimer:(id)a3;
- (unint64_t)numberOfActiveSessions;
- (unint64_t)numberOfAvailableSessions;
- (void)createSessionWithAlarm:(id)a3;
- (void)createSessionWithAlarm:(id)a3 completion:(id)a4;
- (void)createSessionWithAlarm:(id)a3 forAlert:(BOOL)a4 completion:(id)a5;
- (void)createSessionWithTimer:(id)a3;
- (void)createSessionWithTimer:(id)a3 completion:(id)a4;
- (void)createSessionWithTimer:(id)a3 forAlert:(BOOL)a4 completion:(id)a5;
- (void)finishSessionWithAlarm:(id)a3 completion:(id)a4;
- (void)finishSessionWithAlarmId:(id)a3 completion:(id)a4;
- (void)finishSessionWithTimer:(id)a3;
- (void)finishSessionWithTimerId:(id)a3;
- (void)finishSessionWithTimerId:(id)a3 completion:(id)a4;
- (void)localSetup;
- (void)restoreAlarmSessionsWithCompletion:(id)a3;
- (void)restoreTimerSessionsWithCompletion:(id)a3;
- (void)setActivityCenter:(id)a3;
- (void)setAlarmProvider:(id)a3;
- (void)setBaseProvider:(id)a3;
- (void)setTimerProvider:(id)a3;
- (void)updateSessionWithAlarm:(id)a3;
- (void)updateSessionWithTimer:(id)a3;
@end

@implementation MTSessionsManager

- (BOOL)hasActiveAlarmSession
{
  v2 = [(MTSessionsManager *)self alarmProvider];
  char v3 = [v2 hasActiveAlarmSession];

  return v3;
}

- (_TtC18MobileTimerSupport23MTAlarmSessionsProvider)alarmProvider
{
  return self->_alarmProvider;
}

- (BOOL)hasActiveTimerSession
{
  v2 = [(MTSessionsManager *)self timerProvider];
  char v3 = [v2 hasActiveTimerSession];

  return v3;
}

- (_TtC18MobileTimerSupport23MTTimerSessionsProvider)timerProvider
{
  return self->_timerProvider;
}

- (MTSessionsManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTSessionsManager;
  v2 = [(MTSessionsManager *)&v5 init];
  char v3 = v2;
  if (v2) {
    [(MTSessionsManager *)v2 localSetup];
  }
  return v3;
}

- (void)restoreAlarmSessionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self alarmProvider];
  [v5 restoreSessionsWithCompletion:v4];
}

- (void)restoreTimerSessionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self timerProvider];
  [v5 restoreSessionsWithCompletion:v4];
}

- (void)localSetup
{
  char v3 = objc_opt_new();
  [(MTSessionsManager *)self setTimerProvider:v3];

  id v4 = objc_opt_new();
  [(MTSessionsManager *)self setAlarmProvider:v4];

  id v5 = objc_opt_new();
  [(MTSessionsManager *)self setBaseProvider:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F18130]);
  [(MTSessionsManager *)self setActivityCenter:v6];
}

- (void)createSessionWithTimer:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MTSessionsManager_createSessionWithTimer___block_invoke;
  v3[3] = &unk_1E637CBE8;
  v3[4] = self;
  [(MTSessionsManager *)self createSessionWithTimer:a3 completion:v3];
}

void __44__MTSessionsManager_createSessionWithTimer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__MTSessionsManager_createSessionWithTimer___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BE27A000, v6, OS_LOG_TYPE_INFO, "%{public}@ created session", (uint8_t *)&v8, 0xCu);
  }
}

- (void)createSessionWithTimer:(id)a3 completion:(id)a4
{
}

- (void)createSessionWithTimer:(id)a3 forAlert:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  unint64_t v10 = [(MTSessionsManager *)self numberOfAvailableSessions];
  if (v10 > 1)
  {
LABEL_18:
    v19 = [(MTSessionsManager *)self timerProvider];
    v20 = [(MTSessionsManager *)self contextWithTimer:v8];
    [v19 createSessionWithContext:v20 completion:v9 forAlert:v6];
    goto LABEL_19;
  }
  if (v6)
  {
    if (!v10)
    {
      v11 = MTLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v8 timerIDString];
        *(_DWORD *)buf = 138543618;
        v23 = self;
        __int16 v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_1BE27A000, v11, OS_LOG_TYPE_INFO, "%{public}@ no sessions available for timer id: %{public}@, will try to end existing alerting session", buf, 0x16u);
      }
      v13 = [(MTSessionsManager *)self currentAlertingSession];
      v14 = MTLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v23 = self;
        __int16 v24 = 2114;
        v25 = v13;
        _os_log_impl(&dword_1BE27A000, v14, OS_LOG_TYPE_INFO, "%{public}@ looked up current alerting session: %{public}@ ", buf, 0x16u);
      }

      v15 = MTLogForCategory();
      v16 = v15;
      if (v13)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v23 = self;
          __int16 v24 = 2114;
          v25 = v13;
          _os_log_impl(&dword_1BE27A000, v16, OS_LOG_TYPE_INFO, "%{public}@ ending current alerting session: %{public}@ ", buf, 0x16u);
        }

        v16 = [(MTSessionsManager *)self activityCenter];
        [v16 endActivity:v13];
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[MTSessionsManager createSessionWithTimer:forAlert:completion:]((uint64_t)self, v16);
      }
    }
    goto LABEL_18;
  }
  v17 = MTLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[MTSessionsManager createSessionWithTimer:forAlert:completion:]((uint64_t)self, v8);
  }

  v18 = NSString;
  v19 = [v8 timerID];
  v20 = [v18 stringWithFormat:@"reached max limit for active sessions, dropping non alerting session for timer id:%@", v19];
  v21 = +[MTSessionError withDescription:v20];
  v9[2](v9, 0, v21);

LABEL_19:
}

- (void)updateSessionWithTimer:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self timerProvider];
  BOOL v6 = [(MTSessionsManager *)self contextWithTimer:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MTSessionsManager_updateSessionWithTimer___block_invoke;
  v7[3] = &unk_1E637CC10;
  v7[4] = self;
  [v5 updateSessionWithContext:v6 completion:v7];
}

void __44__MTSessionsManager_updateSessionWithTimer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__MTSessionsManager_updateSessionWithTimer___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BE27A000, v5, OS_LOG_TYPE_INFO, "%{public}@ updated session", (uint8_t *)&v7, 0xCu);
  }
}

- (void)finishSessionWithTimer:(id)a3
{
  id v4 = [a3 timerIDString];
  [(MTSessionsManager *)self finishSessionWithTimerId:v4];
}

- (void)finishSessionWithTimerId:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self timerProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTSessionsManager_finishSessionWithTimerId___block_invoke;
  v6[3] = &unk_1E637CC10;
  v6[4] = self;
  [v5 finishSessionWithTimerId:v4 completion:v6];
}

void __46__MTSessionsManager_finishSessionWithTimerId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__MTSessionsManager_finishSessionWithTimerId___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BE27A000, v5, OS_LOG_TYPE_INFO, "%{public}@ finished session", (uint8_t *)&v7, 0xCu);
  }
}

- (void)finishSessionWithTimerId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSessionsManager *)self timerProvider];
  [v8 finishSessionWithTimerId:v7 completion:v6];
}

- (id)activityIdForTimerId:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self timerProvider];
  id v6 = [v5 activityIdForTimerIdWithTimerId:v4];

  return v6;
}

- (id)activityIdForAlarmId:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self alarmProvider];
  id v6 = [v5 activityIdForAlarmIdWithAlarmId:v4];

  return v6;
}

- (BOOL)hasTimerSessionWithId:(id)a3
{
  id v3 = [(MTSessionsManager *)self activityIdForTimerId:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasAlarmSessionWithId:(id)a3
{
  id v3 = [(MTSessionsManager *)self activityIdForAlarmId:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)supportsSessions
{
  return +[MTBaseSessionsProvider supportsSessions];
}

- (id)contextWithTimer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [_TtC18MobileTimerSupport12TimerContext alloc];
  int64_t v6 = [(MTSessionsManager *)self sessionStateForTimer:v4];
  id v7 = [v4 timerIDString];
  [v4 duration];
  double v9 = v8;
  [v4 remainingTime];
  double v11 = v10;
  uint64_t v12 = [v4 isFiring];
  v13 = [v4 nextTrigger];
  v14 = [v13 triggerDate];
  v15 = [v4 title];

  v16 = [(TimerContext *)v5 initWithState:v6 timerId:v7 duration:v12 remainingTime:v14 firing:v15 fireDate:v9 title:v11];
  v17 = MTLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v19 = 138543618;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_1BE27A000, v17, OS_LOG_TYPE_INFO, "%{public}@ created timer context: %{public}@ ", (uint8_t *)&v19, 0x16u);
  }

  return v16;
}

- (int64_t)sessionStateForTimer:(id)a3
{
  uint64_t v3 = [a3 state];
  if ((unint64_t)(v3 - 1) > 3) {
    return 3;
  }
  else {
    return qword_1BE325350[v3 - 1];
  }
}

- (void)createSessionWithAlarm:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MTSessionsManager_createSessionWithAlarm___block_invoke;
  v3[3] = &unk_1E637CBE8;
  v3[4] = self;
  [(MTSessionsManager *)self createSessionWithAlarm:a3 completion:v3];
}

void __44__MTSessionsManager_createSessionWithAlarm___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory();
  int64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__MTSessionsManager_createSessionWithAlarm___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_1BE27A000, v6, OS_LOG_TYPE_INFO, "%{public}@ created alarm session", (uint8_t *)&v8, 0xCu);
  }
}

- (void)createSessionWithAlarm:(id)a3 completion:(id)a4
{
}

- (void)createSessionWithAlarm:(id)a3 forAlert:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, void *))a5;
  unint64_t v10 = [(MTSessionsManager *)self numberOfAvailableSessions];
  if (v10 > 1)
  {
LABEL_16:
    v18 = [(MTSessionsManager *)self alarmProvider];
    int v19 = [(MTSessionsManager *)self contextWithAlarm:v8];
    [v18 createSessionWithContext:v19 completion:v9 forAlert:v6];
    goto LABEL_17;
  }
  if (v6)
  {
    if (!v10)
    {
      double v11 = MTLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v8 alarmIDString];
        *(_DWORD *)buf = 138543618;
        v22 = self;
        __int16 v23 = 2114;
        __int16 v24 = v12;
        _os_log_impl(&dword_1BE27A000, v11, OS_LOG_TYPE_INFO, "%{public}@ no sessions available for alarm id: %{public}@, will try to end existing alerting session", buf, 0x16u);
      }
      v13 = [(MTSessionsManager *)self currentAlertingSession];
      v14 = MTLogForCategory();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v22 = self;
          __int16 v23 = 2114;
          __int16 v24 = v13;
          _os_log_impl(&dword_1BE27A000, v15, OS_LOG_TYPE_INFO, "%{public}@ ending current alerting session: %{public}@ ", buf, 0x16u);
        }

        v15 = [(MTSessionsManager *)self activityCenter];
        [v15 endActivity:v13];
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[MTSessionsManager createSessionWithTimer:forAlert:completion:]((uint64_t)self, v15);
      }
    }
    goto LABEL_16;
  }
  v16 = MTLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[MTSessionsManager createSessionWithAlarm:forAlert:completion:]((uint64_t)self, v8);
  }

  v17 = NSString;
  v18 = [v8 alarmIDString];
  int v19 = [v17 stringWithFormat:@"reached max limit for active sessions, dropping non alerting session for alarm id:%@", v18];
  v20 = +[MTSessionError withDescription:v19];
  v9[2](v9, 0, v20);

LABEL_17:
}

- (void)updateSessionWithAlarm:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSessionsManager *)self alarmProvider];
  BOOL v6 = [(MTSessionsManager *)self contextWithAlarm:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MTSessionsManager_updateSessionWithAlarm___block_invoke;
  v7[3] = &unk_1E637CC10;
  v7[4] = self;
  [v5 updateSessionWithContext:v6 completion:v7];
}

void __44__MTSessionsManager_updateSessionWithAlarm___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MTLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44__MTSessionsManager_updateSessionWithAlarm___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BE27A000, v5, OS_LOG_TYPE_INFO, "%{public}@ updated alarm session", (uint8_t *)&v7, 0xCu);
  }
}

- (void)finishSessionWithAlarm:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 alarmIDString];
  [(MTSessionsManager *)self finishSessionWithAlarmId:v7 completion:v6];
}

- (void)finishSessionWithAlarmId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSessionsManager *)self alarmProvider];
  [v8 finishSessionWithAlarmId:v7 completion:v6];
}

- (id)contextWithAlarm:(id)a3
{
  id v3 = a3;
  id v4 = [_TtC18MobileTimerSupport12AlarmContext alloc];
  id v5 = [v3 title];
  id v6 = [v3 alarmIDString];
  uint64_t v7 = [v3 hour];
  uint64_t v8 = [v3 minute];
  uint64_t v9 = [v3 isSnoozed];
  uint64_t v10 = [v3 isFiring];

  double v11 = [(AlarmContext *)v4 initWithTitle:v5 alarmId:v6 hour:v7 min:v8 isSnoozed:v9 isFiring:v10];
  return v11;
}

- (id)activeAlarmSessions
{
  v2 = [(MTSessionsManager *)self alarmProvider];
  id v3 = [v2 activeAlarmSessions];

  return v3;
}

- (unint64_t)numberOfActiveSessions
{
  id v3 = [(MTSessionsManager *)self alarmProvider];
  uint64_t v4 = [v3 numberOfActiveSessions];
  id v5 = [(MTSessionsManager *)self timerProvider];
  uint64_t v6 = [v5 numberOfActiveSessions] + v4;
  uint64_t v7 = [(MTSessionsManager *)self baseProvider];
  unint64_t v8 = v6 + [v7 numberOfStopwatchSessions];

  return v8;
}

- (unint64_t)numberOfAvailableSessions
{
  return 5 - [(MTSessionsManager *)self numberOfActiveSessions];
}

- (id)currentAlertingSession
{
  id v3 = [(MTSessionsManager *)self alarmProvider];
  uint64_t v4 = [v3 alertingSessionId];

  if (!v4)
  {
    id v5 = [(MTSessionsManager *)self timerProvider];
    uint64_t v4 = [v5 alertingSessionId];
  }
  return v4;
}

- (void)setTimerProvider:(id)a3
{
}

- (void)setAlarmProvider:(id)a3
{
}

- (_TtC18MobileTimerSupport22MTBaseSessionsProvider)baseProvider
{
  return self->_baseProvider;
}

- (void)setBaseProvider:(id)a3
{
}

- (ACActivityCenter)activityCenter
{
  return self->_activityCenter;
}

- (void)setActivityCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityCenter, 0);
  objc_storeStrong((id *)&self->_baseProvider, 0);
  objc_storeStrong((id *)&self->_alarmProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
}

void __44__MTSessionsManager_createSessionWithTimer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BE27A000, v0, v1, "%{public}@ create session failed with error: %{public}@");
}

- (void)createSessionWithTimer:(uint64_t)a1 forAlert:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BE27A000, a2, OS_LOG_TYPE_ERROR, "%{public}@ could not find any alerting sessions", (uint8_t *)&v2, 0xCu);
}

- (void)createSessionWithTimer:(uint64_t)a1 forAlert:(void *)a2 completion:.cold.2(uint64_t a1, void *a2)
{
  int v2 = [a2 timerIDString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1BE27A000, v3, v4, "%{public}@ reached max limit for active sessions, dropping non alerting session for timer id: %{public}@", v5, v6, v7, v8, v9);
}

void __44__MTSessionsManager_updateSessionWithTimer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BE27A000, v0, v1, "%{public}@ update session failed with error: %{public}@");
}

void __46__MTSessionsManager_finishSessionWithTimerId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BE27A000, v0, v1, "%{public}@ finish session failed with error: %{public}@");
}

void __44__MTSessionsManager_createSessionWithAlarm___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BE27A000, v0, v1, "%{public}@ create alarm session failed with error: %{public}@");
}

- (void)createSessionWithAlarm:(uint64_t)a1 forAlert:(void *)a2 completion:.cold.2(uint64_t a1, void *a2)
{
  int v2 = [a2 alarmIDString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1BE27A000, v3, v4, "%{public}@ reached max limit for active sessions, dropping non alerting session for alarm id: %{public}@", v5, v6, v7, v8, v9);
}

void __44__MTSessionsManager_updateSessionWithAlarm___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BE27A000, v0, v1, "%{public}@ update alarm session failed with error: %{public}@");
}

@end