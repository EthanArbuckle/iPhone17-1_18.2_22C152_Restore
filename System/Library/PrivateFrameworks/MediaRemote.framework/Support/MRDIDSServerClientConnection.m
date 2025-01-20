@interface MRDIDSServerClientConnection
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRDIDSServerClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (void)setConfiguration:(id)a3;
@end

@implementation MRDIDSServerClientConnection

- (MRDIDSServerClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MRDIDSServerClientConnection;
  return [(MRDIDSServerClientConnection *)&v5 initWithConnection:a3 queue:a4];
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end