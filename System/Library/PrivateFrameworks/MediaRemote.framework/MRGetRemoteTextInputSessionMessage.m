@interface MRGetRemoteTextInputSessionMessage
- (MRGetRemoteTextInputSessionMessage)init;
- (unint64_t)type;
@end

@implementation MRGetRemoteTextInputSessionMessage

- (MRGetRemoteTextInputSessionMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRGetRemoteTextInputSessionMessage;
  v2 = [(MRProtocolMessage *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_MRGetRemoteTextInputSessionProtobuf);
    [(MRProtocolMessage *)v2 setUnderlyingCodableMessage:v3];
  }
  return v2;
}

- (unint64_t)type
{
  return 68;
}

@end