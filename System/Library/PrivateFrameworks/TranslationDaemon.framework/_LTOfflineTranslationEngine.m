@interface _LTOfflineTranslationEngine
+ (BOOL)_needToWaitForBothFinalTranslationResultsWithContext:(id)a3 lidResult:(id)a4;
- (BOOL)translatesPair:(id)a3;
- (NSArray)asrModelURLs;
- (NSURL)mtModelURL;
- (_LTLocalePair)localePair;
- (_LTOfflineTranslationEngine)initWithLocalePair:(id)a3 assetInfo:(id)a4 selfLoggingManager:(id)a5;
- (_LTTextToSpeechCache)ttsCache;
- (id)_getBestRecognitionResult:(id)a3 context:(id)a4;
- (id)_handleTranslationResults:(id)a3 withContext:(id)a4 sourceString:(id)a5;
- (id)_paragraphResultFromSentences:(id)a3;
- (void)_loadEtiquetteSanitizers;
- (void)_loadRecognizersWithContext:(id)a3;
- (void)_loadTranslatorForTask:(id)a3;
- (void)_translate:(id)a3 withContext:(id)a4 isFinal:(BOOL)a5 completion:(id)a6;
- (void)_translate:(id)a3 withContext:(id)a4 toLocale:(id)a5 paragraphResult:(id)a6 completion:(id)a7;
- (void)_translateParagraph:(id)a3 withContext:(id)a4 toLocale:(id)a5 completion:(id)a6;
- (void)_translatePrepare:(id)a3;
- (void)_translateString:(id)a3 isFinal:(BOOL)a4 withContext:(id)a5 toLocale:(id)a6 withSpans:(id)a7 completion:(id)a8;
- (void)_waitForLIDWithContext:(id)a3 completion:(id)a4;
- (void)addSpeechAudioData:(id)a3;
- (void)cancelRecognition:(BOOL)a3;
- (void)cancelSpeechTranslation:(BOOL)a3;
- (void)endAudio;
- (void)endpoint;
- (void)preheatAsynchronously:(BOOL)a3 withContext:(id)a4;
- (void)setAsrModelURLs:(id)a3;
- (void)setLanguagesRecognized:(id)a3 context:(id)a4;
- (void)setLocalePair:(id)a3;
- (void)setMtModelURL:(id)a3;
- (void)setTtsCache:(id)a3;
- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4;
- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5;
- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6;
- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation _LTOfflineTranslationEngine

- (_LTOfflineTranslationEngine)initWithLocalePair:(id)a3 assetInfo:(id)a4 selfLoggingManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_LTOfflineTranslationEngine;
  v12 = [(_LTOfflineTranslationEngine *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetInfo, a4);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.siri.translation.offline", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v13->_callbackQueue, MEMORY[0x263EF83A0]);
    objc_storeStrong((id *)&v13->_localePair, a3);
    v13->_isSpeechTranslationCancelled = 0;
    v13->_didEndpointSpeech = 0;
    objc_storeStrong((id *)&v13->_selfLoggingManager, a5);
    v16 = v13;
  }

  return v13;
}

