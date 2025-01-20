@interface MRDRouteAuthorizationRequest
- (MRDAVRoute)route;
- (MRDRouteAuthorizationRequest)initWithRoute:(id)a3 inputType:(int64_t)a4 responseCallback:(id)a5 cancelCallback:(id)a6;
- (int64_t)inputType;
- (void)cancel;
- (void)respondWithAuthorizationToken:(id)a3;
@end

@implementation MRDRouteAuthorizationRequest

- (MRDRouteAuthorizationRequest)initWithRoute:(id)a3 inputType:(int64_t)a4 responseCallback:(id)a5 cancelCallback:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)MRDRouteAuthorizationRequest;
  v14 = [(MRDRouteAuthorizationRequest *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_route, a3);
    v15->_inputType = a4;
    id v16 = [v12 copy];
    id responseCallback = v15->_responseCallback;
    v15->_id responseCallback = v16;

    id v18 = [v13 copy];
    id cancelCallback = v15->_cancelCallback;
    v15->_id cancelCallback = v18;
  }
  return v15;
}

- (void)respondWithAuthorizationToken:(id)a3
{
}

- (void)cancel
{
}

- (MRDAVRoute)route
{
  return self->_route;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong(&self->_cancelCallback, 0);

  objc_storeStrong(&self->_responseCallback, 0);
}

@end