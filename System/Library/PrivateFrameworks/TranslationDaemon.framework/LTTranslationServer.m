@interface LTTranslationServer
@end

@implementation LTTranslationServer

void __54___LTTranslationServer_preheatWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = a2;
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v5;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Requested preheat with context: %{public}@", buf, 0xCu);
  }
  if ([*(id *)(a1 + 32) route] == 2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v3[2](v3);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    id v15 = 0;
    v8 = [v6 _engineForContext:v7 error:&v15];
    id v9 = v15;
    if (v8)
    {
      [v8 preheatAsynchronously:0 withContext:*(void *)(a1 + 32)];
      v10 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v11;
        _os_log_impl(&dword_2600DC000, v10, OS_LOG_TYPE_INFO, "Preheated engine with context: %{public}@", buf, 0xCu);
      }
      v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
      _LTAnalyticsSendOptionalErrorEvent(v9, v13);

      v14 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __54___LTTranslationServer_preheatWithContext_completion___block_invoke_cold_1();
      }
      v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v12();
    v3[2](v3);
  }
}

void __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v16 = 0;
  v6 = [v4 _engineForContext:v5 error:&v16];
  id v7 = v16;
  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_21;
    v12[3] = &unk_265548350;
    v15[1] = *(id *)(a1 + 72);
    objc_copyWeak(v15, (id *)(a1 + 64));
    id v13 = *(id *)(a1 + 56);
    v14 = v3;
    [v6 translateSentence:v8 withContext:v9 completion:v12];

    objc_destroyWeak(v15);
  }
  else
  {
    v10 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_cold_1();
    }
    uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
    _LTAnalyticsSendOptionalErrorEvent(v7, v11);

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v3[2](v3);
  }
}

uint64_t __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(const char **)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = NSStringFromSelector(v5);
  _LTAnalyticsSendOptionalErrorEvent(v6, v8);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateOfflineEngineIdleTimer];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v10();
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = a2;
  v4 = (void *)[*(id *)(a1 + 32) count];
  uint64_t v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = v5;
    *(_DWORD *)buf = 134218240;
    v26 = v4;
    __int16 v27 = 2048;
    uint64_t v28 = [v6 route];
    _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Translating %zu paragraphs for route: %ld", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
  uint64_t v8 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v24 = 0;
  v10 = [v8 _engineForContext:v9 error:&v24];
  id v11 = v24;
  if (v10)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 64);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_23;
    v19[3] = &unk_2655483A0;
    objc_copyWeak(v23, (id *)(a1 + 72));
    v23[1] = v4;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(void **)(a1 + 80);
    id v20 = v15;
    v23[2] = v16;
    id v21 = *(id *)(a1 + 56);
    v22 = v3;
    [v10 translate:v13 withContext:v12 paragraphResult:v14 completion:v19];

    objc_destroyWeak(v23);
  }
  else
  {
    uint64_t v17 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_cold_1();
    }
    uint64_t v18 = NSStringFromSelector(*(SEL *)(a1 + 80));
    _LTAnalyticsSendOptionalErrorEvent(v11, v18);

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v3[2](v3);
  }
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v5 = _LTOSLogTranslationEngine();
    id v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_23_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 64);
        int v13 = 134217984;
        uint64_t v14 = v7;
        _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Finished translating %zu paragraphs", (uint8_t *)&v13, 0xCu);
      }
      id v8 = objc_alloc(MEMORY[0x263F1C100]);
      uint64_t v9 = [*(id *)(a1 + 32) logIdentifier];
      v10 = (void *)[v8 initWithType:2 invocationId:v9];

      [WeakRetained[10] selfLoggingEventWithData:v10];
    }
    id v11 = NSStringFromSelector(*(SEL *)(a1 + 72));
    _LTAnalyticsSendOptionalErrorEvent(v3, v11);

    id v12 = objc_loadWeakRetained((id *)(a1 + 56));
    [v12 _updateOfflineEngineIdleTimer];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __65___LTTranslationServer_textStreamingConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[_LTDConfigurationService textStreamingConfigurationWithError:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = (id)v2;
  if (v2)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C158]);
    [v11 minTimeBetweenTranslations];
    double v6 = v5;
    [v11 maxTimeBetweenTranslations];
    double v8 = v7;
    [v11 userIdleTime];
    v10 = objc_msgSend(v4, "initWithMinTimeBetweenTranslations:maxTimeBetweenTranslations:userIdleTime:maxPartialTranslationAttempts:minNumberOfCharactersForTranslation:", objc_msgSend(v11, "maxPartialTranslationAttempts"), objc_msgSend(v11, "minNumberOfCharactersForTranslation"), v6, v8, v9);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained cancelExistingSessions];
    [v5 _removePendingSpeechSessionID:*(void *)(a1 + 32)];
    objc_msgSend(v5, "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
    double v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = *(void **)(a1 + 40);
      double v8 = v6;
      uint64_t v9 = [v7 route];
      int v10 = [*(id *)(a1 + 40) autodetectLanguage];
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = v9;
      __int16 v27 = 1024;
      int v28 = v10;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Handling text translation request for route: %zd (autodetect: %{BOOL}i)", buf, 0x12u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v24 = 0;
    int v13 = [v11 _engineForContext:v12 error:&v24];
    id v14 = v24;
    if (v13)
    {
      uint64_t v15 = [[_LTServerSpeechSession alloc] initWithEngine:v13 delegate:*(void *)(a1 + 56) selfLoggingManager:v5[10]];
      [(_LTServerSpeechSession *)v15 setSessionID:*(void *)(a1 + 64)];
      objc_storeStrong(v5 + 5, v15);
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      id v20 = __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_31;
      id v21 = &unk_2655483F0;
      v23[1] = *(id *)(a1 + 88);
      objc_copyWeak(v23, (id *)(a1 + 80));
      v22 = v3;
      [(_LTServerSpeechSession *)v15 setCompletionHandler:&v18];
      -[_LTServerSpeechSession startTextToSpeechTranslationWithContext:text:](v15, "startTextToSpeechTranslationWithContext:text:", *(void *)(a1 + 40), *(void *)(a1 + 72), v18, v19, v20, v21);

      objc_destroyWeak(v23);
    }
    else
    {
      id v16 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_cold_1();
      }
      uint64_t v17 = NSStringFromSelector(*(SEL *)(a1 + 88));
      _LTAnalyticsSendOptionalErrorEvent(v14, v17);

      [*(id *)(a1 + 56) translationDidFinishWithError:v14];
      v3[2](v3);
    }
  }
}