- (BOOL)translatesPair:(id)a3
{
  id v4 = a3;
  if ([(_LTLocalePair *)self->_localePair isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    localePair = self->_localePair;
    v7 = [v4 reversedPair];
    if ([(_LTLocalePair *)localePair isEqual:v7])
    {
      char v5 = 1;
    }
    else if ([v4 isPassthrough])
    {
      v8 = [(_LTLocalePair *)self->_localePair sourceLocale];
      id v9 = [v4 sourceLocale];
      if ([v8 isEqual:v9])
      {
        char v5 = 1;
      }
      else
      {
        id v10 = [(_LTLocalePair *)self->_localePair targetLocale];
        id v11 = [v4 sourceLocale];
        char v5 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (void)_loadRecognizersWithContext:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_earError && !self->_recognizer)
  {
    char v5 = _LTOSLogTranslationEngine();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    os_signpost_id_t spid = v6;
    unint64_t v40 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadOfflineRecognizers", "Loading recognizers", buf, 2u);
    }
    v41 = v8;

    id v9 = [(_LTOfflineTranslationEngine *)self asrModelURLs];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      id v11 = (id)_LTOSLogTranslationEngine();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = [(_LTOfflineTranslationEngine *)self asrModelURLs];
        -[_LTOfflineTranslationEngine _loadRecognizersWithContext:](v12, (uint64_t)v46);
      }
    }
    v13 = [(_LTOfflineTranslationEngine *)self asrModelURLs];
    if ([v13 count])
    {
      dispatch_queue_t v14 = [(_LTOfflineTranslationEngine *)self asrModelURLs];
      [v14 objectAtIndexedSubscript:0];
    }
    else
    {
      assetInfo = self->_assetInfo;
      dispatch_queue_t v14 = [(_LTLocalePair *)self->_localePair sourceLocale];
      [(_LTSpeechTranslationAssetInfo *)assetInfo speechModelURLForLocale:v14];
    v16 = };

    v17 = [(_LTOfflineTranslationEngine *)self asrModelURLs];
    if ((unint64_t)[v17 count] >= 2)
    {
      v19 = [(_LTOfflineTranslationEngine *)self asrModelURLs];
      [v19 objectAtIndexedSubscript:1];
    }
    else
    {
      objc_super v18 = self->_assetInfo;
      v19 = [(_LTLocalePair *)self->_localePair targetLocale];
      [(_LTSpeechTranslationAssetInfo *)v18 speechModelURLForLocale:v19];
    v20 = };

    v21 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      v43 = v16;
      __int16 v44 = 2113;
      v45 = v20;
      _os_log_impl(&dword_2600DC000, v21, OS_LOG_TYPE_INFO, "Creating multi recognizer: %{private}@, %{private}@", buf, 0x16u);
    }
    v22 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:MEMORY[0x263EFFA78]];
    id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v16)
    {
      v24 = [(_LTLocalePair *)self->_localePair sourceLocale];
      [v22 setObject:v16 forKeyedSubscript:v24];

      v25 = self->_assetInfo;
      v26 = [(_LTLocalePair *)self->_localePair sourceLocale];
      v27 = [(_LTSpeechTranslationAssetInfo *)v25 speechModelVersionForLocale:v26];
      v28 = [(_LTLocalePair *)self->_localePair sourceLocale];
      [v23 setObject:v27 forKeyedSubscript:v28];
    }
    if (v20 && ([(_LTLocalePair *)self->_localePair isPassthrough] & 1) == 0)
    {
      [v4 autodetectLanguage];
      v29 = [(_LTLocalePair *)self->_localePair targetLocale];
      [v22 setObject:v20 forKeyedSubscript:v29];

      v30 = self->_assetInfo;
      v31 = [(_LTLocalePair *)self->_localePair targetLocale];
      v32 = [(_LTSpeechTranslationAssetInfo *)v30 speechModelVersionForLocale:v31];
      v33 = [(_LTLocalePair *)self->_localePair targetLocale];
      [v23 setObject:v32 forKeyedSubscript:v33];
    }
    v34 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[_LTOfflineTranslationEngine _loadRecognizersWithContext:]();
    }
    v35 = [[_LTMultilingualSpeechRecognizer alloc] initWithModelURLs:v22 modelVersions:v23];
    recognizer = self->_recognizer;
    self->_recognizer = v35;

    v37 = v41;
    v38 = v37;
    if (v40 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v38, OS_SIGNPOST_INTERVAL_END, spid, "LoadOfflineRecognizers", "Finished loading recognizers", buf, 2u);
    }
  }
}

- (void)_loadEtiquetteSanitizers
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_5_1(v2, v3, 5.8381e-34);
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v4, (uint64_t)v4, "No etiquette sanitizer available for: %{public}@", v5);
}

- (void)_loadTranslatorForTask:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(_LTLocalePair *)self->_localePair isPassthrough] & 1) == 0
    && !self->_earError
    && !self->_translator)
  {
    char v5 = _LTOSLogTranslationEngine();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);
    v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadOfflineTranslator", "Loading translator", (uint8_t *)&v23, 2u);
    }

    id v9 = [(_LTOfflineTranslationEngine *)self mtModelURL];
    if (v9)
    {
      BOOL v10 = [(_LTOfflineTranslationEngine *)self mtModelURL];
      v27[0] = v10;
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    }
    else
    {
      id v11 = [(_LTSpeechTranslationAssetInfo *)self->_assetInfo translationModelURLs];
    }

    v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v23 = 138543619;
      id v24 = v4;
      __int16 v25 = 2113;
      v26 = v11;
      _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Creating translator with task %{public}@ model URL: %{private}@", (uint8_t *)&v23, 0x16u);
    }
    v13 = (EMTTranslator *)[objc_alloc(MEMORY[0x263F3B3E0]) initWithModelURLs:v11 task:v4 skipNonFinalToCatchup:1 translatorCacheSize:_LTPreferencesTranslationEngineCacheSize()];
    translator = self->_translator;
    self->_translator = v13;

    v15 = self->_translator;
    v16 = [(_LTLocalePair *)self->_localePair targetLocale];
    v17 = [(_LTLocalePair *)self->_localePair sourceLocale];
    [(EMTTranslator *)v15 loadTranslatorFrom:v16 to:v17];

    objc_super v18 = self->_translator;
    v19 = [(_LTLocalePair *)self->_localePair sourceLocale];
    v20 = [(_LTLocalePair *)self->_localePair targetLocale];
    [(EMTTranslator *)v18 loadTranslatorFrom:v19 to:v20];

    v21 = v8;
    v22 = v21;
    if (v6 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl(&dword_2600DC000, v22, OS_SIGNPOST_INTERVAL_END, v6, "LoadOfflineTranslator", "Finished loading translator", (uint8_t *)&v23, 2u);
    }
  }
}

