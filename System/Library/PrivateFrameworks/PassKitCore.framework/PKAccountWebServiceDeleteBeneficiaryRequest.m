@interface PKAccountWebServiceDeleteBeneficiaryRequest
- (NSString)accountIdentifier;
- (NSString)beneficiaryIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBeneficiaryIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceDeleteBeneficiaryRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_baseURL)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "_baseURL";
LABEL_14:
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!v4)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "appleAccountInformation";
    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v8 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v14 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "_accountIdentifier";
    goto LABEL_14;
  }
  beneficiaryIdentifier = self->_beneficiaryIdentifier;
  if (beneficiaryIdentifier)
  {
    v17[0] = @"accounts";
    v17[1] = accountIdentifier;
    v17[2] = @"userInfo";
    v17[3] = @"beneficiaries";
    v17[4] = beneficiaryIdentifier;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
    v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v5];
    [v9 setHTTPMethod:@"DELETE"];
    v10 = (void *)[v9 copy];

    goto LABEL_16;
  }
  v8 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "_beneficiaryIdentifier";
    goto LABEL_14;
  }
LABEL_15:
  v10 = 0;
LABEL_16:

  return v10;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)setBeneficiaryIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end