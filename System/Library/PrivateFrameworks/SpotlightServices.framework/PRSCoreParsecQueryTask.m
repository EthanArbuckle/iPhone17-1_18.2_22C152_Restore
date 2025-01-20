@interface PRSCoreParsecQueryTask
- (BOOL)needsBag;
- (PARTask)task;
- (PRSCoreParsecQueryTask)initWithSession:(id)a3 parsecSession:(id)a4 handler:(id)a5 queue:(id)a6 queryContext:(id)a7 queryIdent:(unint64_t)a8;
- (SPSearchSuggestionResult)suggestionResult;
- (void)handleResults:(id)a3;
- (void)resume;
- (void)setParsecState:(BOOL)a3;
- (void)setSuggestionResult:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation PRSCoreParsecQueryTask

- (BOOL)needsBag
{
  return 0;
}

- (void)setParsecState:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (PRSCoreParsecQueryTask)initWithSession:(id)a3 parsecSession:(id)a4 handler:(id)a5 queue:(id)a6 queryContext:(id)a7 queryIdent:(unint64_t)a8
{
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PRSCoreParsecQueryTask;
  v16 = [(PRSQueryTask *)&v19 initWithSession:a3 handler:a5 queue:a6 feedback:0 queryContext:a7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parSession, a4);
    [(PRSQueryTask *)v17 setQueryIdent:a8];
  }

  return v17;
}

- (void)handleResults:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v3 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [v27 sections];
    v5 = [v27 suggestions];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v27;
    __int16 v39 = 2112;
    v40 = v4;
    __int16 v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_1BDB2A000, v3, OS_LOG_TYPE_INFO, "Response: %@ (%@ %@)", buf, 0x20u);
  }
  v6 = [v27 rawSqf];
  [(PRSQueryTask *)self setCategory_stats:v6];

  v7 = [v27 serverFeatures];
  [(PRSQueryTask *)self setServer_features:v7];

  v8 = [v27 engagementSignal];
  [(PRSQueryTask *)self setEngagementSignal:v8];

  v29 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v9 = [v27 results];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    int v12 = 1055286886;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "sectionBundleIdentifier", v27);
        if ([v15 isEqualToString:@"com.apple.parsec.web_index"])
        {
          v16 = [v14 identifier];
          BOOL v17 = v16 == 0;

          if (v17) {
            continue;
          }
          v18 = [v14 serverFeatures];
          id v15 = [v18 objectForKey:@"relevance_score"];

          if (v15)
          {
            objc_super v19 = [v14 identifier];
            [v29 setObject:v15 forKeyedSubscript:v19];
          }
          v20 = [v14 serverFeatures];
          v21 = [v20 objectForKey:@"local_intent_threshold"];

          if (v21)
          {
            [v21 floatValue];
            int v12 = v22;
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (!v10) {
        goto LABEL_20;
      }
    }
  }
  int v12 = 1055286886;
LABEL_20:

  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v29];
  [(PRSQueryTask *)self setServerRelevanceScores:v23];

  LODWORD(v24) = v12;
  [(PRSQueryTask *)self setServerRelevanceScoreThreshold:v24];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v25 = [(PRSQueryTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PRSCoreParsecQueryTask_handleResults___block_invoke;
  block[3] = &unk_1E635B1B8;
  objc_copyWeak(&v32, (id *)buf);
  block[4] = self;
  id v31 = v27;
  id v26 = v27;
  dispatch_async(v25, block);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

void __40__PRSCoreParsecQueryTask_handleResults___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained handler];
    if (v4)
    {
      if (objc_opt_respondsToSelector()) {
        [v4 queryDidFinishLoading:a1[4]];
      }
      if (objc_opt_respondsToSelector())
      {
        v5 = [a1[5] geoUserSessionEntity];
        v6 = [v5 sessionEntityString];
        [v4 geoUserSessionEntityString:v6];
      }
    }
    v7 = objc_opt_new();
    v8 = [a1[5] sections];

    if (v8)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v9 = objc_msgSend(a1[5], "sections", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
            if (v14)
            {
              id v15 = [*(id *)(*((void *)&v24 + 1) + 8 * v13) bundleIdentifier];

              if (v15)
              {
                v16 = [v14 bundleIdentifier];
                [v7 addObject:v16];
              }
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }
    }
    BOOL v17 = [v7 array];
    [a1[4] setParsecCategoryOrder:v17];

    if (v4)
    {
      id v18 = a1[4];
      objc_super v19 = [a1[5] sections];
      v20 = [a1[5] suggestions];
      v21 = [a1[5] corrections];
      int v22 = [a1[5] alternativeResults];
      objc_msgSend(v4, "query:didFinishWithResults:withSuggestions:withCorrections:withAlternativeResults:suggestionsAreBlended:", v18, v19, v20, v21, v22, objc_msgSend(a1[5], "suggestionsAreBlended"));
    }
    v23 = [a1[4] session];
    [v23 queryCompleted:a1[4]];
  }
}

- (void)resume
{
}

void __32__PRSCoreParsecQueryTask_resume__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ((uint64_t (*)(void))*MEMORY[0x1E4F77EB0])();
  long long v16 = *(_OWORD *)v10;
  long long v17 = *(_OWORD *)(v10 + 16);
  uint64_t v18 = *(void *)(v10 + 32);
  uint64_t v11 = *(void *)(a1 + 72);
  long long v12 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v10 + 16) = v12;
  *(void *)(v10 + 32) = v11;
  uint64_t v13 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [v8 rawResponse];
    *(_DWORD *)buf = 138412802;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    long long v24 = v15;
    _os_log_debug_impl(&dword_1BDB2A000, v13, OS_LOG_TYPE_DEBUG, "callback on %@ with response %@ raw:%@", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleResults:v8];

  *(_OWORD *)uint64_t v10 = v16;
  *(_OWORD *)(v10 + 16) = v17;
  *(void *)(v10 + 32) = v18;
}

- (SPSearchSuggestionResult)suggestionResult
{
  return self->_suggestionResult;
}

- (void)setSuggestionResult:(id)a3
{
}

- (PARTask)task
{
  return (PARTask *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_suggestionResult, 0);
  objc_storeStrong((id *)&self->_parSession, 0);
}

@end