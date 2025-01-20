@interface LTOfflineTranslationEngine
@end

@implementation LTOfflineTranslationEngine

void __65___LTOfflineTranslationEngine_preheatAsynchronously_withContext___block_invoke(uint64_t a1)
{
  v2 = _LTOSLogTranslationEngine();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PreheatModels", "Loading all models", buf, 2u);
  }

  [*(id *)(a1 + 32) _loadRecognizersWithContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) taskHint];
  v6 = _LTTranslationModelTaskString();
  [*(id *)(a1 + 32) _loadTranslatorForTask:v6];
  if ([*(id *)(a1 + 40) censorSpeech]) {
    [*(id *)(a1 + 32) _loadEtiquetteSanitizers];
  }
  v7 = v5;
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v8, OS_SIGNPOST_INTERVAL_END, v3, "PreheatModels", "Finished loading models", v9, 2u);
  }
}

id __82___LTOfflineTranslationEngine__handleTranslationResults_withContext_sourceString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v38 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v37 = v3;
  if (!WeakRetained)
  {
    v26 = 0;
    goto LABEL_23;
  }
  v4 = [MEMORY[0x263EFF980] array];
  v39 = [MEMORY[0x263EFF980] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v5 = [v3 tokens];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F1C1B0]);
        v11 = [v9 text];
        [v9 confidence];
        v13 = (void *)[v10 initWithText:v11 confidence:v12];

        [v4 addObject:v13];
        v14 = [v9 text];
        BOOL v15 = [v14 length] == 0;

        if (!v15)
        {
          v16 = [v9 text];
          [v39 addObject:v16];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v6);
  }

  v17 = [v39 componentsJoinedByString:@" "];
  v18 = v37;
  if ([*(id *)(v38 + 32) censorSpeech] && (v19 = (void *)WeakRetained[4]) != 0)
  {
    v20 = [v19 objectForKeyedSubscript:*(void *)(v38 + 40)];
    v21 = [v20 sanitizedStringForString:v17];

    v18 = v37;
  }
  else
  {
    v21 = 0;
  }
  id v22 = objc_alloc(MEMORY[0x263F1C170]);
  [v18 confidence];
  float v24 = v23;
  uint64_t v25 = [v18 lowConfidence];
  v26 = (void *)[v22 initWithFormattedString:v17 sanitizedFormattedString:v21 confidence:v25 lowConfidence:0 romanization:v4 tokens:MEMORY[0x263EFFA68] preToPostITN:v24];
  v27 = [v18 metaInfo];
  [v26 updateWithEngineMeta:v27 locale:*(void *)(v38 + 40)];

  v28 = (void *)MEMORY[0x263F1C0C0];
  if (v21)
  {
    v29 = [v26 romanization];
    uint64_t v30 = [v28 nodeWithText:v21 romanization:v29];
    goto LABEL_17;
  }
  uint64_t v32 = *(void *)(v38 + 48);
  v33 = [v26 romanization];
  v31 = [v28 nodeFromEMTResult:v37 sourceText:v32 romanization:v33];

  if (!v31)
  {
    v35 = (void *)MEMORY[0x263F1C0C0];
    v29 = [v26 romanization];
    uint64_t v30 = [v35 nodeWithText:v17 romanization:v29];
LABEL_17:
    v31 = (void *)v30;

    if (!v31) {
      goto LABEL_22;
    }
  }
  objc_msgSend(*(id *)(v38 + 56), "addObject:", v31, WeakRetained);
LABEL_22:

LABEL_23:
  return v26;
}

void __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Done translating", buf, 2u);
    }
    uint64_t v6 = *(id *)(a1 + 32);
    uint64_t v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 96);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v7, OS_SIGNPOST_INTERVAL_END, v8, "TranslateTokens", "Offline: Finished translating", buf, 2u);
    }

    v9 = WeakRetained[6];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke_25;
    v10[3] = &unk_2655475A0;
    v10[4] = *(void *)(a1 + 40);
    id v11 = v3;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    BOOL v15 = WeakRetained;
    id v16 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 80);
    dispatch_async(v9, v10);
  }
}

