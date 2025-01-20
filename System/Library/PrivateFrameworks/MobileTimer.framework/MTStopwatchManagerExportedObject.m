@interface MTStopwatchManagerExportedObject
- (MTStopwatchManager)stopwatchManager;
- (MTStopwatchManagerExportedObject)initWithStopwatchManager:(id)a3;
- (void)_didReceiveTimerServerReadyNotification:(id)a3;
- (void)dealloc;
- (void)didAddLap:(id)a3 forStopwatch:(id)a4;
- (void)didAddLap:(id)a3 forStopwatch:(id)a4 source:(id)a5;
- (void)didClearAllLapsForStopwatch:(id)a3;
- (void)didClearAllLapsForStopwatch:(id)a3 source:(id)a4;
- (void)didCreateStopwatch:(id)a3;
- (void)didDeleteStopwatch:(id)a3;
- (void)didLapLapTimerForStopwatch:(id)a3;
- (void)didLapLapTimerForStopwatch:(id)a3 source:(id)a4;
- (void)didPauseLapTimerForStopwatch:(id)a3;
- (void)didPauseLapTimerForStopwatch:(id)a3 source:(id)a4;
- (void)didResetLapTimerForStopwatch:(id)a3;
- (void)didResetLapTimerForStopwatch:(id)a3 source:(id)a4;
- (void)didResumeLapTimerForStopwatch:(id)a3;
- (void)didResumeLapTimerForStopwatch:(id)a3 source:(id)a4;
- (void)didStartLapTimerForStopwatch:(id)a3;
- (void)didStartLapTimerForStopwatch:(id)a3 source:(id)a4;
- (void)didUpdateStopwatch:(id)a3;
- (void)publishEvent:(id)a3 withStopwatch:(id)a4;
- (void)publishEvent:(id)a3 withStopwatch:(id)a4 modifiedItem:(id)a5;
- (void)publishEvent:(id)a3 withStopwatch:(id)a4 modifiedItem:(id)a5 source:(id)a6;
- (void)publishEvent:(id)a3 withStopwatch:(id)a4 source:(id)a5;
@end

@implementation MTStopwatchManagerExportedObject

- (MTStopwatchManagerExportedObject)initWithStopwatchManager:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTStopwatchManagerExportedObject;
  v5 = [(MTStopwatchManagerExportedObject *)&v8 init];
  if (v5)
  {
    v6 = MTLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v5;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized exported object, manager: %{public}@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v5->_stopwatchManager, v4);
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ deallocing...", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.MTStopwatchServer.ready" object:0];

  v5.receiver = self;
  v5.super_class = (Class)MTStopwatchManagerExportedObject;
  [(MTStopwatchManagerExportedObject *)&v5 dealloc];
}

- (void)_didReceiveTimerServerReadyNotification:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = MTLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [(MTStopwatchManagerExportedObject *)self stopwatchManager];
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received MTStopwatchServerReadyNotification", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MTStopwatchManagerExportedObject__didReceiveTimerServerReadyNotification___block_invoke;
  block[3] = &unk_1E59150A8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__MTStopwatchManagerExportedObject__didReceiveTimerServerReadyNotification___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) stopwatchManager];
  v2 = [v4 notificationCenter];
  v3 = [*(id *)(a1 + 32) stopwatchManager];
  [v2 postNotificationName:@"MTStopwatchManagerStateReset" object:v3];
}

- (void)didCreateStopwatch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MTStopwatchManagerExportedObject_didCreateStopwatch___block_invoke;
  v6[3] = &unk_1E5915000;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__MTStopwatchManagerExportedObject_didCreateStopwatch___block_invoke(uint64_t a1)
{
  v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTStopwatchManager - Stopwatch created", v8, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Stopwatch"];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [*(id *)(a1 + 40) stopwatchManager];
  v6 = [v5 notificationCenter];
  id v7 = [*(id *)(a1 + 40) stopwatchManager];
  [v6 postNotificationName:@"MTStopwatchManagerStopwatchCreated" object:v7 userInfo:v4];
}

