@interface PKAccountWebServiceDeleteAccountUserRequest
- (NSString)accountIdentifier;
- (NSString)accountUserAltDSID;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServiceDeleteAccountUserRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_accountIdentifier";
    goto LABEL_14;
  }
  accountUserAltDSID = self->_accountUserAltDSID;
  if (!accountUserAltDSID)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v15 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "_accountUserAltDSID";
    goto LABEL_14;
  }
  if (v4)
  {
    v18[0] = @"accounts";
    v18[1] = accountIdentifier;
    v18[2] = @"users";
    v18[3] = accountUserAltDSID;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    v10 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v9 queryParameters:0 appleAccountInformation:v5];

    [v10 setHTTPMethod:@"DELETE"];
    id v11 = [v10 copy];
    goto LABEL_16;
  }
  v10 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v20 = v13;
    __int16 v21 = 2082;
    v22 = "appleAccountInformation";
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

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
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
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end