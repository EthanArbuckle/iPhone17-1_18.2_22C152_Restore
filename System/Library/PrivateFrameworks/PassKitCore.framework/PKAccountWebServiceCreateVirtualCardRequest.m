@interface PKAccountWebServiceCreateVirtualCardRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (PKVirtualCardEncryptionFields)encryptionFields;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)type;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setEncryptionFields:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKAccountWebServiceCreateVirtualCardRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "_baseURL";
LABEL_23:
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_24;
  }
  if (!v4)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v18 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_23;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v19 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "_accountIdentifier";
    goto LABEL_23;
  }
  if (!self->_type)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    v20 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543618;
    v25 = v17;
    __int16 v26 = 2082;
    v27 = "_type";
    goto LABEL_23;
  }
  if (!self->_encryptionFields)
  {
    v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      __int16 v26 = 2082;
      v27 = "_encryptionFields";
      goto LABEL_23;
    }
LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
  v23[0] = @"accounts";
  v23[1] = accountIdentifier;
  v23[2] = @"virtualCards";
  v23[3] = @"create";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v5];
  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t type = self->_type;
  if (type)
  {
    v11 = PKAccountVirtualCardTypeToString(type);
    [v9 setObject:v11 forKey:@"type"];
  }
  encryptionFields = self->_encryptionFields;
  if (encryptionFields)
  {
    v13 = [(PKVirtualCardEncryptionFields *)encryptionFields dictionaryRepresentation];
    [v9 setObject:v13 forKey:@"encryptionFields"];
  }
  if (v9)
  {
    v14 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
    [v8 setHTTPBody:v14];
  }
  v15 = (void *)[v8 copy];

LABEL_25:
  return v15;
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (PKVirtualCardEncryptionFields)encryptionFields
{
  return self->_encryptionFields;
}

- (void)setEncryptionFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionFields, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end