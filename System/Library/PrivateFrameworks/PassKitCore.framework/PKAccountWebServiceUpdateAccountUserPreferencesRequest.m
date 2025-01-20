@interface PKAccountWebServiceUpdateAccountUserPreferencesRequest
- (NSString)accountIdentifier;
- (NSString)accountUserAltDSID;
- (NSURL)baseURL;
- (PKAccountUserPreferences)accountUserPreferences;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)accountUserAccessLevel;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountUserAccessLevel:(unint64_t)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setAccountUserPreferences:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServiceUpdateAccountUserPreferencesRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_baseURL";
LABEL_19:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_20;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_accountIdentifier";
    goto LABEL_19;
  }
  accountUserAltDSID = self->_accountUserAltDSID;
  if (!accountUserAltDSID)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v17 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_accountUserAltDSID";
    goto LABEL_19;
  }
  if (!self->_accountUserPreferences)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    v18 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v23 = v15;
    __int16 v24 = 2082;
    v25 = "_accountUserPreferences";
    goto LABEL_19;
  }
  if (!v4)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      __int16 v24 = 2082;
      v25 = "appleAccountInformation";
      goto LABEL_19;
    }
LABEL_20:
    id v13 = 0;
    goto LABEL_21;
  }
  v21[0] = @"accounts";
  v21[1] = accountIdentifier;
  v21[2] = @"users";
  v21[3] = accountUserAltDSID;
  v21[4] = @"preferences";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
  v10 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v9 queryParameters:0 appleAccountInformation:v5];

  [v10 setHTTPMethod:@"POST"];
  [v10 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v11 = [(PKAccountUserPreferences *)self->_accountUserPreferences jsonRepresentationForAccountUserAccessLevel:self->_accountUserAccessLevel];
  if (v11)
  {
    v12 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v11];
    [v10 setHTTPBody:v12];
  }
  id v13 = [v10 copy];

LABEL_21:
  return v13;
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

- (PKAccountUserPreferences)accountUserPreferences
{
  return self->_accountUserPreferences;
}

- (void)setAccountUserPreferences:(id)a3
{
}

- (unint64_t)accountUserAccessLevel
{
  return self->_accountUserAccessLevel;
}

- (void)setAccountUserAccessLevel:(unint64_t)a3
{
  self->_accountUserAccessLevel = a3;
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
  objc_storeStrong((id *)&self->_accountUserPreferences, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end