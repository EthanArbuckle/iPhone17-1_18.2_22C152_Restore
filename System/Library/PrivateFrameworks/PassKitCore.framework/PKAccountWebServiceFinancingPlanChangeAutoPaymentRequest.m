@interface PKAccountWebServiceFinancingPlanChangeAutoPaymentRequest
- (BOOL)autoPayment;
- (NSString)accountIdentifier;
- (NSString)planIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAutoPayment:(BOOL)a3;
- (void)setBaseURL:(id)a3;
- (void)setPlanIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceFinancingPlanChangeAutoPaymentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    __int16 v22 = 2082;
    v23 = "_baseURL";
LABEL_13:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_14;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    __int16 v22 = 2082;
    v23 = "_accountIdentifier";
    goto LABEL_13;
  }
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      __int16 v22 = 2082;
      v23 = "_planIdentifier";
      goto LABEL_13;
    }
LABEL_14:
    id v13 = 0;
    goto LABEL_15;
  }
  v19[0] = @"accounts";
  v19[1] = accountIdentifier;
  v19[2] = @"financingPlans";
  v19[3] = planIdentifier;
  v19[4] = @"autoPayment";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v4];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = [NSNumber numberWithBool:self->_autoPayment];
  [v10 setObject:v11 forKeyedSubscript:@"autoPayment"];

  if (v10)
  {
    v12 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v12];
  }
  id v13 = [v9 copy];

LABEL_15:
  return v13;
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

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
}

- (BOOL)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(BOOL)a3
{
  self->_autoPayment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end