void __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke_25(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _handleTranslationResults:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) sourceString:*(void *)(a1 + 56)];
  if (!v2)
  {
    id v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Unable to create a translation result from EMT results; returning result without any translations",
        (uint8_t *)&v23,
        2u);
    }
    v2 = [MEMORY[0x263F1C190] resultWithLocale:*(void *)(a1 + 64) translations:MEMORY[0x263EFFA68]];
  }
  [v2 setRoute:1];
  [v2 setSourceString:*(void *)(a1 + 56)];
  if ([*(id *)(a1 + 48) censorSpeech])
  {
    v4 = *(void **)(*(void *)(a1 + 72) + 32);
    if (v4)
    {
      v5 = [v2 locale];
      uint64_t v6 = [v4 objectForKeyedSubscript:v5];

      uint64_t v7 = [v6 sanitizedStringForString:*(void *)(a1 + 56)];
      [v2 setSanitizedSourceString:v7];
    }
  }
  os_signpost_id_t v8 = [v2 translations];
  v9 = [v8 firstObject];

  id v10 = *(void **)(a1 + 80);
  v27 = @"bestConfidence";
  id v11 = NSNumber;
  [v9 confidence];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  v28[0] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [v10 addFieldsFromDictionary:v13];

  id v14 = *(void **)(a1 + 80);
  uint64_t v25 = @"bestTranslation";
  uint64_t v15 = [v9 formattedString];
  id v16 = (void *)v15;
  id v17 = &stru_270C008E8;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  v26 = v17;
  v18 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  [v14 addFieldsFromDictionary:v18 internalOnly:1];

  v19 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = [v2 translations];
    v21 = [v20 firstObject];
    id v22 = [v21 formattedString];
    int v23 = 138739971;
    float v24 = v22;
    _os_log_impl(&dword_2600DC000, v19, OS_LOG_TYPE_INFO, "Finished translating: %{sensitive}@", (uint8_t *)&v23, 0xCu);
  }
  [*(id *)(a1 + 80) sendLazy];
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

id __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 translations];
  id v3 = [v2 firstObject];
  v4 = [v3 formattedString];

  return v4;
}

id __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 translations];
  id v3 = [v2 firstObject];
  v4 = [v3 romanization];

  return v4;
}

id __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 translations];
  v5 = [v4 firstObject];

  uint64_t v6 = [v5 sanitizedFormattedString];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = *(unsigned char *)(v8 + 24) == 0;
  }
  char v10 = !v9;
  *(unsigned char *)(v8 + 24) = v10;
  if (v6)
  {
    id v11 = v6;
  }
  else
  {
    id v11 = [v5 formattedString];
  }
  id v12 = v11;

  return v12;
}

void __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      id v17 = v5;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Translating sentence with offline engine: %{sensitive}@", buf, 0xCu);
    }
    BOOL v9 = [v5 text];
    uint64_t v10 = [*(id *)(a1 + 32) isFinal];
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v13 = [v5 spans];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_46;
    v14[3] = &unk_265547638;
    id v15 = v6;
    [WeakRetained _translateString:v9 isFinal:v10 withContext:v12 toLocale:v11 withSpans:v13 completion:v14];
  }
}

uint64_t __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained _paragraphResultFromSentences:v13];
    id v6 = [*(id *)(a1 + 32) identifier];
    [v5 setIdentifier:v6];

    uint64_t v7 = [*(id *)(a1 + 32) text];
    [v5 setSourceString:v7];

    if ([*(id *)(a1 + 40) censorSpeech])
    {
      uint64_t v8 = (void *)*((void *)v4 + 4);
      if (v8)
      {
        BOOL v9 = [*((id *)v4 + 18) sourceLocale];
        uint64_t v10 = [v8 objectForKeyedSubscript:v9];

        uint64_t v11 = [*(id *)(a1 + 32) text];
        uint64_t v12 = [v10 sanitizedStringForString:v11];
        [v5 setSanitizedSourceString:v12];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 text];
    *(_DWORD *)buf = 138739971;
    id v17 = v8;
    _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Translating paragraph with offline engine: %{sensitive}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_50;
    v12[3] = &unk_2655476B0;
    id v14 = *(id *)(a1 + 48);
    id v13 = v5;
    id v15 = v6;
    [WeakRetained _translateParagraph:v13 withContext:v10 toLocale:v11 completion:v12];
  }
}

