@interface ATXModeExerciseFeaturizer
- (ATXModeFeaturizerDelegate)delegate;
- (BOOL)isInWorkout;
- (id)_createWorkoutPredicate;
- (id)provideFeatures;
- (void)_createWorkoutPredicate;
- (void)_setUpContextIfNecessary;
- (void)beginListening;
- (void)setDelegate:(id)a3;
- (void)setIsInWorkout:(BOOL)a3;
- (void)stopListening;
@end

@implementation ATXModeExerciseFeaturizer

- (id)provideFeatures
{
  v3 = objc_alloc_init(ATXModeFeatureSet);
  [(ATXModeFeatureSet *)v3 setValue:[(ATXModeExerciseFeaturizer *)self isInWorkout] forBinaryFeatureOfType:3];

  return v3;
}

- (void)beginListening
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "Failed to register Core Duet contextual change handler", v2, v3, v4, v5, v6);
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint8_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5B700]];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = v8;
        v10 = [MEMORY[0x1E4F5B6B8] sessionState];
        v11 = [v9 objectForKeyedSubscript:v10];

        v12 = __atxlog_handle_modes();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          v18 = v11;
          _os_log_impl(&dword_1DAFF9000, v12, OS_LOG_TYPE_DEFAULT, "Workout state string: %@", (uint8_t *)&v17, 0xCu);
        }

        v13 = __HKWorkoutSessionStateName(2);
        uint64_t v14 = [v11 isEqualToString:v13];

        [WeakRetained setIsInWorkout:v14];
        v15 = objc_alloc_init(ATXModeFeatureSet);
        [(ATXModeFeatureSet *)v15 setValue:v14 forBinaryFeatureOfType:3];
        v16 = [WeakRetained delegate];
        [v16 featurizer:WeakRetained didUpdateFeatures:v15];
      }
      else
      {
        v9 = __atxlog_handle_modes();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_3((uint64_t)v7, v9);
        }
      }
    }
    else
    {
      v8 = __atxlog_handle_modes();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_2((uint64_t)v4, v8);
      }
    }
  }
  else
  {
    v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_1();
    }
  }
}

- (void)stopListening
{
  if (self->_registration)
  {
    -[_CDClientContext deregisterCallback:](self->_userContext, "deregisterCallback:");
    registration = self->_registration;
    self->_registration = 0;
  }
}

- (id)_createWorkoutPredicate
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  uint64_t v2 = (void *)getHKWorkoutClass_softClass;
  uint64_t v16 = getHKWorkoutClass_softClass;
  if (!getHKWorkoutClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getHKWorkoutClass_block_invoke;
    v12[3] = &unk_1E6BE6D38;
    v12[4] = &v13;
    __getHKWorkoutClass_block_invoke((uint64_t)v12);
    uint64_t v2 = (void *)v14[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = [v3 _allWorkoutActivityTypes];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    uint8_t v6 = __HKWorkoutSessionStateName(2);
    [v5 addObject:v6];

    v7 = __HKWorkoutSessionStateName(3);
    [v5 addObject:v7];

    v8 = (void *)MEMORY[0x1E4F5B6F8];
    v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    v10 = [v8 predicateForFirstPartyWorkoutMatchingTypes:v9 states:v5];
  }
  else
  {
    uint64_t v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXModeExerciseFeaturizer _createWorkoutPredicate]();
    }
    v10 = 0;
  }

  return v10;
}

- (void)_setUpContextIfNecessary
{
  if (!self->_userContext)
  {
    self->_userContext = [MEMORY[0x1E4F5B6A8] userContext];
    MEMORY[0x1F41817F8]();
  }
}

- (ATXModeFeaturizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeFeaturizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInWorkout
{
  return self->_isInWorkout;
}

- (void)setIsInWorkout:(BOOL)a3
{
  self->_isInWorkout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registration, 0);

  objc_storeStrong((id *)&self->_userContext, 0);
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "self went away", v2, v3, v4, v5, v6);
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "No workout payload: %@", (uint8_t *)&v2, 0xCu);
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_ERROR, "Workout payload is not dictionary: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_createWorkoutPredicate
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1DAFF9000, v0, v1, "Unable to retrieve all workout types from HealthKit", v2, v3, v4, v5, v6);
}

@end