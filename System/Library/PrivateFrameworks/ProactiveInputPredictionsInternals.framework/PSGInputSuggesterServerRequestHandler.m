@interface PSGInputSuggesterServerRequestHandler
- (NSString)clientProcessName;
- (PSGInputSuggesterServerRequestHandler)init;
- (PSGInputSuggesterServerRequestHandler)initWithExperimentResolver:(id)a3 metricsLogger:(id)a4;
- (_PASBundleIdResolver)bundleIdResolver;
- (id)_getExperimentConfigForLogging:(id)a3;
- (id)_mlStringsFromResponseItems:(id)a3;
- (id)_quickResponsesConfigFromPSGInputSuggestionsRequest:(id)a3;
- (id)_quickResponsesForResponseContext:(id)a3 conversationTurns:(id)a4 localeIdentifier:(id)a5 maxResponses:(unint64_t)a6 recipients:(id)a7 chunkPath:(id)a8 plistPath:(id)a9 espressoBinFilePath:(id)a10 vocabFilePath:(id)a11;
- (id)_quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6;
- (id)_wordBoundaryResponseForRequest:(id)a3 config:(id)a4;
- (id)_zkwResponseForRequest:(id)a3 config:(id)a4;
- (void)_forwardFeedbackToPortraitWithResponseItems:(id)a3 feedbackType:(unsigned int)a4;
- (void)_forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:(id)a3 request:(id)a4 isSelected:(BOOL)a5;
- (void)_logRequest:(id)a3 config:(id)a4;
- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4;
- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5;
- (void)logErrorForRequest:(id)a3 trigger:(id)a4 errorType:(unsigned __int8)a5;
- (void)logImpression:(id)a3 request:(id)a4;
- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5;
- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6;
- (void)logTrigger:(id)a3 request:(id)a4;
- (void)setBundleIdResolver:(id)a3;
- (void)setClientProcessName:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)warmUpWithCompletion:(id)a3;
@end

@implementation PSGInputSuggesterServerRequestHandler

- (void)warmUpWithCompletion:(id)a3
{
  id v3 = a3;
  if (warmUpWithCompletion___pasOnceToken25 != -1) {
    dispatch_once(&warmUpWithCompletion___pasOnceToken25, &__block_literal_global_129);
  }
  v4 = (void *)warmUpWithCompletion___pasExprOnceResult;
  v5 = (void *)MEMORY[0x263F61E38];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__PSGInputSuggesterServerRequestHandler_warmUpWithCompletion___block_invoke_2;
  v8[3] = &unk_265037C60;
  id v9 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 runAsyncOnQueue:v7 afterDelaySeconds:v8 block:0.1];
}

void __62__PSGInputSuggesterServerRequestHandler_warmUpWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  id v3 = [v2 localeIdentifier];

  v4 = [MEMORY[0x263EFF960] preferredLanguages];
  v5 = [v4 firstObject];

  if (v3)
  {
    id v6 = +[PSGExperimentResolver sharedInstance];
    [v6 warmupForLocale:v3];
  }
  if (v5 && ([v3 isEqualToString:v5] & 1) == 0)
  {
    id v7 = +[PSGExperimentResolver sharedInstance];
    [v7 warmupForLocale:v5];
  }
  v8 = psg_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23EAA9000, v8, OS_LOG_TYPE_INFO, "PSGInputSuggesterServerRequestHandler: warmUp", v10, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_metricsLogger, 0);
  objc_storeStrong((id *)&self->_experimentResolver, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

- (void)setBundleIdResolver:(id)a3
{
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setClientProcessName:(id)a3
{
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

void __62__PSGInputSuggesterServerRequestHandler_warmUpWithCompletion___block_invoke()
{
  v0 = (void *)MEMORY[0x23ED0AB80]();
  uint64_t v1 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGInputSuggesterServerRequestHandler.warmUp" qosClass:17];
  v2 = (void *)warmUpWithCompletion___pasExprOnceResult;
  warmUpWithCompletion___pasExprOnceResult = v1;
}

- (void)_forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:(id)a3 request:(id)a4 isSelected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [(PSGInputSuggesterServerRequestHandler *)self _mlStringsFromResponseItems:a3];
  if ([v9 count])
  {
    v10 = [(PSGInputSuggesterServerRequestHandler *)self _quickResponsesConfigFromPSGInputSuggestionsRequest:v8];
    if (v10)
    {
      v11 = objc_opt_new();
      v12 = v11;
      if (v5)
      {
        v13 = [v9 objectAtIndexedSubscript:0];
        [v12 registerSelectedResponse:v13 config:v10];
      }
      else
      {
        [v11 registerDisplayedResponses:v9 config:v10];
      }
    }
    else
    {
      v14 = psg_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_23EAA9000, v14, OS_LOG_TYPE_ERROR, "PSGInputSuggesterServerHandler: Could not initialize QuickResponses config for personalization feedback.", v15, 2u);
      }
    }
  }
}

