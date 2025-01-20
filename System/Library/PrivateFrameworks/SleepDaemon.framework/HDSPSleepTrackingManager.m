@interface HDSPSleepTrackingManager
+ (id)platformSpecificTrackerWithEnvironment:(id)a3;
- (HDSPEnvironment)environment;
- (HDSPSleepSessionManager)sleepSessionManager;
- (HDSPSleepTracker)sleepTracker;
- (HDSPSleepTrackingManager)initWithEnvironment:(id)a3;
- (HDSPSleepTrackingManager)initWithEnvironment:(id)a3 sleepSessionManager:(id)a4 sleepTracker:(id)a5;
- (HKSPObserverSet)sleepSessionObservers;
- (id)sleepSessionManager:(id)a3 requestsProcessedSessionForSession:(id)a4;
- (void)addObserver:(id)a3;
- (void)environmentDidBecomeReady:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)sleepSessionManager:(id)a3 didSaveArchivedSessions:(id)a4;
- (void)sleepSessionManager:(id)a3 didSaveSession:(id)a4;
- (void)sleepSessionManagerDidFinishSession:(id)a3;
@end

@implementation HDSPSleepTrackingManager

- (HDSPSleepTrackingManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [[HDSPSleepSessionManager alloc] initWithEnvironment:v4];
  v6 = [(id)objc_opt_class() platformSpecificTrackerWithEnvironment:v4];
  v7 = [(HDSPSleepTrackingManager *)self initWithEnvironment:v4 sleepSessionManager:v5 sleepTracker:v6];

  return v7;
}

+ (id)platformSpecificTrackerWithEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 behavior];
  if ([v4 isAppleWatch]) {
    v5 = 0;
  }
  else {
    v5 = [[HDSPTimeInBedTracker alloc] initWithEnvironment:v3];
  }

  return v5;
}

- (HDSPSleepTrackingManager)initWithEnvironment:(id)a3 sleepSessionManager:(id)a4 sleepTracker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDSPSleepTrackingManager;
  v11 = [(HDSPSleepTrackingManager *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_sleepSessionManager, a4);
    [(HDSPSleepSessionManager *)v12->_sleepSessionManager setDelegate:v12];
    objc_storeStrong((id *)&v12->_sleepTracker, a5);
    [(HDSPSleepTracker *)v12->_sleepTracker setDelegate:v12->_sleepSessionManager];
    id v13 = objc_alloc(MEMORY[0x263F75E20]);
    v14 = [v8 defaultCallbackScheduler];
    uint64_t v15 = [v13 initWithCallbackScheduler:v14];
    sleepSessionObservers = v12->_sleepSessionObservers;
    v12->_sleepSessionObservers = (HKSPObserverSet *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(HDSPSleepTracker *)self->_sleepTracker environmentWillBecomeReady:v4];
  }
}

- (void)environmentDidBecomeReady:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(HDSPSleepTracker *)self->_sleepTracker environmentDidBecomeReady:v4];
  }
  [(HDSPSleepSessionManager *)self->_sleepSessionManager savePendingSessions];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)sleepSessionManager:(id)a3 didSaveSession:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v5;
    id v7 = v13;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didSaveSession %{public}@", buf, 0x16u);
  }
  sleepSessionObservers = self->_sleepSessionObservers;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__HDSPSleepTrackingManager_sleepSessionManager_didSaveSession___block_invoke;
  v10[3] = &unk_2645D96D0;
  id v11 = v5;
  id v9 = v5;
  [(HKSPObserverSet *)sleepSessionObservers enumerateObserversWithBlock:v10];
}

uint64_t __63__HDSPSleepTrackingManager_sleepSessionManager_didSaveSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepSessionSaved:*(void *)(a1 + 32)];
}

- (void)sleepSessionManager:(id)a3 didSaveArchivedSessions:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    id v15 = v5;
    id v7 = v13;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didSaveArchivedSessions %{public}@", buf, 0x16u);
  }
  sleepSessionObservers = self->_sleepSessionObservers;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HDSPSleepTrackingManager_sleepSessionManager_didSaveArchivedSessions___block_invoke;
  v10[3] = &unk_2645D96D0;
  id v11 = v5;
  id v9 = v5;
  [(HKSPObserverSet *)sleepSessionObservers enumerateObserversWithBlock:v10];
}

void __72__HDSPSleepTrackingManager_sleepSessionManager_didSaveArchivedSessions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 archivedSleepSessionsSaved:*(void *)(a1 + 32)];
  }
}

- (id)sleepSessionManager:(id)a3 requestsProcessedSessionForSession:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v5;
    id v7 = v11;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] requestsProcessedSessionForSession %{public}@", (uint8_t *)&v10, 0x16u);
  }
  if (objc_opt_respondsToSelector()) {
    [(HDSPSleepTracker *)self->_sleepTracker processedSessionForSession:v5];
  }
  else {
  id v8 = [MEMORY[0x263F58190] futureWithResult:v5];
  }

  return v8;
}

- (void)sleepSessionManagerDidFinishSession:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepSessionManagerDidFinishSession", (uint8_t *)&v6, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [(HDSPSleepTracker *)self->_sleepTracker previousSessionFinished];
  }
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPObserverSet)sleepSessionObservers
{
  return self->_sleepSessionObservers;
}

- (HDSPSleepSessionManager)sleepSessionManager
{
  return self->_sleepSessionManager;
}

- (HDSPSleepTracker)sleepTracker
{
  return self->_sleepTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepTracker, 0);
  objc_storeStrong((id *)&self->_sleepSessionManager, 0);
  objc_storeStrong((id *)&self->_sleepSessionObservers, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end