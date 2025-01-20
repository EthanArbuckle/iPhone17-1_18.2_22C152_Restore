@interface MRSetDiscoveryModeMessage
- (MRAVRoutingDiscoverySessionConfiguration)configuration;
- (MRSetDiscoveryModeMessage)initWithMode:(unsigned int)a3 configuration:(id)a4;
- (MRSetDiscoveryModeMessage)initWithMode:(unsigned int)a3 features:(unsigned int)a4;
- (MRSetDiscoveryModeMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (unint64_t)type;
- (unsigned)mode;
@end

@implementation MRSetDiscoveryModeMessage

- (MRSetDiscoveryModeMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRSetDiscoveryModeMessage;
  v7 = [(MRProtocolMessage *)&v14 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    v7->_mode = [v6 mode];
    if ([v6 hasConfiguration])
    {
      v8 = [MRAVRoutingDiscoverySessionConfiguration alloc];
      v9 = [v6 configuration];
      uint64_t v10 = [(MRAVRoutingDiscoverySessionConfiguration *)v8 initWithProtobuf:v9];
      configuration = v7->_configuration;
      v7->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v10;

LABEL_6:
      goto LABEL_7;
    }
    if ([v6 hasFeatures])
    {
      v12 = -[MRAVRoutingDiscoverySessionConfiguration initWithEndpointFeatures:]([MRAVRoutingDiscoverySessionConfiguration alloc], "initWithEndpointFeatures:", [v6 features]);
      v9 = v7->_configuration;
      v7->_configuration = v12;
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (MRSetDiscoveryModeMessage)initWithMode:(unsigned int)a3 configuration:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRSetDiscoveryModeMessage;
  v7 = [(MRProtocolMessage *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_mode = v4;
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v9;

    v11 = objc_alloc_init(_MRSetDiscoveryModeProtobufMessage);
    [(_MRSetDiscoveryModeProtobufMessage *)v11 setMode:v4];
    v12 = [v6 protobuf];
    [(_MRSetDiscoveryModeProtobufMessage *)v11 setConfiguration:v12];

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v11];
  }

  return v8;
}

- (MRSetDiscoveryModeMessage)initWithMode:(unsigned int)a3 features:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = [[MRAVRoutingDiscoverySessionConfiguration alloc] initWithEndpointFeatures:*(void *)&a4];
  v7 = [(MRSetDiscoveryModeMessage *)self initWithMode:v4 configuration:v6];

  return v7;
}

- (unint64_t)type
{
  return 101;
}

- (unsigned)mode
{
  return self->_mode;
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end