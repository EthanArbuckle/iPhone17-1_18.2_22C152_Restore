@interface PKAccountWebServicePayLaterFinancingPlanCancellationRequest
- (NSString)accountIdentifier;
- (NSString)cancellationReasonDescription;
- (NSString)cancellationReasonIdentifier;
- (NSString)planIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCancellationReasonDescription:(id)a3;
- (void)setCancellationReasonIdentifier:(id)a3;
- (void)setPlanIdentifier:(id)a3;
@end

@implementation PKAccountWebServicePayLaterFinancingPlanCancellationRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    __int16 v21 = 2082;
    v22 = "_baseURL";
LABEL_11:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_12;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
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
  planIdentifier = self->_planIdentifier;
  if (planIdentifier)
  {
    v18[0] = @"accounts";
    v18[1] = accountIdentifier;
    v18[2] = @"financingPlans";
    v18[3] = planIdentifier;
    v18[4] = @"cancel";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
    v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v4];

    [v9 setHTTPMethod:@"POST"];
    [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 safelySetObject:self->_cancellationReasonIdentifier forKey:@"cancellationReasonIdentifier"];
    [v10 safelySetObject:self->_cancellationReasonDescription forKey:@"cancellationReasonDescription"];
    v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v11];

    id v12 = [v9 copy];
    goto LABEL_13;
  }
  v9 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
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
  id v12 = 0;
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

- (NSString)cancellationReasonIdentifier
{
  return self->_cancellationReasonIdentifier;
}

- (void)setCancellationReasonIdentifier:(id)a3
{
}

- (NSString)cancellationReasonDescription
{
  return self->_cancellationReasonDescription;
}

- (void)setCancellationReasonDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationReasonDescription, 0);
  objc_storeStrong((id *)&self->_cancellationReasonIdentifier, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end