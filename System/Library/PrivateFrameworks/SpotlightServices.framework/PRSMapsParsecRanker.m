@interface PRSMapsParsecRanker
+ (id)sharedMapsParsecRanker;
- (BOOL)isResultCandidateForPromotion:(id)a3;
- (PRSMapsParsecRanker)init;
- (PRSMapsParsecRanker)initWithRankerEnabled:(BOOL)a3 visitCountThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 lastVisitDaysThreshold:(double)a6 entityRelevanceThreshold:(double)a7 enableEntityRelevance:(BOOL)a8;
- (id)_parseMUIDFromResultIdentifier:(id)a3;
- (id)_rerankMapsResults:(id)a3 withRankedEvents:(id)a4 withMuidToResultIndex:(id)a5;
- (id)_tagSearchResults:(id)a3 withTopMatchFromEvents:(id)a4 muidToResultIndex:(id)a5;
- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4;
- (void)_emitRerankNotNeededSignpost;
- (void)_emitRerankSuccessfulSignpost;
- (void)_logTriggerIfNecessary:(id)a3 queryId:(int64_t)a4;
- (void)init;
@end

@implementation PRSMapsParsecRanker

+ (id)sharedMapsParsecRanker
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!sharedMapsParsecRanker_mapsParsecRanker)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)sharedMapsParsecRanker_mapsParsecRanker;
    sharedMapsParsecRanker_mapsParsecRanker = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedMapsParsecRanker_mapsParsecRanker;
  return v5;
}

- (PRSMapsParsecRanker)init
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)PRSMapsParsecRanker;
  v2 = [(PRSMapsParsecRanker *)&v34 init];
  if (!v2)
  {
LABEL_26:
    v24 = v2;
    goto LABEL_27;
  }
  uint64_t v3 = SSDefaultsGetResources();
  v4 = objc_opt_new();
  id v33 = 0;
  int v5 = [v3 BOOLeanForKey:@"MapsParsecRankerEnabled" didFailWithError:&v33];
  id v6 = v33;
  if (v6) {
    [v4 addObject:@"MapsParsecRankerEnabled"];
  }
  else {
    v2->_rankerEnabled = v5;
  }
  id v32 = v6;
  int v7 = [v3 BOOLeanForKey:@"MapsParsecRankerEntityRelevanceEnabled" didFailWithError:&v32];
  id v8 = v32;

  if (v8) {
    [v4 addObject:@"MapsParsecRankerEntityRelevanceEnabled"];
  }
  else {
    v2->_entityRelevanceEnabled = v7;
  }
  id v31 = v8;
  [v3 doubleForKey:@"MapsParsecRankerVisitCountThreshold" didFailWithError:&v31];
  double v10 = v9;
  id v11 = v31;

  if (v11) {
    [v4 addObject:@"MapsParsecRankerVisitCountThreshold"];
  }
  else {
    v2->_visitCountThreshold = v10;
  }
  id v30 = v11;
  [v3 doubleForKey:@"MapsParsecRankerLastVisitDaysThreshold" didFailWithError:&v30];
  double v13 = v12;
  id v14 = v30;

  if (v14) {
    [v4 addObject:@"MapsParsecRankerLastVisitDaysThreshold"];
  }
  else {
    v2->_lastVisitDaysThreshold = v13;
  }
  id v29 = v14;
  [v3 doubleForKey:@"MapsParsecRankerVisitCountGivenLocationThreshold" didFailWithError:&v29];
  double v16 = v15;
  id v17 = v29;

  if (v17) {
    [v4 addObject:@"MapsParsecRankerVisitCountGivenLocationThreshold"];
  }
  else {
    v2->_visitCountGivenLocationThreshold = v16;
  }
  id v28 = v17;
  [v3 doubleForKey:@"MapsParsecRankerEntityRelevanceThreshold" didFailWithError:&v28];
  double v19 = v18;
  id v20 = v28;

  if (!v20) {
    v2->_entityRelevanceThreshold = v19;
  }
  uint64_t v21 = [v4 count];
  v22 = PRSLogCategoryDefault();
  v23 = v22;
  if (!v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      int v36 = v5;
      __int16 v37 = 1024;
      int v38 = v7;
      __int16 v39 = 2048;
      double v40 = v19;
      __int16 v41 = 2048;
      double v42 = v10;
      __int16 v43 = 2048;
      double v44 = v13;
      __int16 v45 = 2048;
      double v46 = v16;
      _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker - Successfully loaded resources: rankerEnabled=%u, entityRelevanceEnabled=%u, entityRelevanceThreshold=%f, visitCountThreshold=%f, lastVisitDaysThreshold=%f, visitCountGivenLocationThreshold=%f", buf, 0x36u);
    }

    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F6F428]) initWithVisitCountThreshold:v2->_entityRelevanceEnabled lastVisitDaysThreshold:v2->_visitCountThreshold visitCountGivenLocationThreshold:v2->_lastVisitDaysThreshold entityRelevanceThreshold:v2->_visitCountGivenLocationThreshold enableEntityRelevance:v2->_entityRelevanceThreshold];
    iqfRanker = v2->_iqfRanker;
    v2->_iqfRanker = (IQFMapsPersonalizationRanker *)v25;

    goto LABEL_26;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[PRSMapsParsecRanker init]();
  }

  v24 = 0;
