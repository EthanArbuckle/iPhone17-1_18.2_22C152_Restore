@interface SBScheduledAlarmObserver
+ (id)sharedInstance;
- (SBScheduledAlarmObserver)init;
- (void)_nextAlarmChanged:(id)a3;
- (void)_updateAlarmStatusBarItem;
@end

@implementation SBScheduledAlarmObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_48 != -1) {
    dispatch_once(&sharedInstance_onceToken_48, &__block_literal_global_341);
  }
  v2 = (void *)sharedInstance___sharedInstance_25;
  return v2;
}

void __42__SBScheduledAlarmObserver_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBScheduledAlarmObserver);
  v1 = (void *)sharedInstance___sharedInstance_25;
  sharedInstance___sharedInstance_25 = (uint64_t)v0;
}

- (SBScheduledAlarmObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBScheduledAlarmObserver;
  v2 = [(SBScheduledAlarmObserver *)&v8 init];
  if (v2)
  {
    v3 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x1E4F78B50]);
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__nextAlarmChanged_ name:*MEMORY[0x1E4F78A80] object:v2->_alarmManager];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__nextAlarmChanged_ name:*MEMORY[0x1E4F78A90] object:v2->_alarmManager];

    [(SBScheduledAlarmObserver *)v2 _updateAlarmStatusBarItem];
  }
  return v2;
}

- (void)_nextAlarmChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 userInfo];
  v7 = [v6 objectForKey:*MEMORY[0x1E4F78A88]];
  objc_super v8 = SBSafeCast(v5, v7);

  v9 = SBLogAlarm();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v4 name];
    v11 = [v8 alarmID];
    int v12 = 138543874;
    v13 = self;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ recieved %{public}@ notification contains alarmID: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [(SBScheduledAlarmObserver *)self _updateAlarmStatusBarItem];
}

- (void)_updateAlarmStatusBarItem
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(MTAlarmManager *)self->_alarmManager nextAlarm];
  id v4 = SBLogAlarm();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    alarmManager = self->_alarmManager;
    *(_DWORD *)buf = 138543874;
    v9 = self;
    __int16 v10 = 2114;
    v11 = alarmManager;
    __int16 v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ updating alarm status bar item with alarm manager %{public}@ using future: %{public}@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke;
  v7[3] = &unk_1E6B0AEC8;
  v7[4] = self;
  id v6 = (id)[v3 addCompletionBlock:v7];
}

void __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__SBScheduledAlarmObserver__updateAlarmStatusBarItem__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  id v3 = SBSafeCast(v2, *(void **)(a1 + 32));
  uint64_t v4 = SBLogAlarm();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v3 alarmID];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v3 != 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ nextAlarmFuture completion block called with alarmID %{public}@, Update status bar: alarm=%{BOOL}u", (uint8_t *)&v8, 0x1Cu);
  }
  id v7 = [(id)SBApp statusBarStateAggregator];
  [v7 setAlarmEnabled:v3 != 0];
}

- (void).cxx_destruct
{
}

@end