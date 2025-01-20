@interface MTNextAlarmManager
- (MTAlarmManager)alarmManager;
- (MTNextAlarmManager)init;
- (NAScheduler)serializer;
- (NSSet)nextAlarms;
- (id)updateHandler;
- (void)_handleAlarmsDidChange;
- (void)calculateNextAlarms;
- (void)setAlarmManager:(id)a3;
- (void)setNextAlarms:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation MTNextAlarmManager

- (MTNextAlarmManager)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)MTNextAlarmManager;
  v2 = [(MTNextAlarmManager *)&v9 init];
  if (v2)
  {
    v3 = MTLogForCategory(3);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v2;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@...", buf, 0xCu);
    }

    v4 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTNextAlarmManager.accessqueue", +[MTScheduler defaultPriority]);
    [(MTNextAlarmManager *)v2 setSerializer:v4];

    v5 = [MEMORY[0x1E4F1CAD0] set];
    [(MTNextAlarmManager *)v2 setNextAlarms:v5];

    v6 = objc_opt_new();
    [(MTNextAlarmManager *)v2 setAlarmManager:v6];

    [(MTNextAlarmManager *)v2 calculateNextAlarms];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__handleAlarmsDidChange name:@"MTAlarmManagerFiringAlarmChanged" object:v2->_alarmManager];
    [v7 addObserver:v2 selector:sel__handleAlarmsDidChange name:@"MTAlarmManagerNextAlarmChanged" object:v2->_alarmManager];
    [v7 addObserver:v2 selector:sel__handleAlarmsDidChange name:@"MTAlarmManagerAlarmsChanged" object:v2->_alarmManager];
  }
  return v2;
}

- (void)calculateNextAlarms
{
  serializer = self->_serializer;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__MTNextAlarmManager_calculateNextAlarms__block_invoke;
  v3[3] = &unk_1E59150A8;
  v3[4] = self;
  [(NAScheduler *)serializer performBlock:v3];
}

void __41__MTNextAlarmManager_calculateNextAlarms__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) alarmManager];
  v3 = [v2 alarmsSyncIncludingSleepAlarm:1];
  v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_27);

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_55);
  v7 = [v5 setWithArray:v6];
  [*(id *)(a1 + 32) setNextAlarms:v7];

  v8 = [*(id *)(a1 + 32) updateHandler];

  if (v8)
  {
    objc_super v9 = MTLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v11 = [v10 nextAlarms];
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ calling update handler with %{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) updateHandler];
    v13 = [*(id *)(a1 + 32) nextAlarms];
    ((void (**)(void, void *))v12)[2](v12, v13);
  }
}

uint64_t __41__MTNextAlarmManager_calculateNextAlarms__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

id __41__MTNextAlarmManager_calculateNextAlarms__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  v4 = [v2 nextFireDate];
  [v3 setFireDate:v4];

  v5 = [v2 alarmIDString];
  [v3 setIdentifier:v5];

  objc_msgSend(v3, "setIsSleepAlarm:", objc_msgSend(v2, "isSleepAlarm"));
  v6 = [v2 displayTitle];

  [v3 setTitle:v6];
  return v3;
}

- (void)_handleAlarmsDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ _handleAlarmsDidChange", (uint8_t *)&v4, 0xCu);
  }

  [(MTNextAlarmManager *)self calculateNextAlarms];
}

- (NSSet)nextAlarms
{
  return self->_nextAlarms;
}

- (void)setNextAlarms:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_nextAlarms, 0);
}

@end