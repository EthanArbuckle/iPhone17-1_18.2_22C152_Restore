@interface LTOspreySpeechTranslationSession
@end

@implementation LTOspreySpeechTranslationSession

id __55___LTOspreySpeechTranslationSession_sendAnalyticsEvent__block_invoke(uint64_t a1)
{
  v15[10] = *MEMORY[0x263EF8340];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v14[0] = @"sentAudio";
    v13 = [NSNumber numberWithBool:WeakRetained[24]];
    v15[0] = v13;
    v14[1] = @"sentEndAudio";
    v12 = [NSNumber numberWithBool:WeakRetained[25]];
    v15[1] = v12;
    v14[2] = @"endpointedSpeech";
    v2 = [NSNumber numberWithBool:WeakRetained[26]];
    v15[2] = v2;
    v14[3] = @"didReceiveAudioLimitExceededResponse";
    v3 = [NSNumber numberWithBool:WeakRetained[27]];
    v15[3] = v3;
    v14[4] = @"didReceivePartialRecognitionResponse";
    v4 = [NSNumber numberWithBool:WeakRetained[28]];
    v15[4] = v4;
    v14[5] = @"didReceiveFinalRecognitionResponse";
    v5 = [NSNumber numberWithBool:WeakRetained[29]];
    v15[5] = v5;
    v14[6] = @"didReceiveTranslationResponse";
    v6 = [NSNumber numberWithBool:WeakRetained[30]];
    v15[6] = v6;
    v14[7] = @"didReceiveTTSResponse";
    v7 = [NSNumber numberWithBool:WeakRetained[31]];
    v15[7] = v7;
    v14[8] = @"didReceiveFinalBlazarResponse";
    v8 = [NSNumber numberWithBool:WeakRetained[32]];
    v15[8] = v8;
    v14[9] = @"didTimeout";
    v9 = [NSNumber numberWithBool:WeakRetained[33]];
    v15[9] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:10];
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA78];
  }

  return v10;
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) uniqueID];
  [v3 setClientTraceIdentifier:v4];

  v5 = [*(id *)(a1 + 32) sequoiaClientHeaderValue];

  if (v5)
  {
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = [v7 sequoiaClientHeaderValue];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Using client header value: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v10 = [*(id *)(a1 + 32) sequoiaClientHeaderValue];
    [v3 setValue:v10 forHTTPHeaderField:@"x-sequoia-client"];
  }
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Streaming connection finished successfully", v15, 2u);
  }
  [*(id *)(a1 + 32) sendAnalyticsEvent];
  v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
  _LTSendErrorEvent(v3, v6);

  [*(id *)(a1 + 32) translationDidFinishWithError:v3];
  v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v7);
  char v9 = [WeakRetained isCancelled];

  if ((v9 & 1) == 0)
  {
    id v10 = objc_loadWeakRetained(v7);
    int v11 = [v10 completionBlock];

    if (v11)
    {
      id v12 = objc_loadWeakRetained(v7);
      uint64_t v13 = [v12 completionBlock];
      ((void (**)(void, id))v13)[2](v13, v3);
    }
    else
    {
      v14 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50_cold_1();
      }
    }
  }
}

void __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) uniqueID];
  [v6 setClientTraceIdentifier:v3];

  v4 = [*(id *)(a1 + 32) sequoiaClientHeaderValue];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) sequoiaClientHeaderValue];
    [v6 setValue:v5 forHTTPHeaderField:@"x-sequoia-client"];
  }
}

void __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Streaming text translation session finished successfully", v14, 2u);
  }
  [*(id *)(a1 + 32) translationDidFinishWithError:v3];
  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v6);
  char v8 = [WeakRetained isCancelled];

  if ((v8 & 1) == 0)
  {
    id v9 = objc_loadWeakRetained(v6);
    id v10 = [v9 completionBlock];

    if (v10)
    {
      id v11 = objc_loadWeakRetained(v6);
      id v12 = [v11 completionBlock];
      ((void (**)(void, id))v12)[2](v12, v3);
    }
    else
    {
      uint64_t v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50_cold_1();
      }
    }
  }
}

void __57___LTOspreySpeechTranslationSession_updateServerTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    dispatch_source_cancel(WeakRetained[14]);
    dispatch_source_t v2 = v3[14];
    v3[14] = 0;

    [(dispatch_source_t *)v3 serverTimeoutFired];
    id WeakRetained = v3;
  }
}

FTMutableAudioFrame *__73___LTOspreySpeechTranslationSession_didCompressPackets_totalPacketCount___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(FTMutableAudioFrame);
  [(FTMutableAudioFrame *)v3 setAudio_bytes:v2];

  return v3;
}

id __69___LTOspreySpeechTranslationSession__handleFinalRecognitionResponse___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  v4 = [v3 formattedString];
  [v3 confidence];
  uint64_t v6 = v5;
  unsigned int v7 = [v3 isLowConfidence];

  char v8 = [v2 stringWithFormat:@"%@: %f : %d", v4, v6, v7];

  return v8;
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50_cold_1()
{
  OUTLINED_FUNCTION_1_0();
}

void __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_50_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Streaming connection finished with error: %@", v2, v3, v4, v5, v6);
}

void __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Streaming text translation session finished with error: %@", v2, v3, v4, v5, v6);
}

@end