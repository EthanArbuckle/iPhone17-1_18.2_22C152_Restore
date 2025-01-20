@interface PKAccountWebserviceCustomizePhysicalCardRequest
- (NSString)accountIdentifier;
- (NSString)accountUserAltDSID;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebserviceCustomizePhysicalCardRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_baseURL)
  {
    accountIdentifier = self->_accountIdentifier;
    if (accountIdentifier)
    {
      v14[0] = @"accounts";
      v14[1] = accountIdentifier;
      v14[2] = @"physicalCard";
      v14[3] = @"customize";
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v7 setObject:self->_accountUserAltDSID forKeyedSubscript:@"accountUserAltDSID"];
      v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v6 queryParameters:v7 appleAccountInformation:v4];
      [v8 setHTTPMethod:@"GET"];
      v9 = (void *)[v8 copy];

      goto LABEL_10;
    }
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2082;
      v18 = "_accountIdentifier";
      goto LABEL_8;
    }
  }
  else
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2082;
      v18 = "_baseURL";
LABEL_8:
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end