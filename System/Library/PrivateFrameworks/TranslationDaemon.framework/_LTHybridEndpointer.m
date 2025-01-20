@interface _LTHybridEndpointer
- (BOOL)didEndpointWithFeatures:(id)a3 silenceFeatures:(id)a4 endpointer:(id)a5;
- (BOOL)useDefaultServerFeaturesOnClientLag;
- (NSDictionary)endpointerThreshold;
- (_LTHybridEndpointer)init;
- (double)clampedSFLatencyMsForClientLag;
- (double)clientLagThresholdMs;
- (int64_t)audioBitDepth;
- (int64_t)samplingRate;
- (void)addSpeechAudioData:(id)a3;
- (void)clientSilenceFeaturesAvailable:(id)a3;
- (void)endAudio;
- (void)setClampedSFLatencyMsForClientLag:(double)a3;
- (void)setClientLagThresholdMs:(double)a3;
- (void)setEndpointerThreshold:(id)a3;
- (void)setServerEndpointerFeatures:(id)a3 withLocale:(id)a4;
- (void)setUseDefaultServerFeaturesOnClientLag:(BOOL)a3;
- (void)startEndpointingWithContext:(id)a3 delegate:(id)a4;
@end

@implementation _LTHybridEndpointer

- (_LTHybridEndpointer)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)_LTHybridEndpointer;
  v2 = [(_LTHybridEndpointer *)&v19 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_samplingRate = xmmword_26027B6A0;
    v2->_double clientLagThresholdMs = (double)_LTPreferencesHybridEndpointerClientLagThreshold();
    v3->_double clampedSFLatencyMsForClientLag = (double)_LTPreferencesHybridEndpointerClientLagClampedLatency();
    v3->_BOOL useDefaultServerFeaturesOnClientLag = _LTPreferencesHybridEndpointerUseDefaultFeaturesOnClientLagThreshold();
    v4 = _LTOSLogSpeech();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double clientLagThresholdMs = v3->_clientLagThresholdMs;
      double clampedSFLatencyMsForClientLag = v3->_clampedSFLatencyMsForClientLag;
      BOOL useDefaultServerFeaturesOnClientLag = v3->_useDefaultServerFeaturesOnClientLag;
      *(_DWORD *)buf = 134218496;
      double v21 = clientLagThresholdMs;
      __int16 v22 = 2048;
      double v23 = clampedSFLatencyMsForClientLag;
      __int16 v24 = 1024;
      BOOL v25 = useDefaultServerFeaturesOnClientLag;
      _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Client lag configuration is %f, %f, %{BOOL}i", buf, 0x1Cu);
    }
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.siri.translation.HEP", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.siri.translation.HEP.features", 0);
    featureQueue = v3->_featureQueue;
    v3->_featureQueue = (OS_dispatch_queue *)v10;

    v12 = _LTOSLogSpeech();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Init of HEP", buf, 2u);
    }
    v3->_didEndpoint = 0;
    sourceEndpointer = v3->_sourceEndpointer;
    v3->_sourceEndpointer = 0;

    sourceEndpointerFeatures = v3->_sourceEndpointerFeatures;
    v3->_sourceEndpointerFeatures = 0;

    targetEndpointer = v3->_targetEndpointer;
    v3->_targetEndpointer = 0;

    targetEndpointerFeatures = v3->_targetEndpointerFeatures;
    v3->_targetEndpointerFeatures = 0;

    v17 = v3;
  }

  return v3;
}