LABEL_27:

  return v24;
}

- (PRSMapsParsecRanker)initWithRankerEnabled:(BOOL)a3 visitCountThreshold:(double)a4 visitCountGivenLocationThreshold:(double)a5 lastVisitDaysThreshold:(double)a6 entityRelevanceThreshold:(double)a7 enableEntityRelevance:(BOOL)a8
{
  v19.receiver = self;
  v19.super_class = (Class)PRSMapsParsecRanker;
  id v14 = [(PRSMapsParsecRanker *)&v19 init];
  double v15 = v14;
  if (v14)
  {
    v14->_rankerEnabled = a3;
    v14->_visitCountThreshold = a4;
    v14->_visitCountGivenLocationThreshold = a5;
    v14->_lastVisitDaysThreshold = a6;
    v14->_entityRelevanceThreshold = a7;
    v14->_entityRelevanceEnabled = a8;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F6F428]) initWithVisitCountThreshold:v14->_entityRelevanceEnabled lastVisitDaysThreshold:v14->_visitCountThreshold visitCountGivenLocationThreshold:v14->_lastVisitDaysThreshold entityRelevanceThreshold:v14->_visitCountGivenLocationThreshold enableEntityRelevance:v14->_entityRelevanceThreshold];
    iqfRanker = v15->_iqfRanker;
    v15->_iqfRanker = (IQFMapsPersonalizationRanker *)v16;
  }
  return v15;
}

- (id)rerankMapsResultsWithLocalSignals:(id)a3 forQueryId:(int64_t)a4
{
  id v6 = a3;
  int v7 = objc_opt_new();
  id v8 = objc_opt_new();
  double v9 = objc_opt_new();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke;
  v30[3] = &unk_1E635A3F0;
  id v10 = v7;
  id v31 = v10;
  id v32 = self;
  id v11 = v9;
  id v33 = v11;
  id v12 = v8;
  id v34 = v12;
  [v6 enumerateObjectsUsingBlock:v30];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__9;
  id v28 = __Block_byref_object_dispose__9;
  id v29 = 0;
  id v29 = (id)objc_opt_new();
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  dispatch_time_t v14 = dispatch_time(0, 400000000);
  iqfRanker = self->_iqfRanker;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_41;
  v21[3] = &unk_1E635A418;
  v23 = &v24;
  uint64_t v16 = v13;
  v22 = v16;
  [(IQFMapsPersonalizationRanker *)iqfRanker rankedEventsForLocations:v12 completionHandler:v21];
  if (dispatch_semaphore_wait(v16, v14))
  {
    id v17 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_1BDB2A000, v17, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Timed out waiting for results from IQFRanker", v20, 2u);
    }
  }
  [(PRSMapsParsecRanker *)self _logTriggerIfNecessary:v25[5] queryId:a4];
  double v18 = [(PRSMapsParsecRanker *)self _rerankMapsResults:v10 withRankedEvents:v25[5] withMuidToResultIndex:v11];

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 32) addObject:v5];
  id v6 = [v5 resultEntity];
  int v7 = [v6 name];

  id v8 = [v5 resultEntity];
  double v9 = objc_msgSend(v8, "maps_encrypted_muid");

  if (![v9 length])
  {
    id v10 = *(void **)(a1 + 40);
    id v11 = [v5 identifier];
    uint64_t v12 = [v10 _parseMUIDFromResultIdentifier:v11];

    double v9 = (void *)v12;
  }
  if ([v9 length])
  {
    dispatch_semaphore_t v13 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      objc_super v19 = v9;
      _os_log_impl(&dword_1BDB2A000, v13, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: location with name: %@, muid: %@", (uint8_t *)&v16, 0x16u);
    }

    dispatch_time_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F6F420]) initWithMUID:v9 name:v7];
    double v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v9];

    [*(id *)(a1 + 56) addObject:v14];
  }
}

