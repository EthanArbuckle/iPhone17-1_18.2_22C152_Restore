@interface ATXModeScreenRecordingFeaturizer
- (ATXModeFeaturizerDelegate)delegate;
- (id)_provideFeaturesWithScreenRecordingEvent:(id)a3;
- (id)provideFeatures;
- (void)_processNewScreenRecordingEvent:(id)a3;
- (void)beginListening;
- (void)setDelegate:(id)a3;
- (void)stopListening;
@end

@implementation ATXModeScreenRecordingFeaturizer

- (id)provideFeatures
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  v3 = BiomeLibrary();
  v4 = [v3 Screen];
  v5 = [v4 Recording];
  v6 = objc_msgSend(v5, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1F3539520, &unk_1F3539520, 0);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__ATXModeScreenRecordingFeaturizer_provideFeatures__block_invoke_6;
  v10[3] = &unk_1E6BE6988;
  v10[4] = &v11;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_10 receiveInput:v10];
  v8 = [(ATXModeScreenRecordingFeaturizer *)self _provideFeaturesWithScreenRecordingEvent:v12[5]];

  _Block_object_dispose(&v11, 8);

  return v8;
}

void __51__ATXModeScreenRecordingFeaturizer_provideFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  v4 = __atxlog_handle_modes();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__ATXModeScreenRecordingFeaturizer_provideFeatures__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeScreenRecordingFeaturizer: done fetching last event", v6, 2u);
  }
}

uint64_t __51__ATXModeScreenRecordingFeaturizer_provideFeatures__block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];

  return MEMORY[0x1F41817F8]();
}

- (id)_provideFeaturesWithScreenRecordingEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 starting];
  v4 = objc_alloc_init(ATXModeFeatureSet);
  [(ATXModeFeatureSet *)v4 setValue:v3 forBinaryFeatureOfType:18];
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeScreenRecordingFeaturizer: updating screen recording feature: %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)_processNewScreenRecordingEvent:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = [(ATXModeScreenRecordingFeaturizer *)self _provideFeaturesWithScreenRecordingEvent:v5];

  [WeakRetained featurizer:self didUpdateFeatures:v6];
}

- (void)beginListening
{
  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeScreenRecording.queue", v3);
    queue = self->_queue;
    self->_queue = v4;
  }
  v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeScreenRecordingFeaturizer: registering for real time events", buf, 2u);
  }

  id v7 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.ScreenRecording" targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  v9 = BiomeLibrary();
  v10 = [v9 Screen];
  uint64_t v11 = [v10 Recording];
  v12 = objc_msgSend(v11, "atx_DSLPublisher");
  uint64_t v13 = [v12 subscribeOn:self->_scheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__ATXModeScreenRecordingFeaturizer_beginListening__block_invoke_15;
  v16[3] = &unk_1E6BE6A38;
  objc_copyWeak(&v17, &location);
  v14 = [v13 sinkWithCompletion:&__block_literal_global_14_1 receiveInput:v16];
  sink = self->_sink;
  self->_sink = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __50__ATXModeScreenRecordingFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__ATXModeScreenRecordingFeaturizer_beginListening__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeScreenRecordingFeaturizer: done listening to screen recording events", v6, 2u);
  }
}

void __50__ATXModeScreenRecordingFeaturizer_beginListening__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSNumber;
    v6 = [v3 eventBody];
    id v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "starting"));
    int v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeScreenRecordingFeaturizer: received new screen recording event, isStart: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = [v3 eventBody];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = [v3 eventBody];
    [WeakRetained _processNewScreenRecordingEvent:v10];
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

void __51__ATXModeScreenRecordingFeaturizer_provideFeatures__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeScreenRecordingFeaturizer: error fetching last event: %@", v4, v5, v6, v7, 2u);
}

void __50__ATXModeScreenRecordingFeaturizer_beginListening__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeScreenRecordingFeaturizer: error listening to screen recording events: %@", v4, v5, v6, v7, 2u);
}

@end