- (void)startEndpointingWithContext:(id)a3 delegate:(id)a4
{
  *(void *)&v99[5] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 autoEndpoint];
  dispatch_queue_t v10 = _LTOSLogSpeech();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v10, OS_LOG_TYPE_INFO, "Start new HEP request", buf, 2u);
    }
    self->_didEndpoint = 0;
    objc_storeStrong((id *)&self->_context, a3);
    objc_storeWeak((id *)&self->_delegate, v8);
    sourceEndpointer = self->_sourceEndpointer;
    self->_sourceEndpointer = 0;

    sourceEndpointerFeatures = self->_sourceEndpointerFeatures;
    self->_sourceEndpointerFeatures = 0;

    targetEndpointer = self->_targetEndpointer;
    self->_targetEndpointer = 0;

    targetEndpointerFeatures = self->_targetEndpointerFeatures;
    self->_targetEndpointerFeatures = 0;

    v16 = objc_alloc_init(_LTOfflineAssetManager);
    id v97 = 0;
    v17 = [(_LTOfflineAssetManager *)v16 endpointAssetInfoWithContext:v7 error:&v97];
    id v18 = v97;
    asset = self->_asset;
    self->_asset = v17;

    if (v18 || (double v21 = self->_asset) == 0)
    {
      v20 = _LTOSLogSpeech();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_LTHybridEndpointer startEndpointingWithContext:delegate:]((uint64_t)v18, v20);
      }
      goto LABEL_46;
    }
    __int16 v22 = [(_LTHybridEndpointerAssetInfo *)v21 caesuraModelURL];
    if (!v22)
    {
      v55 = _LTOSLogSpeech();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v55, OS_LOG_TYPE_INFO, "Could not obtain SPG (silence posterior generator) asset", buf, 2u);
      }
      goto LABEL_45;
    }
    id v23 = objc_alloc(MEMORY[0x263F3B3B0]);
    __int16 v24 = [v22 path];
    BOOL v25 = (EARCaesuraSilencePosteriorGenerator *)[v23 initWithConfigFile:v24 samplingRate:self->_samplingRate];
    spg = self->_spg;
    self->_spg = v25;

    [(EARCaesuraSilencePosteriorGenerator *)self->_spg setDelegate:self];
    v27 = self->_asset;
    v28 = [v7 localePair];
    v29 = [v28 sourceLocale];
    uint64_t v30 = [(_LTHybridEndpointerAssetInfo *)v27 endpointerModelURL:v29];

    v96 = (void *)v30;
    if (v30)
    {
      v95 = v22;
      id v31 = objc_alloc(MEMORY[0x263F3B3F8]);
      v32 = self->_asset;
      v33 = [v7 localePair];
      v34 = [v33 sourceLocale];
      v35 = [(_LTHybridEndpointerAssetInfo *)v32 endpointerModelURL:v34];
      v36 = [v35 path];
      v37 = (_EAREndpointer *)[v31 initWithConfiguration:v36];
      v38 = self->_sourceEndpointer;
      self->_sourceEndpointer = v37;

      v39 = [MEMORY[0x263F1C110] featuresForEndpointer:self->_sourceEndpointer];
      v40 = self->_sourceEndpointerFeatures;
      self->_sourceEndpointerFeatures = v39;

      if ([(_EAREndpointer *)self->_sourceEndpointer requestSupportedWithSamplingRate:self->_samplingRate])
      {
        v41 = [v7 localePair];
        v42 = [v41 sourceLocale];
        _LTPreferencesHybridEndpointerThresholdForLocale(v42);
        v43 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        sourceEndpointerThreshold = self->_sourceEndpointerThreshold;
        self->_sourceEndpointerThreshold = v43;

        v45 = [v7 localePair];
        v46 = [v45 sourceLocale];
        _LTPreferencesDisconnectedHybridEndpointerThresholdForLocale(v46);
        v47 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        sourceDisconnectedEndpointerThreshold = self->_sourceDisconnectedEndpointerThreshold;
        self->_sourceDisconnectedEndpointerThreshold = v47;

        if (self->_sourceDisconnectedEndpointerThreshold)
        {
          v49 = _LTOSLogSpeech();
          __int16 v22 = v95;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            v50 = self->_sourceDisconnectedEndpointerThreshold;
            v51 = v49;
            [(NSNumber *)v50 floatValue];
            *(_DWORD *)buf = 134217984;
            *(double *)v99 = v52;
            _os_log_impl(&dword_2600DC000, v51, OS_LOG_TYPE_INFO, "Updating disconnected source endpointer threshold to %f", buf, 0xCu);
          }
          v53 = self->_sourceEndpointer;
          v54 = self->_sourceDisconnectedEndpointerThreshold;
LABEL_26:
          [(NSNumber *)v54 floatValue];
          -[_EAREndpointer updateEndpointerThresholdWithValue:](v53, "updateEndpointerThresholdWithValue:");
          goto LABEL_27;
        }
        __int16 v22 = v95;
        if (self->_sourceEndpointerThreshold)
        {
          v58 = _LTOSLogSpeech();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            v59 = self->_sourceEndpointerThreshold;
            v60 = v58;
            [(NSNumber *)v59 floatValue];
            *(_DWORD *)buf = 134217984;
            *(double *)v99 = v61;
            _os_log_impl(&dword_2600DC000, v60, OS_LOG_TYPE_INFO, "Updating source endpointer threshold to %f", buf, 0xCu);
          }
          v53 = self->_sourceEndpointer;
          v54 = self->_sourceEndpointerThreshold;
          goto LABEL_26;
        }
      }
      else
      {
        v56 = _LTOSLogSpeech();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2600DC000, v56, OS_LOG_TYPE_INFO, "Request for sampling rate failed for source locale", buf, 2u);
        }
        v57 = self->_sourceEndpointer;
        self->_sourceEndpointer = 0;

        __int16 v22 = v95;
      }
    }
