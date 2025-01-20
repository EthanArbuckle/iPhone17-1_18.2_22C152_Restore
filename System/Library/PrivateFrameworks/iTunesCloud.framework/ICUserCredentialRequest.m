@interface ICUserCredentialRequest
- (ICClientInfo)clientInfo;
- (ICUserCredentialRequest)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5;
- (ICUserIdentity)identity;
- (ICUserIdentityStore)identityStore;
- (double)timeoutInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)qualityOfService;
- (void)setQualityOfService:(int64_t)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation ICUserCredentialRequest

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (ICUserCredentialRequest)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICUserCredentialRequest;
  v11 = [(ICUserCredentialRequest *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identity = v11->_identity;
    v11->_identity = (ICUserIdentity *)v12;

    objc_storeStrong((id *)&v11->_identityStore, a4);
    uint64_t v14 = [v10 copy];
    clientInfo = v11->_clientInfo;
    v11->_clientInfo = (ICClientInfo *)v14;

    v11->_qualityOfService = 25;
    v11->_timeoutInterval = 30.0;
  }

  return v11;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (ICUserIdentity)identity
{
  return self->_identity;
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p [%@]>", objc_opt_class(), self, self->_identity];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (ICClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentity:identityStore:clientInfo:", self->_identity, self->_identityStore, self->_clientInfo);
  if (result)
  {
    *((void *)result + 4) = self->_qualityOfService;
    *((void *)result + 5) = *(void *)&self->_timeoutInterval;
  }
  return result;
}

@end