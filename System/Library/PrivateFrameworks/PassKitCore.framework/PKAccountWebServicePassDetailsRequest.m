@interface PKAccountWebServicePassDetailsRequest
- (NSString)accountIdentifier;
- (NSString)sharingInstanceIdentifier;
- (NSURL)baseURL;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (id)_urlRequestWithAppleAccountInformation:(id)a3 deviceIdentifier:(id)a4;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setSharingInstanceIdentifier:(id)a3;
@end

@implementation PKAccountWebServicePassDetailsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3 deviceIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "_baseURL";
LABEL_16:
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v6)
  {
    v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_16;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v20 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v18;
    __int16 v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_16;
  }
  if (!v7)
  {
    v12 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2082;
      v27 = "deviceIdentifier";
      goto LABEL_16;
    }
LABEL_17:
    id v16 = 0;
    goto LABEL_18;
  }
  v23[0] = @"accounts";
  v23[1] = accountIdentifier;
  v23[2] = @"devices";
  v23[3] = v7;
  v23[4] = @"pass";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:5];
  v12 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v11 queryParameters:0 appleAccountInformation:v6];

  [v12 setHTTPMethod:@"POST"];
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v14 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v14) {
    [v13 setObject:v14 forKey:@"deviceMetadata"];
  }
  [v13 setObject:self->_sharingInstanceIdentifier forKeyedSubscript:@"sharingInstanceIdentifier"];
  v15 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v12 setHTTPBody:v15];

  id v16 = [v12 copy];
LABEL_18:

  return v16;
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

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (NSString)sharingInstanceIdentifier
{
  return self->_sharingInstanceIdentifier;
}

- (void)setSharingInstanceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end