@interface PKPaymentAuthorizationNonceStateParam
+ (id)paramWithAuthenticatorEvaluationResponse:(id)a3;
+ (id)paramWithCredential:(id)a3;
- (NSData)credential;
- (PKAuthenticatorEvaluationResponse)evaluationResponse;
- (id)description;
- (void)setCredential:(id)a3;
- (void)setEvaluationResponse:(id)a3;
@end

@implementation PKPaymentAuthorizationNonceStateParam

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

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PKPaymentAuthorizationNonceStateParam *)self credential];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; credential: (%tu bytes)>",
    v4,
    self,
  v6 = [v5 length]);

  return v6;
}

- (NSData)credential
{
  return self->_credential;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationResponse, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end