void __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_41_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_parseMUIDFromResultIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"m:"])
  {
    v4 = [v3 substringFromIndex:objc_msgSend(@"m:", "length")];
    uint64_t v5 = [v4 rangeOfString:@":"];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [v4 substringToIndex:v5];

      v4 = (void *)v6;
    }
  }
  else
  {
    int v7 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PRSMapsParsecRanker _parseMUIDFromResultIdentifier:]();
    }

    v4 = 0;
  }

  return v4;
}

- (id)_rerankMapsResults:(id)a3 withRankedEvents:(id)a4 withMuidToResultIndex:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(PRSMapsParsecRanker *)self _tagSearchResults:a3 withTopMatchFromEvents:v8 muidToResultIndex:v9];
  BOOL rankerEnabled = self->_rankerEnabled;
  uint64_t v12 = PRSLogCategoryDefault();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (rankerEnabled)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Proceeding to rerank as _rankerEnabled == 1", buf, 2u);
    }

    dispatch_time_t v14 = [v8 firstObject];
    if ([v8 count] && v14)
    {
      if ([(IQFMapsPersonalizationRanker *)self->_iqfRanker isResultCandidateForPromotion:v14])
      {
        double v15 = [v14 muid];
        int v16 = [v9 objectForKeyedSubscript:v15];

        if (v16 && (unint64_t v17 = [v16 unsignedIntegerValue], v17 < objc_msgSend(v10, "count")))
        {
          int v18 = [v16 isEqualToNumber:&unk_1F1863F38];
          objc_super v19 = PRSLogCategoryDefault();
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (!v18)
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412290;
              __int16 v43 = v16;
              _os_log_impl(&dword_1BDB2A000, v19, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: promoting entity in rank %@ to first", buf, 0xCu);
            }

            id v30 = [v10 objectAtIndexedSubscript:0];
            unsigned int v41 = [v30 preferTopPlatter];

            id v31 = [v10 objectAtIndexedSubscript:0];
            BOOL v32 = [v31 topHit] != 0;

            id v33 = [v10 objectAtIndexedSubscript:0];
            BOOL v34 = [v33 placement] != 0;

            v35 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v16, "unsignedIntegerValue"));
            objc_msgSend(v10, "removeObjectAtIndex:", objc_msgSend(v16, "unsignedIntegerValue"));
            [v10 insertObject:v35 atIndex:0];
            int v36 = [v10 objectAtIndexedSubscript:0];
            [v36 setPreferTopPlatter:v41];

            __int16 v37 = [v10 objectAtIndexedSubscript:0];
            [v37 setTopHit:v32];

            int v38 = [v10 objectAtIndexedSubscript:0];
            [v38 setPlacement:v34];

            __int16 v39 = [v10 objectAtIndexedSubscript:0];
            [v39 setDidRerankPersonalResult:1];

            [(PRSMapsParsecRanker *)self _emitRerankSuccessfulSignpost];
            id v40 = v10;

            goto LABEL_24;
          }
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BDB2A000, v19, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: the entity we want promote is already ranked first", buf, 2u);
          }
        }
        else
        {
          objc_super v19 = PRSLogCategoryDefault();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[PRSMapsParsecRanker _rerankMapsResults:withRankedEvents:withMuidToResultIndex:](v14, (uint64_t)v16, v19);
          }
        }

        [(PRSMapsParsecRanker *)self _emitRerankNotNeededSignpost];
        id v28 = v10;
