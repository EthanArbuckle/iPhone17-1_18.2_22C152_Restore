@interface ATXModeRoutineFeaturizer
- (ATXModeFeaturizerDelegate)delegate;
- (id)_provideFeaturesWithLocationEvent:(id)a3;
- (id)provideFeatures;
- (void)_processNewLocationEvent:(id)a3;
- (void)beginListening;
- (void)setDelegate:(id)a3;
- (void)stopListening;
@end

@implementation ATXModeRoutineFeaturizer

- (id)provideFeatures
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  id v16 = 0;
  v3 = BiomeLibrary();
  v4 = [v3 Location];
  v5 = [v4 Semantic];
  v6 = objc_msgSend(v5, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1F3539538, &unk_1F3539538, 0);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_6;
  v10[3] = &unk_1E6BE6988;
  v10[4] = &v11;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_11 receiveInput:v10];
  v8 = [(ATXModeRoutineFeaturizer *)self _provideFeaturesWithLocationEvent:v12[5]];

  _Block_object_dispose(&v11, 8);

  return v8;
}

void __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  v4 = __atxlog_handle_modes();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: done fetching last location event", v6, 2u);
  }
}

uint64_t __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];

  return MEMORY[0x1F41817F8]();
}

- (id)_provideFeaturesWithLocationEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 starting]) {
    BOOL v4 = [v3 userSpecificPlaceType] == 1;
  }
  else {
    BOOL v4 = 0;
  }
  if ([v3 starting]) {
    BOOL v5 = [v3 userSpecificPlaceType] == 2;
  }
  else {
    BOOL v5 = 0;
  }
  if ([v3 starting]) {
    BOOL v6 = [v3 userSpecificPlaceType] == 4;
  }
  else {
    BOOL v6 = 0;
  }
  if ([v3 starting]) {
    BOOL v7 = [v3 userSpecificPlaceType] == 3;
  }
  else {
    BOOL v7 = 0;
  }
  v8 = objc_alloc_init(ATXModeFeatureSet);
  [(ATXModeFeatureSet *)v8 setValue:v4 forBinaryFeatureOfType:1];
  [(ATXModeFeatureSet *)v8 setValue:v5 forBinaryFeatureOfType:2];
  [(ATXModeFeatureSet *)v8 setValue:v6 forBinaryFeatureOfType:22];
  [(ATXModeFeatureSet *)v8 setValue:v7 forBinaryFeatureOfType:23];
  v9 = __atxlog_handle_modes();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109888;
    v11[1] = v4;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v7;
    _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: updating features. isAtHome: %d isAtWork: %d isAtGym: %d isAtSchool: %d", (uint8_t *)v11, 0x1Au);
  }

  return v8;
}

- (void)_processNewLocationEvent:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  BOOL v6 = [(ATXModeRoutineFeaturizer *)self _provideFeaturesWithLocationEvent:v5];

  [WeakRetained featurizer:self didUpdateFeatures:v6];
}

- (void)beginListening
{
  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeSemanticLocation.queue", v3);
    queue = self->_queue;
    self->_queue = v4;
  }
  BOOL v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: registering for real time events", buf, 2u);
  }

  BOOL v7 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.Routine" targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  v9 = BiomeLibrary();
  v10 = [v9 Location];
  uint64_t v11 = [v10 Semantic];
  __int16 v12 = objc_msgSend(v11, "atx_DSLPublisher");
  BOOL v13 = [v12 subscribeOn:self->_scheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_15;
  v16[3] = &unk_1E6BE6A38;
  objc_copyWeak(&v17, &location);
  __int16 v14 = [v13 sinkWithCompletion:&__block_literal_global_14_2 receiveInput:v16];
  sink = self->_sink;
  self->_sink = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __42__ATXModeRoutineFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  BOOL v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: done listening to location events", v6, 2u);
  }
}

void __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 eventBody];
  BOOL v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134283777;
    uint64_t v7 = (int)[v3 userSpecificPlaceType];
    __int16 v8 = 1024;
    int v9 = [v3 starting];
    _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeRoutineFeaturizer: received new location event for semantic location: %{private}lu, is starting: %d", (uint8_t *)&v6, 0x12u);
  }

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _processNewLocationEvent:v3];
  }
}

- (void)stopListening
{
  [(BPSSink *)self->_sink cancel];
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;
}

- (ATXModeFeaturizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXModeFeaturizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __43__ATXModeRoutineFeaturizer_provideFeatures__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeRoutineFeaturizer: error fetching last location event: %@", v4, v5, v6, v7, 2u);
}

void __42__ATXModeRoutineFeaturizer_beginListening__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeRoutineFeaturizer: error listening to location events: %@", v4, v5, v6, v7, 2u);
}

@end