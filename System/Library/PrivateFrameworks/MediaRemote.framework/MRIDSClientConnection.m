@interface MRIDSClientConnection
- (MRIDSClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (unsigned)discoveryMode;
- (void)setDiscoveryMode:(unsigned int)a3;
@end

@implementation MRIDSClientConnection

- (MRIDSClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MRIDSClientConnection;
  return [(MRProtocolClientConnection *)&v5 initWithConnection:a3 queue:a4];
}

- (unsigned)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  self->_discoveryMode = a3;
}

@end