uint64_t __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v3 = *(const char **)(a1 + 48);
  id v4 = a2;
  double v5 = NSStringFromSelector(v3);
  _LTAnalyticsSendOptionalErrorEvent(v4, v5);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateOfflineEngineIdleTimer];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 _speechSessionCompleted];

  double v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v8();
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained cancelExistingSessions];
    [v5 _removePendingSpeechSessionID:*(void *)(a1 + 32)];
    objc_msgSend(v5, "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
    uint64_t v7 = *(void *)(a1 + 40);
    double v6 = *(void **)(a1 + 48);
    id v23 = 0;
    double v8 = [v6 _engineForContext:v7 error:&v23];
    id v9 = v23;
    if (v8)
    {
      int v10 = [[_LTServerSpeakSession alloc] initWithEngine:v8];
      id v11 = (void *)v5[6];
      v5[6] = v10;

      uint64_t v12 = (void *)v5[6];
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 40);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_33;
      v19[3] = &unk_265548440;
      v22[1] = *(id *)(a1 + 88);
      objc_copyWeak(v22, (id *)(a1 + 80));
      id v20 = *(id *)(a1 + 72);
      id v21 = v3;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_35;
      v17[3] = &unk_265548468;
      id v18 = *(id *)(a1 + 64);
      [v12 speak:v13 context:v14 completion:v19 audioStartHandler:v17];

      objc_destroyWeak(v22);
    }
    else
    {
      uint64_t v15 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_cold_1();
      }
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 88));
      _LTAnalyticsSendOptionalErrorEvent(v9, v16);

      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      v3[2](v3);
    }
  }
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _LTOSLogTTS();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_33_cold_1();
    }
    double v8 = NSStringFromSelector(*(SEL *)(a1 + 56));
    _LTAnalyticsSendOptionalErrorEvent(v6, v8);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateOfflineEngineIdleTimer];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_35(uint64_t a1, void *a2, double a3)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 wordTimingInfo];
    [v5 ttsAudioStarted:v6 duration:a3];
  }
}

