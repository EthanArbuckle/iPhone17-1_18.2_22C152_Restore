@interface MRSendVirtualTouchEventMessage
- (MRSendVirtualTouchEventMessage)initWithTouchEvent:(_MRHIDTouchEvent *)a3 virtualDeviceID:(unint64_t)a4;
- (_MRHIDTouchEvent)event;
- (unint64_t)type;
- (unint64_t)virtualDeviceID;
@end

@implementation MRSendVirtualTouchEventMessage

- (MRSendVirtualTouchEventMessage)initWithTouchEvent:(_MRHIDTouchEvent *)a3 virtualDeviceID:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MRSendVirtualTouchEventMessage;
  v6 = [(MRProtocolMessage *)&v12 init];
  if (v6)
  {
    v7 = objc_alloc_init(_MRSendVirtualTouchEventMessageProtobuf);
    [(_MRSendVirtualTouchEventMessageProtobuf *)v7 setVirtualDeviceID:a4];
    v8 = objc_alloc_init(_MRVirtualTouchEventProtobuf);
    [(_MRVirtualTouchEventProtobuf *)v8 setX:a3->var0.var0.var0];
    [(_MRVirtualTouchEventProtobuf *)v8 setY:a3->var0.var0.var1];
    unsigned int var1 = a3->var1;
    if (var1 - 1 >= 5) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = var1;
    }
    [(_MRVirtualTouchEventProtobuf *)v8 setPhase:v10];
    [(_MRVirtualTouchEventProtobuf *)v8 setFinger:a3->var3];
    [(_MRSendVirtualTouchEventMessageProtobuf *)v7 setEvent:v8];
    [(MRProtocolMessage *)v6 setUnderlyingCodableMessage:v7];
    [(MRProtocolMessage *)v6 setTimestamp:a3->var2];
  }
  return v6;
}

- (_MRHIDTouchEvent)event
{
  v5 = [(MRProtocolMessage *)self underlyingCodableMessage];
  id v11 = [v5 event];

  *(_OWORD *)&retstr->var0.var0.var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  [v11 x];
  *(float *)&double v6 = v6;
  retstr->var0.var0.var0 = *(float *)&v6;
  [v11 y];
  *(float *)&double v7 = v7;
  retstr->var0.var0.unsigned int var1 = *(float *)&v7;
  unsigned int v8 = [v11 phase];
  if (v8 - 1 >= 5) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = v8;
  }
  retstr->unsigned int var1 = v9;
  retstr->var2 = [(MRProtocolMessage *)self timestamp];
  retstr->var3 = [v11 finger];

  return result;
}

- (unint64_t)virtualDeviceID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 virtualDeviceID];

  return v3;
}

- (unint64_t)type
{
  return 10;
}

@end