- (void)preheatAsynchronously:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65___LTOfflineTranslationEngine_preheatAsynchronously_withContext___block_invoke;
  v10[3] = &unk_265547550;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  v8 = (void *)MEMORY[0x26120C050](v10);
  queue = self->_queue;
  if (v4) {
    dispatch_async(queue, v8);
  }
  else {
    dispatch_sync(queue, v8);
  }
}

- (id)_handleTranslationResults:(id)a3 withContext:(id)a4 sourceString:(id)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v10 = [v8 firstObject];
  id v11 = [v10 locale];

  if (v11)
  {
    v12 = [MEMORY[0x263EFF980] array];
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __82___LTOfflineTranslationEngine__handleTranslationResults_withContext_sourceString___block_invoke;
    v30[3] = &unk_265547578;
    v28 = &v35;
    objc_copyWeak(&v35, &location);
    id v31 = v29;
    id v13 = v11;
    id v32 = v13;
    id v14 = v9;
    id v33 = v14;
    id v15 = v12;
    id v34 = v15;
    v16 = [v8 _ltCompactMap:v30];
    v17 = [MEMORY[0x263F1C190] resultWithLocale:v13 translations:v16];
    [v17 setRoute:1];
    if ([MEMORY[0x263F1C0A8] isGenderDisambiguationEnabled])
    {
      uint64_t v18 = objc_msgSend(v15, "count", &v35);
      if (v18 == [v16 count])
      {
        v19 = [objc_alloc(MEMORY[0x263F1C0B0]) initWithSourceText:v14 targetPhrases:v15 selectedPhraseIndex:0];
        id v20 = objc_alloc(MEMORY[0x263F1C0A8]);
        v41[0] = v19;
        v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
        v22 = (void *)[v20 initWithSentences:v21];

        int v23 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v38 = (uint64_t)v22;
          _os_log_impl(&dword_2600DC000, v23, OS_LOG_TYPE_INFO, "Created disambiguableResult from EMT result: %{public}@", buf, 0xCu);
        }
        [v17 setDisambiguableResult:v22];
      }
      else
      {
        v19 = (id)_LTOSLogDisambiguation();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v25 = [v15 count];
          uint64_t v26 = [v16 count];
          *(_DWORD *)buf = 134218240;
          uint64_t v38 = v25;
          __int16 v39 = 2048;
          uint64_t v40 = v26;
          _os_log_impl(&dword_2600DC000, v19, OS_LOG_TYPE_INFO, "Not creating combined disambiguation result because only %zu out of %zu candidates could create disambiguation nodes", buf, 0x16u);
        }
      }
    }
    else
    {
      id v24 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v24, OS_LOG_TYPE_INFO, "Not creating combined disambiguation result because the feature flag is off", buf, 2u);
      }
    }

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_translateString:(id)a3 isFinal:(BOOL)a4 withContext:(id)a5 toLocale:(id)a6 withSpans:(id)a7 completion:(id)a8
{
  BOOL v50 = a4;
  v80[1] = *MEMORY[0x263EF8340];
  id v57 = a3;
  id v13 = a5;
  id v58 = a6;
  id v55 = a7;
  v56 = (void (**)(id, void *))a8;
  v54 = v13;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v15 = [v57 stringByTrimmingCharactersInSet:v14];

  v53 = v15;
  if ([v15 length])
  {
    [v13 taskHint];
    v52 = _LTTranslationModelTaskString();
    -[_LTOfflineTranslationEngine _loadTranslatorForTask:](self, "_loadTranslatorForTask:");
    if ([v13 censorSpeech]) {
      [(_LTOfflineTranslationEngine *)self _loadEtiquetteSanitizers];
    }
    if (self->_earError)
    {
      v16 = [MEMORY[0x263F1C190] resultWithLocale:v58 translations:MEMORY[0x263EFFA68]];
      [v16 setRoute:1];
      v56[2](v56, v16);
    }
    else
    {
      uint64_t v18 = [(_LTOfflineTranslationEngine *)self localePair];
      v48 = [v18 oppositeToLocale:v58];

      v49 = +[_LTAnalyticsEvent timedEventWithName:@"OfflineTextTranslation"];
      [v49 setSourceLocale:v48];
      [v49 setTargetLocale:v58];
      v79 = @"sourceSentence";
      v80[0] = v57;
      v19 = [NSDictionary dictionaryWithObjects:v80 forKeys:&v79 count:1];
      val = self;
      [v49 addFieldsFromDictionary:v19 internalOnly:1];

      id v20 = _LTOSLogTranslationEngine();
      os_signpost_id_t v21 = os_signpost_id_generate(v20);
      v22 = v20;
      int v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_2600DC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "TranslateTokens", "Offline: Translating string", (uint8_t *)buf, 2u);
      }
      v46 = (void *)v21;
      uint64_t v47 = v23;

      if (v55)
      {
        id v59 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v71 = 0u;
        long long v70 = 0u;
        id v24 = v55;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v71 != v26) {
                objc_enumerationMutation(v24);
              }
              v28 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              id v29 = objc_alloc(MEMORY[0x263F3B3D0]);
              v30 = [v28 identifier];
              uint64_t v31 = [v28 range];
              id v33 = objc_msgSend(v29, "initWithIdentifier:range:doNotTranslate:", v30, v31, v32, objc_msgSend(v28, "shouldTranslate") ^ 1);
              [v59 addObject:v33];
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v78 count:16];
          }
          while (v25);
        }
      }
      else
      {
        id v59 = 0;
      }
      objc_initWeak(buf, val);
      [(EMTTranslator *)val->_translator prepareFor:v48 to:v58];
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __98___LTOfflineTranslationEngine__translateString_isFinal_withContext_toLocale_withSpans_completion___block_invoke;
      v60[3] = &unk_2655475C8;
      objc_copyWeak(v68, buf);
      id v34 = v47;
      v68[1] = v46;
      v61 = v34;
      v62 = val;
      id v35 = v54;
      id v63 = v35;
      id v36 = v57;
      id v64 = v36;
      id v65 = v58;
      id v37 = v49;
      id v66 = v37;
      v67 = v56;
      uint64_t v38 = (void *)MEMORY[0x26120C050](v60);
      if ((objc_opt_respondsToSelector() & 1) != 0 && NSClassFromString(&cfstr_Emttranslation.isa))
      {
        id v39 = objc_alloc_init(MEMORY[0x263F3B3D8]);
        objc_msgSend(v39, "setEnableDisambiguationAlternatives:", objc_msgSend(v35, "supportsGenderDisambiguation"));
        uint64_t v40 = (id)_LTOSLogTranslationEngine();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          int v41 = [v35 supportsGenderDisambiguation];
          *(_DWORD *)v76 = 67109120;
          int v77 = v41;
          _os_log_impl(&dword_2600DC000, v40, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine is translating with enableDisambiguationAlternatives: %{BOOL}i", v76, 8u);
        }

        translator = val->_translator;
        id v75 = v36;
        v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v75 count:1];
        [(EMTTranslator *)translator translateTokens:v43 isFinal:v50 spans:v59 options:v39 completion:v38];
      }
      else
      {
        __int16 v44 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v76 = 0;
          _os_log_impl(&dword_2600DC000, v44, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine doesn't have EMTTranslationOptions on current device, translating with legacy method, and not setting enableDisambiguationAlternatives", v76, 2u);
        }
        v45 = val->_translator;
        id v74 = v36;
        id v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v74 count:1];
        [(EMTTranslator *)v45 translateTokens:v39 isFinal:v50 spans:v59 completion:v38];
      }

      objc_destroyWeak(v68);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    v17 = [MEMORY[0x263F1C190] resultWithLocale:v58 translations:MEMORY[0x263EFFA68]];
    [v17 setRoute:1];
    v56[2](v56, v17);
  }
}

