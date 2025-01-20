@interface ATXProactiveSuggestionFeedbackMetricsLogger
- (ATXPETEventTracker2Protocol)petEventTracker;
- (ATXProactiveSuggestionFeedbackMetricsLogger)initWithHyperParameters:(id)a3;
- (ATXProactiveSuggestionFeedbackMetricsLogger)initWithPETEventTracker:(id)a3 hyperParameters:(id)a4;
- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters;
- (void)handleNewFeedbackResult:(id)a3 previousSessionId:(id)a4;
- (void)logClientModelClientCacheAgeMetricForFeedbackResult:(id)a3;
- (void)logClientModelEngagementMetricForFeedbackResult:(id)a3;
- (void)logClientModelUICacheAgeMetricForFeedbackResult:(id)a3;
- (void)logMetricsWithTestResults:(id)a3;
- (void)logMetricsWithUIFeedbackQuery:(id)a3;
- (void)logSessionEngagementMetricForFeedbackResult:(id)a3;
@end

@implementation ATXProactiveSuggestionFeedbackMetricsLogger

- (ATXProactiveSuggestionFeedbackMetricsLogger)initWithHyperParameters:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)self initWithPETEventTracker:v5 hyperParameters:v4];

  return v6;
}

- (ATXProactiveSuggestionFeedbackMetricsLogger)initWithPETEventTracker:(id)a3 hyperParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXProactiveSuggestionFeedbackMetricsLogger;
  v9 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_petEventTracker, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
  }

  return v10;
}

- (ATXPETEventTracker2Protocol)petEventTracker
{
  return self->_petEventTracker;
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_petEventTracker, 0);
}

- (void)logMetricsWithUIFeedbackQuery:(id)a3
{
  id v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__8;
  v7[4] = __Block_byref_object_dispose__8;
  id v8 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke;
  v6[3] = &unk_1E5F01820;
  v6[4] = self;
  v6[5] = v7;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke_2;
  v5[3] = &unk_1E5F01848;
  v5[4] = self;
  [v4 enumerateUIFeedbackResultsWithBlock:v6 completionBlock:v5];
  _Block_object_dispose(v7, 8);
}

void __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = a2;
  [v3 handleNewFeedbackResult:v5 previousSessionId:v4];
  id v9 = [v5 session];

  uint64_t v6 = [v9 sessionUUID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __89__ATXProactiveSuggestionFeedbackMetricsLogger_UIFeedback__logMetricsWithUIFeedbackQuery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1AE67F000, v3, OS_LOG_TYPE_DEFAULT, "%@ - logMetricsWithUIFeedbackQuery finished processing new events with error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)logMetricsWithTestResults:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        [(ATXProactiveSuggestionFeedbackMetricsLogger *)self handleNewFeedbackResult:v11 previousSessionId:v10];
        objc_super v12 = [v11 session];
        uint64_t v7 = [v12 sessionUUID];

        ++v9;
        uint64_t v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)handleNewFeedbackResult:(id)a3 previousSessionId:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(ATXProactiveSuggestionFeedbackMetricsLogger *)self logClientModelUICacheAgeMetricForFeedbackResult:v10];
  [(ATXProactiveSuggestionFeedbackMetricsLogger *)self logClientModelClientCacheAgeMetricForFeedbackResult:v10];
  [(ATXProactiveSuggestionFeedbackMetricsLogger *)self logClientModelEngagementMetricForFeedbackResult:v10];
  if (!v6
    || ([v10 session],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 sessionUUID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v6 isEqual:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    [(ATXProactiveSuggestionFeedbackMetricsLogger *)self logSessionEngagementMetricForFeedbackResult:v10];
  }
}

