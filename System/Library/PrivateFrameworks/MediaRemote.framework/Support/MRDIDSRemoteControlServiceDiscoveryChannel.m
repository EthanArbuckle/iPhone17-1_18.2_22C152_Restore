@interface MRDIDSRemoteControlServiceDiscoveryChannel
- (MRDIDSServerClientConnection)client;
- (MRDIDSTransportConnection)transport;
- (id)debugDescription;
- (void)setClient:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation MRDIDSRemoteControlServiceDiscoveryChannel

- (id)debugDescription
{
  id v2 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v3 = MRCreateIndentedDebugDescriptionFromObject();
  [v2 appendFormat:@"  client = %@\n", v3];

  v4 = MRCreateIndentedDebugDescriptionFromObject();
  [v2 appendFormat:@"  transport = %@\n", v4];

  [v2 appendString:@"}>"];

  return v2;
}

- (MRDIDSTransportConnection)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (MRDIDSServerClientConnection)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_transport, 0);
}

@end