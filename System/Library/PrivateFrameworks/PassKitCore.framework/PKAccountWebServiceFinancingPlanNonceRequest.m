@interface PKAccountWebServiceFinancingPlanNonceRequest
- (NSString)accountIdentifier;
- (NSString)planIdentifier;
- (NSURL)baseURL;
- (PKPaymentAugmentBaseRequest)augmentBaseRequest;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAugmentBaseRequest:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setPlanIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceFinancingPlanNonceRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = "_baseURL";
LABEL_16:
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_17;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = "_accountIdentifier";
    goto LABEL_16;
  }
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v16 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    __int16 v22 = 2082;
    v23 = "_planIdentifier";
    goto LABEL_16;
  }
  if (!self->_augmentBaseRequest)
  {
    v9 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      __int16 v22 = 2082;
      v23 = "_augmentBaseRequest";
      goto LABEL_16;
    }
LABEL_17:
    id v12 = 0;
    goto LABEL_18;
  }
  v19[0] = @"accounts";
  v19[1] = accountIdentifier;
  v19[2] = @"financingPlans";
  v19[3] = planIdentifier;
  v19[4] = @"nOnce";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  v9 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v8 queryParameters:0 appleAccountInformation:v4];

  [v9 setHTTPMethod:@"POST"];
  [v9 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v10 = [(PKPaymentAugmentBaseRequest *)self->_augmentBaseRequest bodyDictionary];
  if (v10)
  {
    v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
    [v9 setHTTPBody:v11];
  }
  id v12 = [v9 copy];

LABEL_18:
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

- (PKPaymentAugmentBaseRequest)augmentBaseRequest
{
  return self->_augmentBaseRequest;
}

- (void)setAugmentBaseRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_augmentBaseRequest, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end