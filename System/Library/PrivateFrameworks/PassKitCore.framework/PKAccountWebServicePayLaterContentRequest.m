@interface PKAccountWebServicePayLaterContentRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (id)bodyDictionary;
- (id)contextString;
- (unint64_t)type;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountWebServicePayLaterContentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2082;
      v20 = "_baseURL";
LABEL_10:
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
LABEL_11:
    id v11 = 0;
    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2082;
      v20 = "_accountIdentifier";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v16[0] = @"accounts";
  v16[1] = accountIdentifier;
  v16[2] = @"content";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v9 = [(PKAccountWebServicePayLaterContentRequest *)self bodyDictionary];
  if (v9)
  {
    v10 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
    [v8 setHTTPBody:v10];
  }
  id v11 = [v8 copy];

LABEL_12:
  return v11;
}

- (id)contextString
{
  return PKAccountWebServicePayLaterContentRequestTypeToString(self->_type);
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKAccountWebServicePayLaterContentRequest *)self contextString];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"context"];
  }
  v5 = (void *)[v3 copy];

  return v5;
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

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end