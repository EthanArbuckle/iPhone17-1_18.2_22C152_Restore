@interface MRRegisterVoiceInputDeviceResponseMessage
- (MRRegisterVoiceInputDeviceResponseMessage)initWithDeviceID:(unsigned int)a3 errorCode:(int64_t)a4;
- (int64_t)errorCode;
- (unint64_t)type;
- (unsigned)deviceID;
@end

@implementation MRRegisterVoiceInputDeviceResponseMessage

- (MRRegisterVoiceInputDeviceResponseMessage)initWithDeviceID:(unsigned int)a3 errorCode:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)MRRegisterVoiceInputDeviceResponseMessage;
  v6 = [(MRProtocolMessage *)&v9 init];
  if (v6)
  {
    v7 = objc_alloc_init(_MRRegisterVoiceInputDeviceResponseMessageProtobuf);
    [(_MRRegisterVoiceInputDeviceResponseMessageProtobuf *)v7 setDeviceID:v5];
    [(_MRRegisterVoiceInputDeviceResponseMessageProtobuf *)v7 setErrorCode:a4];
    [(MRProtocolMessage *)v6 setUnderlyingCodableMessage:v7];
  }
  return v6;
}

- (unint64_t)type
{
  return 29;
}

- (unsigned)deviceID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = [v2 deviceID];

  return v3;
}

- (int64_t)errorCode
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int64_t v3 = [v2 errorCode];

  return v3;
}

@end