@interface PKAccountWebServiceVirtualCardSecurityCodeActivityRequest
- (NSDate)timestamp;
- (NSString)accountIdentifier;
- (NSString)securityCodeIdentifier;
- (NSString)virtualCardIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (int64_t)action;
- (void)setAccountIdentifier:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setBaseURL:(id)a3;
- (void)setSecurityCodeIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setVirtualCardIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceVirtualCardSecurityCodeActivityRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    __int16 v33 = 2082;
    v34 = "_baseURL";
LABEL_29:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_30;
  }
  if (!v4)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v24 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v24);
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    __int16 v33 = 2082;
    v34 = "appleAccountInformation";
    goto LABEL_29;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v25 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    __int16 v33 = 2082;
    v34 = "_accountIdentifier";
    goto LABEL_29;
  }
  virtualCardIdentifier = self->_virtualCardIdentifier;
  if (!virtualCardIdentifier)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v26 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    __int16 v33 = 2082;
    v34 = "_virtualCardIdentifier";
    goto LABEL_29;
  }
  if (!self->_action)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v27 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    __int16 v33 = 2082;
    v34 = "_action";
    goto LABEL_29;
  }
  if (!self->_timestamp)
  {
    v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      __int16 v33 = 2082;
      v34 = "_timestamp";
      goto LABEL_29;
    }
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
  v8 = (void *)MEMORY[0x1E4F1CA48];
  v30[0] = @"accounts";
  v30[1] = accountIdentifier;
  v30[2] = @"virtualCards";
  v30[3] = virtualCardIdentifier;
  v30[4] = @"securityCodeActivity";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  v10 = [v8 arrayWithArray:v9];

  if ([(NSString *)self->_securityCodeIdentifier length]) {
    [v10 addObject:self->_securityCodeIdentifier];
  }
  baseURL = self->_baseURL;
  id v12 = [v10 copy];
  v13 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v12 queryParameters:0 appleAccountInformation:v5];

  [v13 setHTTPMethod:@"POST"];
  [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = v14;
  int64_t action = self->_action;
  v17 = @"unknown";
  if (action == 1) {
    v17 = @"viewed";
  }
  if (action == 2) {
    v18 = @"autofilled";
  }
  else {
    v18 = v17;
  }
  [v14 setObject:v18 forKey:@"action"];
  v19 = PKISO8601DateStringFromDate(self->_timestamp);
  [v15 setObject:v19 forKey:@"timestamp"];

  if (v15)
  {
    v20 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v15];
    [v13 setHTTPBody:v20];
  }
  v21 = (void *)[v13 copy];

LABEL_31:
  return v21;
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

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void)setVirtualCardIdentifier:(id)a3
{
}

- (NSString)securityCodeIdentifier
{
  return self->_securityCodeIdentifier;
}

- (void)setSecurityCodeIdentifier:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_int64_t action = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_securityCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end