- (id)_paragraphResultFromSentences:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [v3 firstObject];
  v17 = [v4 locale];

  char v5 = [v3 _ltCompactMap:&__block_literal_global_20];
  id v6 = [v3 _ltCompactMap:&__block_literal_global_45];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __61___LTOfflineTranslationEngine__paragraphResultFromSentences___block_invoke_3;
  v18[3] = &unk_265547610;
  v18[4] = &v19;
  id v7 = [v3 _ltCompactMap:v18];
  if (![v7 count])
  {

    id v7 = 0;
  }
  id v8 = [v5 componentsJoinedByString:@" "];
  if (*((unsigned char *)v20 + 24))
  {
    id v9 = [v7 componentsJoinedByString:@" "];
  }
  else
  {
    id v9 = 0;
  }
  BOOL v10 = [v6 componentsJoinedByString:@" "];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F1C170]) initWithFormattedString:v8 sanitizedFormattedString:v9 confidence:0 lowConfidence:v10 romanization:0 tokens:0 preToPostITN:1.0];
  v12 = (void *)MEMORY[0x263F1C190];
  v23[0] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v14 = [v12 resultWithLocale:v17 translations:v13];

  id v15 = [MEMORY[0x263F1C0A8] combinedDisambiguableResultFromTranslationResults:v3 joinedWithString:@" "];
  [v14 setDisambiguableResult:v15];

  [v14 setRoute:1];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)_translateParagraph:(id)a3 withContext:(id)a4 toLocale:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v21 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [v11 taskHint];
  id v20 = _LTTranslationModelTaskString();
  [(_LTOfflineTranslationEngine *)self _loadTranslatorForTask:v20];
  if ([v11 censorSpeech]) {
    [(_LTOfflineTranslationEngine *)self _loadEtiquetteSanitizers];
  }
  id v13 = [v10 splitIntoSentences];
  objc_initWeak(location, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  void v27[2] = __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke;
  v27[3] = &unk_265547660;
  objc_copyWeak(&v31, location);
  id v14 = v10;
  id v28 = v14;
  id v15 = v11;
  id v29 = v15;
  id v16 = v12;
  id v30 = v16;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __83___LTOfflineTranslationEngine__translateParagraph_withContext_toLocale_completion___block_invoke_2;
  v22[3] = &unk_265547688;
  objc_copyWeak(&v26, location);
  id v17 = v14;
  id v23 = v17;
  id v18 = v15;
  id v24 = v18;
  id v19 = v21;
  id v25 = v19;
  [v13 _ltSequentialMap:v27 completion:v22];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)_translate:(id)a3 withContext:(id)a4 toLocale:(id)a5 paragraphResult:(id)a6 completion:(id)a7
{
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v23 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v15 = +[_LTAnalyticsEvent timedEventWithName:@"OfflineBatchTextTranslation"];
  id v16 = [(_LTOfflineTranslationEngine *)self localePair];
  id v17 = [v16 oppositeToLocale:v13];
  [v15 setSourceLocale:v17];

  [v15 setTargetLocale:v13];
  objc_initWeak(location, self);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke;
  v28[3] = &unk_2655476D8;
  objc_copyWeak(&v32, location);
  id v18 = v12;
  id v29 = v18;
  id v19 = v13;
  id v30 = v19;
  id v20 = v14;
  id v31 = v20;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __90___LTOfflineTranslationEngine__translate_withContext_toLocale_paragraphResult_completion___block_invoke_51;
  v25[3] = &unk_265547700;
  id v21 = v15;
  id v26 = v21;
  id v22 = v23;
  id v27 = v22;
  [v24 _ltSequentialMap:v28 completion:v25];

  objc_destroyWeak(&v32);
  objc_destroyWeak(location);
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72___LTOfflineTranslationEngine_translateSentence_withContext_completion___block_invoke;
  v15[3] = &unk_265547728;
  objc_copyWeak(&v20, &location);
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  v35[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v14 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Translate text paragraphs (block completion handler) with offline engine", (uint8_t *)&buf, 2u);
  }
  if (![v10 count]
    || ([v10 firstObject],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 text],
        id v16 = objc_claimAutoreleasedReturnValue(),
        BOOL v17 = [v16 length] == 0,
        v16,
        v15,
        v17))
  {
    id v19 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineTranslationEngine translate:withContext:paragraphResult:completion:]();
    }
    id v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v21 = (void *)MEMORY[0x263F087E8];
    v34[0] = *MEMORY[0x263F08320];
    id v22 = [v20 localizedStringForKey:@"GENERIC_FAILURE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    v35[0] = v22;
    v34[1] = *MEMORY[0x263F08338];
    id v23 = [v20 localizedStringForKey:@"INPUT_EMPTY_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
    v35[1] = v23;
    id v24 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v25 = [v21 errorWithDomain:*MEMORY[0x263F1C1D0] code:3 userInfo:v24];

    v13[2](v13, v25);
  }
  else
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __80___LTOfflineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke;
    v26[3] = &unk_265547778;
    objc_copyWeak(&v32, &buf);
    id v27 = v11;
    id v28 = self;
    id v29 = v10;
    id v30 = v12;
    id v31 = v13;
    dispatch_async(queue, v26);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&buf);
  }
}

