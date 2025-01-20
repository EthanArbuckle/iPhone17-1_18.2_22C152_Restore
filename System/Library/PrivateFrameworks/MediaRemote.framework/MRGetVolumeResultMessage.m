@interface MRGetVolumeResultMessage
- (MRGetVolumeResultMessage)initWithVolume:(float)a3;
- (float)volume;
- (unint64_t)type;
@end

@implementation MRGetVolumeResultMessage

- (MRGetVolumeResultMessage)initWithVolume:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeResultMessage;
  v4 = [(MRProtocolMessage *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(_MRGetVolumeResultMessageProtobuf);
    *(float *)&double v6 = a3;
    [(_MRGetVolumeResultMessageProtobuf *)v5 setVolume:v6];
    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (float)volume
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (unint64_t)type
{
  return 50;
}

@end