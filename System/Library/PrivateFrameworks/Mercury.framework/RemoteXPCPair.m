@interface RemoteXPCPair
- (OS_xpc_remote_connection)client;
- (OS_xpc_remote_connection)server;
- (RemoteXPCPair)initWithClient:(id)a3 server:(id)a4;
- (void)setClient:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation RemoteXPCPair

- (RemoteXPCPair)initWithClient:(id)a3 server:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RemoteXPCPair;
  v9 = [(RemoteXPCPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_server, a4);
  }

  return v10;
}

- (OS_xpc_remote_connection)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (OS_xpc_remote_connection)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end