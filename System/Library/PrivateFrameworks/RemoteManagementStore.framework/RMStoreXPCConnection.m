@interface RMStoreXPCConnection
+ (id)storeXPCConnection:(id)a3;
- (NSXPCConnection)connection;
- (RMStoreXPCConnection)initWithXPCConnection:(id)a3;
- (void)dealloc;
@end

@implementation RMStoreXPCConnection

+ (id)storeXPCConnection:(id)a3
{
  id v3 = a3;
  v4 = [[RMStoreXPCConnection alloc] initWithXPCConnection:v3];

  return v4;
}

- (RMStoreXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMStoreXPCConnection;
  v6 = [(RMStoreXPCConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)dealloc
{
  id v3 = [(RMStoreXPCConnection *)self connection];

  if (v3)
  {
    v4 = [(RMStoreXPCConnection *)self connection];
    [v4 invalidate];

    connection = self->_connection;
    self->_connection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RMStoreXPCConnection;
  [(RMStoreXPCConnection *)&v6 dealloc];
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end