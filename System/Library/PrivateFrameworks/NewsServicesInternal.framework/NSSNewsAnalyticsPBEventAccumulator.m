@interface NSSNewsAnalyticsPBEventAccumulator
- (NSMutableArray)events;
- (NSSNewsAnalyticsEnvelopeDescriptor)envelopeDescriptor;
- (NSSNewsAnalyticsPBEventAccumulator)init;
- (NSSNewsAnalyticsPBEventAccumulator)initWithEnvelopeDescriptor:(id)a3 sessionManager:(id)a4;
- (NSSNewsAnalyticsSessionManager)sessionManager;
- (id)dequeueEventsIntoEnvelope;
- (void)observeEvent:(id)a3;
- (void)observeEvents:(id)a3;
@end

@implementation NSSNewsAnalyticsPBEventAccumulator

- (NSSNewsAnalyticsPBEventAccumulator)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsAnalyticsPBEventAccumulator init]";
    __int16 v9 = 2080;
    v10 = "NSSNewsAnalyticsPBEventAccumulator.m";
    __int16 v11 = 1024;
    int v12 = 83;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NSSNewsAnalyticsPBEventAccumulator init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSSNewsAnalyticsPBEventAccumulator)initWithEnvelopeDescriptor:(id)a3 sessionManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NSSNewsAnalyticsPBEventAccumulator initWithEnvelopeDescriptor:sessionManager:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSNewsAnalyticsPBEventAccumulator initWithEnvelopeDescriptor:sessionManager:]();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NSSNewsAnalyticsPBEventAccumulator;
  v8 = [(NSSNewsAnalyticsPBEventAccumulator *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    envelopeDescriptor = v8->_envelopeDescriptor;
    v8->_envelopeDescriptor = (NSSNewsAnalyticsEnvelopeDescriptor *)v9;

    objc_storeWeak((id *)&v8->_sessionManager, v7);
    uint64_t v11 = objc_opt_new();
    events = v8->_events;
    v8->_events = (NSMutableArray *)v11;
  }
  return v8;
}

- (id)dequeueEventsIntoEnvelope
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(NSSNewsAnalyticsPBEventAccumulator *)self events];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(NSSNewsAnalyticsPBEventAccumulator *)self sessionManager];
    id v6 = [v5 currentSession];
    id v7 = (void *)[v6 copy];

    v8 = [(NSSNewsAnalyticsPBEventAccumulator *)self events];
    uint64_t v9 = (void *)[v8 copy];

    v10 = objc_msgSend(MEMORY[0x1E4F82BC8], "nss_sessionBatchWithIdentifier");
    [v10 setSession:v7];
    [v10 setEvents:v9];
    uint64_t v11 = NSSNewsAnalyticsPBEventAccumulatorLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
      *(_DWORD *)buf = 67109634;
      int v26 = [v12 contentType];
      __int16 v27 = 2112;
      v28 = v7;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1E0102000, v11, OS_LOG_TYPE_DEBUG, "Preparing an envelope of contentType %d with session %@, events %@", buf, 0x1Cu);
    }
    __int16 v13 = objc_msgSend(MEMORY[0x1E4F82A30], "nss_envelopeWithIdentifier");
    objc_super v14 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
    objc_msgSend(v13, "setContentTypeVersion:", objc_msgSend(v14, "contentTypeVersion"));

    uint64_t v15 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
    objc_msgSend(v13, "setContentTypeMinorVersion:", objc_msgSend(v15, "contentTypeMinorVersion"));

    v16 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
    objc_msgSend(v13, "setContentTypePatchVersion:", objc_msgSend(v16, "contentTypePatchVersion"));

    v17 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
    objc_msgSend(v13, "setContentType:", objc_msgSend(v17, "contentType"));

    v18 = [v10 data];
    v19 = objc_msgSend(v18, "fc_zlibDeflate");
    [v13 setContent:v19];

    v20 = (void *)MEMORY[0x1E4F7D428];
    v24 = v13;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v20 registerEnvelopesAsCreated:v21];

    v22 = [(NSSNewsAnalyticsPBEventAccumulator *)self events];
    [v22 removeAllObjects];
  }
  else
  {
    __int16 v13 = 0;
  }
  return v13;
}

- (void)observeEvent:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSNewsAnalyticsPBEventAccumulator observeEvent:]();
  }
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(NSSNewsAnalyticsPBEventAccumulator *)self observeEvents:v5];
}

- (void)observeEvents:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSNewsAnalyticsPBEventAccumulator observeEvents:]();
  }
  if ([v4 count])
  {
    v5 = [(NSSNewsAnalyticsPBEventAccumulator *)self events];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = (void *)MEMORY[0x1E4F7D428];
      v8 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
      objc_msgSend(v7, "registerEnvelopeCreationAnticipatedForContentType:", objc_msgSend(v8, "contentType"));
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = NSSNewsAnalyticsPBEventAccumulatorLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = [(NSSNewsAnalyticsPBEventAccumulator *)self envelopeDescriptor];
            int v17 = [v16 contentType];
            *(_DWORD *)buf = 67109378;
            int v25 = v17;
            __int16 v26 = 2112;
            uint64_t v27 = v14;
            _os_log_impl(&dword_1E0102000, v15, OS_LOG_TYPE_DEBUG, "For envelope of contentType %d, processing event %@.", buf, 0x12u);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v11);
    }

    v18 = [(NSSNewsAnalyticsPBEventAccumulator *)self events];
    [v18 addObjectsFromArray:v9];

    id v4 = v19;
  }
}

- (NSSNewsAnalyticsEnvelopeDescriptor)envelopeDescriptor
{
  return self->_envelopeDescriptor;
}

- (NSSNewsAnalyticsSessionManager)sessionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionManager);
  return (NSSNewsAnalyticsSessionManager *)WeakRetained;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_destroyWeak((id *)&self->_sessionManager);
  objc_storeStrong((id *)&self->_envelopeDescriptor, 0);
}

- (void)initWithEnvelopeDescriptor:sessionManager:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionManager", v6, 2u);
}

- (void)initWithEnvelopeDescriptor:sessionManager:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeDescriptor", v6, 2u);
}

- (void)observeEvent:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"event", v6, 2u);
}

- (void)observeEvents:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"events", v6, 2u);
}

@end