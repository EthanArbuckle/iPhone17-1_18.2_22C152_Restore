@interface CSDIDSTransport
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransport:(id)a3;
- (CSDIDSTransport)initWithDestination:(id)a3;
- (CSDIDSTransport)initWithSocket:(int)a3;
- (IDSDestination)remoteDestination;
- (IDSDevice)remoteDevice;
- (NSString)destination;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)socket;
- (int)type;
- (unint64_t)hash;
- (unint64_t)initialLinkType;
- (void)setInitialLinkType:(unint64_t)a3;
- (void)setRemoteDestination:(id)a3;
- (void)setRemoteDevice:(id)a3;
@end

@implementation CSDIDSTransport

- (CSDIDSTransport)initWithSocket:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSDIDSTransport;
  result = [(CSDIDSTransport *)&v5 init];
  if (result)
  {
    result->_type = 1;
    result->_socket = a3;
  }
  return result;
}

- (CSDIDSTransport)initWithDestination:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDIDSTransport;
  v6 = [(CSDIDSTransport *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_destination, a3);
    v7->_socket = -1;
  }

  return v7;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p type=%d", objc_opt_class(), self, [(CSDIDSTransport *)self type]];
  unsigned int v4 = [(CSDIDSTransport *)self type];
  if (v4 == 2)
  {
    id v5 = [(CSDIDSTransport *)self destination];
    [v3 appendFormat:@" destination=%@", v5];
  }
  else if (v4 == 1)
  {
    objc_msgSend(v3, "appendFormat:", @" socket=%d", -[CSDIDSTransport socket](self, "socket"));
  }
  objc_msgSend(v3, "appendFormat:", @" initialLinkType=%lu", -[CSDIDSTransport initialLinkType](self, "initialLinkType"));
  v6 = [(CSDIDSTransport *)self remoteDestination];

  if (v6)
  {
    v7 = [(CSDIDSTransport *)self remoteDestination];
    [v3 appendFormat:@" remoteDestination=%@", v7];
  }
  v8 = [(CSDIDSTransport *)self remoteDevice];

  if (v8)
  {
    objc_super v9 = [(CSDIDSTransport *)self remoteDevice];
    v10 = [v9 uniqueIDOverride];
    [v3 appendFormat:@" remoteDeviceUniqueIdentifier=%@", v10];
  }
  [v3 appendString:@">"];
  id v11 = [v3 copy];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(CSDIDSTransport *)self isEqualToTransport:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToTransport:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDIDSTransport *)self type];
  if (v5 == [v4 type]
    && (unsigned int v6 = -[CSDIDSTransport socket](self, "socket"), v6 == [v4 socket]))
  {
    v7 = [(CSDIDSTransport *)self destination];
    v8 = [v4 destination];
    if (TUStringsAreEqualOrNil()
      && (id v9 = -[CSDIDSTransport initialLinkType](self, "initialLinkType"), v9 == [v4 initialLinkType]))
    {
      v10 = [(CSDIDSTransport *)self remoteDestination];
      id v11 = [v4 remoteDestination];
      if (TUObjectsAreEqualOrNil())
      {
        v12 = [(CSDIDSTransport *)self remoteDevice];
        v13 = [v12 uniqueIDOverride];
        v14 = [v4 remoteDevice];
        v15 = [v14 uniqueIDOverride];
        char v16 = TUStringsAreEqualOrNil();
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unsigned int v3 = [(CSDIDSTransport *)self type];
  uint64_t v4 = (int)([(CSDIDSTransport *)self socket] ^ v3);
  unsigned int v5 = [(CSDIDSTransport *)self destination];
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v6 ^ [(CSDIDSTransport *)self initialLinkType] ^ v4;
  v8 = [(CSDIDSTransport *)self remoteDestination];
  unint64_t v9 = (unint64_t)[v8 hash];
  v10 = [(CSDIDSTransport *)self remoteDevice];
  id v11 = [v10 uniqueIDOverride];
  unint64_t v12 = v7 ^ v9 ^ (unint64_t)[v11 hash];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = [(CSDIDSTransport *)self type];
  if (v5 == 2)
  {
    id v7 = [(id)objc_opt_class() allocWithZone:a3];
    v8 = [(CSDIDSTransport *)self destination];
    id v6 = [v7 initWithDestination:v8];
  }
  else if (v5 == 1)
  {
    id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSocket:", -[CSDIDSTransport socket](self, "socket"));
  }
  else
  {
    id v6 = 0;
  }
  objc_msgSend(v6, "setInitialLinkType:", -[CSDIDSTransport initialLinkType](self, "initialLinkType"));
  unint64_t v9 = [(CSDIDSTransport *)self remoteDestination];
  [v6 setRemoteDestination:v9];

  v10 = [(CSDIDSTransport *)self remoteDevice];
  [v6 setRemoteDevice:v10];

  return v6;
}

- (int)type
{
  return self->_type;
}

- (int)socket
{
  return self->_socket;
}

- (NSString)destination
{
  return self->_destination;
}

- (unint64_t)initialLinkType
{
  return self->_initialLinkType;
}

- (void)setInitialLinkType:(unint64_t)a3
{
  self->_initialLinkType = a3;
}

- (IDSDestination)remoteDestination
{
  return self->_remoteDestination;
}

- (void)setRemoteDestination:(id)a3
{
}

- (IDSDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_remoteDestination, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end