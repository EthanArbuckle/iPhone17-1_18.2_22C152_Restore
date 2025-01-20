@interface NSXPCConnection
@end

@implementation NSXPCConnection

void __96__NSXPCConnection_PGAdditions__PG_remoteObjectProxyWithDebugMethodAndPointerProem_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PGLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __96__NSXPCConnection_PGAdditions__PG_remoteObjectProxyWithDebugMethodAndPointerProem_errorHandler___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __96__NSXPCConnection_PGAdditions__PG_remoteObjectProxyWithDebugMethodAndPointerProem_errorHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1B5645000, log, OS_LOG_TYPE_ERROR, "%@ - Acquiring remote object proxy for connection %@ failed with error: %@", (uint8_t *)&v5, 0x20u);
}

@end