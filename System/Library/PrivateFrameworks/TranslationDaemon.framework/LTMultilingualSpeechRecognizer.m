@interface LTMultilingualSpeechRecognizer
@end

@implementation LTMultilingualSpeechRecognizer

void __67___LTMultilingualSpeechRecognizer_initWithModelURLs_modelVersions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [_LTSpeechRecognizer alloc];
  v8 = [*(id *)(a1 + 32) objectForKey:v6];
  v9 = [(_LTSpeechRecognizer *)v7 initWithModelURL:v5 language:v6 modelVersion:v8];

  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v6];
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = _LTOSLogSpeech();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_3((uint64_t)v6, v8);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), a3);
    v9 = *(id *)(a1 + 32);
    v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 104);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v12;
      __int16 v46 = 2112;
      id v47 = v6;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v10, OS_SIGNPOST_INTERVAL_END, v11, "ASR", "Failed ASR (%{public}@) with error: %@", buf, 0x16u);
    }

    if (v5)
    {
      v13 = *(NSObject **)(a1 + 48);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_4;
      block[3] = &unk_265547180;
      id v42 = *(id *)(a1 + 80);
      id v41 = v5;
      dispatch_async(v13, block);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_2(v8, v5);
    }
    v14 = *(NSObject **)(a1 + 48);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_6;
    v37[3] = &unk_265547180;
    id v39 = *(id *)(a1 + 80);
    id v15 = v5;
    id v38 = v15;
    dispatch_async(v14, v37);
    if ([v15 isFinal])
    {
      v31 = 0;
      v16 = _LTOSLogSpeech();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_1();
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = *(id *)(a1 + 64);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v34 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v23 = objc_msgSend(v22, "language", v31);
            v24 = [*(id *)(a1 + 72) language];
            char v25 = [v23 isEqual:v24];

            if ((v25 & 1) == 0) {
              [v22 triggerServerSideEndPointer];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
        }
        while (v19);
      }

      v26 = *(NSObject **)(a1 + 48);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_7;
      v32[3] = &unk_2655461D0;
      v32[4] = *(void *)(a1 + 96);
      dispatch_async(v26, v32);
      v27 = *(id *)(a1 + 32);
      v28 = v27;
      os_signpost_id_t v29 = *(void *)(a1 + 104);
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        uint64_t v30 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v30;
        _os_signpost_emit_with_name_impl(&dword_2600DC000, v28, OS_SIGNPOST_INTERVAL_END, v29, "ASR", "Completed ASR for %@", buf, 0xCu);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      id v6 = v31;
    }
  }
}

uint64_t __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_7(uint64_t result)
{
  return result;
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9(void *a1)
{
  v2 = _LTOSLogSpeech();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9_cold_1();
  }
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    if (*(uint64_t *)(*(void *)(a1[6] + 8) + 24) <= 0) {
      (*(void (**)(void))(a1[4] + 16))();
    }
  }
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Recognizer finished", v2, v3, v4, v5, v6);
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 locale];
  uint64_t v5 = [v4 _ltLocaleIdentifier];
  uint8_t v6 = [a2 bestTranscription];
  v7 = [v6 formattedString];
  int v8 = 138543619;
  v9 = v5;
  __int16 v10 = 2117;
  os_signpost_id_t v11 = v7;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "ASR result (%{public}@): %{sensitive}@", (uint8_t *)&v8, 0x16u);
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Recognition error: %@", (uint8_t *)&v2, 0xCu);
}

void __88___LTMultilingualSpeechRecognizer_startRecognitionForLocale_autoEndpoint_resultHandler___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "All recognizers finished", v2, v3, v4, v5, v6);
}

@end