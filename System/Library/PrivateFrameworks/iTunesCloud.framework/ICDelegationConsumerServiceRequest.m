@interface ICDelegationConsumerServiceRequest
- (ICDelegationConsumerServiceRequest)initWithUserIdentityDelegationAccountUUIDs:(id)a3 requestContext:(id)a4 timeoutInterval:(double)a5;
- (ICRequestContext)requestContext;
- (NSDictionary)userIdentityDelegationAccountUUIDs;
- (double)timeoutInterval;
@end

@implementation ICDelegationConsumerServiceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityDelegationAccountUUIDs, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (NSDictionary)userIdentityDelegationAccountUUIDs
{
  return self->_userIdentityDelegationAccountUUIDs;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (ICDelegationConsumerServiceRequest)initWithUserIdentityDelegationAccountUUIDs:(id)a3 requestContext:(id)a4 timeoutInterval:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDelegationConsumerServiceRequest;
  v10 = [(ICDelegationConsumerServiceRequest *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    userIdentityDelegationAccountUUIDs = v10->_userIdentityDelegationAccountUUIDs;
    v10->_userIdentityDelegationAccountUUIDs = (NSDictionary *)v11;

    uint64_t v13 = [v9 copy];
    requestContext = v10->_requestContext;
    v10->_requestContext = (ICRequestContext *)v13;

    v10->_timeoutInterval = a5;
  }

  return v10;
}

@end