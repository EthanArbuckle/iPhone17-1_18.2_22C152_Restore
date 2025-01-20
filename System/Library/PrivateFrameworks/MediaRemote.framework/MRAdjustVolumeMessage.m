@interface MRAdjustVolumeMessage
- (MRAdjustVolumeMessage)initWithAdjustment:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5;
- (MRRequestDetails)details;
- (NSString)outputDeviceUID;
- (int64_t)adjustment;
- (unint64_t)type;
@end

@implementation MRAdjustVolumeMessage

- (MRAdjustVolumeMessage)initWithAdjustment:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRAdjustVolumeMessage;
  v10 = [(MRProtocolMessage *)&v14 init];
  if (v10)
  {
    v11 = objc_alloc_init(_MRAdjustVolumeMessageProtobuf);
    [(_MRAdjustVolumeMessageProtobuf *)v11 setAdjustment:a3];
    [(_MRAdjustVolumeMessageProtobuf *)v11 setOutputDeviceUID:v8];
    v12 = [v9 protobuf];
    [(_MRAdjustVolumeMessageProtobuf *)v11 setDetails:v12];

    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v11];
  }

  return v10;
}

- (int64_t)adjustment
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int64_t v3 = (int)[v2 adjustment];

  return v3;
}

- (NSString)outputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int64_t v3 = [v2 outputDeviceUID];

  return (NSString *)v3;
}

- (MRRequestDetails)details
{
  int64_t v3 = [MRRequestDetails alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [v4 details];
  v6 = [(MRRequestDetails *)v3 initWithProtobuf:v5];

  return v6;
}

- (unint64_t)type
{
  return 125;
}

@end