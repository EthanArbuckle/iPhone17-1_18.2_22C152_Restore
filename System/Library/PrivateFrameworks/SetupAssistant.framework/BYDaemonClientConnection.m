@interface BYDaemonClientConnection
+ (id)daemonProtocolInterface;
- (BYDaemonClientConnection)initWithConnection:(id)a3;
- (BYDaemonContext)context;
- (NSXPCConnection)connection;
- (void)setConnection:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation BYDaemonClientConnection

- (BYDaemonClientConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYDaemonClientConnection;
  v5 = [(BYDaemonClientConnection *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BYDaemonClientConnection *)v5 setConnection:v4];
  }

  return v6;
}

+ (id)daemonProtocolInterface
{
  return 0;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (BYDaemonContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end