@interface SPUISearchModel
+ (SPUISearchModel)sharedInstance;
+ (id)sharedFullZWKInstance;
+ (id)sharedGeneralInstance;
+ (void)retrieveFirstTimeExperienceTextWithReply:(id)a3;
- (BOOL)_suggestionsReadyForDisplay;
- (BOOL)forceStableResults;
- (BOOL)infinitePatience;
- (BOOL)queryComplete;
- (BOOL)queryInProgress;
- (BOOL)queryJustHasTopHits;
- (BOOL)queryPartiallyComplete;
- (BOOL)springBoardIsActive;
- (BOOL)wantsCompletions;
- (NSArray)sections;
- (SFResultSection)searchThroughSection;
- (SPQueryResponse)lastResponse;
- (SPQueryTask)queryTask;
- (SPSearchAgentDelegate)delegate;
- (int64_t)maxUISuggestions;
- (unint64_t)currentQueryId;
- (unint64_t)lastStoredQueryId;
- (void)didReceiveResponse:(id)a3;
- (void)disableUpdates;
- (void)enableUpdates;
- (void)invalidate;
- (void)invalidateQuery:(id)a3;
- (void)purgeMemory;
- (void)resultsDidBecomeInvalid:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceStableResults:(BOOL)a3;
- (void)setInfinitePatience:(BOOL)a3;
- (void)setLastResponse:(id)a3;
- (void)setLastStoredQueryId:(unint64_t)a3;
- (void)setQueryComplete:(BOOL)a3;
- (void)setQueryJustHasTopHits:(BOOL)a3;
- (void)setQueryPartiallyComplete:(BOOL)a3;
- (void)setQueryTask:(id)a3;
- (void)setSpringBoardIsActive:(BOOL)a3;
- (void)updateWithResponse:(id)a3;
@end

@implementation SPUISearchModel

+ (id)sharedGeneralInstance
{
  if (sharedGeneralInstance_onceToken != -1) {
    dispatch_once(&sharedGeneralInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sGeneralQueryModel;
  return v2;
}

- (void)setDelegate:(id)a3
{
}

+ (id)sharedFullZWKInstance
{
  if (sharedFullZWKInstance_onceToken != -1) {
    dispatch_once(&sharedFullZWKInstance_onceToken, &__block_literal_global_94);
  }
  v2 = (void *)sFullZKWQueryModel;
  return v2;
}

- (void)didReceiveResponse:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_23D2E6000, v5, v6, "Got response %@", (uint8_t *)&v7, 0xCu);
  }

  [(SPUISearchModel *)self performSelectorOnMainThread:sel_updateWithResponse_ withObject:v4 waitUntilDone:0];
}

- (void)updateWithResponse:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 task];
  os_log_type_t v6 = [(SPUISearchModel *)self queryTask];

  if (v5 == v6)
  {
    int v7 = SPLogForSPLogCategoryDefault();
    os_log_type_t v8 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v4;
      _os_log_impl(&dword_23D2E6000, v7, v8, "updateWithResponse: %@", buf, 0xCu);
    }

    id v9 = objc_alloc(MEMORY[0x263EFF980]);
    v10 = [v4 resultSections];
    v34 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v11 = objc_opt_new();
    v29 = self;
    v12 = [(SPUISearchModel *)self queryTask];
    v13 = [v12 query];
    v35 = [v13 queryContext];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v30 = v4;
    obuint64_t j = [v4 resultSections];
    uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v16 = [v15 results];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v37;
            while (2)
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v37 != v20) {
                  objc_enumerationMutation(v17);
                }
                if (!v11
                  || (v22 = *(void **)(*((void *)&v36 + 1) + 8 * j),
                      objc_opt_class(),
                      (objc_opt_isKindOfClass() & 1) != 0)
                  || ([v22 resultBundleId],
                      v23 = objc_claimAutoreleasedReturnValue(),
                      int v24 = [v23 isEqualToString:@"com.apple.searchd.suggestion"],
                      v23,
                      !v24))
                {
                  [v34 addObject:v15];
                  goto LABEL_21;
                }
                v25 = [MEMORY[0x263F78E50] buildResultWithResult:v22 queryContext:v35];
                [v11 addObject:v25];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v44 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
LABEL_21:

          if ([v11 count])
          {
            [v15 setResults:v11];
            [v34 addObject:v15];

            v11 = 0;
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v33);
    }

    id v4 = v30;
    [v30 setResultSections:v34];
    [(SPUISearchModel *)v29 setLastResponse:v30];
    uint64_t v26 = [v30 state];
    [(SPUISearchModel *)v29 setQueryPartiallyComplete:(v26 & 0xFFFFFFFFFFFFFFFELL) == 2];
    [(SPUISearchModel *)v29 setQueryJustHasTopHits:v26 == 1];
    -[SPUISearchModel setQueryComplete:](v29, "setQueryComplete:", [v30 state] == 4);
    uint64_t v27 = [v30 kind];
    if (v27 == 1)
    {
      v28 = [(SPUISearchModel *)v29 delegate];
      [v28 searchAgentFinishedQueryWithoutAdditionalResults:v29];
    }
    else
    {
      if (v27)
      {
LABEL_30:

        goto LABEL_31;
      }
      v28 = [(SPUISearchModel *)v29 delegate];
      [v28 searchAgentUpdatedResults:v29];
    }

    goto LABEL_30;
  }
