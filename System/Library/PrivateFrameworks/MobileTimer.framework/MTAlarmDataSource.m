@interface MTAlarmDataSource
- (BOOL)hasSleepAlarmMatchingAlarmIDString:(id)a3;
- (MTAlarm)sleepAlarm;
- (MTAlarmDataSource)initWithAlarmManager:(id)a3;
- (MTAlarmManager)alarmManager;
- (MTObserverStore)observers;
- (NSMutableArray)alarms;
- (NSMutableArray)sleepAlarms;
- (id)addAlarm:(id)a3;
- (id)alarmAtRow:(unint64_t)a3;
- (id)reloadAlarms;
- (id)reloadAlarmsNotifyObservers:(BOOL)a3;
- (id)removeAlarm:(id)a3;
- (id)updateAlarm:(id)a3;
- (id)updateAlarm:(id)a3 reload:(BOOL)a4;
- (unint64_t)numberOfAlarms;
- (unint64_t)rowForAlarm:(id)a3;
- (unint64_t)rowForAlarmWithID:(id)a3;
- (void)_handleAlarmNotification:(id)a3 block:(id)a4;
- (void)_iterateObserversWithBlock:(id)a3;
- (void)_registerForNotifications;
- (void)_stateReset;
- (void)dealloc;
- (void)registerObserver:(id)a3;
- (void)setAlarmManager:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSleepAlarm:(id)a3;
- (void)setSleepAlarms:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation MTAlarmDataSource

- (MTAlarm)sleepAlarm
{
  return self->_sleepAlarm;
}

void __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = 0;

  uint64_t v13 = objc_opt_new();
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v21 isSleepAlarm]) {
          uint64_t v22 = 40;
        }
        else {
          uint64_t v22 = 24;
        }
        [*(id *)(*(void *)(a1 + 32) + v22) addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v18);
  }

  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 40) firstObject];
  uint64_t v24 = *(void *)(a1 + 32);
  v25 = *(void **)(v24 + 32);
  *(void *)(v24 + 32) = v23;

  if (*(unsigned char *)(a1 + 40))
  {
    v26 = MTLogForCategory(3);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v27;
      _os_log_impl(&dword_19CC95000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ calling reload block", buf, 0xCu);
    }

    v28 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_15;
    v30[3] = &unk_1E5917D68;
    v30[4] = v28;
    [v28 _iterateObserversWithBlock:v30];
    v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v29;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ finished reloading", buf, 0xCu);
    }
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 dataSourceDidReload:*(void *)(a1 + 32)];
}

- (void)_iterateObserversWithBlock:(id)a3
{
}

- (id)reloadAlarms
{
  return [(MTAlarmDataSource *)self reloadAlarmsNotifyObservers:1];
}

- (unint64_t)numberOfAlarms
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  alarms = self->_alarms;
  return [(NSMutableArray *)alarms count];
}

uint64_t __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_17()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (id)alarmAtRow:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  alarms = self->_alarms;
  return (id)[(NSMutableArray *)alarms objectAtIndexedSubscript:a3];
}

- (void)registerObserver:(id)a3
{
}

- (id)reloadAlarmsNotifyObservers:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = MTLogForCategory(3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ asynchronously reloading alarms", buf, 0xCu);
  }

  id v6 = [(MTAlarmManager *)self->_alarmManager alarmsIncludingSleepAlarm:1];
  v7 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  uint64_t v8 = [v6 reschedule:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke;
  v12[3] = &unk_1E5917D90;
  v12[4] = self;
  BOOL v13 = a3;
  uint64_t v9 = [v8 addCompletionBlock:v12];
  v10 = [v9 flatMap:&__block_literal_global_40];

  return v10;
}

- (MTAlarmDataSource)initWithAlarmManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v13.receiver = self;
  v13.super_class = (Class)MTAlarmDataSource;
  id v6 = [(MTAlarmDataSource *)&v13 init];
  if (v6)
  {
    v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_alarmManager, a3);
    uint64_t v8 = objc_opt_new();
    alarms = v6->_alarms;
    v6->_alarms = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (MTObserverStore *)v10;

    [(MTAlarmDataSource *)v6 _registerForNotifications];
  }

  return v6;
}

