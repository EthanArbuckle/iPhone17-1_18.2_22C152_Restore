@interface MTTimerSnapshot
- (MTTimerSnapshot)initWithStorage:(id)a3;
- (MTTimerStorage)storage;
- (void)source:(id)a3 didAddTimers:(id)a4;
- (void)source:(id)a3 didRemoveTimers:(id)a4;
- (void)source:(id)a3 didUpdateTimers:(id)a4;
@end

@implementation MTTimerSnapshot

- (MTTimerSnapshot)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTTimerSnapshot;
  v6 = [(MTSnapshotScheduler *)&v9 initWithBundleID:@"com.apple.mobiletimer"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    [(MTTimerStorage *)v7->_storage registerObserver:v7];
  }

  return v7;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = MTLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer added - Request snapshot", (uint8_t *)&v6, 0xCu);
  }

  [(MTSnapshotScheduler *)self scheduleSnapshot];
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = MTLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer updated - Request snapshot", (uint8_t *)&v6, 0xCu);
  }

  [(MTSnapshotScheduler *)self scheduleSnapshot];
}

- (void)source:(id)a3 didRemoveTimers:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = MTLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer removed - Request snapshot", (uint8_t *)&v6, 0xCu);
  }

  [(MTSnapshotScheduler *)self scheduleSnapshot];
}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

@end