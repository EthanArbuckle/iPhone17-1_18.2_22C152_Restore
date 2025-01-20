@interface LTOnlineTranslationEngine
@end

@implementation LTOnlineTranslationEngine

void __53___LTOnlineTranslationEngine_startServerTimeoutTimer__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[9])
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    v4 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v3;

    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "startServerTimeoutTimer", v8, 2u);
    }
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v2 + 8));
    v7 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v6;

    [v2 updateServerTimeout];
    dispatch_resume(*((dispatch_object_t *)v2 + 9));
  }
}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((void *)WeakRetained + 9);
    if (v4)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_2;
      handler[3] = &unk_2655477F0;
      objc_copyWeak(&v10, v1);
      dispatch_source_set_event_handler(v4, handler);
      double v5 = _LTPreferencesBatchingMaxParagraphBufferTimeout();
      dispatch_source_t v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_cold_1(v6, v5);
      }
      v7 = v3[9];
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_destroyWeak(&v10);
    }
  }
}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained cancelServerTimeout];
    v4 = v3[5];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_3;
    block[3] = &unk_2655477F0;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained serverTimeoutFired];
  }
}

void __49___LTOnlineTranslationEngine_cancelServerTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained[9];
    if (v2)
    {
      v4 = WeakRetained;
      if (dispatch_source_testcancel(v2))
      {
        uint64_t v3 = v4;
      }
      else
      {
        dispatch_source_cancel(v2);
        uint64_t v3 = v4;
        id v2 = v4[9];
      }
      v3[9] = 0;

      id WeakRetained = v4;
    }
  }
}

void __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "speech_id");
  [v4 setClientTraceIdentifier:v3];
}

void __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = objc_msgSend(v5, "error_code");
      v9 = objc_msgSend(v5, "error_str");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v9;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "TTS response (%d): %@", buf, 0x12u);
    }
    if (_LTRemoteStatusIsSuccess(objc_msgSend(v5, "error_code")))
    {
      uint64_t v30 = 0;
      memset(buf, 0, sizeof(buf));
      id v10 = objc_msgSend(v5, "decoder_description");
      v11 = v10;
      if (v10)
      {
        [v10 audioStreamBasicDescription];
      }
      else
      {
        uint64_t v30 = 0;
        memset(buf, 0, sizeof(buf));
      }

      v22 = (void *)MEMORY[0x263F1C1C8];
      v23 = objc_msgSend(v5, "word_timing_info");
      v24 = [v22 wordTimingInfoFromArray:v23 text:*(void *)(a1 + 32)];

      v25 = [_LTAudioData alloc];
      v26 = objc_msgSend(v5, "audio", *(void *)buf, *(void *)&buf[8], *(_OWORD *)&buf[16], v30);
      v27 = [(_LTAudioData *)v25 initWithASBD:&v28 rawData:v26 wordTimingInfo:v24];

      [*(id *)(a1 + 40) cacheAudioData:v27 forKey:*(void *)(a1 + 48)];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      unsigned int v12 = objc_msgSend(v5, "error_code");
      v13 = objc_msgSend(v5, "error_str");
      v14 = _LTErrorFromRemoteFailure(v12, v13);

      v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2_cold_1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

FTMutableSpan *__107___LTOnlineTranslationEngine__createOrUpdateBatchTranslationRequestWithParagraph_index_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(FTMutableSpan);
  id v5 = [*(id *)(a1 + 32) text];
  uint64_t v6 = [v3 range];
  uint64_t v8 = objc_msgSend(v5, "lt_codePointsRangeFromCodeUnitsRange:", v6, v7);
  int v10 = v9;

  [(FTMutableSpan *)v4 setStart_index:v8];
  [(FTMutableSpan *)v4 setEnd_index:(v8 + v10 - 1)];
  -[FTMutableSpan setDo_not_translate:](v4, "setDo_not_translate:", [v3 shouldTranslate] ^ 1);
  v11 = [v3 metaInfoData];

  if (v11)
  {
    id v12 = [NSString alloc];
    v13 = [v3 metaInfoData];
    v14 = (void *)[v12 initWithData:v13 encoding:4];
    [(FTMutableSpan *)v4 setMeta_info:v14];
  }
  return v4;
}

