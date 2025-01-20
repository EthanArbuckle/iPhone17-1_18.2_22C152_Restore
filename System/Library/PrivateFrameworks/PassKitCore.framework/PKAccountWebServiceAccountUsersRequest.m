@interface PKAccountWebServiceAccountUsersRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServiceAccountUsersRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2082;
    v20 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2082;
    v20 = "_accountIdentifier";
    goto LABEL_11;
  }
  if (v4)
  {
    v16[0] = @"accounts";
    v16[1] = accountIdentifier;
    v16[2] = @"users";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];

    [v9 setHTTPMethod:@"GET"];
    id v10 = [v9 copy];
    goto LABEL_13;
  }
  v9 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 2082;
    v20 = "appleAccountInformation";
    goto LABEL_11;
  }
LABEL_12:
  id v10 = 0;
LABEL_13:

  return v10;
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