LABEL_31:
}

- (SPQueryTask)queryTask
{
  return (SPQueryTask *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastResponse:(id)a3
{
}

- (void)setQueryPartiallyComplete:(BOOL)a3
{
  self->_queryPartiallyComplete = a3;
}

- (void)setQueryJustHasTopHits:(BOOL)a3
{
  self->_queryJustHasTopHits = a3;
}

- (void)setQueryComplete:(BOOL)a3
{
  self->_queryComplete = a3;
}

- (SPSearchAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPSearchAgentDelegate *)WeakRetained;
}

- (BOOL)queryPartiallyComplete
{
  return self->_queryPartiallyComplete;
}

- (NSArray)sections
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = [(SPQueryResponse *)self->_lastResponse resultSections];
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_23D2E6000, v3, v4, "Sections: %@", (uint8_t *)&v8, 0xCu);
  }
  os_log_type_t v6 = [(SPQueryResponse *)self->_lastResponse resultSections];
  return (NSArray *)v6;
}

- (BOOL)wantsCompletions
{
  v2 = [(SPUISearchModel *)self queryTask];
  uint64_t v3 = [v2 queryKind];

  return (unint64_t)(v3 - 1) < 2;
}

- (SFResultSection)searchThroughSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)queryJustHasTopHits
{
  return self->_queryJustHasTopHits;
}

- (BOOL)queryComplete
{
  return self->_queryComplete;
}

- (void)setQueryTask:(id)a3
{
}

uint64_t __40__SPUISearchModel_sharedFullZWKInstance__block_invoke()
{
  sFullZKWQueryModel = objc_alloc_init(SPUISearchModelZKW);
  return MEMORY[0x270F9A758]();
}

uint64_t __40__SPUISearchModel_sharedGeneralInstance__block_invoke()
{
  sGeneralQueryModel = objc_alloc_init(SPUISearchModelGeneral);
  return MEMORY[0x270F9A758]();
}

+ (SPUISearchModel)sharedInstance
{
  return (SPUISearchModel *)+[SPUISearchModel sharedGeneralInstance];
}

+ (void)retrieveFirstTimeExperienceTextWithReply:(id)a3
{
}

- (BOOL)queryInProgress
{
  return 0;
}

- (void)enableUpdates
{
}

- (void)disableUpdates
{
  int64_t updatesDisabled = self->_updatesDisabled;
  self->_int64_t updatesDisabled = updatesDisabled + 1;
  if (!updatesDisabled) {
    [(SPUISearchModel *)self updatesDisabled];
  }
}

- (void)purgeMemory
{
  uint64_t v3 = [(SPUISearchModel *)self queryTask];
  os_log_type_t v4 = [v3 query];
  v5 = [v4 queryContext];
  -[SPUISearchModel setLastStoredQueryId:](self, "setLastStoredQueryId:", [v5 queryIdent]);

  [(SPUISearchModel *)self setLastResponse:0];
  [(SPUISearchModel *)self setQueryTask:0];
}

- (BOOL)_suggestionsReadyForDisplay
{
  return [(SPQueryResponse *)self->_lastResponse state] != 0;
}

- (void)invalidateQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(SPUISearchModel *)self queryTask];

  if (v5 == v4)
  {
    [(SPUISearchModel *)self setLastResponse:0];
    id v6 = [(SPUISearchModel *)self delegate];
    [v6 searchAgentUpdatedResults:self];
  }
}

- (void)resultsDidBecomeInvalid:(id)a3
{
}

- (void)invalidate
{
  queryTask = self->_queryTask;
  self->_queryTask = 0;

  lastResponse = self->_lastResponse;
  self->_lastResponse = 0;

  self->_queryComplete = 0;
  *(_WORD *)&self->_queryJustHasTopHits = 0;
}

- (int64_t)maxUISuggestions
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)currentQueryId
{
  uint64_t v3 = [(SPUISearchModel *)self queryTask];
  id v4 = [v3 query];
  id v5 = [v4 queryContext];

  if (v5) {
    uint64_t v6 = [v5 queryIdent];
  }
  else {
    uint64_t v6 = [(SPUISearchModel *)self lastStoredQueryId];
  }
  unint64_t v7 = v6;

  return v7;
}

- (BOOL)springBoardIsActive
{
  return self->_springBoardIsActive;
}

- (void)setSpringBoardIsActive:(BOOL)a3
{
  self->_springBoardIsActive = a3;
}

- (BOOL)infinitePatience
{
  return self->_infinitePatience;
}

- (void)setInfinitePatience:(BOOL)a3
{
  self->_infinitePatience = a3;
}

- (BOOL)forceStableResults
{
  return self->_forceStableResults;
}

- (void)setForceStableResults:(BOOL)a3
{
  self->_forceStableResults = a3;
}

- (SPQueryResponse)lastResponse
{
  return (SPQueryResponse *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)lastStoredQueryId
{
  return self->_lastStoredQueryId;
}

- (void)setLastStoredQueryId:(unint64_t)a3
{
  self->_lastStoredQueryId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queryTask, 0);
  objc_storeStrong((id *)&self->_searchThroughSection, 0);
  objc_storeStrong((id *)&self->_lastQueryString, 0);
}

@end