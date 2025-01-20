@interface PKAccountWebServiceAccountsRequest
- (NSURL)accountServicesURL;
- (id)_urlRequestWithServiceURL:(id)a3 AppleAccountInformation:(id)a4;
- (void)setAccountServicesURL:(id)a3;
@end

@implementation PKAccountWebServiceAccountsRequest

- (id)_urlRequestWithServiceURL:(id)a3 AppleAccountInformation:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v16 = @"accounts";
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      v10 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v6 endpointComponents:v9 queryParameters:0 appleAccountInformation:v8];

      [v10 setHTTPMethod:@"GET"];
      [v10 setCachePolicy:1];
      id v11 = [v10 copy];
      goto LABEL_10;
    }
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2082;
      v20 = "appleAccountInformation";
      goto LABEL_8;
    }
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      __int16 v19 = 2082;
      v20 = "url";
LABEL_8:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

- (NSURL)accountServicesURL
{
  return self->_accountServicesURL;
}

- (void)setAccountServicesURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end