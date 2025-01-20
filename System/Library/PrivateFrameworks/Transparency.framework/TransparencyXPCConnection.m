@interface TransparencyXPCConnection
+ (BOOL)retryable:(id)a3 counter:(int)a4;
+ (id)cachedConnection:(id)a3 interface:(Class)a4;
+ (id)idsInstance;
+ (id)mainInstance;
+ (id)swTransparencyConnection;
+ (id)swTransparencyInstance;
+ (id)transparencyAccountsInstance;
+ (id)transparencySupportInstance;
+ (void)invokeAccountsSupportWithBlock:(id)a3 errorHandler:(id)a4;
+ (void)invokeIDSSupportWithBlock:(id)a3 errorHandler:(id)a4;
+ (void)invokeIDSXPCWithBlock:(id)a3 errorHandler:(id)a4;
+ (void)invokeXPCAsynchronousCallWithBlock:(id)a3 errorHandler:(id)a4;
+ (void)invokeXPCSynchronousCallWithBlock:(id)a3 errorHandler:(id)a4;
+ (void)invokeXPCWithBlock:(id)a3 synchronous:(BOOL)a4 errorHandler:(id)a5;
+ (void)setupTestConnection:(id)a3 forMachName:(id)a4;
- (NSString)machName;
- (NSXPCConnection)connection;
- (NSXPCInterface)interface;
- (TransparencyXPCConnection)initWithMachName:(id)a3 interface:(id)a4;
- (id)createConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setInterface:(id)a3;
- (void)setMachName:(id)a3;
- (void)setTestEndpoint:(id)a3;
@end

@implementation TransparencyXPCConnection

+ (BOOL)retryable:(id)a3 counter:(int)a4
{
  id v5 = a3;
  v6 = v5;
  char v7 = 0;
  if (v5 && a4 <= 4)
  {
    if ([v5 code] == 4097)
    {
      v8 = [v6 domain];
      char v7 = [v8 isEqual:*MEMORY[0x263F07F70]];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (TransparencyXPCConnection)initWithMachName:(id)a3 interface:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TransparencyXPCConnection;
  v9 = [(TransparencyXPCConnection *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_machName, a3);
    objc_storeStrong((id *)&v10->_interface, a4);
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(TransparencyXPCConnection *)v2 connection];
  [(TransparencyXPCConnection *)v2 setConnection:0];
  [v3 invalidate];

  objc_sync_exit(v2);
  v4.receiver = v2;
  v4.super_class = (Class)TransparencyXPCConnection;
  [(TransparencyXPCConnection *)&v4 dealloc];
}

- (id)createConnection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(TransparencyXPCConnection *)v2 connection];

  if (v3)
  {
    objc_super v4 = [(TransparencyXPCConnection *)v2 connection];
  }
  else
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v2->_machName options:4096];
    id v5 = [(TransparencyXPCConnection *)v2 interface];
    [v4 setRemoteObjectInterface:v5];

    id location = 0;
    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__TransparencyXPCConnection_createConnection__block_invoke;
    v9[3] = &unk_26479F888;
    objc_copyWeak(&v10, &location);
    [v4 setInvalidationHandler:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__TransparencyXPCConnection_createConnection__block_invoke_5;
    v7[3] = &unk_26479F888;
    objc_copyWeak(&v8, &location);
    [v4 setInterruptionHandler:v7];
    [v4 resume];
    [(TransparencyXPCConnection *)v2 setConnection:v4];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v4;
}

void __45__TransparencyXPCConnection_createConnection__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_17);
  }
  v2 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    objc_super v4 = [WeakRetained machName];
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "xpc connection cannot be formed or has been terminated: %@", (uint8_t *)&v7, 0xCu);
  }
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    v6 = [v5 connection];
    [v5 setConnection:0];
    [v6 invalidate];

    objc_sync_exit(v5);
  }
}

uint64_t __45__TransparencyXPCConnection_createConnection__block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __45__TransparencyXPCConnection_createConnection__block_invoke_5(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_8_0);
  }
  v2 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    objc_super v4 = [WeakRetained machName];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "server connection exited or crashed: %@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __45__TransparencyXPCConnection_createConnection__block_invoke_2_6()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)cachedConnection:(id)a3 interface:(Class)a4
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sharedConectionLock);
  uint64_t v7 = (void *)connectionCache;
  if (!connectionCache)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = (void *)connectionCache;
    connectionCache = v8;

    uint64_t v7 = (void *)connectionCache;
  }
  id v10 = [v7 objectForKeyedSubscript:v6];
  if (!v10)
  {
    id v11 = objc_alloc((Class)a1);
    v12 = [(objc_class *)a4 interface];
    id v10 = (void *)[v11 initWithMachName:v6 interface:v12];

    [(id)connectionCache setObject:v10 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedConectionLock);

  return v10;
}

