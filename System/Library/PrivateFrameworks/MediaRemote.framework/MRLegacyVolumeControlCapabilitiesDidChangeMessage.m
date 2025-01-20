@interface MRLegacyVolumeControlCapabilitiesDidChangeMessage
- (MRLegacyVolumeControlCapabilitiesDidChangeMessage)initWithCapabilities:(unsigned int)a3;
- (unint64_t)type;
- (unsigned)capabilities;
@end

@implementation MRLegacyVolumeControlCapabilitiesDidChangeMessage

- (MRLegacyVolumeControlCapabilitiesDidChangeMessage)initWithCapabilities:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)MRLegacyVolumeControlCapabilitiesDidChangeMessage;
  v4 = [(MRProtocolMessage *)&v7 init];
  if (v4)
  {
    v5 = MRCapabilitiesToProtobuf(v3);
    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (unsigned)capabilities
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = MRCapabilitiesFromProtobuf(v2);

  return v3;
}

- (unint64_t)type
{
  return 17;
}

@end