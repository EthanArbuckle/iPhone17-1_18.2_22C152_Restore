@interface PKAccountWebServiceFinancingPlansPaginatedRequest
- (NSString)accountIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
@end

@implementation PKAccountWebServiceFinancingPlansPaginatedRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_baseURL)
  {
    v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2082;
      v24 = "_baseURL";
LABEL_12:
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);
    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if (!self->_accountIdentifier)
  {
    v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2082;
      v24 = "_accountIdentifier";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = [(PKPaymentWebServicePaginatedRequest *)self lastUpdated];
  v7 = [(PKPaymentWebServicePaginatedRequest *)self limit];
  if (v6)
  {
    v8 = NSNumber;
    [v6 timeIntervalSince1970];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    v10 = [v9 stringValue];
    [v5 setObject:v10 forKey:@"lastUpdated"];
  }
  if (v7)
  {
    v11 = [v7 stringValue];
    [v5 setObject:v11 forKey:@"limit"];
  }
  accountIdentifier = self->_accountIdentifier;
  v20[0] = @"accounts";
  v20[1] = accountIdentifier;
  v20[2] = @"financingPlans";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v14 = [(PKAccountWebServicePaginatedRequest *)self _murlRequestWithServiceURL:self->_baseURL endpointComponents:v13 queryParameters:v5 appleAccountInformation:v4];
  [v14 setHTTPMethod:@"GET"];
  [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v15 = (void *)[v14 copy];

LABEL_14:
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end