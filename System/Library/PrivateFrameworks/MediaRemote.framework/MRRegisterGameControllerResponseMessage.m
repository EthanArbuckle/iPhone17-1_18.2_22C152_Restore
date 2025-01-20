@interface MRRegisterGameControllerResponseMessage
- (MRRegisterGameControllerResponseMessage)initWithControllerID:(unint64_t)a3;
- (unint64_t)controllerID;
- (unint64_t)type;
@end

@implementation MRRegisterGameControllerResponseMessage

- (MRRegisterGameControllerResponseMessage)initWithControllerID:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRRegisterGameControllerResponseMessage;
  v4 = [(MRProtocolMessage *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(_MRRegisterGameControllerResponseMessageProtobuf);
    [(_MRRegisterGameControllerResponseMessageProtobuf *)v5 setControllerID:a3];
    [(MRProtocolMessage *)v4 setUnderlyingCodableMessage:v5];
  }
  return v4;
}

- (unint64_t)controllerID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 controllerID];

  return v3;
}

- (unint64_t)type
{
  return 20;
}

@end