void __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained cancelExistingSessions];
    [v5 _removePendingSpeechSessionID:*(void *)(a1 + 32)];
    id v6 = (id *)(a1 + 40);
    objc_msgSend(v5, "registerActivity:", objc_msgSend(*(id *)(a1 + 40), "taskHint"));
    id v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *v6;
      id v9 = v7;
      uint64_t v10 = [v8 route];
      int v11 = [*v6 autodetectLanguage];
      *(_DWORD *)buf = 134218240;
      uint64_t v35 = v10;
      __int16 v36 = 1024;
      int v37 = v11;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Handling speech translation request for route: %zd (autodetect: %{BOOL}i)", buf, 0x12u);
    }
    uint64_t v29 = [*(id *)(a1 + 48) _modalitiesPerLocale];
    uint64_t v12 = [*(id *)(a1 + 40) localePair];
    uint64_t v13 = [v12 sourceLocale];
    if ([v29 locale:v13 supportsModality:1])
    {
      if (([*v6 autodetectLanguage] & 1) == 0)
      {

LABEL_13:
        id v22 = *v6;
        id v33 = 0;
        id v23 = [v5 _engineForContext:v22 error:&v33];
        id v24 = v33;
        v25 = _LTOSLogTranslationEngine();
        uint64_t v26 = v25;
        if (v23)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2600DC000, v26, OS_LOG_TYPE_INFO, "Start speech translation session", buf, 2u);
          }
          __int16 v27 = [[_LTServerSpeechSession alloc] initWithEngine:v23 delegate:*(void *)(a1 + 56) selfLoggingManager:v5[10]];
          [(_LTServerSpeechSession *)v27 setSessionID:*(void *)(a1 + 64)];
          objc_storeStrong(v5 + 5, v27);
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_39;
          v30[3] = &unk_2655483F0;
          v32[1] = *(id *)(a1 + 80);
          objc_copyWeak(v32, (id *)(a1 + 72));
          v31 = v3;
          [(_LTServerSpeechSession *)v27 setCompletionHandler:v30];
          [(_LTServerSpeechSession *)v27 startSpeechTranslationWithContext:*v6];

          objc_destroyWeak(v32);
        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_1();
          }
          int v28 = NSStringFromSelector(*(SEL *)(a1 + 80));
          _LTAnalyticsSendOptionalErrorEvent(v24, v28);

          [*(id *)(a1 + 56) translationDidFinishWithError:v24];
          v3[2](v3);
        }

LABEL_21:
        goto LABEL_22;
      }
      uint64_t v14 = [*v6 localePair];
      uint64_t v15 = [v14 targetLocale];
      char v16 = [v29 locale:v15 supportsModality:1];

      if (v16) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v17 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_2((void **)(a1 + 40), v17);
    }
    id v18 = *(void **)(a1 + 56);
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    id v20 = [*(id *)(a1 + 40) localePair];
    id v21 = objc_msgSend(v19, "lt_unsupporedLocalePairError:", v20);
    [v18 translationDidFinishWithError:v21];

    v3[2](v3);
    goto LABEL_21;
  }
LABEL_22:
}

uint64_t __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v3 = *(const char **)(a1 + 48);
  id v4 = a2;
  id v5 = NSStringFromSelector(v3);
  _LTAnalyticsSendOptionalErrorEvent(v4, v5);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateOfflineEngineIdleTimer];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 _speechSessionCompleted];

  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v8();
}

void __43___LTTranslationServer_cancelSpeechSession__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[5] cancel];
    id v2 = v3[5];
    v3[5] = 0;

    id WeakRetained = v3;
  }
}

void __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_2(a1, (uint64_t)WeakRetained, v3);
    }
    id v4 = [WeakRetained[5] sessionID];
    char v5 = [v4 isEqual:*(void *)(a1 + 32)];

    if (v5)
    {
      [WeakRetained[5] cancel];
      id v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Resetting session", v9, 2u);
      }
      id v7 = WeakRetained[5];
      WeakRetained[5] = 0;
    }
    else
    {
      id v8 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_1();
      }
    }
  }
}

void __47___LTTranslationServer__speechSessionCompleted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    uint64_t v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __43___LTTranslationServer_addSpeechAudioData___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43___LTTranslationServer_addSpeechAudioData___block_invoke_cold_1();
    }
    [WeakRetained[5] addSpeechAudioData:*(void *)(a1 + 32)];
  }
}

void __32___LTTranslationServer_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __32___LTTranslationServer_endAudio__block_invoke_cold_1();
    }
    [WeakRetained[5] endAudio];
  }
}

