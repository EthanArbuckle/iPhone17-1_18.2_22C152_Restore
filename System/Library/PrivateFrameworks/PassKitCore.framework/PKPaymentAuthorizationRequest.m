@interface PKPaymentAuthorizationRequest
- (NSData)credential;
- (NSData)nonceData;
- (PKPaymentAuthorizationRequest)initWithPaymentRequest:(id)a3;
- (PKPaymentRequest)paymentRequest;
- (void)setCredential:(id)a3;
- (void)setNonceData:(id)a3;
@end

@implementation PKPaymentAuthorizationRequest

- (PKPaymentAuthorizationRequest)initWithPaymentRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAuthorizationRequest;
  v6 = [(PKPaymentAuthorizationRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paymentRequest, a3);
  }

  return v7;
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
{
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end