@interface MRVolumeControlCapabilitiesDidChangeMessage
- (MRVolumeControlCapabilitiesDidChangeMessage)initWithCapabilities:(unsigned int)a3 endpointUID:(id)a4 outputDeviceUID:(id)a5;
- (NSString)endpointUID;
- (NSString)outputDeviceUID;
- (unint64_t)type;
- (unsigned)capabilities;
@end

@implementation MRVolumeControlCapabilitiesDidChangeMessage

- (MRVolumeControlCapabilitiesDidChangeMessage)initWithCapabilities:(unsigned int)a3 endpointUID:(id)a4 outputDeviceUID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRVolumeControlCapabilitiesDidChangeMessage;
  v10 = [(MRProtocolMessage *)&v14 init];
  if (v10)
  {
    v11 = objc_alloc_init(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf);
    v12 = MRCapabilitiesToProtobuf(v6);
    [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)v11 setCapabilities:v12];

    [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)v11 setEndpointUID:v8];
    [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)v11 setOutputDeviceUID:v9];
    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v11];
  }
  return v10;
}

- (unsigned)capabilities
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 capabilities];
  unsigned int v4 = MRCapabilitiesFromProtobuf(v3);

  return v4;
}

- (NSString)endpointUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 endpointUID];

  return (NSString *)v3;
}

- (NSString)outputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 outputDeviceUID];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 64;
}

@end