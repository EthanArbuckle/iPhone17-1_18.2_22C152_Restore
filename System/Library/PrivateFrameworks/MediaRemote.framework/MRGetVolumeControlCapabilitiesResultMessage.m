@interface MRGetVolumeControlCapabilitiesResultMessage
- (MRGetVolumeControlCapabilitiesResultMessage)initWithCapabilities:(unsigned int)a3;
- (unint64_t)type;
- (unsigned)capabilities;
@end

@implementation MRGetVolumeControlCapabilitiesResultMessage

- (MRGetVolumeControlCapabilitiesResultMessage)initWithCapabilities:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeControlCapabilitiesResultMessage;
  v4 = [(MRProtocolMessage *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(_MRGetVolumeControlCapabilitiesResultMessageProtobuf);
    v6 = MRCapabilitiesToProtobuf(v3);
    [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)v5 setCapabilities:v6];

    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (unsigned)capabilities
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  uint64_t v3 = [v2 capabilities];
  unsigned int v4 = MRCapabilitiesFromProtobuf(v3);

  return v4;
}

- (unint64_t)type
{
  return 63;
}

@end