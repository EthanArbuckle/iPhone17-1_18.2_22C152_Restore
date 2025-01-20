@interface PKPaymentAuthorizationContinuitySendParam
+ (id)paramWithRemotePaymentRequest:(id)a3;
- (PKRemotePaymentRequest)remotePaymentRequest;
- (void)setRemotePaymentRequest:(id)a3;
@end

@implementation PKPaymentAuthorizationContinuitySendParam

+ (id)paramWithRemotePaymentRequest:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  [v5 setRemotePaymentRequest:v4];

  return v5;
}

- (PKRemotePaymentRequest)remotePaymentRequest
{
  return self->_remotePaymentRequest;
}

- (void)setRemotePaymentRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end