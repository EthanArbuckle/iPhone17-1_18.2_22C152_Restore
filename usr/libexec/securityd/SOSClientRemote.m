@interface SOSClientRemote
- (BOOL)checkEntitlement:(id)a3;
- (NSXPCConnection)connection;
- (id)initSOSConnectionWithConnection:(id)a3 account:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation SOSClientRemote

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (BOOL)checkEntitlement:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v6 = [WeakRetained valueForEntitlement:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = sub_10000B070("SecError");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109378;
      v10[1] = [WeakRetained processIdentifier];
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sos: Client pid: %d doesn't have entitlement: %@", (uint8_t *)v10, 0x12u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (id)initSOSConnectionWithConnection:(id)a3 account:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSClientRemote;
  id v7 = [(SOSClient *)&v10 initSOSClientWithAccount:a4];
  v8 = v7;
  if (v7) {
    [v7 setConnection:v6];
  }

  return v8;
}

@end