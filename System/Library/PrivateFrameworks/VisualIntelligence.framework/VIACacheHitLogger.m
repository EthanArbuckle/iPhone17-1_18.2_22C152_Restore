@interface VIACacheHitLogger
+ (id)feedbackNamesToLog;
- (VIACacheHitLogger)initWithQueue:(id)a3 feedbackSubmitter:(id)a4;
- (void)_logEvent:(id)a3;
- (void)didObserveEvent:(id)a3;
- (void)logEvent:(id)a3;
@end

@implementation VIACacheHitLogger

- (VIACacheHitLogger)initWithQueue:(id)a3 feedbackSubmitter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VIACacheHitLogger;
  v9 = [(VIACacheHitLogger *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_feedbackSubmitter, a4);
    v11 = [[VIAEventCache alloc] initWithQueue:v7];
    engagementEventCache = v10->_engagementEventCache;
    v10->_engagementEventCache = v11;

    v13 = [[VIAEventCache alloc] initWithQueue:v7];
    rankingEventCache = v10->_rankingEventCache;
    v10->_rankingEventCache = v13;
  }
  return v10;
}

- (void)didObserveEvent:(id)a3
{
  id v8 = a3;
  v4 = [v8 feedback];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(VIAEventCache *)self->_engagementEventCache cacheEvent:v8];
  }
  v6 = [v8 feedback];
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();

  if (v7) {
    [(VIAEventCache *)self->_rankingEventCache cacheEvent:v8];
  }
}

- (void)logEvent:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v5;
    }
    else {
      id v4 = 0;
    }
    [(VIACacheHitLogger *)self _logEvent:v4];
  }
}

+ (id)feedbackNamesToLog
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [v2 setWithObject:v4];

  return v5;
}

- (void)_logEvent:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39 = [v4 engagementSuggestionType];
  engagementEventCache = self->_engagementEventCache;
  v6 = [v4 originatingApplication];
  char v7 = -[VIAEventCache cachedEventForBundleID:queryID:](engagementEventCache, "cachedEventForBundleID:queryID:", v6, [v4 cachedResultQueryID]);

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v54 count:16];
  v38 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v14 = [v13 feedback];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = 0;
          goto LABEL_13;
        }
        v15 = [v13 feedback];

        if (v13) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          v14 = objc_msgSend(v15, "VI_searchSuggestionForSuggestionType:", v39);
          v17 = (void *)[objc_alloc(MEMORY[0x1E4F9A490]) initWithSuggestion:v14];
          objc_msgSend(v17, "setQueryId:", objc_msgSend(v4, "queryID"));
          feedbackSubmitter = self->_feedbackSubmitter;
          uint64_t v19 = [v4 queryID];
          v20 = feedbackSubmitter;
          id v8 = v38;
          [(VIAFeedbackSubmitter *)v20 reportFeedback:v17 queryId:v19];

LABEL_13:
        }
        -[VIAFeedbackSubmitter didHitCacheForQueryId:](self->_feedbackSubmitter, "didHitCacheForQueryId:", [v4 queryID]);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v10);
  }

  rankingEventCache = self->_rankingEventCache;
  v22 = [v4 originatingApplication];
  v23 = -[VIAEventCache cachedEventForBundleID:queryID:](rankingEventCache, "cachedEventForBundleID:queryID:", v22, [v4 cachedResultQueryID]);

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v23;
  uint64_t v24 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v42;
    *(void *)&long long v25 = 138543618;
    long long v37 = v25;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v30 = objc_msgSend(v29, "feedback", v37);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v31 = [v29 feedback];

          if (v31)
          {
            id v32 = objc_alloc(MEMORY[0x1E4F9A318]);
            v33 = [v31 sections];
            [v31 blendingDuration];
            v34 = objc_msgSend(v32, "initWithSections:blendingDuration:", v33);

            -[VIAFeedbackSubmitter reportFeedback:queryId:](self->_feedbackSubmitter, "reportFeedback:queryId:", v34, [v4 cachedResultQueryID]);
            goto LABEL_28;
          }
        }
        else
        {
        }
        if (!+[VILogger shouldLogMessage]) {
          continue;
        }
        v31 = +[VILogger log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v35 = [v4 originatingApplication];
          uint64_t v36 = [v4 cachedResultQueryID];
          *(_DWORD *)buf = v37;
          v50 = v35;
          __int16 v51 = 2048;
          uint64_t v52 = v36;
          _os_log_impl(&dword_1DCCF9000, v31, OS_LOG_TYPE_ERROR, "Expected ranking event missing from cache for application=%{public}@, queryID=%llu", buf, 0x16u);
        }
LABEL_28:
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v26);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingEventCache, 0);
  objc_storeStrong((id *)&self->_engagementEventCache, 0);
  objc_storeStrong((id *)&self->_feedbackSubmitter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end