void __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Finished translating paragraph with offline engine", v7, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) identifier];
  (*(void (**)(uint64_t, void *, id, void))(v5 + 16))(v5, v6, v3, 0);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Finished translation with offline engine, sending analytics event", v6, 2u);
  }
  [*(id *)(a1 + 32) sendLazy];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) censorSpeech]) {
      [*(id *)(a1 + 40) _loadEtiquetteSanitizers];
    }
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = [*(id *)(a1 + 32) isFinal];
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v5 localePair];
    uint64_t v7 = [v6 targetLocale];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke_2;
    v8[3] = &unk_265547638;
    id v9 = *(id *)(a1 + 56);
    [WeakRetained _translateString:v3 isFinal:v4 withContext:v5 toLocale:v7 withSpans:0 completion:v8];
  }
}

uint64_t __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke(id *a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  if (WeakRetained)
  {
    if ([a1[4] censorSpeech]) {
      [a1[5] _loadEtiquetteSanitizers];
    }
    v2 = _LTOSLogTranslationEngine();
    os_signpost_id_t v3 = os_signpost_id_generate(v2);
    uint64_t v4 = v2;
    uint64_t v5 = v4;
    v29 = v4;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      uint64_t v6 = [a1[6] count];
      *(_DWORD *)buf = 134217984;
      uint64_t v46 = v6;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "TranslateParagraphs", "Offline: Translating %zu paragraphs", buf, 0xCu);
    }
    v31 = a1;

    uint64_t v7 = [a1[4] localePair];
    uint64_t v30 = [v7 targetLocale];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v31[6];
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v14 = [v13 text];
          uint64_t v15 = [v14 length];

          id v16 = objc_alloc(MEMORY[0x263F086A0]);
          id v17 = [v13 text];
          uint64_t v18 = (void *)[v16 initWithString:v17];

          v19 = objc_msgSend(v18, "lt_sentences");
          uint64_t v20 = [v19 count];

          v8 += v15;
          v9 += v20;
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v10);
    }

    v21 = (void *)WeakRetained[14];
    id v22 = [v31[4] logIdentifier];
    int v23 = [v21 sendFrameworkRequestWithInvocationId:v22 qssSessionId:0 requestType:1 requestRoute:2 requestSize:v8];

    id v24 = v31[4];
    id v25 = v31[6];
    id v26 = v31[7];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_60;
    v34[3] = &unk_265547750;
    v27 = v29;
    v35 = v27;
    id v36 = v23;
    os_signpost_id_t v38 = v3;
    uint64_t v39 = v9;
    id v37 = v31[8];
    id v28 = v23;
    [WeakRetained _translate:v25 withContext:v24 toLocale:v30 paragraphResult:v26 completion:v34];
  }
}

void __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(id *)(a1 + 32);
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v5, OS_SIGNPOST_INTERVAL_END, v6, "TranslateParagraphs", "Offline: Finished translating", buf, 2u);
  }

  [*(id *)(a1 + 40) responseReceived:*(void *)(a1 + 64)];
  if (v3)
  {
    uint64_t v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_60_cold_1();
    }
  }
  else
  {
    uint64_t v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Successfully finished all paragraph translations with offline engine", v9, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55___LTOfflineTranslationEngine_cancelSpeechTranslation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained cancelRecognition:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __50___LTOfflineTranslationEngine_addSpeechAudioData___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained[2] addSpeechAudioData:*(void *)(a1 + 32)];
  }
}

void __39___LTOfflineTranslationEngine_endpoint__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 96) = 1;
    [*((id *)WeakRetained + 2) endAudio];
  }
}

uint64_t __62___LTOfflineTranslationEngine_setLanguagesRecognized_context___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v3 = WeakRetained + 10;
    if (([WeakRetained[10] isEqual:a1[4]] & 1) == 0
      && ([a1[5] forceSourceLocale] & 1) == 0)
    {
      [v5 _translatePrepare:a1[4]];
    }
    objc_storeStrong(v3, a1[4]);
    objc_storeStrong(v5 + 11, a1[6]);
    if (!+[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:lidResult:](_LTOfflineTranslationEngine, "_needToWaitForBothFinalTranslationResultsWithContext:lidResult:", a1[5], a1[6]))[v5[2] setLanguagesRecognized:a1[6]]; {
    if (v5[9] && [v5[11] isFinal])
    }
      dispatch_group_leave((dispatch_group_t)v5[9]);
  }
  return MEMORY[0x270F9A758]();
}

