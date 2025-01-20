@interface BCXPCUbiquityDisableServiceProxy
- (BCXPCUbiquityDisableServiceProxy)init;
- (NSXPCConnection)connection;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)syncIsLiverpoolAndUbiquityEnabledWithReply:(id)a3;
@end

@implementation BCXPCUbiquityDisableServiceProxy

- (BCXPCUbiquityDisableServiceProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCXPCUbiquityDisableServiceProxy;
  v2 = [(BCXPCUbiquityDisableServiceProxy *)&v7 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.ibooks.XPCUbiquityDisableService"];
    connection = v2->_connection;
    v2->_connection = v3;

    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BCSyncICloudSettingsProtocol];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BCXPCUbiquityDisableServiceProxy;
  [(BCXPCUbiquityDisableServiceProxy *)&v3 dealloc];
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(BCXPCUbiquityDisableServiceProxy *)self connection];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6122C;
  v9[3] = &unk_2C4430;
  id v10 = v4;
  id v6 = v4;
  objc_super v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

- (void)syncIsLiverpoolAndUbiquityEnabledWithReply:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_61340;
  v6[3] = &unk_2C4430;
  id v7 = a3;
  id v4 = v7;
  v5 = [(BCXPCUbiquityDisableServiceProxy *)self synchronousRemoteObjectProxyWithErrorHandler:v6];
  [v5 isLiverpoolAndUbiquityEnabledWithReply:v4];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end