- (void)logClientModelClientCacheAgeMetricForFeedbackResult:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 shownSuggestions];

  if (v5)
  {
    id v6 = [v4 engagedSuggestions];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = 1;
    }
    else
    {
      char v9 = [v4 rejectedSuggestions];
      uint64_t v10 = [v9 count];

      if (v10) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 3;
      }
    }
    v11 = [v4 shownSuggestions];
    objc_super v12 = [v11 firstObject];

    long long v13 = objc_opt_new();
    long long v14 = [v4 clientCacheUpdate];
    long long v15 = [v14 clientModelId];
    [v13 setClientModelId:v15];

    long long v16 = [v12 clientModelSpecification];
    v17 = [v16 clientModelVersion];
    [v13 setClientModelABGroup:v17];

    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
    [v13 setConsumerSubType:v18];

    [v13 setOutcomeType:v8];
    v19 = [v4 session];
    v20 = [v19 sessionEndDate];

    v21 = [v4 clientCacheUpdate];
    v22 = [v21 cacheCreationDate];

    [v20 timeIntervalSinceDate:v22];
    double v24 = v23;
    v25 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)self petEventTracker];
    [v25 trackDistributionForMessage:v13 value:v24];

    v26 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      v33 = [v13 consumerSubType];
      uint64_t v29 = [v13 outcomeType];
      if ((v29 - 1) >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = off_1E5F018A8[(int)v29 - 1];
      }
      v30 = [v13 clientModelId];
      v31 = [v13 clientModelABGroup];
      *(_DWORD *)buf = 138413570;
      id v35 = v28;
      __int16 v36 = 2112;
      v37 = v33;
      __int16 v38 = 2112;
      v39 = v32;
      __int16 v40 = 2112;
      v41 = v30;
      __int16 v42 = 2112;
      v43 = v31;
      __int16 v44 = 2048;
      double v45 = v24;
      _os_log_debug_impl(&dword_1AE67F000, v26, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelEngagementClientCacheAgeTracker with consumerSubType: %@ and outcomeType: %@ clientModelId: %@ clientModelABGroup: %@ cacheAge: %f", buf, 0x3Eu);
    }
  }
}

- (void)logClientModelUICacheAgeMetricForFeedbackResult:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 shownSuggestions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [v4 engagedSuggestions];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v10 = [v4 rejectedSuggestions];
      uint64_t v11 = [v10 count];

      if (v11) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 3;
      }
    }
    objc_super v12 = objc_opt_new();
    long long v13 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)self hyperParameters];
    long long v14 = [v13 abGroup];
    [v12 setAbGroup:v14];

    long long v15 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
    [v12 setConsumerSubType:v15];

    [v12 setOutcomeType:v9];
    long long v16 = [v4 session];
    v17 = [v16 sessionEndDate];

    uint64_t v18 = [v4 uiCacheUpdate];
    v19 = [v18 cacheCreationDate];

    [v17 timeIntervalSinceDate:v19];
    double v21 = v20;
    v22 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)self petEventTracker];
    [v22 trackDistributionForMessage:v12 value:v21];

    double v23 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      double v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = [v12 consumerSubType];
      uint64_t v27 = [v12 outcomeType];
      if ((v27 - 1) >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
        id v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v28 = off_1E5F018A8[(int)v27 - 1];
      }
      uint64_t v29 = [v12 abGroup];
      *(_DWORD *)buf = 138413314;
      id v31 = v25;
      __int16 v32 = 2112;
      v33 = v26;
      __int16 v34 = 2112;
      id v35 = v28;
      __int16 v36 = 2112;
      v37 = v29;
      __int16 v38 = 2048;
      double v39 = v21;
      _os_log_debug_impl(&dword_1AE67F000, v23, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelEngagementUICacheAgeTracker with consumerSubType: %@ and outcomeType: %@ abGroup: %@ cacheAge: %f", buf, 0x34u);
    }
  }
}