- (void)cancelSpeechTranslation:(BOOL)a3
{
  char v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Cancel speech translation with offline engine", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55___LTOfflineTranslationEngine_cancelSpeechTranslation___block_invoke;
  v7[3] = &unk_2655477A0;
  objc_copyWeak(&v8, buf);
  BOOL v9 = a3;
  dispatch_async(queue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  if (!self->_didEndpointSpeech)
  {
    char v5 = _LTOSLogSpeech();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Add audio to offline engine", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50___LTOfflineTranslationEngine_addSpeechAudioData___block_invoke;
    v7[3] = &unk_2655477C8;
    objc_copyWeak(&v9, buf);
    id v8 = v4;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
}

- (void)endpoint
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39___LTOfflineTranslationEngine_endpoint__block_invoke;
  v4[3] = &unk_2655477F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (BOOL)_needToWaitForBothFinalTranslationResultsWithContext:(id)a3 lidResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 autodetectLanguage] & 1) == 0) {
    goto LABEL_6;
  }
  if (!v6 || ![v6 isConfident])
  {
    BOOL v12 = 1;
    goto LABEL_8;
  }
  if ([v5 forceSourceLocale])
  {
    id v7 = [v6 dominantLanguage];
    id v8 = [v7 _ltLocaleIdentifier];
    id v9 = [v5 localePair];
    id v10 = [v9 sourceLocale];
    id v11 = [v10 _ltLocaleIdentifier];
    BOOL v12 = v8 != v11;
  }
  else
  {
LABEL_6:
    BOOL v12 = 0;
  }
