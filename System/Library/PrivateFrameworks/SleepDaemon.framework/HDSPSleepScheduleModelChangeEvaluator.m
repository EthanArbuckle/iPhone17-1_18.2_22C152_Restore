@interface HDSPSleepScheduleModelChangeEvaluator
+ (unint64_t)_evaluateChangesFromObject:(id)a3 toObject:(id)a4 outChangeSet:(id *)a5;
- (HDSPEnvironment)environment;
- (HDSPSleepScheduleModelChangeEvaluator)initWithEnvironment:(id)a3;
- (HKSPSleepEventRecord)lastRecord;
- (HKSPSleepSchedule)lastSchedule;
- (HKSPSleepSettings)lastSettings;
- (id)evaluateSleepRecordAdd:(id)a3;
- (id)evaluateSleepRecordUpdate:(id)a3;
- (id)evaluateSleepScheduleAdd:(id)a3;
- (id)evaluateSleepScheduleModelChange:(id)a3;
- (id)evaluateSleepScheduleRemove;
- (id)evaluateSleepScheduleUpdate:(id)a3;
- (id)evaluateSleepSettingsAdd:(id)a3;
- (id)evaluateSleepSettingsUpdate:(id)a3;
- (void)_loadPersistedModel;
- (void)_persistModel:(id)a3;
- (void)_persistRecord:(id)a3;
- (void)_persistSchedule:(id)a3;
- (void)_persistSettings:(id)a3;
- (void)_restorePersistedModelWithScheduleData:(id)a3 settingsData:(id)a4 recordData:(id)a5;
- (void)setLastRecord:(id)a3;
- (void)setLastSchedule:(id)a3;
- (void)setLastSettings:(id)a3;
@end

@implementation HDSPSleepScheduleModelChangeEvaluator

- (HDSPSleepScheduleModelChangeEvaluator)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepScheduleModelChangeEvaluator;
  v5 = [(HDSPSleepScheduleModelChangeEvaluator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (void)_loadPersistedModel
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_environment = &self->_environment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v5 = [WeakRetained userDefaults];
  v6 = objc_msgSend(v5, "hksp_objectForKey:", @"HKSPLastSchedule");

  id v7 = objc_loadWeakRetained((id *)p_environment);
  v8 = [v7 userDefaults];
  objc_super v9 = objc_msgSend(v8, "hksp_objectForKey:", @"HKSPLastSettings");

  id v10 = objc_loadWeakRetained((id *)p_environment);
  v11 = [v10 userDefaults];
  v12 = objc_msgSend(v11, "hksp_objectForKey:", @"HKSPLastRecord");

  v13 = HKSPLogForCategory();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v6 || v9 || v12)
  {
    if (v14)
    {
      int v20 = 138543362;
      id v21 = (id)objc_opt_class();
      id v19 = v21;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] restoring previous model", (uint8_t *)&v20, 0xCu);
    }
    [(HDSPSleepScheduleModelChangeEvaluator *)self _restorePersistedModelWithScheduleData:v6 settingsData:v9 recordData:v12];
  }
  else
  {
    if (v14)
    {
      int v20 = 138543362;
      id v21 = (id)objc_opt_class();
      id v15 = v21;
      _os_log_impl(&dword_221A52000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] no previous model to restore", (uint8_t *)&v20, 0xCu);
    }
    id v16 = objc_loadWeakRetained((id *)p_environment);
    v17 = [v16 sleepScheduleModelManager];
    v18 = [v17 sleepScheduleModel];
    [(HDSPSleepScheduleModelChangeEvaluator *)self _persistModel:v18];
  }
}

- (void)_restorePersistedModelWithScheduleData:(id)a3 settingsData:(id)a4 recordData:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13)
  {
    id v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:0];
    [(HDSPSleepScheduleModelChangeEvaluator *)self setLastSchedule:v10];
  }
  if (v8)
  {
    v11 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:0];
    [(HDSPSleepScheduleModelChangeEvaluator *)self setLastSettings:v11];
  }
  if (v9)
  {
    v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
    [(HDSPSleepScheduleModelChangeEvaluator *)self setLastRecord:v12];
  }
}

- (void)_persistModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 sleepSchedule];
  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSchedule:v5];

  v6 = [v4 sleepSettings];
  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSettings:v6];

  id v7 = [v4 sleepEventRecord];

  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistRecord:v7];
}