void __71___LTTranslationServer_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _LTPreferencesGetLanguageDetectorUnsupportedPairs();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __58___LTTranslationServer_modalitiesPerLocaleWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _modalitiesPerLocale];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __88___LTTranslationServer__markPendingSpeechSessionIfNeededWithContext_effectiveSessionID___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = _LTOSLogSpeech();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Marking a speech session as pending: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 40) + 56) addObject:*(void *)(a1 + 32)];
}

void __37___LTTranslationServer__logStateSoon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained onDeviceModeEnabled:&__block_literal_global_30];
    id WeakRetained = v2;
  }
}

void __37___LTTranslationServer__logStateSoon__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = _LTOSLogDeviceState();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEFAULT, "On-device mode enabled: %{BOOL}i", (uint8_t *)v4, 8u);
  }
}

void __37___LTTranslationServer__logStateSoon__block_invoke_43(uint64_t a1)
{
}

void __44___LTTranslationServer_startLoggingRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[8] startLoggingRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __44___LTTranslationServer_cleanupOfflineEngine__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    uint64_t v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __31___LTTranslationServer_cleanup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = _LTOSLogSpeech();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Client requested a cleanup of ongoing speech sessions", v3, 2u);
    }
    [WeakRetained cancelExistingSessions];
    [WeakRetained _cancelPendingSpeechOperations];
  }
}

void __61___LTTranslationServer_attemptToCancelRequestsWithSessionID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = (void *)WeakRetained[3];
    uint64_t v5 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) UUIDString];
    [v3 cancelOperationsWithGroupID:v4];

    id WeakRetained = v5;
  }
}

void __59___LTTranslationServer_shouldPresentSystemFirstUseConsent___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = v2;
  if (objc_msgSend(v2, "lt_isOnDeviceOnly")) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = objc_msgSend(v5, "lt_hasAcceptedFirstUseConsent") ^ 1;
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __51___LTTranslationServer_languageForText_completion___block_invoke(uint64_t a1)
{
  uint64_t v4 = objc_alloc_init(_LTTextLanguageDetector);
  id v2 = _LTPreferencesSupportedLocales(2);
  [(_LTTextLanguageDetector *)v4 setAvailableLocales:v2];

  uint64_t v3 = [(_LTTextLanguageDetector *)v4 detectionForString:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke(void *a1)
{
  id v2 = [[_LTTextLanguageDetector alloc] initWithModel:a1[6]];
  uint64_t v3 = _LTPreferencesSupportedLocales(2);
  [(_LTTextLanguageDetector *)v2 setAvailableLocales:v3];

  uint64_t v4 = [(_LTTextLanguageDetector *)v2 detectionForStrings:a1[4] strategy:a1[7]];
  id v5 = _LTOSLogXPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke_cold_1(v5);
  }
  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __61___LTTranslationServer_languageAssetsWithOptions_completion___block_invoke(uint64_t a1)
{
  return +[_LTDLanguageAssetService assetsWithOptions:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
}

uint64_t __70___LTTranslationServer_setLanguageAssets_options_progress_completion___block_invoke(void *a1)
{
  return +[_LTDLanguageAssetService setAssets:a1[4] options:a1[7] progress:a1[5] completion:a1[6]];
}

void __47___LTTranslationServer__offlineLanguageStatus___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47___LTTranslationServer__offlineLanguageStatus___block_invoke_2;
  v3[3] = &unk_265546268;
  id v4 = *(id *)(a1 + 32);
  [(_LTOfflineAssetManager *)v2 offlineLanguageStatus:v3];
}

uint64_t __47___LTTranslationServer__offlineLanguageStatus___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v7[3] = &unk_265548530;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  [(_LTOfflineAssetManager *)v2 downloadAssetsForLanguagePair:v3 userInitiated:v4 completion:v7];
}

void __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(const char **)(a1 + 40);
  id v5 = a2;
  uint64_t v4 = NSStringFromSelector(v3);
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2;
  v7[3] = &unk_265548530;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v8 = v6;
  [(_LTOfflineAssetManager *)v2 purgeAssetForLanguagePair:v3 userInitiated:v4 completion:v7];
}

void __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(const char **)(a1 + 40);
  id v5 = a2;
  uint64_t v4 = NSStringFromSelector(v3);
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke(uint64_t a1)
{
  +[_LTDLanguageAssetService setSelectedLocales:MEMORY[0x263EFFA68]];
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke_2;
  v6[3] = &unk_265548530;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  [(_LTOfflineAssetManager *)v2 purgeAllAssetsExcludingConfig:v3 completion:v6];
}

