@interface HDSPSleepScreenUnlockDetector
- (BOOL)isDetecting;
- (HDSPEnvironment)environment;
- (HDSPSleepScreenUnlockDetector)initWithEnvironment:(id)a3;
- (HDSPWakeDetectorDelegate)wakeDetectorDelegate;
- (HKSPMutexProvider)mutexProvider;
- (unint64_t)numberOfTimesDismissed;
- (unint64_t)type;
- (void)_resetCounter;
- (void)_withLock:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)setNumberOfTimesDismissed:(unint64_t)a3;
- (void)setWakeDetectorDelegate:(id)a3;
- (void)sleepLockWasDismissed;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)startDetecting;
- (void)stopDetecting;
@end

@implementation HDSPSleepScreenUnlockDetector

- (HDSPSleepScreenUnlockDetector)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepScreenUnlockDetector;
  v5 = [(HDSPSleepScreenUnlockDetector *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = [v4 mutexGenerator];
    uint64_t v8 = v7[2]();
    mutexProvider = v6->_mutexProvider;
    v6->_mutexProvider = (HKSPMutexProvider *)v8;

    v10 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v5 = [(HDSPSleepScreenUnlockDetector *)self environment];
  id v4 = [v5 sleepModeManager];
  [v4 addObserver:self];
}

- (void)startDetecting
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!self->_isDetecting)
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = (id)objc_opt_class();
      id v4 = v8;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startDetecting", (uint8_t *)&v7, 0xCu);
    }
    self->_isDetecting = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v6 = [WeakRetained actionManager];
    [v6 addObserver:self];
  }
}

- (void)stopDetecting
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = (id)objc_opt_class();
    id v4 = v8;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopDetecting", (uint8_t *)&v7, 0xCu);
  }
  self->_isDetecting = 0;
  [(HDSPSleepScreenUnlockDetector *)self _resetCounter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = [WeakRetained actionManager];
  [v6 removeObserver:self];
}

- (unint64_t)type
{
  return 1;
}

- (void)_resetCounter
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__HDSPSleepScreenUnlockDetector__resetCounter__block_invoke;
  v2[3] = &unk_2645D90C0;
  v2[4] = self;
  [(HDSPSleepScreenUnlockDetector *)self _withLock:v2];
}

uint64_t __46__HDSPSleepScreenUnlockDetector__resetCounter__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNumberOfTimesDismissed:0];
}

- (void)setNumberOfTimesDismissed:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] setNumberOfTimesDismissed: %ld", (uint8_t *)&v9, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v8 = [WeakRetained userDefaults];
  objc_msgSend(v8, "hksp_setInteger:forKey:", a3, @"HDSPSleepScreenUnlockCount");
}

- (unint64_t)numberOfTimesDismissed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v3 = [WeakRetained userDefaults];
  unint64_t v4 = objc_msgSend(v3, "hksp_integerForKey:", @"HDSPSleepScreenUnlockCount");

  return v4;
}

- (void)sleepLockWasDismissed
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(HDSPSleepScreenUnlockDetector *)self isDetecting])
  {
    uint64_t v11 = 0;
    unint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__HDSPSleepScreenUnlockDetector_sleepLockWasDismissed__block_invoke;
    v10[3] = &unk_2645D90E8;
    v10[4] = self;
    v10[5] = &v11;
    [(HDSPSleepScreenUnlockDetector *)self _withLock:v10];
    if (*((unsigned char *)v12 + 24))
    {
      v3 = HKSPLogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v16 = v4;
        id v5 = v4;
        _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] counts as early wake up", buf, 0xCu);
      }
      id v6 = [(HDSPSleepScreenUnlockDetector *)self wakeDetectorDelegate];
      int v7 = [(HDSPSleepScreenUnlockDetector *)self environment];
      id v8 = [v7 currentDateProvider];
      int v9 = v8[2]();
      [v6 wakeDetector:self didDetectWakeUpEventOnDate:v9];
    }
    _Block_object_dispose(&v11, 8);
  }
}

void __54__HDSPSleepScreenUnlockDetector_sleepLockWasDismissed__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) numberOfTimesDismissed] + 1;
  [*(id *)(a1 + 32) setNumberOfTimesDismissed:v2];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2048;
    uint64_t v8 = v2;
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepLockWasDismissed (%ld times)", (uint8_t *)&v5, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 2;
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  if (a3 != a4) {
    [(HDSPSleepScreenUnlockDetector *)self _resetCounter];
  }
}

- (HDSPWakeDetectorDelegate)wakeDetectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeDetectorDelegate);

  return (HDSPWakeDetectorDelegate *)WeakRetained;
}

- (void)setWakeDetectorDelegate:(id)a3
{
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (BOOL)isDetecting
{
  return self->_isDetecting;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_environment);

  objc_destroyWeak((id *)&self->_wakeDetectorDelegate);
}

@end