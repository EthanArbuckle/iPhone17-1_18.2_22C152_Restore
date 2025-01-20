@interface MRCreateHostedEndpointResponseMessage
- (MRCreateHostedEndpointResponseMessage)initWithGroupUID:(id)a3;
- (NSString)groupUID;
- (unint64_t)type;
@end

@implementation MRCreateHostedEndpointResponseMessage

- (MRCreateHostedEndpointResponseMessage)initWithGroupUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRCreateHostedEndpointResponseMessage;
  v5 = [(MRProtocolMessage *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRCreateHostedEndpointResponseProtobuf);
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];

    v7 = (void *)[v4 copy];
    v8 = [(MRProtocolMessage *)v5 underlyingCodableMessage];
    [v8 setGroupUID:v7];
  }
  return v5;
}

- (NSString)groupUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 groupUID];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 122;
}

@end