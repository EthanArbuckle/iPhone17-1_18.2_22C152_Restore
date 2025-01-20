@interface PKPaginatedAccountWebServiceFinancingPlansResponse
- (NSArray)financingPlans;
- (PKAccount)account;
- (PKPaginatedAccountWebServiceFinancingPlansResponse)initWithData:(id)a3;
@end

@implementation PKPaginatedAccountWebServiceFinancingPlansResponse

- (PKPaginatedAccountWebServiceFinancingPlansResponse)initWithData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)PKPaginatedAccountWebServiceFinancingPlansResponse;
  v3 = [(PKPaginatedWebServiceResponse *)&v32 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_15:
    v21 = v4;
    goto LABEL_19;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(PKPaginatedWebServiceResponse *)v4 rawDataList];
    if ([v6 count])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
            v14 = [PKPayLaterFinancingPlan alloc];
            v15 = -[PKPayLaterFinancingPlan initWithDictionary:](v14, "initWithDictionary:", v13, (void)v28);
            [v7 safelyAddObject:v15];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v10);
      }

      uint64_t v16 = [v7 copy];
      financingPlans = v4->_financingPlans;
      v4->_financingPlans = (NSArray *)v16;
    }
    v18 = objc_msgSend(v5, "objectForKey:", @"account", (void)v28);
    if ([v18 count])
    {
      v19 = [[PKAccount alloc] initWithDictionary:v18];
      account = v4->_account;
      v4->_account = v19;
    }
    goto LABEL_15;
  }
  v22 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2114;
    v37 = v26;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (NSArray)financingPlans
{
  return self->_financingPlans;
}

- (PKAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
}

@end