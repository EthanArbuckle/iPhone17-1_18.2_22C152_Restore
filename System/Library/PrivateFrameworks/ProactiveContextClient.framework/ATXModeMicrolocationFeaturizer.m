@interface ATXModeMicrolocationFeaturizer
- (ATXModeFeaturizerDelegate)delegate;
- (id)_provideFeaturesWithLocalizationEvent:(id)a3;
- (id)provideFeatures;
- (void)_processLocalizationEvent:(id)a3;
- (void)beginListening;
- (void)setDelegate:(id)a3;
- (void)stopListening;
@end

@implementation ATXModeMicrolocationFeaturizer

- (id)provideFeatures
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = __atxlog_handle_modes();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1DAFF9000, v4, OS_LOG_TYPE_DEFAULT, "[%@][%@] Requesting feature set via pull based feature provider", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  v8 = BiomeLibrary();
  v9 = [v8 Location];
  v10 = [v9 MicroLocation];
  v11 = [v10 Localization];
  v12 = objc_msgSend(v11, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1F35393B8, &unk_1F35393B8, 0);

  v13 = [v12 filterWithIsIncluded:&__block_literal_global_0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2;
  v18[3] = &unk_1E6BE6960;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_19;
  v17[3] = &unk_1E6BE6988;
  v17[4] = buf;
  id v14 = (id)[v13 sinkWithCompletion:v18 receiveInput:v17];

  v15 = [(ATXModeMicrolocationFeaturizer *)self _provideFeaturesWithLocalizationEvent:*(void *)(*(void *)&buf[8] + 40)];
  objc_destroyWeak(v19);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);

  return v15;
}

uint64_t __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  v3 = [v2 clientBundleID];
  uint64_t v4 = [v3 isEqualToString:@"focus-mode"];

  return v4;
}

void __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  v5 = __atxlog_handle_modes();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2_cold_1(a1, v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = objc_opt_class();
    v9 = *(const char **)(a1 + 40);
    id v10 = v8;
    v11 = NSStringFromSelector(v9);
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Successfully fetched last event from BMMicroLocationRestrictedLocalizationStream", (uint8_t *)&v12, 0x16u);
  }
}

uint64_t __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_19(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];

  return MEMORY[0x1F41817F8]();
}

- (id)_provideFeaturesWithLocalizationEvent:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(ATXModeFeatureSet);
  if (v3)
  {
    v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = [v3 absoluteTimeStamp];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 > 900.0)
    {
      v9 = __atxlog_handle_modes();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_opt_class();
        id v11 = v10;
        int v12 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v69 = v10;
        __int16 v70 = 2112;
        v71 = v12;
        __int16 v72 = 2048;
        uint64_t v73 = 0x408C200000000000;
        _os_log_impl(&dword_1DAFF9000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@] Warning: Localization scan was unexpectedly delayed by more than %f seconds", buf, 0x20u);
      }
    }
    v60 = v4;
    v13 = __atxlog_handle_modes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = objc_opt_class();
      id v15 = v14;
      uint64_t v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v69 = v14;
      __int16 v70 = 2112;
      v71 = v16;
      _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@] Fetching predicted Microlocation for this device", buf, 0x16u);
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v59 = v3;
    v17 = [v3 probabilityVector];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v64 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          v23 = [v22 label];
          id v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C9FC4298-DE04-494A-9791-71AB71B52E27"];
          uint64_t v25 = [v24 UUIDString];
          int v26 = [v23 isEqual:v25];

          if (v26)
          {
            v27 = __atxlog_handle_modes();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = objc_opt_class();
              id v29 = v28;
              v30 = NSStringFromSelector(a2);
              [v22 probability];
              *(_DWORD *)buf = 138412803;
              v69 = v28;
              __int16 v70 = 2112;
              v71 = v30;
              __int16 v72 = 2049;
              uint64_t v73 = v31;
              v32 = v27;
              v33 = "[%@][%@] Probability that this device is at a work microlocation: %{private}f";
LABEL_22:
              _os_log_impl(&dword_1DAFF9000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0x20u);
            }
          }
          else
          {
            v34 = [v22 label];
            v35 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"];
            v36 = [v35 UUIDString];
            int v37 = [v34 isEqual:v36];

            if (v37)
            {
              v27 = __atxlog_handle_modes();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v38 = objc_opt_class();
                id v29 = v38;
                v30 = NSStringFromSelector(a2);
                [v22 probability];
                *(_DWORD *)buf = 138412803;
                v69 = v38;
                __int16 v70 = 2112;
                v71 = v30;
                __int16 v72 = 2049;
                uint64_t v73 = v39;
                v32 = v27;
                v33 = "[%@][%@] Probability that this device is outside of a work microlocation: %{private}f";
                goto LABEL_22;
              }
            }
            else
            {
              v40 = [v22 label];
              v41 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
              v42 = [v41 UUIDString];
              int v43 = [v40 isEqual:v42];

              if (!v43) {
                continue;
              }
              v27 = __atxlog_handle_modes();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v44 = objc_opt_class();
                id v29 = v44;
                v30 = NSStringFromSelector(a2);
                [v22 probability];
                *(_DWORD *)buf = 138412803;
                v69 = v44;
                __int16 v70 = 2112;
                v71 = v30;
                __int16 v72 = 2049;
                uint64_t v73 = v45;
                v32 = v27;
                v33 = "[%@][%@] Probability that this device is at an unknown microlocation: %{private}f";
                goto LABEL_22;
              }
            }
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v19);
    }

    id v3 = v59;
    v46 = [v59 maxProbabilityLabel];
    if ([v46 isEqualToString:@"C9FC4298-DE04-494A-9791-71AB71B52E27"])
    {
      [v59 maxProbability];
      double v48 = v47;

      if (v48 > 0.5)
      {
        v49 = __atxlog_handle_modes();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = objc_opt_class();
          id v51 = v50;
          v52 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v69 = v50;
          __int16 v70 = 2112;
          v71 = v52;
          _os_log_impl(&dword_1DAFF9000, v49, OS_LOG_TYPE_DEFAULT, "[%@][%@] Device is predicted to be at a work microlocation", buf, 0x16u);
        }
        uint64_t v53 = 1;
LABEL_38:
        uint64_t v4 = v60;

        [(ATXModeFeatureSet *)v60 setValue:v53 forBinaryFeatureOfType:25];
        goto LABEL_39;
      }
    }
    else
    {
    }
    v49 = __atxlog_handle_modes();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_opt_class();
      id v56 = v55;
      v57 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v69 = v55;
      __int16 v70 = 2112;
      v71 = v57;
      _os_log_impl(&dword_1DAFF9000, v49, OS_LOG_TYPE_DEFAULT, "[%@][%@] Device was predicted to not be at a work microlocation", buf, 0x16u);
    }
    uint64_t v53 = 0;
    goto LABEL_38;
  }
  v54 = __atxlog_handle_modes();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    [(ATXModeMicrolocationFeaturizer *)(uint64_t)self _provideFeaturesWithLocalizationEvent:v54];
  }

