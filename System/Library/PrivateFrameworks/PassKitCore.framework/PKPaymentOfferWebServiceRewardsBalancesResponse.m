@interface PKPaymentOfferWebServiceRewardsBalancesResponse
- (NSArray)rewardsBalances;
- (PKPaymentOfferWebServiceRewardsBalancesResponse)initWithData:(id)a3;
- (void)setRewardsBalances:(id)a3;
@end

@implementation PKPaymentOfferWebServiceRewardsBalancesResponse

- (PKPaymentOfferWebServiceRewardsBalancesResponse)initWithData:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentOfferWebServiceRewardsBalancesResponse;
  v3 = [(PKWebServiceResponse *)&v29 initWithData:a3];
  p_isa = (id *)&v3->super.super.super.super.isa;
  if (!v3)
  {
LABEL_19:
    v23 = p_isa;
    goto LABEL_20;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKArrayContaining:objc_opt_class() forKey:@"rewardsBalances"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v14 = [PKPaymentRewardsBalance alloc];
          v15 = -[PKPaymentRewardsBalance initWithDictionary:](v14, "initWithDictionary:", v13, (void)v25);
          [v7 safelyAddObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }

    uint64_t v16 = [v7 count];
    if (v16) {
      v17 = (void *)[v7 copy];
    }
    else {
      v17 = 0;
    }
    objc_storeStrong(p_isa + 4, v17);
    if (v16) {

    }
    goto LABEL_19;
  }
  v18 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v32 = v20;
    __int16 v33 = 2114;
    v34 = v22;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v23 = 0;
LABEL_20:

  return v23;
}

- (NSArray)rewardsBalances
{
  return self->_rewardsBalances;
}

- (void)setRewardsBalances:(id)a3
{
}

- (void).cxx_destruct
{
}

@end