@interface LTLanguageDetector
@end

@implementation LTLanguageDetector

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 50))
    {
      v5 = _LTOSLogLID();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_4();
      }
    }
    else
    {
      v6 = (void *)WeakRetained[9];
      v8 = *(void **)(a1 + 32);
      v7 = (id *)(a1 + 32);
      v9 = [v8 locale];
      v10 = [v6 objectForKeyedSubscript:v9];

      uint64_t v11 = [*v7 modelVersion];
      if (v11)
      {
        v12 = (void *)v11;
        v13 = [*v7 modelVersion];

        if (v10 != v13)
        {
          v14 = _LTOSLogLID();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_3(v7, v14);
          }
          v15 = [*v7 modelVersion];
          v16 = (void *)[v15 copy];
          v17 = (void *)*((void *)v4 + 9);
          v18 = [*v7 locale];
          [v17 setObject:v16 forKeyedSubscript:v18];

          id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
          v20 = (void *)*((void *)v4 + 7);
          v21 = [*v7 locale];
          [v20 setObject:v19 forKeyedSubscript:v21];
        }
      }
      if ([*v7 isFinal])
      {
        id v22 = *v7;
        v23 = (void *)*((void *)v4 + 8);
        v24 = [v22 locale];
        [v23 setObject:v22 forKeyedSubscript:v24];

        v25 = _LTOSLogLID();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_1();
        }
        [v4 endAudio];
        if (_LTPreferencesFinalThresholdsLanguageDetectionResultWaitTime())
        {
          if (!*((unsigned char *)v4 + 49))
          {
            unint64_t v26 = _LTPreferencesFinalThresholdsLanguageDetectionResultWaitTime();
            if (v26 < _LTPreferencesFinalLanguageDetectionResultWaitTime())
            {
              v27 = *((void *)v4 + 13);
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_21;
              block[3] = &unk_265545E20;
              objc_copyWeak(&v46, v2);
              dispatch_async(v27, block);
              objc_destroyWeak(&v46);
            }
          }
        }
        else
        {
          *((unsigned char *)v4 + 49) = 1;
        }
        BOOL v38 = _LTPreferencesFinalLanguageDetectionResultWaitTime() == 0;
        if (([v4 haveFinalASRResults] & 1) == 0 && _LTPreferencesFinalLanguageDetectionResultWaitTime())
        {
          v39 = *((void *)v4 + 13);
          uint64_t v40 = MEMORY[0x263EF8330];
          uint64_t v41 = 3221225472;
          v42 = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_23;
          v43 = &unk_265545E20;
          objc_copyWeak(&v44, v2);
          dispatch_async(v39, &v40);
          objc_destroyWeak(&v44);
        }
      }
      else
      {
        v28 = (void *)*((void *)v4 + 7);
        *((unsigned char *)v4 + 51) = 1;
        v29 = [*v7 locale];
        v30 = [v28 objectForKeyedSubscript:v29];
        v31 = NSNumber;
        v32 = [*v7 bestTranscription];
        [v32 confidence];
        v33 = objc_msgSend(v31, "numberWithDouble:");
        [v30 addObject:v33];

        v34 = _LTOSLogLID();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_2(v7, v34, (void **)v4 + 7);
        }
        v35 = [*v7 bestTranscription];
        [v35 confidence];
        double v37 = v36;

        BOOL v38 = 0;
        if (v37 > 0.0) {
          *((unsigned char *)v4 + 52) = 1;
        }
      }
      objc_msgSend(v4, "sendFinalLanguageDetectionResult:", v38, v40, v41, v42, v43);
    }
  }
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_21(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = _LTPreferencesFinalThresholdsLanguageDetectionResultWaitTime();
    dispatch_time_t v4 = dispatch_time(0, 1000000 * v3);
    v5 = WeakRetained[12];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2;
    block[3] = &unk_265545E20;
    objc_copyWeak(&v7, v1);
    dispatch_after(v4, v5, block);
    objc_destroyWeak(&v7);
  }
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogLID();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_cold_1();
    }
    WeakRetained[49] = 1;
    [WeakRetained sendFinalLanguageDetectionResult:0];
  }
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_23(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = _LTPreferencesFinalLanguageDetectionResultWaitTime();
    dispatch_time_t v4 = dispatch_time(0, 1000000 * v3);
    v5 = WeakRetained[12];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_24;
    block[3] = &unk_265545E20;
    objc_copyWeak(&v7, v1);
    dispatch_after(v4, v5, block);
    objc_destroyWeak(&v7);
  }
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogLID();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_24_cold_1();
    }
    [WeakRetained sendFinalLanguageDetectionResult:1];
  }
}

