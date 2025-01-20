@interface PREXPCServer
+ (void)_registerResponsesListener;
+ (void)registerPREXPCListeners;
@end

@implementation PREXPCServer

+ (void)_registerResponsesListener
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)_registerResponsesListener_delegate;
  _registerResponsesListener_delegate = v2;

  uint64_t v4 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.proactive.experiments.responses"];
  v5 = (void *)_registerResponsesListener_listener;
  _registerResponsesListener_listener = v4;

  [(id)_registerResponsesListener_listener setDelegate:_registerResponsesListener_delegate];
  [(id)_registerResponsesListener_listener resume];
  v6 = pre_sv_xpc_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_235566000, v6, OS_LOG_TYPE_DEFAULT, "Registered for Responses XPC Service", v7, 2u);
  }
}

+ (void)registerPREXPCListeners
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__PREXPCServer_registerPREXPCListeners__block_invoke;
  v7[3] = &__block_descriptor_40_e5_B8__0l;
  v7[4] = a1;
  uint64_t v2 = (void *)MEMORY[0x237DE2090](v7, a2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__PREXPCServer_registerPREXPCListeners__block_invoke_2;
  v5[3] = &unk_264C5C7F8;
  id v6 = v2;
  uint64_t v3 = registerPREXPCListeners__pasOnceToken2;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&registerPREXPCListeners__pasOnceToken2, v5);
  }
}

uint64_t __39__PREXPCServer_registerPREXPCListeners__block_invoke(uint64_t a1)
{
  return 1;
}

void __39__PREXPCServer_registerPREXPCListeners__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x237DE1ED0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end