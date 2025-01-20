@interface _LTLanguageDetector
- (BOOL)featureCombinationModelSupported;
- (BOOL)forceLanguageDetectionResult;
- (BOOL)haveAtLeastOneFinalASRResult;
- (BOOL)haveFinalASRResults;
- (BOOL)isLowConfidencePair;
- (NSMutableArray)acousticResults;
- (_LTDSELFLoggingManager)selfLoggingManager;
- (_LTLanguageDetectionResult)lastResult;
- (_LTLanguageDetector)initWithSelfLoggingManager:(id)a3;
- (_LTLanguageDetectorFeatureCombinationModel)featureCombinationModel;
- (double)samplingRate;
- (int64_t)audioBitDepth;
- (void)addSpeechAudioData:(id)a3;
- (void)addSpeechRecognitionResult:(id)a3;
- (void)cancelLanguageDetection;
- (void)endAudio;
- (void)languageDetectorDidDetectLanguageWithConfidence:(id)a3 confidence:(id)a4 isConfident:(BOOL)a5;
- (void)sendFinalLanguageDetectionResult:(BOOL)a3;
- (void)sendLIDResult:(id)a3;
- (void)setAcousticResults:(id)a3;
- (void)setAudioBitDepth:(int64_t)a3;
- (void)setFeatureCombinationModel:(id)a3;
- (void)setFeatureCombinationModelSupported:(BOOL)a3;
- (void)setLastResult:(id)a3;
- (void)setSamplingRate:(double)a3;
- (void)startLanguageDetectionWithContext:(id)a3 delegate:(id)a4;
@end

@implementation _LTLanguageDetector