void __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (![a1[4] autodetectLanguage] || (objc_msgSend(a1[4], "forceSourceLocale") & 1) != 0)
    {
LABEL_4:
      (*((void (**)(void))a1[5] + 2))();
      goto LABEL_5;
    }
    id v3 = (void *)*((void *)WeakRetained + 11);
    if (v3 && [v3 isFinal])
    {
      uint64_t v4 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Already got final LID result, forwarding...", buf, 2u);
      }
      goto LABEL_4;
    }
    if (!*((void *)WeakRetained + 9))
    {
      dispatch_group_t v5 = dispatch_group_create();
      os_signpost_id_t v6 = (void *)*((void *)WeakRetained + 9);
      *((void *)WeakRetained + 9) = v5;

      dispatch_group_enter(*((dispatch_group_t *)WeakRetained + 9));
      uint64_t v7 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Waiting for LID result", buf, 2u);
      }
      uint64_t v8 = *((void *)WeakRetained + 9);
      uint64_t v9 = *((void *)WeakRetained + 6);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke_63;
      v10[3] = &unk_265547840;
      v10[4] = WeakRetained;
      id v11 = a1[5];
      dispatch_group_notify(v8, v9, v10);
    }
  }
LABEL_5:
}

uint64_t __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke_63(uint64_t a1)
{
  v2 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Received final LID result, continue with wait block", v6, 2u);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = *((void *)WeakRetained + 6);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke_2;
    block[3] = &unk_265547890;
    id v12 = v6;
    id v14 = *(id *)(a1 + 32);
    id v13 = v5;
    dispatch_async(v9, block);
    uint64_t v10 = (void *)v8[3];
    v8[3] = 0;
  }
}

void __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  if (a1[4])
  {
    objc_msgSend(MEMORY[0x263F087E8], "lt_offlineTTSErrorWithError:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v1 + 16))(v1, 0);
  }
  else
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v1 + 16);
    uint64_t v4 = a1[6];
    v3(v4, v2);
  }
}

void __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F1C190];
  uint64_t v3 = [*(id *)(a1 + 32) formattedString];
  uint64_t v4 = [*(id *)(a1 + 32) sanitizedFormattedString];
  id v7 = [v2 passthroughResultWithString:v3 sanitizedString:v4 locale:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 48) uniqueID];
  [v7 setIdentifier:v5];

  id v6 = [*(id *)(a1 + 32) sanitizedFormattedString];
  [v7 setSanitizedSourceString:v6];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_3;
    v7[3] = &unk_265547908;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = v5;
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    char v13 = *(unsigned char *)(a1 + 64);
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);
  }
}

