@interface SCSharingReminderFeatureService
+ (id)interface;
- (NSXPCConnection)xpcConnection;
- (id)initConnection;
- (void)disconnect;
- (void)fetchStatusWithCompletion:(id)a3;
- (void)postWifiSyncNotificationWithCompletion:(id)a3;
- (void)resetFeatureWithCompletion:(id)a3;
- (void)setReminderDelays:(id)a3 completion:(id)a4;
- (void)setXpcConnection:(id)a3;
@end

@implementation SCSharingReminderFeatureService

- (id)initConnection
{
  v7.receiver = self;
  v7.super_class = (Class)SCSharingReminderFeatureService;
  v2 = [(SCSharingReminderFeatureService *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.safetycheckd" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = +[SCSharingReminderFeatureService interface];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_4];
    [(NSXPCConnection *)v2->_xpcConnection activate];
  }
  return v2;
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke()
{
  v0 = SCLogger();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __49__SCSharingReminderFeatureService_initConnection__block_invoke_cold_1(v0);
  }
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke_2()
{
  v0 = SCLogger();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __49__SCSharingReminderFeatureService_initConnection__block_invoke_2_cold_1(v0);
  }
}

- (void)disconnect
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

+ (id)interface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270904C28];
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_fetchStatusWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(SCSharingReminderFeatureService *)self xpcConnection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 fetchStatusWithCompletion:v4];
}

- (void)resetFeatureWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(SCSharingReminderFeatureService *)self xpcConnection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 resetFeatureWithCompletion:v4];
}

- (void)setReminderDelays:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SCSharingReminderFeatureService *)self xpcConnection];
  uint64_t v8 = [v9 remoteObjectProxy];
  [v8 setReminderDelays:v7 completion:v6];
}

- (void)postWifiSyncNotificationWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(SCSharingReminderFeatureService *)self xpcConnection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 postWifiSyncNotificationWithCompletion:v4];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  v2 = @"com.apple.safetycheckd";
  _os_log_debug_impl(&dword_25B654000, log, OS_LOG_TYPE_DEBUG, "@\"Connection with %@ interrupted.\"", (uint8_t *)&v1, 0xCu);
}

void __49__SCSharingReminderFeatureService_initConnection__block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  v2 = @"com.apple.safetycheckd";
  _os_log_debug_impl(&dword_25B654000, log, OS_LOG_TYPE_DEBUG, "@\"Connection with %@ invalidated.\"", (uint8_t *)&v1, 0xCu);
}

@end