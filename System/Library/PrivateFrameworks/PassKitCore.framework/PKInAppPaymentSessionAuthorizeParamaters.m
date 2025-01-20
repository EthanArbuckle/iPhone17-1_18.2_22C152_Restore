@interface PKInAppPaymentSessionAuthorizeParamaters
- (BOOL)isFeatureNotSupportedError;
- (NSData)authenticationCredential;
- (NSData)networkMerchantIdentifier;
- (NSData)nonce;
- (PKInAppPaymentSessionAuthorizeParamaters)initWithNonce:(id)a3 authenticationCredential:(id)a4 networkMerchantIdentifier:(id)a5 cryptogramType:(int64_t)a6;
- (int64_t)cryptogramType;
- (void)setAuthenticationCredential:(id)a3;
- (void)setCryptogramType:(int64_t)a3;
- (void)setIsFeatureNotSupportedError:(BOOL *)a3;
- (void)setNetworkMerchantIdentifier:(id)a3;
- (void)setNonce:(id)a3;
@end

@implementation PKInAppPaymentSessionAuthorizeParamaters

- (PKInAppPaymentSessionAuthorizeParamaters)initWithNonce:(id)a3 authenticationCredential:(id)a4 networkMerchantIdentifier:(id)a5 cryptogramType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKInAppPaymentSessionAuthorizeParamaters;
  v14 = [(PKInAppPaymentSessionAuthorizeParamaters *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_nonce, a3);
    objc_storeStrong((id *)&v15->_authenticationCredential, a4);
    objc_storeStrong((id *)&v15->_networkMerchantIdentifier, a5);
    v15->_cryptogramType = a6;
  }

  return v15;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)authenticationCredential
{
  return self->_authenticationCredential;
}

- (void)setAuthenticationCredential:(id)a3
{
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (void)setNetworkMerchantIdentifier:(id)a3
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

- (BOOL)isFeatureNotSupportedError
{
  return self->_isFeatureNotSupportedError;
}

- (void)setIsFeatureNotSupportedError:(BOOL *)a3
{
  self->_isFeatureNotSupportedError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticationCredential, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end