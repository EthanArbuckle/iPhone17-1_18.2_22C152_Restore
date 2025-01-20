@interface MTAlarmMigrator
- (MTAlarm)sleepAlarm;
- (NSMutableArray)alarms;
- (void)cleanUpOldNotifications;
- (void)clearInvalidPendingNotifications;
- (void)migrateFromOldStorage;
- (void)removeFromOldStorage;
- (void)setAlarms:(id)a3;
- (void)setSleepAlarm:(id)a3;
@end

@implementation MTAlarmMigrator

- (void)migrateFromOldStorage
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = +[MTLegacyManager sharedManager];
  v5 = [v4 alarms];
  v6 = +[MTLegacyManager sharedManager];
  v7 = [v6 sleepAlarm];
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  v11 = v5;
  __int16 v12 = 2114;
  v13 = v7;
  _os_log_debug_impl(&dword_19CC95000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ need to migrate alarms: %{public}@ and sleep alarm: %{public}@", (uint8_t *)&v8, 0x20u);
}

void __40__MTAlarmMigrator_migrateFromOldStorage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = +[MTLegacyManager alarmFromOldAlarm:a2];
  v4 = MTLogForCategory(3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = [v3 alarmID];
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 1026;
    int v13 = [v3 isEnabled];
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated alarm %{public}@ (enabled: %{public}d)", (uint8_t *)&v8, 0x1Cu);
  }
  v7 = [*(id *)(a1 + 32) alarms];
  [v7 addObject:v3];
}

- (void)removeFromOldStorage
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = MTIsHorseman();
  v4 = MTLogForCategory(3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping migration removal, as this device doesn't support the old storage", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing old alarms and notifications from storage", (uint8_t *)&v6, 0xCu);
    }

    v4 = +[MTLegacyManager sharedManager];
    [v4 purgeLegacyData];
  }
}

- (void)cleanUpOldNotifications
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = MTIsHorseman();
  v4 = MTLogForCategory(3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ notification cleanup, as this device doesn't support the old storage", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v6 = 138543362;
      v7 = self;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ cleaning up old notifications", (uint8_t *)&v6, 0xCu);
    }

    v4 = +[MTLegacyManager sharedManager];
    [v4 cancelNotifications];
  }
}

- (void)clearInvalidPendingNotifications
{
  id v2 = +[MTLegacyManager sharedManager];
  [v2 clearInvalidPendingNotifications];
}

- (NSMutableArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (MTAlarm)sleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setSleepAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
}

@end