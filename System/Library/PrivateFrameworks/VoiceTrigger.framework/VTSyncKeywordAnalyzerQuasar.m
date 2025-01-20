@interface VTSyncKeywordAnalyzerQuasar
+ (id)_phToPhIdMapFromTriggerTokensArray:(id)a3;
+ (void)dumpEARSpeechRecognitionResults:(id)a3;
- (VTSyncKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokensArray:(id)a4 preventDuplicatedReset:(BOOL)a5 memoryLock:(BOOL)a6;
- (id)_getAnalyzedResults:(id)a3;
- (id)getAnalyzedResultsFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4;
- (id)getAnalyzedResultsFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4;
- (id)getResultsFromFlushedAudio;
- (void)flushAudio;
- (void)reset;
@end

@implementation VTSyncKeywordAnalyzerQuasar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phToPhIdMap, 0);

  objc_storeStrong((id *)&self->_syncRecognizer, 0);
}

- (id)_getAnalyzedResults:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v31 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  if (self->_numPhrases)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [[VTSyncKeywordAnalyzerQuasarResult alloc] initWithConfidence:-1000.0];
      [v4 addObject:v6];

      ++v5;
    }
    while (v5 < self->_numPhrases);
  }
  v32 = self;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v31;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v33 + 1) + 8 * v10) tokens];
        v12 = [v11 lastObject];

        if (!v12
          || ([v12 tokenName],
              v13 = objc_claimAutoreleasedReturnValue(),
              BOOL v14 = v13 == 0,
              v13,
              v14))
        {
          v28 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            unint64_t v38 = (unint64_t)v12;
            _os_log_error_impl(&dword_21844F000, v28, OS_LOG_TYPE_ERROR, "Invalid token : %{public}@", buf, 0xCu);
          }
        }
        else
        {
          phToPhIdMap = v32->_phToPhIdMap;
          v16 = [v12 tokenName];
          v17 = [(NSDictionary *)phToPhIdMap objectForKeyedSubscript:v16];
          unint64_t v18 = [v17 unsignedIntegerValue];

          v19 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            unint64_t v38 = v18;
            __int16 v39 = 2114;
            v40 = v12;
            _os_log_impl(&dword_21844F000, v19, OS_LOG_TYPE_DEFAULT, "%tu, token = %{public}@", buf, 0x16u);
          }
          if (v18 >= [v4 count])
          {
            v29 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v38) = v18;
              _os_log_error_impl(&dword_21844F000, v29, OS_LOG_TYPE_ERROR, "Unable to handle: %d", buf, 8u);
            }
          }
          else
          {
            v20 = [v4 objectAtIndex:v18];
            [v20 triggerConfidence];
            double v22 = v21;

            [v12 confidence];
            double v24 = v23;
            v25 = [v4 objectAtIndexedSubscript:v18];
            v26 = v25;
            if (v24 >= v22) {
              double v27 = v24;
            }
            else {
              double v27 = v22;
            }
            [v25 setTriggerConfidence:v27];
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)getAnalyzedResultsFromInt16AudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  self->_requireReset = 1;
  id v7 = [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resultsWithAddedAudio:v6 numberOfSamples:a4 taskName:&stru_26C99F218];
  uint64_t v8 = [(VTSyncKeywordAnalyzerQuasar *)self _getAnalyzedResults:v7];

  return v8;
}

- (id)getAnalyzedResultsFromFloatAudioBuffer:(id)a3 numSamples:(unint64_t)a4
{
  id v6 = a3;
  self->_requireReset = 1;
  id v7 = [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resultsWithAddedFloatAudio:v6 numberOfSamples:a4 taskName:&stru_26C99F218];
  uint64_t v8 = [(VTSyncKeywordAnalyzerQuasar *)self _getAnalyzedResults:v7];

  return v8;
}

