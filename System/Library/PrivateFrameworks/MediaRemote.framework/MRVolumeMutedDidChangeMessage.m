@interface MRVolumeMutedDidChangeMessage
- (BOOL)isMuted;
- (MRVolumeMutedDidChangeMessage)initWithMuted:(BOOL)a3 outputDeviceUID:(id)a4;
- (NSString)outputDeviceUID;
- (unint64_t)type;
@end

@implementation MRVolumeMutedDidChangeMessage

- (MRVolumeMutedDidChangeMessage)initWithMuted:(BOOL)a3 outputDeviceUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MRVolumeMutedDidChangeMessage;
  v7 = [(MRProtocolMessage *)&v10 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRVolumeMutedDidChangeMessageProtobuf);
    [(_MRVolumeMutedDidChangeMessageProtobuf *)v8 setIsMuted:v4];
    [(_MRVolumeMutedDidChangeMessageProtobuf *)v8 setOutputDeviceUID:v6];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (BOOL)isMuted
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 isMuted];

  return v3;
}

- (NSString)outputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 outputDeviceUID];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 129;
}

@end