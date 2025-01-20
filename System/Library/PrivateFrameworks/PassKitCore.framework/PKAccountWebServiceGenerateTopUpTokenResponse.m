@interface PKAccountWebServiceGenerateTopUpTokenResponse
- (PKAccountWebServiceGenerateTopUpTokenResponse)initWithData:(id)a3;
- (PKAccountWebServiceGenerateTopUpTokenResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5;
- (PKAppleBalanceInStoreTopUpToken)token;
@end

@implementation PKAccountWebServiceGenerateTopUpTokenResponse

- (PKAccountWebServiceGenerateTopUpTokenResponse)initWithData:(id)a3
{
  return [(PKAccountWebServiceGenerateTopUpTokenResponse *)self initWithData:a3 account:0 request:0];
}

- (PKAccountWebServiceGenerateTopUpTokenResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountWebServiceGenerateTopUpTokenResponse;
  v8 = [(PKWebServiceResponse *)&v16 initWithData:a3];
  v9 = v8;
  if (v8)
  {
    v10 = [(PKWebServiceResponse *)v8 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      v12 = [PKAppleBalanceInStoreTopUpToken alloc];
      v13 = [v7 accountIdentifier];
      v14 = [(PKAppleBalanceInStoreTopUpToken *)v12 initWithDictionary:v11 accountIdentifier:v13];

      if (PKVerifySignatureForInStoreTopUpToken(v14)) {
        objc_storeStrong((id *)&v9->_token, v14);
      }
    }
  }

  return v9;
}

- (PKAppleBalanceInStoreTopUpToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end