- (id)_quickResponsesConfigFromPSGInputSuggestionsRequest:(id)a3
{
  experimentResolver = self->_experimentResolver;
  id v4 = a3;
  BOOL v5 = [v4 localeIdentifier];
  id v6 = [(PSGExperimentResolver *)experimentResolver getResponseSuggestionsExperimentConfig:v5 shouldDownloadAssets:0];

  id v7 = (void *)MEMORY[0x263F382A0];
  id v8 = [v4 localeIdentifier];

  uint64_t v9 = [v7 languageForLocaleIdentifier:v8];

  v10 = (void *)MEMORY[0x263F382B8];
  v11 = [v6 inferenceModelConfigPath];
  v12 = [v6 vocabFilePath];
  v13 = [v10 configWithLanguage:v9 mode:1 plistPath:v11 vocabPath:v12];

  return v13;
}

- (id)_mlStringsFromResponseItems:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_123);
}

id __69__PSGInputSuggesterServerRequestHandler__mlStringsFromResponseItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 structuredInfoSuggestion];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v5 = [v2 textualResponseSuggestion];
    BOOL v4 = v5 == 0;
  }
  id v6 = [v2 textualResponseSuggestion];
  id v7 = [v6 responseCategory];
  if ([v7 isEqualToString:*MEMORY[0x263F61928]])
  {
    int v8 = 0;
  }
  else
  {
    uint64_t v9 = [v2 textualResponseSuggestion];
    v10 = [v9 responseCategory];
    int v8 = [v10 isEqualToString:*MEMORY[0x263F61918]] ^ 1;
  }
  if ((v4 | v8))
  {
    v11 = 0;
  }
  else
  {
    v12 = [v2 textualResponseSuggestion];
    v11 = [v12 responseText];
  }
  return v11;
}

- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = psg_default_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138413058;
    id v15 = v10;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 1024;
    int v19 = v7;
    __int16 v20 = 1024;
    int v21 = v6;
    _os_log_debug_impl(&dword_23EAA9000, v11, OS_LOG_TYPE_DEBUG, "[SpeedMetric] %@, %d, %d, %d", (uint8_t *)&v14, 0x1Eu);
  }

  v12 = [(PSGExperimentResolver *)self->_experimentResolver getResponseSuggestionsExperimentConfig:v10 shouldDownloadAssets:0];
  v13 = [(PSGExperimentResolver *)self->_experimentResolver getWordBoundarySuggestionsExperimentConfig:v10 shouldDownloadAssets:0];
  [(PSGInputSuggesterMetricsLogger *)self->_metricsLogger logSpeedMetricForLocaleIdentifier:v10 messageDurationMilliseconds:v8 messageLength:v7 messageWords:v6 zkwConfig:v12 wordBoundaryConfig:v13];
}

- (void)logErrorForRequest:(id)a3 trigger:(id)a4 errorType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PSGInputSuggesterServerRequestHandler *)self _getExperimentConfigForLogging:v9];
  [(PSGInputSuggesterMetricsLogger *)self->_metricsLogger logError:v5 request:v9 trigger:v8 config:v10];
}

- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PSGInputSuggesterServerRequestHandler *)self _getExperimentConfigForLogging:v9];
  [(PSGInputSuggesterMetricsLogger *)self->_metricsLogger logEngagement:v8 request:v9 position:a5 config:v10];
  [(PSGInputSuggesterServerRequestHandler *)self _forwardFeedbackToPortraitWithResponseItems:v8 feedbackType:1];
  if (a5 && [v8 count] >= a5)
  {
    if (![v9 isDocumentEmpty]) {
      goto LABEL_6;
    }
    v11 = [v8 objectAtIndexedSubscript:a5 - 1];
    v13 = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    [(PSGInputSuggesterServerRequestHandler *)self _forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:v12 request:v9 isSelected:1];
  }
  else
  {
    v11 = psg_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = [v8 count];
      __int16 v16 = 2048;
      unint64_t v17 = a5;
      _os_log_error_impl(&dword_23EAA9000, v11, OS_LOG_TYPE_ERROR, "[ZKW-ML] Position argument expected to be between 1 and response count %lu. Position %lu is out of bounds.", buf, 0x16u);
    }
  }

LABEL_6:
}

- (void)logImpression:(id)a3 request:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(PSGInputSuggesterServerRequestHandler *)self _getExperimentConfigForLogging:v6];
  [(PSGInputSuggesterMetricsLogger *)self->_metricsLogger logImpression:v8 request:v6 config:v7];
  [(PSGInputSuggesterServerRequestHandler *)self _forwardFeedbackToPortraitWithResponseItems:v8 feedbackType:5];
  if ([v6 isDocumentEmpty]) {
    [(PSGInputSuggesterServerRequestHandler *)self _forwardFeedbackToQuickResponsesPersonalizationWithResponseItems:v8 request:v6 isSelected:0];
  }
}

- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PSGInputSuggesterServerRequestHandler *)self _getExperimentConfigForLogging:v8];
  [(PSGInputSuggesterMetricsLogger *)self->_metricsLogger logPrediction:v9 request:v8 latencyMillis:v10 config:a5];
}

- (void)logTrigger:(id)a3 request:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PSGInputSuggesterServerRequestHandler *)self _getExperimentConfigForLogging:v6];
  [(PSGInputSuggesterMetricsLogger *)self->_metricsLogger logTrigger:v7 request:v6 config:v8];
}

- (void)_forwardFeedbackToPortraitWithResponseItems:(id)a3 feedbackType:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);
  if ([v5 count])
  {
    switch(a4)
    {
      case 0u:
      case 2u:
      case 3u:
      case 4u:
        id v6 = psg_default_log_handle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          v11[0] = 67109120;
          v11[1] = a4;
          _os_log_fault_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_FAULT, "Unhandled feedback type in forwardFeedbackToPortraitWithResponseItems: %d", (uint8_t *)v11, 8u);
        }
        goto LABEL_10;
      case 1u:
        id v7 = objc_alloc(MEMORY[0x263F5D498]);
        id v8 = v5;
        id v9 = 0;
        goto LABEL_8;
      case 5u:
        id v7 = objc_alloc(MEMORY[0x263F5D498]);
        id v8 = 0;
        id v9 = v5;
LABEL_8:
        id v6 = [v7 initWithExplicitlyEngagedStrings:v8 implicitlyEngagedStrings:0 offeredStrings:v9];
        goto LABEL_9;
      default:
        id v6 = 0;
LABEL_9:
        [v6 setClientIdentifier:@"PSGPred"];
        id v10 = [MEMORY[0x263F5D530] sharedInstance];
        [v10 registerFeedback:v6 completion:0];

LABEL_10:
        break;
    }
  }
}

id __98__PSGInputSuggesterServerRequestHandler__forwardFeedbackToPortraitWithResponseItems_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 structuredInfoSuggestion];
  id v3 = [v2 portraitItem];
  BOOL v4 = [v3 value];

  return v4;
}