- (void)logClientModelEngagementMetricForFeedbackResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uiCacheUpdate];
  uint64_t v6 = [v4 clientCacheUpdate];
  uint64_t v7 = [v6 suggestions];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [v4 engagedSuggestions];
  uint64_t v10 = [v9 count];

  double v45 = self;
  if (!v10)
  {
    double v21 = [v4 rejectedSuggestions];
    uint64_t v22 = [v21 count];

    objc_super v12 = 0;
    if (v22) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 2;
    }
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
    double v23 = [v5 uiCache];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v25 = [v5 uiCache];
    if (isKindOfClass)
    {
      v26 = [v4 session];
      uint64_t v27 = [v26 sessionIdentifier];

      id v28 = [v25 cachedSuggestionWidgetLayouts];
      uint64_t v29 = [v28 objectForKey:v27];

      if (!v29)
      {
        v30 = [v25 cachedAppPredictionPanelLayouts];
        uint64_t v29 = [v30 objectForKey:v27];

        if (!v29)
        {
          id v31 = __atxlog_handle_feedback();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            [(ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) *)(uint64_t)v45 logClientModelEngagementMetricForFeedbackResult:v31];
          }

          uint64_t v29 = 0;
        }
      }

      if (!v29) {
        goto LABEL_29;
      }
    }
    else
    {
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) == 0
        || ([v5 uiCache], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_29:
        uint64_t v29 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          [(ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) *)(uint64_t)v45 logClientModelEngagementMetricForFeedbackResult:v29];
        }
LABEL_31:

        goto LABEL_32;
      }
    }
    v33 = objc_opt_new();
    __int16 v34 = +[ATXSuggestionLayout stringFromUILayoutType:[v29 layoutType]];
    [v33 setLayoutType:v34];

    id v35 = [v4 clientCacheUpdate];
    __int16 v36 = [v35 clientModelId];
    [v33 setClientModelId:v36];

    v37 = [v4 shownSuggestions];
    objc_msgSend(v33, "setNumSuggestionsForClientModelInLayout:", objc_msgSend(v37, "count"));

    __int16 v38 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(v4, "consumerSubType"));
    [v33 setConsumerSubType:v38];

    [v33 setEngagementType:v20];
    double v39 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)v45 hyperParameters];
    uint64_t v40 = [v39 abGroup];
    [v33 setAbGroup:v40];

    if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
      [v33 setPositionInClientModelCacheOfEngagedSuggestion:ATXBucketUInt32BetweenValuesWithRounding()];
    }
    if (v8)
    {
      v41 = [v8 clientModelSpecification];
      __int16 v42 = [v41 clientModelVersion];
      [v33 setClientModelABGroup:v42];
    }
    v43 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)v45 petEventTracker];
    [v43 trackScalarForMessage:v33];

    __int16 v44 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      [(ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) *)(uint64_t)v45 logClientModelEngagementMetricForFeedbackResult:v44];
    }

    goto LABEL_31;
  }
  uint64_t v11 = [v4 engagedSuggestions];
  objc_super v12 = [v11 firstObject];

  long long v13 = [v4 clientCacheUpdate];
  long long v14 = [v13 suggestions];
  unint64_t v15 = [v14 indexOfObject:v12];

  long long v16 = [v4 session];
  v17 = [v16 engagedUUIDs];
  uint64_t v18 = [v12 uuid];
  char v19 = [v17 containsObject:v18];

  uint64_t v20 = 1;
  if ((v19 & 1) != 0 || v15 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  if (v15 <= 0x18)
  {
    if (v15 <= 7) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = 8;
    }
    goto LABEL_12;
  }
LABEL_32:
}

- (void)logSessionEngagementMetricForFeedbackResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 session];
  uint64_t v6 = [v5 shownUUIDs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [v4 session];
    uint64_t v9 = [v8 rejectedUUIDs];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      uint64_t v11 = 2;
    }
    else
    {
      objc_super v12 = [v4 session];
      long long v13 = [v12 engagedUUIDs];
      uint64_t v14 = [v13 count];

      if (v14) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 3;
      }
    }
    unint64_t v15 = objc_opt_new();
    long long v16 = (void *)MEMORY[0x1E4F4B680];
    v17 = [v4 session];
    uint64_t v18 = objc_msgSend(v16, "stringForConsumerSubtype:", objc_msgSend(v17, "consumerSubType"));
    [v15 setConsumerSubType:v18];

    [v15 setEngagementType:v11];
    char v19 = [(ATXProactiveSuggestionFeedbackMetricsLogger *)self petEventTracker];
    [v19 trackScalarForMessage:v15];

    uint64_t v20 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      [(ATXProactiveSuggestionFeedbackMetricsLogger(UIFeedback) *)(uint64_t)self logSessionEngagementMetricForFeedbackResult:v20];
    }
  }
}

@end