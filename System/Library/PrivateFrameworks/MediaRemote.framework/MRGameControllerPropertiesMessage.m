@interface MRGameControllerPropertiesMessage
- (MRGameControllerPropertiesMessage)initWithGameControllerProperties:(id)a3 controllerID:(unint64_t)a4;
- (_MRGameControllerPropertiesProtobuf)properties;
- (unint64_t)controllerID;
- (unint64_t)type;
@end

@implementation MRGameControllerPropertiesMessage

- (MRGameControllerPropertiesMessage)initWithGameControllerProperties:(id)a3 controllerID:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRGameControllerPropertiesMessage;
  v7 = [(MRProtocolMessage *)&v10 init];
  if (v7)
  {
    v8 = objc_alloc_init(_MRGameControllerPropertiesMessageProtobuf);
    [(_MRGameControllerPropertiesMessageProtobuf *)v8 setProperties:v6];
    [(_MRGameControllerPropertiesMessageProtobuf *)v8 setControllerID:a4];
    [(MRProtocolMessage *)v7 setUnderlyingCodableMessage:v8];
  }
  return v7;
}

- (_MRGameControllerPropertiesProtobuf)properties
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 properties];

  return (_MRGameControllerPropertiesProtobuf *)v3;
}

- (unint64_t)controllerID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 controllerID];

  return v3;
}

- (unint64_t)type
{
  return 35;
}

@end