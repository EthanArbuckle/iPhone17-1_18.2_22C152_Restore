@interface PKPaymentAuthorizationRewrapStateParam
+ (id)paramWithWrappedPayment:(id)a3 nonce:(id)a4 credential:(id)a5 cryptogramType:(int64_t)a6;
- (NSData)credential;
- (NSData)nonceData;
- (PKWrappedPayment)wrappedPayment;
- (id)description;
- (int64_t)cryptogramType;
- (void)setCredential:(id)a3;
- (void)setCryptogramType:(int64_t)a3;
- (void)setNonceData:(id)a3;
- (void)setWrappedPayment:(id)a3;
@end

@implementation PKPaymentAuthorizationRewrapStateParam

+ (id)paramWithWrappedPayment:(id)a3 nonce:(id)a4 credential:(id)a5 cryptogramType:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [a1 param];
  [v13 setWrappedPayment:v12];

  [v13 setNonceData:v11];
  [v13 setCredential:v10];

  [v13 setCryptogramType:a6];
  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  wrappedPayment = self->_wrappedPayment;
  v6 = [(NSData *)self->_nonceData hexEncoding];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; wrappedPayment: %@; nonceData: %@>",
    v4,
    self,
    wrappedPayment,
  v7 = v6);

  return v7;
}

- (PKWrappedPayment)wrappedPayment
{
  return self->_wrappedPayment;
}

- (void)setWrappedPayment:(id)a3
{
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
{
}

- (NSData)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(int64_t)a3
{
  self->_cryptogramType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_wrappedPayment, 0);
}

@end