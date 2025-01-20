@interface VIAEntryPointLogger
+ (id)feedbackNamesToLog;
- (BOOL)_preconditionCheckEvent:(id)a3;
- (VIAEntryPointLogger)initWithQueue:(id)a3 feedbackSubmitter:(id)a4 eventCache:(id)a5;
- (id)_visibleSuggestionsFeedbackFromPendingFeeedback:(id)a3 forViewAppearEvent:(unint64_t)a4;
- (void)_logClientTimeingFeedback:(id)a3 queryID:(unint64_t)a4;
- (void)_logDependentEvent:(id)a3;
- (void)_logEndEvent:(id)a3;
- (void)_logEvent:(id)a3;
- (void)_logFeedback:(id)a3 queryID:(unint64_t)a4;
- (void)_logStartEvent:(id)a3;
- (void)_logVisibleSuggestionsFeedback:(id)a3 forViewAppearEvent:(unint64_t)a4 queryID:(unint64_t)a5;
- (void)logEvent:(id)a3;
@end

@implementation VIAEntryPointLogger

- (VIAEntryPointLogger)initWithQueue:(id)a3 feedbackSubmitter:(id)a4 eventCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)VIAEntryPointLogger;
  v12 = [(VIAEntryPointLogger *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = objc_opt_new();
    appToQueryIDMap = v13->_appToQueryIDMap;
    v13->_appToQueryIDMap = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    appToViewAppearEventMap = v13->_appToViewAppearEventMap;
    v13->_appToViewAppearEventMap = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v13->_eventCache, a5);
    objc_storeStrong((id *)&v13->_feedbackSubmitter, a4);
  }

  return v13;
}

- (void)logEvent:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(VIAEntryPointLogger *)self _logEvent:v7];
    goto LABEL_7;
  }
  v4 = [v7 feedback];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v5 = [v7 feedback];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_7;
    }
  }
  [(VIAEntryPointLogger *)self _logDependentEvent:v7];
LABEL_7:
}

+ (id)feedbackNamesToLog
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v14[0] = v4;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v14[1] = v6;
  id v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v14[2] = v8;
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  v14[3] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  v12 = [v2 setWithArray:v11];

  return v12;
}

- (void)_logEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v4 = [(VIAEntryPointLogger *)self _preconditionCheckEvent:v6];
  id v5 = v6;
  if (v4)
  {
    uint64_t v4 = [v6 type];
    if (v4 == 2)
    {
      uint64_t v4 = [(VIAEntryPointLogger *)self _logEndEvent:v6];
    }
    else
    {
      id v5 = v6;
      if (v4 != 1) {
        goto LABEL_7;
      }
      uint64_t v4 = [(VIAEntryPointLogger *)self _logStartEvent:v6];
    }
    id v5 = v6;
  }
LABEL_7:
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_logDependentEvent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(VIAEntryPointLogger *)self _preconditionCheckEvent:v4])
  {
    appToQueryIDMap = self->_appToQueryIDMap;
    id v6 = [v4 originatingApplication];
    id v7 = [(NSMutableDictionary *)appToQueryIDMap objectForKeyedSubscript:v6];

    appToViewAppearEventMap = self->_appToViewAppearEventMap;
    id v9 = [v4 originatingApplication];
    id v10 = [(NSMutableDictionary *)appToViewAppearEventMap objectForKeyedSubscript:v9];

    if (!v7 || (uint64_t v11 = [v7 unsignedLongLongValue], v11 != objc_msgSend(v4, "queryID")))
    {
      [(VIAEventCache *)self->_eventCache cacheEvent:v4];
      goto LABEL_20;
    }
    if (v10)
    {
      uint64_t v12 = (int)[v10 intValue];
    }
    else
    {
      if (+[VILogger shouldLogMessage])
      {
        v13 = +[VILogger log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = [v4 originatingApplication];
          int v19 = 138543618;
          v20 = v14;
          __int16 v21 = 2048;
          uint64_t v22 = [v4 queryID];
          _os_log_impl(&dword_1DCCF9000, v13, OS_LOG_TYPE_ERROR, "_appToViewAppearEventMap missing invocation method for application=%{public}@, queryID=%llu", (uint8_t *)&v19, 0x16u);
        }
      }
      uint64_t v12 = 28;
    }
    v15 = [v4 feedback];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v4 feedback];

      if (!v16)
      {
LABEL_16:
        v17 = [v4 feedback];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v18 = [v4 feedback];

        if (v18)
        {
          -[VIAEntryPointLogger _logClientTimeingFeedback:queryID:](self, "_logClientTimeingFeedback:queryID:", v18, [v4 queryID]);
          v17 = (void *)v18;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      -[VIAEntryPointLogger _logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:](self, "_logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:", v16, v12, [v4 queryID]);
      v15 = (void *)v16;
    }

    goto LABEL_16;
  }
LABEL_21:
}

