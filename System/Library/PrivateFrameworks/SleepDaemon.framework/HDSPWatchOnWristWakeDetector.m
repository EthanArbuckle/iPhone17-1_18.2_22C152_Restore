@interface HDSPWatchOnWristWakeDetector
- (BOOL)isDetecting;
- (HDSPEnvironment)environment;
- (HDSPWakeDetectorDelegate)wakeDetectorDelegate;
- (HDSPWatchOnWristWakeDetector)initWithEnvironment:(id)a3;
- (id)onWristMonitor;
- (unint64_t)type;
- (void)detectedOnWristOnDate:(id)a3;
- (void)setWakeDetectorDelegate:(id)a3;
- (void)startDetecting;
- (void)stopDetecting;
@end

@implementation HDSPWatchOnWristWakeDetector

- (HDSPWatchOnWristWakeDetector)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPWatchOnWristWakeDetector;
  v5 = [(HDSPWatchOnWristWakeDetector *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (id)onWristMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v3 = [WeakRetained systemMonitor];
  id v4 = [v3 watchOnWristMonitor];

  return v4;
}

- (void)startDetecting
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_isDetecting)
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = (id)objc_opt_class();
      id v4 = v15;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startDetecting", (uint8_t *)&v14, 0xCu);
    }
    self->_isDetecting = 1;
    v5 = [(HDSPWatchOnWristWakeDetector *)self onWristMonitor];
    [v5 addObserver:self];

    v6 = [(HDSPWatchOnWristWakeDetector *)self onWristMonitor];
    v7 = [v6 lastOnWristDate];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_super v9 = [WeakRetained currentDateProvider];
    v11 = v9[2](v9, v10);

    if (v7)
    {
      [v7 timeIntervalSinceDate:v11];
      if (fabs(v12) < 5.0)
      {
        v13 = [(HDSPWatchOnWristWakeDetector *)self wakeDetectorDelegate];
        [v13 wakeDetector:self didDetectWakeUpEventOnDate:v7];
      }
    }
  }
}

- (void)stopDetecting
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopDetecting", (uint8_t *)&v6, 0xCu);
  }
  self->_isDetecting = 0;
  v5 = [(HDSPWatchOnWristWakeDetector *)self onWristMonitor];
  [v5 removeObserver:self];
}

- (unint64_t)type
{
  return 1;
}

- (void)detectedOnWristOnDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HDSPWatchOnWristWakeDetector *)self isDetecting])
  {
    v5 = HKSPLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v4;
      id v6 = v9;
      _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] detectedOnWristOnDate: %{public}@", (uint8_t *)&v8, 0x16u);
    }
    id v7 = [(HDSPWatchOnWristWakeDetector *)self wakeDetectorDelegate];
    [v7 wakeDetector:self didDetectWakeUpEventOnDate:v4];
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);

  objc_destroyWeak((id *)&self->_wakeDetectorDelegate);
}

@end