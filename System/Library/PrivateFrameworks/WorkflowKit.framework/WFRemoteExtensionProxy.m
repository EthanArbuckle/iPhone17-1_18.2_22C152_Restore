@interface WFRemoteExtensionProxy
- (INCExtensionConnection)connection;
- (SARemoteDevice)remoteDevice;
- (WFRemoteExtensionProxy)initWithConnection:(id)a3 andDevice:(id)a4;
- (void)confirmIntentWithCompletionHandler:(id)a3;
- (void)handleIntentRemotelyWithRemoteOperation:(id)a3 completion:(id)a4;
- (void)handleIntentWithCompletionHandler:(id)a3;
- (void)resolveIntentSlotKeyPath:(id)a3 completionHandler:(id)a4;
- (void)resolveIntentSlotKeyPaths:(id)a3 completionHandler:(id)a4;
@end

@implementation WFRemoteExtensionProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (SARemoteDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (INCExtensionConnection)connection
{
  return self->_connection;
}

- (void)resolveIntentSlotKeyPaths:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v8 = [(WFRemoteExtensionProxy *)self connection];
  v7 = [v8 intent];
  (*((void (**)(id, uint64_t, void *, void))a4 + 2))(v6, 1, v7, 0);
}

- (void)resolveIntentSlotKeyPath:(id)a3 completionHandler:(id)a4
{
}

- (void)handleIntentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = objc_alloc_init(MEMORY[0x1E4F966F0]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__WFRemoteExtensionProxy_handleIntentWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6555198;
  id v8 = v4;
  id v6 = v4;
  [(WFRemoteExtensionProxy *)self handleIntentRemotelyWithRemoteOperation:v5 completion:v7];
}

uint64_t __60__WFRemoteExtensionProxy_handleIntentWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return kdebug_trace();
}

- (void)confirmIntentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = objc_alloc_init(MEMORY[0x1E4F966E8]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WFRemoteExtensionProxy_confirmIntentWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6555198;
  id v8 = v4;
  id v6 = v4;
  [(WFRemoteExtensionProxy *)self handleIntentRemotelyWithRemoteOperation:v5 completion:v7];
}

uint64_t __61__WFRemoteExtensionProxy_confirmIntentWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return kdebug_trace();
}

- (void)handleIntentRemotelyWithRemoteOperation:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFRemoteExtensionProxy *)self connection];
  v9 = [v8 intent];

  if ([v9 _executionContext] == 2) {
    [v9 _setExecutionContext:9];
  }
  v10 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFRemoteExtensionProxy handleIntentRemotelyWithRemoteOperation:completion:]";
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s WFRemoteExtensionProxy is handling remote intent operation (%{public}@)", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2;
  v15[3] = &unk_1E6555170;
  id v16 = v6;
  v17 = self;
  id v18 = v7;
  id v13 = v7;
  id v14 = v6;
  [v9 _injectProxiesForImages:&__block_literal_global_52899 completion:v15];
}

void __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(a1[4], "wf_setIntent:", v3);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__52903;
  v14[4] = __Block_byref_object_dispose__52904;
  id v15 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v4 = (void *)getAFClientLiteClass_softClass;
  uint64_t v20 = getAFClientLiteClass_softClass;
  if (!getAFClientLiteClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getAFClientLiteClass_block_invoke;
    v16[3] = &unk_1E6558B78;
    v16[4] = &v17;
    __getAFClientLiteClass_block_invoke((uint64_t)v16);
    id v4 = (void *)v18[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v17, 8);
  id v6 = objc_opt_new();
  id v7 = a1[4];
  id v8 = [a1[5] remoteDevice];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_9;
  v13[3] = &unk_1E6555120;
  v13[4] = v14;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2_11;
  v9[3] = &unk_1E6555148;
  v12 = v14;
  id v10 = a1[4];
  id v11 = a1[6];
  +[WFACEUtilities wf_handleCommand:v7 onRemoteDevice:v8 usingClient:v6 commandHandler:v13 completion:v9];

  _Block_object_dispose(v14, 8);
}

uint64_t __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, 0);
}

void __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_9(uint64_t a1, void *a2)
{
}

void __77__WFRemoteExtensionProxy_handleIntentRemotelyWithRemoteOperation_completion___block_invoke_2_11(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (id)*MEMORY[0x1E4F70C40];
  id v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ins_aceIntentResponse");
  id v8 = getWFIntentExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v12 = 136315906;
    id v13 = "-[WFRemoteExtensionProxy handleIntentRemotelyWithRemoteOperation:completion:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v10;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 2114;
    id v19 = v5;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s WFRemoteExtensionProxy finished handling remote intent operation (%{public}@), success %d error %{public}@", (uint8_t *)&v12, 0x26u);
  }
  if (v7) {
    id v11 = 0;
  }
  else {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F70C00]) initWithErrorCode:1316 underlyingError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (WFRemoteExtensionProxy)initWithConnection:(id)a3 andDevice:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFRemoteExtensionProxy.m", 38, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExtensionProxy;
  id v10 = [(WFRemoteExtensionProxy *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a3);
    uint64_t v12 = [v9 copy];
    remoteDevice = v11->_remoteDevice;
    v11->_remoteDevice = (SARemoteDevice *)v12;

    __int16 v14 = v11;
  }

  return v11;
}

@end