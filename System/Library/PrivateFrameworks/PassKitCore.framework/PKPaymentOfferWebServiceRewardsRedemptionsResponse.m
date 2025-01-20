@interface PKPaymentOfferWebServiceRewardsRedemptionsResponse
- (BOOL)moreComing;
- (NSArray)rewardsRedemptions;
- (NSDate)lastUpdated;
- (PKPaymentOfferWebServiceRewardsRedemptionsResponse)initWithData:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setRewardsRedemptions:(id)a3;
@end

@implementation PKPaymentOfferWebServiceRewardsRedemptionsResponse

- (PKPaymentOfferWebServiceRewardsRedemptionsResponse)initWithData:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)PKPaymentOfferWebServiceRewardsRedemptionsResponse;
  v3 = [(PKWebServiceResponse *)&v31 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_19:
    v25 = v4;
    goto LABEL_20;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKArrayContaining:objc_opt_class() forKey:@"rewardsRedemptions"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v14 = [PKPaymentRewardsRedemption alloc];
          v15 = -[PKPaymentRewardsRedemption initWithDictionary:](v14, "initWithDictionary:", v13, (void)v27);
          [v7 safelyAddObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }

    v4->_moreComing = [v5 PKBoolForKey:@"moreComing"];
    uint64_t v16 = [v5 PKDateForKey:@"lastUpdated"];
    lastUpdated = v4->_lastUpdated;
    v4->_lastUpdated = (NSDate *)v16;

    uint64_t v18 = [v7 count];
    if (v18) {
      v19 = (void *)[v7 copy];
    }
    else {
      v19 = 0;
    }
    objc_storeStrong((id *)&v4->_rewardsRedemptions, v19);
    if (v18) {

    }
    goto LABEL_19;
  }
  v20 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138543618;
    v34 = v22;
    __int16 v35 = 2114;
    v36 = v24;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v25 = 0;
LABEL_20:

  return v25;
}

- (NSArray)rewardsRedemptions
{
  return self->_rewardsRedemptions;
}

- (void)setRewardsRedemptions:(id)a3
{
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (void)setMoreComing:(BOOL)a3
{
  self->_moreComing = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_rewardsRedemptions, 0);
}

@end