- (void)_logRequest:(id)a3 config:(id)a4
{
}

- (id)_getExperimentConfigForLogging:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isDocumentEmpty];
  experimentResolver = self->_experimentResolver;
  id v7 = [v4 localeIdentifier];

  if (v5) {
    [(PSGExperimentResolver *)experimentResolver getResponseSuggestionsExperimentConfig:v7 shouldDownloadAssets:0];
  }
  else {
  id v8 = [(PSGExperimentResolver *)experimentResolver getWordBoundarySuggestionsExperimentConfig:v7 shouldDownloadAssets:0];
  }

  return v8;
}

- (void)inputSuggestionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = psg_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v26 = 0;
    _os_log_debug_impl(&dword_23EAA9000, v8, OS_LOG_TYPE_DEBUG, "Server inputSuggestionsWithRequest called", v26, 2u);
  }

  id v9 = psg_default_log_handle();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = psg_default_log_handle();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23EAA9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PSGInputSuggesterServerRequestHandler_inputSuggestionsWithRequest", "", buf, 2u);
  }

  if ([v6 isDocumentEmpty])
  {
    v13 = [MEMORY[0x263F618A0] sharedInstance];
    int v14 = [v6 responseContext];
    uint64_t v15 = [v6 localeIdentifier];
    __int16 v16 = [v6 adaptationContextID];
    unint64_t v17 = [v13 localeForMessage:v14 outgoingMessageHistory:0 defaultLocale:v15 defaultLocaleLastChangedDate:0 sender:v16];

    uint64_t v18 = [(PSGExperimentResolver *)self->_experimentResolver getResponseSuggestionsExperimentConfig:v17 shouldDownloadAssets:1];
    [(PSGInputSuggesterServerRequestHandler *)self _logRequest:v6 config:v18];
    int v19 = [(PSGInputSuggesterServerRequestHandler *)self _zkwResponseForRequest:v6 config:v18];
  }
  else
  {
    experimentResolver = self->_experimentResolver;
    int v21 = [v6 localeIdentifier];
    unint64_t v17 = [(PSGExperimentResolver *)experimentResolver getWordBoundarySuggestionsExperimentConfig:v21 shouldDownloadAssets:1];

    [(PSGInputSuggesterServerRequestHandler *)self _logRequest:v6 config:v17];
    int v19 = [(PSGInputSuggesterServerRequestHandler *)self _wordBoundaryResponseForRequest:v6 config:v17];
  }

  uint64_t v22 = psg_default_log_handle();
  v23 = v22;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_23EAA9000, v23, OS_SIGNPOST_INTERVAL_END, v10, "PSGInputSuggesterServerRequestHandler_inputSuggestionsWithRequest", "", v24, 2u);
  }

  v7[2](v7, v19, 0);
}

