@interface PKAccountWebServiceVirtualCardListRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServiceVirtualCardListRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2082;
    v19 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!v4)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2082;
    v19 = "appleAccountInformation";
    goto LABEL_11;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    v15[0] = @"accounts";
    v15[1] = accountIdentifier;
    v15[2] = @"virtualCards";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v5];
    [v8 setHTTPMethod:@"GET"];
    v9 = (void *)[v8 copy];

    goto LABEL_13;
  }
  v7 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    __int16 v18 = 2082;
    v19 = "_accountIdentifier";
    goto LABEL_11;
  }
LABEL_12:
  v9 = 0;
LABEL_13:

  return v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end