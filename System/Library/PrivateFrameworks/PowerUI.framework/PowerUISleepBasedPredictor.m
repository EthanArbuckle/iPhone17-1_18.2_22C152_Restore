@interface PowerUISleepBasedPredictor
+ (BOOL)shouldUseSleepPredictorWithLog:(id)a3;
- (OS_os_log)log;
- (PowerUISleepBasedPredictor)initWithLog:(id)a3;
- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3;
- (unint64_t)modelVersion;
- (unint64_t)predictorType;
- (void)setLog:(id)a3;
@end

@implementation PowerUISleepBasedPredictor

- (PowerUISleepBasedPredictor)initWithLog:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PowerUISleepBasedPredictor;
  v6 = [(PowerUISleepBasedPredictor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_log, a3);
  }

  return v7;
}

- (unint64_t)predictorType
{
  return 4;
}

- (unint64_t)modelVersion
{
  return 1;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = (void *)[objc_alloc(MEMORY[0x263F75EA8]) initWithIdentifier:@"com.apple.das.smartcharging"];
  id v5 = [v4 currentSleepScheduleWithError:0];
  if (v5)
  {
    uint64_t v6 = [v4 currentSleepScheduleStateWithError:0];
    v7 = [MEMORY[0x263EFF910] date];
    v8 = [v4 nextEventDueAfterDate:v7 error:0];

    if (v6 == 3)
    {
      objc_super v9 = [v8 dueDate];
      [v9 timeIntervalSinceNow];
      double v11 = v10;

      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134217984;
        double v23 = v11;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Currently in winddown, offset until sleep starts: %f", (uint8_t *)&v22, 0xCu);
      }
      v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v11];
      uint64_t v14 = [v4 nextEventDueAfterDate:v13 error:0];

      v8 = (void *)v14;
    }
    v15 = [v8 dueDate];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 dateByAddingTimeInterval:-1800.0];
      v18 = self->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        double v23 = *(double *)&v16;
        __int16 v24 = 2112;
        v25 = v17;
        _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Wake up time set to: %@ - Target (adjusted) deadline: %@", (uint8_t *)&v22, 0x16u);
      }
    }
    else
    {
      v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[PowerUISleepBasedPredictor predictFullChargeDateWithBatteryLevel:](v20);
      }
      v17 = [MEMORY[0x263EFF910] distantPast];
    }
  }
  else
  {
    v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[PowerUISleepBasedPredictor predictFullChargeDateWithBatteryLevel:](v19);
    }
    v17 = [MEMORY[0x263EFF910] distantPast];
  }

  return v17;
}

+ (BOOL)shouldUseSleepPredictorWithLog:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x263F75EA8]) initWithIdentifier:@"com.apple.das.smartcharging"];
  id v14 = 0;
  id v5 = [v4 currentSleepScheduleWithError:&v14];
  id v6 = v14;
  if (!v5)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      double v10 = "No sleep schedule found, use regular model. Error: %@";
      double v11 = v3;
      uint32_t v12 = 12;
LABEL_9:
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  unint64_t v7 = [v4 currentSleepScheduleStateWithError:0] & 0xFFFFFFFFFFFFFFFELL;
  BOOL v8 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v7 != 2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      double v10 = "Not in winddown or sleep schedule, use regular model.";
      double v11 = v3;
      uint32_t v12 = 2;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    BOOL v9 = 1;
    _os_log_impl(&dword_22135E000, v3, OS_LOG_TYPE_INFO, "In winddown or sleep schedule, use sleep schedule for OBC.", buf, 2u);
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_11:

  return v9;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)predictFullChargeDateWithBatteryLevel:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22135E000, log, OS_LOG_TYPE_FAULT, "No sleep schedule found while searching for sleep schedule wake up time", v1, 2u);
}

- (void)predictFullChargeDateWithBatteryLevel:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22135E000, log, OS_LOG_TYPE_FAULT, "No dueDate found for wakeup event", v1, 2u);
}

@end