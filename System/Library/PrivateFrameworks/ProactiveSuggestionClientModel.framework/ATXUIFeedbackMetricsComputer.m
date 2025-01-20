@interface ATXUIFeedbackMetricsComputer
- (ATXUIFeedbackMetricsComputer)init;
- (ATXUIFeedbackMetricsComputer)initWithUIFeedbackResultStream:(id)a3;
- (id)_computeResultForClientModel:(id)a3 query:(id)a4 publisher:(id)a5 resultSpecification:(id)a6;
- (id)_computeResultForConsumerSubType:(unsigned __int8)a3 query:(id)a4 publisher:(id)a5 resultSpecification:(id)a6;
- (id)computeResultForQuery:(id)a3 resultSpecification:(id)a4;
- (void)_updateNonTrendPlotSectionsInResult:(id)a3 withFeedbackResult:(id)a4;
- (void)_updateResultSection:(id)a3 withSuggestions:(id)a4 clientModelId:(id)a5 consumerSubType:(unsigned __int8)a6;
@end

@implementation ATXUIFeedbackMetricsComputer

- (ATXUIFeedbackMetricsComputer)init
{
  v3 = objc_opt_new();
  v4 = [(ATXUIFeedbackMetricsComputer *)self initWithUIFeedbackResultStream:v3];

  return v4;
}

- (ATXUIFeedbackMetricsComputer)initWithUIFeedbackResultStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUIFeedbackMetricsComputer;
  v6 = [(ATXUIFeedbackMetricsComputer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

- (id)computeResultForQuery:(id)a3 resultSpecification:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 clientModelType] || objc_msgSend(v6, "consumerSubType"))
  {
    stream = self->_stream;
    objc_super v9 = [v6 startDate];
    [v9 timeIntervalSinceReferenceDate];
    v10 = -[ATXBiomeProactiveSuggestionUIFeedbackResultStream publisherFromStartTime:](stream, "publisherFromStartTime:");

    if ([v6 clientModelType])
    {
      v11 = +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:", [v6 clientModelType]);
      v12 = [(ATXUIFeedbackMetricsComputer *)self _computeResultForClientModel:v11 query:v6 publisher:v10 resultSpecification:v7];
    }
    else
    {
      v12 = -[ATXUIFeedbackMetricsComputer _computeResultForConsumerSubType:query:publisher:resultSpecification:](self, "_computeResultForConsumerSubType:query:publisher:resultSpecification:", [v6 consumerSubType], v6, v10, v7);
    }
  }
  else
  {
    v14 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXUIFeedbackMetricsComputer computeResultForQuery:resultSpecification:](v14);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_computeResultForClientModel:(id)a3 query:(id)a4 publisher:(id)a5 resultSpecification:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke;
  v30[3] = &unk_1E5F00AF8;
  id v12 = v11;
  id v31 = v12;
  id v32 = v10;
  id v13 = v10;
  id v14 = a6;
  v15 = [a5 filterWithIsIncluded:v30];
  v16 = [ATXUIFeedbackMetricsResult alloc];
  v17 = [v12 startDate];
  v18 = [v12 endDate];
  v19 = [(ATXUIFeedbackMetricsResult *)v16 initWithSpecification:v14 startDate:v17 endDate:v18];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_8;
  v26[3] = &unk_1E5F00B40;
  id v27 = v12;
  v28 = self;
  v20 = v19;
  v29 = v20;
  id v21 = v12;
  id v22 = (id)[v15 sinkWithCompletion:&__block_literal_global_2 shouldContinue:v26];
  v23 = v29;
  v24 = v20;

  return v24;
}

uint64_t __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  id v5 = [v4 sessionEndDate];
  id v6 = [*(id *)(a1 + 32) startDate];
  id v7 = [v5 earlierDate:v6];
  v8 = [v3 eventBody];
  objc_super v9 = [v8 sessionEndDate];

  if (v7 == v9) {
    goto LABEL_5;
  }
  id v10 = *(void **)(a1 + 40);
  id v11 = [v3 eventBody];
  id v12 = [v11 clientModelId];
  LODWORD(v10) = [v10 isEqualToString:v12];

  if (!v10)
  {
LABEL_5:
    char v16 = 0;
  }
  else if ([*(id *)(a1 + 32) consumerSubType])
  {
    id v13 = [v3 eventBody];
    int v14 = [v13 consumerSubType];
    BOOL v15 = v14 != [*(id *)(a1 + 32) consumerSubType];

    char v16 = !v15;
  }
  else
  {
    char v16 = 1;
  }

  return v16 & 1;
}

void __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2_cold_1(v2);
    }
  }
}