- (void)_logStartEvent:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  appToQueryIDMap = self->_appToQueryIDMap;
  id v6 = [v4 originatingApplication];
  id v7 = [(NSMutableDictionary *)appToQueryIDMap objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "queryID"));
    uint64_t v11 = self->_appToQueryIDMap;
    uint64_t v12 = [v4 originatingApplication];
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "viewAppearEvent"));
    appToViewAppearEventMap = self->_appToViewAppearEventMap;
    v15 = [v4 originatingApplication];
    [(NSMutableDictionary *)appToViewAppearEventMap setObject:v13 forKeyedSubscript:v15];

    uint64_t v16 = [v4 feedback];
    -[VIAEntryPointLogger _logFeedback:queryID:](self, "_logFeedback:queryID:", v16, [v4 queryID]);

    eventCache = self->_eventCache;
    uint64_t v18 = [v4 originatingApplication];
    v8 = -[VIAEventCache cachedEventForBundleID:queryID:](eventCache, "cachedEventForBundleID:queryID:", v18, [v4 queryID]);

    if (!v8) {
      goto LABEL_22;
    }
    v28 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v8 = v8;
    uint64_t v19 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v19) {
      goto LABEL_21;
    }
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v8);
        }
        uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v24 = [v23 feedback];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = [v23 feedback];

          if (!v25) {
            goto LABEL_15;
          }
          -[VIAEntryPointLogger _logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:](self, "_logVisibleSuggestionsFeedback:forViewAppearEvent:queryID:", v25, [v28 viewAppearEvent], objc_msgSend(v23, "queryID"));
          v24 = (void *)v25;
        }

LABEL_15:
        v26 = [v23 feedback];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v27 = [v23 feedback];

          if (!v27) {
            continue;
          }
          -[VIAEntryPointLogger _logClientTimeingFeedback:queryID:](self, "_logClientTimeingFeedback:queryID:", v27, [v23 queryID]);
          v26 = (void *)v27;
        }
      }
      uint64_t v20 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v20)
      {
LABEL_21:

        id v4 = v28;
        goto LABEL_22;
      }
    }
  }
  if (+[VILogger shouldLogMessage])
  {
    v8 = +[VILogger log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v4 originatingApplication];
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      __int16 v36 = 2048;
      uint64_t v37 = [v4 queryID];
      _os_log_impl(&dword_1DCCF9000, v8, OS_LOG_TYPE_ERROR, "Starting an event without previous ending. App: %{public}@, queryID: %llu", buf, 0x16u);
    }
LABEL_22:
  }
}

- (void)_logEndEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  appToQueryIDMap = self->_appToQueryIDMap;
  id v6 = [v4 originatingApplication];
  id v7 = [(NSMutableDictionary *)appToQueryIDMap objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = self->_appToQueryIDMap;
    id v9 = [v4 originatingApplication];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    appToViewAppearEventMap = self->_appToViewAppearEventMap;
    uint64_t v11 = [v4 originatingApplication];
    [(NSMutableDictionary *)appToViewAppearEventMap removeObjectForKey:v11];

    uint64_t v12 = [v4 feedback];
    -[VIAEntryPointLogger _logFeedback:queryID:](self, "_logFeedback:queryID:", v12, [v7 unsignedLongLongValue]);
  }
  else if (+[VILogger shouldLogMessage])
  {
    v13 = +[VILogger log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v4 originatingApplication];
      int v15 = 138543618;
      uint64_t v16 = v14;
      __int16 v17 = 2048;
      uint64_t v18 = [v4 queryID];
      _os_log_impl(&dword_1DCCF9000, v13, OS_LOG_TYPE_ERROR, "Ending an event without previous start. App: %{public}@, queryID: %llu", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_logFeedback:(id)a3 queryID:(unint64_t)a4
{
}

- (BOOL)_preconditionCheckEvent:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 originatingApplication];
  uint64_t v5 = [v4 length];

  if (!v5 && +[VILogger shouldLogMessage])
  {
    id v6 = +[VILogger log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1DCCF9000, v6, OS_LOG_TYPE_INFO, "Empty application bundleID for event %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v5 != 0;
}

- (void)_logVisibleSuggestionsFeedback:(id)a3 forViewAppearEvent:(unint64_t)a4 queryID:(unint64_t)a5
{
  id v7 = [(VIAEntryPointLogger *)self _visibleSuggestionsFeedbackFromPendingFeeedback:a3 forViewAppearEvent:a4];
  [(VIAEntryPointLogger *)self _logFeedback:v7 queryID:a5];
}

- (void)_logClientTimeingFeedback:(id)a3 queryID:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F99F60];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [v7 eventName];
  uint64_t v10 = [v7 nanosecondInterval];
  uint64_t v11 = [v7 queryId];

  id v12 = (id)[v8 initWithEvent:v9 timeInterval:v10 queryId:v11];
  [(VIAEntryPointLogger *)self _logFeedback:v12 queryID:a4];
}

- (id)_visibleSuggestionsFeedbackFromPendingFeeedback:(id)a3 forViewAppearEvent:(unint64_t)a4
{
  if (a4 == 28)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F9A550];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = [v5 suggestions];

    id v8 = (void *)[v6 initWithSuggestions:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28F60];
    id v10 = a3;
    id v7 = [v9 predicateWithBlock:&__block_literal_global_3];
    uint64_t v11 = [v10 suggestions];

    id v12 = [v11 filteredArrayUsingPredicate:v7];

    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F9A550]) initWithSuggestions:v12];
  }

  return v8;
}

uint64_t __90__VIAEntryPointLogger__visibleSuggestionsFeedbackFromPendingFeeedback_forViewAppearEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NSString stringWithFormat:@"%@:", @"infoPanel"];
  id v4 = [v2 suggestion];
  if ([v4 isEqualToString:@"infoPanel"])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v2 suggestion];
    uint64_t v5 = [v6 hasPrefix:v3] ^ 1;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_appToViewAppearEventMap, 0);
  objc_storeStrong((id *)&self->_appToQueryIDMap, 0);
  objc_storeStrong((id *)&self->_feedbackSubmitter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end