void __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bestTranscription];
  id v7 = [v2 formattedString];

  id v3 = [*(id *)(a1 + 40) _handleTranslationResults:*(void *)(a1 + 48) withContext:*(void *)(a1 + 56) sourceString:v7];
  uint64_t v4 = [*(id *)(a1 + 56) uniqueID];
  [v3 setIdentifier:v4];

  id v5 = [*(id *)(a1 + 32) bestTranscription];
  id v6 = [v5 sanitizedFormattedString];
  [v3 setSanitizedSourceString:v6];

  [v3 setIsFinal:*(unsigned __int8 *)(a1 + 72)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "translationDidFinishWithError:");
  if (v3) {
    [*(id *)(a1 + 40) addFieldsWithError:v3];
  }
  [*(id *)(a1 + 40) sendLazy];
}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 10);
  if (WeakRetained)
  {
    [a1[4] taskHint];
    id v3 = _LTTranslationModelTaskString();
    [WeakRetained _loadTranslatorForTask:v3];
    if (WeakRetained[13])
    {
      (*((void (**)(void))a1[9] + 2))();
    }
    else
    {
      uint64_t v4 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Starting TTS translation with offline engine", buf, 2u);
      }
      id v5 = _LTOSLogTranslationEngine();
      os_signpost_id_t v6 = os_signpost_id_generate(v5);
      id v7 = v5;
      id v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        id v9 = a1[5];
        *(_DWORD *)buf = 138739971;
        id v26 = v9;
        _os_signpost_emit_with_name_impl(&dword_2600DC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "OfflineTranslation", "Offline: Translating text: %{sensitive}@", buf, 0xCu);
      }

      [a1[6] timestampWithName:@"mtStartTime"];
      id v10 = (void *)WeakRetained[14];
      id v11 = [a1[4] logIdentifier];
      id v12 = objc_msgSend(v10, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v11, 0, 2, 2, objc_msgSend(a1[5], "length"));

      id v14 = a1[4];
      id v13 = a1[5];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_70;
      v17[3] = &unk_265547980;
      uint64_t v15 = v8;
      uint64_t v18 = v15;
      os_signpost_id_t v24 = v6;
      id v19 = a1[7];
      id v20 = v12;
      id v21 = a1[6];
      id v22 = a1[8];
      id v23 = a1[9];
      id v16 = v12;
      [WeakRetained translateSentence:v13 withContext:v14 completion:v17];
    }
  }
}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v26 = a3;
  os_signpost_id_t v6 = *(id *)(a1 + 32);
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v9;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v7, OS_SIGNPOST_INTERVAL_END, v8, "OfflineTranslation", "Offline: Finished translating speech result, (id: %{public}@)", buf, 0xCu);
  }

  [*(id *)(a1 + 48) responseReceived:0];
  [*(id *)(a1 + 56) timestampWithName:@"mtResultTime"];
  if (v26)
  {
    id v10 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_70_cold_1();
    }
  }
  id v11 = [v5 translations];
  id v12 = [v11 firstObject];

  id v13 = *(void **)(a1 + 56);
  v29[0] = @"mtLocale";
  id v14 = [v5 locale];
  uint64_t v15 = [v14 _ltLocaleIdentifier];
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = &stru_270C008E8;
  }
  v29[1] = @"mtBestConfidence";
  v30[0] = v17;
  uint64_t v18 = NSNumber;
  [v12 confidence];
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  v30[1] = v19;
  id v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v13 addFieldsFromDictionary:v20];

  id v21 = *(void **)(a1 + 56);
  uint64_t v27 = @"mtBestText";
  uint64_t v22 = [v12 formattedString];
  id v23 = (void *)v22;
  if (v22) {
    os_signpost_id_t v24 = (__CFString *)v22;
  }
  else {
    os_signpost_id_t v24 = &stru_270C008E8;
  }
  id v28 = v24;
  id v25 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v21 addFieldsFromDictionary:v25 internalOnly:1];

  [*(id *)(a1 + 64) translatorDidTranslate:v5];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 6));
    if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] > 1
      || !+[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:*(void *)(a1 + 32) lidResult:*(void *)(*(void *)(a1 + 40) + 88)])
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
        if (!*(unsigned char *)(v5 + 24))
        {
          *(unsigned char *)(v5 + 24) = 1;
          if (!v4[64] || v4[65]) {
            [*(id *)(a1 + 48) translationDidFinishWithError:v6];
          }
          if (v6) {
            [*(id *)(a1 + 56) addFieldsWithError:v6];
          }
          [*(id *)(a1 + 56) sendLazy];
        }
      }
    }
  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 88));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[6]);
    os_signpost_id_t v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Starting speech translation with offline engine", buf, 2u);
    }
    uint64_t v9 = _LTOSLogTranslationEngine();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);
    id v11 = v9;
    id v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v13;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "OfflineTranslation", "Offline: Translating speech result, (id: %{public}@)", buf, 0xCu);
    }

    if (a3) {
      [*(id *)(a1 + 40) timestampWithName:@"mtStartTime"];
    }
    uint64_t v14 = *(void *)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_88;
    v20[3] = &unk_265547A20;
    uint64_t v15 = v12;
    id v21 = v15;
    os_signpost_id_t v31 = v10;
    id v22 = *(id *)(a1 + 32);
    id v23 = v7;
    char v32 = a3;
    id v24 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 72);
    id v25 = v16;
    uint64_t v29 = v17;
    id v26 = v5;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 80);
    id v27 = v18;
    uint64_t v30 = v19;
    id v28 = *(id *)(a1 + 64);
    [(dispatch_queue_t *)v7 _translate:v26 withContext:v14 isFinal:1 completion:v20];
  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(id *)(a1 + 32);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 112);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v26 = v7;
    _os_signpost_emit_with_name_impl(&dword_2600DC000, v5, OS_SIGNPOST_INTERVAL_END, v6, "OfflineTranslation", "Offline: Finished translating speech result, (id: %{public}@)", buf, 0xCu);
  }

  os_signpost_id_t v8 = *(NSObject **)(*(void *)(a1 + 48) + 48);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_89;
  v14[3] = &unk_2655479F8;
  char v24 = *(unsigned char *)(a1 + 120);
  id v15 = *(id *)(a1 + 56);
  id v16 = v3;
  uint64_t v17 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 96);
  id v18 = v9;
  uint64_t v22 = v10;
  id v19 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 104);
  id v20 = v11;
  uint64_t v23 = v12;
  id v21 = *(id *)(a1 + 88);
  id v13 = v3;
  dispatch_async(v8, v14);
}

