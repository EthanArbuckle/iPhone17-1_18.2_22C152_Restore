@interface MRDiscoveryUpdateEndpointsMessage
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRDiscoveryUpdateEndpointsMessage)initWithEndpoints:(id)a3 configuration:(id)a4;
- (MRDiscoveryUpdateEndpointsMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (NSArray)endpoints;
- (unint64_t)type;
@end

@implementation MRDiscoveryUpdateEndpointsMessage

- (MRDiscoveryUpdateEndpointsMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRDiscoveryUpdateEndpointsMessage;
  v7 = [(MRProtocolMessage *)&v16 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    v8 = [MRAVRoutingDiscoverySessionConfiguration alloc];
    v9 = [v6 configuration];
    uint64_t v10 = [(MRAVRoutingDiscoverySessionConfiguration *)v8 initWithProtobuf:v9];
    configuration = v7->_configuration;
    v7->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v10;

    v12 = [v6 endpoints];
    uint64_t v13 = objc_msgSend(v12, "mr_map:", &__block_literal_global_35);
    endpoints = v7->_endpoints;
    v7->_endpoints = (NSArray *)v13;
  }
  return v7;
}

MRAVDistantEndpoint *__76__MRDiscoveryUpdateEndpointsMessage_initWithUnderlyingCodableMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVDistantEndpoint alloc] initWithDescriptor:v2];

  return v3;
}

- (MRDiscoveryUpdateEndpointsMessage)initWithEndpoints:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRDiscoveryUpdateEndpointsMessage;
  v8 = [(MRProtocolMessage *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    endpoints = v8->_endpoints;
    v8->_endpoints = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    configuration = v8->_configuration;
    v8->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v11;

    uint64_t v13 = objc_alloc_init(_MRDiscoveryUpdateEndpointsProtobufMessage);
    v14 = objc_msgSend(v6, "mr_map:", &__block_literal_global_29);
    v15 = (void *)[v14 mutableCopy];
    [(_MRDiscoveryUpdateEndpointsProtobufMessage *)v13 setEndpoints:v15];

    objc_super v16 = [v7 protobuf];
    [(_MRDiscoveryUpdateEndpointsProtobufMessage *)v13 setConfiguration:v16];

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v13];
  }

  return v8;
}

uint64_t __69__MRDiscoveryUpdateEndpointsMessage_initWithEndpoints_configuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (unint64_t)type
{
  return 108;
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_endpoints, 0);
}

@end