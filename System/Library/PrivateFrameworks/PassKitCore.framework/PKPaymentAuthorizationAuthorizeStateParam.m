@interface PKPaymentAuthorizationAuthorizeStateParam
+ (id)paramWithAuthenticatorEvaluationResponse:(id)a3;
+ (id)paramWithCredential:(id)a3;
+ (id)paramWithNonceParam:(id)a3 nonce:(id)a4 cryptogramType:(int64_t)a5 networkMerchantIdentifier:(id)a6;
- (NSData)credential;
- (NSData)networkMerchantIdentifier;
- (NSData)nonceData;
- (PKAuthenticatorEvaluationResponse)evaluationResponse;
- (id)description;
- (int64_t)cryptogramType;
- (void)setCredential:(id)a3;
- (void)setCryptogramType:(int64_t)a3;
- (void)setEvaluationResponse:(id)a3;
- (void)setNetworkMerchantIdentifier:(id)a3;
- (void)setNonceData:(id)a3;
@end

@implementation PKPaymentAuthorizationAuthorizeStateParam

+ (id)paramWithCredential:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  [v5 setCredential:v4];

  return v5;
}

+ (id)paramWithAuthenticatorEvaluationResponse:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  [v5 setEvaluationResponse:v4];

  return v5;
}

+ (id)paramWithNonceParam:(id)a3 nonce:(id)a4 cryptogramType:(int64_t)a5 networkMerchantIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [a1 param];
  v14 = [v12 credential];
  [v13 setCredential:v14];

  [v13 setNonceData:v11];
  v15 = [v12 evaluationResponse];

  [v13 setEvaluationResponse:v15];
  [v13 setCryptogramType:a5];
  [v13 setNetworkMerchantIdentifier:v10];

  return v13;
}

- (NSData)credential
{
  credential = self->_credential;
  if (credential)
  {
    v3 = credential;
  }
  else
  {
    v3 = [(PKAuthenticatorEvaluationResponse *)self->_evaluationResponse credential];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PKPaymentAuthorizationAuthorizeStateParam *)self credential];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; credential: (%tu bytes); nonce: %@; networkMerchantIdentifier: %@>",
    v4,
    self,
    [v5 length],
    self->_nonceData,
  v6 = self->_networkMerchantIdentifier);

  return v6;
}

- (void)setCredential:(id)a3
{
}

- (PKAuthenticatorEvaluationResponse)evaluationResponse
{
  return self->_evaluationResponse;
}

- (void)setEvaluationResponse:(id)a3
{
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_evaluationResponse, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end