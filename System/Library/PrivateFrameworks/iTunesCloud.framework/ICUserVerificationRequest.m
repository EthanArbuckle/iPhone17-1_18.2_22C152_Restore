@interface ICUserVerificationRequest
- (ICStoreRequestContext)storeRequestContext;
- (ICUserVerificationContext)verificationContext;
- (ICUserVerificationRequest)initWithVerificationContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)qualityOfService;
- (void)performWithResponseHandler:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setStoreRequestContext:(id)a3;
@end

@implementation ICUserVerificationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationContext, 0);

  objc_storeStrong((id *)&self->_storeRequestContext, 0);
}

- (ICUserVerificationContext)verificationContext
{
  return self->_verificationContext;
}

- (void)setStoreRequestContext:(id)a3
{
}

- (ICStoreRequestContext)storeRequestContext
{
  return self->_storeRequestContext;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)performWithResponseHandler:(id)a3
{
  v7 = (void (**)(id, void, void *))a3;
  v4 = +[ICUserVerificationOperation operationWithVerificationRequest:self];
  v5 = v4;
  if (v4)
  {
    [v4 setResponseHandler:v7];
    v6 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", self->_qualityOfService);
    [v6 addOperation:v5];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    v7[2](v7, 0, v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVerificationContext:", self->_verificationContext);
  v5 = (void *)v4;
  if (v4)
  {
    *(void *)(v4 + 8) = self->_qualityOfService;
    objc_storeStrong((id *)(v4 + 16), self->_storeRequestContext);
  }
  return v5;
}

- (ICUserVerificationRequest)initWithVerificationContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICUserVerificationRequest;
  v5 = [(ICUserVerificationRequest *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_qualityOfService = 25;
    uint64_t v7 = [v4 copy];
    verificationContext = v6->_verificationContext;
    v6->_verificationContext = (ICUserVerificationContext *)v7;
  }
  return v6;
}

@end