@interface FCPaymentTransactionAuthorizationResponse
- (FCAuthKitAuthorizationCredential)credential;
- (FCPaymentTransactionAuthorizationResponse)initWithCredential:(id)a3 accountSignupError:(id)a4;
- (NSError)accountSignupError;
@end

@implementation FCPaymentTransactionAuthorizationResponse

- (FCPaymentTransactionAuthorizationResponse)initWithCredential:(id)a3 accountSignupError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCPaymentTransactionAuthorizationResponse;
  v9 = [(FCPaymentTransactionAuthorizationResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credential, a3);
    objc_storeStrong((id *)&v10->_accountSignupError, a4);
  }

  return v10;
}

- (FCAuthKitAuthorizationCredential)credential
{
  return self->_credential;
}

- (NSError)accountSignupError
{
  return self->_accountSignupError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSignupError, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end