- (void)_persistSchedule:(id)a3
{
  -[HDSPSleepScheduleModelChangeEvaluator setLastSchedule:](self, "setLastSchedule:");
  if (a3)
  {
    v5 = (void *)MEMORY[0x263F08910];
    v6 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSchedule];
    id v9 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    id v8 = [WeakRetained userDefaults];
    objc_msgSend(v8, "hksp_setObject:forKey:", v9, @"HKSPLastSchedule");
  }
  else
  {
    id v9 = objc_loadWeakRetained((id *)&self->_environment);
    id WeakRetained = [v9 userDefaults];
    objc_msgSend(WeakRetained, "hksp_removeObjectForKey:", @"HKSPLastSchedule");
  }
}

- (void)_persistSettings:(id)a3
{
  [(HDSPSleepScheduleModelChangeEvaluator *)self setLastSettings:a3];
  id v4 = (void *)MEMORY[0x263F08910];
  v5 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSettings];
  id v8 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v7 = [WeakRetained userDefaults];
  objc_msgSend(v7, "hksp_setObject:forKey:", v8, @"HKSPLastSettings");
}

- (void)_persistRecord:(id)a3
{
  [(HDSPSleepScheduleModelChangeEvaluator *)self setLastRecord:a3];
  id v4 = (void *)MEMORY[0x263F08910];
  v5 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastRecord];
  id v8 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v7 = [WeakRetained userDefaults];
  objc_msgSend(v7, "hksp_setObject:forKey:", v8, @"HKSPLastRecord");
}

- (id)evaluateSleepScheduleAdd:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule added", (uint8_t *)&v11, 0xCu);
  }
  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSchedule:v4];

  id v7 = HKSPSleepScheduleProperties();
  id v8 = HKSPPropertyIdentifiersForProperties();
  id v9 = +[HDSPSleepScheduleModelChangeEvaluation significantChangeWithTopLevelChangeKeys:v8];

  return v9;
}

- (id)evaluateSleepScheduleUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSchedule];
  id v16 = 0;
  uint64_t v7 = [v5 _evaluateChangesFromObject:v6 toObject:v4 outChangeSet:&v16];
  id v8 = v16;

  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSchedule:v4];
  if (v7 == 2)
  {
    id v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      id v11 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule changes were significant", buf, 0xCu);
    }
  }
  id v12 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  uint64_t v13 = [v8 topLevelChangeKeys];
  BOOL v14 = [(HDSPSleepScheduleModelChangeEvaluation *)v12 initWithIsSignificantChange:v7 == 2 topLevelChangeKeys:v13];

  return v14;
}

- (id)evaluateSleepScheduleRemove
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v4 = v10;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule removed", (uint8_t *)&v9, 0xCu);
  }
  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSchedule:0];
  v5 = HKSPSleepScheduleProperties();
  id v6 = HKSPPropertyIdentifiersForProperties();
  uint64_t v7 = +[HDSPSleepScheduleModelChangeEvaluation significantChangeWithTopLevelChangeKeys:v6];

  return v7;
}

- (id)evaluateSleepSettingsAdd:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings added", (uint8_t *)&v11, 0xCu);
  }
  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSettings:v4];

  uint64_t v7 = HKSPSleepSettingsProperties();
  id v8 = HKSPPropertyIdentifiersForProperties();
  int v9 = +[HDSPSleepScheduleModelChangeEvaluation significantChangeWithTopLevelChangeKeys:v8];

  return v9;
}

- (id)evaluateSleepSettingsUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSettings];
  id v16 = 0;
  uint64_t v7 = [v5 _evaluateChangesFromObject:v6 toObject:v4 outChangeSet:&v16];
  id v8 = v16;

  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistSettings:v4];
  if (v7 == 2)
  {
    int v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      id v11 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings changes were significant", buf, 0xCu);
    }
  }
  id v12 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  uint64_t v13 = [v8 topLevelChangeKeys];
  BOOL v14 = [(HDSPSleepScheduleModelChangeEvaluation *)v12 initWithIsSignificantChange:v7 == 2 topLevelChangeKeys:v13];

  return v14;
}

- (id)evaluateSleepRecordAdd:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep record added", (uint8_t *)&v12, 0xCu);
  }
  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistRecord:v4];

  uint64_t v7 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  id v8 = HKSPSleepEventRecordProperties();
  int v9 = HKSPPropertyIdentifiersForProperties();
  id v10 = [(HDSPSleepScheduleModelChangeEvaluation *)v7 initWithIsSignificantChange:1 topLevelChangeKeys:v9];

  return v10;
}