void __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(const char **)(a1 + 40);
  id v5 = a2;
  id v4 = NSStringFromSelector(v3);
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41___LTTranslationServer__updateAllAssets___block_invoke(uint64_t a1)
{
  +[_LTDAssetService setNeedsCatalogRefresh:1];
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41___LTTranslationServer__updateAllAssets___block_invoke_2;
  v5[3] = &unk_265548530;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [(_LTOfflineAssetManager *)v2 updateAllAssets:v5];
}

void __41___LTTranslationServer__updateAllAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(const char **)(a1 + 40);
  id v5 = a2;
  long long v4 = NSStringFromSelector(v3);
  _LTAnalyticsSendOptionalErrorEvent(v5, v4);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41___LTTranslationServer_installedLocales___block_invoke(uint64_t a1)
{
  id v2 = +[_LTDLanguageAssetService selectedLocales];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_2;
  v2[3] = &unk_2655485C8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  +[_LTDLanguageAssetService assetsWithOptions:64 completion:v2];

  objc_destroyWeak(&v4);
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[12];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3;
    block[3] = &unk_2655468E0;
    id v11 = v6;
    id v13 = *(id *)(a1 + 32);
    id v12 = v5;
    dispatch_async(v9, block);
  }
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) _ltCompactMap:&__block_literal_global_53];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_50(uint64_t a1, void *a2)
{
  return [a2 locale];
}

void __53___LTTranslationServer_startInstallRequest_delegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locales];
  uint64_t v3 = [*(id *)(a1 + 32) useCellular];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_2;
  v6[3] = &unk_265545EE8;
  id v7 = *(id *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  _DWORD v4[2] = __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_3;
  v4[3] = &unk_265545F10;
  id v5 = *(id *)(a1 + 40);
  +[_LTDLanguageAssetService setInstalledLocales:v2 useCellular:v3 progress:v6 completion:v4];
}

uint64_t __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) languageInstallProgressed:a2 error:0];
}

uint64_t __53___LTTranslationServer_startInstallRequest_delegate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) languageInstallProgressed:0 error:a2];
}

void __38___LTTranslationServer__getAssetSize___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38___LTTranslationServer__getAssetSize___block_invoke_2;
  v5[3] = &unk_2655485F0;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [(_LTOfflineAssetManager *)v2 assetSize:v5];
}

