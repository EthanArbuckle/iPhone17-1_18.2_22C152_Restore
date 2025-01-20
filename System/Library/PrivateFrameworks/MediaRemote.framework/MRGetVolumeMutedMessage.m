@interface MRGetVolumeMutedMessage
- (MRGetVolumeMutedMessage)initWithOutputDeviceUID:(id)a3;
- (NSString)outputDeviceUID;
- (unint64_t)type;
@end

@implementation MRGetVolumeMutedMessage

- (MRGetVolumeMutedMessage)initWithOutputDeviceUID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MRGetVolumeMutedMessage;
  v5 = [(MRProtocolMessage *)&v8 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRGetVolumeMutedMessageProtobuf);
    [(_MRGetVolumeMutedMessageProtobuf *)v6 setOutputDeviceUID:v4];
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }
  return v5;
}

- (NSString)outputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 outputDeviceUID];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 126;
}

@end