LABEL_27:
    v62 = self->_asset;
    v63 = [v7 localePair];
    v64 = [v63 targetLocale];
    v65 = [(_LTHybridEndpointerAssetInfo *)v62 endpointerModelURL:v64];

    if (!v65 || ![v7 autodetectLanguage]) {
      goto LABEL_42;
    }
    id v66 = objc_alloc(MEMORY[0x263F3B3F8]);
    v67 = [v65 path];
    v68 = (_EAREndpointer *)[v66 initWithConfiguration:v67];
    v69 = self->_targetEndpointer;
    self->_targetEndpointer = v68;

    v70 = [MEMORY[0x263F1C110] featuresForEndpointer:self->_targetEndpointer];
    v71 = self->_targetEndpointerFeatures;
    self->_targetEndpointerFeatures = v70;

    if (([(_EAREndpointer *)self->_targetEndpointer requestSupportedWithSamplingRate:self->_samplingRate] & 1) == 0)
    {
      v86 = _LTOSLogSpeech();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v86, OS_LOG_TYPE_INFO, "Request for sampling rate failed for source locale", buf, 2u);
      }
      v87 = self->_targetEndpointer;
      self->_targetEndpointer = 0;

      goto LABEL_42;
    }
    v72 = [v7 localePair];
    v73 = [v72 targetLocale];
    _LTPreferencesHybridEndpointerThresholdForLocale(v73);
    v74 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    targetEndpointerThreshold = self->_targetEndpointerThreshold;
    self->_targetEndpointerThreshold = v74;

    v76 = [v7 localePair];
    v77 = [v76 targetLocale];
    _LTPreferencesDisconnectedHybridEndpointerThresholdForLocale(v77);
    v78 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    targetDisconnectedEndpointerThreshold = self->_targetDisconnectedEndpointerThreshold;
    self->_targetDisconnectedEndpointerThreshold = v78;

    if (self->_targetDisconnectedEndpointerThreshold)
    {
      v80 = _LTOSLogSpeech();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        v81 = self->_targetDisconnectedEndpointerThreshold;
        v82 = v80;
        [(NSNumber *)v81 floatValue];
        *(_DWORD *)buf = 134217984;
        *(double *)v99 = v83;
        _os_log_impl(&dword_2600DC000, v82, OS_LOG_TYPE_INFO, "Updating disconnected target endpointer threshold to %f", buf, 0xCu);
      }
      v84 = self->_targetEndpointer;
      v85 = self->_targetDisconnectedEndpointerThreshold;
    }
    else
    {
      if (!self->_targetEndpointerThreshold)
      {
LABEL_42:
        v92 = _LTOSLogSpeech();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          BOOL v93 = self->_sourceEndpointer != 0;
          BOOL v94 = self->_targetEndpointer != 0;
          *(_DWORD *)buf = 67109376;
          v99[0] = v93;
          LOWORD(v99[1]) = 1024;
          *(_DWORD *)((char *)&v99[1] + 2) = v94;
          _os_log_impl(&dword_2600DC000, v92, OS_LOG_TYPE_INFO, "Have hybrid endpointer for source %{BOOL}i, for target %{BOOL}i", buf, 0xEu);
        }

LABEL_45:
LABEL_46:

        goto LABEL_47;
      }
      v88 = _LTOSLogSpeech();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        v89 = self->_targetEndpointerThreshold;
        v90 = v88;
        [(NSNumber *)v89 floatValue];
        *(_DWORD *)buf = 134217984;
        *(double *)v99 = v91;
        _os_log_impl(&dword_2600DC000, v90, OS_LOG_TYPE_INFO, "Updating target endpointer threshold to %f", buf, 0xCu);
      }
      v84 = self->_targetEndpointer;
      v85 = self->_targetEndpointerThreshold;
    }
    [(NSNumber *)v85 floatValue];
    -[_EAREndpointer updateEndpointerThresholdWithValue:](v84, "updateEndpointerThresholdWithValue:");
    goto LABEL_42;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v10, OS_LOG_TYPE_INFO, "Auto endpointing is turned off", buf, 2u);
  }
