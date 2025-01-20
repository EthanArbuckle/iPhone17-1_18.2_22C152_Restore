@interface SKRSharedFlowPluginXPCServer
- (SKRSharedFlowPluginXPCServer)init;
@end

@implementation SKRSharedFlowPluginXPCServer

- (SKRSharedFlowPluginXPCServer)init
{
  return (SKRSharedFlowPluginXPCServer *)SharedFlowPluginXPCServer.init()();
}

- (void).cxx_destruct
{
}

@end