void __31___LTLanguageDetector_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 48) = 1;
    uint64_t v3 = _LTOSLogLID();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __31___LTLanguageDetector_endAudio__block_invoke_cold_1();
    }
    [v2 sendFinalLanguageDetectionResult:0];
  }
}

void __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 50)) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = WeakRetained[17] || [WeakRetained[8] count] == 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v5 = v3[17];
      if (v5)
      {
        [v5 setIsFinal:1];
        v6 = _LTOSLogLID();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_2();
        }
      }
      else
      {
        id v7 = [v3[8] objectEnumerator];
        v8 = [v7 nextObject];
        v9 = [v8 locale];

        v10 = _LTOSLogLID();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_1(v10, v9);
        }
        id v11 = objc_alloc(MEMORY[0x263F1C0D0]);
        v15 = v9;
        v16[0] = &unk_270C33818;
        v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        uint64_t v13 = objc_msgSend(v11, "initWithConfidences:isConfident:dominantLanguage:isFinal:", v12, objc_msgSend(v3, "isLowConfidencePair") ^ 1, v9, 1);
        id v14 = v3[17];
        v3[17] = (id)v13;
      }
      [v3 sendLIDResult:*(void *)(*(void *)(a1 + 32) + 136)];
    }
  }
}

void __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[16];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F1C0D0]) initWithConfidences:*(void *)(a1 + 32) isConfident:*(unsigned __int8 *)(a1 + 56) dominantLanguage:*(void *)(a1 + 40) isFinal:0];
    [v4 addObject:v5];

    v6 = _LTOSLogLID();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke_cold_1();
    }
    [v3 sendFinalLanguageDetectionResult:0];
    if (*((unsigned char *)v3 + 51) && !*((unsigned char *)v3 + 52))
    {
      id v7 = [v3[16] lastObject];
      [v3 sendLIDResult:v7];
    }
  }
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Calling endAudio from addSpeechRecognitionResult", v2, v3, v4, v5, v6);
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_2(id *a1, void *a2, void **a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = *a1;
  uint8_t v6 = a2;
  id v7 = [v5 locale];
  v8 = [v7 localeIdentifier];
  v9 = [*a1 bestTranscription];
  [v9 confidence];
  uint64_t v11 = v10;
  v12 = *a3;
  uint64_t v13 = [*a1 locale];
  id v14 = [v12 objectForKeyedSubscript:v13];
  int v15 = 138543874;
  v16 = v8;
  __int16 v17 = 2048;
  uint64_t v18 = v11;
  __int16 v19 = 2048;
  uint64_t v20 = [v14 count];
  _os_log_debug_impl(&dword_2600DC000, v6, OS_LOG_TYPE_DEBUG, "Added %{public}@ partial-confidence: %f; new array length: %zu",
    (uint8_t *)&v15,
    0x20u);
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_3(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 locale];
  id v5 = [v4 localeIdentifier];
  OUTLINED_FUNCTION_4(&dword_2600DC000, v6, v7, "Change in model-version triggers deletion of cached %{public}@ partial-confidences", v8, v9, v10, v11, 2u);
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Already sent final LID result, ignoring additional speech result", v2, v3, v4, v5, v6);
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Initiate use of final thresholds to reduce dialog rates, as timer ended after 1st final ASR", v2, v3, v4, v5, v6);
}

void __50___LTLanguageDetector_addSpeechRecognitionResult___block_invoke_2_24_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Try to force final LID, as timer ended after 1st final ASR", v2, v3, v4, v5, v6);
}

void __31___LTLanguageDetector_endAudio__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Trying to send final LID result from endAudio", v2, v3, v4, v5, v6);
}

void __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 _ltLocaleIdentifier];
  OUTLINED_FUNCTION_4(&dword_2600DC000, v5, v6, "Forcing language detection result to be %{public}@", v7, v8, v9, v10, 2u);
}

void __51___LTLanguageDetector_forceLanguageDetectionResult__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Forcing current language detection result to be final", v2, v3, v4, v5, v6);
}

void __94___LTLanguageDetector_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Trying to send final LID result from acousticLID CoreSpeech delegate", v2, v3, v4, v5, v6);
}

@end