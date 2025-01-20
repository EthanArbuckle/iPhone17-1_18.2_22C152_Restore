@interface ICUserVerificationOperation
+ (id)operationWithVerificationRequest:(id)a3;
- (ICUserVerificationRequest)verificationRequest;
- (id)responseHandler;
- (void)setResponseHandler:(id)a3;
@end

@implementation ICUserVerificationOperation

+ (id)operationWithVerificationRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 verificationContext];
  if ([v4 verificationStyle])
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_alloc_init(ICACAccountVerificationOperation);
    if (v5)
    {
      uint64_t v6 = [v3 copy];
      verificationRequest = v5->super._verificationRequest;
      v5->super._verificationRequest = (ICUserVerificationRequest *)v6;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_verificationRequest, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (ICUserVerificationRequest)verificationRequest
{
  return self->_verificationRequest;
}

@end