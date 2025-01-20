@interface MRPresentRouteAuthorizationStatusMessage
- (MRAVOutputDevice)route;
- (MRPresentRouteAuthorizationStatusMessage)initWithRoute:(id)a3 status:(int)a4;
- (int)status;
- (unint64_t)type;
@end

@implementation MRPresentRouteAuthorizationStatusMessage

- (MRPresentRouteAuthorizationStatusMessage)initWithRoute:(id)a3 status:(int)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRPresentRouteAuthorizationStatusMessage;
  v8 = [(MRProtocolMessage *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v10 = objc_alloc_init(_MRPresentRouteAuthorizationStatusMessageProtobuf);
    v11 = [(MRAVOutputDevice *)v9->_route descriptor];
    [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)v10 setRoute:v11];

    if (a4 >= 0xA) {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v12 = a4;
    }
    [(_MRPresentRouteAuthorizationStatusMessageProtobuf *)v10 setStatus:v12];
    [(MRProtocolMessage *)v9 setUnderlyingCodableMessage:v10];
  }
  return v9;
}

- (MRAVOutputDevice)route
{
  route = self->_route;
  if (!route)
  {
    v4 = [MRAVDistantOutputDevice alloc];
    v5 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v6 = [v5 route];
    id v7 = [(MRAVDistantOutputDevice *)v4 initWithDescriptor:v6];
    v8 = self->_route;
    self->_route = v7;

    route = self->_route;
  }

  return route;
}

- (int)status
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = [v2 status];
  if (v3 >= 0xA) {
    int v4 = -1;
  }
  else {
    int v4 = v3;
  }

  return v4;
}

- (unint64_t)type
{
  return 61;
}

- (void).cxx_destruct
{
}

@end