LABEL_39:

  return v4;
}

- (void)_processLocalizationEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = objc_opt_class();
    id v8 = v7;
    v9 = NSStringFromSelector(a2);
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Pushing work microlocation prediction to mode heurisic classifier", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = [(ATXModeMicrolocationFeaturizer *)self _provideFeaturesWithLocalizationEvent:v5];

  [WeakRetained featurizer:self didUpdateFeatures:v11];
}

- (void)beginListening
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeMicroLocationRestrictedLocalizationEvent.queue", v3);
    queue = self->_queue;
    self->_queue = v4;
  }
  id v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (id)objc_opt_class();
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] registering for real time events from the BiomeMicroLocationRestrictedLocalizationEventStream", buf, 0x16u);
  }
  v9 = (BMBiomeScheduler *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"FocusModes.Microlocation" targetQueue:self->_queue];
  scheduler = self->_scheduler;
  self->_scheduler = v9;

  id v11 = BiomeLibrary();
  int v12 = [v11 Location];
  v13 = [v12 MicroLocation];
  __int16 v14 = [v13 Localization];
  id v15 = objc_msgSend(v14, "atx_DSLPublisher");
  uint64_t v16 = [v15 subscribeOn:self->_scheduler];
  v17 = [v16 filterWithIsIncluded:&__block_literal_global_29];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2;
  v23[3] = &unk_1E6BE6960;
  objc_copyWeak(v24, &location);
  v24[1] = (id)a2;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_30;
  v21[3] = &unk_1E6BE69B0;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a2;
  uint64_t v18 = [v17 sinkWithCompletion:v23 receiveInput:v21];
  sink = self->_sink;
  self->_sink = v18;

  objc_destroyWeak(v22);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

uint64_t __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  id v3 = [v2 clientBundleID];
  uint64_t v4 = [v3 isEqualToString:@"focus-mode"];

  return v4;
}

void __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_modes();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2_cold_1(a1, v3);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = objc_opt_class();
    v9 = *(const char **)(a1 + 40);
    id v10 = v8;
    id v11 = NSStringFromSelector(v9);
    int v12 = 138412546;
    v13 = v8;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] successfully finished listening to MicroLocation Localization events", (uint8_t *)&v12, 0x16u);
  }
}

void __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_30(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = *(const char **)(a1 + 40);
    id v8 = v6;
    v9 = NSStringFromSelector(v7);
    id v10 = [v3 eventBody];
    int v13 = 138412802;
    __int16 v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] Received new MicroLocation Localization event: %@", (uint8_t *)&v13, 0x20u);
  }
  id v11 = [v3 eventBody];

  if (v11)
  {
    int v12 = [v3 eventBody];
    [WeakRetained _processLocalizationEvent:v12];
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

void __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_opt_class();
  id v6 = *(const char **)(a1 + 40);
  id v7 = v5;
  id v8 = NSStringFromSelector(v6);
  v9 = [a2 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1DAFF9000, v10, v11, "[%@][%@] Error fetching last event: %@", v12, v13, v14, v15, v16);
}

- (void)_provideFeaturesWithLocalizationEvent:(NSObject *)a3 .cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_class();
  id v6 = v5;
  id v7 = NSStringFromSelector(a2);
  int v8 = 138412546;
  v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_1DAFF9000, a3, OS_LOG_TYPE_ERROR, "[%@][%@] Nil BMMicroLocationRestrictedLocalizationEvent", (uint8_t *)&v8, 0x16u);
}

void __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_opt_class();
  id v6 = *(const char **)(a1 + 40);
  id v7 = v5;
  int v8 = NSStringFromSelector(v6);
  v9 = [a2 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1DAFF9000, v10, v11, "[%@][%@] listening to MicroLocation Localization events: %@", v12, v13, v14, v15, v16);
}

@end