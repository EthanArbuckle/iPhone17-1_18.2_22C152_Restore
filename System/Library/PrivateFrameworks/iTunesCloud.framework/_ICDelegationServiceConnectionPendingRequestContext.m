@interface _ICDelegationServiceConnectionPendingRequestContext
- (ICPBDGSRequest)request;
- (_ICDelegationServiceConnectionPendingRequestContext)initWithRequest:(id)a3 responseHandler:(id)a4;
- (id)responseHandler;
@end

@implementation _ICDelegationServiceConnectionPendingRequestContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (ICPBDGSRequest)request
{
  return self->_request;
}

- (_ICDelegationServiceConnectionPendingRequestContext)initWithRequest:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_ICDelegationServiceConnectionPendingRequestContext;
  v9 = [(_ICDelegationServiceConnectionPendingRequestContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v11 = MEMORY[0x1A6240BF0](v8);
    id responseHandler = v10->_responseHandler;
    v10->_id responseHandler = (id)v11;
  }
  return v10;
}

@end