uint64_t __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_89(uint64_t a1)
{
  v24[2] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 104))
  {
    [*(id *)(a1 + 32) timestampWithName:@"mtResultTime"];
    uint64_t v2 = [*(id *)(a1 + 40) translations];
    id v3 = [v2 firstObject];

    v23[0] = @"mtLocale";
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) locale];
    uint64_t v6 = [v5 _ltLocaleIdentifier];
    uint64_t v7 = (void *)v6;
    if (v6) {
      os_signpost_id_t v8 = (__CFString *)v6;
    }
    else {
      os_signpost_id_t v8 = &stru_270C008E8;
    }
    v23[1] = @"mtBestConfidence";
    v24[0] = v8;
    id v9 = NSNumber;
    [v3 confidence];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    v24[1] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    [v4 addFieldsFromDictionary:v11];

    uint64_t v12 = *(void **)(a1 + 32);
    id v21 = @"mtBestText";
    uint64_t v13 = [v3 formattedString];
    uint64_t v14 = (void *)v13;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    else {
      id v15 = &stru_270C008E8;
    }
    uint64_t v22 = v15;
    id v16 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v12 addFieldsFromDictionary:v16 internalOnly:1];
  }
  if (!*(unsigned char *)(*(void *)(a1 + 48) + 64)) {
    [*(id *)(a1 + 56) translatorDidTranslate:*(void *)(a1 + 40)];
  }
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v19 = [*(id *)(a1 + 64) locale];
  [v18 setObject:v17 forKeyedSubscript:v19];

  if ([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count] == 2
    || !+[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:*(void *)(a1 + 72) lidResult:*(void *)(*(void *)(a1 + 48) + 88)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_91(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[6]);
    uint64_t v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Starting partial speech translation with offline engine", buf, 2u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_92;
    v8[3] = &unk_265547A70;
    void v8[4] = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [(dispatch_queue_t *)v5 _translate:v3 withContext:v7 isFinal:0 completion:v8];
  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 64)) {
    [*(id *)(a1 + 40) translatorDidTranslate:v3];
  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_94(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[6]);
    long long v56 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v53 = 0u;
    id obj = [v3 transcriptions];
    uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v54;
      *(void *)&long long v5 = 134218496;
      long long v43 = v5;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v54 != v6) {
            objc_enumerationMutation(obj);
          }
          os_signpost_id_t v8 = *(void **)(*((void *)&v53 + 1) + 8 * v7);
          if (objc_msgSend(v3, "isFinal", v43))
          {
            id v9 = [v3 locale];
            dispatch_queue_t v10 = WeakRetained[1];
            id v11 = [v3 locale];
            uint64_t v12 = [v10 speechModelVersionForLocale:v11];
            uint64_t v13 = _LTPreferencesOfflineASRConfidenceThreshold(v9, v12);

            uint64_t v14 = (id)_LTOSLogTranslationEngine();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              dispatch_queue_t v22 = WeakRetained[1];
              uint64_t v23 = [v3 locale];
              char v24 = [v22 speechModelVersionForLocale:v23];
              *(_DWORD *)buf = 138543362;
              v58 = v24;
              _os_log_debug_impl(&dword_2600DC000, v14, OS_LOG_TYPE_DEBUG, "ModelVersion %{public}@", buf, 0xCu);
            }
            if (([*(id *)(a1 + 32) asrConfidenceThreshold] & 0x8000000000000000) == 0) {
              uint64_t v13 = [*(id *)(a1 + 32) asrConfidenceThreshold];
            }
            [v8 confidence];
            [v8 setLowConfidence:v15 <= (double)v13];
            id v16 = (id)_LTOSLogTranslationEngine();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              [v8 confidence];
              uint64_t v26 = v25;
              int v27 = [v8 isLowConfidence];
              *(_DWORD *)buf = v43;
              v58 = v26;
              __int16 v59 = 1024;
              int v60 = v27;
              __int16 v61 = 2048;
              uint64_t v62 = v13;
              _os_log_debug_impl(&dword_2600DC000, v16, OS_LOG_TYPE_DEBUG, "LowConfidence (%f): %d with threshold %ld", buf, 0x1Cu);
            }
          }
          if ([*(id *)(a1 + 32) censorSpeech])
          {
            dispatch_queue_t v17 = WeakRetained[4];
            if (v17)
            {
              id v18 = [v8 locale];
              id v19 = [v17 objectForKeyedSubscript:v18];

              id v20 = [v8 formattedString];
              id v21 = [v19 sanitizedStringForString:v20];
              [v8 setSanitizedFormattedString:v21];
            }
          }
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v4);
    }

    if (!*((unsigned char *)WeakRetained + 64)) {
      [*(id *)(a1 + 40) speechRecognitionResult:v3];
    }
    if ([v3 isFinal])
    {
      id v28 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v29 = [v3 locale];
      [v28 setObject:v3 forKeyedSubscript:v29];

      uint64_t v30 = *(void **)(a1 + 48);
      os_signpost_id_t v31 = *(void **)(a1 + 32);
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_95;
      v46[3] = &unk_265547AC0;
      v46[4] = WeakRetained;
      id v32 = v31;
      uint64_t v33 = *(void *)(a1 + 88);
      id v47 = v32;
      uint64_t v51 = v33;
      id v34 = *(id *)(a1 + 56);
      uint64_t v35 = *(void *)(a1 + 96);
      id v48 = v34;
      uint64_t v52 = v35;
      id v49 = *(id *)(a1 + 72);
      id v50 = *(id *)(a1 + 80);
      [v30 _waitForLIDWithContext:v32 completion:v46];
    }
    else if ([v3 isStable])
    {
      if ([*(id *)(a1 + 32) autodetectLanguage])
      {
        dispatch_queue_t v36 = WeakRetained[10];
        id v37 = [v3 locale];
        if (([v36 _ltEqual:v37] & 1) != 0
          || (dispatch_queue_t v38 = WeakRetained[11]) != 0 && ![v38 isConfident])
        {
        }
        else
        {
          if (![*(id *)(a1 + 32) forceSourceLocale])
          {

            goto LABEL_34;
          }
          uint64_t v39 = [*(id *)(a1 + 32) localePair];
          long long v40 = [v39 sourceLocale];
          long long v41 = [v3 locale];
          char v42 = [v40 _ltEqual:v41];

          if ((v42 & 1) == 0) {
            goto LABEL_34;
          }
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
LABEL_34:
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_95(uint64_t a1)
{
  v42[4] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
  BOOL v2 = +[_LTOfflineTranslationEngine _needToWaitForBothFinalTranslationResultsWithContext:*(void *)(a1 + 40) lidResult:*(void *)(*(void *)(a1 + 32) + 88)];
  uint64_t v3 = [*(id *)(a1 + 32) _getBestRecognitionResult:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) context:*(void *)(a1 + 40)];
  uint64_t v4 = (void *)v3;
  if (v3) {
    char v5 = 1;
  }
  else {
    char v5 = v2;
  }
  if (v5)
  {
    if (v3)
    {
      [*(id *)(a1 + 48) timestampWithName:@"asrResultTime"];
      uint64_t v6 = (id)_LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        [v4 locale];
        [(id)objc_claimAutoreleasedReturnValue() localeIdentifier];
        objc_claimAutoreleasedReturnValue();
        __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_95_cold_1();
      }

      uint64_t v7 = *(void **)(a1 + 48);
      v41[0] = @"asrLocale";
      os_signpost_id_t v8 = [v4 locale];
      uint64_t v9 = [v8 _ltLocaleIdentifier];
      dispatch_queue_t v10 = (void *)v9;
      if (v9) {
        id v11 = (__CFString *)v9;
      }
      else {
        id v11 = @"unknown";
      }
      v41[1] = @"asrBestConfidence";
      v42[0] = v11;
      uint64_t v12 = NSNumber;
      uint64_t v13 = [v4 bestTranscription];
      [v13 confidence];
      uint64_t v14 = objc_msgSend(v12, "numberWithDouble:");
      v42[1] = v14;
      double v15 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
      [v7 addFieldsFromDictionary:v15];

      id v16 = *(void **)(a1 + 48);
      uint64_t v39 = @"asrBestText";
      dispatch_queue_t v17 = [v4 bestTranscription];
      uint64_t v18 = [v17 formattedString];
      id v19 = (void *)v18;
      id v20 = &stru_270C008E8;
      if (v18) {
        id v20 = (__CFString *)v18;
      }
      long long v40 = v20;
      id v21 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [v16 addFieldsFromDictionary:v21 internalOnly:1];
    }
    if (v2)
    {
      dispatch_queue_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allValues];
    }
    else
    {
      dispatch_queue_t v38 = v4;
      dispatch_queue_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v24);
          }
          id v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v29 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          uint64_t v30 = objc_msgSend(v28, "locale", (void)v33);
          LOBYTE(v29) = [v29 containsObject:v30];

          if ((v29 & 1) == 0)
          {
            (*(void (**)(void, void *, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v28, v28 == v4);
            os_signpost_id_t v31 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            id v32 = [v28 locale];
            [v31 addObject:v32];
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v25);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v23 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_95_cold_2();
    }
  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_111(id *a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained(a1 + 8);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 64) = 0;
    [WeakRetained _loadRecognizersWithContext:a1[4]];
    if ([a1[4] censorSpeech]) {
      [v3 _loadEtiquetteSanitizers];
    }
    uint64_t v4 = v3[13];
    if (v4)
    {
      if (!*((unsigned char *)v3 + 64) || *((unsigned char *)v3 + 65))
      {
        objc_msgSend(a1[5], "translationDidFinishWithError:");
        uint64_t v4 = v3[13];
      }
      [a1[6] addFieldsWithError:v4];
      [a1[6] sendLazy];
    }
    else
    {
      [a1[4] taskHint];
      char v5 = _LTTranslationModelTaskString();
      [v3 _loadTranslatorForTask:v5];
      uint64_t v6 = (void *)v3[11];
      v3[11] = 0;

      uint64_t v7 = (void *)v3[9];
      v3[9] = 0;

      os_signpost_id_t v8 = (void *)v3[10];
      v3[10] = 0;

      *((unsigned char *)v3 + 96) = 0;
      if ([a1[4] autodetectLanguage])
      {
        uint64_t v9 = 0;
      }
      else
      {
        dispatch_queue_t v10 = [a1[4] localePair];
        uint64_t v9 = [v10 sourceLocale];
      }
      if (![a1[4] autodetectLanguage]
        || [a1[4] forceSourceLocale])
      {
        id v11 = [a1[4] localePair];
        uint64_t v12 = [v11 sourceLocale];
        [v3 _translatePrepare:v12];
      }
      uint64_t v13 = (void *)v3[2];
      uint64_t v14 = [a1[4] autoEndpoint];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_112;
      v15[3] = &unk_265547B38;
      v15[4] = v3;
      id v16 = a1[5];
      id v17 = a1[6];
      id v18 = a1[7];
      [v13 startRecognitionForLocale:v9 autoEndpoint:v14 resultHandler:v15];
    }
  }
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_112(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  os_signpost_id_t v8 = *(NSObject **)(v7 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_3;
  v12[3] = &unk_265547B10;
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v17 = v5;
  id v18 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

uint64_t __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v3 + 64) || *(unsigned char *)(v3 + 65))
    {
      objc_msgSend(*(id *)(a1 + 48), "translationDidFinishWithError:");
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [*(id *)(a1 + 56) addFieldsWithError:v2];
    uint64_t v4 = *(void **)(a1 + 56);
    return [v4 sendLazy];
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v6();
  }
}

void __39___LTOfflineTranslationEngine_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained[2] endAudio];
    [WeakRetained[3] cancel];
  }
}

void __49___LTOfflineTranslationEngine_cancelRecognition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 64) = 1;
    *((unsigned char *)WeakRetained + 65) = *(unsigned char *)(a1 + 40);
    [*((id *)WeakRetained + 2) cancelRecognition];
  }
}

void __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke_60_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v0, v1, "Failed to translate paragraphs with offline engine: %@", v2);
}

void __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_70_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v0, v1, "Error translating sentence with offline engine: %@", v2);
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_5_1(v2, v3, 5.8381e-34);
  _os_log_debug_impl(&dword_2600DC000, v4, OS_LOG_TYPE_DEBUG, "Best recognition: %{public}@", v5, 0xCu);
}

void __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_95_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Unable to request final translation yet missing relevant ASR result based on confident acoustic LID result", v1, 2u);
}

@end