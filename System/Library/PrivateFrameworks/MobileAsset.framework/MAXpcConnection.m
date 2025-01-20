@interface MAXpcConnection
- (BOOL)notValid;
- (MAXpcConnection)initWithServiceName:(id)a3;
- (NSString)connectionId;
- (OS_xpc_object)connection;
@end

@implementation MAXpcConnection

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (NSString)connectionId
{
  return self->_connectionId;
}

- (MAXpcConnection)initWithServiceName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MAXpcConnection;
  v5 = [(MAXpcConnection *)&v12 init];
  if (v5)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v4 UTF8String], 0, 0);
    connection = v5->_connection;
    v5->_connection = mach_service;

    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    connectionId = v5->_connectionId;
    v5->_connectionId = (NSString *)v9;
  }
  return v5;
}

- (BOOL)notValid
{
  return !self->_connection || !self->_connectionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end