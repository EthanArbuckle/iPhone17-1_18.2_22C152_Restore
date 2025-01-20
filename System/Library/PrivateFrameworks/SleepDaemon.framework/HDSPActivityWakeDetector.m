@interface HDSPActivityWakeDetector
- (BOOL)isDetecting;
- (HDSPActivityWakeDetector)initWithEnvironment:(id)a3;
- (HDSPEnvironment)environment;
- (HDSPWakeDetectorDelegate)wakeDetectorDelegate;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (unint64_t)type;
- (void)notifyForActivityDetectedOnDate:(id)a3;
- (void)setWakeDetectorDelegate:(id)a3;
- (void)startDetecting;
- (void)stopDetecting;
@end

@implementation HDSPActivityWakeDetector

- (HDSPActivityWakeDetector)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPActivityWakeDetector;
  v5 = [(HDSPActivityWakeDetector *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
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
    v6 = [WeakRetained notificationListener];
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
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = [WeakRetained notificationListener];
  [v6 removeObserver:self];
}

- (unint64_t)type
{
  return 1;
}

- (void)notifyForActivityDetectedOnDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying for activity detected on date %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeDetectorDelegate);
  [WeakRetained wakeDetector:self didDetectWakeUpEventOnDate:v4];
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.healthlite.SleepDetectedActivity"]
    && self->_isDetecting)
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v16 = 138543618;
      *(void *)&v16[4] = objc_opt_class();
      *(_WORD *)&v16[12] = 2114;
      *(void *)&v16[14] = v5;
      id v7 = *(id *)&v16[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v16, 0x16u);
    }
    int v8 = [(HDSPActivityWakeDetector *)self environment];
    id v9 = [v8 currentDateProvider];
    v13 = v9[2](v9, v10, v11, v12);
    [(HDSPActivityWakeDetector *)self notifyForActivityDetectedOnDate:v13];
  }
  v14 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v16, *(void *)&v16[16], v17);

  return v14;
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