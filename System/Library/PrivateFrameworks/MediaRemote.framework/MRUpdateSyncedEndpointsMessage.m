@interface MRUpdateSyncedEndpointsMessage
- (MRUpdateSyncedEndpointsMessage)initWithEndpoints:(id)a3 endpointFeature:(unsigned int)a4;
- (NSArray)endpoints;
- (unint64_t)type;
- (unsigned)features;
@end

@implementation MRUpdateSyncedEndpointsMessage

- (MRUpdateSyncedEndpointsMessage)initWithEndpoints:(id)a3 endpointFeature:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRUpdateSyncedEndpointsMessage;
  v7 = [(MRProtocolMessage *)&v12 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRUpdateEndpointsMessageProtobuf);
    v9 = objc_msgSend(v6, "mr_map:", &__block_literal_global_77);
    v10 = (void *)[v9 mutableCopy];
    [(_MRUpdateEndpointsMessageProtobuf *)v8 setEndpoints:v10];

    [(_MRUpdateEndpointsMessageProtobuf *)v8 setEndpointFeatures:v4];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

uint64_t __68__MRUpdateSyncedEndpointsMessage_initWithEndpoints_endpointFeature___block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (NSArray)endpoints
{
  endpoints = self->_endpoints;
  if (!endpoints)
  {
    uint64_t v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v5 = [v4 endpoints];
    objc_msgSend(v5, "mr_map:", &__block_literal_global_80);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_endpoints;
    self->_endpoints = v6;

    endpoints = self->_endpoints;
  }

  return endpoints;
}

MRAVDistantEndpoint *__43__MRUpdateSyncedEndpointsMessage_endpoints__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVDistantEndpoint alloc] initWithDescriptor:v2];

  return v3;
}

- (unsigned)features
{
  id v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = [v2 endpointFeatures];

  return v3;
}

- (unint64_t)type
{
  return 102;
}

- (void).cxx_destruct
{
}

@end