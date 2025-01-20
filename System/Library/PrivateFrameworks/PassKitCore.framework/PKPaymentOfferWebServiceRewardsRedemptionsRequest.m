@interface PKPaymentOfferWebServiceRewardsRedemptionsRequest
- (NSDate)lastUpdated;
- (NSNumber)limit;
- (NSString)criteriaIdentifier;
- (NSString)fpanIdentifier;
- (NSURL)baseURL;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCriteriaIdentifier:(id)a3;
- (void)setFpanIdentifier:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setLimit:(id)a3;
@end

@implementation PKPaymentOfferWebServiceRewardsRedemptionsRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPaymentOfferWebServiceRewardsRedemptionsRequest *)self baseURL];
  if (!v5)
  {
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    __int16 v28 = 2082;
    v29 = "baseURL";
LABEL_18:
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_19;
  }
  if (!self->_fpanIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    __int16 v28 = 2082;
    v29 = "_fpanIdentifier";
    goto LABEL_18;
  }
  if (!self->_criteriaIdentifier)
  {
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    v22 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v27 = v20;
    __int16 v28 = 2082;
    v29 = "_criteriaIdentifier";
    goto LABEL_18;
  }
  if (!v4)
  {
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      __int16 v28 = 2082;
      v29 = "appleAccountInformation";
      goto LABEL_18;
    }
LABEL_19:
    v18 = 0;
    goto LABEL_20;
  }
  v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    v8 = NSNumber;
    [(NSDate *)lastUpdated timeIntervalSince1970];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    v10 = [v9 stringValue];
    [v6 setObject:v10 forKey:@"lastUpdated"];
  }
  limit = self->_limit;
  if (limit)
  {
    v12 = [(NSNumber *)limit stringValue];
    [v6 setObject:v12 forKey:@"limit"];
  }
  v25[0] = @"rewards";
  v25[1] = @"redemptions";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v14 = [v6 copy];
  v15 = [(PKPaymentOfferWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v13 queryParameters:v14 appleAccountInformation:v4];

  [v15 setHTTPMethod:@"POST"];
  [v15 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:self->_fpanIdentifier forKeyedSubscript:@"fpanIdentifier"];
  [v16 setObject:self->_criteriaIdentifier forKeyedSubscript:@"criteriaIdentifier"];
  v17 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v16];
  [v15 setHTTPBody:v17];

  v18 = (void *)[v15 copy];
LABEL_20:

  return v18;
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

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_criteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end