BOOL __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_8(id *a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = [v3 sessionEndDate];
  id v5 = [a1[4] endDate];
  id v6 = [v4 laterDate:v5];
  id v7 = [v3 sessionEndDate];

  if (v6 != v7)
  {
    [a1[5] _updateNonTrendPlotSectionsInResult:a1[6] withFeedbackResult:v3];
    v8 = [a1[6] trendPlot];
    objc_super v9 = [v3 sessionEndDate];
    id v10 = [v8 binAtDate:v9];

    if (v10)
    {
      id v11 = [v10 data];
      id v12 = [v3 shownSuggestions];
      objc_msgSend(v11, "setImpressionCount:", objc_msgSend(v11, "impressionCount") + objc_msgSend(v12, "count"));

      id v13 = [v10 data];
      int v14 = [v3 engagedSuggestions];
      objc_msgSend(v13, "setEngagementCount:", objc_msgSend(v13, "engagementCount") + objc_msgSend(v14, "count"));

      BOOL v15 = [v10 data];
      char v16 = [v3 rejectedSuggestions];
      objc_msgSend(v15, "setRejectionCount:", objc_msgSend(v15, "rejectionCount") + objc_msgSend(v16, "count"));
    }
  }

  return v6 != v7;
}

- (id)_computeResultForConsumerSubType:(unsigned __int8)a3 query:(id)a4 publisher:(id)a5 resultSpecification:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke;
  v40[3] = &unk_1E5F00B68;
  id v12 = v10;
  id v41 = v12;
  unsigned __int8 v42 = a3;
  id v13 = [a5 filterWithIsIncluded:v40];
  int v14 = [ATXUIFeedbackMetricsResult alloc];
  BOOL v15 = [v12 startDate];
  char v16 = [v12 endDate];
  v17 = [(ATXUIFeedbackMetricsResult *)v14 initWithSpecification:v11 startDate:v15 endDate:v16];

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__1;
  v38[4] = __Block_byref_object_dispose__1;
  id v39 = [MEMORY[0x1E4F1C9C8] distantPast];
  v18 = objc_opt_new();
  v19 = objc_opt_new();
  v20 = objc_opt_new();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke_14;
  v30[3] = &unk_1E5F00B90;
  id v21 = v12;
  id v31 = v21;
  id v32 = self;
  id v22 = v17;
  v33 = v22;
  v37 = v38;
  id v23 = v18;
  id v34 = v23;
  id v24 = v19;
  id v35 = v24;
  id v25 = v20;
  id v36 = v25;
  id v26 = (id)[v13 sinkWithCompletion:&__block_literal_global_13 shouldContinue:v30];
  id v27 = v36;
  v28 = v22;

  _Block_object_dispose(v38, 8);
  return v28;
}

BOOL __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  id v5 = [v4 sessionEndDate];
  id v6 = [*(id *)(a1 + 32) startDate];
  id v7 = [v5 earlierDate:v6];
  v8 = [v3 eventBody];
  objc_super v9 = [v8 sessionEndDate];

  if (v7 == v9)
  {
    BOOL v11 = 0;
  }
  else
  {
    id v10 = [v3 eventBody];
    BOOL v11 = [v10 consumerSubType] == *(unsigned __int8 *)(a1 + 40);
  }
  return v11;
}

void __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2_cold_1(v2);
    }
  }
}

BOOL __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 eventBody];
  v4 = [v3 sessionEndDate];
  id v5 = [*(id *)(a1 + 32) endDate];
  id v6 = [v4 laterDate:v5];
  id v7 = [v3 sessionEndDate];

  if (v6 != v7)
  {
    [*(id *)(a1 + 40) _updateNonTrendPlotSectionsInResult:*(void *)(a1 + 48) withFeedbackResult:v3];
    v8 = [v3 sessionStartDate];
    char v9 = [v8 isEqualToDate:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

    if ((v9 & 1) == 0)
    {
      [*(id *)(a1 + 56) removeAllObjects];
      [*(id *)(a1 + 64) removeAllObjects];
      [*(id *)(a1 + 72) removeAllObjects];
      uint64_t v10 = [v3 sessionStartDate];
      uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    id v13 = [*(id *)(a1 + 48) trendPlot];
    int v14 = [v3 sessionEndDate];
    BOOL v15 = [v13 binAtDate:v14];

    if (v15)
    {
      v50 = v7;
      v51 = v6;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      char v16 = [v3 shownSuggestions];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v61 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            id v22 = *(void **)(a1 + 56);
            id v23 = [v21 executableIdentifier];
            LOBYTE(v22) = [v22 containsObject:v23];

            if ((v22 & 1) == 0)
            {
              id v24 = [v15 data];
              objc_msgSend(v24, "setImpressionCount:", objc_msgSend(v24, "impressionCount") + 1);

              id v25 = *(void **)(a1 + 56);
              id v26 = [v21 executableIdentifier];
              [v25 addObject:v26];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v18);
      }

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v27 = [v3 engagedSuggestions];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v57 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            v33 = *(void **)(a1 + 64);
            id v34 = [v32 executableIdentifier];
            LOBYTE(v33) = [v33 containsObject:v34];

            if ((v33 & 1) == 0)
            {
              id v35 = [v15 data];
              objc_msgSend(v35, "setEngagementCount:", objc_msgSend(v35, "engagementCount") + 1);

              id v36 = *(void **)(a1 + 64);
              v37 = [v32 executableIdentifier];
              [v36 addObject:v37];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v29);
      }

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v38 = [v3 rejectedSuggestions];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v53;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v53 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v52 + 1) + 8 * k);
            v44 = *(void **)(a1 + 72);
            v45 = [v43 executableIdentifier];
            LOBYTE(v44) = [v44 containsObject:v45];

            if ((v44 & 1) == 0)
            {
              v46 = [v15 data];
              objc_msgSend(v46, "setRejectionCount:", objc_msgSend(v46, "rejectionCount") + 1);

              v47 = *(void **)(a1 + 72);
              v48 = [v43 executableIdentifier];
              [v47 addObject:v48];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v52 objects:v64 count:16];
        }
        while (v40);
      }

      id v7 = v50;
      id v6 = v51;
    }
  }
  return v6 != v7;
}

