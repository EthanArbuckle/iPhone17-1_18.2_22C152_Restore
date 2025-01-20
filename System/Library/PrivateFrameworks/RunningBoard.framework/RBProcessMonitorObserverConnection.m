@interface RBProcessMonitorObserverConnection
- (NSString)description;
- (RBProcessMonitorObserverConnection)initWithConnection:(id)a3;
- (void)sendMessage:(id)a3 replyQueue:(id)a4 completion:(id)a5;
@end

@implementation RBProcessMonitorObserverConnection

- (void)sendMessage:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
}

- (RBProcessMonitorObserverConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBProcessMonitorObserverConnection;
  v6 = [(RBProcessMonitorObserverConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  id v5 = (void *)[v3 initWithFormat:@"<%@| pid:%d>", v4, xpc_connection_get_pid(self->_connection)];

  return (NSString *)v5;
}

@end