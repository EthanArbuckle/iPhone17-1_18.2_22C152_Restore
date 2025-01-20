@interface MRSendPackedVirtualTouchEventMessage
- (MRSendPackedVirtualTouchEventMessage)initWithTouchEvent:(_MRHIDTouchEvent *)a3 virtualDeviceID:(unint64_t)a4;
- (_MRHIDTouchEvent)event;
- (id)description;
- (unint64_t)type;
- (unint64_t)virtualDeviceID;
@end

@implementation MRSendPackedVirtualTouchEventMessage

- (MRSendPackedVirtualTouchEventMessage)initWithTouchEvent:(_MRHIDTouchEvent *)a3 virtualDeviceID:(unint64_t)a4
{
  __int16 v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)MRSendPackedVirtualTouchEventMessage;
  v6 = [(MRProtocolMessage *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(_MRSendPackedVirtualTouchEventMessageProtobuf);
    float var1 = a3->var0.var0.var1;
    v12[0] = (int)a3->var0.var0.var0;
    v12[1] = (int)var1;
    v12[2] = a3->var1;
    v12[3] = v4;
    v12[4] = a3->var3;
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:10];
    [(_MRSendPackedVirtualTouchEventMessageProtobuf *)v7 setData:v9];

    [(MRProtocolMessage *)v6 setUnderlyingCodableMessage:v7];
    [(MRProtocolMessage *)v6 setTimestamp:a3->var2];
  }
  return v6;
}

- (_MRHIDTouchEvent)event
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v6 = [v5 data];
  [v6 getBytes:v9 length:10];

  *(void *)&retstr->float var1 = 0;
  retstr->var2 = 0;
  *(void *)&retstr->var3 = 0;
  float v7 = (float)v9[1];
  retstr->var0.var0.var0 = (float)v9[0];
  retstr->var0.var0.float var1 = v7;
  retstr->float var1 = v9[2];
  retstr->var2 = [(MRProtocolMessage *)self timestamp];
  retstr->var3 = v9[4];

  return result;
}

- (unint64_t)virtualDeviceID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 data];
  [v3 getBytes:v6 length:10];

  unint64_t v4 = v7;
  return v4;
}

- (unint64_t)type
{
  return 43;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v4 = [v3 data];
  [v4 getBytes:v14 length:10];

  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  __int16 v7 = NSStringFromClass(v6);
  unint64_t v8 = [(MRProtocolMessage *)self timestamp];
  v9 = [(MRProtocolMessage *)self error];
  uint64_t v10 = [(MRProtocolMessage *)self replyIdentifier];
  unint64_t v11 = [(MRSendPackedVirtualTouchEventMessage *)self type];
  v12 = [v5 stringWithFormat:@"\n<Message Type: %@\nTimestamp: %llu\nError: %@\nIdentifier: %@\nType: %lul\nMessage: x: %u y: %u phase: %u deviceID: %u finger: %u\n>", v7, v8, v9, v10, v11, v14[0], v14[1], v14[2], v14[3], v14[4]];

  return v12;
}

@end