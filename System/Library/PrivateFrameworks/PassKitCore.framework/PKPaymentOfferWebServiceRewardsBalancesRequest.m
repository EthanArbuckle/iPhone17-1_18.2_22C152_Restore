@interface PKPaymentOfferWebServiceRewardsBalancesRequest
- (NSString)criteriaIdentifier;
- (NSString)fpanIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCriteriaIdentifier:(id)a3;
- (void)setFpanIdentifier:(id)a3;
@end

@implementation PKPaymentOfferWebServiceRewardsBalancesRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPaymentOfferWebServiceRewardsBalancesRequest *)self baseURL];
  if (!v5)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "baseURL";
LABEL_14:
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_15;
  }
  if (!self->_fpanIdentifier)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "_fpanIdentifier";
    goto LABEL_14;
  }
  if (!self->_criteriaIdentifier)
  {
    v7 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v14 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "_criteriaIdentifier";
    goto LABEL_14;
  }
  if (v4)
  {
    v17[0] = @"rewards";
    v17[1] = @"balances";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v7 = [(PKPaymentOfferWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v6 queryParameters:0 appleAccountInformation:v4];

    [v7 setHTTPMethod:@"POST"];
    [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:self->_fpanIdentifier forKeyedSubscript:@"fpanIdentifier"];
    [v8 setObject:self->_criteriaIdentifier forKeyedSubscript:@"criteriaIdentifier"];
    v9 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v8];
    [v7 setHTTPBody:v9];

    id v10 = [v7 copy];
    goto LABEL_16;
  }
  v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    v19 = v12;
    __int16 v20 = 2082;
    v21 = "appleAccountInformation";
    goto LABEL_14;
  }
LABEL_15:
  id v10 = 0;
LABEL_16:

  return v10;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
}

- (NSString)criteriaIdentifier
{
  return self->_criteriaIdentifier;
}

- (void)setCriteriaIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end