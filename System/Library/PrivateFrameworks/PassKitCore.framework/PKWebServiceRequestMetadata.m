@interface PKWebServiceRequestMetadata
- (BOOL)authHandling;
- (BOOL)cacheResponse;
- (NSData)originalBody;
- (NSData)responseData;
- (id)completion;
- (int64_t)retries;
- (void)setAuthHandling:(BOOL)a3;
- (void)setCacheResponse:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setOriginalBody:(id)a3;
- (void)setResponseData:(id)a3;
- (void)setRetries:(int64_t)a3;
@end

@implementation PKWebServiceRequestMetadata

- (int64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(int64_t)a3
{
  self->_retries = a3;
}

- (BOOL)authHandling
{
  return self->_authHandling;
}

- (void)setAuthHandling:(BOOL)a3
{
  self->_authHandling = a3;
}

- (BOOL)cacheResponse
{
  return self->_cacheResponse;
}

- (void)setCacheResponse:(BOOL)a3
{
  self->_cacheResponse = a3;
}

- (NSData)originalBody
{
  return self->_originalBody;
}

- (void)setOriginalBody:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_originalBody, 0);
}

@end