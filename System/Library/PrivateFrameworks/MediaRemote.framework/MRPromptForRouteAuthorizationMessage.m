@interface MRPromptForRouteAuthorizationMessage
- (MRAVOutputDevice)route;
- (MRPromptForRouteAuthorizationMessage)initWithRoute:(id)a3 inputType:(int64_t)a4;
- (int64_t)inputType;
- (unint64_t)type;
@end

@implementation MRPromptForRouteAuthorizationMessage

- (MRPromptForRouteAuthorizationMessage)initWithRoute:(id)a3 inputType:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRPromptForRouteAuthorizationMessage;
  v8 = [(MRProtocolMessage *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_route, a3);
    v10 = objc_alloc_init(_MRPromptForRouteAuthorizationMessageProtobuf);
    v11 = [v7 descriptor];
    [(_MRPromptForRouteAuthorizationMessageProtobuf *)v10 setRoute:v11];

    if ((unint64_t)(a4 - 1) > 2) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = dword_195224440[a4 - 1];
    }
    [(_MRPromptForRouteAuthorizationMessageProtobuf *)v10 setInputType:v12];
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

- (int64_t)inputType
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unsigned int v3 = [v2 inputType] - 1;
  if (v3 > 2) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = qword_195224450[v3];
  }

  return v4;
}

- (unint64_t)type
{
  return 59;
}

- (void).cxx_destruct
{
}

@end