- (_LTLanguageDetector)initWithSelfLoggingManager:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_LTLanguageDetector;
  v6 = [(_LTLanguageDetector *)&v40 init];
  v7 = v6;
  if (v6)
  {
    v6->_samplingRate = 16000.0;
    v6->_audioBitDepth = 2;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    acousticResults = v7->_acousticResults;
    v7->_acousticResults = v8;

    lastResult = v7->_lastResult;
    v7->_lastResult = 0;

    v7->_havePartialASRConfidences = 0;
    *(_DWORD *)&v7->_endAudioCalled = 0;
    partialSpeechResultConfidences = v7->_partialSpeechResultConfidences;
    v7->_partialSpeechResultConfidences = 0;

    finalSpeechResults = v7->_finalSpeechResults;
    v7->_finalSpeechResults = 0;

    modelVersions = v7->_modelVersions;
    v7->_modelVersions = 0;

    v7->_minimumAcousticLanguageDetectorResults = _LTPreferencesMinimumAcousticLanguageDetectionResults();
    v7->_maximumAcousticLanguageDetectorResults = _LTPreferencesMaximumAcousticLanguageDetectionResults();
    v14 = _LTOSLogLID();
    v7->_lidSignpostID = os_signpost_id_generate(v14);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.translation.lid.result", 0);
    resultQueue = v7->_resultQueue;
    v7->_resultQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.translation.lid.finalResult", 0);
    finalResultWaitQueue = v7->_finalResultWaitQueue;
    v7->_finalResultWaitQueue = (OS_dispatch_queue *)v17;

    v19 = objc_alloc_init(_LTOfflineAssetManager);
    id v39 = 0;
    v20 = [(_LTOfflineAssetManager *)v19 languageDetectorAssetWithError:&v39];
    id v21 = v39;
    if (v21)
    {
      v22 = _LTOSLogLID();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[_LTLanguageDetector initWithSelfLoggingManager:]();
      }
      v23 = 0;
    }
    else
    {
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2050000000;
      v24 = (void *)getCSLanguageDetectorClass_softClass;
      uint64_t v45 = getCSLanguageDetectorClass_softClass;
      if (!getCSLanguageDetectorClass_softClass)
      {
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __getCSLanguageDetectorClass_block_invoke;
        v41[3] = &unk_2655461D0;
        v41[4] = &v42;
        __getCSLanguageDetectorClass_block_invoke((uint64_t)v41);
        v24 = (void *)v43[3];
      }
      v25 = v24;
      _Block_object_dispose(&v42, 8);
      id v26 = [v25 alloc];
      v27 = [v20 languageDetectorModelURL];
      uint64_t v28 = [v26 initWithModelURL:v27];
      csLanguageDetector = v7->_csLanguageDetector;
      v7->_csLanguageDetector = (CSLanguageDetector *)v28;

      [(CSLanguageDetector *)v7->_csLanguageDetector setDelegate:v7];
      v30 = [_LTLanguageDetectorFeatureCombinationModel alloc];
      v31 = [v20 featureCombinationConfigUrl];
      uint64_t v32 = [(_LTLanguageDetectorFeatureCombinationModel *)v30 initWithConfig:v31];
      featureCombinationModel = v7->_featureCombinationModel;
      v7->_featureCombinationModel = (_LTLanguageDetectorFeatureCombinationModel *)v32;

      v7->_featureCombinationModelSupported = 0;
      objc_storeStrong((id *)&v7->_selfLoggingManager, a3);
      id v34 = objc_alloc(MEMORY[0x263EFFA08]);
      v35 = _LTPreferencesGetLanguageDetectorUnsupportedPairs();
      uint64_t v36 = [v34 initWithArray:v35];
      lowConfidenceLanguagePairs = v7->_lowConfidenceLanguagePairs;
      v7->_lowConfidenceLanguagePairs = (NSSet *)v36;

      v23 = v7;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)startLanguageDetectionWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_context, a3);
  objc_storeWeak((id *)&self->_delegate, v8);
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  acousticResults = self->_acousticResults;
  self->_acousticResults = v9;

  lastResult = self->_lastResult;
  self->_lastResult = 0;

  self->_havePartialASRConfidences = 0;
  *(_DWORD *)&self->_endAudioCalled = 0;
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  partialSpeechResultConfidences = self->_partialSpeechResultConfidences;
  self->_partialSpeechResultConfidences = v12;

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_queue_t v15 = self->_partialSpeechResultConfidences;
  v16 = [v7 localePair];
  dispatch_queue_t v17 = [v16 sourceLocale];
  [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v17];

  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  v19 = self->_partialSpeechResultConfidences;
  v20 = [v7 localePair];
  id v21 = [v20 targetLocale];
  [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v21];

  v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  finalSpeechResults = self->_finalSpeechResults;
  self->_finalSpeechResults = v22;

  v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  modelVersions = self->_modelVersions;
  self->_modelVersions = v24;

  if ([v7 autodetectLanguage])
  {
    id v26 = _LTOSLogLID();
    v27 = v26;
    os_signpost_id_t lidSignpostID = self->_lidSignpostID;
    if (lidSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v27, OS_SIGNPOST_INTERVAL_BEGIN, lidSignpostID, "LID", "Start", buf, 2u);
    }

    if ([v7 lidThreshold] < 0)
    {
      uint64_t v32 = [v7 localePair];
      self->_double sourceLocaleConfidenceThreshold = _LTPreferencesLanguageDetectorThresholdsForLocale(v32);

      v33 = [v7 localePair];
      id v34 = [v33 reversedPair];
      self->_double targetLocaleConfidenceThreshold = _LTPreferencesLanguageDetectorThresholdsForLocale(v34);

      v35 = _LTOSLogLID();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        double sourceLocaleConfidenceThreshold = self->_sourceLocaleConfidenceThreshold;
        double targetLocaleConfidenceThreshold = self->_targetLocaleConfidenceThreshold;
        *(_DWORD *)buf = 134218240;
        *(double *)&buf[4] = sourceLocaleConfidenceThreshold;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = targetLocaleConfidenceThreshold;
        _os_log_impl(&dword_2600DC000, v35, OS_LOG_TYPE_INFO, "Confidence thresholds for source %f and target %f", buf, 0x16u);
      }
      if ((float)(self->_sourceLocaleConfidenceThreshold + self->_targetLocaleConfidenceThreshold) <= 1.0)
      {
        v38 = _LTOSLogLID();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          -[_LTLanguageDetector startLanguageDetectionWithContext:delegate:]();
        }
      }
    }
    else
    {
      v29 = _LTOSLogLID();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        uint64_t v31 = [v7 lidThreshold];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v31;
        _os_log_impl(&dword_2600DC000, v30, OS_LOG_TYPE_INFO, "Overriding confidence thresholds, setting to %ld", buf, 0xCu);
      }
      self->_double sourceLocaleConfidenceThreshold = (float)[v7 lidThreshold] / 1000.0;
      self->_double targetLocaleConfidenceThreshold = (float)[v7 lidThreshold] / 1000.0;
    }
    id v39 = [v7 localePair];
    objc_super v40 = [v39 sourceLocale];
    v41 = [v40 _ltCsLocaleIdentifier];

    uint64_t v42 = [v7 localePair];
    v43 = [v42 targetLocale];
    uint64_t v44 = [v43 _ltCsLocaleIdentifier];

    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2050000000;
    uint64_t v45 = (void *)getCSLanguageDetectorOptionClass_softClass;
    uint64_t v54 = getCSLanguageDetectorOptionClass_softClass;
    if (!getCSLanguageDetectorOptionClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCSLanguageDetectorOptionClass_block_invoke;
      v56 = &unk_2655461D0;
      v57 = &v51;
      __getCSLanguageDetectorOptionClass_block_invoke((uint64_t)buf);
      uint64_t v45 = (void *)v52[3];
    }
    v46 = v45;
    _Block_object_dispose(&v51, 8);
    id v47 = objc_alloc_init(v46);
    double samplingRate = self->_samplingRate;
    *(float *)&double samplingRate = samplingRate;
    [v47 setSamplingRate:samplingRate];
    v49 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v41, v44, 0, v51);
    [v47 setDictationLanguages:v49];

    [(CSLanguageDetector *)self->_csLanguageDetector resetForNewRequest:v47];
    if (self->_featureCombinationModel)
    {
      v50 = [v7 localePair];
      self->_featureCombinationModelSupported = _LTPreferencesLanguageDetectorFeatureCombinationModelSupportedForLocale(v50);
    }
    else
    {
      self->_featureCombinationModelSupported = 0;
    }
  }
}

