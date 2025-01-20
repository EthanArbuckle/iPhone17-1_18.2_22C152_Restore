@interface TRIIntegrationTestLogHandler
+ (BOOL)shouldUseOverrideLogHandler;
+ (void)addTestLoggerInPlaceOnClient:(id)a3;
- (TRIIntegrationTestLogHandler)init;
- (void)logEvent:(id)a3 subgroupName:(id)a4 queue:(id)a5;
@end

@implementation TRIIntegrationTestLogHandler

- (TRIIntegrationTestLogHandler)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)TRIIntegrationTestLogHandler;
  v2 = [(TRIIntegrationTestLogHandler *)&v25 init];
  if (!v2) {
    return v2;
  }
  v3 = NSTemporaryDirectory();
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"integration-test-logs"];
  tempDir = v2->_tempDir;
  v2->_tempDir = (NSString *)v4;

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = v2->_tempDir;
  id v24 = 0;
  char v8 = [v6 removeItemAtPath:v7 error:&v24];
  id v9 = v24;

  v10 = TRILogCategory_Server();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      v12 = v2->_tempDir;
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      v13 = "Cleared temp directory %@ during test log handler setup.";
      v14 = v10;
      uint32_t v15 = 12;
LABEL_7:
      _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
  }
  else if (v11)
  {
    v16 = v2->_tempDir;
    *(_DWORD *)buf = 138412546;
    v27 = v16;
    __int16 v28 = 2112;
    id v29 = v9;
    v13 = "Couldn't remove directory (it may already be gone, which is fine) %@: %@";
    v14 = v10;
    uint32_t v15 = 22;
    goto LABEL_7;
  }

  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  v18 = v2->_tempDir;
  id v23 = v9;
  char v19 = [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v23];
  v20 = (NSString *)v23;

  if ((v19 & 1) == 0)
  {
    v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to setup integration test log handler: %@", buf, 0xCu);
    }
  }
  return v2;
}

+ (BOOL)shouldUseOverrideLogHandler
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TRIIntegrationTestingDefaultsOverrides shouldUseIntegrationTestLogger];
  v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = @"NO";
    if (v2) {
      v5 = @"YES";
    }
    int v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEBUG, "Should use integration test logger? %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

+ (void)addTestLoggerInPlaceOnClient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEBUG, "Adding integration test logger to triald loggers", v10, 2u);
  }

  v5 = objc_opt_new();
  int v6 = [v3 logger];
  v7 = [v6 logHandlers];
  uint64_t v8 = [v7 arrayByAddingObject:v5];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB0180]) initWithClient:v3 projectId:1 logHandlers:v8];
  [v3 setLogger:v9];
}

- (void)logEvent:(id)a3 subgroupName:(id)a4 queue:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  tempDir = self->_tempDir;
  id v6 = a3;
  v7 = objc_opt_new();
  uint64_t v8 = [v7 UUIDString];
  id v9 = [(NSString *)tempDir stringByAppendingPathComponent:v8];

  v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "Integration test logger logging to: %@", buf, 0xCu);
  }

  BOOL v11 = [v6 data];

  id v15 = 0;
  char v12 = [v11 writeToFile:v9 options:1 error:&v15];
  id v13 = v15;
  if ((v12 & 1) == 0)
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to write event to file %@: %@", buf, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
}

@end