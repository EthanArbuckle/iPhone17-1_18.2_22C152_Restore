@interface ClientSession
- (ClientSession)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (NSXPCProxyCreating)clientProxy;
- (void)dealloc;
- (void)invalidate;
- (void)setConnection:(id)a3;
@end

@implementation ClientSession

- (void)dealloc
{
  v3 = +[FMFXPCSessionManager sharedInstance];
  [v3 removeClientSession:self];

  v4.receiver = self;
  v4.super_class = (Class)ClientSession;
  [(ClientSession *)&v4 dealloc];
}

- (NSXPCProxyCreating)clientProxy
{
  v3 = [(ClientSession *)self connection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000226B8;
  v6[3] = &unk_1000A1708;
  v6[4] = self;
  objc_super v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  return (NSXPCProxyCreating *)v4;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)invalidate
{
  id v3 = [(ClientSession *)self connection];
  [v3 invalidate];
  [(ClientSession *)self setConnection:0];
}

- (void)setConnection:(id)a3
{
}

- (ClientSession)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ClientSession;
  v5 = [(ClientSession *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ClientSession *)v5 setConnection:v4];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end