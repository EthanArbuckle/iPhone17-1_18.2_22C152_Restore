@interface SFResponseMessage
- (SFResponseMessage)initWithRequestMessage:(id)a3;
@end

@implementation SFResponseMessage

- (SFResponseMessage)initWithRequestMessage:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFResponseMessage;
  v5 = [(SFResponseMessage *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->super._identifier;
    v5->super._identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 peerDevice];
    peerDevice = v5->super._peerDevice;
    v5->super._peerDevice = (SFDevice *)v8;
  }
  return v5;
}

@end