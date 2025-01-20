@interface PPSFeatureFlagReaderHelper
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (id)getFeatureFlags;
- (void)closeXPCConnection;
- (void)setConnectionToServer:(id)a3;
@end

@implementation PPSFeatureFlagReaderHelper

- (id)getFeatureFlags
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags called", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(PPSFeatureFlagReaderHelper *)self createXPCConnection];
  *(void *)buf = 0;
  v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke;
  v14[3] = &unk_1E692BC38;
  v14[4] = buf;
  [v5 getFeatureFlags:v14];
  v6 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *((void *)v16 + 5);
    *(_DWORD *)v21 = 138412290;
    uint64_t v22 = v13;
    _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags result: %@", v21, 0xCu);
  }

  [(PPSFeatureFlagReaderHelper *)self closeXPCConnection];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:v4];
  uint64_t v9 = v8;
  v10 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v21 = 134218498;
    uint64_t v22 = v9;
    __int16 v23 = 2112;
    v24 = v4;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Time for getting getFeatureFlags reading to run: %f, %@, %@", v21, 0x20u);
  }

  id v11 = *((id *)v16 + 5);
  _Block_object_dispose(buf, 8);

  return v11;
}

void __45__PPSFeatureFlagReaderHelper_getFeatureFlags__block_invoke(uint64_t a1, void *a2)
{
}

- (id)createXPCConnection
{
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] establishing a connection", buf, 2u);
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.PPSFeatureFlagReader"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v4;

  v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2A4D230];
  [(NSXPCConnection *)self->_connectionToServer setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->_connectionToServer setInterruptionHandler:&__block_literal_global_9];
  [(NSXPCConnection *)self->_connectionToServer setInvalidationHandler:&__block_literal_global_12];
  [(NSXPCConnection *)self->_connectionToServer resume];
  v7 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Spinning up xpc svc", v10, 2u);
  }

  uint64_t v8 = [(NSXPCConnection *)self->_connectionToServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  return v8;
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke()
{
  v0 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1D2690000, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Connection was interrupted.", v1, 2u);
  }
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_10()
{
  v0 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1D2690000, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Invalid connection handler is happening.", v1, 2u);
  }
}

void __49__PPSFeatureFlagReaderHelper_createXPCConnection__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = [v2 description];
    int v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1D2690000, v3, OS_LOG_TYPE_ERROR, "os_log_debug Connection error happened %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)closeXPCConnection
{
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags Connection Closed", v4, 2u);
  }

  [(NSXPCConnection *)self->_connectionToServer invalidate];
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

@end