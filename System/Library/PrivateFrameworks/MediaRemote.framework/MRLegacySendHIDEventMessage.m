@interface MRLegacySendHIDEventMessage
- (MRLegacySendHIDEventMessage)initWithHIDEvent:(__IOHIDEvent *)a3;
- (_MRHIDButtonEvent)buttonEvent;
- (id)description;
- (unint64_t)type;
- (void)dealloc;
@end

@implementation MRLegacySendHIDEventMessage

- (MRLegacySendHIDEventMessage)initWithHIDEvent:(__IOHIDEvent *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRLegacySendHIDEventMessage;
  v5 = [(MRProtocolMessage *)&v10 init];
  if (v5)
  {
    if (!a3)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v5, @"MRLegacySendHIDEventMessage.m", 23, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
    }
    v5->_event = (__IOHIDEvent *)CFRetain(a3);
    Data = (void *)IOHIDEventCreateData();
    v7 = objc_alloc_init(_MRSendHIDEventMessageProtobuf);
    [(_MRSendHIDEventMessageProtobuf *)v7 setHidEventData:Data];
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v7];
  }
  return v5;
}

- (void)dealloc
{
  event = self->_event;
  if (event) {
    CFRelease(event);
  }
  v4.receiver = self;
  v4.super_class = (Class)MRLegacySendHIDEventMessage;
  [(MRProtocolMessage *)&v4 dealloc];
}

- (_MRHIDButtonEvent)buttonEvent
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 hidEventData];

  if ((unint64_t)[v3 length] < 0x30)
  {
    BOOL v6 = 0;
    unint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v4 = [v3 bytes];
    uint64_t v5 = bswap32(*(unsigned __int16 *)(v4 + 43)) >> 16;
    BOOL v6 = *(_WORD *)(v4 + 47) != 0;
    unint64_t v7 = (unint64_t)(bswap32(*(unsigned __int16 *)(v4 + 45)) >> 16) << 32;
  }

  unint64_t v8 = v5 | v7;
  BOOL v9 = v6;
  result.var0 = v8;
  result.var1 = HIDWORD(v8);
  result.var2 = v9;
  return result;
}

- (unint64_t)type
{
  return 8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MRProtocolMessage *)self timestamp];
  BOOL v6 = [(MRProtocolMessage *)self error];
  unint64_t v7 = [(MRProtocolMessage *)self replyIdentifier];
  unint64_t v8 = [(MRLegacySendHIDEventMessage *)self type];
  unint64_t v9 = [(MRLegacySendHIDEventMessage *)self buttonEvent];
  v11 = (__CFString *)MRHIDButtonEventCopyDescription(v9, v10);
  v12 = [v3 stringWithFormat:@"\n<Message Type: %@\nTimestamp: %llu\nError: %@\nIdentifier: %@\nType: %lu\nMessage: %@\n>", v4, v5, v6, v7, v8, v11];

  return v12;
}

@end