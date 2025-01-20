@interface PKPaymentCompleteSessionResponse
- (NSString)retryNonce;
@end

@implementation PKPaymentCompleteSessionResponse

- (NSString)retryNonce
{
  return self->_retryNonce;
}

- (void).cxx_destruct
{
}

@end