LABEL_24:

        goto LABEL_25;
      }
      v22 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v24 = "PRSMapsParsecRanker: the first ranked event is not a candidate for promotion. Not re-ranking";
        uint64_t v25 = v22;
        uint32_t v26 = 2;
        goto LABEL_19;
      }
    }
    else
    {
      v22 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v23 = self->_rankerEnabled;
        *(_DWORD *)buf = 67109120;
        LODWORD(v43) = v23;
        uint64_t v24 = "PRSMapsParsecRanker: Skipping reranking as no relevant events found (_rankerEnabled == %d)";
        uint64_t v25 = v22;
        uint32_t v26 = 8;
LABEL_19:
        _os_log_impl(&dword_1BDB2A000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      }
    }

    [(PRSMapsParsecRanker *)self _emitRerankNotNeededSignpost];
    id v27 = v10;
LABEL_25:

    goto LABEL_26;
  }
  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Skipping reranking as _rankerEnabled == 0", buf, 2u);
  }

  [(PRSMapsParsecRanker *)self _emitRerankNotNeededSignpost];
  id v21 = v10;
LABEL_26:

  return v10;
}

- (id)_tagSearchResults:(id)a3 withTopMatchFromEvents:(id)a4 muidToResultIndex:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__PRSMapsParsecRanker__tagSearchResults_withTopMatchFromEvents_muidToResultIndex___block_invoke;
  v14[3] = &unk_1E635A440;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  [a4 enumerateObjectsUsingBlock:v14];
  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __82__PRSMapsParsecRanker__tagSearchResults_withTopMatchFromEvents_muidToResultIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v13 = v3;
  uint64_t v5 = [v3 muid];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  unint64_t v7 = [v6 unsignedIntegerValue];
  if (v6)
  {
    unint64_t v8 = v7;
    if (v7 < [*(id *)(a1 + 40) count])
    {
      id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
      char v10 = [v9 containsPersonalResult];

      if ((v10 & 1) == 0)
      {
        id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
        [v11 setContainsPersonalResult:1];

        id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
        [v12 setMapsPersonalizationResult:v13];
      }
    }
  }
}

- (void)_logTriggerIfNecessary:(id)a3 queryId:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = [v5 count];
      _os_log_impl(&dword_1BDB2A000, v6, OS_LOG_TYPE_DEFAULT, "PRSMapsParsecRanker: Logging trigger because successfully matched %lu rankedEvents", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v7 = SSDefaultsGetResources();
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3df1e6fb-2140-56db-8a1a-e96280d7a49b"];
    [v7 logForTrigger:v8 queryID:a4];
  }
}

- (void)_emitRerankSuccessfulSignpost
{
  v2 = logForCSLogCategoryPersonalization();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v5, OS_SIGNPOST_EVENT, v3, "rerankMapsResultsWithLocalSignalsSuccessful", (const char *)&unk_1BDC948EA, v6, 2u);
  }
}

- (void)_emitRerankNotNeededSignpost
{
  v2 = logForCSLogCategoryPersonalization();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BDB2A000, v5, OS_SIGNPOST_EVENT, v3, "rerankMapsResultsWithLocalSignalsNotNeeded", (const char *)&unk_1BDC948EA, v6, 2u);
  }
}

- (BOOL)isResultCandidateForPromotion:(id)a3
{
  return [(IQFMapsPersonalizationRanker *)self->_iqfRanker isResultCandidateForPromotion:a3];
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "PRSMapsParsecRanker - Expected resources failed to load: %@. Disabling Geo Personalization!", v2, v3, v4, v5, v6);
}

void __68__PRSMapsParsecRanker_rerankMapsResultsWithLocalSignals_forQueryId___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "PRSMapsParsecRanker: error fetching ranked events: %@", v2, v3, v4, v5, v6);
}

- (void)_parseMUIDFromResultIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, v0, v1, "PRSMapsParsecRanker: unable to fetch MUID from result identifier: %@", v2, v3, v4, v5, v6);
}

- (void)_rerankMapsResults:(void *)a1 withRankedEvents:(uint64_t)a2 withMuidToResultIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 muid];
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_ERROR, "PRSMapsParsecRanker: failed to match muid (%@) to valid indexForPromotion (%@)", v6, 0x16u);
}

@end