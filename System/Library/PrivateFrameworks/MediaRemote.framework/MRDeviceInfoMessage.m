@interface MRDeviceInfoMessage
- (MRDeviceInfo)deviceInfo;
- (MRDeviceInfoMessage)initWithDeviceInfo:(id)a3;
- (MRSupportedProtocolMessages)supportedProtocolMessages;
- (uint64_t)_lastSupportedMessageType;
- (unint64_t)encryptionType;
- (unint64_t)type;
@end

@implementation MRDeviceInfoMessage

- (MRDeviceInfoMessage)initWithDeviceInfo:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRDeviceInfoMessage;
  v5 = [(MRProtocolMessage *)&v14 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];
    [v4 setBundleIdentifier:v7];

    v8 = [v6 infoDictionary];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];
    [v4 setBundleVersion:v9];

    v10 = [MEMORY[0x1E4F28F80] processInfo];
    v11 = [v10 processName];

    if ([v11 isEqualToString:@"tvremoted"]) {
      [v4 setBundleIdentifier:@"com.apple.tvremotecore.xpc"];
    }
    v12 = [v4 protobuf];
    [v12 setLastSupportedMessageType:137];
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v12];
  }
  return v5;
}

- (MRDeviceInfo)deviceInfo
{
  v3 = [MRDeviceInfo alloc];
  id v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [(MRDeviceInfo *)v3 initWithProtobuf:v4];

  -[MRDeviceInfo setLastSupportedProtocolMessageType:](v5, "setLastSupportedProtocolMessageType:", -[MRDeviceInfoMessage _lastSupportedMessageType](self));

  return v5;
}

- (uint64_t)_lastSupportedMessageType
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    v2 = [a1 underlyingCodableMessage];
    if ([v2 hasLastSupportedMessageType])
    {
      v3 = [(id)v1 underlyingCodableMessage];
      uint64_t v1 = [v3 lastSupportedMessageType];
    }
    else
    {
      uint64_t v1 = 36;
    }
  }
  return v1;
}

- (MRSupportedProtocolMessages)supportedProtocolMessages
{
  supportedProtocolMessages = self->_supportedProtocolMessages;
  if (!supportedProtocolMessages)
  {
    id v4 = -[MRSupportedProtocolMessages initWithLastSupportedMessageType:]([MRSupportedProtocolMessages alloc], "initWithLastSupportedMessageType:", -[MRDeviceInfoMessage _lastSupportedMessageType](self));
    v5 = self->_supportedProtocolMessages;
    self->_supportedProtocolMessages = v4;

    supportedProtocolMessages = self->_supportedProtocolMessages;
  }

  return supportedProtocolMessages;
}

- (unint64_t)encryptionType
{
  return 2;
}

- (unint64_t)type
{
  return 15;
}

- (void).cxx_destruct
{
}

@end