+ (id)mainInstance
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cachedConnection:@"com.apple.transparencyd" interface:v3];
}

+ (id)transparencySupportInstance
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cachedConnection:@"com.apple.transparencyd.ids-support" interface:v3];
}

+ (id)idsInstance
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cachedConnection:@"com.apple.transparencyd.ids" interface:v3];
}

+ (id)transparencyAccountsInstance
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cachedConnection:@"com.apple.transparencyd.accounts-support" interface:v3];
}

+ (id)swTransparencyInstance
{
  uint64_t v3 = objc_opt_class();

  return (id)[a1 cachedConnection:@"com.apple.swtransparencyd" interface:v3];
}

+ (void)setupTestConnection:(id)a3 forMachName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = objc_alloc_init((Class)a1);
    [v7 setTestEndpoint:v11];
  }
  else
  {
    id v7 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sharedConectionLock);
  uint64_t v8 = (void *)connectionCache;
  if (!connectionCache)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    id v10 = (void *)connectionCache;
    connectionCache = v9;

    uint64_t v8 = (void *)connectionCache;
  }
  [v8 setObject:v7 forKeyedSubscript:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedConectionLock);
}

- (void)setTestEndpoint:(id)a3
{
  id v7 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  int v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v7];
  id v6 = +[TransparencyXPCInterface interface];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  [(TransparencyXPCConnection *)v4 setConnection:v5];

  objc_sync_exit(v4);
}

+ (void)invokeXPCWithBlock:(id)a3 synchronous:(BOOL)a4 errorHandler:(id)a5
{
  id v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v8 = a5;
  uint64_t v9 = +[TransparencyXPCConnection mainInstance];
  id v10 = [v9 connection];
  if (v10 || ([v9 createConnection], (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (a4)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_33;
      v17[3] = &unk_26479E748;
      id v18 = v8;
      uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v17];
      v12 = v18;
    }
    else
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke;
      v19[3] = &unk_26479E748;
      id v20 = v8;
      uint64_t v11 = [v10 remoteObjectProxyWithErrorHandler:v19];
      v12 = v20;
    }

    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = +[TransparencyError errorWithDomain:@"kTransparencyError" code:-108 description:@"failed to create XPC connection"];
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_43_0);
    }
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "failed to create XPC connection", v16, 2u);
    }
    id v10 = 0;
    uint64_t v11 = 0;
  }
  if (!(v11 | v13))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_46_0);
    }
    v14 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_226345000, v14, OS_LOG_TYPE_ERROR, "failed to create XPC protocol", v16, 2u);
    }
    uint64_t v13 = +[TransparencyError errorWithDomain:@"kTransparencyError" code:-1 description:@"unknown XPC interface creation error"];
  }
  v7[2](v7, v11, v13);
}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_30_0);
  }
  objc_super v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "xpc error: %@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[TransparencyAnalytics logger];
  [v5 logResultForEvent:@"errorEvent" hardFailure:1 result:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_36_2);
  }
  objc_super v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "synchronous xpc error: %@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[TransparencyAnalytics logger];
  [v5 logResultForEvent:@"errorEvent" hardFailure:1 result:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_2_34()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_41()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __73__TransparencyXPCConnection_invokeXPCWithBlock_synchronous_errorHandler___block_invoke_44()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (void)invokeXPCAsynchronousCallWithBlock:(id)a3 errorHandler:(id)a4
{
}

+ (void)invokeXPCSynchronousCallWithBlock:(id)a3 errorHandler:(id)a4
{
  int v6 = &v19;
  id v7 = a3;
  id v8 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  do
  {
    char *v6 = 0;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __76__TransparencyXPCConnection_invokeXPCSynchronousCallWithBlock_errorHandler___block_invoke;
    v11[3] = &unk_26479F8B0;
    uint64_t v13 = &v16;
    v14 = v20;
    id v15 = a1;
    id v10 = v8;
    id v12 = v10;
    +[TransparencyXPCConnection invokeXPCWithBlock:v7 synchronous:1 errorHandler:v11];

    int v6 = (char *)(v17 + 3);
  }
  while (*((unsigned char *)v17 + 24));
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void __76__TransparencyXPCConnection_invokeXPCSynchronousCallWithBlock_errorHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = objc_opt_class();
  ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend(v4, "retryable:counter:", v3);
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_51);
    }
    int v5 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_226345000, v5, OS_LOG_TYPE_ERROR, "retrying invokeXPCSynchronousCallWithBlock: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
}