- (void)sendLIDResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (!self->_finalLIDResultSent)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      self->_finalLIDResultSent = [v4 isFinal];
      id v8 = _LTOSLogLID();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        if ([v4 isFinal]) {
          v10 = @"final";
        }
        else {
          v10 = @"intermediate";
        }
        v11 = [v4 dominantLanguage];
        v12 = [v11 _ltLocaleIdentifier];
        int v14 = 138543874;
        dispatch_queue_t v15 = v10;
        __int16 v16 = 2114;
        dispatch_queue_t v17 = v12;
        __int16 v18 = 1024;
        int v19 = [v4 isConfident];
        _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Sending out new %{public}@ LID result, detected %{public}@, confident %{BOOL}i", (uint8_t *)&v14, 0x1Cu);
      }
      id v13 = objc_loadWeakRetained((id *)p_delegate);
      [v13 languageDetectionResult:v4];
    }
  }
}

- (BOOL)haveFinalASRResults
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  finalSpeechResults = self->_finalSpeechResults;
  id v4 = [(_LTTranslationContext *)self->_context localePair];
  id v5 = [v4 sourceLocale];
  v6 = [(NSMutableDictionary *)finalSpeechResults objectForKey:v5];

  char v7 = self->_finalSpeechResults;
  id v8 = [(_LTTranslationContext *)self->_context localePair];
  v9 = [v8 targetLocale];
  v10 = [(NSMutableDictionary *)v7 objectForKey:v9];

  if (v6) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;

  return v12;
}

- (BOOL)haveAtLeastOneFinalASRResult
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  finalSpeechResults = self->_finalSpeechResults;
  id v4 = [(_LTTranslationContext *)self->_context localePair];
  id v5 = [v4 sourceLocale];
  uint64_t v6 = [(NSMutableDictionary *)finalSpeechResults objectForKey:v5];

  char v7 = self->_finalSpeechResults;
  id v8 = [(_LTTranslationContext *)self->_context localePair];
  v9 = [v8 targetLocale];
  uint64_t v10 = [(NSMutableDictionary *)v7 objectForKey:v9];

  return (v6 | v10) != 0;
}

- (void)sendFinalLanguageDetectionResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (self->_finalLIDResultSent) {
    return;
  }
  lastResult = self->_lastResult;
  self->_lastResult = 0;

  BOOL v6 = [(_LTLanguageDetector *)self haveFinalASRResults];
  BOOL v7 = [(_LTLanguageDetector *)self haveAtLeastOneFinalASRResult];
  if (self->_havePartialASRConfidences)
  {
    BOOL v8 = v7;
    int v9 = [(NSMutableArray *)self->_acousticResults count] >= self->_minimumAcousticLanguageDetectorResults || v8;
    if (!((self->_endAudioCalled || v6) | v9)) {
      return;
    }
  }
  else if (!v6)
  {
    return;
  }
  self->_useFinalThresholds |= (v6 || v3) | ([(NSMutableArray *)self->_acousticResults count] >= self->_maximumAcousticLanguageDetectorResults);
  uint64_t v10 = _LTOSLogLID();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    acousticResults = self->_acousticResults;
    BOOL v12 = v10;
    uint64_t v13 = [(NSMutableArray *)acousticResults count];
    int v14 = @", partial ASR confidences";
    if (!self->_havePartialASRConfidences) {
      int v14 = &stru_270C008E8;
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = v13;
    __int16 v31 = 2114;
    uint64_t v32 = v14;
    if (v6) {
      dispatch_queue_t v15 = @", final ASR results";
    }
    else {
      dispatch_queue_t v15 = &stru_270C008E8;
    }
    __int16 v33 = 2114;
    id v34 = v15;
    _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Computing new LID result, with %zu acoustic results%{public}@%{public}@", buf, 0x20u);
  }
  featureCombinationModel = self->_featureCombinationModel;
  context = self->_context;
  __int16 v18 = self->_acousticResults;
  partialSpeechResultConfidences = self->_partialSpeechResultConfidences;
  finalSpeechResults = self->_finalSpeechResults;
  modelVersions = self->_modelVersions;
  BOOL useFinalThresholds = self->_useFinalThresholds;
  LOBYTE(v28) = [(_LTLanguageDetector *)self isLowConfidencePair];
  v23 = [(_LTLanguageDetectorFeatureCombinationModel *)featureCombinationModel estimateLanguage:context languageDetectionResults:v18 partialSpeechResultConfidences:partialSpeechResultConfidences finalSpeechResults:finalSpeechResults modelVersions:modelVersions useFinalThresholds:useFinalThresholds isLowConfidencePair:v28];
  v24 = self->_lastResult;
  self->_lastResult = v23;

  v25 = self->_lastResult;
  if (v25)
  {
    if (self->_havePartialASRConfidences)
    {
      int v26 = [(_LTLanguageDetectionResult *)v25 isConfident];
      if ([(NSMutableArray *)self->_acousticResults count] >= self->_maximumAcousticLanguageDetectorResults) {
        int v27 = 1;
      }
      else {
        int v27 = v26;
      }
      if (((v6 | v27) & 1) == 0 && !v3) {
        return;
      }
      v25 = self->_lastResult;
    }
    else if (!v6)
    {
      return;
    }
    [(_LTLanguageDetectionResult *)v25 setIsFinal:1];
    [(_LTLanguageDetector *)self sendLIDResult:self->_lastResult];
    [(_LTLanguageDetector *)self endAudio];
  }
}

