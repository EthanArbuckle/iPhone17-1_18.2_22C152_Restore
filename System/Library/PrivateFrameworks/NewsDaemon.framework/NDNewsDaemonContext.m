@interface NDNewsDaemonContext
- (NDNewsDaemonContext)init;
- (NDNewsService)daemon;
- (id)_queue;
- (id)updateResultsHandler;
- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4;
- (void)fetchModuleDescriptorsWithCompletion:(id)a3;
- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4;
- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5;
- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5;
- (void)serviceHasNewTodayResults;
- (void)setDaemon:(id)a3;
- (void)setUpdateResultsHandler:(id)a3;
@end

@implementation NDNewsDaemonContext

- (NDNewsDaemonContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)NDNewsDaemonContext;
  v2 = [(NDNewsDaemonContext *)&v6 init];
  if (v2)
  {
    v3 = [[NDNewsServiceConnection alloc] initWithClient:v2];
    daemon = v2->_daemon;
    v2->_daemon = (NDNewsService *)v3;
  }
  return v2;
}

- (void)serviceHasNewTodayResults
{
  v3 = [(NDNewsDaemonContext *)self _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__NDNewsDaemonContext_serviceHasNewTodayResults__block_invoke;
  block[3] = &unk_1E6D3E9D8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__NDNewsDaemonContext_serviceHasNewTodayResults__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updateResultsHandler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) updateResultsHandler];
    v3[2]();
  }
}

- (void)fetchModuleDescriptorsWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsDaemonContext fetchModuleDescriptorsWithCompletion:]();
  }
  v5 = [(NDNewsDaemonContext *)self daemon];
  [v5 fetchModuleDescriptorsWithCompletion:v4];
}

- (void)fetchLatestResultsWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext fetchLatestResultsWithParameters:completion:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsDaemonContext fetchLatestResultsWithParameters:completion:]();
  }
LABEL_6:
  v8 = [(NDNewsDaemonContext *)self daemon];
  [v8 fetchLatestResultsWithParameters:v6 completion:v7];
}

- (void)fetchPlaceholderResultsWithOperationInfo:(id)a3 syncCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext fetchPlaceholderResultsWithOperationInfo:syncCompletion:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsDaemonContext fetchPlaceholderResultsWithOperationInfo:syncCompletion:]();
  }
LABEL_6:
  v8 = [(NDNewsDaemonContext *)self daemon];
  [v8 fetchPlaceholderResultsWithOperationInfo:v6 syncCompletion:v7];
}

- (void)setUpdateResultsHandler:(id)a3
{
  self->_updateResultsHandler = (id)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)updateResultsHandler
{
  v2 = _Block_copy(self->_updateResultsHandler);

  return v2;
}

- (void)markAnalyticsElements:(id)a3 asSeenAtDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext markAnalyticsElements:asSeenAtDate:withCompletion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsDaemonContext markAnalyticsElements:asSeenAtDate:withCompletion:]();
  }
LABEL_6:
  v11 = [(NDNewsDaemonContext *)self daemon];
  [v11 markAnalyticsElements:v8 asSeenAtDate:v9 withCompletion:v10];
}

- (void)markAnalyticsElement:(id)a3 asReadAtDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[NDNewsDaemonContext markAnalyticsElement:asReadAtDate:withCompletion:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NDNewsDaemonContext markAnalyticsElement:asReadAtDate:withCompletion:]();
  }
LABEL_6:
  v11 = [(NDNewsDaemonContext *)self daemon];
  [v11 markAnalyticsElement:v8 asReadAtDate:v9 withCompletion:v10];
}

- (id)_queue
{
  v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

- (NDNewsService)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);

  objc_storeStrong(&self->_updateResultsHandler, 0);
}

- (void)fetchModuleDescriptorsWithCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)fetchLatestResultsWithParameters:completion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"completion", v6, 2u);
}

- (void)fetchLatestResultsWithParameters:completion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parameters", v6, 2u);
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"syncCompletion", v6, 2u);
}

- (void)fetchPlaceholderResultsWithOperationInfo:syncCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"operationInfo", v6, 2u);
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)markAnalyticsElements:asSeenAtDate:withCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElements", v6, 2u);
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);
}

- (void)markAnalyticsElement:asReadAtDate:withCompletion:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E00ED000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"analyticsElement", v6, 2u);
}

@end