- (void)_registerForNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  alarmManager = self->_alarmManager;
  id v5 = [MEMORY[0x1E4F28F08] mainQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke;
  v29[3] = &unk_1E5917D18;
  v29[4] = self;
  id v6 = (id)[v3 addObserverForName:@"MTAlarmManagerAlarmsAdded" object:alarmManager queue:v5 usingBlock:v29];

  v7 = self->_alarmManager;
  uint64_t v8 = [MEMORY[0x1E4F28F08] mainQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_4;
  v28[3] = &unk_1E5917D18;
  v28[4] = self;
  id v9 = (id)[v3 addObserverForName:@"MTAlarmManagerAlarmsRemoved" object:v7 queue:v8 usingBlock:v28];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_7;
  v27[3] = &unk_1E5917BE8;
  v27[4] = self;
  uint64_t v10 = (void *)MEMORY[0x19F3A0FB0](v27);
  uint64_t v11 = self->_alarmManager;
  v12 = [MEMORY[0x1E4F28F08] mainQueue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_9;
  v25[3] = &unk_1E5917D40;
  v25[4] = self;
  id v13 = v10;
  id v26 = v13;
  id v14 = (id)[v3 addObserverForName:@"MTAlarmManagerFiringAlarmChanged" object:v11 queue:v12 usingBlock:v25];

  v15 = self->_alarmManager;
  uint64_t v16 = [MEMORY[0x1E4F28F08] mainQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_10;
  v23[3] = &unk_1E5917D40;
  v23[4] = self;
  id v24 = v13;
  id v17 = v13;
  id v18 = (id)[v3 addObserverForName:@"MTAlarmManagerAlarmsUpdated" object:v15 queue:v16 usingBlock:v23];

  uint64_t v19 = self->_alarmManager;
  v20 = [MEMORY[0x1E4F28F08] mainQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_11;
  v22[3] = &unk_1E5917D18;
  v22[4] = self;
  id v21 = (id)[v3 addObserverForName:@"MTAlarmManagerStateReset" object:v19 queue:v20 usingBlock:v22];
}

- (void)unregisterObserver:(id)a3
{
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_2;
  v4[3] = &unk_1E5917BE8;
  v4[4] = v2;
  return [v2 _handleAlarmNotification:a2 block:v4];
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_3;
  v6[3] = &unk_1E5917CF0;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _iterateObserversWithBlock:v6];
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSource:*(void *)(a1 + 32) didAddAlarms:*(void *)(a1 + 40)];
  }
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_5;
  v4[3] = &unk_1E5917BE8;
  v4[4] = v2;
  return [v2 _handleAlarmNotification:a2 block:v4];
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_6;
  v6[3] = &unk_1E5917CF0;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _iterateObserversWithBlock:v6];
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSource:*(void *)(a1 + 32) didRemoveAlarms:*(void *)(a1 + 40)];
  }
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__MTAlarmDataSource__registerForNotifications__block_invoke_8;
  v6[3] = &unk_1E5917CF0;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _iterateObserversWithBlock:v6];
}

void __46__MTAlarmDataSource__registerForNotifications__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dataSource:*(void *)(a1 + 32) didUpdateAlarms:*(void *)(a1 + 40)];
  }
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlarmNotification:a2 block:*(void *)(a1 + 40)];
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAlarmNotification:a2 block:*(void *)(a1 + 40)];
}

uint64_t __46__MTAlarmDataSource__registerForNotifications__block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stateReset];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"MTAlarmManagerAlarmsAdded" object:self->_alarmManager];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"MTAlarmManagerAlarmsRemoved" object:self->_alarmManager];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"MTAlarmManagerFiringAlarmChanged" object:self->_alarmManager];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"MTAlarmManagerAlarmsUpdated" object:self->_alarmManager];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:@"MTAlarmManagerStateReset" object:self->_alarmManager];

  v8.receiver = self;
  v8.super_class = (Class)MTAlarmDataSource;
  [(MTAlarmDataSource *)&v8 dealloc];
}

- (void)_handleAlarmNotification:(id)a3 block:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_super v8 = [v6 userInfo];
  id v9 = [v8 objectForKey:@"Alarms"];

  if ([v9 count])
  {
    uint64_t v10 = MTLogForCategory(3);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 name];
      int v13 = 138543874;
      id v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      __int16 v17 = 1024;
      int v18 = [v9 count];
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@ notification for %d alarms.", (uint8_t *)&v13, 0x1Cu);
    }
    id v12 = [(MTAlarmDataSource *)self reloadAlarms];
    v7[2](v7, v9);
  }
}

