@interface WLKExternalMediaContentManager
+ (id)sharedManager;
- (WLKExternalMediaContentManager)init;
- (id)_connection;
- (id)_init;
- (id)_proxy;
- (void)_deletePlaybackActivityWithIdentifier:(id)a3 bundleID:(id)a4;
- (void)deletePlaybackActivityWithIdentifier:(id)a3;
@end

@implementation WLKExternalMediaContentManager

+ (id)sharedManager
{
  if (sharedManager___once != -1) {
    dispatch_once(&sharedManager___once, &__block_literal_global_51);
  }
  v2 = (void *)sharedManager___sharedManager;

  return v2;
}

uint64_t __47__WLKExternalMediaContentManager_sharedManager__block_invoke()
{
  id v0 = [[WLKExternalMediaContentManager alloc] _init];
  uint64_t v1 = sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (WLKExternalMediaContentManager)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKExternalMediaContentManager;
  return [(WLKExternalMediaContentManager *)&v3 init];
}

- (void)deletePlaybackActivityWithIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v7 = [v4 mainBundle];
  v6 = [v7 bundleIdentifier];
  [(WLKExternalMediaContentManager *)self _deletePlaybackActivityWithIdentifier:v5 bundleID:v6];
}

- (void)_deletePlaybackActivityWithIdentifier:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WLKExternalMediaContentManager *)self _proxy];
  [v8 deletePlaybackActivityWithIdentifier:v7 bundleID:v6];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13EC720];
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v8 = self->_connection;
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13EC780];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_113_0];
    objc_initWeak(&location, self);
    v10 = self->_connection;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __45__WLKExternalMediaContentManager__connection__block_invoke_2;
    v15 = &unk_1E620A550;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v12];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __45__WLKExternalMediaContentManager__connection__block_invoke()
{
}

void __45__WLKExternalMediaContentManager__connection__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_ConnectionInva.isa);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }
}

- (id)_proxy
{
  v2 = [(WLKExternalMediaContentManager *)self _connection];
  objc_super v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_122];

  return v3;
}

void __40__WLKExternalMediaContentManager__proxy__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void).cxx_destruct
{
}

@end