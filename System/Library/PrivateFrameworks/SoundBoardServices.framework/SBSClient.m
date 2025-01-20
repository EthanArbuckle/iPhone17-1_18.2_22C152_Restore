@interface SBSClient
- (NSXPCConnection)connection;
- (unint64_t)clientType;
- (void)setClientType:(unint64_t)a3;
- (void)setConnection:(id)a3;
@end

@implementation SBSClient

- (void).cxx_destruct
{
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

@end