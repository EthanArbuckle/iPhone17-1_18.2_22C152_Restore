@interface REActivitySummaryPredictor
+ (double)updateInterval;
+ (id)supportedFeatures;
- (float)activeEnergyPercentComplete;
- (float)exerciseTimePercentComplete;
- (float)standHourPercentComplete;
- (id)_init;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (void)_runQuery:(id)a3;
- (void)_startActivitySummaryQueryWithRetries:(int64_t)a3;
- (void)_stopQueries;
- (void)_stopQuery:(id)a3;
- (void)_updateWithActivitySummary:(id)a3 completion:(id)a4;
- (void)resume;
- (void)setActiveEnergyPercentComplete:(float)a3;
- (void)setExerciseTimePercentComplete:(float)a3;
- (void)setStandHourPercentComplete:(float)a3;
- (void)update;
@end

@implementation REActivitySummaryPredictor

+ (id)supportedFeatures
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature activeEnergyCompletionFeature];
  v4 = +[REFeature exerciseTimeCompletionFeature];
  v9[1] = v4;
  v5 = +[REFeature standHourCompletionFeature];
  v9[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v7 = [(REFeatureSet *)v2 initWithFeatures:v6];

  return v7;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)REActivitySummaryPredictor;
  v2 = [(REPredictor *)&v7 _init];
  v3 = v2;
  if (v2)
  {
    [v2 setActiveEnergyPercentComplete:0.0];
    [v3 setExerciseTimePercentComplete:0.0];
    [v3 setStandHourPercentComplete:0.0];
    uint64_t v4 = [MEMORY[0x263EFFA08] set];
    v5 = (void *)v3[8];
    v3[8] = v4;
  }
  return v3;
}

+ (double)updateInterval
{
  return 14400.0;
}

- (void)resume
{
}

- (void)update
{
  [(REActivitySummaryPredictor *)self _stopQueries];
  [(REActivitySummaryPredictor *)self _startActivitySummaryQueryWithRetries:3];
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7 = a3;
  v8 = +[REFeature activeEnergyCompletionFeature];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [(REActivitySummaryPredictor *)self activeEnergyPercentComplete];
  }
  else
  {
    v11 = +[REFeature exerciseTimeCompletionFeature];
    int v12 = [v7 isEqual:v11];

    if (v12) {
      [(REActivitySummaryPredictor *)self exerciseTimePercentComplete];
    }
    else {
      [(REActivitySummaryPredictor *)self standHourPercentComplete];
    }
  }
  v13 = +[REFeatureValue featureValueWithDouble:v10];

  return v13;
}

- (void)_startActivitySummaryQueryWithRetries:(int64_t)a3
{
  if (a3 <= 0)
  {
    float v10 = RELogForDomain(8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[REActivitySummaryPredictor _startActivitySummaryQueryWithRetries:](v10);
    }
  }
  else if (HealthKitLibraryCore())
  {
    objc_initWeak(&location, self);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v5 = (void *)get_HKCurrentActivitySummaryQueryClass_softClass;
    uint64_t v26 = get_HKCurrentActivitySummaryQueryClass_softClass;
    if (!get_HKCurrentActivitySummaryQueryClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __get_HKCurrentActivitySummaryQueryClass_block_invoke;
      v21 = &unk_2644BC768;
      v22 = &v23;
      __get_HKCurrentActivitySummaryQueryClass_block_invoke((uint64_t)buf);
      v5 = (void *)v24[3];
    }
    v6 = v5;
    _Block_object_dispose(&v23, 8);
    id v7 = [v6 alloc];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke;
    v14 = &unk_2644BD988;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a3;
    v15 = self;
    v8 = (void *)[v7 initWithUpdateHandler:&v11];
    int v9 = RELogForDomain(8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E6E6000, v9, OS_LOG_TYPE_INFO, "Begin activity summary query", buf, 2u);
    }

    -[REActivitySummaryPredictor _runQuery:](self, "_runQuery:", v8, v11, v12, v13, v14);
    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained beginFetchingData];
    if (v9)
    {
      uint64_t v12 = RELogForDomain(8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_cold_1((uint64_t)v9, v12);
      }

      [v11 _stopQuery:v7];
      [v11 _startActivitySummaryQueryWithRetries:*(void *)(a1 + 48) - 1];
      [*(id *)(a1 + 32) finishFetchingData];
    }
    else
    {
      v13 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_5;
      v14[3] = &unk_2644BC660;
      v14[4] = v13;
      [v13 _updateWithActivitySummary:v8 completion:v14];
    }
  }
}

uint64_t __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishFetchingData];
}

- (void)_runQuery:(id)a3
{
  id v4 = a3;
  v5 = +[RESingleton sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__REActivitySummaryPredictor__runQuery___block_invoke;
  v7[3] = &unk_2644BD9B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 accessHealthStore:v7];
}

uint64_t __40__REActivitySummaryPredictor__runQuery___block_invoke(uint64_t a1, void *a2)
{
  [a2 executeQuery:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 64) setByAddingObject:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 64);
  *(void *)(v4 + 64) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)_stopQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[RESingleton sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__REActivitySummaryPredictor__stopQuery___block_invoke;
  v7[3] = &unk_2644BD9B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 accessHealthStore:v7];
}

