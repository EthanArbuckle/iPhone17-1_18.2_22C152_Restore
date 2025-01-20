@interface SecureChannelServiceProxy
+ (id)sharedInstance;
- (SecureChannelServiceProxy)init;
- (void)actionForURL:(id)a3 completion:(id)a4;
- (void)runApproverFlowForURL:(id)a3 completion:(id)a4;
@end

@implementation SecureChannelServiceProxy

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __43__SecureChannelServiceProxy_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(SecureChannelServiceProxy);

  return MEMORY[0x270F9A758]();
}

- (SecureChannelServiceProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)SecureChannelServiceProxy;
  v2 = [(SecureChannelServiceProxy *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.securechanneld" options:4096];
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E1066F8];
    [(NSXPCConnection *)v2->_connectionToService setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connectionToService setInvalidationHandler:&__block_literal_global_9];
    [(NSXPCConnection *)v2->_connectionToService setInterruptionHandler:&__block_literal_global_14];
    [(NSXPCConnection *)v2->_connectionToService resume];
  }
  return v2;
}

void __33__SecureChannelServiceProxy_init__block_invoke()
{
}

void __33__SecureChannelServiceProxy_init__block_invoke_2()
{
}

- (void)actionForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    connectionToService = self->_connectionToService;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__SecureChannelServiceProxy_actionForURL_completion___block_invoke;
    v12[3] = &unk_2649A7908;
    id v13 = v7;
    v10 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v12];
    v11 = self->_remoteObject;
    self->_remoteObject = v10;

    remoteObject = self->_remoteObject;
  }
  [(SecureChannelService *)remoteObject actionForURL:v6 completion:v7];
}

uint64_t __53__SecureChannelServiceProxy_actionForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runApproverFlowForURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    connectionToService = self->_connectionToService;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__SecureChannelServiceProxy_runApproverFlowForURL_completion___block_invoke;
    v12[3] = &unk_2649A7908;
    id v13 = v7;
    v10 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v12];
    v11 = self->_remoteObject;
    self->_remoteObject = v10;

    remoteObject = self->_remoteObject;
  }
  [(SecureChannelService *)remoteObject runApproverFlowForURL:v6 completion:v7];
}

uint64_t __62__SecureChannelServiceProxy_runApproverFlowForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObject, 0);

  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end