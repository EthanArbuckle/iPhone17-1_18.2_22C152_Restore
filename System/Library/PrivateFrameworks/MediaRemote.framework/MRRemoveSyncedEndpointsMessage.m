@interface MRRemoveSyncedEndpointsMessage
- (MRRemoveSyncedEndpointsMessage)initWithEndpointUIDs:(id)a3;
- (NSArray)endpointUIDs;
- (unint64_t)type;
@end

@implementation MRRemoveSyncedEndpointsMessage

- (MRRemoveSyncedEndpointsMessage)initWithEndpointUIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRemoveSyncedEndpointsMessage;
  v5 = [(MRProtocolMessage *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRRemoveEndpointsMessageProtobuf);
    v7 = (void *)[v4 mutableCopy];
    [(_MRRemoveEndpointsMessageProtobuf *)v6 setEndpointUIDs:v7];

    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }

  return v5;
}

- (NSArray)endpointUIDs
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 endpointUIDs];

  return (NSArray *)v3;
}

- (unint64_t)type
{
  return 103;
}

@end