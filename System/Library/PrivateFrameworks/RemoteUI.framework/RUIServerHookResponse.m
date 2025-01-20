@interface RUIServerHookResponse
- (NSDictionary)additionalPayload;
- (NSURLRequest)continuationRequest;
- (void)setAdditionalPayload:(id)a3;
- (void)setContinuationRequest:(id)a3;
@end

@implementation RUIServerHookResponse

- (NSDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setAdditionalPayload:(id)a3
{
}

- (NSURLRequest)continuationRequest
{
  return self->_continuationRequest;
}

- (void)setContinuationRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationRequest, 0);
  objc_storeStrong((id *)&self->_additionalPayload, 0);
}

@end