- (id)evaluateSleepRecordUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastRecord];
  id v16 = 0;
  uint64_t v7 = [v5 _evaluateChangesFromObject:v6 toObject:v4 outChangeSet:&v16];
  id v8 = v16;

  [(HDSPSleepScheduleModelChangeEvaluator *)self _persistRecord:v4];
  if (v7 == 2)
  {
    int v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      id v11 = v10;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep record changes were significant", buf, 0xCu);
    }
  }
  int v12 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  id v13 = [v8 topLevelChangeKeys];
  uint64_t v14 = [(HDSPSleepScheduleModelChangeEvaluation *)v12 initWithIsSignificantChange:v7 == 2 topLevelChangeKeys:v13];

  return v14;
}

- (id)evaluateSleepScheduleModelChange:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [v4 sleepSchedule];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSchedule];

    if (!v8)
    {
      id v13 = [v4 sleepSchedule];
      uint64_t v14 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepScheduleAdd:v13];
      goto LABEL_11;
    }
  }
  int v9 = [v4 sleepSchedule];
  if (v9)
  {
  }
  else
  {
    id v15 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSchedule];

    if (v15)
    {
      id v13 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepScheduleRemove];
      [v5 addObject:v13];
LABEL_12:

      goto LABEL_13;
    }
  }
  uint64_t v10 = [v4 sleepSchedule];
  if (v10)
  {
    id v11 = (void *)v10;
    int v12 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSchedule];

    if (v12)
    {
      id v13 = [v4 sleepSchedule];
      uint64_t v14 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepScheduleUpdate:v13];
LABEL_11:
      id v16 = (void *)v14;
      [v5 addObject:v14];

      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v17 = [v4 sleepSettings];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSettings];

    if (!v19)
    {
      v23 = [v4 sleepSettings];
      uint64_t v24 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepSettingsAdd:v23];
      goto LABEL_19;
    }
  }
  uint64_t v20 = [v4 sleepSettings];
  if (v20)
  {
    id v21 = (void *)v20;
    uint64_t v22 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastSettings];

    if (v22)
    {
      v23 = [v4 sleepSettings];
      uint64_t v24 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepSettingsUpdate:v23];
LABEL_19:
      v25 = (void *)v24;
      [v5 addObject:v24];
    }
  }
  uint64_t v26 = [v4 sleepEventRecord];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastRecord];

    if (!v28)
    {
      v32 = [v4 sleepEventRecord];
      uint64_t v33 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepRecordAdd:v32];
      goto LABEL_26;
    }
  }
  uint64_t v29 = [v4 sleepEventRecord];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(HDSPSleepScheduleModelChangeEvaluator *)self lastRecord];

    if (v31)
    {
      v32 = [v4 sleepEventRecord];
      uint64_t v33 = [(HDSPSleepScheduleModelChangeEvaluator *)self evaluateSleepRecordUpdate:v32];
LABEL_26:
      v34 = (void *)v33;
      [v5 addObject:v33];
    }
  }
  v35 = +[HDSPSleepScheduleModelChangeEvaluation combinedEvaluation:v5];

  return v35;
}

+ (unint64_t)_evaluateChangesFromObject:(id)a3 toObject:(id)a4 outChangeSet:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = HKSPGenerateChangeSetBetweenObjects();
  id v8 = v7;
  if (a5) {
    *a5 = v7;
  }
  int v9 = [v8 changes];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = (void *)[v6 mutableCopy];
    HKSPApplyChangesToObject();
    unint64_t v12 = HKSPEvaluateChangesToObject();
  }
  else
  {
    unint64_t v12 = 1;
  }

  return v12;
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPSleepSchedule)lastSchedule
{
  return self->_lastSchedule;
}

- (void)setLastSchedule:(id)a3
{
}

- (HKSPSleepSettings)lastSettings
{
  return self->_lastSettings;
}

- (void)setLastSettings:(id)a3
{
}

- (HKSPSleepEventRecord)lastRecord
{
  return self->_lastRecord;
}

- (void)setLastRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecord, 0);
  objc_storeStrong((id *)&self->_lastSettings, 0);
  objc_storeStrong((id *)&self->_lastSchedule, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end