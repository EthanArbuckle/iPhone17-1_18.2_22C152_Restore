@interface CSSearchClientConnection
- (BOOL)searchInternal;
- (CSSearchClientConnection)initWithConnection:(id)a3;
- (CSSearchClientConnection)initWithConnectionConfiguration:(id)a3;
- (NSMutableDictionary)queryTasks;
- (NSMutableOrderedSet)pausedTasks;
- (SDConnectionConfiguration)configuration;
- (id)allowedBundleIDs;
- (id)bundleID;
- (id)protectionClass;
- (id)queryTask:(int64_t)a3;
- (unsigned)outBatchCount;
- (void)_didReceiveResultsBatchCompletion;
- (void)_willSendResultsBatch:(id)a3 qid:(int64_t)a4;
- (void)cancelQueryTask:(int64_t)a3;
- (void)cancelQueryTask:(int64_t)a3 wasCanceledByClient:(BOOL)a4;
- (void)cancelQueryTasks;
- (void)dealloc;
- (void)pollResultsForQueryTask:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setPausedTasks:(id)a3;
- (void)setQueryTask:(id)a3 forQueryID:(int64_t)a4;
- (void)setQueryTasks:(id)a3;
@end

@implementation CSSearchClientConnection

- (BOOL)searchInternal
{
  return [(SDConnectionConfiguration *)self->_configuration searchInternal];
}

- (void)setQueryTask:(id)a3 forQueryID:(int64_t)a4
{
  id v8 = a3;
  v6 = [NSNumber numberWithInteger:a4];
  v7 = self->_queryTasks;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)self->_queryTasks setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (id)queryTask:(int64_t)a3
{
  v4 = [NSNumber numberWithInteger:a3];
  v5 = self->_queryTasks;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->_queryTasks objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_willSendResultsBatch:(id)a3 qid:(int64_t)a4
{
  id v6 = a3;
  int add = atomic_fetch_add((atomic_uint *volatile)&self->_outBatchCount, 1u);
  if (add == 6)
  {
    id v8 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CSSearchClientConnection _willSendResultsBatch:qid:]();
    }

    if (!self->_pausedTasks)
    {
      v9 = (NSMutableOrderedSet *)objc_opt_new();
      pausedTasks = self->_pausedTasks;
      self->_pausedTasks = v9;
    }
  }
  if (self->_pausedTasks)
  {
    v11 = [NSNumber numberWithInteger:a4];
    if (([(NSMutableOrderedSet *)self->_pausedTasks containsObject:v11] & 1) == 0)
    {
      [(NSMutableOrderedSet *)self->_pausedTasks addObject:v11];
      v12 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchClientConnection _willSendResultsBatch:qid:](add, a4, v12);
      }

      [v6 pauseResults];
    }
  }
}

- (CSSearchClientConnection)initWithConnectionConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSSearchClientConnection;
  id v6 = [(CSSearchClientConnection *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    uint64_t v8 = objc_opt_new();
    queryTasks = v7->_queryTasks;
    v7->_queryTasks = (NSMutableDictionary *)v8;

    v10 = [v5 bundleID];
    if (v10)
    {
LABEL_6:

      goto LABEL_7;
    }
    if (([v5 searchInternal] & 1) == 0)
    {
      v10 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CSSearchClientConnection initWithConnectionConfiguration:](v5);
      }
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (SDConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (id)bundleID
{
  return [(SDConnectionConfiguration *)self->_configuration bundleID];
}

- (void)_didReceiveResultsBatchCompletion
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Resuming results %@", v2, v3, v4, v5, v6);
}

- (unsigned)outBatchCount
{
  return atomic_load(&self->_outBatchCount);
}

- (CSSearchClientConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SDConnectionConfiguration alloc];
  uint8_t v6 = [(SDConnectionConfiguration *)v5 initWithConnection:v4 isPrivate:sSearchAgentIsPrivate];

  v7 = [(CSSearchClientConnection *)self initWithConnectionConfiguration:v6];
  return v7;
}

- (void)cancelQueryTask:(int64_t)a3
{
}

- (void)cancelQueryTask:(int64_t)a3 wasCanceledByClient:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    uint8_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    v7 = self->_queryTasks;
    objc_sync_enter(v7);
    id v8 = [(NSMutableDictionary *)self->_queryTasks objectForKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_queryTasks removeObjectForKey:v6];
    objc_sync_exit(v7);

    [v8 setWasCanceledByClient:v4];
    [v8 cancel];
  }
}

- (void)pollResultsForQueryTask:(int64_t)a3
{
  if (a3)
  {
    BOOL v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v5 = self->_queryTasks;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)self->_queryTasks objectForKeyedSubscript:v4];
    objc_sync_exit(v5);

    [v6 poll];
  }
}

- (void)cancelQueryTasks
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_queryTasks;
  objc_sync_enter(v3);
  if ([(NSMutableDictionary *)self->_queryTasks count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v4 = self->_queryTasks;
    uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_queryTasks, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
          [v8 cancel];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [(NSMutableDictionary *)self->_queryTasks removeAllObjects];
  }
  objc_sync_exit(v3);
}

- (void)dealloc
{
  [(CSSearchClientConnection *)self cancelQueryTasks];
  v3.receiver = self;
  v3.super_class = (Class)CSSearchClientConnection;
  [(CSSearchClientConnection *)&v3 dealloc];
}

- (id)protectionClass
{
  return [(SDConnectionConfiguration *)self->_configuration protectionClass];
}

- (id)allowedBundleIDs
{
  return [(SDConnectionConfiguration *)self->_configuration allowedBundleIDs];
}

- (NSMutableDictionary)queryTasks
{
  return self->_queryTasks;
}

- (void)setQueryTasks:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableOrderedSet)pausedTasks
{
  return self->_pausedTasks;
}

- (void)setPausedTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedTasks, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queryTasks, 0);
}

- (void)initWithConnectionConfiguration:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 connection];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Could not resolve bundle from %@", v4, v5, v6, v7, v8);
}

- (void)_willSendResultsBatch:(os_log_t)log qid:.cold.1(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_21F1CE000, log, OS_LOG_TYPE_DEBUG, "Paused results qid: %ld count: %ld", (uint8_t *)&v3, 0x16u);
}

- (void)_willSendResultsBatch:qid:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "Pausing results %@", v2, v3, v4, v5, v6);
}

@end