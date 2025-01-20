@interface PKAccountWebServiceFundingSourcesResponse
- (NSArray)fundingSources;
- (PKAccountWebServiceFundingSourcesResponse)initWithData:(id)a3;
@end

@implementation PKAccountWebServiceFundingSourcesResponse

- (PKAccountWebServiceFundingSourcesResponse)initWithData:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)PKAccountWebServiceFundingSourcesResponse;
  v3 = [(PKWebServiceResponse *)&v28 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_11:
    v17 = v4;
    goto LABEL_15;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 PKArrayForKey:@"fundingSources"];
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v24 + 1) + 8 * v12);
          v14 = [PKAccountPaymentFundingSource alloc];
          v15 = -[PKAccountPaymentFundingSource initWithDictionary:](v14, "initWithDictionary:", v13, (void)v24);
          [(NSArray *)v7 safelyAddObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    fundingSources = v4->_fundingSources;
    v4->_fundingSources = v7;

    goto LABEL_11;
  }
  v18 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543618;
    v31 = v20;
    __int16 v32 = 2114;
    v33 = v22;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v17 = 0;
LABEL_15:

  return v17;
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void).cxx_destruct
{
}

@end