LABEL_47:
}

- (void)setServerEndpointerFeatures:(id)a3 withLocale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  featureQueue = self->_featureQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke;
  v11[3] = &unk_2655470C0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(featureQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  if (!self->_didEndpoint && (self->_sourceEndpointer || self->_targetEndpointer))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42___LTHybridEndpointer_addSpeechAudioData___block_invoke;
    block[3] = &unk_265545C70;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)endAudio
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31___LTHybridEndpointer_endAudio__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)didEndpointWithFeatures:(id)a3 silenceFeatures:(id)a4 endpointer:(id)a5
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 processedAudioMs];
  if (v11 >= (double)[v8 processedAudioDurationInMilliseconds])
  {
    [v9 processedAudioMs];
    double v43 = v42 - (double)[v8 processedAudioDurationInMilliseconds];
    id v44 = objc_alloc(MEMORY[0x263F3B3F0]);
    uint64_t v45 = [v8 wordCount];
    uint64_t v46 = [v8 trailingSilenceDuration];
    [v8 eosLikelihood];
    double v48 = v47;
    v49 = [v8 pauseCounts];
    [v8 silencePosterior];
    double v51 = v50;
    [v9 silenceFramesCountMs];
    double v53 = v52;
    [v9 silenceProbability];
    double v55 = v54;
    [v9 silenceDurationMs];
    *(float *)&double v57 = v56;
    *(float *)&double v58 = v43;
    v41 = (void *)[v44 initWithWordCount:v45 trailingSilenceDuration:v46 endOfSentenceLikelihood:v49 pauseCounts:v48 silencePosterior:v51 clientSilenceFramesCountMs:v53 clientSilenceProbability:v55 silencePosteriorNF:v57 serverFeaturesLatency:v58];

    if (!v41) {
      goto LABEL_19;
    }
  }
  else
  {
    id v12 = _LTOSLogSpeech();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = v12;
      *(double *)&uint64_t v14 = COERCE_DOUBLE([v8 processedAudioDurationInMilliseconds]);
      [v9 processedAudioMs];
      *(_DWORD *)buf = 134349312;
      double v107 = *(double *)&v14;
      __int16 v108 = 2050;
      double v109 = v15;
      _os_log_impl(&dword_2600DC000, v13, OS_LOG_TYPE_INFO, "ClientLag: serverProcessedAudioMs(%{public}ld) > effectiveClientProcessedAudioMs(%{public}f)", buf, 0x16u);
    }
    [v9 processedAudioMs];
    double v17 = v16 - (double)[v8 processedAudioDurationInMilliseconds];
    if (v17 > self->_clientLagThresholdMs)
    {
      v80 = _LTOSLogSpeech();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        double clientLagThresholdMs = self->_clientLagThresholdMs;
        *(_DWORD *)buf = 134349312;
        double v107 = v17;
        __int16 v108 = 2050;
        double v109 = clientLagThresholdMs;
        v82 = "ClientLag: Not invoking HybridClassifier: sfLatency > clientLagThreshold: %{public}f > %{public}f";
        float v83 = v80;
        uint32_t v84 = 22;
LABEL_21:
        _os_log_impl(&dword_2600DC000, v83, OS_LOG_TYPE_INFO, v82, buf, v84);
      }