LABEL_8:

  return v12;
}

- (void)setLanguagesRecognized:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dominantLanguage];
  id v9 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543618;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = [v6 isConfident];
    _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Notified of LID result: %{public}@ is confident: %{BOOL}i", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62___LTOfflineTranslationEngine_setLanguagesRecognized_context___block_invoke;
  v14[3] = &unk_265547818;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v8;
  id v16 = v7;
  id v17 = v6;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (id)_getBestRecognitionResult:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 localePair];
  if ([v7 autodetectLanguage] && !objc_msgSend(v7, "forceSourceLocale"))
  {
    lidResult = self->_lidResult;
    if (lidResult
      && [(_LTLanguageDetectionResult *)lidResult isFinal]
      && ([v6 objectForKeyedSubscript:self->_lidBestResult],
          id v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      id v10 = [v6 objectForKeyedSubscript:self->_lidBestResult];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v9 = [v8 sourceLocale];
    id v10 = [v6 objectForKeyedSubscript:v9];
  }
  return v10;
}

- (void)_waitForLIDWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65___LTOfflineTranslationEngine__waitForLIDWithContext_completion___block_invoke;
  v11[3] = &unk_265547868;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [_LTOfflineSpeechSynthesizer alloc];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60___LTOfflineTranslationEngine_speak_withContext_completion___block_invoke;
  v15[3] = &unk_2655478B8;
  objc_copyWeak(&v17, &location);
  id v12 = v10;
  id v16 = v12;
  id v13 = [(_LTOfflineSpeechSynthesizer *)v11 initWithCompletion:v15];
  synthesizer = self->_synthesizer;
  self->_synthesizer = v13;

  [(_LTOfflineSpeechSynthesizer *)self->_synthesizer speak:v8 withContext:v9];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_translate:(id)a3 withContext:(id)a4 isFinal:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v35 = a4;
  id v34 = a6;
  id v11 = [v10 locale];
  if (!v11)
  {
    id v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineTranslationEngine _translate:withContext:isFinal:completion:]();
    }
    if ([v35 autodetectLanguage] && !v7)
    {
      id v13 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_LTOfflineTranslationEngine _translate:withContext:isFinal:completion:]();
      }
      goto LABEL_27;
    }
    id v14 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineTranslationEngine _translate:withContext:isFinal:completion:]();
    }
    id v15 = [v35 localePair];
    id v11 = [v15 sourceLocale];
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v16 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Starting speech translation with offline engine", (uint8_t *)buf, 2u);
  }
  id v17 = [v10 bestTranscription];
  id v18 = [(_LTOfflineTranslationEngine *)self localePair];
  int v19 = [v18 isPassthrough];

  if (v19)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke;
    block[3] = &unk_2655478E0;
    id v44 = v17;
    id v45 = v11;
    id v46 = v35;
    id v47 = v34;
    dispatch_async(queue, block);
  }
  else
  {
    objc_initWeak(buf, self);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __73___LTOfflineTranslationEngine__translate_withContext_isFinal_completion___block_invoke_2;
    v36[3] = &unk_265547930;
    objc_copyWeak(&v40, buf);
    id v37 = v10;
    id v21 = v35;
    id v38 = v21;
    BOOL v41 = v7;
    id v39 = v34;
    id v33 = (void *)MEMORY[0x26120C050](v36);
    BOOL v22 = (objc_opt_respondsToSelector() & 1) != 0 && NSClassFromString(&cfstr_Emttranslation.isa) != 0;
    [(_LTOfflineTranslationEngine *)self _translatePrepare:v11];
    if (v22)
    {
      id v23 = objc_alloc_init(MEMORY[0x263F3B3D8]);
      objc_msgSend(v23, "setEnableDisambiguationAlternatives:", objc_msgSend(v21, "supportsGenderDisambiguation"));
      id v24 = (id)_LTOSLogTranslationEngine();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = [v21 supportsGenderDisambiguation];
        *(_DWORD *)BOOL v50 = 67109120;
        int v51 = v25;
        _os_log_impl(&dword_2600DC000, v24, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine is translating with speech input and options enableDisambiguationAlternatives: %{BOOL}i", v50, 8u);
      }

      translator = self->_translator;
      id v27 = [v17 formattedString];
      v49 = v27;
      id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
      [(EMTTranslator *)translator translateTokens:v28 isFinal:v7 spans:0 options:v23 completion:v33];
    }
    else
    {
      id v29 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v50 = 0;
        _os_log_impl(&dword_2600DC000, v29, OS_LOG_TYPE_INFO, "Disambiguation: Offline engine doesn't have EMTTranslationOptions on current device, translating with legacy method, and not setting enableDisambiguationAlternatives", v50, 2u);
      }
      id v30 = self->_translator;
      id v23 = [v17 formattedString];
      id v48 = v23;
      id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
      [(EMTTranslator *)v30 translateTokens:v27 isFinal:v7 spans:0 completion:v33];
    }

    selfLoggingManager = self->_selfLoggingManager;
    id v32 = [v21 logIdentifier];
    [(_LTDSELFLoggingManager *)selfLoggingManager sendSpeechTranslationFrameworkRequestSentWithInvocationId:v32 qssSessionId:0 requestRoute:2 payloadSizeInBytes:0];

    objc_destroyWeak(&v40);
    objc_destroyWeak(buf);
  }

