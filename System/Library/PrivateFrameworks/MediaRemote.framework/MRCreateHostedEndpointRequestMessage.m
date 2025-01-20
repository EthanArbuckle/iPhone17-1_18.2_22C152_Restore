@interface MRCreateHostedEndpointRequestMessage
- (MRCreateHostedEndpointRequestMessage)initWithOutputDeviceUIDs:(id)a3;
- (NSArray)outputDeviceUIDs;
- (unint64_t)type;
@end

@implementation MRCreateHostedEndpointRequestMessage

- (MRCreateHostedEndpointRequestMessage)initWithOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRCreateHostedEndpointRequestMessage;
  v5 = [(MRProtocolMessage *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRCreateHostedEndpointRequestProtobuf);
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];

    v7 = (void *)[v4 mutableCopy];
    v8 = [(MRProtocolMessage *)v5 underlyingCodableMessage];
    [v8 setOutputDeviceUIDs:v7];
  }
  return v5;
}

- (NSArray)outputDeviceUIDs
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 outputDeviceUIDs];

  return (NSArray *)v3;
}

- (unint64_t)type
{
  return 121;
}

@end