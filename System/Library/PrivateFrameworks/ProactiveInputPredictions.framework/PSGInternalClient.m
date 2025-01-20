@interface PSGInternalClient
+ (id)sharedInstance;
- (PSGInternalClient)init;
- (id)_remoteObjectProxy;
- (id)sysdiagnoseInformationWithError:(id *)a3;
@end

@implementation PSGInternalClient

- (void).cxx_destruct
{
}

- (id)sysdiagnoseInformationWithError:(id *)a3
{
  v4 = [(PSGInternalClient *)self _remoteObjectProxy];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__61;
  v24 = __Block_byref_object_dispose__62;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__61;
  v18 = __Block_byref_object_dispose__62;
  id v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__PSGInternalClient_sysdiagnoseInformationWithError___block_invoke;
  v10[3] = &unk_263FCF8E8;
  v12 = &v20;
  v13 = &v14;
  v6 = v5;
  v11 = v6;
  [v4 sysdiagnoseInformationWithCompletion:v10];
  [MEMORY[0x263F61E38] waitForSemaphore:v6];
  if (a3) {
    *a3 = (id) v15[5];
  }
  v7 = (void *)v21[5];
  if (!v7)
  {
    v21[5] = @"{\"error\": \"No info returned from server\"}";
    v7 = (void *)v21[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __53__PSGInternalClient_sysdiagnoseInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_remoteObjectProxy
{
  return (id)[(_PASXPCClientHelper *)self->_clientHelper remoteObjectProxy];
}

- (PSGInternalClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)PSGInternalClient;
  v2 = [(PSGInternalClient *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE17DE0];
    id v4 = objc_alloc(MEMORY[0x263F61EB0]);
    id v5 = psg_default_log_handle();
    uint64_t v6 = [v4 initWithServiceName:@"com.apple.private.psg.internal" whitelistedServerInterface:v3 whitelistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_6 invalidationHandler:&__block_literal_global_9 logHandle:v5];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (_PASXPCClientHelper *)v6;
  }
  return v2;
}

void __25__PSGInternalClient_init__block_invoke_7()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = psg_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 138412290;
    v2 = @"com.apple.private.psg.internal";
    _os_log_impl(&dword_20A02A000, v0, OS_LOG_TYPE_INFO, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

void __25__PSGInternalClient_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = psg_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    v2 = @"com.apple.private.psg.internal";
    _os_log_error_impl(&dword_20A02A000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_77 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_77, &__block_literal_global_78);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_79;
  return v2;
}

void __35__PSGInternalClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x2105116B0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_79;
  sharedInstance__pasExprOnceResult_79 = v1;
}

@end