LABEL_22:
      LOBYTE(v59) = 0;
      goto LABEL_23;
    }
    BOOL useDefaultServerFeaturesOnClientLag = self->_useDefaultServerFeaturesOnClientLag;
    objc_super v19 = _LTOSLogSpeech();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (useDefaultServerFeaturesOnClientLag)
    {
      if (v20)
      {
        double v21 = v19;
        [v9 processedAudioMs];
        *(_DWORD *)buf = 134349056;
        double v107 = v22;
        _os_log_impl(&dword_2600DC000, v21, OS_LOG_TYPE_INFO, "ClientLag: Using DefaultServerFeatures with disconnected-state sfLatency: %{public}f", buf, 0xCu);
      }
      id v23 = [MEMORY[0x263F1C110] featuresForEndpointer:v10];
      id v24 = objc_alloc(MEMORY[0x263F3B3F0]);
      uint64_t v25 = [v23 wordCount];
      uint64_t v26 = [v23 trailingSilenceDuration];
      [v23 eosLikelihood];
      double v28 = v27;
      v29 = [v23 pauseCounts];
      [v23 silencePosterior];
      double v31 = v30;
      [v9 silenceFramesCountMs];
      double v33 = v32;
      [v9 silenceProbability];
      double v35 = v34;
      [v9 silenceDurationMs];
      float v37 = v36;
      [v9 processedAudioMs];
      *(float *)&double v39 = v38;
      *(float *)&double v40 = v37;
      v41 = (void *)[v24 initWithWordCount:v25 trailingSilenceDuration:v26 endOfSentenceLikelihood:v29 pauseCounts:v28 silencePosterior:v31 clientSilenceFramesCountMs:v33 clientSilenceProbability:v35 silencePosteriorNF:v40 serverFeaturesLatency:v39];

      if (!v41) {
        goto LABEL_19;
      }
    }
    else
    {
      if (v20)
      {
        double clampedSFLatencyMsForClientLag = self->_clampedSFLatencyMsForClientLag;
        *(_DWORD *)buf = 134349056;
        double v107 = clampedSFLatencyMsForClientLag;
        _os_log_impl(&dword_2600DC000, v19, OS_LOG_TYPE_INFO, "ClientLag: Using ServerFeatures with ClampedSFLatency: %{public}f", buf, 0xCu);
      }
      id v86 = objc_alloc(MEMORY[0x263F3B3F0]);
      uint64_t v87 = [v8 wordCount];
      uint64_t v88 = [v8 trailingSilenceDuration];
      [v8 eosLikelihood];
      double v90 = v89;
      float v91 = [v8 pauseCounts];
      [v8 silencePosterior];
      double v93 = v92;
      [v9 silenceFramesCountMs];
      double v95 = v94;
      [v9 silenceProbability];
      double v97 = v96;
      [v9 silenceDurationMs];
      *(float *)&double v99 = v98;
      *(float *)&double v100 = self->_clampedSFLatencyMsForClientLag;
      v41 = (void *)[v86 initWithWordCount:v87 trailingSilenceDuration:v88 endOfSentenceLikelihood:v91 pauseCounts:v90 silencePosterior:v93 clientSilenceFramesCountMs:v95 clientSilenceProbability:v97 silencePosteriorNF:v99 serverFeaturesLatency:v100];

      if (!v41)
      {
LABEL_19:
        v101 = _LTOSLogSpeech();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v82 = "ClientLag: Not Invoking HybridClassifier as serverProcessedAudioMs > effectiveClientProcessedAudioMs";
          float v83 = v101;
          uint32_t v84 = 2;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
  }
  uint64_t v105 = 0;
  [v9 processedAudioMs];
  id v104 = 0;
  int v59 = objc_msgSend(v10, "didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:", v41, &v104, (char *)&v105 + 4, &v105);
  id v60 = v104;
  float v61 = _LTOSLogSpeech();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    v62 = v61;
    *(double *)&uint64_t v63 = COERCE_DOUBLE([v41 trailingSilenceDuration]);
    [v41 clientSilenceFramesCountMs];
    double v65 = v64;
    [v41 endOfSentenceLikelihood];
    uint64_t v67 = v66;
    uint64_t v68 = [v41 wordCount];
    [v41 serverFeaturesLatency];
    double v70 = v69;
    [v41 clientSilenceProbability];
    uint64_t v72 = v71;
    v73 = [v41 pauseCounts];
    [v73 componentsJoinedByString:@","];
    v74 = id v103 = v10;
    [v41 silencePosterior];
    uint64_t v76 = v75;
    [v9 silencePosterior];
    uint64_t v78 = v77;
    [v9 processedAudioMs];
    *(_DWORD *)buf = 134351874;
    double v107 = *(double *)&v63;
    __int16 v108 = 2050;
    double v109 = v65;
    __int16 v110 = 2050;
    uint64_t v111 = v67;
    __int16 v112 = 2050;
    uint64_t v113 = v68;
    __int16 v114 = 2050;
    double v115 = v70;
    __int16 v116 = 2050;
    uint64_t v117 = v72;
    __int16 v118 = 2114;
    v119 = v74;
    __int16 v120 = 2050;
    uint64_t v121 = v76;
    __int16 v122 = 2050;
    uint64_t v123 = v78;
    __int16 v124 = 2050;
    unint64_t v125 = (unint64_t)v79;
    __int16 v126 = 2050;
    double v127 = *((float *)&v105 + 1);
    __int16 v128 = 1026;
    int v129 = v59;
    _os_log_impl(&dword_2600DC000, v62, OS_LOG_TYPE_INFO, "HEP.feats: [%{public}ld,%{public}f,%{public}f,%{public}ld,%{public}f,%{public}f] & [(%{public}@),%{public}f,%{public}f] @ %{public}lu [%{public}f, %{public}d]", buf, 0x76u);

    id v10 = v103;
  }

