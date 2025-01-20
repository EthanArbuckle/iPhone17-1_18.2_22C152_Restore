@interface PPSFeatureFlagReaderHelper
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (id)getFeatureFlags;
- (void)closeXPCConnection;
- (void)createXPCConnection;
- (void)getFeatureFlags;
- (void)setConnectionToServer:(id)a3;
@end

@implementation PPSFeatureFlagReaderHelper

- (id)getFeatureFlags
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PPSFeatureFlagReaderHelper getFeatureFlags]();
  }

  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(PPSFeatureFlagReaderHelper *)self createXPCConnection];
  uint64_t v14 = 0;
  v15[0] = &v14;
  v15[1] = 0x3032000000;
  v15[2] = __Block_byref_object_copy__7;
  v15[3] = __Block_byref_object_dispose__7;
  id v16 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke;
  v13[3] = &unk_1E62547D8;
  v13[4] = &v14;
  [v5 getFeatureFlags:v13];
  v6 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(PPSFeatureFlagReaderHelper *)(uint64_t)v15 getFeatureFlags];
  }

  [(PPSFeatureFlagReaderHelper *)self closeXPCConnection];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:v4];
  uint64_t v9 = v8;
  v10 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    v20 = v4;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_debug_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Time for getting getFeatureFlags reading to run: %f, %@, %@", buf, 0x20u);
  }

  id v11 = *(id *)(v15[0] + 40);
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke(uint64_t a1, void *a2)
{
}

- (id)createXPCConnection
{
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PPSFeatureFlagReaderHelper createXPCConnection]();
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.PPSFeatureFlagReader"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F15AB158];
  [(NSXPCConnection *)self->_connectionToServer setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:&__block_literal_global_9];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:&__block_literal_global_12];
  [(NSXPCConnection *)self->_connectionToServer resume];
  v7 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PPSFeatureFlagReaderHelper createXPCConnection]();
  }

  uint64_t v8 = [(NSXPCConnection *)self->_connectionToServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  return v8;
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke()
{
  v0 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_cold_1();
  }
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_10()
{
  v0 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_10_cold_1();
  }
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_13_cold_1(v2, v3);
  }
}

- (void)closeXPCConnection
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "[PPSFeatureFlagReader] getFeatureFlags Connection Closed", v2, v3, v4, v5, v6);
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getFeatureFlags
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "[PPSFeatureFlagReader] getFeatureFlags called", v2, v3, v4, v5, v6);
}

- (void)createXPCConnection
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "[PPSFeatureFlagReader] establishing a connection", v2, v3, v4, v5, v6);
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Connection was interrupted.", v1, 2u);
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Invalid connection handler is happening.", v1, 2u);
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_13_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "os_log_debug Connection error happened %@", (uint8_t *)&v4, 0xCu);
}

@end