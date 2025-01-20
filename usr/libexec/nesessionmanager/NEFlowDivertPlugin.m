@interface NEFlowDivertPlugin
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)createFlowDivertControlSocketWithCompletionHandler:(id)a3;
@end

@implementation NEFlowDivertPlugin

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEFlowDivertPluginManager];
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEFlowDivertPluginDriver];
}

- (void)createFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(NEPlugin *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015914;
  v7[3] = &unk_1000C6DB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

@end