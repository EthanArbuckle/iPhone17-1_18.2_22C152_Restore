@interface PKAccountWebServiceGenerateTopUpTokenRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)tokenType;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setTokenType:(int64_t)a3;
@end

@implementation PKAccountWebServiceGenerateTopUpTokenRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAccountWebServiceGenerateTopUpTokenRequest *)self baseURL];
  if (!v5)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    __int16 v22 = 2082;
    v23 = "baseURL";
LABEL_12:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_13;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    __int16 v22 = 2082;
    v23 = "appleAccountInformation";
    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      __int16 v22 = 2082;
      v23 = "_accountIdentifier";
      goto LABEL_12;
    }
LABEL_13:
    id v7 = 0;
    goto LABEL_14;
  }
  if (self->_tokenType == 1)
  {
    id v7 = 0;
    goto LABEL_15;
  }
  v19[0] = @"accounts";
  v19[1] = accountIdentifier;
  v19[2] = @"generateTopUpToken";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v14 queryParameters:0 appleAccountInformation:v4];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v15 = PKUniqueDeviceIdentifier();
  [v8 setValue:v15 forHTTPHeaderField:@"X-Apple-Device-GUID"];

  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = PKAppleBalanceInStoreTopUpTokenTypeToString(self->_tokenType);
  [v16 setObject:v17 forKeyedSubscript:@"tokenType"];

  v18 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v16];
  [v8 setHTTPBody:v18];

  id v7 = [v8 copy];
LABEL_14:

LABEL_15:
  return v7;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (int64_t)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(int64_t)a3
{
  self->_tokenType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end