@interface PKAccountWebServiceFinancingPlanFundingSourceActionRequest
- (NSString)accountIdentifier;
- (NSString)planIdentifier;
- (NSURL)baseURL;
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 rewrapData:(id)a5 appleAccountInformation:(id)a6;
- (unint64_t)intent;
- (void)setAccountIdentifier:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setPlanIdentifier:(id)a3;
@end

@implementation PKAccountWebServiceFinancingPlanFundingSourceActionRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 rewrapData:(id)a5 appleAccountInformation:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  baseURL = self->_baseURL;
  if (!baseURL)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v37 = v20;
    __int16 v38 = 2082;
    v39 = "_baseURL";
LABEL_22:
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_23;
  }
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    v22 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v37 = v20;
    __int16 v38 = 2082;
    v39 = "_accountIdentifier";
    goto LABEL_22;
  }
  planIdentifier = self->_planIdentifier;
  if (!planIdentifier)
  {
    v18 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      __int16 v38 = 2082;
      v39 = "_planIdentifier";
      goto LABEL_22;
    }
LABEL_23:
    id v32 = 0;
    goto LABEL_24;
  }
  v17 = @"payment";
  switch(self->_intent)
  {
    case 0uLL:
      v18 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      __int16 v38 = 2082;
      v39 = "_intent";
      goto LABEL_22;
    case 1uLL:
      break;
    case 2uLL:
      v17 = @"fundingSource";
      break;
    case 3uLL:
      v17 = @"autoPayment";
      break;
    default:
      v18 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      v33 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138543618;
      v37 = v20;
      __int16 v38 = 2082;
      v39 = "endpoint";
      goto LABEL_22;
  }
  v35[0] = @"accounts";
  v35[1] = accountIdentifier;
  v35[2] = @"financingPlans";
  v35[3] = planIdentifier;
  v35[4] = v17;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  v18 = [(PKAccountWebServiceFinancingPlanFundingSourceActionRequest *)self _murlRequestWithServiceURL:baseURL endpointComponents:v24 queryParameters:0 appleAccountInformation:v13];

  [v18 setHTTPMethod:@"POST"];
  [v18 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v12)
  {
    v26 = [v12 platformData];
    v27 = [v26 hexEncoding];
    [v25 setObject:v27 forKey:@"pairedSEP"];

    v28 = [v12 platformDataSignature];
    v29 = [v28 hexEncoding];
    [v25 setObject:v29 forKey:@"pairedSEPSignature"];
  }
  v30 = [(PKPaymentRewrapRequest *)self bodyDictionary];
  [v25 addEntriesFromDictionary:v30];

  if (v25)
  {
    v31 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v25];
    [v18 setHTTPBody:v31];
  }
  id v32 = [v18 copy];

LABEL_24:
  return v32;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  return [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 version:@"1" endpointComponents:a4 queryParameters:a5 appleAccountInformation:a6];
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