- (void)_updateNonTrendPlotSectionsInResult:(id)a3 withFeedbackResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 sectionForShownSuggestions];
  char v9 = [v6 shownSuggestions];
  uint64_t v10 = [v6 clientModelId];
  -[ATXUIFeedbackMetricsComputer _updateResultSection:withSuggestions:clientModelId:consumerSubType:](self, "_updateResultSection:withSuggestions:clientModelId:consumerSubType:", v8, v9, v10, [v6 consumerSubType]);

  uint64_t v11 = [v7 sectionForEngagedSuggestions];
  id v12 = [v6 engagedSuggestions];
  id v13 = [v6 clientModelId];
  -[ATXUIFeedbackMetricsComputer _updateResultSection:withSuggestions:clientModelId:consumerSubType:](self, "_updateResultSection:withSuggestions:clientModelId:consumerSubType:", v11, v12, v13, [v6 consumerSubType]);

  id v17 = [v7 sectionForRejectedSuggestions];

  int v14 = [v6 rejectedSuggestions];
  BOOL v15 = [v6 clientModelId];
  uint64_t v16 = [v6 consumerSubType];

  [(ATXUIFeedbackMetricsComputer *)self _updateResultSection:v17 withSuggestions:v14 clientModelId:v15 consumerSubType:v16];
}

- (void)_updateResultSection:(id)a3 withSuggestions:(id)a4 clientModelId:(id)a5 consumerSubType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 clientModelBreakdown];
  id v27 = v11;
  objc_msgSend(v12, "incrementCountForCategory:by:", v11, objc_msgSend(v10, "count"));

  id v13 = [v9 consumerSubTypeBreakdown];
  int v14 = [NSNumber numberWithUnsignedChar:v6];
  objc_msgSend(v13, "incrementCountForCategory:by:", v14, objc_msgSend(v10, "count"));

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v10;
  uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * v18);
        v20 = [v9 scoreDistribution];
        id v21 = [v19 scoreSpecification];
        [v21 rawScore];
        objc_msgSend(v20, "recordScore:");

        id v22 = [v9 confidenceBreakdown];
        id v23 = NSNumber;
        id v24 = [v19 scoreSpecification];
        id v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "suggestedConfidenceCategory"));
        [v22 incrementCountForCategory:v25 by:1];

        unint64_t v26 = [v19 predictionReasons];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __99__ATXUIFeedbackMetricsComputer__updateResultSection_withSuggestions_clientModelId_consumerSubType___block_invoke;
        v29[3] = &unk_1E5F00BB8;
        id v30 = v9;
        ATXSuggestionPredictionReasonEnumerateReasonCodes(v26, v29);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v16);
  }
}

void __99__ATXUIFeedbackMetricsComputer__updateResultSection_withSuggestions_clientModelId_consumerSubType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) predictionReasonCodeBreakdown];
  id v3 = [NSNumber numberWithInteger:a2];
  [v4 incrementCountForCategory:v3 by:1];
}

- (void).cxx_destruct
{
}

- (void)computeResultForQuery:(os_log_t)log resultSpecification:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "ATXUIFeedbackMetricsComputer: Malformed query -- both query.clientModelType and query.consumerSubType are unknown!", v1, 2u);
}

void __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_2(&dword_1AE67F000, v2, v3, "ATXUIFeedbackMetricsComputer: Biome query completed with error %@", v4, v5, v6, v7, 2u);
}

@end