@interface HDSPSleepModeExitDetector
- (BOOL)isDetecting;
- (HDSPEnvironment)environment;
- (HDSPSleepModeExitDetector)initWithEnvironment:(id)a3;
- (HDSPWakeDetectorDelegate)wakeDetectorDelegate;
- (unint64_t)type;
- (void)setWakeDetectorDelegate:(id)a3;
- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5;
- (void)startDetecting;
- (void)stopDetecting;
@end

@implementation HDSPSleepModeExitDetector

- (HDSPSleepModeExitDetector)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepModeExitDetector;
  v5 = [(HDSPSleepModeExitDetector *)&v9 init];
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
    v6 = [WeakRetained sleepModeManager];
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
  v6 = [WeakRetained sleepModeManager];
  [v6 removeObserver:self];
}

- (unint64_t)type
{
  return 2;
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v7 = [(HDSPSleepModeExitDetector *)self environment];
  id v8 = [v7 currentContext];

  if (!a3
    && HKSPSleepModeChangeReasonTreatedAsUserRequestedLocally()
    && [(HDSPSleepModeExitDetector *)self isDetecting])
  {
    uint64_t v9 = [v8 source];
    if (objc_opt_respondsToSelector())
    {
      v10 = [v8 source];
      int v11 = [v10 dontSync];

      if (v11)
      {
        v12 = HKSPLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543362;
          id v21 = (id)objc_opt_class();
          id v13 = v21;
          _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring remote sleep mode exit", (uint8_t *)&v20, 0xCu);
        }
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543362;
      id v21 = (id)objc_opt_class();
      id v15 = v21;
      _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode manually exited, treating as wake up event", (uint8_t *)&v20, 0xCu);
    }
    v12 = [(HDSPSleepModeExitDetector *)self wakeDetectorDelegate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v17 = [WeakRetained currentDateProvider];
    v19 = v17[2](v17, v18);
    [v12 wakeDetector:self didDetectWakeUpEventOnDate:v19];

    goto LABEL_12;
  }
LABEL_13:
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