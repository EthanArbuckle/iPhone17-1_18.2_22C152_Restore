@interface SKRExecutionListenerManager
- (ENCEncoreServiceLauncher)encoreServiceLauncher;
- (SKRExecutionListenerManager)init;
- (SKRSharedFlowPluginXPCServer)sharedPluginServer;
@end

@implementation SKRExecutionListenerManager

- (SKRExecutionListenerManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKRExecutionListenerManager;
  v2 = [(SKRExecutionListenerManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKRSharedFlowPluginXPCServer);
    sharedPluginServer = v2->_sharedPluginServer;
    v2->_sharedPluginServer = v3;

    v5 = (ENCEncoreServiceLauncher *)objc_alloc_init(MEMORY[0x1E4F610E8]);
    encoreServiceLauncher = v2->_encoreServiceLauncher;
    v2->_encoreServiceLauncher = v5;
  }
  return v2;
}

- (SKRSharedFlowPluginXPCServer)sharedPluginServer
{
  return self->_sharedPluginServer;
}

- (ENCEncoreServiceLauncher)encoreServiceLauncher
{
  return self->_encoreServiceLauncher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoreServiceLauncher, 0);

  objc_storeStrong((id *)&self->_sharedPluginServer, 0);
}

@end