LABEL_23:
  return v59;
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_LTHybridEndpointer clientSilenceFeaturesAvailable:](v5);
  }
  if (!self->_didEndpoint)
  {
    objc_initWeak(&location, self);
    featureQueue = self->_featureQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54___LTHybridEndpointer_clientSilenceFeaturesAvailable___block_invoke;
    block[3] = &unk_265545C70;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(featureQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (NSDictionary)endpointerThreshold
{
  return self->_endpointerThreshold;
}

- (void)setEndpointerThreshold:(id)a3
{
}

- (int64_t)samplingRate
{
  return self->_samplingRate;
}

- (int64_t)audioBitDepth
{
  return self->_audioBitDepth;
}

- (double)clientLagThresholdMs
{
  return self->_clientLagThresholdMs;
}

- (void)setClientLagThresholdMs:(double)a3
{
  self->_double clientLagThresholdMs = a3;
}

- (double)clampedSFLatencyMsForClientLag
{
  return self->_clampedSFLatencyMsForClientLag;
}

- (void)setClampedSFLatencyMsForClientLag:(double)a3
{
  self->_double clampedSFLatencyMsForClientLag = a3;
}

- (BOOL)useDefaultServerFeaturesOnClientLag
{
  return self->_useDefaultServerFeaturesOnClientLag;
}

- (void)setUseDefaultServerFeaturesOnClientLag:(BOOL)a3
{
  self->_BOOL useDefaultServerFeaturesOnClientLag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointerThreshold, 0);
  objc_storeStrong((id *)&self->_featureQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spg, 0);
  objc_storeStrong((id *)&self->_targetEndpointerFeatures, 0);
  objc_storeStrong((id *)&self->_targetDisconnectedEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_targetEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_targetEndpointer, 0);
  objc_storeStrong((id *)&self->_sourceEndpointerFeatures, 0);
  objc_storeStrong((id *)&self->_sourceDisconnectedEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_sourceEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_sourceEndpointer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)startEndpointingWithContext:(uint64_t)a1 delegate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Could not get appropriate endpointer assets: %@", (uint8_t *)&v2, 0xCu);
}

- (void)clientSilenceFeaturesAvailable:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "clientSilenceFeaturesAvailable", v1, 2u);
}

@end