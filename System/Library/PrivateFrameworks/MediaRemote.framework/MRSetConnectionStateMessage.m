@interface MRSetConnectionStateMessage
- (MRSetConnectionStateMessage)initWithConnectionState:(unsigned int)a3;
- (unint64_t)encryptionType;
- (unint64_t)type;
- (unsigned)state;
@end

@implementation MRSetConnectionStateMessage

- (MRSetConnectionStateMessage)initWithConnectionState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)MRSetConnectionStateMessage;
  v4 = [(MRProtocolMessage *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(_MRSetConnectionStateMessageProtobuf);
    [(_MRSetConnectionStateMessageProtobuf *)v5 setState:MRProtobufFromConnectionState(v3)];
    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (unsigned)state
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = MRConnectionStateFromProtobuf([v2 state]);

  return v3;
}

- (unint64_t)type
{
  return 38;
}

- (unint64_t)encryptionType
{
  return 2;
}

@end