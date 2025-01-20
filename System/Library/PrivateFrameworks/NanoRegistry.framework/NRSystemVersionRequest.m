@interface NRSystemVersionRequest
- (void)sendVersionRequestToCompanion;
@end

@implementation NRSystemVersionRequest

void __36__NRSystemVersionRequest_connection__block_invoke()
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DD7F0];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.nanoregistry.versionrequest" options:4096];
  v1 = (void *)qword_1EB30BB98;
  qword_1EB30BB98 = v0;

  [(id)qword_1EB30BB98 setRemoteObjectInterface:v2];
  [(id)qword_1EB30BB98 resume];
}

- (void)sendVersionRequestToCompanion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = nr_framework_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = nr_framework_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A356E000, v5, OS_LOG_TYPE_DEFAULT, "Send version request in framework", (uint8_t *)&v14, 2u);
    }
  }
  if (self)
  {
    id v6 = &__block_literal_global_57;
    v7 = nr_framework_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      v9 = nr_framework_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl(&dword_1A356E000, v9, OS_LOG_TYPE_ERROR, "connection called", (uint8_t *)&v14, 2u);
      }
    }
    if (_MergedGlobals_17 != -1) {
      dispatch_once(&_MergedGlobals_17, &__block_literal_global_19);
    }
    v10 = nr_framework_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      v12 = nr_framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        uint64_t v15 = qword_1EB30BB98;
        _os_log_error_impl(&dword_1A356E000, v12, OS_LOG_TYPE_ERROR, "return connection: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    id v13 = (id)qword_1EB30BB98;
    self = [v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_57];
  }
  [(NRSystemVersionRequest *)self sendVersionRequestToCompanion];
}

void __55__NRSystemVersionRequest_sendVersionRequestToCompanion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = nr_framework_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    v5 = nr_framework_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_error_impl(&dword_1A356E000, v5, OS_LOG_TYPE_ERROR, "Error sending NRSystemVersionRequest : XPC error %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

@end