- (void)didDeleteStopwatch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MTStopwatchManagerExportedObject_didDeleteStopwatch___block_invoke;
  v6[3] = &unk_1E5915000;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__MTStopwatchManagerExportedObject_didDeleteStopwatch___block_invoke(uint64_t a1)
{
  v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTStopwatchManager - Stopwatch Updated", v8, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Stopwatch"];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [*(id *)(a1 + 40) stopwatchManager];
  v6 = [v5 notificationCenter];
  id v7 = [*(id *)(a1 + 40) stopwatchManager];
  [v6 postNotificationName:@"MTStopwatchManagerStopwatchUpdated" object:v7 userInfo:v4];
}

- (void)didUpdateStopwatch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MTStopwatchManagerExportedObject_didUpdateStopwatch___block_invoke;
  v6[3] = &unk_1E5915000;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__MTStopwatchManagerExportedObject_didUpdateStopwatch___block_invoke(uint64_t a1)
{
  v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "MTStopwatchManager - Stopwatch Updated", v8, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"Stopwatch"];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [*(id *)(a1 + 40) stopwatchManager];
  v6 = [v5 notificationCenter];
  id v7 = [*(id *)(a1 + 40) stopwatchManager];
  [v6 postNotificationName:@"MTStopwatchManagerStopwatchDeleted" object:v7 userInfo:v4];
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4
{
}

- (void)didClearAllLapsForStopwatch:(id)a3
{
}

- (void)didStartLapTimerForStopwatch:(id)a3
{
}

- (void)didPauseLapTimerForStopwatch:(id)a3
{
}

- (void)didLapLapTimerForStopwatch:(id)a3
{
}

- (void)didResetLapTimerForStopwatch:(id)a3
{
}

- (void)didResumeLapTimerForStopwatch:(id)a3
{
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4 source:(id)a5
{
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4
{
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4 modifiedItem:(id)a5
{
}

- (void)publishEvent:(id)a3 withStopwatch:(id)a4 modifiedItem:(id)a5 source:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MTStopwatchManagerExportedObject_publishEvent_withStopwatch_modifiedItem_source___block_invoke;
  block[3] = &unk_1E59155B0;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v13;
  id v22 = v12;
  id v14 = v12;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __83__MTStopwatchManagerExportedObject_publishEvent_withStopwatch_modifiedItem_source___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(9);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) identifier];
    v6 = [*(id *)(a1 + 56) sourceIdentifier];
    int v17 = 138544130;
    uint64_t v18 = v3;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "%{public}@ - Publishing event: %{public}@, for stopwatch id: %{public}@, source identifier: %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  id v7 = objc_opt_new();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    [v7 setObject:v9 forKey:@"Stopwatch"];
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    [v8 setObject:v10 forKey:@"MTStopwatchManagerModifiedItemKey"];
  }
  id v11 = [*(id *)(a1 + 56) sourceIdentifier];

  if (v11)
  {
    id v12 = [*(id *)(a1 + 56) sourceIdentifier];
    [v8 setObject:v12 forKey:@"MTStopwatchSourceIdentifierKey"];
  }
  id v13 = [*(id *)(a1 + 32) stopwatchManager];
  id v14 = [v13 notificationCenter];
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [*(id *)(a1 + 32) stopwatchManager];
  [v14 postNotificationName:v15 object:v16 userInfo:v8];
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 source:(id)a5
{
}

- (void)didClearAllLapsForStopwatch:(id)a3 source:(id)a4
{
}

- (void)didStartLapTimerForStopwatch:(id)a3 source:(id)a4
{
}

- (void)didPauseLapTimerForStopwatch:(id)a3 source:(id)a4
{
}

- (void)didLapLapTimerForStopwatch:(id)a3 source:(id)a4
{
}

- (void)didResetLapTimerForStopwatch:(id)a3 source:(id)a4
{
}

- (void)didResumeLapTimerForStopwatch:(id)a3 source:(id)a4
{
}

- (MTStopwatchManager)stopwatchManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stopwatchManager);
  return (MTStopwatchManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end