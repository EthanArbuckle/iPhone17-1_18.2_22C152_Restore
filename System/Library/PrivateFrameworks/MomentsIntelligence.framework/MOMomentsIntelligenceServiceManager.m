@interface MOMomentsIntelligenceServiceManager
+ (id)sharedInstance;
- (MOMomentsIntelligenceServiceManager)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (void)createConnection;
- (void)dealloc;
- (void)fetchGenerativeModelsAvailabilityWithReply:(id)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MOMomentsIntelligenceServiceManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__MOMomentsIntelligenceServiceManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __53__MOMomentsIntelligenceServiceManager_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)createConnection
{
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
  }
  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.MomentsIntelligenceService"];
  v5 = self->_connection;
  self->_connection = v4;

  if (self->_connection)
  {
    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270625880];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&__block_literal_global_7];
    [(NSXPCConnection *)self->_connection activate];
  }
  v7 = _mo_log_facility_get_os_log(MOLogFacilityIntelligence);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_256D30000, v7, OS_LOG_TYPE_DEFAULT, "MIServiceMgr,createConnection successful", v8, 2u);
  }
}

void __55__MOMomentsIntelligenceServiceManager_createConnection__block_invoke()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityIntelligence);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_256D30000, v0, OS_LOG_TYPE_DEFAULT, "Connection to XPC service interrupted", v1, 2u);
  }
}

void __55__MOMomentsIntelligenceServiceManager_createConnection__block_invoke_5()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityIntelligence);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_256D30000, v0, OS_LOG_TYPE_DEFAULT, "Connection to XPC service invalidated", v1, 2u);
  }
}

- (MOMomentsIntelligenceServiceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOMomentsIntelligenceServiceManager;
  v2 = [(MOMomentsIntelligenceServiceManager *)&v7 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"MOMomentsIntelligenceServiceManager, %p", v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    [(MOMomentsIntelligenceServiceManager *)v2 createConnection];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = _mo_log_facility_get_os_log(MOLogFacilityIntelligence);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D30000, v3, OS_LOG_TYPE_DEFAULT, "MIServiceMgr,dealloc", buf, 2u);
  }

  dispatch_queue_t v4 = [(MOMomentsIntelligenceServiceManager *)self connection];
  [v4 invalidate];

  [(MOMomentsIntelligenceServiceManager *)self setConnection:0];
  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MOMomentsIntelligenceServiceManager;
  [(MOMomentsIntelligenceServiceManager *)&v6 dealloc];
}

- (void)fetchGenerativeModelsAvailabilityWithReply:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__MOMomentsIntelligenceServiceManager_fetchGenerativeModelsAvailabilityWithReply___block_invoke;
  v13[3] = &unk_2654245E0;
  id v6 = v4;
  id v14 = v6;
  objc_super v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v13];
  v8 = _mo_log_facility_get_os_log(MOLogFacilityIntelligence);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_256D30000, v8, OS_LOG_TYPE_DEFAULT, "MIServiceMgr, calling fetchGenerativeModelsAvailabilityWithReply", buf, 2u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __82__MOMomentsIntelligenceServiceManager_fetchGenerativeModelsAvailabilityWithReply___block_invoke_16;
  v10[3] = &unk_265424608;
  id v11 = v6;
  id v9 = v6;
  [v7 fetchGenerativeModelsAvailabilityWithReply:v10];
}

void __82__MOMomentsIntelligenceServiceManager_fetchGenerativeModelsAvailabilityWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(MOLogFacilityIntelligence);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 code];
    id v6 = [v3 domain];
    objc_super v7 = [v3 localizedDescription];
    int v8 = 134349571;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2113;
    v13 = v7;
    _os_log_impl(&dword_256D30000, v4, OS_LOG_TYPE_DEFAULT, "MIServiceMgr, fetchGenerativeModelsAvailabilityWithReply,XPCService asynchronous error,%{public}lld,domain,%{public}@,description,\"%{private}@\"", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__MOMomentsIntelligenceServiceManager_fetchGenerativeModelsAvailabilityWithReply___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end