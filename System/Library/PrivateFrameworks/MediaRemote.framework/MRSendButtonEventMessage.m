@interface MRSendButtonEventMessage
- (MRSendButtonEventMessage)initWithButtonEvent:(_MRHIDButtonEvent)a3;
- (_MRHIDButtonEvent)buttonEvent;
- (unint64_t)type;
@end

@implementation MRSendButtonEventMessage

- (MRSendButtonEventMessage)initWithButtonEvent:(_MRHIDButtonEvent)a3
{
  BOOL var2 = a3.var2;
  unint64_t v4 = *(void *)&a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)MRSendButtonEventMessage;
  v5 = [(MRProtocolMessage *)&v8 init];
  if (v5)
  {
    v6 = objc_alloc_init(_MRSendButtonEventMessageProtobuf);
    [(_MRSendButtonEventMessageProtobuf *)v6 setUsagePage:v4];
    [(_MRSendButtonEventMessageProtobuf *)v6 setUsage:HIDWORD(v4)];
    [(_MRSendButtonEventMessageProtobuf *)v6 setButtonDown:var2];
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v6];
  }
  return v5;
}

- (_MRHIDButtonEvent)buttonEvent
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = [v2 usagePage];
  uint64_t v4 = [v2 usage];
  int v5 = [v2 buttonDown];

  unint64_t v6 = v3 | (unint64_t)(v4 << 32);
  BOOL v7 = v5;
  result.var0 = v6;
  result.var1 = HIDWORD(v6);
  result.BOOL var2 = v7;
  return result;
}

- (unint64_t)type
{
  return 39;
}

@end