- (id)_zkwResponseForRequest:(id)a3 config:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 responseContext];
  if ([v8 length])
  {
    id v9 = [v6 localeIdentifier];
    if ([v9 length])
    {
      os_signpost_id_t v10 = (void *)MEMORY[0x263F618A0];
      v11 = [v7 language];
      char v12 = [v10 isLanguageMismatchedForIdentifier:v9 withIdentifier:v11];

      v13 = psg_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [v7 treatmentName];
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isMLModelEnabled"));
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = (uint64_t)v14;
        __int16 v50 = 2112;
        v51 = v15;
        _os_log_impl(&dword_23EAA9000, v13, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] ML config treatment name %@ enabled %@", buf, 0x16u);
      }
      if ([v7 isMLModelEnabled])
      {
        __int16 v16 = [v7 inferenceModelFilePath];
        unint64_t v17 = [v7 inferenceModelConfigPath];
        uint64_t v18 = [v7 espressoBinFilePath];
        v44 = [v7 vocabFilePath];
        if ([v16 length]) {
          BOOL v19 = 0;
        }
        else {
          BOOL v19 = [v18 length] == 0;
        }
        if (![v17 length] || v19)
        {
          uint64_t v22 = psg_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            v43 = [v7 experimentIdentifiers];
            v37 = [v43 experimentId];
            v41 = [v7 experimentIdentifiers];
            v38 = [v41 treatmentId];
            *(_DWORD *)buf = 138412546;
            uint64_t v49 = (uint64_t)v37;
            __int16 v50 = 2112;
            v51 = v38;
            _os_log_fault_impl(&dword_23EAA9000, v22, OS_LOG_TYPE_FAULT, "[ZKW-ML] Some required file is missing for zkw experiment: %@, treatment: %@", buf, 0x16u);
          }
          __int16 v20 = 0;
        }
        else if ([v6 isResponseContextBlacklisted])
        {
          int v21 = psg_default_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23EAA9000, v21, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] suppressing suggestions since response context is blacklisted", buf, 2u);
          }

          __int16 v20 = (void *)[objc_alloc(MEMORY[0x263F618E0]) initWithResponseItems:0 explanationSet:0];
        }
        else
        {
          char v39 = v12;
          v42 = [v6 conversationTurns];
          uint64_t v23 = [v6 textualResponseLimit];
          uint64_t v24 = [v6 structuredInfoLimit] + v23;
          v25 = [v6 recipients];
          v40 = v17;
          v26 = [(PSGInputSuggesterServerRequestHandler *)self _quickResponsesForResponseContext:v8 conversationTurns:v42 localeIdentifier:v9 maxResponses:v24 recipients:v25 chunkPath:v16 plistPath:v17 espressoBinFilePath:v18 vocabFilePath:v44];

          v27 = v26;
          if ([v26 count])
          {
            v45[0] = MEMORY[0x263EF8330];
            v45[1] = 3221225472;
            v45[2] = __71__PSGInputSuggesterServerRequestHandler__zkwResponseForRequest_config___block_invoke;
            v45[3] = &unk_265037C18;
            char v47 = v39;
            id v46 = v6;
            v28 = objc_msgSend(v26, "_pas_mappedArrayWithTransform:", v45);
            v29 = psg_default_log_handle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = [v28 count];
              *(_DWORD *)buf = 134217984;
              uint64_t v49 = v30;
              _os_log_impl(&dword_23EAA9000, v29, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] Server generated zkw %tu result(s)", buf, 0xCu);
            }

            __int16 v20 = (void *)[objc_alloc(MEMORY[0x263F618E0]) initWithResponseItems:v28 explanationSet:0];
          }
          else
          {
            v31 = psg_default_log_handle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_23EAA9000, v31, OS_LOG_TYPE_DEFAULT, "[ZKW-ML] no suggestions returned from model", buf, 2u);
            }

            __int16 v20 = (void *)[objc_alloc(MEMORY[0x263F618E0]) initWithResponseItems:0 explanationSet:0];
          }
          unint64_t v17 = v40;
        }
        goto LABEL_35;
      }
      __int16 v16 = psg_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v33 = [v7 experimentIdentifiers];
        v34 = [v33 experimentId];
        v35 = [v7 experimentIdentifiers];
        v36 = [v35 treatmentId];
        *(_DWORD *)buf = 138412546;
        uint64_t v49 = (uint64_t)v34;
        __int16 v50 = 2112;
        v51 = v36;
        _os_log_debug_impl(&dword_23EAA9000, v16, OS_LOG_TYPE_DEBUG, "[ZKW-ML] ML disabled for zkw experiment: %@, treatment: %@", buf, 0x16u);
      }
    }
    else
    {
      __int16 v16 = psg_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_23EAA9000, v16, OS_LOG_TYPE_ERROR, "[ZKW-ML] Locale not specified. Bail out.", buf, 2u);
      }
    }
    __int16 v20 = 0;