LABEL_27:
}

- (void)_translatePrepare:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Initialize translation with offline engine", v8, 2u);
  }
  translator = self->_translator;
  BOOL v7 = [(_LTLocalePair *)self->_localePair oppositeToLocale:v4];
  [(EMTTranslator *)translator prepareFor:v4 to:v7];
}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x263F08C38] UUID];
  id v12 = [v11 UUIDString];

  id v13 = +[_LTAnalyticsEvent timedEventWithName:@"OfflineTextToSpeechTranslation"];
  id v14 = [v8 localePair];
  id v15 = [v14 sourceLocale];
  [v13 setSourceLocale:v15];

  id v16 = [v8 localePair];
  id v17 = [v16 targetLocale];
  [v13 setTargetLocale:v17];

  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke;
  v37[3] = &unk_265547958;
  id v18 = v10;
  id v38 = v18;
  id v19 = v13;
  id v39 = v19;
  id v20 = (void *)MEMORY[0x26120C050](v37);
  objc_initWeak(&location, self);
  queue = self->_queue;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __85___LTOfflineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke_2;
  v28[3] = &unk_2655479A8;
  objc_copyWeak(&v35, &location);
  id v29 = v8;
  id v30 = v9;
  id v31 = v19;
  id v32 = v12;
  id v33 = v18;
  id v34 = v20;
  id v22 = v18;
  id v23 = v12;
  id v24 = v19;
  id v25 = v9;
  id v26 = v20;
  id v27 = v8;
  dispatch_async(queue, v28);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  v97[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08C38] UUID];
  id v9 = [v8 UUIDString];

  id v10 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = [v6 autodetectLanguage];
    LOWORD(v92) = 2114;
    *(void *)((char *)&v92 + 2) = v9;
    _os_log_impl(&dword_2600DC000, v10, OS_LOG_TYPE_INFO, "Starting offline speech translation (auto detect language: %{BOOL}i, id: %{public}@)", buf, 0x12u);
  }

  id v11 = +[_LTAnalyticsEvent timedEventWithName:@"OfflineSpeechTranslation"];
  id v12 = [v6 localePair];
  id v13 = [v12 sourceLocale];
  [v11 setSourceLocale:v13];

  id v14 = [v6 localePair];
  id v15 = [v14 targetLocale];
  [v11 setTargetLocale:v15];

  v96 = @"autodetect";
  id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "autodetectLanguage"));
  v97[0] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v97 forKeys:&v96 count:1];
  [v11 addFieldsFromDictionary:v17];

  *(void *)id buf = 0;
  *(void *)&long long v92 = buf;
  *((void *)&v92 + 1) = 0x3032000000;
  v93 = __Block_byref_object_copy__7;
  v94 = __Block_byref_object_dispose__7;
  id v95 = [MEMORY[0x263EFF9A0] dictionary];
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__7;
  v89[4] = __Block_byref_object_dispose__7;
  id v90 = [MEMORY[0x263EFF9A0] dictionary];
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = __Block_byref_object_copy__7;
  v87[4] = __Block_byref_object_dispose__7;
  id v88 = [MEMORY[0x263EFF9C0] set];
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  char v86 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  char v84 = 0;
  objc_initWeak(&location, self);
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke;
  v73[3] = &unk_2655479D0;
  objc_copyWeak(&v81, &location);
  v78 = v89;
  id v18 = v6;
  id v74 = v18;
  id v75 = self;
  v79 = v85;
  v80 = v83;
  id v19 = v7;
  id v76 = v19;
  id v20 = v11;
  id v77 = v20;
  id v21 = (void *)MEMORY[0x26120C050](v73);
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2;
  v64[3] = &unk_265547A48;
  objc_copyWeak(&v72, &location);
  id v65 = v9;
  id v22 = v20;
  id v66 = v22;
  id v23 = v18;
  id v67 = v23;
  id v24 = v19;
  id v68 = v24;
  long long v70 = v89;
  long long v71 = v85;
  id v25 = v21;
  id v69 = v25;
  id v40 = v9;
  id v26 = (void *)MEMORY[0x26120C050](v64);
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_91;
  v60[3] = &unk_265547A98;
  objc_copyWeak(&v63, &location);
  id v27 = v23;
  id v61 = v27;
  id v28 = v24;
  id v62 = v28;
  id v29 = (void *)MEMORY[0x26120C050](v60);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_2_94;
  v49[3] = &unk_265547AE8;
  objc_copyWeak(&v59, &location);
  id v30 = v27;
  id v50 = v30;
  id v31 = v28;
  id v54 = v29;
  id v57 = buf;
  id v51 = v31;
  uint64_t v52 = self;
  id v32 = v22;
  id v53 = v32;
  id v55 = v26;
  id v56 = v25;
  id v58 = v87;
  id v41 = v25;
  id v42 = v26;
  id v33 = v29;
  id v34 = (void *)MEMORY[0x26120C050](v49);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___LTOfflineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke_111;
  block[3] = &unk_265547728;
  objc_copyWeak(&v48, &location);
  id v44 = v30;
  id v45 = v31;
  id v46 = v32;
  id v47 = v34;
  id v36 = v34;
  id v37 = v32;
  id v38 = v31;
  id v39 = v30;
  dispatch_async(queue, block);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v59);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&v72);

  objc_destroyWeak(&v81);
  objc_destroyWeak(&location);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v85, 8);
  _Block_object_dispose(v87, 8);

  _Block_object_dispose(v89, 8);
  _Block_object_dispose(buf, 8);
}