uint64_t __76__TransparencyXPCConnection_invokeXPCSynchronousCallWithBlock_errorHandler___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (void)invokeIDSXPCWithBlock:(id)a3 errorHandler:(id)a4
{
  int v5 = (void (**)(id, uint64_t, uint64_t))a3;
  id v6 = a4;
  id v7 = +[TransparencyXPCConnection idsInstance];
  uint64_t v8 = [v7 connection];
  if (v8 || ([v7 createConnection], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke;
    v14[3] = &unk_26479E748;
    id v15 = v6;
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v14];

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = +[TransparencyError errorWithDomain:@"TransparencyErrorXPC" code:-108 description:@"failed to create XPC connection"];
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_56);
    }
    id v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "failed to create XPC connection", v13, 2u);
    }
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  if (!(v9 | v10))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_59);
    }
    uint64_t v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "failed to create XPC protocol", v13, 2u);
    }
    uint64_t v10 = +[TransparencyError errorWithDomain:@"TransparencyErrorXPC" code:-1 description:@"unknown XPC interface creation error"];
  }
  v5[2](v5, v9, v10);
}

void __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_53);
  }
  objc_super v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "xpc ids error: %@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[TransparencyAnalytics logger];
  [v5 logResultForEvent:@"errorEvent" hardFailure:1 result:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke_54()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __64__TransparencyXPCConnection_invokeIDSXPCWithBlock_errorHandler___block_invoke_57()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (void)invokeIDSSupportWithBlock:(id)a3 errorHandler:(id)a4
{
  int v5 = (void (**)(id, uint64_t, uint64_t))a3;
  id v6 = a4;
  id v7 = +[TransparencyXPCConnection transparencySupportInstance];
  uint64_t v8 = [v7 connection];
  if (v8 || ([v7 createConnection], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke;
    v14[3] = &unk_26479E748;
    id v15 = v6;
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v14];

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = +[TransparencyError errorWithDomain:@"kTransparencyError" code:-108 description:@"failed to create XPC connection"];
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_64_0);
    }
    id v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "failed to create XPC connection", v13, 2u);
    }
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  if (!(v9 | v10))
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_67_0);
    }
    uint64_t v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "failed to create XPC protocol", v13, 2u);
    }
    uint64_t v10 = +[TransparencyError errorWithDomain:@"kTransparencyError" code:-1 description:@"unknown XPC interface creation error"];
  }
  v5[2](v5, v9, v10);
}

void __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_61_1);
  }
  objc_super v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "xpc ids error: %@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[TransparencyAnalytics logger];
  [v5 logResultForEvent:@"errorEvent" hardFailure:1 result:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke_62()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __68__TransparencyXPCConnection_invokeIDSSupportWithBlock_errorHandler___block_invoke_65()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (void)invokeAccountsSupportWithBlock:(id)a3 errorHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = (void (**)(id, void *, void))a3;
  id v6 = a4;
  id v7 = +[TransparencyXPCConnection transparencyAccountsInstance];
  uint64_t v8 = [v7 connection];
  if (v8 || ([v7 createConnection], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke;
    v12[3] = &unk_26479E748;
    id v13 = v6;
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:v12];

    if (v9)
    {
      v5[2](v5, v9, 0);
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = +[TransparencyError errorWithDomain:@"TransparencyErrorXPC" code:-108 description:@"failed to create XPC connection"];
    if (v10) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = +[TransparencyError errorWithDomain:@"TransparencyErrorXPC" code:-1 description:@"unknown XPC interface creation error"];
LABEL_6:
  uint64_t v9 = (void *)v10;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_72_0);
  }
  uint64_t v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v9;
    _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Failed to create XPC protocol: %@", buf, 0xCu);
  }
  (*((void (**)(id, void *))v6 + 2))(v6, v9);
LABEL_11:
}

void __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_15 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_15, &__block_literal_global_69_0);
  }
  objc_super v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_15;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_15, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "xpc accounts error: %@", (uint8_t *)&v6, 0xCu);
  }
  int v5 = +[TransparencyAnalytics logger];
  [v5 logResultForEvent:@"errorEvent" hardFailure:1 result:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __73__TransparencyXPCConnection_invokeAccountsSupportWithBlock_errorHandler___block_invoke_70()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_15 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)swTransparencyConnection
{
  v2 = +[TransparencyXPCConnection swTransparencyInstance];
  id v3 = [v2 connection];
  if (!v3)
  {
    id v3 = [v2 createConnection];
  }

  return v3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSString)machName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMachName:(id)a3
{
}

- (NSXPCInterface)interface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_machName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end