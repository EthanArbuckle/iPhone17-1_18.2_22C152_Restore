@interface MRMuteVolumeMessage
- (BOOL)isMuted;
- (MRMuteVolumeMessage)initWithMuted:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5;
- (MRRequestDetails)details;
- (NSString)outputDeviceUID;
- (unint64_t)type;
@end

@implementation MRMuteVolumeMessage

- (MRMuteVolumeMessage)initWithMuted:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRMuteVolumeMessage;
  v10 = [(MRProtocolMessage *)&v14 init];
  if (v10)
  {
    v11 = objc_alloc_init(_MRSetVolumeMutedMessageProtobuf);
    [(_MRSetVolumeMutedMessageProtobuf *)v11 setIsMuted:v6];
    [(_MRSetVolumeMutedMessageProtobuf *)v11 setOutputDeviceUID:v8];
    v12 = [v9 protobuf];
    [(_MRSetVolumeMutedMessageProtobuf *)v11 setDetails:v12];

    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v11];
  }

  return v10;
}

- (NSString)outputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 outputDeviceUID];

  return (NSString *)v3;
}

- (BOOL)isMuted
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  char v3 = [v2 isMuted];

  return v3;
}

- (MRRequestDetails)details
{
  char v3 = [MRRequestDetails alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 details];
  BOOL v6 = [(MRRequestDetails *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 128;
}

@end