- (void)_stateReset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTAlarmManagerStateReset notification.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(MTAlarmDataSource *)self reloadAlarms];
}

- (unint64_t)rowForAlarm:(id)a3
{
  id v4 = [a3 alarmIDString];
  unint64_t v5 = [(MTAlarmDataSource *)self rowForAlarmWithID:v4];

  return v5;
}

- (unint64_t)rowForAlarmWithID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  alarms = self->_alarms;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__MTAlarmDataSource_rowForAlarmWithID___block_invoke;
  v9[3] = &unk_1E5917968;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSMutableArray *)alarms indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __39__MTAlarmDataSource_rowForAlarmWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)hasSleepAlarmMatchingAlarmIDString:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  sleepAlarms = self->_sleepAlarms;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__MTAlarmDataSource_hasSleepAlarmMatchingAlarmIDString___block_invoke;
  v8[3] = &unk_1E5917968;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(sleepAlarms) = [(NSMutableArray *)sleepAlarms indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)sleepAlarms;
}

uint64_t __56__MTAlarmDataSource_hasSleepAlarmMatchingAlarmIDString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 alarmIDString];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)addAlarm:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([v5 isSleepAlarm]) {
    objc_storeStrong((id *)&self->_sleepAlarm, a3);
  }
  else {
    [(NSMutableArray *)self->_alarms addObject:v5];
  }
  id v6 = [(MTAlarmDataSource *)self alarmManager];
  unint64_t v7 = [v6 addAlarm:v5];
  objc_super v8 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  id v9 = [v7 reschedule:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__MTAlarmDataSource_addAlarm___block_invoke;
  v12[3] = &unk_1E5915EF8;
  v12[4] = self;
  id v10 = [v9 flatMap:v12];

  return v10;
}

uint64_t __30__MTAlarmDataSource_addAlarm___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAlarms];
}

- (id)updateAlarm:(id)a3
{
  return [(MTAlarmDataSource *)self updateAlarm:a3 reload:1];
}

- (id)updateAlarm:(id)a3 reload:(BOOL)a4
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([v7 isSleepAlarm])
  {
    objc_storeStrong((id *)&self->_sleepAlarm, a3);
  }
  else
  {
    unint64_t v8 = [(MTAlarmDataSource *)self rowForAlarm:v7];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_alarms setObject:v7 atIndexedSubscript:v8];
    }
  }
  id v9 = [(MTAlarmDataSource *)self alarmManager];
  id v10 = [v9 updateAlarm:v7];
  uint64_t v11 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  id v12 = [v10 reschedule:v11];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__MTAlarmDataSource_updateAlarm_reload___block_invoke;
  v15[3] = &unk_1E5917DB8;
  v15[4] = self;
  BOOL v16 = a4;
  int v13 = [v12 flatMap:v15];

  return v13;
}

uint64_t __40__MTAlarmDataSource_updateAlarm_reload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAlarmsNotifyObservers:*(unsigned __int8 *)(a1 + 40)];
}

- (id)removeAlarm:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([v4 isSleepAlarm])
  {
    sleepAlarm = self->_sleepAlarm;
    self->_sleepAlarm = 0;
  }
  else
  {
    unint64_t v6 = [(MTAlarmDataSource *)self rowForAlarm:v4];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_alarms removeObjectAtIndex:v6];
    }
  }
  id v7 = [(MTAlarmDataSource *)self alarmManager];
  unint64_t v8 = [v7 removeAlarm:v4];
  id v9 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  id v10 = [v8 reschedule:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__MTAlarmDataSource_removeAlarm___block_invoke;
  v13[3] = &unk_1E5915EF8;
  v13[4] = self;
  uint64_t v11 = [v10 flatMap:v13];

  return v11;
}

uint64_t __33__MTAlarmDataSource_removeAlarm___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadAlarms];
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (void)setSleepAlarm:(id)a3
{
}

- (NSMutableArray)sleepAlarms
{
  return self->_sleepAlarms;
}

- (void)setSleepAlarms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarms, 0);
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

void __49__MTAlarmDataSource_reloadAlarmsNotifyObservers___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed reloading: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end