LABEL_35:

    goto LABEL_36;
  }
  id v9 = psg_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_23EAA9000, v9, OS_LOG_TYPE_ERROR, "[ZKW-ML] Context not specified. Bail out.", buf, 2u);
  }
  __int16 v20 = 0;
LABEL_36:

  return v20;
}

id __71__PSGInputSuggesterServerRequestHandler__zkwResponseForRequest_config___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 proactiveTrigger];

  if (v4)
  {
    if ([v3 isConfident] && !*(unsigned char *)(a1 + 40)) {
      int v5 = (uint64_t *)MEMORY[0x263F61938];
    }
    else {
      int v5 = (uint64_t *)MEMORY[0x263F61920];
    }
    uint64_t v6 = *v5;
    id v7 = objc_alloc(MEMORY[0x263F618F0]);
    id v8 = [v3 proactiveTrigger];
    id v9 = (void *)[v7 initWithSourceType:4 category:v6 attributes:v8];

    os_signpost_id_t v10 = (void *)[objc_alloc(MEMORY[0x263F618F8]) initWithProactiveTrigger:v9 portraitItem:0 operationalItem:0];
    id v11 = objc_alloc(MEMORY[0x263F618E8]);
    char v12 = 0;
    v13 = v10;
  }
  else
  {
    if ([*(id *)(a1 + 32) shouldDisableAutoCaps]
      && ![v3 isCustomResponse])
    {
      int v14 = [v3 text];
      id v9 = [v14 localizedLowercaseString];
    }
    else
    {
      id v9 = [v3 text];
    }
    int v15 = [v3 isConfident];
    __int16 v16 = (id *)MEMORY[0x263F61928];
    if (!v15) {
      __int16 v16 = (id *)MEMORY[0x263F61918];
    }
    unint64_t v17 = (objc_class *)MEMORY[0x263F61900];
    id v18 = *v16;
    os_signpost_id_t v10 = (void *)[[v17 alloc] initWithText:v9 category:v18];

    id v11 = objc_alloc(MEMORY[0x263F618E8]);
    char v12 = v10;
    v13 = 0;
  }
  BOOL v19 = (void *)[v11 initWithTextualResponseSuggestion:v12 structuredInfoSuggestion:v13];

  return v19;
}

- (id)_wordBoundaryResponseForRequest:(id)a3 config:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contextBeforeInput];
  if ([v8 length])
  {
    id v9 = [v6 localeIdentifier];
    if ([v9 length])
    {
      if ([v7 isMLModelEnabled])
      {
        os_signpost_id_t v10 = [v7 inferenceModelConfigPath];
        id v11 = [v7 espressoBinFilePath];
        if (-[NSObject length](v10, "length") && [v11 length])
        {
          char v12 = [(PSGInputSuggesterServerRequestHandler *)self _quickTypeTriggerForContext:v8 localeIdentifier:v9 modelConfigPath:v10 espressoBinFilePath:v11];
          v13 = psg_default_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v12;
            _os_log_debug_impl(&dword_23EAA9000, v13, OS_LOG_TYPE_DEBUG, "ML model - word-boundary triggers %@", buf, 0xCu);
          }

          uint64_t v30 = v12;
          if ([v12 count])
          {
            int v14 = objc_opt_new();
            id v15 = objc_alloc(MEMORY[0x263F618F0]);
            __int16 v16 = (void *)[v15 initWithSourceType:3 category:*MEMORY[0x263F61930] attributes:v12];
            unint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F618F8]) initWithProactiveTrigger:v16 portraitItem:0 operationalItem:0];
            id v18 = (void *)[objc_alloc(MEMORY[0x263F618E8]) initWithTextualResponseSuggestion:0 structuredInfoSuggestion:v17];
            [v14 addObject:v18];
          }
          else
          {
            int v14 = 0;
          }
          __int16 v20 = psg_default_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = [v14 count];
            *(_DWORD *)buf = 134217984;
            uint64_t v33 = v21;
            _os_log_impl(&dword_23EAA9000, v20, OS_LOG_TYPE_DEFAULT, "Server generated word boundary %tu results", buf, 0xCu);
          }

          BOOL v19 = (void *)[objc_alloc(MEMORY[0x263F618E0]) initWithResponseItems:v14 explanationSet:0];
        }
        else
        {
          int v14 = psg_default_log_handle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            v31 = [v7 experimentIdentifiers];
            v27 = [v31 experimentId];
            v28 = [v7 experimentIdentifiers];
            v29 = [v28 treatmentId];
            *(_DWORD *)buf = 138412546;
            uint64_t v33 = (uint64_t)v27;
            __int16 v34 = 2112;
            v35 = v29;
            _os_log_fault_impl(&dword_23EAA9000, v14, OS_LOG_TYPE_FAULT, "Some required file is missing for word boundary experiment: %@, treatment: %@", buf, 0x16u);
          }
          BOOL v19 = 0;
        }

        goto LABEL_26;
      }
      os_signpost_id_t v10 = psg_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = [v7 experimentIdentifiers];
        uint64_t v24 = [v23 experimentId];
        v25 = [v7 experimentIdentifiers];
        v26 = [v25 treatmentId];
        *(_DWORD *)buf = 138412546;
        uint64_t v33 = (uint64_t)v24;
        __int16 v34 = 2112;
        v35 = v26;
        _os_log_debug_impl(&dword_23EAA9000, v10, OS_LOG_TYPE_DEBUG, "ML not enabled for word boundary experiment: %@, treatment: %@", buf, 0x16u);
      }
    }
    else
    {
      os_signpost_id_t v10 = psg_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_23EAA9000, v10, OS_LOG_TYPE_ERROR, "[WordBoundary-ML] Locale not specified. Bail out", buf, 2u);
      }
    }
    BOOL v19 = 0;
