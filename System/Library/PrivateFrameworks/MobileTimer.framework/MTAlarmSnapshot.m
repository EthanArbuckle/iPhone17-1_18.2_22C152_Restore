@interface MTAlarmSnapshot
+ (BOOL)shouldScheduleSnapshotForAlarms:(id)a3;
- (MTAlarmSnapshot)initWithStorage:(id)a3;
- (MTAlarmStorage)storage;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
@end

@implementation MTAlarmSnapshot

- (MTAlarmSnapshot)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAlarmSnapshot;
  v6 = [(MTSnapshotScheduler *)&v9 initWithBundleID:@"com.apple.mobiletimer"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    [(MTAlarmStorage *)v7->_storage registerObserver:v7];
  }

  return v7;
}

+ (BOOL)shouldScheduleSnapshotForAlarms:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_5);
}

uint64_t __51__MTAlarmSnapshot_shouldScheduleSnapshotForAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSleepAlarm] ^ 1;
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(id)objc_opt_class() shouldScheduleSnapshotForAlarms:v5];

  if (v6)
  {
    v7 = MTLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      objc_super v9 = self;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm added - Request snapshot", (uint8_t *)&v8, 0xCu);
    }

    [(MTSnapshotScheduler *)self scheduleSnapshot];
  }
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(id)objc_opt_class() shouldScheduleSnapshotForAlarms:v5];

  if (v6)
  {
    v7 = MTLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      objc_super v9 = self;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm updated - Request snapshot", (uint8_t *)&v8, 0xCu);
    }

    [(MTSnapshotScheduler *)self scheduleSnapshot];
  }
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [(id)objc_opt_class() shouldScheduleSnapshotForAlarms:v5];

  if (v6)
  {
    v7 = MTLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      objc_super v9 = self;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Alarm removed - Request snapshot", (uint8_t *)&v8, 0xCu);
    }

    [(MTSnapshotScheduler *)self scheduleSnapshot];
  }
}

- (MTAlarmStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

@end