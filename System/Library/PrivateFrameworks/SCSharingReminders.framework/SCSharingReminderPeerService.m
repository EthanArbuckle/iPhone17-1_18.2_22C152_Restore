@interface SCSharingReminderPeerService
+ (id)interface;
- (NSXPCConnection)xpcConnection;
- (id)initConnection;
- (void)disconnect;
- (void)handleSignals:(id)a3 completion:(id)a4;
- (void)userOpenedSafetyCheckWithCompletion:(id)a3;
@end

@implementation SCSharingReminderPeerService

- (id)initConnection
{
  v7.receiver = self;
  v7.super_class = (Class)SCSharingReminderPeerService;
  v2 = [(SCSharingReminderPeerService *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.safetycheckd" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = [(id)objc_opt_class() interface];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_5];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_3];
    [(NSXPCConnection *)v2->_xpcConnection activate];
  }
  return v2;
}

void __46__SCSharingReminderPeerService_initConnection__block_invoke()
{
  v0 = SCLogger();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __49__SCSharingReminderFeatureService_initConnection__block_invoke_cold_1(v0);
  }
}

void __46__SCSharingReminderPeerService_initConnection__block_invoke_1()
{
  v0 = SCLogger();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __49__SCSharingReminderFeatureService_initConnection__block_invoke_2_cold_1(v0);
  }
}

+ (id)interface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270904F38];
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_handleSignals_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)userOpenedSafetyCheckWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(SCSharingReminderPeerService *)self xpcConnection];
  v5 = [v6 remoteObjectProxy];
  [v5 userOpenedSafetyCheckWithCompletion:v4];
}

- (void)handleSignals:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SCSharingReminderPeerService *)self xpcConnection];
  v8 = [v9 remoteObjectProxy];
  [v8 handleSignals:v7 completion:v6];
}

- (void)disconnect
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
}

@end