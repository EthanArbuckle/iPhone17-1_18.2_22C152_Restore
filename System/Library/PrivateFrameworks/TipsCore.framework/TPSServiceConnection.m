@interface TPSServiceConnection
- (NSString)serviceName;
- (NSXPCInterface)exportedInterfaceInstance;
- (NSXPCInterface)remoteInterfaceInstance;
- (TPSServiceConnection)init;
- (TPSServiceConnection)initWithServiceName:(id)a3;
- (id)connection;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)invalidate;
- (void)setExportedInterfaceInstance:(id)a3;
- (void)setRemoteInterfaceInstance:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation TPSServiceConnection

- (void)setRemoteInterfaceInstance:(id)a3
{
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = [_TPSXPCConnection alloc];
    v5 = [(TPSServiceConnection *)self serviceName];
    v6 = [(_TPSXPCConnection *)v4 initWithMachServiceName:v5 options:4096];
    v7 = self->_connection;
    self->_connection = v6;

    [(_TPSXPCConnection *)self->_connection setExportedObject:self];
    [(_TPSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  return connection;
}

- (id)remoteInterface
{
  v2 = [(TPSServiceConnection *)self remoteInterfaceInstance];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F29280]);
  }
  v5 = v4;

  return v5;
}

- (NSXPCInterface)remoteInterfaceInstance
{
  return self->_remoteInterfaceInstance;
}

- (id)exportedInterface
{
  v2 = [(TPSServiceConnection *)self exportedInterfaceInstance];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F29280]);
  }
  v5 = v4;

  return v5;
}

- (NSXPCInterface)exportedInterfaceInstance
{
  return self->_exportedInterfaceInstance;
}

- (TPSServiceConnection)init
{
  return [(TPSServiceConnection *)self initWithServiceName:@"com.apple.tipsd"];
}

- (TPSServiceConnection)initWithServiceName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSServiceConnection;
  v6 = [(TPSServiceConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceName, a3);
  }

  return v7;
}

- (void)invalidate
{
  [(_TPSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)setExportedInterfaceInstance:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_exportedInterfaceInstance, 0);
  objc_storeStrong((id *)&self->_remoteInterfaceInstance, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end