void __41__REActivitySummaryPredictor__stopQuery___block_invoke(uint64_t a1, void *a2)
{
  [a2 stopQuery:*(void *)(a1 + 32)];
  id v6 = (id)[*(id *)(*(void *)(a1 + 40) + 64) mutableCopy];
  [v6 removeObject:*(void *)(a1 + 32)];
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v3;
}

- (void)_stopQueries
{
  uint64_t v3 = +[RESingleton sharedInstance];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__REActivitySummaryPredictor__stopQueries__block_invoke;
  v4[3] = &unk_2644BD9D8;
  v4[4] = self;
  [v3 accessHealthStore:v4];
}

void __42__REActivitySummaryPredictor__stopQueries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "stopQuery:", *(void *)(*((void *)&v12 + 1) + 8 * v8++), (void)v12);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [MEMORY[0x263EFFA08] set];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 64);
  *(void *)(v10 + 64) = v9;
}

- (void)_updateWithActivitySummary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(REPredictor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__REActivitySummaryPredictor__updateWithActivitySummary_completion___block_invoke;
  block[3] = &unk_2644BDA00;
  long long v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __68__REActivitySummaryPredictor__updateWithActivitySummary_completion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = [getHKUnitClass() largeCalorieUnit];

  if (!v2)
  {
    uint64_t v11 = RELogForDomain(8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      id v12 = "Unable to find largeCalorieUnit. Skipping update";
      goto LABEL_7;
    }
LABEL_8:

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v3 = [*(id *)(a1 + 32) activeEnergyBurned];
  id v4 = [getHKUnitClass() largeCalorieUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  id v7 = [*(id *)(a1 + 32) activeEnergyBurnedGoal];
  uint64_t v8 = [getHKUnitClass() largeCalorieUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;

  if (v10 < 2.22044605e-16)
  {
    uint64_t v11 = RELogForDomain(8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      id v12 = "Activity is not configured. Skipping update";
LABEL_7:
      _os_log_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v40, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  long long v13 = [*(id *)(a1 + 32) appleExerciseTime];
  id v14 = [getHKUnitClass() minuteUnit];
  [v13 doubleValueForUnit:v14];
  double v16 = v15;

  uint64_t v17 = [*(id *)(a1 + 32) appleExerciseTimeGoal];
  v18 = [getHKUnitClass() minuteUnit];
  [v17 doubleValueForUnit:v18];
  double v20 = v19;

  v21 = [*(id *)(a1 + 32) appleStandHours];
  v22 = [getHKUnitClass() countUnit];
  [v21 doubleValueForUnit:v22];
  double v24 = v23;

  uint64_t v25 = [*(id *)(a1 + 32) appleStandHoursGoal];
  uint64_t v26 = [getHKUnitClass() countUnit];
  [v25 doubleValueForUnit:v26];
  double v28 = v27;

  float v29 = v6 / v10;
  float v30 = v16 / v20;
  float v31 = v24 / v28;
  [*(id *)(a1 + 40) activeEnergyPercentComplete];
  LODWORD(v24) = v32;
  [*(id *)(a1 + 40) exerciseTimePercentComplete];
  float v34 = v33;
  [*(id *)(a1 + 40) standHourPercentComplete];
  if (vabds_f32(v29, *(float *)&v24) >= 0.07 || vabds_f32(v30, v34) >= 0.07 || vabds_f32(v31, *(float *)&v35) >= 0.07)
  {
    *(float *)&double v35 = v29;
    [*(id *)(a1 + 40) setActiveEnergyPercentComplete:v35];
    *(float *)&double v36 = v30;
    [*(id *)(a1 + 40) setExerciseTimePercentComplete:v36];
    *(float *)&double v37 = v31;
    [*(id *)(a1 + 40) setStandHourPercentComplete:v37];
    v38 = RELogForDomain(8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      int v40 = 134218496;
      double v41 = v29;
      __int16 v42 = 2048;
      double v43 = v30;
      __int16 v44 = 2048;
      double v45 = v31;
      _os_log_impl(&dword_21E6E6000, v38, OS_LOG_TYPE_INFO, "Updating active summary with new data activeEnergyPercentComplete=%f exerciseTimePercentComplete=%f standHourPercentComplete=%f", (uint8_t *)&v40, 0x20u);
    }

    [*(id *)(a1 + 40) updateObservers];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (float)activeEnergyPercentComplete
{
  return self->_activeEnergyPercentComplete;
}

- (void)setActiveEnergyPercentComplete:(float)a3
{
  self->_activeEnergyPercentComplete = a3;
}

- (float)exerciseTimePercentComplete
{
  return self->_exerciseTimePercentComplete;
}

- (void)setExerciseTimePercentComplete:(float)a3
{
  self->_exerciseTimePercentComplete = a3;
}

- (float)standHourPercentComplete
{
  return self->_standHourPercentComplete;
}

- (void)setStandHourPercentComplete:(float)a3
{
  self->_standHourPercentComplete = a3;
}

- (void).cxx_destruct
{
}

- (void)_startActivitySummaryQueryWithRetries:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "No more activity query retries allowed", v1, 2u);
}

void __68__REActivitySummaryPredictor__startActivitySummaryQueryWithRetries___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Encountered error while fetching activity summary %@", (uint8_t *)&v2, 0xCu);
}

@end