void __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "request_id");
  [v6 setClientTraceIdentifier:v3];

  id v4 = [*(id *)(a1 + 40) clientHeader];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) clientHeader];
    [v6 setValue:v5 forHTTPHeaderField:@"x-sequoia-client"];
  }
}

void __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3;
  block[3] = &unk_265547C08;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 72);
  id v11 = v5;
  uint64_t v16 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = v3;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 80);
  id v14 = v7;
  uint64_t v17 = v8;
  id v15 = *(id *)(a1 + 64);
  id v9 = v3;
  dispatch_async(v4, block);
}

uint64_t __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    id v5 = objc_msgSend(*(id *)(a1 + 40), "request_id");
    uint64_t v6 = *(void *)(a1 + 48);
    int v9 = 138543618;
    int v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v3, OS_SIGNPOST_INTERVAL_END, v4, "TranslateParagraph", "Online: Finished translating paragraph: %{public}@ error %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 56) responseReceived:*(void *)(a1 + 80)];
  if (*(void *)(a1 + 48))
  {
    id v7 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "request_id");
      objc_claimAutoreleasedReturnValue();
      __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3_cold_1();
    }
  }
  [*(id *)(a1 + 64) setCompletionHandlerCalled:1];
  return [*(id *)(a1 + 64) callCompletionHandlersWithError:*(void *)(a1 + 48)];
}

void __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke_2;
    v7[3] = &unk_265547C58;
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 80);
    id v8 = v5;
    uint64_t v11 = v6;
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    [WeakRetained _createOrUpdateBatchTranslationRequestWithParagraph:v3 index:0 context:v4 completion:v7];
  }
}

void __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v8, OS_SIGNPOST_INTERVAL_END, v9, "TranslateSentence", "Online: finished translating sentence", v10, 2u);
  }

  [*(id *)(a1 + 40) sendLazy];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__8;
    v14[4] = __Block_byref_object_dispose__8;
    id v15 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_234;
    v10[3] = &unk_265547CD0;
    v10[4] = WeakRetained;
    uint64_t v4 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    uint64_t v13 = v14;
    id v12 = *(id *)(a1 + 48);
    [v4 enumerateObjectsUsingBlock:v10];
    id v5 = completionGroup;
    id v6 = v3[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_3;
    v7[3] = &unk_265547CF8;
    id v8 = *(id *)(a1 + 56);
    os_signpost_id_t v9 = v14;
    dispatch_group_notify(v5, v6, v7);

    _Block_object_dispose(v14, 8);
  }
}

void __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_234(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++completionGroupCount;
  dispatch_group_enter((dispatch_group_t)completionGroup);
  uint64_t v4 = -[_LTOnlineTranslationEngine translate:withContext:paragraphResult:completion:]::paragraphIndex++;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_2;
  v10[3] = &unk_265547CA8;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v9;
  long long v12 = v9;
  id v11 = v3;
  id v8 = v3;
  [v5 _createOrUpdateBatchTranslationRequestWithParagraph:v8 index:v4 context:v6 completion:v10];
}

void __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) identifier];
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v11, v5);

  --completionGroupCount;
  dispatch_group_leave((dispatch_group_t)completionGroup);
}

uint64_t __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[13];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2;
    block[3] = &unk_265547D48;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = v5;
    id v10 = v3;
    dispatch_async(v6, block);
  }
}

uint64_t __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) responseReceived:0];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _speechSessionCompletedWithError:v3];
}

void __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[13];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2;
    v7[3] = &unk_265547550;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speechSessionCompletedWithError:*(void *)(a1 + 40)];
}

void __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 6) cancel];
    uint64_t v4 = (void *)v3[6];
    v3[6] = 0;

    if (*(unsigned char *)(a1 + 40))
    {
      id v5 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke_cold_1();
      }
    }
  }
}

void __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke_cold_1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "updateServerTimeout %.2fs", (uint8_t *)&v2, 0xCu);
}

void __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2_5();
  uint64_t v2 = *v1;
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(void *)(v3 + 14) = v2;
  OUTLINED_FUNCTION_4_4(&dword_2600DC000, "Failed to translate paragraph %{public}@: %@", v5, v6);
}

void __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Notifying delegate of successfull cancellation is not supported for online engine.", v2, v3, v4, v5, v6);
}

@end