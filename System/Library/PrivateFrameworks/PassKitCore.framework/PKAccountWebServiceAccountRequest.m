@interface PKAccountWebServiceAccountRequest
- (BOOL)extended;
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setExtended:(BOOL)a3;
@end

@implementation PKAccountWebServiceAccountRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!PKRunningInPassd())
  {
    v9 = 0;
    goto LABEL_19;
  }
  if (!self->_baseURL)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    __int16 v21 = 2082;
    v22 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!v4)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    __int16 v21 = 2082;
    v22 = "appleAccountInformation";
    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    if (self->_extended)
    {
      v18[0] = @"accounts";
      v18[1] = accountIdentifier;
      v18[2] = @"extended";
      v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = v18;
      uint64_t v8 = 3;
    }
    else
    {
      v17[0] = @"accounts";
      v17[1] = accountIdentifier;
      v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = v17;
      uint64_t v8 = 2;
    }
    v10 = [v6 arrayWithObjects:v7 count:v8];
    v15 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v10 queryParameters:0 appleAccountInformation:v4];
    [v15 setHTTPMethod:@"GET"];
    [v15 setCachePolicy:1];
    v9 = (void *)[v15 copy];

    goto LABEL_18;
  }
  v10 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    __int16 v21 = 2082;
    v22 = "_accountIdentifier";
    goto LABEL_14;
  }
LABEL_15:
  v9 = 0;
LABEL_18:

LABEL_19:
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

- (BOOL)extended
{
  return self->_extended;
}

- (void)setExtended:(BOOL)a3
{
  self->_extended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end