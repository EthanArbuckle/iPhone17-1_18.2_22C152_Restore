@interface PKAccountWebServiceResolveStorefrontCountryMismatchRequest
- (NSString)accountIdentifier;
- (NSString)countryCode;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCountryCode:(id)a3;
@end

@implementation PKAccountWebServiceResolveStorefrontCountryMismatchRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAccountWebServiceResolveStorefrontCountryMismatchRequest *)self baseURL];
  if (!v5)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "baseURL";
LABEL_14:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "appleAccountInformation";
    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v15 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_accountIdentifier";
    goto LABEL_14;
  }
  if (self->_countryCode)
  {
    v18[0] = @"accounts";
    v18[1] = accountIdentifier;
    v18[2] = @"resolveCountryMismatch";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

    [v8 setHTTPMethod:@"POST"];
    [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [v9 setObject:self->_countryCode forKeyedSubscript:@"countryCode"];
    v10 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
    [v8 setHTTPBody:v10];

    id v11 = [v8 copy];
    goto LABEL_16;
  }
  v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_countryCode";
    goto LABEL_14;
  }
LABEL_15:
  id v11 = 0;
LABEL_16:

  return v11;
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

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end