- (void)addSpeechRecognitionResult:(id)a3
{
  id v4 = a3;
  if ([(_LTTranslationContext *)self->_context autodetectLanguage])
  {
    objc_initWeak(&location, self);
    resultQueue = self->_resultQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke;
    block[3] = &unk_265545C70;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(resultQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)addSpeechAudioData:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && [(_LTTranslationContext *)self->_context autodetectLanguage])
  {
    if (self->_finalLIDResultSent)
    {
      id v5 = _LTOSLogLID();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[_LTLanguageDetector addSpeechAudioData:]();
      }
    }
    else
    {
      unint64_t v6 = (unint64_t)[v4 length] / self->_audioBitDepth;
      id v7 = _LTOSLogLID();
      if (os_signpost_enabled(v7))
      {
        int v8 = 134217984;
        unint64_t v9 = v6;
        _os_signpost_emit_with_name_impl(&dword_2600DC000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LID Audio Data", "NumSamples: %ld", (uint8_t *)&v8, 0xCu);
      }

      [(CSLanguageDetector *)self->_csLanguageDetector addSamples:v4 numSamples:v6];
    }
  }
}

- (void)endAudio
{
  if (!self->_endAudioCalled)
  {
    if ([(_LTTranslationContext *)self->_context autodetectLanguage]) {
      [(CSLanguageDetector *)self->_csLanguageDetector endAudio];
    }
    objc_initWeak(&location, self);
    resultQueue = self->_resultQueue;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __31___LTLanguageDetector_endAudio__block_invoke;
    v4[3] = &unk_265545E20;
    objc_copyWeak(&v5, &location);
    dispatch_async(resultQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)cancelLanguageDetection
{
}

- (BOOL)forceLanguageDetectionResult
{
  v2 = self;
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  resultQueue = v2->_resultQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke;
  v5[3] = &unk_265546AF8;
  objc_copyWeak(&v6, &location);
  v5[4] = v2;
  v5[5] = &v8;
  dispatch_sync(resultQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

- (BOOL)isLowConfidencePair
{
  if (_LTPreferencesDebugForceLowConfidenceLID()) {
    return 1;
  }
  lowConfidenceLanguagePairs = self->_lowConfidenceLanguagePairs;
  id v5 = [(_LTTranslationContext *)self->_context localePair];
  id v6 = [v5 canonicalLocalePair];
  LOBYTE(lowConfidenceLanguagePairs) = [(NSSet *)lowConfidenceLanguagePairs containsObject:v6];

  return (char)lowConfidenceLanguagePairs;
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(id)a3 confidence:(id)a4 isConfident:(BOOL)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v7 = a4;
  uint64_t v8 = _LTOSLogLID();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v7;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CS-LID Result", "confidence: %@", buf, 0xCu);
  }

  unint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v10 = [(_LTTranslationContext *)self->_context localePair];
  char v11 = [v10 sourceLocale];
  BOOL v12 = [v11 _ltCsLocaleIdentifier];
  uint64_t v13 = [v7 objectForKeyedSubscript:v12];

  if (!v13) {
    goto LABEL_9;
  }
  int v14 = [(_LTTranslationContext *)self->_context localePair];
  dispatch_queue_t v15 = [v14 sourceLocale];
  [v9 setObject:v13 forKeyedSubscript:v15];

  [v13 floatValue];
  if (v16 < self->_sourceLocaleConfidenceThreshold || ([v13 floatValue], v17 == 0.5))
  {
LABEL_9:
    int v19 = 0;
    int v21 = 0;
  }
  else
  {
    __int16 v18 = [(_LTTranslationContext *)self->_context localePair];
    int v19 = [v18 sourceLocale];

    uint64_t v20 = _LTOSLogLID();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_LTLanguageDetector languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:](v20, v13);
    }
    int v21 = 1;
  }
  v22 = [(_LTTranslationContext *)self->_context localePair];
  v23 = [v22 targetLocale];
  v24 = [v23 _ltCsLocaleIdentifier];
  v25 = [v7 objectForKeyedSubscript:v24];

  if (!v25) {
    goto LABEL_15;
  }
  int v26 = [(_LTTranslationContext *)self->_context localePair];
  int v27 = [v26 targetLocale];
  [v9 setObject:v25 forKeyedSubscript:v27];

  [v25 floatValue];
  if (v28 < self->_targetLocaleConfidenceThreshold || ([v25 floatValue], v29 == 0.5))
  {
LABEL_15:
    if (!v21) {
      goto LABEL_18;
    }
    uint64_t v31 = (uint64_t)v19;
  }
  else
  {
    uint64_t v30 = [(_LTTranslationContext *)self->_context localePair];
    uint64_t v31 = [v30 targetLocale];

    uint64_t v32 = _LTOSLogLID();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      -[_LTLanguageDetector languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:](v32, v25);
    }
  }
  int v21 = ![(_LTLanguageDetector *)self isLowConfidencePair];
  int v19 = (void *)v31;
LABEL_18:
  __int16 v33 = _LTOSLogLID();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    objc_super v40 = v33;
    v41 = [v19 localeIdentifier];
    *(_DWORD *)buf = 138543874;
    id v50 = v41;
    __int16 v51 = 1024;
    int v52 = v21;
    __int16 v53 = 2114;
    id v54 = v7;
    _os_log_debug_impl(&dword_2600DC000, v40, OS_LOG_TYPE_DEBUG, "Acoustic LID detected %{public}@ (confident: %{BOOL}i): %{public}@", buf, 0x1Cu);
  }
  objc_initWeak((id *)buf, self);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke;
  block[3] = &unk_265546B20;
  objc_copyWeak(&v47, (id *)buf);
  id v35 = v9;
  id v45 = v35;
  char v48 = v21;
  id v36 = v19;
  id v46 = v36;
  dispatch_async(resultQueue, block);
  v37 = _LTOSLogLID();
  v38 = v37;
  os_signpost_id_t lidSignpostID = self->_lidSignpostID;
  if (lidSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)v43 = 0;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v38, OS_SIGNPOST_INTERVAL_BEGIN, lidSignpostID, "LID", "End", v43, 2u);
  }

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);
}