LABEL_26:

    goto LABEL_27;
  }
  id v9 = psg_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_23EAA9000, v9, OS_LOG_TYPE_ERROR, "[WordBoundary-ML] Context not specified. Bail out", buf, 2u);
  }
  BOOL v19 = 0;
LABEL_27:

  return v19;
}

- (id)_quickTypeTriggerForContext:(id)a3 localeIdentifier:(id)a4 modelConfigPath:(id)a5 espressoBinFilePath:(id)a6
{
  return (id)[MEMORY[0x263F38290] quickTypeTriggerForContext:a3 localeIdentifier:a4 modelConfigPath:a5 espressoBinFilePath:a6];
}

- (id)_quickResponsesForResponseContext:(id)a3 conversationTurns:(id)a4 localeIdentifier:(id)a5 maxResponses:(unint64_t)a6 recipients:(id)a7 chunkPath:(id)a8 plistPath:(id)a9 espressoBinFilePath:(id)a10 vocabFilePath:(id)a11
{
  BYTE2(v12) = 1;
  LOWORD(v12) = 257;
  return (id)objc_msgSend(MEMORY[0x263F382C8], "quickResponsesForMessage:conversationTurns:maxResponses:localeIdentifier:recipientHandles:chunkPath:plistPath:espressoBinFilePath:vocabFilePath:useContactNames:includeCustomResponses:includeResponsesToRobots:", a3, a4, a6, a5, a7, a8, a9, a10, a11, v12);
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (PSGInputSuggesterServerRequestHandler)initWithExperimentResolver:(id)a3 metricsLogger:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGInputSuggesterServerRequestHandler;
  id v9 = [(PSGInputSuggesterServerRequestHandler *)&v12 init];
  os_signpost_id_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentResolver, a3);
    objc_storeStrong((id *)&v10->_metricsLogger, a4);
  }

  return v10;
}

- (PSGInputSuggesterServerRequestHandler)init
{
  id v3 = +[PSGExperimentResolver sharedInstance];
  id v4 = objc_opt_new();
  int v5 = [(PSGInputSuggesterServerRequestHandler *)self initWithExperimentResolver:v3 metricsLogger:v4];

  return v5;
}

@end