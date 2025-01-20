@interface NEVPNTunnelPlugin
- (NEVPNTunnelPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5;
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)createVirtualInterfaceWithParameters:(id)a3 completionHandler:(id)a4;
- (void)handleIPCDetached;
- (void)handlePluginFailedWithError:(id)a3;
- (void)setStatus:(int)a3 error:(id)a4;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation NEVPNTunnelPlugin

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEVPNPluginManager];
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEVPNPluginDriver];
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015204;
  block[3] = &unk_1000C6D88;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)setStatus:(int)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001540C;
  block[3] = &unk_1000C6E00;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)handleIPCDetached
{
  v3 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001552C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)createVirtualInterfaceWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015658;
  block[3] = &unk_1000C6D88;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handlePluginFailedWithError:(id)a3
{
  self->_pluginStatus = 0;
  id v4 = a3;
  id v5 = [(NEPlugin *)self delegate];
  [v5 plugin:self didSetStatus:0 andDisconnectError:v4];
}

- (NEVPNTunnelPlugin)initWithAgent:(id)a3 delegateQueue:(id)a4 andDelegate:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NEVPNTunnelPlugin;
  result = [(NEPlugin *)&v6 initWithAgent:a3 delegateQueue:a4 andDelegate:a5];
  if (result) {
    result->_pluginStatus = 0;
  }
  return result;
}

@end