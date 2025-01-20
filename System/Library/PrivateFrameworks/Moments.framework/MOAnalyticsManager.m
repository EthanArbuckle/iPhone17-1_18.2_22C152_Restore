@interface MOAnalyticsManager
+ (id)defaultManager;
- (MOAnalyticsManager)init;
- (id)context;
- (void)dealloc;
- (void)fetchPhotoAnalyticsMetricsWithHandler:(id)a3;
@end

@implementation MOAnalyticsManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)defaultManager_analyticsManager;
  return v2;
}

uint64_t __36__MOAnalyticsManager_defaultManager__block_invoke()
{
  defaultManager_analyticsManager = objc_alloc_init(MOAnalyticsManager);
  return MEMORY[0x1F41817F8]();
}

- (MOAnalyticsManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)MOAnalyticsManager;
  v2 = [(MOAnalyticsManager *)&v19 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2940E68];
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
    [v3 setClasses:v9 forSelector:sel_fetchPhotoAnalyticsMetricsWithContext_andHandler_ argumentIndex:0 ofReply:1];

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.momentsd" options:0];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v10;

    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v3];
    [(NSXPCConnection *)v2->connection setInvalidationHandler:&__block_literal_global_107];
    uint64_t v12 = [(NSXPCConnection *)v2->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_113];
    proxy = v2->proxy;
    v2->proxy = (MOAnalyticsManagerXPCProtocol *)v12;

    v14 = [[MOConnection alloc] initWithName:@"MOAnalyticsManager"];
    connectionProxy = v2->connectionProxy;
    v2->connectionProxy = v14;

    v16 = [(MOConnection *)v2->connectionProxy onConnectionInterrupted];
    [(NSXPCConnection *)v2->connection setInterruptionHandler:v16];

    [(NSXPCConnection *)v2->connection resume];
    NSLog(&cfstr_InitiateClient.isa);
    v17 = v2;
  }
  return v2;
}

void __26__MOAnalyticsManager_init__block_invoke()
{
}

void __26__MOAnalyticsManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 localizedDescription];
  v3 = [v2 localizedFailureReason];

  NSLog(&stru_1F291D858.isa, @"Error on remote object proxy", v4, v3);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MOAnalyticsManager;
  [(MOAnalyticsManager *)&v3 dealloc];
}

- (id)context
{
  id v2 = objc_alloc_init(MOXPCContext);
  return v2;
}

- (void)fetchPhotoAnalyticsMetricsWithHandler:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_CallingFunctio.isa);
  connectionProxy = self->connectionProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke;
  v9[3] = &unk_1E691EDF8;
  v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_3;
  v7[3] = &unk_1E691EE20;
  id v8 = v10;
  id v6 = v10;
  [(MOConnection *)connectionProxy callBlock:v9 onInterruption:v7];
}

void __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_2;
  v8[3] = &unk_1E691EDD0;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 fetchPhotoAnalyticsMetricsWithContext:v6 andHandler:v8];
}

void __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
    }
  }
}

uint64_t __60__MOAnalyticsManager_fetchPhotoAnalyticsMetricsWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connectionProxy, 0);
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

@end