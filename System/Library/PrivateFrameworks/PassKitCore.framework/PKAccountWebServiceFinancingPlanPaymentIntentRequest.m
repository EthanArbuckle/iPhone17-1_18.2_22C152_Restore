@interface PKAccountWebServiceFinancingPlanPaymentIntentRequest
- (NSString)accountIdentifier;
- (NSString)planIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (unint64_t)intent;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setPlanIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceFinancingPlanPaymentIntentRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_baseURL)
  {
    v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  if (!self->_accountIdentifier)
  {
    v5 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "_accountIdentifier";
    goto LABEL_11;
  }
  if (self->_planIdentifier)
  {
    v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v6 = PKFinancingPlanPaymentIntentTypeToString(self->_intent);
    [v5 setObject:v6 forKey:@"intent"];

    baseURL = self->_baseURL;
    accountIdentifier = self->_accountIdentifier;
    v18[0] = @"accounts";
    v18[1] = accountIdentifier;
    planIdentifier = self->_planIdentifier;
    v18[2] = @"financingPlans";
    v18[3] = planIdentifier;
    v18[4] = @"paymentIntent";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    v11 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v10 queryParameters:v5 appleAccountInformation:v4];

    [v11 setHTTPMethod:@"GET"];
    [v11 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v12 = (void *)[v11 copy];

    goto LABEL_13;
  }
  v5 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "_planIdentifier";
    goto LABEL_11;
  }
LABEL_12:
  v12 = 0;
LABEL_13:

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

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end