@interface CLLocationPushRegistrar
+ (id)sharedRegistrar;
- (NSXPCConnection)connection;
- (void)connect;
- (void)dealloc;
- (void)registerForPushToken:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5;
@end

@implementation CLLocationPushRegistrar

+ (id)sharedRegistrar
{
  if (qword_10247F890 != -1) {
    dispatch_once(&qword_10247F890, &stru_1022D86D8);
  }
  return (id)qword_10247F898;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationPushRegistrar;
  [(CLLocationPushRegistrar *)&v3 dealloc];
}

- (void)connect
{
  objc_super v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.locationpushd.pushregistration" options:4096];
  self->_connection = v3;
  if (v3)
  {
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LPPushTokenServerProtocol]];
    connection = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1009E96F4;
    v7[3] = &unk_10229FED8;
    v7[4] = self;
    [(NSXPCConnection *)connection setInvalidationHandler:v7];
    v5 = self->_connection;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1009E989C;
    v6[3] = &unk_10229FED8;
    v6[4] = self;
    [(NSXPCConnection *)v5 setInterruptionHandler:v6];
    [(NSXPCConnection *)self->_connection resume];
  }
}

- (void)registerForPushToken:(id)a3 completion:(id)a4
{
  connection = self->_connection;
  if (!connection)
  {
    [(CLLocationPushRegistrar *)self connect];
    connection = self->_connection;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009E9AE8;
  v8[3] = &unk_1022D8700;
  v8[4] = a4;
  [(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy")) registerForPushToken:a3 completion:v8];
}

- (void)setLocationPushesActive:(BOOL)a3 forAppBundleIdentifier:(id)a4 completion:(id)a5
{
  BOOL v7 = a3;
  connection = self->_connection;
  if (!connection)
  {
    [(CLLocationPushRegistrar *)self connect];
    connection = self->_connection;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009E9BA4;
  v10[3] = &unk_1022D8728;
  v10[4] = a5;
  [(-[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy")) setLocationPushesActive:v7 forAppBundleIdentifier:a4 completion:v10];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end