- (void)endAudio
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39___LTOfflineTranslationEngine_endAudio__block_invoke;
  v4[3] = &unk_2655477F0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelRecognition:(BOOL)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___LTOfflineTranslationEngine_cancelRecognition___block_invoke;
  block[3] = &unk_2655477A0;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSArray)asrModelURLs
{
  return self->_asrModelURLs;
}

- (void)setAsrModelURLs:(id)a3
{
}

- (NSURL)mtModelURL
{
  return self->_mtModelURL;
}

- (void)setMtModelURL:(id)a3
{
}

- (_LTTextToSpeechCache)ttsCache
{
  return self->_ttsCache;
}

- (void)setTtsCache:(id)a3
{
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (void)setLocalePair:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localePair, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_mtModelURL, 0);
  objc_storeStrong((id *)&self->_asrModelURLs, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_earError, 0);
  objc_storeStrong((id *)&self->_lidResult, 0);
  objc_storeStrong((id *)&self->_lidBestResult, 0);
  objc_storeStrong((id *)&self->_lidWaitGroup, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_etiquetteSanitizers, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
}

- (void)_loadRecognizersWithContext:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v0, v1, "Failed to create recognizer: %{public}@", v2);
}

- (void)_loadRecognizersWithContext:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Offline modelVersions %{public}@", v1, 0xCu);
}

- (void)_loadRecognizersWithContext:(void *)a1 .cold.3(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_5_1((uint64_t)a1, a2, 5.808e-34);
  _os_log_debug_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEBUG, "Using model overrides as specified: %{private}@", v4, 0xCu);
}

- (void)_loadTranslatorForTask:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2600DC000, v1, OS_LOG_TYPE_ERROR, "Failed to create translator for task %{public}@: %{public}@", v2, 0x16u);
}

- (void)translate:withContext:paragraphResult:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Can't translate paragraphs because there's nothing to translate", v2, v3, v4, v5, v6);
}

- (void)_translate:withContext:isFinal:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Using context.localePair.source instead", v2, v3, v4, v5, v6);
}

- (void)_translate:withContext:isFinal:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Skipping Speech result: autodetect is on for only a partial result.", v2, v3, v4, v5, v6);
}

- (void)_translate:withContext:isFinal:completion:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Request to translate speech with no language identifier.", v2, v3, v4, v5, v6);
}

@end