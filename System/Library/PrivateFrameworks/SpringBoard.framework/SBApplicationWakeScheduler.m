@interface SBApplicationWakeScheduler
- (BSTimerScheduleQuerying)wakeTimer;
- (NSDate)scheduledDate;
- (SBApplicationWakeScheduler)init;
- (id)_expectedFireDateForTimer:(id)a3;
- (id)_initWithLifecycleTracker:(id)a3 forApplication:(id)a4;
- (void)_applicationProcessStateDidChange:(id)a3;
- (void)_forceInvalidate;
- (void)dealloc;
- (void)endResumeIfAwoken;
- (void)invalidate;
- (void)scheduleWakeForDate:(id)a3;
- (void)setWakeTimer:(id)a3;
- (void)unschedule;
- (void)wakeImmediately;
@end

@implementation SBApplicationWakeScheduler

- (SBApplicationWakeScheduler)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationWakeScheduler.m" lineNumber:32 description:@"Init is available for SBApplicationWakeScheduler."];

  return 0;
}

- (id)_initWithLifecycleTracker:(id)a3 forApplication:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBApplicationWakeScheduler;
  v9 = [(SBApplicationWakeScheduler *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lifecycleTracker, a3);
    objc_storeWeak(p_isa + 2, v8);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:p_isa selector:sel__applicationProcessStateDidChange_ name:@"SBApplicationProcessStateDidChange" object:v8];
  }
  return p_isa;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBApplicationWakeScheduler.m" lineNumber:50 description:@"Must be invalidated before deallocating."];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationWakeScheduler;
  [(SBApplicationWakeScheduler *)&v5 dealloc];
}

- (NSDate)scheduledDate
{
  BSDispatchQueueAssertMain();
  v3 = [(SBApplicationWakeScheduler *)self wakeTimer];
  v4 = [(SBApplicationWakeScheduler *)self _expectedFireDateForTimer:v3];

  return (NSDate *)v4;
}

- (void)scheduleWakeForDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (v4 && !self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
    v6 = [WeakRetained bundleIdentifier];

    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "SBApplicationWakeScheduler: scheduling wake for %{public}@ at %{public}@.", buf, 0x16u);
    }

    double v8 = *MEMORY[0x1E4F4F640];
    [v4 timeIntervalSinceNow];
    if (v8 < v9) {
      double v8 = v9;
    }
    id v10 = objc_alloc(MEMORY[0x1E4FA99B0]);
    v11 = [NSString stringWithFormat:@"SBApplicationWakeScheduler:%@", v6];
    v12 = (void *)[v10 initWithIdentifier:v11];

    [(SBApplicationWakeScheduler *)self setWakeTimer:v12];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__SBApplicationWakeScheduler_scheduleWakeForDate___block_invoke;
    v14[3] = &unk_1E6B05000;
    id v15 = v6;
    v16 = self;
    id v13 = v6;
    [v12 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v14 queue:v8 handler:1.0];
  }
}

uint64_t __50__SBApplicationWakeScheduler_scheduleWakeForDate___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "SBApplicationWakeScheduler: wake timer fired for %{public}@.", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setWakeTimer:0];
  return [*(id *)(a1 + 40) wakeImmediately];
}

- (void)unschedule
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (self->_wakeTimer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
    id v4 = [WeakRetained bundleIdentifier];

    int v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "SBApplicationWakeScheduler: unscheduling wake timer for %{public}@", (uint8_t *)&v6, 0xCu);
    }

    [(SBApplicationWakeScheduler *)self setWakeTimer:0];
  }
}

- (void)wakeImmediately
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_application);
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [WeakRetained bundleIdentifier];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "SBApplicationWakeScheduler: waking %{public}@.", (uint8_t *)&v6, 0xCu);
    }
    [(SBApplicationWakeLifecycleHandling *)self->_lifecycleTracker beginWakeForApplication:WeakRetained];
  }
}

- (void)endResumeIfAwoken
{
  BSDispatchQueueAssertMain();
  lifecycleTracker = self->_lifecycleTracker;
  [(SBApplicationWakeLifecycleHandling *)lifecycleTracker endWake];
}

- (void)invalidate
{
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];

    [(SBApplicationWakeScheduler *)self unschedule];
    [(SBApplicationWakeScheduler *)self endResumeIfAwoken];
    self->_invalidated = 1;
  }
}

- (void)_forceInvalidate
{
  BSDispatchQueueAssertMain();
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  self->_invalidated = 1;
}

- (void)setWakeTimer:(id)a3
{
  id v4 = (BSTimerScheduleQuerying *)a3;
  wakeTimer = self->_wakeTimer;
  if (wakeTimer != v4) {
    [(BSTimerScheduleQuerying *)wakeTimer invalidate];
  }
  int v6 = self->_wakeTimer;
  self->_wakeTimer = v4;
}

- (id)_expectedFireDateForTimer:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 timeRemaining];
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
}

- (void)_applicationProcessStateDidChange:(id)a3
{
  id v4 = a3;
  id v12 = [v4 object];
  int v5 = [v4 userInfo];

  int v6 = [v5 objectForKey:@"previousProcessState"];

  uint64_t v7 = [v12 processState];
  char v8 = [v6 isForeground];
  int v9 = [v7 isForeground];
  if ((v8 & 1) == 0 && v9) {
    [(SBApplicationWakeScheduler *)self endResumeIfAwoken];
  }
  uint64_t v10 = [v6 taskState];
  if (v7) {
    BOOL v11 = [v7 taskState] != 1;
  }
  else {
    BOOL v11 = 0;
  }
  if (v10 != 1 && !v11)
  {
    [(SBApplicationWakeScheduler *)self unschedule];
    [(SBApplicationWakeScheduler *)self endResumeIfAwoken];
  }
}

- (BSTimerScheduleQuerying)wakeTimer
{
  return self->_wakeTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeTimer, 0);
  objc_destroyWeak((id *)&self->_application);
  objc_storeStrong((id *)&self->_lifecycleTracker, 0);
}

@end