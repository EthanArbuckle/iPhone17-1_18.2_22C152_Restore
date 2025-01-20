@interface MRDiscoveryUpdateOutputDevicesMessage
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRDiscoveryUpdateOutputDevicesMessage)initWithOutputDevices:(id)a3 configuration:(id)a4;
- (MRDiscoveryUpdateOutputDevicesMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (NSArray)outputDevices;
- (unint64_t)type;
@end

@implementation MRDiscoveryUpdateOutputDevicesMessage

- (MRDiscoveryUpdateOutputDevicesMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRDiscoveryUpdateOutputDevicesMessage;
  v7 = [(MRProtocolMessage *)&v16 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    v8 = [MRAVRoutingDiscoverySessionConfiguration alloc];
    v9 = [v6 configuration];
    uint64_t v10 = [(MRAVRoutingDiscoverySessionConfiguration *)v8 initWithProtobuf:v9];
    configuration = v7->_configuration;
    v7->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v10;

    v12 = [v6 outputDevices];
    uint64_t v13 = objc_msgSend(v12, "mr_map:", &__block_literal_global_44);
    outputDevices = v7->_outputDevices;
    v7->_outputDevices = (NSArray *)v13;
  }
  return v7;
}

MRAVDistantOutputDevice *__80__MRDiscoveryUpdateOutputDevicesMessage_initWithUnderlyingCodableMessage_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVDistantOutputDevice alloc] initWithDescriptor:v2];

  return v3;
}

- (MRDiscoveryUpdateOutputDevicesMessage)initWithOutputDevices:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MRDiscoveryUpdateOutputDevicesMessage;
  v8 = [(MRProtocolMessage *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    outputDevices = v8->_outputDevices;
    v8->_outputDevices = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    configuration = v8->_configuration;
    v8->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v11;

    uint64_t v13 = objc_alloc_init(_MRDiscoveryUpdateOutputDevicesProtobufMessage);
    v14 = objc_msgSend(v6, "mr_map:", &__block_literal_global_49_0);
    v15 = (void *)[v14 mutableCopy];
    [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)v13 setOutputDevices:v15];

    objc_super v16 = [v7 protobuf];
    [(_MRDiscoveryUpdateOutputDevicesProtobufMessage *)v13 setConfiguration:v16];

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v13];
  }

  return v8;
}

uint64_t __77__MRDiscoveryUpdateOutputDevicesMessage_initWithOutputDevices_configuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 descriptor];
}

- (unint64_t)type
{
  return 109;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_outputDevices, 0);
}

@end