- (id)getResultsFromFlushedAudio
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  v4 = [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resultsWithEndedAudio];
  unint64_t v5 = [(VTSyncKeywordAnalyzerQuasar *)self _getAnalyzedResults:v4];

  return v5;
}

- (void)flushAudio
{
  id v2 = [(VTSyncKeywordAnalyzerQuasar *)self getResultsFromFlushedAudio];
}

- (void)reset
{
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }
  if (self->_requireReset)
  {
    LODWORD(v5) = 120;
    LOBYTE(v4) = 0;
    [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resetWithSamplingRate:16000 language:&stru_26C99F218 taskType:@"Dictation" userId:&stru_26C99F218 sessionId:&stru_26C99F218 deviceId:&stru_26C99F218 farField:v4 audioSource:&stru_26C99F218 maxAudioBufferSizeSeconds:v5];
    if (self->_preventDuplicatedReset) {
      self->_requireReset = 0;
    }
  }
}

- (VTSyncKeywordAnalyzerQuasar)initWithConfigPath:(id)a3 triggerTokensArray:(id)a4 preventDuplicatedReset:(BOOL)a5 memoryLock:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v10 = COERCE_DOUBLE(a3);
  id v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)VTSyncKeywordAnalyzerQuasar;
  v12 = [(VTSyncKeywordAnalyzerQuasar *)&v27 init];
  if (v12)
  {
    uint64_t v13 = +[VTSyncKeywordAnalyzerQuasar _phToPhIdMapFromTriggerTokensArray:v11];
    phToPhIdMap = v12->_phToPhIdMap;
    v12->_phToPhIdMap = (NSDictionary *)v13;

    v12->_numPhrases = [v11 count];
    v12->_preventDuplicatedReset = a5;
    v15 = [MEMORY[0x263F08AB0] processInfo];
    [v15 systemUptime];
    double v17 = v16;

    unint64_t v18 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v29 = v10;
      _os_log_impl(&dword_21844F000, v18, OS_LOG_TYPE_DEFAULT, "Initializing Quasar with config: %{public}@", buf, 0xCu);
    }
    uint64_t v19 = [objc_alloc(MEMORY[0x263F3B420]) initWithConfiguration:*(void *)&v10 memoryLock:v6];
    syncRecognizer = v12->_syncRecognizer;
    v12->_syncRecognizer = (_EARSyncSpeechRecognizer *)v19;

    double v21 = [MEMORY[0x263F08AB0] processInfo];
    [v21 systemUptime];
    double v23 = v22;

    v12->_requireReset = 1;
    double v24 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v29 = (v23 - v17) * 1000.0;
      _os_log_impl(&dword_21844F000, v24, OS_LOG_TYPE_DEFAULT, "Speech model loading took %{public}.3fms", buf, 0xCu);
    }
  }
  v25 = v12;

  return v25;
}

+ (void)dumpEARSpeechRecognitionResults:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v24;
    *(void *)&long long v4 = 134217984;
    long long v14 = v4;
    do
    {
      uint64_t v5 = 0;
      uint64_t v18 = v3;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v23 + 1) + 8 * v5);
        id v7 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v14;
          uint64_t v29 = v16;
          _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "Res-%lu: ", buf, 0xCu);
          ++v16;
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v8 = objc_msgSend(v6, "tokens", v14);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v8);
              }
              v12 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
                *(_DWORD *)buf = 138412290;
                uint64_t v29 = v13;
                _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "tok=%@", buf, 0xCu);
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v18);
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
}

+ (id)_phToPhIdMapFromTriggerTokensArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v4 = [MEMORY[0x263EFF9A0] dictionary];
  for (unint64_t i = 0; i < [v3 count]; ++i)
  {
    BOOL v6 = [v3 objectAtIndexedSubscript:i];
    id v7 = [v6 componentsSeparatedByString:@"_"];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * j);
          uint64_t v13 = [NSNumber numberWithUnsignedInteger:i];
          [v4 setObject:v13 forKey:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }

  return v4;
}

@end