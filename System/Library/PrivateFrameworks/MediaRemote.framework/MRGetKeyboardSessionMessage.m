@interface MRGetKeyboardSessionMessage
- (MRGetKeyboardSessionMessage)init;
- (unint64_t)type;
@end

@implementation MRGetKeyboardSessionMessage

- (MRGetKeyboardSessionMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRGetKeyboardSessionMessage;
  v2 = [(MRProtocolMessage *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_MRGetKeyboardSessionProtobuf);
    [(MRProtocolMessage *)v2 setUnderlyingCodableMessage:v3];
  }
  return v2;
}

- (unint64_t)type
{
  return 24;
}

@end