- (NSMutableArray)acousticResults
{
  return self->_acousticResults;
}

- (void)setAcousticResults:(id)a3
{
}

- (_LTLanguageDetectionResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
}

- (BOOL)featureCombinationModelSupported
{
  return self->_featureCombinationModelSupported;
}

- (void)setFeatureCombinationModelSupported:(BOOL)a3
{
  self->_featureCombinationModelSupported = a3;
}

- (_LTLanguageDetectorFeatureCombinationModel)featureCombinationModel
{
  return self->_featureCombinationModel;
}

- (void)setFeatureCombinationModel:(id)a3
{
}

- (double)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(double)a3
{
  self->_double samplingRate = a3;
}

- (int64_t)audioBitDepth
{
  return self->_audioBitDepth;
}

- (void)setAudioBitDepth:(int64_t)a3
{
  self->_audioBitDepth = a3;
}

- (_LTDSELFLoggingManager)selfLoggingManager
{
  return self->_selfLoggingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_featureCombinationModel, 0);
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_acousticResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_finalResultWaitQueue, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_lowConfidenceLanguagePairs, 0);
  objc_storeStrong((id *)&self->_modelVersions, 0);
  objc_storeStrong((id *)&self->_finalSpeechResults, 0);
  objc_storeStrong((id *)&self->_partialSpeechResultConfidences, 0);
  objc_storeStrong((id *)&self->_csLanguageDetector, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithSelfLoggingManager:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2600DC000, v0, OS_LOG_TYPE_ERROR, "Failed to obtain LID asset", v1, 2u);
}

- (void)startLanguageDetectionWithContext:delegate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2600DC000, v0, OS_LOG_TYPE_ERROR, "Invalid source and target confidence threshold configuration", v1, 2u);
}

- (void)addSpeechAudioData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Already sent final LID result, ignoring additional audio data", v2, v3, v4, v5, v6);
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(void *)a1 confidence:(void *)a2 isConfident:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 floatValue];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_2600DC000, v4, v5, "Confident in target language (%lf) with threshold %lf", v6, v7, v8, v9, v10);
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(void *)a1 confidence:(void *)a2 isConfident:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 floatValue];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_2600DC000, v4, v5, "Confident in source language (%lf) with threshold %lf", v6, v7, v8, v9, v10);
}

@end