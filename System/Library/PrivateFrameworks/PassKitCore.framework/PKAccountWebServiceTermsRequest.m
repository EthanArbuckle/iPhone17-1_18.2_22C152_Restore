@interface PKAccountWebServiceTermsRequest
- (BOOL)termsAccepted;
- (NSString)accountIdentifier;
- (NSString)termsIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setTermsAccepted:(BOOL)a3;
- (void)setTermsIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceTermsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!PKRunningInPassd())
  {
    id v12 = 0;
    goto LABEL_19;
  }
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = "_baseURL";
LABEL_16:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = "appleAccountInformation";
    goto LABEL_16;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v16 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = "_accountIdentifier";
    goto LABEL_16;
  }
  if (!self->_termsIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      __int16 v22 = 2082;
      v23 = "_termsIdentifier";
      goto LABEL_16;
    }
LABEL_17:
    id v12 = 0;
    goto LABEL_18;
  }
  v19[0] = @"accounts";
  v19[1] = accountIdentifier;
  v19[2] = @"terms";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v8 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v7 queryParameters:0 appleAccountInformation:v4];

  [v8 setHTTPMethod:@"POST"];
  [v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  [v9 setObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  v10 = [NSNumber numberWithBool:self->_termsAccepted];
  [v9 setObject:v10 forKey:@"termsAccepted"];

  v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
  [v8 setHTTPBody:v11];

  id v12 = [v8 copy];
LABEL_18:

LABEL_19:
  return v12;
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

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (void)setTermsAccepted:(BOOL)a3
{
  self->_termsAccepted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end