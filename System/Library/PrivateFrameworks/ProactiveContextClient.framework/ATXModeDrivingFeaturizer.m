@interface ATXModeDrivingFeaturizer
- (ATXModeFeaturizerDelegate)delegate;
- (id)_fetchMostRecentDNDWDEvent;
- (id)_provideFeaturesWithLastDNDWDEvent:(id)a3;
- (id)provideFeatures;
- (void)_beginListeningForDNDWDEvents;
- (void)_processNewDNDWDEvent:(id)a3;
- (void)beginListening;
- (void)setDelegate:(id)a3;
- (void)stopListening;
@end

@implementation ATXModeDrivingFeaturizer

- (id)provideFeatures
{
  return [(ATXModeDrivingFeaturizer *)self _provideFeaturesWithLastDNDWDEvent:0];
}

- (id)_provideFeaturesWithLastDNDWDEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = [(ATXModeDrivingFeaturizer *)self _fetchMostRecentDNDWDEvent];
    char v9 = [v8 starting];

    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  if (![v4 starting]) {
    goto LABEL_7;
  }
LABEL_3:
  v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: Driving mode activated by Do Not Disturb While Driving", v12, 2u);
  }

  uint64_t v7 = 1;
LABEL_8:
  v10 = objc_alloc_init(ATXModeFeatureSet);
  [(ATXModeFeatureSet *)v10 setValue:v7 forBinaryFeatureOfType:4];

  return v10;
}

- (void)_processNewDNDWDEvent:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = [(ATXModeDrivingFeaturizer *)self _provideFeaturesWithLastDNDWDEvent:v5];

  [WeakRetained featurizer:self didUpdateFeatures:v6];
}

- (id)_fetchMostRecentDNDWDEvent
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__14;
  v14 = __Block_byref_object_dispose__14;
  id v15 = 0;
  v2 = BiomeLibrary();
  v3 = [v2 UserFocus];
  id v4 = [v3 DoNotDisturbWhileDriving];
  id v5 = objc_msgSend(v4, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1F3539598, &unk_1F3539598, 0);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_6;
  v9[3] = &unk_1E6BE6988;
  v9[4] = &v10;
  id v6 = (id)[v5 sinkWithCompletion:&__block_literal_global_16 receiveInput:v9];
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  id v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: done fetching last DNDWD launch event", v6, 2u);
  }
}

uint64_t __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_6(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];

  return MEMORY[0x1F41817F8]();
}

- (void)_beginListeningForDNDWDEvents
{
  uint64_t v3 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.DNDWD" targetQueue:self->_queue];
  DNDWDScheduler = self->_DNDWDScheduler;
  self->_DNDWDScheduler = v3;

  objc_initWeak(&location, self);
  id v5 = BiomeLibrary();
  id v6 = [v5 UserFocus];
  id v7 = [v6 DoNotDisturbWhileDriving];
  v8 = objc_msgSend(v7, "atx_DSLPublisher");
  char v9 = [v8 subscribeOn:self->_DNDWDScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_14;
  v12[3] = &unk_1E6BE6A38;
  objc_copyWeak(&v13, &location);
  uint64_t v10 = [v9 sinkWithCompletion:&__block_literal_global_13_0 receiveInput:v12];
  DNDWDSink = self->_DNDWDSink;
  self->_DNDWDSink = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 state];
  id v4 = __atxlog_handle_modes();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_cold_1(v2);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: done listening to DNDWD events", v6, 2u);
  }
}

void __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];

  if (v4)
  {
    id v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeDrivingFeaturizer: received new DNDWD event", v8, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = [v3 eventBody];
    [WeakRetained _processNewDNDWDEvent:v7];
  }
}

- (void)beginListening
{
  if (!self->_queue)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeDriving.queue", v3);
    queue = self->_queue;
    self->_queue = v4;
  }

  [(ATXModeDrivingFeaturizer *)self _beginListeningForDNDWDEvents];
}

- (void)stopListening
{
  [(BPSSink *)self->_DNDWDSink cancel];
  DNDWDSink = self->_DNDWDSink;
  self->_DNDWDSink = 0;

  DNDWDScheduler = self->_DNDWDScheduler;
  self->_DNDWDScheduler = 0;
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
  objc_storeStrong((id *)&self->_DNDWDScheduler, 0);
  objc_storeStrong((id *)&self->_DNDWDSink, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__ATXModeDrivingFeaturizer__fetchMostRecentDNDWDEvent__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeDrivingFeaturizer: error fetching last DNDWD event: %@", v4, v5, v6, v7, 2u);
}

void __57__ATXModeDrivingFeaturizer__beginListeningForDNDWDEvents__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_1DAFF9000, v2, v3, "ATXModeDrivingFeaturizer: error listening to DNDWD events: %@", v4, v5, v6, v7, 2u);
}

@end