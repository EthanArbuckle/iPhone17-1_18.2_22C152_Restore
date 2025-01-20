@interface HVXPCSysdiagnoseService
- (HVXPCSysdiagnoseService)init;
- (id)synchronousProxy;
- (id)sysdiagnoseStringWithError:(id *)a3;
@end

@implementation HVXPCSysdiagnoseService

- (void).cxx_destruct
{
}

- (id)sysdiagnoseStringWithError:(id *)a3
{
  v5 = hv_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226C41000, v5, OS_LOG_TYPE_DEFAULT, "HVXPCSysdiagnoseService: sysdiagnoseStringWithError called.", buf, 2u);
  }

  *(void *)buf = 0;
  v18 = buf;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__630;
  v21 = __Block_byref_object_dispose__631;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__630;
  v15 = __Block_byref_object_dispose__631;
  id v16 = 0;
  v6 = [(HVXPCSysdiagnoseService *)self synchronousProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HVXPCSysdiagnoseService_sysdiagnoseStringWithError___block_invoke;
  v10[3] = &unk_2647D4F00;
  v10[4] = buf;
  v10[5] = &v11;
  [v6 sysdiagnoseStringWithCompletion:v10];

  v7 = (void *)*((void *)v18 + 5);
  if (a3 && !v7)
  {
    *a3 = (id) v12[5];
    v7 = (void *)*((void *)v18 + 5);
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(buf, 8);

  return v8;
}

void __54__HVXPCSysdiagnoseService_sysdiagnoseStringWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)synchronousProxy
{
  return (id)[(_PASXPCClientHelper *)self->_helper synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_13];
}

void __43__HVXPCSysdiagnoseService_synchronousProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = hv_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_226C41000, v3, OS_LOG_TYPE_ERROR, "HVXPCSysdiagnoseService: error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (HVXPCSysdiagnoseService)init
{
  v11.receiver = self;
  v11.super_class = (Class)HVXPCSysdiagnoseService;
  id v2 = [(HVXPCSysdiagnoseService *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAD0E50];
    int v4 = (void *)MEMORY[0x22A6667F0]();
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v5 forSelector:sel_sysdiagnoseStringWithCompletion_ argumentIndex:0 ofReply:1];

    id v6 = objc_alloc(MEMORY[0x263F61EB0]);
    uint64_t v7 = hv_default_log_handle();
    uint64_t v8 = [v6 initWithServiceName:@"com.apple.proactive.ProactiveHarvesting.Sysdiagnose" whitelistedServerInterface:v3 whitelistedClientInterface:0 serverInitiatedRequestHandler:0 interruptionHandler:&__block_literal_global_641 invalidationHandler:&__block_literal_global_10 logHandle:v7];
    helper = v2->_helper;
    v2->_helper = (_PASXPCClientHelper *)v8;
  }
  return v2;
}

void __31__HVXPCSysdiagnoseService_init__block_invoke_8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    id v2 = @"com.apple.proactive.ProactiveHarvesting.Sysdiagnose";
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __31__HVXPCSysdiagnoseService_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = hv_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    id v2 = @"com.apple.proactive.ProactiveHarvesting.Sysdiagnose";
    _os_log_impl(&dword_226C41000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ interrupted", (uint8_t *)&v1, 0xCu);
  }
}

@end