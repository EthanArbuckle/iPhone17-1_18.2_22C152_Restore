@interface NEFilterPlugin
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)acceptAgentClients;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)createContentFilterSocketWithCompletionHandler:(id)a3;
- (void)createPacketChannelWithCompletionHandler:(id)a3;
- (void)handlePluginFailedWithError:(id)a3;
- (void)setStatus:(int64_t)a3 error:(id)a4;
@end

@implementation NEFilterPlugin

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015B24;
  block[3] = &unk_1000C6D88;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEFilterPluginManager];
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEFilterPluginDriver];
}

- (void)acceptAgentClients
{
  v3 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015C48;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setStatus:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015D58;
  block[3] = &unk_1000C6930;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)handlePluginFailedWithError:(id)a3
{
  self->_filterStatus = 0;
  id v4 = [(NEPlugin *)self delegate];
  [v4 plugin:self didSetStatus:0 andError:1];
}

- (void)createPacketChannelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(NEPlugin *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015F64;
  v7[3] = &unk_1000C6DB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createContentFilterSocketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(NEPlugin *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001608C;
  v7[3] = &unk_1000C6DB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

@end