void __38___LTTranslationServer__getAssetSize___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(const char **)(a1 + 40);
  id v6 = a3;
  id v8 = a2;
  id v7 = NSStringFromSelector(v5);
  _LTAnalyticsSendOptionalErrorEvent(v6, v7);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63___LTTranslationServer_availableLocalePairsForTask_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  _LTPreferencesSupportedLocalePairsForTask(*(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __77___LTTranslationServer_additionalLikelyPreferredLocalesForLocale_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  _LTPreferencesAdditionalLikelyPreferredLocales(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(_LTOfflineAssetManager);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke_2;
  v3[3] = &unk_265548618;
  id v6 = a1[6];
  id v4 = a1[4];
  id v5 = a1[5];
  [(_LTOfflineAssetManager *)v2 refreshAllIfNeededWithCompletion:v3];
}

void __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  _LTPreferencesConfigInfoForLocale(*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __61___LTTranslationServer_task_isSupportedInCountry_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38___LTTranslationServer__updateHotfix___block_invoke(uint64_t a1)
{
  id v2 = +[_LTHotfixManager shared];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38___LTTranslationServer__updateHotfix___block_invoke_2;
  v3[3] = &unk_265545F60;
  id v4 = *(id *)(a1 + 32);
  [v2 updateHotfix:v3];
}

uint64_t __38___LTTranslationServer__updateHotfix___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38___LTTranslationServer__deleteHotfix___block_invoke(uint64_t a1)
{
  id v2 = +[_LTHotfixManager shared];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38___LTTranslationServer__deleteHotfix___block_invoke_2;
  v3[3] = &unk_265545F60;
  id v4 = *(id *)(a1 + 32);
  [v2 deleteHotfix:v3];
}

uint64_t __38___LTTranslationServer__deleteHotfix___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44___LTTranslationServer_onDeviceModeEnabled___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
  char v3 = objc_msgSend(v2, "lt_isOnDeviceOnly");

  id v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44___LTTranslationServer_onDeviceModeEnabled___block_invoke_cold_1(v3, v4);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46___LTTranslationServer_onDeviceModeSupported___block_invoke(uint64_t a1)
{
  char v2 = +[_LTDLanguageAssetService onDeviceModeSupported];
  char v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __46___LTTranslationServer_onDeviceModeSupported___block_invoke_cold_1(v2, v3);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49___LTTranslationServer_selfLoggingEventWithData___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    [WeakRetained[10] selfLoggingEventWithData:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __78___LTTranslationServer_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v3 = WeakRetained;
    [WeakRetained[10] selfLoggingLanguageIdentificationCompletedWithLIDData:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __61___LTTranslationServer_selfLoggingInvocationCancelledForIDs___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
          id v9 = objc_alloc(MEMORY[0x263F1C100]);
          uint64_t v10 = objc_msgSend(v9, "initWithType:invocationId:", 4, v8, (void)v11);
          [WeakRetained[10] selfLoggingEventWithData:v10];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

void __67___LTTranslationServer_selfLoggingInvocationDidError_invocationId___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v2 = (void *)[objc_alloc(MEMORY[0x263F1C100]) initWithType:3 invocationId:*(void *)(a1 + 32)];
    [v2 setInvocationEndedError:*(void *)(a1 + 40)];
    [WeakRetained[10] selfLoggingEventWithData:v2];
  }
}

void __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_2;
  v6[3] = &unk_265548690;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v5 = v3;
  id v7 = v5;
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  objc_destroyWeak(&v8);
}

void __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Finished asset cleanup actions after a download completed", buf, 2u);
  }
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained[12];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_57;
    block[3] = &unk_265548668;
    char v10 = a2;
    void block[4] = WeakRetained;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

uint64_t __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke_57(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v4 = _LTOSLogAssets();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    }
    __int16 v12 = 0;
    id v7 = "No further cleanup required";
    id v8 = (uint8_t *)&v12;
LABEL_10:
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, v7, v8, 2u);
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = _LTOSLogTranslationEngine();
  uint64_t v4 = v3;
  if (!v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    }
    __int16 v10 = 0;
    id v7 = "No need to clear offline engine after downloads finished because there wasn't a cached engine";
    id v8 = (uint8_t *)&v10;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_DEFAULT, "Clearing offline translation engine since assets may have changed and files may have changed locations", buf, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

void __54___LTTranslationServer_preheatWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to preheat engine: %@", v2, v3, v4, v5, v6);
}

void __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create text translation engine: %@", v2, v3, v4, v5, v6);
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create paragraph text translation engine: %@", v2, v3, v4, v5, v6);
}

void __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke_23_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2600DC000, v1, OS_LOG_TYPE_ERROR, "Failed to translate %zu paragraphs: %@", v2, 0x16u);
}

void __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create text-to-speech translation engine: %@", v2, v3, v4, v5, v6);
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create translation engine for speaking: %@", v2, v3, v4, v5, v6);
}

void __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed TTS request: %@", v2, v3, v4, v5, v6);
}

void __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create speech translation engine: %@", v2, v3, v4, v5, v6);
}

void __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke_cold_2(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 localePair];
  uint64_t v5 = [v4 description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_5(&dword_2600DC000, v6, v7, "Speech translation request for %{public}@ is not supported", v8, v9, v10, v11, v12);
}

void __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Ignoring cancel request because of different session IDs", v2, v3, v4, v5, v6);
}

void __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke_cold_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  uint8_t v6 = [(id)OUTLINED_FUNCTION_1_5() sessionID];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Asked to cancel %{public}@, current ongoing is: %{public}@", (uint8_t *)&v7, 0x16u);
}

void __43___LTTranslationServer_addSpeechAudioData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Add speech audio data for session", v2, v3, v4, v5, v6);
}

void __32___LTTranslationServer_endAudio__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "End speech audio data on session", v2, v3, v4, v5, v6);
}

void __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1_5() description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "XPC languages for text result: %{public}@", v6, v7, v8, v9, v10);
}

void __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to lookup installed languages: %@", v2, v3, v4, v5, v6);
}

void __44___LTTranslationServer_onDeviceModeEnabled___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "XPC on-device mode result: %{BOOL}i", (uint8_t *)v2, 8u);
}

void __46___LTTranslationServer_onDeviceModeSupported___block_invoke_cold_1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "XPC on-device support result: %{BOOL}i", (uint8_t *)v2, 8u);
}

@end