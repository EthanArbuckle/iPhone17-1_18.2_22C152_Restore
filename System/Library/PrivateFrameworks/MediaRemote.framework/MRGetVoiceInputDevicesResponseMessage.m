@interface MRGetVoiceInputDevicesResponseMessage
- (MRGetVoiceInputDevicesResponseMessage)initWithDeviceIDs:(id)a3 errorCode:(int64_t)a4;
- (NSArray)deviceIDs;
- (int64_t)errorCode;
- (unint64_t)type;
@end

@implementation MRGetVoiceInputDevicesResponseMessage

- (MRGetVoiceInputDevicesResponseMessage)initWithDeviceIDs:(id)a3 errorCode:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRGetVoiceInputDevicesResponseMessage;
  v7 = [(MRProtocolMessage *)&v19 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRGetVoiceInputDevicesResponseMessageProtobuf);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          -[_MRGetVoiceInputDevicesResponseMessageProtobuf addDeviceIDs:](v8, "addDeviceIDs:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13++), "unsignedIntValue", (void)v15));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }

    [(_MRGetVoiceInputDevicesResponseMessageProtobuf *)v8 setErrorCode:a4];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (unint64_t)type
{
  return 27;
}

- (NSArray)deviceIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  uint64_t v5 = [v4 deviceIDsCount];

  if (v5)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      v8 = NSNumber;
      id v9 = [(MRProtocolMessage *)self underlyingCodableMessage];
      uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "deviceIDsAtIndex:", v6));
      [v3 addObject:v10];

      uint64_t v6 = v7;
      uint64_t v11 = [(MRProtocolMessage *)self underlyingCodableMessage];
      unint64_t v12 = [v11 deviceIDsCount];
    }
    while (v12 > v7++);
  }

  return (NSArray *)v3;
}

- (int64_t)errorCode
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  int64_t v3 = [v2 errorCode];

  return v3;
}

@end