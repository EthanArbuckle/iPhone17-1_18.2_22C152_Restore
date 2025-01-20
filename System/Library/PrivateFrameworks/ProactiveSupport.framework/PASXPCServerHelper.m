@interface PASXPCServerHelper
@end

@implementation PASXPCServerHelper

uint64_t __213___PASXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_whitelistedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_logHandle___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1 + 32);
  if (v2 && os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(int *)(a1 + 64);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A32C4000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v7, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __213___PASXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_whitelistedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_logHandle___block_invoke_5(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1 + 32);
  if (v2 && os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(int *)(a1 + 64);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A32C4000, v2, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v7, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end